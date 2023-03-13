Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp170377ejb;
        Mon, 13 Mar 2023 04:45:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set81gzai8Eos3D+TsiIJNnB7tumfKIqhME8FJGiasxBJkgYiRtxbFQbVdBSEbiCMoZZ8qgKs
X-Received: by 2002:ac8:5b84:0:b0:3bf:d48e:26c4 with SMTP id a4-20020ac85b84000000b003bfd48e26c4mr57737826qta.39.1678707931620;
        Mon, 13 Mar 2023 04:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707931; cv=none;
        d=google.com; s=arc-20160816;
        b=EcEJWOVpn1JE4Wnzupa60+poiqp+Yp9+dobNLcc5e5+5kZPW9MSEdBwQILNwaZCqAG
         uUEopJiCbeEoVAZNPzwiV2oOGZBlHrwIXyOBGX4FOmNJ41xG3rsWpt9n9WzgFAk8JoTu
         /6Lhr78C9C6555hLbGnSrc5JfgZv9+AEySew4PfFbQ2H5lnTtdXqfO7AjpebTiX+Xbci
         zk44DZbC3Gras0xizrizzTer/viVIZerK0UoViYBu2aVCpYyHVKWTyplgfzgmen4UVzZ
         Wkgk7AsO012q/9iP+hiRj70wMLzO7s3oF11a4+riri7PLPtcjytR0II09g8mh00t6cwh
         smfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tCU3J7ltYDOiuEpkcpay2NUMcN9Mmty6BEjJzeBEQCg=;
        b=iIokoZDO94zeKwIIRustp+mUGTZhWmX1Rw8oydzhjXPrb3jGWU1jArOf8Tffj3ubUo
         0mtA0QdQLQowYmpZsCvmCGK22J+VEJadNJVldrvkUMsqrF90RXJmxRYaEDXq8eJQz3c+
         AnAaXt2GNnb3rqbfQVbCWbEMmUn+HGPRCJ4wPe7Bv4AnHKqde6RfSACA8rOEpxrpg5TE
         vLrno2atZm9hHCfRnEk96ksO28Dz0H/tLZkjyrmVEKM8LZqB/zosyblgp7Fqa4/haH2w
         ec3jbgSwXcm4nVwgu101wIYFpdmT6yIb+6JcERId+Qr/HnriKkPH+TY2eD31BeCZ47x/
         mYTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HkA5EJh/";
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id j16-20020a05620a289000b007427dfefc91si5362758qkp.564.2023.03.13.04.45.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:45:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HkA5EJh/";
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tCU3J7ltYDOiuEpkcpay2NUMcN9Mmty6BEjJzeBEQCg=;
	b=HkA5EJh/VjSu8E5XI3Xn348hCZykaiu50dyCb63vUZP4elj3YxI0oyTzUa41nOM4Z6Axjh
	H97vqhwWF5iuCeg/4fX44mmBckowqTnLq9zY2HnwAq2sF9kfNojT+4A4zU0tJoUfbTL+0l
	mWAQajgm5C/pcPW1bsO3fltFknffOJk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-lqaQgCP5PHqVoEbJIolsRQ-1; Mon, 13 Mar 2023 07:45:27 -0400
X-MC-Unique: lqaQgCP5PHqVoEbJIolsRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5ACEB85A5A3;
	Mon, 13 Mar 2023 11:45:26 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E541AC15A0B;
	Mon, 13 Mar 2023 11:45:24 +0000 (UTC)
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
Subject: [PULL 23/25] libqtest: make qtest_qmp_add_client work on win32
Date: Mon, 13 Mar 2023 15:43:33 +0400
Message-Id: <20230313114335.424093-24-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-TUID: WrEPszp8cxBZ

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Use the "get-win32-socket" function to pass an opened socket to QEMU,
instead of using "getfd", which relies on socket ancillary FD message
passing.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230306122751.2355515-10-marcandre.lureau@redhat.com>
---
 tests/qtest/libqtest.h |  5 ++---
 tests/qtest/libqtest.c | 18 ++++++++++++++++--
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index fcf1c3c3b3..8d7d450963 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -758,17 +758,16 @@ void qtest_qmp_device_add_qdict(QTestState *qts, const char *drv,
 void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
                           const char *fmt, ...) G_GNUC_PRINTF(4, 5);
 
-#ifndef _WIN32
 /**
  * qtest_qmp_add_client:
  * @qts: QTestState instance to operate on
  * @protocol: the protocol to add to
  * @fd: the client file-descriptor
  *
- * Call QMP ``getfd`` followed by ``add_client`` with the given @fd.
+ * Call QMP ``getfd`` (on Windows ``get-win32-socket``) followed by
+ * ``add_client`` with the given @fd.
  */
 void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd);
-#endif /* _WIN32 */
 
 /**
  * qtest_qmp_device_del_send:
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index dee2032331..c3a0ef5bb4 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1478,13 +1478,28 @@ void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
     qobject_unref(args);
 }
 
-#ifndef _WIN32
 void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd)
 {
     QDict *resp;
 
+#ifdef WIN32
+    WSAPROTOCOL_INFOW info;
+    g_autofree char *info64  = NULL;
+    SOCKET s;
+
+    assert(fd_is_socket(fd));
+    s = _get_osfhandle(fd);
+    if (WSADuplicateSocketW(s, GetProcessId((HANDLE)qts->qemu_pid), &info) == SOCKET_ERROR) {
+        g_autofree char *emsg = g_win32_error_message(WSAGetLastError());
+        g_error("WSADuplicateSocketW failed: %s", emsg);
+    }
+    info64 = g_base64_encode((guchar *)&info, sizeof(info));
+    resp = qtest_qmp(qts, "{'execute': 'get-win32-socket',"
+                     "'arguments': {'fdname': 'fdname', 'info': %s}}", info64);
+#else
     resp = qtest_qmp_fds(qts, &fd, 1, "{'execute': 'getfd',"
                          "'arguments': {'fdname': 'fdname'}}");
+#endif
     g_assert(resp);
     g_assert(!qdict_haskey(resp, "event")); /* We don't expect any events */
     g_assert(!qdict_haskey(resp, "error"));
@@ -1498,7 +1513,6 @@ void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd)
     g_assert(!qdict_haskey(resp, "error"));
     qobject_unref(resp);
 }
-#endif
 
 /*
  * Generic hot-unplugging test via the device_del QMP command.
-- 
2.39.2
