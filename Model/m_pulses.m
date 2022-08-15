function m_pulses=m_pulses(t,signals)

m=size(signals,2);

start=signals(1,:);

width=signals(2,:);

height=signals(3,:);

m_pulses=zeros(size(t));

for i=1:m
    
    m_pulses(and(t>=start(i),t<(start(i)+width(i))))=height(i);
    
end

% n_pulses=temp;


% if and(t>=start_1,t<(start_1+width_1))
%     two_pulses=height_1;
% elseif and(t>=start_2,t<(start_2+width_2))
%     two_pulses=height_2;
% else
%     two_pulses=0;
% end







