package step08;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

/*
 * 날짜 : 2022/10/13
 * 이름 : 김동근
 * 내용 : 백준 난이도8 3번 문제
 */
public class _03 {
	
	

	public static void main(String[] args) throws IOException {

		//변수 선언
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int n = Integer.parseInt(br.readLine());			//입력받은 수
		br.close();
		
		
		
		//제곱근으로 소수 범위 구하기가 문제 있음, 4649 반례
		int length = (int) Math.ceil(Math.sqrt(10000000));	
		
		List<Integer> listPrime = new ArrayList<Integer>();	//소수 리스트
		for(int i=2 ; i<=length ; i++) {
			if(isPrime(i)) listPrime.add(i);
		}
		
		List<Integer> listAnswer = new ArrayList<Integer>();//출력할 소수 리스트
		
		//내용
		int k = n;
		boolean end = false;
		while(!end) {
			end = true;
			for(int prime : listPrime) {
				if(k%prime==0) {
					listAnswer.add(prime);
					k /= prime;
					end = false;
					break;
				}
			}
			if(k>1 && end)
				listAnswer.add(k); // ☆만약 제곱근한 범위까지의 소수로 나누어지지 않으면 마지막은 약수 판정
		}
		
		for(int i : listAnswer) {
			System.out.println(i);
		}
		
		br.close();
	} //main-end

	public static boolean isPrime(int num){
        if(num < 2) return false;
        for(int i=2; i*i<=num; i++){
            if(num % i == 0) return false;            
        }
        return true;
    }
	
}
