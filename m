Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp172679ejb;
        Mon, 13 Mar 2023 04:48:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set9atoB+Eh6as++DNhtkx3vBbEApR6eYd00vq6HZweKWpxi/H5OOnrZzSxjbxyeh7QhIEP5V
X-Received: by 2002:a05:622a:19a7:b0:3b8:2e92:94e7 with SMTP id u39-20020a05622a19a700b003b82e9294e7mr60515524qtc.44.1678708119470;
        Mon, 13 Mar 2023 04:48:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708119; cv=none;
        d=google.com; s=arc-20160816;
        b=K6j3xJ9X6BPWe7Qae57MROC0R3Z1Hps49lE14a/UMLG2DNZ3TRLU80sjpwCaub+qC8
         yqsT4ZfeLNw4QJeNfG/Dk+WQpo1+wCBmLVfVfN4MMLR7FuJQ33LF2M0ysPoMZvHncKBm
         TevNB/1HycJgWWDNlrTom//Cn9FzBBnv9etx7ELn6Z+Riq1kTqHmqA2KUd6TpDTWGHov
         NGLMIO2A1pJwuaI+11/3yPIU4vf/1Hi8Nm+a7jcmtSWT8CwqaSzA7BmiY/tfz/VcOQHE
         i3rPkd729fjz1TGuPMgVX4aFspX9gnzbfrY+UYXgd4OLc0ytBIqyKbT7PKNjhst7VOJr
         KaIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3vEfrYWExxXeJtlgbPURoCbJ42fAHdoLV7DhNJ2YY4E=;
        b=fVsl+R8HG25iclLfKlToFasIYJoxeDGLeq+3qlVS5twj1MAnWaewxgy2c6zLF6NTm1
         rqRVt3mdB1QRosxwK5ub/gYk2dmxcbsy0mD3yUAwd7IfsnTBjXV0NJGM9RqhX0f1HgXL
         8Xf8aT0TcDwfmM60+EiaVUdPcJ1YEQScXNlDOwSB8YWlOC9r3OLhcFNzsTAccutHP7MG
         3wDmexSUaUw8K0obs90ouLyS7l4SwBN3g82Bb/Qs5rV9eL++lEmXZ80jsAma0vZLSAWD
         l2w+IqTG5FCrxkzVP7i8rM4JhyXgNDzs4M+VTzVtDY3uGwseb/kGfF9rb4W9qYino87s
         /roQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W5rW5ptu;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a17-20020a05622a065100b003b63791e5f8si5419084qtb.623.2023.03.13.04.48.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:48:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W5rW5ptu;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vEfrYWExxXeJtlgbPURoCbJ42fAHdoLV7DhNJ2YY4E=;
	b=W5rW5ptuqeqpZOAspFm00/EUj5DNIwfZs8z3ml2zjEyo01TJ0h485QTIHsZ4UhGx+VTOKk
	LnNnEqT/WuWPbQ3/B+PGQDv1qC/bEg0FDYc8Q5hwGo/W18AY/ADhpNbgebXCrie7EglgfM
	PhLrQIxr11h4fLGG8EpkWwp2BONxDw4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-hzYpNoybNKeyj1IOSMUo8A-1; Mon, 13 Mar 2023 07:48:35 -0400
X-MC-Unique: hzYpNoybNKeyj1IOSMUo8A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FED585A588;
	Mon, 13 Mar 2023 11:48:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4ACE47507A;
	Mon, 13 Mar 2023 11:48:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	Thomas Huth <thuth@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Beraldo Leal <bleal@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL v2 22/25] qmp: add 'get-win32-socket'
Date: Mon, 13 Mar 2023 15:46:45 +0400
Message-Id: <20230313114648.426607-23-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-TUID: zjytz+qoBca1

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
