Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3216759ejb;
        Tue, 21 Feb 2023 04:49:31 -0800 (PST)
X-Google-Smtp-Source: AK7set/0xydPdRnqbzNTPrRQEYl0oTifvOFtMAZ6Tv3hgXCUQd6u5zEdH23IYCkku7/rnf8xMLfN
X-Received: by 2002:a05:6214:da5:b0:56e:a9c6:d2c6 with SMTP id h5-20020a0562140da500b0056ea9c6d2c6mr6555128qvh.6.1676983771757;
        Tue, 21 Feb 2023 04:49:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676983771; cv=none;
        d=google.com; s=arc-20160816;
        b=aq3DtrMDox+QrNNEHsQAUIClPErhl1Ffst/H2enfSK59cxj5wI2UPRHGyvP71JtxCE
         1JfpSCf4EmIjcxaSEDYoY9Nazp+5xU07XUqzw2iFY4WfEtDl88RNV0YGn5rxRhEY3Z/2
         OeWRM5m9w5kBqXVfC7P+ZPjjgwr0POVK8EI194hD1ZAUHV2lxSu5JkpkEekaQR6QpYu9
         DWKb3VE+fIlR2AtUbPbFlo2lMrbELcbryFN4UL3amIkH4ybeZ0jQCZH/zL1bj81ovAZ1
         FUPTSfp5Fw5Tp6NqIR5f/78RpOuUEicpUUQ+vkGUN44ZJKFlEuinjWyxwuq3OtRb/264
         oqIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1d28WD5B2VuUNOZgIqgkuR3MPEwDDxxWoGsHxpPb3I0=;
        b=VNgNy/X4NDeRXFSWvbrnEXOI9fbB8L5ZWUx8Dd3DA1KjJfMrA922cXVO5jByh2m0uw
         QqQh2v37pVgagTGlT3WpeqbWng+sgCUq5HYT3LfYbJD5tsPp+CPL7EphGorAC+rtuKFH
         a/1rsh1iS8Zec5cWRuJwV2l7vVRFzktJz/ref5fVYO/1nmIe6bg858gQk8GhtLh7QesQ
         05Lim5Zhpo6NAgWeIIm5aKqlxhLb7NNN4QY1L272LotAuSRWto712MWbdwJ7thgWbCk7
         fkRb4VGfOpLhXjygWB9H6glX2ltWxUlgqqwlvUQKbQryyH0yg3GoxFyPdPnBKhdI8B21
         0bEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A4A0+hY5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7-20020a0cca07000000b0056ebc773032si11605480qvk.73.2023.02.21.04.49.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 04:49:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A4A0+hY5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUS4Y-0005GK-JI; Tue, 21 Feb 2023 07:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4V-0005Ft-9o
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:48:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4T-0007sD-C0
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1d28WD5B2VuUNOZgIqgkuR3MPEwDDxxWoGsHxpPb3I0=;
 b=A4A0+hY5R1uDfb3ZBUNV2cmkrlKrMD7ZSXWXwhCMMjmzAJzOoB4EvBAifQw2H0L6SdgJYG
 6oGYHPF1gUccEB+gFt2s+wNUwPXscdLX2nz9YVUIcd4n1ZcoP/bGO5QReehsfFZcYMgcG+
 NUnb0Kwx1sypVQ4o7FqhN5uQV4/5j+Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-hm6GjQg8MkqaAz7NeFTiaQ-1; Tue, 21 Feb 2023 07:48:33 -0500
X-MC-Unique: hm6GjQg8MkqaAz7NeFTiaQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D684E381458C;
 Tue, 21 Feb 2023 12:48:32 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BCD2140EBF4;
 Tue, 21 Feb 2023 12:48:30 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 06/16] win32/socket: introduce qemu_socket_select() helper
Date: Tue, 21 Feb 2023 16:47:51 +0400
Message-Id: <20230221124802.4103554-7-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RCnBaSNfZkoT

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This is a wrapper for WSAEventSelect, with Error handling. By default,
it will produce a warning, so callers don't have to be modified
now, and yet we can spot potential mis-use.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/sysemu/os-win32.h |  5 +++++
 io/channel-socket.c       |  4 ++--
 io/channel-watch.c        |  6 +++---
 util/aio-win32.c          |  2 +-
 util/main-loop.c          |  6 +++---
 util/oslib-win32.c        | 17 ++++++++++++++++-
 6 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 5b38c7bd04..0afb79cc2e 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -29,6 +29,7 @@
 #include <winsock2.h>
 #include <windows.h>
 #include <ws2tcpip.h>
+#include "qemu/typedefs.h"
 
 #ifdef HAVE_AFUNIX_H
 #include <afunix.h>
