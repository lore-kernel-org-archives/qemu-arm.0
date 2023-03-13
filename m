Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp171970ejb;
        Mon, 13 Mar 2023 04:47:43 -0700 (PDT)
X-Google-Smtp-Source: AK7set9HRQWTGXnstIFAblfOR3FBywgfmxT/krydFc1aH3o0iFK17IXO7JC672OGVbLwafizm7sb
X-Received: by 2002:ad4:5d64:0:b0:56e:9d09:5150 with SMTP id fn4-20020ad45d64000000b0056e9d095150mr14296955qvb.15.1678708063160;
        Mon, 13 Mar 2023 04:47:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708063; cv=none;
        d=google.com; s=arc-20160816;
        b=pOViSd9qZcH7l6NKWy8gB1WfK7UxHFBBhdaHD1fmo+Yrt1AxzqArYz36a6pi+W0RCo
         5IW1Pnm8QJlpx6JFhvQP1qfabgnlFW+Jc6W41Km7pljGGKAQy3ssbJR31RqYTF0iS+3R
         6G/tYRQrW6U+o1V6c1Ux6enfl57Vok33DyyXsdGmg+k8I0PKgAq5T00HFSCaPlBOPotx
         id/ybwnCG5XVMltj9qsOyMS8S/nqrZ3w/Mub3D4Riul+cZae/Sy02tgsxf4J2LaIhcjG
         zubXmLg9eTFL8vz6aWdKl0ofEezTf6A2lfcD8QsugkJ+XPRdoFqszmIByT5k38Uajjy3
         QtxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JZoKqTSXrt6BQL8awns9NXpQ2ZsLtrEmc/UBtlwS1+8=;
        b=DPv4gyRRgoZDYrzE8KsQ8mk4xJBTKYqEHBPo7S6s7os4Qt96bir9wmVT1KWgWX1wF/
         0EW0INuD7ZruSuQpBTItViZ7BLE1E/JlK/VMmmmPpm3t9rcxgDdoZ9wHH7GP3ZQT/b04
         onPG9maKSVsOAg18j/CF8OupqRCYu1wfafp6aa+z6FUHl6qt0LXRpdYse0Br1MSG1cMG
         dkLn94efnNf0Tlf/aM7ekK8D4S717Z/BazwHkJwzI6zz7TiajkWeVRl7a5g1ri2qPFki
         aFq/vpIlcr1n+S/k/MPDTLBvtVog7oL5Gf1pob9MEWLMXF7P+dYJEe/CjJmZ+j+pctzu
         E7zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="O/Yzv8C/";
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id v2-20020a0c8e02000000b0057115385fd0si5334564qvb.373.2023.03.13.04.47.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:47:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="O/Yzv8C/";
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JZoKqTSXrt6BQL8awns9NXpQ2ZsLtrEmc/UBtlwS1+8=;
	b=O/Yzv8C/z1hTx+wAZqIImZ3PCRBpzOxtZIn9AsFZzsyeSzoqVZplZDrNl95XOlEDiwlyTu
	I16E5WFDRzMaggLMYFSUhCckKBOkgNnxOaSMCBTG32Pz2YE3tQt9Vm+eSlE0FXmY8KPHRD
	Z+naUIYtaZuRtnKmzXwKcjmUlM0PnPo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-_1oiLSXrPTmx5ds_KLVf8w-1; Mon, 13 Mar 2023 07:47:38 -0400
X-MC-Unique: _1oiLSXrPTmx5ds_KLVf8w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2614A3828887;
	Mon, 13 Mar 2023 11:47:37 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BC1A400F4F;
	Mon, 13 Mar 2023 11:47:35 +0000 (UTC)
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
Subject: [PULL v2 10/25] main-loop: remove qemu_fd_register(), win32/slirp/socket specific
Date: Mon, 13 Mar 2023 15:46:33 +0400
Message-Id: <20230313114648.426607-11-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-TUID: RhjIONIKwXaB

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
