Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp169513ejb;
        Mon, 13 Mar 2023 04:44:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set9p5PJkL3ktCVLXSL8vUoD024U2sKN2HsLXW75D5v3R2k4IPlHxXkRzfYH94NninpoXq2MM
X-Received: by 2002:a17:907:948e:b0:878:7f6e:38a7 with SMTP id dm14-20020a170907948e00b008787f6e38a7mr45656371ejc.44.1678707868616;
        Mon, 13 Mar 2023 04:44:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707868; cv=none;
        d=google.com; s=arc-20160816;
        b=XWIsUvsuoBe3Es0HRdsCa3KYf1gvF7cSyLbJuUD7O3iZss24quycFp/8Ag/NX8ZDLN
         o52UJS0QxzGp4dhPr/TlqLgxQvuPvaWbCypluxnx/t9dtcqqLocTQWuYWoeys4SJYI1x
         tXs49iRlQUC3m2K0aKP6aLyeEuz4E8yaI4ir2mySXeyF0txPu8LbFxIKU2Pj0t+Zxs74
         l008u7CrjGAMnUYngFUvxAUktriAY1PQfyGjvHwI2+crh1+2IsnTOIPUuonCJP7l/jpA
         hnUjg1chEQhG+6yV/zaHpUjtgNF8UodS76x/c7wmrOKGdca7+JbjCaGWZxBC6+K+wm7D
         3oKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JZoKqTSXrt6BQL8awns9NXpQ2ZsLtrEmc/UBtlwS1+8=;
        b=I4V8cnbd1XukCwDCshhLsJ4Mhc5XPGErUhHUX2/8i56tiZSr69anvETqUKxUAtiBAs
         5xBDaTGbkoocm8R4f6D+I5IUaxgQy40LgOTTWsXlKWW5MyXpZ1u830lp9AlJdj5KH+Do
         QOGWm/BQT39mH0bkQhlcvZBgsMjYKbNwwnuTB5gGVO8YPPA6ssEnG9B++sxjGoJOvei6
         lxdMoCXzPPa0an27ySjUiHw2kcrbJhTfm2GqpHJpFH7v10tWzJjUFUsuCWYY4Mr3V+Do
         7aav+qozyM1T8PLKelrWYRhdqNVytjTUOLcnZXf3OPHvobAVdwColunMBxn74O5grWni
         19ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OAKsSiNa;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id k23-20020a1709063e1700b00929b501af1asi741289eji.1008.2023.03.13.04.44.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:44:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OAKsSiNa;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JZoKqTSXrt6BQL8awns9NXpQ2ZsLtrEmc/UBtlwS1+8=;
	b=OAKsSiNa/t0qQl9nXZZrWFEn7CHh72jzLvQ3AePi3AbriVsV3m5XRzo+9nwMcyQ9+u1ZYJ
	qFSwh+SyTrBK10V08MlANDDk+bgDpQPL01tZgHJhTdvkImiHNblvj8AnQDkzW3dSj5p5b9
	evw5887eRY7ZeEVv+fgbMENBGAcqy00=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-WY_-AvWeP8mv0jJwWuGc8Q-1; Mon, 13 Mar 2023 07:44:26 -0400
X-MC-Unique: WY_-AvWeP8mv0jJwWuGc8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7713101A52E;
	Mon, 13 Mar 2023 11:44:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D22B21410F1D;
	Mon, 13 Mar 2023 11:44:24 +0000 (UTC)
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
Subject: [PULL 10/25] main-loop: remove qemu_fd_register(), win32/slirp/socket specific
Date: Mon, 13 Mar 2023 15:43:20 +0400
Message-Id: <20230313114335.424093-11-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: mS6u/wHMwRbc

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Open-code the socket registration where it's needed, to avoid
artificially used or unclear generic interface.

Furthermore, the following patches are going to make socket handling use
FD-only inside QEMU, but we need to handle win32 SOCKET from libslirp.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20230221124802.4103554-12-marcandre.lureau@redhat.com>
---
 include/qemu/main-loop.h |  2 --
 net/slirp.c              |  8 +++++++-
 util/main-loop.c         | 11 -----------
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index c25f390696..b3e54e00bc 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -387,8 +387,6 @@ void qemu_cond_timedwait_iothread(QemuCond *cond, int ms);
 
 /* internal interfaces */
 
-void qemu_fd_register(int fd);
-
 #define qemu_bh_new(cb, opaque) \
     qemu_bh_new_full((cb), (opaque), (stringify(cb)))
 QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name);
diff --git a/net/slirp.c b/net/slirp.c
index 2ee3f1a0d7..0730a935ba 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -248,7 +248,13 @@ static void net_slirp_timer_mod(void *timer, int64_t expire_timer,
 
 static void net_slirp_register_poll_fd(int fd, void *opaque)
 {
-    qemu_fd_register(fd);
+#ifdef WIN32
+    AioContext *ctxt = qemu_get_aio_context();
+
+    qemu_socket_select(fd, event_notifier_get_handle(&ctxt->notifier),
+                       FD_READ | FD_ACCEPT | FD_CLOSE |
+                       FD_CONNECT | FD_WRITE | FD_OOB, NULL);
+#endif
 }
 
 static void net_slirp_unregister_poll_fd(int fd, void *opaque)
diff --git a/util/main-loop.c b/util/main-loop.c
index 16e837fb12..e180c85145 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -252,10 +252,6 @@ static int max_priority;
 static int glib_pollfds_idx;
 static int glib_n_poll_fds;
 
-void qemu_fd_register(int fd)
-{
-}
-
 static void glib_pollfds_fill(int64_t *cur_timeout)
 {
     GMainContext *context = g_main_context_default();
@@ -414,13 +410,6 @@ void qemu_del_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
     }
 }
 
-void qemu_fd_register(int fd)
-{
-    qemu_socket_select(fd, event_notifier_get_handle(&qemu_aio_context->notifier),
-                       FD_READ | FD_ACCEPT | FD_CLOSE |
-                       FD_CONNECT | FD_WRITE | FD_OOB, NULL);
-}
-
 static int pollfds_fill(GArray *pollfds, fd_set *rfds, fd_set *wfds,
                         fd_set *xfds)
 {
-- 
2.39.2
