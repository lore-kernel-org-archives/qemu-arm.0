Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp169675ejb;
        Mon, 13 Mar 2023 04:44:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set/x4IhZ5ddRQ3z1P6+HVBKCLboXUhNj1JwBEJS42g8lJ7ZWmzEOBbGr5CXRf6HEFcZhyjHz
X-Received: by 2002:a05:622a:2c2:b0:3bd:140c:91ed with SMTP id a2-20020a05622a02c200b003bd140c91edmr52404577qtx.52.1678707878822;
        Mon, 13 Mar 2023 04:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707878; cv=none;
        d=google.com; s=arc-20160816;
        b=SeVDkaNUOVcDf2Pd10d+sZ9/8vfdlHMV7wEBLZiBGDxDwXKuTatz7Vj7AoPfl7dVA4
         AxDnhWleECtQcPGD6w5sC3q8U0RVl5YxeApM5r1drn49eH9vP8B2fEFXlS3nTB6kXrqh
         MnvEQ81rrZPJrd7fXavYmFpGXgG2uvtbpoy7Nr9860ra7cMbDwTlmHFsDuh1st/fbUE0
         icB+m3cj+hMlsg8YCL386/+VnOF6qIUfJgUbOu7Uu+shQNmu5zrJyfgfrzQ1/3JdH6k6
         2DvzAsgFJq3FMEU2/DiqZ3QTSk5HTWZRVnqnQ2Ffk8uIPO/4yy2cW605bOkXjrEOOIE5
         I//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2sdYbjwoDK6asuv5xfaPJTDIzsW8PShUVAXy/wh1O5Y=;
        b=k8WdPuWqAalxi//Q7kut4+XHpTzYGqwiP5urlc0HLWcH+iro2kdgBfxw8vv4+a5Y8J
         dnRhS+BafDvvfGkwJy0zppCF+viYyphBJPksYyYO0O9AAB34AYJ7MA/uoDnduCfXu34P
         6UZSnCKYnAZtidwByjti07yqxU2O9RCguSTDZbOc9tNlnUiDzz0dDdFaXBcYxNOB0GRx
         ynyYas/C1ePS7SiIumgr5uZratT3TfH6LvaUSuHhTttNT3ZIjaqSnsnnOrRRwbRWaB3L
         A8aDrBQWoab16iff/dydwDg2msnGa+Y0fFRMmyxFRs5fcZUcLIV5EP3Q3YzWhwyaBqqR
         rKPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DWQrhMjY;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id z17-20020a05622a061100b003b88d38365fsi4923709qta.394.2023.03.13.04.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DWQrhMjY;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2sdYbjwoDK6asuv5xfaPJTDIzsW8PShUVAXy/wh1O5Y=;
	b=DWQrhMjYrlfiZwgfnD4ZWYqXlTwpKOspmClyFXhR3BXMg5prR8sn308fDQzXbneWypNH+/
	eF6ghdr81QoT+vs7XZtsXTEgyUzcw6Kdqr+5tubDRV4Pv3HIB2ENIKzA4LChl/EVj1yY81
	jDZ1uKVpDE9sahh/tAGB3d0BfmH2zoU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292--E8QRZqBMcacM5b4Q26q-A-1; Mon, 13 Mar 2023 07:44:35 -0400
X-MC-Unique: -E8QRZqBMcacM5b4Q26q-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0595185A794;
	Mon, 13 Mar 2023 11:44:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 67FB02A68;
	Mon, 13 Mar 2023 11:44:33 +0000 (UTC)
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
Subject: [PULL 12/25] slirp: open-code qemu_socket_(un)select()
Date: Mon, 13 Mar 2023 15:43:22 +0400
Message-Id: <20230313114335.424093-13-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: xjRU4Hx52L0D

From: Marc-André Lureau <marcandre.lureau@redhat.com>

We are about to make the QEMU socket API use file-descriptor space only,
but libslirp gives us SOCKET as fd, still.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20230221124802.4103554-14-marcandre.lureau@redhat.com>
---
 net/slirp.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index a7c35778a6..c33b3e02e7 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -251,16 +251,20 @@ static void net_slirp_register_poll_fd(int fd, void *opaque)
 #ifdef WIN32
     AioContext *ctxt = qemu_get_aio_context();
 
-    qemu_socket_select(fd, event_notifier_get_handle(&ctxt->notifier),
+    if (WSAEventSelect(fd, event_notifier_get_handle(&ctxt->notifier),
                        FD_READ | FD_ACCEPT | FD_CLOSE |
-                       FD_CONNECT | FD_WRITE | FD_OOB, NULL);
+                       FD_CONNECT | FD_WRITE | FD_OOB) != 0) {
+        error_setg_win32(&error_warn, WSAGetLastError(), "failed to WSAEventSelect()");
+    }
 #endif
 }
 
 static void net_slirp_unregister_poll_fd(int fd, void *opaque)
 {
 #ifdef WIN32
-    qemu_socket_unselect(fd, NULL);
+    if (WSAEventSelect(fd, NULL, 0) != 0) {
+        error_setg_win32(&error_warn, WSAGetLastError(), "failed to WSAEventSelect()");
+    }
 #endif
 }
 
-- 
2.39.2
