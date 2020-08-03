desc "start emacs instance "
task :instance  do
  sh %w(
    docker run
    -u $(id -u):$(id -g)
    -v $HOME:$HOME
    -w /data/
    -e HOME=/data/
    --net host
    --volumes-from emacs.d-volume
    --cpuset-cpus 0
    --memory 512mb
    -v /tmp/.X11-unix:/tmp/.X11-unix
    -e DISPLAY=unix$DISPLAY
    -v /dev/shm:/dev/shm
    --name emacs
    jiahut/docker-emacs
  ).join(' ')
end

task :default do
  sh "rake --tasks"
end


desc "build emacs image "
task :build_emacs do
  sh "docker build . --network host -f Dockerfile -t jiahut/docker-emacs"
end


desc "build emacs image from git"
task :build_emacs_git do
  sh "docker build . --network host -f Dockerfile.git -t jiahut/docker-emacs:git"
end

desc "build emacs.d-volume image "
task :build_volume do
  sh "docker build . --network host -f Dockerfile.volume -t jiahut/emacs.d-volume"
end

desc "start emacs.d-volume instance "
task :start_volume do
   sh "docker run -d -v /data/ --name emacs.d-volume jiahut/emacs.d-volume sh -c 'chown -R $(id -u):$(id -g) /data/'"
end

desc "remove emacs.d-volume instance "
task :remove_volume do
  sh "docker rm emacs.d-volume"
end

desc "start emacs instance "
task :start do
  sh "docker start emacs"
end

desc "stop emacs instance "
task :stop do
  sh "docker stop emacs"
end

desc "remove emacs instance "
task :remove do
  sh "docker rm emacs"
end
