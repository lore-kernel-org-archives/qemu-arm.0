Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp170291ejb;
        Mon, 13 Mar 2023 04:45:26 -0700 (PDT)
X-Google-Smtp-Source: AK7set/Nk2G8bBcILLqApKmT8yWlISeyHimz057MSM1TVr0zqWUkvOfbqfjXghdTd7NmMgUG6/wU
X-Received: by 2002:a05:622a:14e:b0:3bc:ff12:e5e5 with SMTP id v14-20020a05622a014e00b003bcff12e5e5mr54965159qtw.17.1678707926067;
        Mon, 13 Mar 2023 04:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707926; cv=none;
        d=google.com; s=arc-20160816;
        b=O2y6AzPo1ZecA7YQgdb8t4jeINUzlM0raOThsrnVF5iTAJ0lyHD61MgZZTsgJFAcbJ
         FAxoTnnfJ5kN+Xwq9rWaSna+B21ZInt0IBHsRaUKadJW9lkz+N2XQQIJ0/dqTIKWGC8m
         2nGbetgPNiTHu2koBU31DJ3ttZgPvIU94qFXYRL85mlfUhXLJnZqPt+X5+GAzgB2hP4g
         QBkAUWJe2+bzcLGYJUHAHGcDt5R53IlEjwC+Ue/h6nD0ooPETCLn5SIIQWNyxvDAgx/v
         fLNwROHdHVkYunudPj8QyQNaFP5f8NCI/rFrCkMNKAEyNh5fANZCxRKJ4RKJtyjr1HOe
         Xd6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3vEfrYWExxXeJtlgbPURoCbJ42fAHdoLV7DhNJ2YY4E=;
        b=qi55kh5ExNbzsG3tbgGpk26JsVR4A+gT+E9hIIPXHCotSwUhkB/u7+RujDbGavTR6G
         TA7CbX3kx5I7h3RtbqU0jy6b/O3Su0VEhMXtavgnHZYTk5AYvAlS8cAQt5EQGptl8HRQ
         eikPgdyVWhciOJwEpqcxqXoeGOjBtC8YUt53Ew6dmn/BH+RFBGOSw8gqQu6tckUlK2K3
         ran2+JhSo/GyHer/IsbHb7IMBsSWg4NZC24XN8u9Y0J81ggX0s3acS671qpYIECSCrUi
         NaNWlcdk1g+mKyv3Wg2M2saFODMqkvz3yUwoJ1P1yXpvySs29RCB0ty4GxiyPEPUeZRr
         XhlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uw3gWiNp;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id n8-20020a05622a11c800b003c006c3fe64si5223425qtk.646.2023.03.13.04.45.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:45:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uw3gWiNp;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vEfrYWExxXeJtlgbPURoCbJ42fAHdoLV7DhNJ2YY4E=;
	b=Uw3gWiNp0qTPaLXhzIcauwxZiBoE7Ji4Ze6DEYl4XoFjsjVkHZNzpTqkod5K4P8aBDH9mL
	XtKWrn7jj/n5s2MBGK/pKc5AS++xEcPD/2BJY9XDrFRTKQ/hdX5T0pZ41Oq6ttIHB/eLLz
	Eo/EqGFuPJljj7EKGsXKOeJT1yUCD5Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-aosI3pgnPYOyxtb2rrvtiA-1; Mon, 13 Mar 2023 07:45:22 -0400
X-MC-Unique: aosI3pgnPYOyxtb2rrvtiA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0C5185A588;
	Mon, 13 Mar 2023 11:45:21 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A6200C164E7;
	Mon, 13 Mar 2023 11:45:20 +0000 (UTC)
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
Subject: [PULL 22/25] qmp: add 'get-win32-socket'
Date: Mon, 13 Mar 2023 15:43:32 +0400
Message-Id: <20230313114335.424093-23-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-TUID: /GhvPjiOOM7/

From: Marc-André Lureau <marcandre.lureau@redhat.com>

