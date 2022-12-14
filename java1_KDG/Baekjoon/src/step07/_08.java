package step07;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

/*
 * 날짜 : 2022/10/05
 * 이름 : 김동근
 * 내용 : 백준 난이도7 1번 문제
 */
public class _08 {

	public static void main(String[] args) throws IOException {

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringTokenizer st = new StringTokenizer(br.readLine());
		br.close();
		
		char[] num1 = st.nextToken().toCharArray();
		char[] num2 = st.nextToken().toCharArray();
		int length = num1.length > num2.length ? num1.length : num2.length;
		char[][] answer = new char[2][length+1];
		
		for(char[] a : answer) {
			Arrays.fill(a, '0');
		}
		
		
		//집어넣기
		for(int i=length ; i>0 ; i--) {
			if(num1.length - length + i -1 >= 0) {
				answer[0][i] = num1[num1.length - length + i -1];
			}
			if(num2.length - length + i -1 >= 0) {
				answer[1][i] = num2[num2.length - length + i -1];
			}
			
		}
		
		//계산
		for(int i=length ; i>0 ; i--) {			//뒤부터 계산
			answer[0][i] = (char) (answer[0][i] + answer[1][i] - 48);	//같은 자릿수 더하기
			if(answer[0][i] > '9') {			//10 넘어갔으면
				if(answer[0][i-1] >= '0')		//앞자리 숫자인지 체크 후
					answer[0][i-1] += 1;			
				else
					answer[0][i-1] += '1';		//'1' 또는 1 추가
				answer[0][i] -= 10;
			}
		}
		
		boolean isFirst = false;
		
		//출력
		for(int i=0 ; i<=length ; i++) {
			
			if(answer[0][i] != '0') 
				isFirst = true;
			if(isFirst)
				System.out.printf("%c", answer[0][i]);
		}
	} //main-end

}
