Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2647120ejb;
        Mon, 20 Feb 2023 13:52:56 -0800 (PST)
X-Google-Smtp-Source: AK7set8lyy9MQQLsGP9ea7IH7x3zjkhtsJDohNN6UBMuttJcO+LMnlg6jRbwboho0YJm42drXsy5
X-Received: by 2002:a05:622a:1755:b0:3b8:6b30:7e30 with SMTP id l21-20020a05622a175500b003b86b307e30mr3855242qtk.54.1676929976539;
        Mon, 20 Feb 2023 13:52:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676929976; cv=none;
        d=google.com; s=arc-20160816;
        b=nlVggotKfBZgj89XPCJvJl3SjZZKmBahlspWQqHor9EEtJhjjVPWiiyBMXjqoidEFn
         vlx1zWF2X4lwDHl0rknglXfmviVxQJo6hEfd6yyjWzQCN2Y4fHTn2t9TN3CY7Zj3cWUP
         5X5bUyevaaNFPtV+59C4ZXp25PJQ1keNcGgdTGSlvjRo/V8jNOQYspn3fMNBtKkXQb2g
         MO4N3Wfl+MrI2AVfhMWt5SxC/JEyc0GtPCDeIZR2XY13EPueZuGGX6EVdZkxZcFKwo1o
         cyXFAm2MMQn21qQRlxkAgX6IbsTOs/taQz6Zs3zNAMq6FHh2lUqlcEOpkHrDclsuskco
         UTQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ByXpJfj4Mf0HELban587NU1aljZ6ECTLm575DZB8NRw=;
        b=GSWx5x6sa3DdjrhGQUzWmp0zsigjfk4lyFzLWGZ851/Q/4NQ2ZIHzvwdt7pkasPBbu
         7+U3D/2Q7ezjxJInJ6FplA1YI2ZgFT2K0/wMgmEzIHmuyxYwXePe3TKGTMlYwcXjCZdj
         K6cZtWYI7zoX1z1MsT+CU46cQ/pYkTZrWJQcpJNsBFJ65DA4xCYd+wMn5B/872nXO4sS
         i+C+7/r1wlP84PwUAHjM2EJJyEJjEvjoxjWAqe/Ayt4xo5qcUlcZVQMTacvx4OsCiKiq
         0HNJyDVRork5viextcSjnmijyB/eUn3RQyh1Yabs+d6IP+gi9tY7S+ochyja7QIMQ2Hv
         /dgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OHRaJ9Z2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m66-20020a375845000000b007050f63d946si9576797qkb.716.2023.02.20.13.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 13:52:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OHRaJ9Z2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUE4M-0006E6-FP; Mon, 20 Feb 2023 16:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE3t-0005Am-Ux
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 16:51:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE3q-0008Rx-RB
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 16:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676929861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ByXpJfj4Mf0HELban587NU1aljZ6ECTLm575DZB8NRw=;
 b=OHRaJ9Z2O5I1lBRLnqqBp7wrWPbXa7rEuTjwD/x4a6GJ+qzgXaGTpqvP76G+d4E9kkZmUm
 KonimTuW6Wo9aMqNXrtW5cu3ZAg5eg+yinFWF02ws4TFFZeUqDWrXwvadCvlRt42+qLi2g
 UTdxMCVOz5zg1t1g+qFAWx5iakPR7Hk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-OTqOFaU5O3CYIUFJWbDfaw-1; Mon, 20 Feb 2023 16:49:25 -0500
X-MC-Unique: OTqOFaU5O3CYIUFJWbDfaw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A00953C0E44D;
 Mon, 20 Feb 2023 21:49:24 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F10B404CD84;
 Mon, 20 Feb 2023 21:49:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 05/15] win32/socket: introduce qemu_socket_select() helper
Date: Tue, 21 Feb 2023 01:48:49 +0400
Message-Id: <20230220214859.3792171-6-marcandre.lureau@redhat.com>
In-Reply-To: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
References: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: K3ooAC6lSa5t

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
2.39.1

