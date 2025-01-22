Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp602857njc;
        Tue, 21 Jan 2025 23:09:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXo7xooMu2kwlTCagPxs6AtX3Wu7e3O1kwV9qRlhFgC5AC541NnyFJikSVwy4ie/GMpdXg8ve079LBuuw==@linaro.org
X-Google-Smtp-Source: AGHT+IHPyOD/rhyhEtfoE3JHNnic+2NL7eGIQIPwJZ4HZ1EHF7woDhLxVlE6ujWFfd8E5T+SOeu5
X-Received: by 2002:a05:620a:2628:b0:7b1:1fdd:d54f with SMTP id af79cd13be357-7be52465b85mr4787629485a.29.1737529785684;
        Tue, 21 Jan 2025 23:09:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737529785; cv=none;
        d=google.com; s=arc-20240605;
        b=O8er4O2uuxRp6lHNcLgK3zFVYjEiSsVPI3oiFPG9+MoCFKlGy63peddfpM2UNonuNG
         L2QmwoJIpdrzyyljFueVg1oFizbEWZhJbY+Mk0PkFvmHdUTwb0kOTGMUNQDm5eh5+9rN
         +Ltejv8EEfL3ZvKTiQGgVovkTx/JS41A+J73Bz3mXqgfb28AfEHAv7rTLe+zEPYEgLQb
         ufxFBsSU5ASFzXftGVZIFv6EFxgAbFU6azZCOoafQ9JaZPsBZEJbgZD8NzNfaZ0p0Q+M
         ZEFTHAOszICWNpzRiGx+PbXZfmBwZcqa+wu9acMQIzifLGBZPG172R+ySzma1X7BKiWP
         Hx2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ifvU6q0Cr9WI7jkOBvYCbrw0QaRB0v618Dxm7o9kGgE=;
        fh=rUeyU+BbrGdRAhsHub8oikiM7LTe5FC1AGrGcPOqQqQ=;
        b=XI1ubl2X59EeSeM8mkRbHRrOWH/h56yIMigf+0l8UfxUo8UCdJkGlaLpDSJffYvqqW
         Kcez2IcWZG5zD9lvBYIxSXxWCrAXHtvLiPyMTxOLddB8fHDriYI686XXwSIdAJqQ26Qv
         /PXeAm/UM8kbYmUHHY+7/XbMhJBn6ultRZMmJJCwVYvz6cyY4o4omlqxWsEjbL/zkgtx
         85ozHvIJIYVdNr+Iu2J3NOm/DI9BiQFK5ZUZyIh5N7gI8wiq5pj2PF3khPqzGes9qhFu
         gfO/SAURWmBxvB9gntGubxmrdQ9upGtsVexjChcz2zy4ktJmF4mG7Kzb9iBnnQQZpZDU
         c6qg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="JiX/5tbH";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be614cbff5si1449271085a.403.2025.01.21.23.09.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 23:09:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="JiX/5tbH";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1taUro-00053i-Q9; Wed, 22 Jan 2025 02:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taUrg-0004ty-64
 for qemu-devel@nongnu.org; Wed, 22 Jan 2025 02:09:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taUre-0008MS-GC
 for qemu-devel@nongnu.org; Wed, 22 Jan 2025 02:09:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737529765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ifvU6q0Cr9WI7jkOBvYCbrw0QaRB0v618Dxm7o9kGgE=;
 b=JiX/5tbHGAlteHP3Ih84XneCZGs3ZrfOWJfgpw9HyO/eU39tVMISd6ajPlPa2czbWRt/it
 R5HkVyDdG2hzA5KugjrqxmjWROcDPqkHsA0gT6DpuQOSXx3axDGAz65HIqFHqDOBcQt7BL
 nxnzgzPyb+NrasKpAMJ/LpNFx3A9uek=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-48-10Ns6XEVOne-piBszQVrFg-1; Wed,
 22 Jan 2025 02:09:22 -0500
X-MC-Unique: 10Ns6XEVOne-piBszQVrFg-1
X-Mimecast-MFC-AGG-ID: 10Ns6XEVOne-piBszQVrFg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8F466195608B; Wed, 22 Jan 2025 07:09:20 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.154])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1CBA23003FD1; Wed, 22 Jan 2025 07:09:15 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Kenneth Jia <kenneth_jia@asus.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 1/9] hw/arm/aspeed: fix connect_serial_hds_to_uarts
Date: Wed, 22 Jan 2025 08:09:01 +0100
Message-ID: <20250122070909.1138598-2-clg@redhat.com>
In-Reply-To: <20250122070909.1138598-1-clg@redhat.com>
References: <20250122070909.1138598-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.086,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lU52LZqkj/lH

From: Kenneth Jia <kenneth_jia@asus.com>

In the loop, we need ignore the index increase when uart == uart_chosen
We should increase the index only after we allocate a serial.

Signed-off-by: Kenneth Jia <kenneth_jia@asus.com>
Fixes: d2b3eaefb4d7 ("aspeed: Refactor UART init for multi-SoC machines")
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/r/5f9b0c53f1644922ba85522046e92f4c@asus.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a18d4ed1fb10..2662465ada4f 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -364,11 +364,11 @@ static void connect_serial_hds_to_uarts(AspeedMachineState *bmc)
     int uart_chosen = bmc->uart_chosen ? bmc->uart_chosen : amc->uart_default;
 
     aspeed_soc_uart_set_chr(s, uart_chosen, serial_hd(0));
-    for (int i = 1, uart = sc->uarts_base; i < sc->uarts_num; i++, uart++) {
+    for (int i = 1, uart = sc->uarts_base; i < sc->uarts_num; uart++) {
         if (uart == uart_chosen) {
             continue;
         }
-        aspeed_soc_uart_set_chr(s, uart, serial_hd(i));
+        aspeed_soc_uart_set_chr(s, uart, serial_hd(i++));
     }
 }
 
-- 
2.48.1

