Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2645801ejb;
        Mon, 20 Feb 2023 13:50:52 -0800 (PST)
X-Google-Smtp-Source: AK7set+K3z0Dmn5NSz6OI40jbzxMTTebdi0+waUmsV6obPbV12XCEwRxRnH8rlfIoCF5Fd4eYf1n
X-Received: by 2002:a05:622a:1a86:b0:3b8:68df:fc75 with SMTP id s6-20020a05622a1a8600b003b868dffc75mr19640748qtc.31.1676929851859;
        Mon, 20 Feb 2023 13:50:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676929851; cv=none;
        d=google.com; s=arc-20160816;
        b=un988X3211wzWqt784sNH+e/tbFDx3ExH7nmdJRSUe3KGN3CeYVM9payOxf4bMvI5/
         u5YSWKdEHfHM3Np1c63veIXqN6E9F8wNw3SRHza8uBGLjGu0ga1JLSYTSTc6YaO0wvh9
         RJLqY8BgXCvftIJbsbbtyfrGKmCJqJBKG3nQRqhPOiVxfaN9okevD6SVrZHAVuYPUZ6I
         xUEU9AaeyDSOT6ilSJ0eCoPkBwyc6cyZKvXO9IokJSpVTEM0E7LP0MAWgu0xQQoOEMG9
         tOQZyqBWP6DOfPciqSVFgbXtlP+aWkfAfGYir2/GduCV0Nuc2T3UB7xfD8g3UUysdeFp
         5FCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EYUJ+dSm1+Qpjq7FR2xXuL1pVn+UustNl9pTfsiPi9E=;
        b=Q9fYh2xTDp6bksCenNFuaC0UHhsAHBQvRxcOW6GeYhZgXWuoEWqxP+L3BvKxoKSRa1
         cBMYwbKE0/c66psmzv/mjcEJ8qk2/zO3No3zeSq4VWUhehznc39MiNw4loVMXtHquSdK
         dnxBqqfca1/53uzPOQvpjHr8pufzhfex6SP/QLd6zdVMO0HDjpAsEVUY6CXRZzy8++y9
         zh7n3fzTYb10Td6zqYChx2xCt2A50EAOheYBZtInnzXDHkHa1ffOWJ2MIQJmEm9qrFe8
         kBK32BnjTbMv7MKcLW0IYKiycbqIm3GRR+Y2lJYsofcBjtigXY7XMKErVw+GyVwNjULI
         FKLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="El8/rTl+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z28-20020ac8431c000000b003bd15ffddfbsi589467qtm.214.2023.02.20.13.50.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 13:50:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="El8/rTl+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUE2w-0003dA-Or; Mon, 20 Feb 2023 16:50:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE2s-0003aN-O1
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 16:50:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE2h-0007zl-9v
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 16:50:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676929781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EYUJ+dSm1+Qpjq7FR2xXuL1pVn+UustNl9pTfsiPi9E=;
 b=El8/rTl+/TdW+T/OOIghmH7Doh3PXhqedacmFb0rLr7NQ22Ub3lKzQtOBeL3iBqcttmrfG
 kGtWYGe8nZIncKuITX2cusxot3i5j1zi5SKx8BXvE7uWnK3SI6bbgkKEW700qJ9ziUQrkf
 3L14mR+h6kK/qIbL2pCk1aBdVNWNwrM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-TOFD5QvdO3CBk01bRVI7Zg-1; Mon, 20 Feb 2023 16:49:37 -0500
X-MC-Unique: TOFD5QvdO3CBk01bRVI7Zg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4193F101163D;
 Mon, 20 Feb 2023 21:49:36 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80C62400EA89;
 Mon, 20 Feb 2023 21:49:35 +0000 (UTC)
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
Subject: [PATCH v2 08/15] aio/win32: aio_set_fd_handler() only supports SOCKET
Date: Tue, 21 Feb 2023 01:48:52 +0400
Message-Id: <20230220214859.3792171-9-marcandre.lureau@redhat.com>
In-Reply-To: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
References: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-TUID: WpM2b1PBEmse

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
2.39.1

