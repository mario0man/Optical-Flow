% Generate sample frames
for i = 1:5400
    frames{i} = gvid(:,:,i);
end

% Write sample frames to disk
v = VideoWriter('c:/users/yls/desktop/opticalflow/test2.avi');
v.open;
for i = 1:5400
    v.writeVideo(frames{i});
end
v.close;