@@ -144,6 +145,10 @@ static inline void qemu_funlockfile(FILE *f)
 #endif
 }
 
+/* Helper for WSAEventSelect, to report errors */
+bool qemu_socket_select(SOCKET s, WSAEVENT hEventObject,
+                        long lNetworkEvents, Error **errp);
+
 /* We wrap all the sockets functions so that we can
  * set errno based on WSAGetLastError()
  */
diff --git a/io/channel-socket.c b/io/channel-socket.c
index 2040297d2b..0bc29c4808 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -442,7 +442,7 @@ static void qio_channel_socket_finalize(Object *obj)
             }
         }
 #ifdef WIN32
-        WSAEventSelect(ioc->fd, NULL, 0);
+        qemu_socket_select(ioc->fd, NULL, 0, NULL);
 #endif
         closesocket(ioc->fd);
         ioc->fd = -1;
@@ -846,7 +846,7 @@ qio_channel_socket_close(QIOChannel *ioc,
 
     if (sioc->fd != -1) {
 #ifdef WIN32
-        WSAEventSelect(sioc->fd, NULL, 0);
+        qemu_socket_select(sioc->fd, NULL, 0, NULL);
 #endif
         if (qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_LISTEN)) {
             socket_listen_cleanup(sioc->fd, errp);
diff --git a/io/channel-watch.c b/io/channel-watch.c
index ad7c568a84..6ac41009fa 100644
--- a/io/channel-watch.c
+++ b/io/channel-watch.c
@@ -281,9 +281,9 @@ GSource *qio_channel_create_socket_watch(QIOChannel *ioc,
     GSource *source;
     QIOChannelSocketSource *ssource;
 
-    WSAEventSelect(socket, ioc->event,
-                   FD_READ | FD_ACCEPT | FD_CLOSE |
-                   FD_CONNECT | FD_WRITE | FD_OOB);
+    qemu_socket_select(socket, ioc->event,
+                       FD_READ | FD_ACCEPT | FD_CLOSE |
+                       FD_CONNECT | FD_WRITE | FD_OOB, NULL);
 
     source = g_source_new(&qio_channel_socket_source_funcs,
                           sizeof(QIOChannelSocketSource));
diff --git a/util/aio-win32.c b/util/aio-win32.c
index 80cfe012ad..be5136e486 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -115,7 +115,7 @@ void aio_set_fd_handler(AioContext *ctx,
 
         QLIST_INSERT_HEAD_RCU(&ctx->aio_handlers, node, node);
         event = event_notifier_get_handle(&ctx->notifier);
-        WSAEventSelect(node->pfd.fd, event, bitmask);
+        qemu_socket_select(node->pfd.fd, event, bitmask, NULL);
     }
     if (old_node) {
         aio_remove_fd_handler(ctx, old_node);
diff --git a/util/main-loop.c b/util/main-loop.c
index 3c0f525192..16e837fb12 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -416,9 +416,9 @@ void qemu_del_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
 
 void qemu_fd_register(int fd)
 {
-    WSAEventSelect(fd, event_notifier_get_handle(&qemu_aio_context->notifier),
-                   FD_READ | FD_ACCEPT | FD_CLOSE |
-                   FD_CONNECT | FD_WRITE | FD_OOB);
+    qemu_socket_select(fd, event_notifier_get_handle(&qemu_aio_context->notifier),
+                       FD_READ | FD_ACCEPT | FD_CLOSE |
+                       FD_CONNECT | FD_WRITE | FD_OOB, NULL);
 }
 
 static int pollfds_fill(GArray *pollfds, fd_set *rfds, fd_set *wfds,
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 528c9ee156..df752fc762 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -180,7 +180,7 @@ static int socket_error(void)
 void qemu_socket_set_block(int fd)
 {
     unsigned long opt = 0;
-    WSAEventSelect(fd, NULL, 0);
+    qemu_socket_select(fd, NULL, 0, NULL);
     ioctlsocket(fd, FIONBIO, &opt);
 }
 
@@ -283,6 +283,21 @@ char *qemu_get_pid_name(pid_t pid)
 }
 
 
+bool qemu_socket_select(SOCKET s, WSAEVENT hEventObject,
+                        long lNetworkEvents, Error **errp)
+{
+    if (errp == NULL) {
+        errp = &error_warn;
+    }
+
+    if (WSAEventSelect(s, hEventObject, lNetworkEvents) != 0) {
+        error_setg_win32(errp, WSAGetLastError(), "failed to WSAEventSelect()");
+        return false;
+    }
+
+    return true;
+}
+
 #undef connect
 int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
                       socklen_t addrlen)
-- 
2.39.2

