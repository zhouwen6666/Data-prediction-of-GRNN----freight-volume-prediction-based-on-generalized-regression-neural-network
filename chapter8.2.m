
%
%
% <html>
% <table border="0" width="600px" id="table1">	<tr>		<td><b><font size="2">该案例作者申明：</font></b></td>	</tr>	<tr>		<td><span class="comment"><font size="2">1：本人长期驻扎在此<a target="_blank" href="http://www.ilovematlab.cn/forum-158-1.html"><font color="#0000FF">板块</font></a>里，对<a target="_blank" href="http://www.ilovematlab.cn/thread-48362-1-1.html"><font color="#0000FF">该案例</font></a>提问，做到有问必答。</font></span></td></tr><tr>	<td><span class="comment"><font size="2">2：此案例有配套的教学视频，配套的完整可运行Matlab程序。</font></span></td>	</tr>	<tr>		<td><span class="comment"><font size="2">		3：以下内容为该案例的部分内容（约占该案例完整内容的1/10）。</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		4：此案例为原创案例，转载请注明出处（<a target="_blank" href="http://www.ilovematlab.cn/">Matlab中文论坛</a>，<a target="_blank" href="http://www.ilovematlab.cn/forum-158-1.html">《Matlab神经网络30个案例分析》</a>）。</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		5：若此案例碰巧与您的研究有关联，我们欢迎您提意见，要求等，我们考虑后可以加在案例里。</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		6：您看到的以下内容为初稿，书籍的实际内容可能有少许出入，以书籍实际发行内容为准。</font></span></td>	</tr><tr>		<td><span class="comment"><font size="2">		7：此书其他常见问题、预定方式等，<a target="_blank" href="http://www.ilovematlab.cn/thread-47939-1-1.html">请点击这里</a>。</font></span></td>	</tr></table>
% </html>
%
%% 以下程序为案例扩展里的GRNN和BP比较 需要load chapter8.1的相关数据
clear all
load best
n=13
p=desired_input
t=desired_output
net_bp=newff(minmax(p),[n,3],{'tansig','purelin'},'trainlm');
% 训练网络
net.trainParam.show=50;
net.trainParam.epochs=2000;
net.trainParam.goal=1e-3;
%调用TRAINLM算法训练BP网络
net_bp=train(net_bp,p,t);
bp_prediction_result=sim(net_bp,p_test);
bp_prediction_result=postmnmx(bp_prediction_result,mint,maxt);
bp_error=t_test-bp_prediction_result';
disp(['BP神经网络三项流量预测的误差为',num2str(abs(bp_error))])
%{
net=newff(desired_input,desired_output,desired_number,{'tansig','tansig'},'trainlm');
net.trainParam.epochs=10000;
net.trainParam.lr=0.001;
net.trainParam.goal=0.0001;
%% BP网络训练
net=train(net,desired_input,desired_output);
%% BP网络测试
input_test=input_test';
input_test=tramnmx(input_test,minp,maxp);
BP_test_result=sim(net,input_test);
BP_test_result=postmnmx(BP_test_result,mint,maxt);
BP_error=output_test-BP_test_result';
disp(['BP神经网络三项流量预测的误差为',num2str(abs(BP_error))])
save best desired_input desired_output input_test output_test BP_error mint maxt
%% BP网络预测
%预测数据归一化
%input_predict=input_predict';
%input_predict=tramnmx(input_predict,minp,maxp);

%网络预测输出
%BP_predict_resultpredict=sim(net,input_predict);

%网络输出反归一化
%BP_predict_resultpredict=postmnmx(BP_predict_resultpredict,mint,maxt);
%}



