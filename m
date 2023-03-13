Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp169740ejb;
        Mon, 13 Mar 2023 04:44:44 -0700 (PDT)
X-Google-Smtp-Source: AK7set+DpN2PYqEtoBR2yVjGRNjHxSSNecQERePKs8yXt3uvJA8YfhEUOJcVQ8lclivgnFTSsn33
X-Received: by 2002:a05:622a:5c9:b0:3bf:cae4:296c with SMTP id d9-20020a05622a05c900b003bfcae4296cmr48353775qtb.65.1678707884788;
        Mon, 13 Mar 2023 04:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707884; cv=none;
        d=google.com; s=arc-20160816;
        b=sTrtw3rXKev6ZTobfEGqAKEw+Qc2o9oDwvbauhc22xtWdQYrduYKSqXj5SkPYMy2rX
         e3gMFwOgmMR3h+SaSmwalP97NQR2jTfNIne+55uWWUOTFyBl+iofO5UCDTz8xvN+ErR8
         z+VrO2Kg75kX/7K+dg8zTknWPdiHhjrl0AEvEBNTItxlt2it0wmgWLFomq3/n+0hwUP9
         JWdPdUl2fFh6sl83C6UZ/liXLpIvnYnFVRPEq0SgNoGyW0uqisL1Br5paHpFhQaSx3LV
         8AVma5MKp/mgwmSwzoAiSHnD8GMhrk8Ae6sM70HYUUB/jt1PkC5k13frsNyucSjO6KeI
         j23Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IIHMFHf7yvNDoDdFDBhYEJDi8B9hDrj0sqEIPxzTGGI=;
        b=onP5yUaJOicYzomj/BlXHJvt9KPXqW/z0/5LcRnkewy+oj8pfm1mWqs4+Rw59eBKCe
         kEKZT2nQiSQkeIr+QrT27a5csvRhP18nJGuA0ZwVeS8aw55+de54HNwoJhkoxe0KrnjQ
         RoFu0ixjm9HhR5nIb5ADkrjONjB4RRYUylloOUUR+I4IFPoFW68Y93cecyJmlW6Tybyd
         t+dqaGKogMgsh3QHNqBxA6cJwEsCgQ7Ub2d8dxfMevx559At5Ayaagg4iVGyLy4Ns4aJ
         Z9PE7EPvKUKAaut43sB8psBjO2LBKT4Ms71G9c6sUuddbB9WZOM9wKp556QWvr4XDZa4
         gH+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ap3c1zo1;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id v11-20020a05620a0f0b00b0072bada6129bsi5336903qkl.625.2023.03.13.04.44.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:44:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ap3c1zo1;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IIHMFHf7yvNDoDdFDBhYEJDi8B9hDrj0sqEIPxzTGGI=;
	b=ap3c1zo13M8Yn6sjWKNsgjPGMP0T+ZxaNTxGMnJgWWBImSECyY2i35/N+BmNstb6dYTU3A
	JhN/220Rd7JVpdGhQ96DbG+nvaKRwNYdkASsWldwhAZWvGhcAqceLgMNoTIzoxwwwVo8lb
	jQ/9JwAg0AwVeuulUUjUWtuIRek04jU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-BaspyYpfPi6CelcCkdKbMA-1; Mon, 13 Mar 2023 07:44:41 -0400
X-MC-Unique: BaspyYpfPi6CelcCkdKbMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65F8D800D8E;
	Mon, 13 Mar 2023 11:44:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B9060C164E7;
	Mon, 13 Mar 2023 11:44:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	Hanna Reitz <hreitz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PULL 13/25] win32: avoid mixing SOCKET and file descriptor space
Date: Mon, 13 Mar 2023 15:43:23 +0400
Message-Id: <20230313114335.424093-14-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-TUID: QFTBHSLP7aff

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Until now, a win32 SOCKET handle is often cast to an int file
descriptor, as this is what other OS use for sockets. When necessary,
QEMU eventually queries whether it's a socket with the help of
fd_is_socket(). However, there is no guarantee of conflict between the
fd and SOCKET space. Such conflict would have surprising consequences,
we shouldn't mix them.

Also, it is often forgotten that SOCKET must be closed with
closesocket(), and not close().

Instead, let's make the win32 socket wrapper functions return and take a
file descriptor, and let util/ wrappers do the fd/SOCKET conversion as
necessary. A bit of adaptation is necessary in io/ as well.

