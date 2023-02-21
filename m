Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3216731ejb;
        Tue, 21 Feb 2023 04:49:29 -0800 (PST)
X-Google-Smtp-Source: AK7set9iRGLoqM8KrDfq7QMCOgpRmP6Wk43vYCfncCymHxxn+D5oEJaAqtOyDWBa5dSxWy4ihAAm
X-Received: by 2002:ad4:5bef:0:b0:56e:9ef7:e760 with SMTP id k15-20020ad45bef000000b0056e9ef7e760mr9090801qvc.12.1676983769088;
        Tue, 21 Feb 2023 04:49:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676983769; cv=none;
        d=google.com; s=arc-20160816;
        b=qG4cWcnX5wIV4NcxA6dE4QH6VDr5rX3VRO7K/S+Nx3kCQJfolGTS4qpWGi3nGZd6v1
         GBotUVuwfuVz0/xIPk69Aa+B/e5nH4vRDy+bTh7NjNoIsdsLl5BQR+sUqwTtjbb1ANQP
         34ibW/n/mzbkuppnSREvk4DAcsX+47jRLrjb+iFVuH4x+90JW8/rPbMuh0C2GsCf9O4G
         YmCyGOLkfqudYNqHSqpS9/Ny4ppcpkNfOVOlxDRwuP7wWhh0H9DvC1Zn5ksWWbtLrI0C
         f9verZ1Vc/gg7qMPNqpmJ9agCwEH9LW8dCOHdo7rzGRS27cwFBUXrl6MVnfliMwe5Q1S
         v/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mfeScznHotqd7QR6Mu/sr37TdIAE+QzDflLW+7MhA3U=;
        b=og2cpWnKBxdojA2lZpziJo0OgJ8eQLDCTVZVXb1eXugmMSlpBaeJ/kqNkU4LK+kZs8
         4z0lool8D1/YhlPvFHjJuc74Dz+89Qo7C4VEFPKh3VKCkD4ffT8VER1vOKYLMcSrgpqo
         K7vFiZRjUc+Eq7ulqhqlqZw6Jdc5HYU47afYaIH0qbuyg/VX3R01+34pzcVPT24IRZ4R
         UNUkVx8HtioxJBdX4kzq3J1L58MrdgjwaH1fDt4c6clK117vk0DisSdrpQ8EwLd3xGfd
         fv80XlzBuxhg7BO4w4AbvpND00ozpdO0RkEOFxBhlXgQM830Qy1bFDRgGfAez/pgePJL
         SEHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ER/wfsFS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8-20020a0ce4c8000000b0056ea83d60fcsi669780qvm.366.2023.02.21.04.49.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 04:49:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ER/wfsFS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUS5B-0006Lb-Tf; Tue, 21 Feb 2023 07:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4h-0005KA-2B
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 07:48:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4f-0007wQ-Fl
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 07:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mfeScznHotqd7QR6Mu/sr37TdIAE+QzDflLW+7MhA3U=;
 b=ER/wfsFSUADzNRyHMdVRz9iQzOBd1eurSbODy9AFZfITCwP8vPh+NWUXRt6ejG3/QCJRTb
 G1pkBQOtsTZzC1S+eYXAjBg9NeQyn7qqDge1UZAFAn/5/DeCZ7NIwGw9wCnt/emoqSbgJv
 Haczxp90b6zlHqqN+VKlzFbpuGMMKqk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-psYO9uhvP_iF7hf2FexAHQ-1; Tue, 21 Feb 2023 07:48:45 -0500
X-MC-Unique: psYO9uhvP_iF7hf2FexAHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0AAF2A59541;
 Tue, 21 Feb 2023 12:48:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F24B2026D38;
 Tue, 21 Feb 2023 12:48:43 +0000 (UTC)
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
Subject: [PATCH v3 09/16] aio/win32: aio_set_fd_handler() only supports SOCKET
Date: Tue, 21 Feb 2023 16:47:54 +0400
Message-Id: <20230221124802.4103554-10-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-TUID: RRQ6OvYDSiiO

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Let's check if the argument is actually a SOCKET, else report an error
and return.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 util/aio-win32.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/util/aio-win32.c b/util/aio-win32.c
index 74d63fa21e..08e8f5615d 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -22,6 +22,7 @@
 #include "qemu/sockets.h"
 #include "qapi/error.h"
 #include "qemu/rcu_queue.h"
+#include "qemu/error-report.h"
 
 struct AioHandler {
     EventNotifier *e;
@@ -70,10 +71,14 @@ void aio_set_fd_handler(AioContext *ctx,
                         IOHandler *io_poll_ready,
                         void *opaque)
 {
-    /* fd is a SOCKET in our case */
     AioHandler *old_node;
     AioHandler *node = NULL;
 
+    if (!fd_is_socket(fd)) {
+        error_report("fd=%d is not a socket, AIO implementation is missing", fd);
+        return;
+    }
+
     qemu_lockcnt_lock(&ctx->list_lock);
     QLIST_FOREACH(old_node, &ctx->aio_handlers, node) {
         if (old_node->pfd.fd == fd && !old_node->deleted) {
-- 
2.39.2

