
%
%
% <html>
% <table border="0" width="600px" id="table1">	<tr>		<td><b><font size="2">�ð�������������</font></b></td>	</tr>	<tr>		<td><span class="comment"><font size="2">1�����˳���פ���ڴ�<a target="_blank" href="http://www.ilovematlab.cn/forum-158-1.html"><font color="#0000FF">���</font></a>���<a target="_blank" href="http://www.ilovematlab.cn/thread-48362-1-1.html"><font color="#0000FF">�ð���</font></a>���ʣ��������ʱش�</font></span></td></tr><tr>	<td><span class="comment"><font size="2">2���˰��������׵Ľ�ѧ��Ƶ�����׵�����������Matlab����</font></span></td>	</tr>	<tr>		<td><span class="comment"><font size="2">		3����������Ϊ�ð����Ĳ������ݣ�Լռ�ð����������ݵ�1/10����</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		4���˰���Ϊԭ��������ת����ע��������<a target="_blank" href="http://www.ilovematlab.cn/">Matlab������̳</a>��<a target="_blank" href="http://www.ilovematlab.cn/forum-158-1.html">��Matlab������30������������</a>����</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		5�����˰��������������о��й��������ǻ�ӭ���������Ҫ��ȣ����ǿ��Ǻ���Լ��ڰ����</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		6������������������Ϊ���壬�鼮��ʵ�����ݿ�����������룬���鼮ʵ�ʷ�������Ϊ׼��</font></span></td>	</tr><tr>		<td><span class="comment"><font size="2">		7�����������������⡢Ԥ����ʽ�ȣ�<a target="_blank" href="http://www.ilovematlab.cn/thread-47939-1-1.html">��������</a>��</font></span></td>	</tr></table>
% </html>
%
%% ���³���Ϊ������չ���GRNN��BP�Ƚ� ��Ҫload chapter8.1���������
clear all
load best
n=13
p=desired_input
t=desired_output
net_bp=newff(minmax(p),[n,3],{'tansig','purelin'},'trainlm');
% ѵ������
net.trainParam.show=50;
net.trainParam.epochs=2000;
net.trainParam.goal=1e-3;
%����TRAINLM�㷨ѵ��BP����
net_bp=train(net_bp,p,t);
bp_prediction_result=sim(net_bp,p_test);
bp_prediction_result=postmnmx(bp_prediction_result,mint,maxt);
bp_error=t_test-bp_prediction_result';
disp(['BP��������������Ԥ������Ϊ',num2str(abs(bp_error))])
%{
net=newff(desired_input,desired_output,desired_number,{'tansig','tansig'},'trainlm');
net.trainParam.epochs=10000;
net.trainParam.lr=0.001;
net.trainParam.goal=0.0001;
%% BP����ѵ��
net=train(net,desired_input,desired_output);
%% BP�������
input_test=input_test';
input_test=tramnmx(input_test,minp,maxp);
BP_test_result=sim(net,input_test);
BP_test_result=postmnmx(BP_test_result,mint,maxt);
BP_error=output_test-BP_test_result';
disp(['BP��������������Ԥ������Ϊ',num2str(abs(BP_error))])
save best desired_input desired_output input_test output_test BP_error mint maxt
%% BP����Ԥ��
%Ԥ�����ݹ�һ��
%input_predict=input_predict';
%input_predict=tramnmx(input_predict,minp,maxp);

%����Ԥ�����
%BP_predict_resultpredict=sim(net,input_predict);

%�����������һ��
%BP_predict_resultpredict=postmnmx(BP_predict_resultpredict,mint,maxt);
%}



