Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp172758ejb;
        Mon, 13 Mar 2023 04:48:43 -0700 (PDT)
X-Google-Smtp-Source: AK7set/G15UWtbzwLL+3NzBgD9Uy6NSgD1z1fDn54Qziv+kPsevXBeOvPQ4UUB45WIWDx7mxp47q
X-Received: by 2002:a17:906:ee8b:b0:926:9c33:ea4 with SMTP id wt11-20020a170906ee8b00b009269c330ea4mr5196174ejb.27.1678708123773;
        Mon, 13 Mar 2023 04:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708123; cv=none;
        d=google.com; s=arc-20160816;
        b=yCAhv1PQ5/bVVxtSjVGEBlsk9sayv1smBTTcCh7MC/tyaIkiStw9AU6Zb6ZNrEkU/u
         vWwvnqxUZHA+39APjgKLzaO5eCgpNJ0rgVO/Z3JiOFN6Sh6jOWc7u2IZe/FRgkccMxdz
         hnlnum56jV1xtAvKSALLhZWJaCKSlzkmRXOFN8HNK2jrmbQCauYiQPeSCFyD37xNWOc0
         Q3X9mDyC94mYnr1Tl0UvLAjOCZrT6HcsoljCVCPjdhQrME3ObN76QxZUJbh5D2y+yts3
         Bkk8kYHHrU+RuYBMUWupgqXOejwSevrlZWlEZLXe5I/d7CiNSoHCToCTmMNFQbqOwVgB
         UFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tCU3J7ltYDOiuEpkcpay2NUMcN9Mmty6BEjJzeBEQCg=;
        b=FYWvwPtkUYSpPgKc5Arbd+iuMxLavxBEywsDVuEuM/DBbAwciCmH3O8+R1dkxF0Hl2
         dofAAhOp9DyMbZCA4V55LpqUYi/kuHDN3VufU6y1hKaFs86/nBu6AcE1WdwRd5yJdYde
         x3NDfA6rdVWLbkxlAidOF6DNVwDZ2VDDo5wdwI97UjpNSYNdE1XVZKWVR9zryO3JOZ8i
         dK1ESlQLQBYw08/kn5IYl+SlX/MfigZzjI2hLPUATZ/67UsJaQOsND+2+1rQZjykXZQB
         9svcPn8NNy8tACj1XLdwIayGC1E5IUl2Jy0/bOUlfXim+zOB2xmN3XMAEPzGjjx66KsA
         Qv5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PQ3MSKCI;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id q1-20020a170906678100b008be51be536bsi6908288ejp.426.2023.03.13.04.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:48:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PQ3MSKCI;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tCU3J7ltYDOiuEpkcpay2NUMcN9Mmty6BEjJzeBEQCg=;
	b=PQ3MSKCIfMk7zxYDL8KuQZfHq9wgGdc4w68foaVpVGPj+SjzcChjMpYb/9njlVEAG7snRY
	gjwntKnxreWUVLxk3GXZo0fXgyvqUqKsKVrVnnAm4GhY7HpOW4att0zrtzhyNE114/1+2C
	uQuodHDtLKnunqjVXu7UpLsX007K7NE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-ixd7Dxo1PMy90rE0Ajr1Fg-1; Mon, 13 Mar 2023 07:48:39 -0400
X-MC-Unique: ixd7Dxo1PMy90rE0Ajr1Fg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24A6B1C05EAC;
	Mon, 13 Mar 2023 11:48:39 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C535C158C2;
	Mon, 13 Mar 2023 11:48:38 +0000 (UTC)
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
Subject: [PULL v2 23/25] libqtest: make qtest_qmp_add_client work on win32
Date: Mon, 13 Mar 2023 15:46:46 +0400
Message-Id: <20230313114648.426607-24-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-TUID: XrD1vUVv70uu

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