A process with enough capabilities can duplicate a socket to QEMU. Add a
QMP command to import it and add it to the monitor fd list, so it can be
later used by other commands.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230306122751.2355515-9-marcandre.lureau@redhat.com>
---
 qapi/misc.json | 31 ++++++++++++++++++++
 monitor/fds.c  | 76 +++++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 91 insertions(+), 16 deletions(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index f0217cfba0..5ef6286af3 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -275,6 +275,37 @@
 ##
 { 'command': 'getfd', 'data': {'fdname': 'str'} }
 
+##
+# @get-win32-socket:
+#
+# Add a socket that was duplicated to QEMU process with
+# WSADuplicateSocketW() via WSASocket() & WSAPROTOCOL_INFOW structure
+# and assign it a name (the SOCKET is associated with a CRT file
+# descriptor)
+#
+# @info: the WSAPROTOCOL_INFOW structure (encoded in base64)
+#
+# @fdname: file descriptor name
+#
+# Returns: Nothing on success
+#
+# Since: 8.0
+#
+# Notes: If @fdname already exists, the file descriptor assigned to
+#        it will be closed and replaced by the received file
+#        descriptor.
+#
+#        The 'closefd' command can be used to explicitly close the
+#        file descriptor when it is no longer needed.
+#
+# Example:
+#
+# -> { "execute": "get-win32-socket", "arguments": { "info": "abcd123..", fdname": "skclient" } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'get-win32-socket', 'data': {'info': 'str', 'fdname': 'str'}, 'if': 'CONFIG_WIN32' }
+
 ##
 # @closefd:
 #
diff --git a/monitor/fds.c b/monitor/fds.c
index 7daf1064e1..9ed4197358 100644
--- a/monitor/fds.c
+++ b/monitor/fds.c
@@ -61,46 +61,55 @@ struct MonFdset {
 static QemuMutex mon_fdsets_lock;
 static QLIST_HEAD(, MonFdset) mon_fdsets;
 
-void qmp_getfd(const char *fdname, Error **errp)
+static bool monitor_add_fd(Monitor *mon, int fd, const char *fdname, Error **errp)
 {
-    Monitor *cur_mon = monitor_cur();
     mon_fd_t *monfd;
-    int fd, tmp_fd;
-
-    fd = qemu_chr_fe_get_msgfd(&cur_mon->chr);
-    if (fd == -1) {
-        error_setg(errp, "No file descriptor supplied via SCM_RIGHTS");
-        return;
-    }
 
     if (qemu_isdigit(fdname[0])) {
         close(fd);
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "fdname",
                    "a name not starting with a digit");
-        return;
+        return false;
     }
 
     /* See close() call below. */
-    qemu_mutex_lock(&cur_mon->mon_lock);
-    QLIST_FOREACH(monfd, &cur_mon->fds, next) {
+    qemu_mutex_lock(&mon->mon_lock);
+    QLIST_FOREACH(monfd, &mon->fds, next) {
+        int tmp_fd;
+
         if (strcmp(monfd->name, fdname) != 0) {
             continue;
         }
 
         tmp_fd = monfd->fd;
         monfd->fd = fd;
-        qemu_mutex_unlock(&cur_mon->mon_lock);
+        qemu_mutex_unlock(&mon->mon_lock);
         /* Make sure close() is outside critical section */
         close(tmp_fd);
-        return;
+        return true;
     }
 
     monfd = g_new0(mon_fd_t, 1);
     monfd->name = g_strdup(fdname);
     monfd->fd = fd;
 
-    QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
-    qemu_mutex_unlock(&cur_mon->mon_lock);
+    QLIST_INSERT_HEAD(&mon->fds, monfd, next);
+    qemu_mutex_unlock(&mon->mon_lock);
+    return true;
+}
+
+void qmp_getfd(const char *fdname, Error **errp)
+{
+    Monitor *cur_mon = monitor_cur();
+    int fd;
+
+    fd = qemu_chr_fe_get_msgfd(&cur_mon->chr);
+    if (fd == -1) {
+        error_setg(errp, "No file descriptor supplied via SCM_RIGHTS");
+        return;
+    }
+
+    monitor_add_fd(cur_mon, fd, fdname, errp);
 }
 
 void qmp_closefd(const char *fdname, Error **errp)
@@ -214,6 +223,41 @@ error:
     return NULL;
 }
 
+#ifdef WIN32
+void qmp_get_win32_socket(const char *infos, const char *fdname, Error **errp)
+{
+    g_autofree WSAPROTOCOL_INFOW *info = NULL;
+    gsize len;
+    SOCKET sk;
+    int fd;
+
+    info = (void *)g_base64_decode(infos, &len);
+    if (len != sizeof(*info)) {
+        error_setg(errp, "Invalid WSAPROTOCOL_INFOW value");
+        return;
+    }
+
+    sk = WSASocketW(FROM_PROTOCOL_INFO,
+                    FROM_PROTOCOL_INFO,
+                    FROM_PROTOCOL_INFO,
+                    info, 0, 0);
+    if (sk == INVALID_SOCKET) {
+        error_setg_win32(errp, WSAGetLastError(), "Couldn't import socket");
+        return;
+    }
+
+    fd = _open_osfhandle(sk, _O_BINARY);
+    if (fd < 0) {
+        error_setg_errno(errp, errno, "Failed to associate a FD with the SOCKET");
+        closesocket(sk);
+        return;
+    }
+
+    monitor_add_fd(monitor_cur(), fd, fdname, errp);
+}
+#endif
+
+
 void qmp_remove_fd(int64_t fdset_id, bool has_fd, int64_t fd, Error **errp)
 {
     MonFdset *mon_fdset;
-- 
2.39.2