Unfortunately, we can't drop closesocket() usage, despite
_open_osfhandle() documentation claiming transfer of ownership, testing
shows bad behaviour if you forget to call closesocket().

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20230221124802.4103554-15-marcandre.lureau@redhat.com>
---
 include/sysemu/os-win32.h |   4 +-
 io/channel-watch.c        |   6 +-
 util/aio-win32.c          |   9 +-
 util/oslib-win32.c        | 219 ++++++++++++++++++++++++++++++++------
 4 files changed, 197 insertions(+), 41 deletions(-)

diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 504a8966c3..cb1dcce618 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -166,10 +166,10 @@ static inline void qemu_funlockfile(FILE *f)
 }
 
 /* Helper for WSAEventSelect, to report errors */
-bool qemu_socket_select(SOCKET s, WSAEVENT hEventObject,
+bool qemu_socket_select(int sockfd, WSAEVENT hEventObject,
                         long lNetworkEvents, Error **errp);
 
-bool qemu_socket_unselect(SOCKET s, Error **errp);
+bool qemu_socket_unselect(int sockfd, Error **errp);
 
 /* We wrap all the sockets functions so that we can
  * set errno based on WSAGetLastError()
diff --git a/io/channel-watch.c b/io/channel-watch.c
index 6ac41009fa..64b486e378 100644
--- a/io/channel-watch.c
+++ b/io/channel-watch.c
@@ -275,13 +275,13 @@ GSource *qio_channel_create_fd_watch(QIOChannel *ioc,
 
 #ifdef CONFIG_WIN32
 GSource *qio_channel_create_socket_watch(QIOChannel *ioc,
-                                         int socket,
+                                         int sockfd,
                                          GIOCondition condition)
 {
     GSource *source;
     QIOChannelSocketSource *ssource;
 
-    qemu_socket_select(socket, ioc->event,
+    qemu_socket_select(sockfd, ioc->event,
                        FD_READ | FD_ACCEPT | FD_CLOSE |
                        FD_CONNECT | FD_WRITE | FD_OOB, NULL);
 
@@ -293,7 +293,7 @@ GSource *qio_channel_create_socket_watch(QIOChannel *ioc,
     object_ref(OBJECT(ioc));
 
     ssource->condition = condition;
-    ssource->socket = socket;
+    ssource->socket = _get_osfhandle(sockfd);
     ssource->revents = 0;
 
     ssource->fd.fd = (gintptr)ioc->event;
diff --git a/util/aio-win32.c b/util/aio-win32.c
index 08e8f5615d..6bded009a4 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -73,15 +73,18 @@ void aio_set_fd_handler(AioContext *ctx,
 {
     AioHandler *old_node;
     AioHandler *node = NULL;
+    SOCKET s;
 
     if (!fd_is_socket(fd)) {
         error_report("fd=%d is not a socket, AIO implementation is missing", fd);
         return;
     }
 
+    s = _get_osfhandle(fd);
+
     qemu_lockcnt_lock(&ctx->list_lock);
     QLIST_FOREACH(old_node, &ctx->aio_handlers, node) {
-        if (old_node->pfd.fd == fd && !old_node->deleted) {
+        if (old_node->pfd.fd == s && !old_node->deleted) {
             break;
         }
     }
@@ -92,7 +95,7 @@ void aio_set_fd_handler(AioContext *ctx,
 
         /* Alloc and insert if it's not already there */
         node = g_new0(AioHandler, 1);
-        node->pfd.fd = fd;
+        node->pfd.fd = s;
 
         node->pfd.events = 0;
         if (node->io_read) {
@@ -120,7 +123,7 @@ void aio_set_fd_handler(AioContext *ctx,
 
         QLIST_INSERT_HEAD_RCU(&ctx->aio_handlers, node, node);
         event = event_notifier_get_handle(&ctx->notifier);
-        qemu_socket_select(node->pfd.fd, event, bitmask, NULL);
+        qemu_socket_select(fd, event, bitmask, NULL);
     }
     if (old_node) {
         aio_remove_fd_handler(ctx, old_node);
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index dbd32acc98..7836fb0be3 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -283,13 +283,20 @@ char *qemu_get_pid_name(pid_t pid)
 }
 
 
-bool qemu_socket_select(SOCKET s, WSAEVENT hEventObject,
+bool qemu_socket_select(int sockfd, WSAEVENT hEventObject,
                         long lNetworkEvents, Error **errp)
 {
+    SOCKET s = _get_osfhandle(sockfd);
+
     if (errp == NULL) {
         errp = &error_warn;
     }
 
+    if (s == INVALID_SOCKET) {
+        error_setg(errp, "invalid socket fd=%d", sockfd);
+        return false;
+    }
+
     if (WSAEventSelect(s, hEventObject, lNetworkEvents) != 0) {
         error_setg_win32(errp, WSAGetLastError(), "failed to WSAEventSelect()");
         return false;
@@ -298,9 +305,9 @@ bool qemu_socket_select(SOCKET s, WSAEVENT hEventObject,
     return true;
 }
 
-bool qemu_socket_unselect(SOCKET s, Error **errp)
+bool qemu_socket_unselect(int sockfd, Error **errp)
 {
-    return qemu_socket_select(s, NULL, 0, errp);
+    return qemu_socket_select(sockfd, NULL, 0, errp);
 }
 
 #undef connect
@@ -308,7 +315,13 @@ int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
                       socklen_t addrlen)
 {
     int ret;
-    ret = connect(sockfd, addr, addrlen);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == INVALID_SOCKET) {
+        return -1;
+    }
+
+    ret = connect(s, addr, addrlen);
     if (ret < 0) {
         if (WSAGetLastError() == WSAEWOULDBLOCK) {
             errno = EINPROGRESS;
@@ -324,7 +337,13 @@ int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
 int qemu_listen_wrap(int sockfd, int backlog)
 {
     int ret;
-    ret = listen(sockfd, backlog);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == INVALID_SOCKET) {
+        return -1;
+    }
+
+    ret = listen(s, backlog);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -337,7 +356,13 @@ int qemu_bind_wrap(int sockfd, const struct sockaddr *addr,
                    socklen_t addrlen)
 {
     int ret;
-    ret = bind(sockfd, addr, addrlen);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == INVALID_SOCKET) {
+        return -1;
+    }
+
+    ret = bind(s, addr, addrlen);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -345,28 +370,108 @@ int qemu_bind_wrap(int sockfd, const struct sockaddr *addr,
 }
 
 
-#undef socket
-int qemu_socket_wrap(int domain, int type, int protocol)
+#undef closesocket
+int qemu_closesocket_wrap(int fd)
 {
     int ret;
-    ret = socket(domain, type, protocol);
+    DWORD flags = 0;
+    SOCKET s = _get_osfhandle(fd);
+
+    if (s == INVALID_SOCKET) {
+        return -1;
+    }
+
+    /*
+     * If we were to just call _close on the descriptor, it would close the
+     * HANDLE, but it wouldn't free any of the resources associated to the
+     * SOCKET, and we can't call _close after calling closesocket, because
+     * closesocket has already closed the HANDLE, and _close would attempt to
+     * close the HANDLE again, resulting in a double free. We can however
+     * protect the HANDLE from actually being closed long enough to close the
+     * file descriptor, then close the socket itself.
+     */
+    if (!GetHandleInformation((HANDLE)s, &flags)) {
+        errno = EACCES;
+        return -1;
+    }
+
+    if (!SetHandleInformation((HANDLE)s, HANDLE_FLAG_PROTECT_FROM_CLOSE, HANDLE_FLAG_PROTECT_FROM_CLOSE)) {
+        errno = EACCES;
+        return -1;
+    }
+
+    ret = close(fd);
+
+    if (!SetHandleInformation((HANDLE)s, flags, flags)) {
+        errno = EACCES;
+        return -1;
+    }
+
+    /*
+     * close() returns EBADF since we PROTECT_FROM_CLOSE the underlying handle,
+     * but the FD is actually freed
+     */
+    if (ret < 0 && errno != EBADF) {
+        return ret;
+    }
+
+    ret = closesocket(s);
     if (ret < 0) {
         errno = socket_error();
     }
+
     return ret;
 }
 
 
+#undef socket
+int qemu_socket_wrap(int domain, int type, int protocol)
+{
+    SOCKET s;
+    int fd;
+
+    s = socket(domain, type, protocol);
+    if (s == -1) {
+        errno = socket_error();
+        return -1;
+    }
+
+    fd = _open_osfhandle(s, _O_BINARY);
+    if (fd < 0) {
+        closesocket(s);
+        /* _open_osfhandle may not set errno, and closesocket() may override it */
+        errno = ENOMEM;
+    }
+
+    return fd;
+}
+
+
 #undef accept
 int qemu_accept_wrap(int sockfd, struct sockaddr *addr,
                      socklen_t *addrlen)
 {
-    int ret;
-    ret = accept(sockfd, addr, addrlen);
-    if (ret < 0) {
+    int fd;
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == INVALID_SOCKET) {
+        return -1;
+    }
+
+    s = accept(s, addr, addrlen);
+    if (s == -1) {
         errno = socket_error();
+        return -1;
     }
-    return ret;
+
+    fd = _open_osfhandle(s, _O_BINARY);
+    if (fd < 0) {
+        closesocket(s);
+        /* _open_osfhandle may not set errno, and closesocket() may override it */
+        errno = ENOMEM;
+    }
+
+    return fd;
 }
 
 
@@ -374,7 +479,13 @@ int qemu_accept_wrap(int sockfd, struct sockaddr *addr,
 int qemu_shutdown_wrap(int sockfd, int how)
 {
     int ret;
-    ret = shutdown(sockfd, how);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == INVALID_SOCKET) {
+        return -1;
+    }
+
+    ret = shutdown(s, how);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -386,19 +497,13 @@ int qemu_shutdown_wrap(int sockfd, int how)
 int qemu_ioctlsocket_wrap(int fd, int req, void *val)
 {
     int ret;
-    ret = ioctlsocket(fd, req, val);
-    if (ret < 0) {
-        errno = socket_error();
-    }
-    return ret;
-}
+    SOCKET s = _get_osfhandle(fd);
 
+    if (s == INVALID_SOCKET) {
+        return -1;
+    }
 
-#undef closesocket
-int qemu_closesocket_wrap(int fd)
-{
-    int ret;
-    ret = closesocket(fd);
+    ret = ioctlsocket(s, req, val);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -411,7 +516,13 @@ int qemu_getsockopt_wrap(int sockfd, int level, int optname,
                          void *optval, socklen_t *optlen)
 {
     int ret;
-    ret = getsockopt(sockfd, level, optname, optval, optlen);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == INVALID_SOCKET) {
+        return -1;
+    }
+
+    ret = getsockopt(s, level, optname, optval, optlen);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -424,7 +535,13 @@ int qemu_setsockopt_wrap(int sockfd, int level, int optname,
                          const void *optval, socklen_t optlen)
 {
     int ret;
-    ret = setsockopt(sockfd, level, optname, optval, optlen);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == INVALID_SOCKET) {
+        return -1;
+    }
+
+    ret = setsockopt(s, level, optname, optval, optlen);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -437,7 +554,13 @@ int qemu_getpeername_wrap(int sockfd, struct sockaddr *addr,
                           socklen_t *addrlen)
 {
     int ret;
-    ret = getpeername(sockfd, addr, addrlen);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == INVALID_SOCKET) {
+        return -1;
+    }
+
+    ret = getpeername(s, addr, addrlen);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -450,7 +573,13 @@ int qemu_getsockname_wrap(int sockfd, struct sockaddr *addr,
                           socklen_t *addrlen)
 {
     int ret;
-    ret = getsockname(sockfd, addr, addrlen);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == INVALID_SOCKET) {
+        return -1;
+    }
+
+    ret = getsockname(s, addr, addrlen);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -462,7 +591,13 @@ int qemu_getsockname_wrap(int sockfd, struct sockaddr *addr,
 ssize_t qemu_send_wrap(int sockfd, const void *buf, size_t len, int flags)
 {
     int ret;
-    ret = send(sockfd, buf, len, flags);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == INVALID_SOCKET) {
+        return -1;
+    }
+
+    ret = send(s, buf, len, flags);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -475,7 +610,13 @@ ssize_t qemu_sendto_wrap(int sockfd, const void *buf, size_t len, int flags,
                          const struct sockaddr *addr, socklen_t addrlen)
 {
     int ret;
-    ret = sendto(sockfd, buf, len, flags, addr, addrlen);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == INVALID_SOCKET) {
+        return -1;
+    }
+
+    ret = sendto(s, buf, len, flags, addr, addrlen);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -487,7 +628,13 @@ ssize_t qemu_sendto_wrap(int sockfd, const void *buf, size_t len, int flags,
 ssize_t qemu_recv_wrap(int sockfd, void *buf, size_t len, int flags)
 {
     int ret;
-    ret = recv(sockfd, buf, len, flags);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == INVALID_SOCKET) {
+        return -1;
+    }
+
+    ret = recv(s, buf, len, flags);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -500,7 +647,13 @@ ssize_t qemu_recvfrom_wrap(int sockfd, void *buf, size_t len, int flags,
                            struct sockaddr *addr, socklen_t *addrlen)
 {
     int ret;
-    ret = recvfrom(sockfd, buf, len, flags, addr, addrlen);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == INVALID_SOCKET) {
+        return -1;
+    }
+
+    ret = recvfrom(s, buf, len, flags, addr, addrlen);
     if (ret < 0) {
         errno = socket_error();
     }
-- 
2.39.2
