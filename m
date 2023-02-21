Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3216844ejb;
        Tue, 21 Feb 2023 04:49:42 -0800 (PST)
X-Google-Smtp-Source: AK7set9pIgkA7j9LU0u7H8KFzK7TTQBwJuU4a/8GDicEkAWoPJ5H/5IWYPjcEtpM2UxcBTj/pKRA
X-Received: by 2002:a05:622a:d6:b0:3ae:189c:7455 with SMTP id p22-20020a05622a00d600b003ae189c7455mr23336644qtw.47.1676983781907;
        Tue, 21 Feb 2023 04:49:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676983781; cv=none;
        d=google.com; s=arc-20160816;
        b=lqF6RtBzwNzUjTuTqXd4Oc0Ox7z1puRRpmqdMcKff5Wp5RP0dmg9FbtC6J6YGNrEl/
         CiOSnYEhAWnyLuTovZOoVjjiq24vNWONqsmtsDaTcLDSeY6QGwML/z0OgnxTvapMWW+m
         21DFf7bE5SDi9xDszs4mUVFPCmyY1w44nglbh4Awx9c6H+Ybmfnird1ePOdBuMYqaevR
         E+3kGINLkDZ+GkvpmL+CAyToA+pKJVqU4e8OI5qnMFXjmOCpL4F/IXcbETNBteKLCB70
         EntfuGed5eRiUVwExAhTrxXR8SPVhNwhkEpsGK2vjXDe9J1gTvb4xJ7R9Fl8Nn1DBXaS
         gtmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RgHAk8J3WC5f5nCpV9Uu90B+hmnbTcUrHHE7USZDPG4=;
        b=BIyjukQzlim+79qhrY/9BznI4m3pffOrOEOZ67lwKQHJqaDbEezuxtThqagQ31elht
         VRtoFxhpPBgxf4nAbWMsT5D8jhGOkR88bxiqnSoZEHIoXZnitojED8MAol97t4GdjRlq
         yGhlJqsLjnQSXOz/jsgL+nE30yOaDT3/BBoAcqu7v6SYhQSAPV3cNMET6a7FPiXz9+t1
         ytXLKa7rEZQ0i9LSc81kYz3NuWEZWeAWUNlcpLVRHfax9BA59TKdgToHDBEMX1X4RFMd
         uwHppwaetJzzdWV7chGRoxctlMI5+ldhzgZ74nUp14c/o5bxNy6tSHTIwv/xCSzzEwik
         7dSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PD2lejvA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1-20020a05620a290100b0073b50349bbfsi13064083qkp.155.2023.02.21.04.49.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 04:49:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PD2lejvA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUS5F-0006iZ-TU; Tue, 21 Feb 2023 07:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4p-0005Y5-WE
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 07:49:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4n-0007yv-Kn
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 07:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RgHAk8J3WC5f5nCpV9Uu90B+hmnbTcUrHHE7USZDPG4=;
 b=PD2lejvAHd0VcLti3nB8AZDyerqiUqDh14oxri6lfIh5YUwayHwm+aSSVSAqonAv6Gnf2f
 +QG8c3xFp2LswXGWnCvZ/GS479q8Y1zm1Z3yRwvFM3UMN8NH121Bv5u6LpBYkYOTOSIwRx
 64HWVa39liVhjF8+iD+EYhl0LyGEZCg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-BCpOJyhtO424FD3niYbKuQ-1; Tue, 21 Feb 2023 07:48:53 -0500
X-MC-Unique: BCpOJyhtO424FD3niYbKuQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E1F21C04B64;
 Tue, 21 Feb 2023 12:48:53 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 320EB1121314;
 Tue, 21 Feb 2023 12:48:51 +0000 (UTC)
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
Subject: [PATCH v3 11/16] main-loop: remove qemu_fd_register(),
 win32/slirp/socket specific
Date: Tue, 21 Feb 2023 16:47:56 +0400
Message-Id: <20230221124802.4103554-12-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
X-TUID: Qu/prGFXNYGY

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Open-code the socket registration where it's needed, to avoid
artificially used or unclear generic interface.

Furthermore, the following patches are going to make socket handling use
FD-only inside QEMU, but we need to handle win32 SOCKET from libslirp.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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

