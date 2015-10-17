FROM java:7
VOLUME /var/subsonic /var/music /var/playlists
COPY subsonic-5.2.1.deb /
COPY startup.sh /
RUN chmod 700 /startup.sh
RUN dpkg -i subsonic-5.2.1.deb
COPY subsonic_default /etc/default/subsonic
CMD /startup.sh
EXPOSE 80
