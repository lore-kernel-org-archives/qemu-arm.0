Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2504087njb;
        Mon, 3 Mar 2025 01:57:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUr/hNc4AV0+5Pl9YnNgNAial8RZ5fa3ANgx0G7eK2U+pqskt9YnErRVP/NBKjA8h+Bsra87Vaw8pdWmA==@linaro.org
X-Google-Smtp-Source: AGHT+IHfEvcOu+q4IgByillWpguUmUoGHiLX6bsKVGEGv6Tapq2CB+cwfHMpqTZBx2eMldnFCv6U
X-Received: by 2002:a05:6214:e88:b0:6e1:697c:d9b8 with SMTP id 6a1803df08f44-6e8a0c80ec1mr189917316d6.9.1740995835850;
        Mon, 03 Mar 2025 01:57:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740995835; cv=none;
        d=google.com; s=arc-20240605;
        b=Sqcf2cXLTBSV5D1M7959emPU7/nfEJZ4zH1X7hhu1hojnJTCLaWft3VaApQrYWUSgK
         En2CBqLsPUSYcuXQXyJH2ubtFCbSzU4VRH/g6aso8Z1PXLVTUhqyFu39Pt/PGG+gEbX+
         O8q+BBHHGhQN6NcjA8R7nopZWN+na+JZHmkQlDGewVmC1qKcrXFsZHdwSMSPcxpBg5Hc
         SyR25gkOI3q8wKqZ+4s9FKA0lh2ww9t5RK1FU8E+dFzqFJcsfrMa2JjSH5K2rLfh9vFy
         pV37SiW+3uhmQWRMviuX5OYJYMR87iOYXEjs4BU7GmD1UGzyFL8mdM7yvIa0Yx0DJixf
         Cxpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=+3wo+cLAukvJsBE65nAvqHQe2eJ1ckrv60OuaPqAREs=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=H7ka9//nCnfaqp8N/H5iv2YODtAhgSLq8f5MStpg9m+GU88SW2hKDNODdKQDBqU8xL
         BqxanKSY3rkWwiL928kd0V2tEWUZ8tmPijkdEiwISIcLInFbPe8YoudaR2/qCHDSEKoG
         dLw8amyRZnrdP+NXIc7mtWbtHYuHWosbL34iXOjMu9L1B+Sab7+BW0StkPmLi6U/nv4m
         8kCRvlsxoXRKRDoGJo490xSeHF+QOcQCJT10WGGgpaeq+CpDYKV/pjUIGTqEMs/aavPk
         ukdC+Y2jRDapptF7mDkEip6MZbeHORbnK38smt/rjImN2G2OX95L8Q7Sfs7l7zNqRLu5
         BZeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8975e7386si82887456d6.92.2025.03.03.01.57.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 01:57:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp2Wz-0008Kk-LL; Mon, 03 Mar 2025 04:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp2W8-0007su-1Z; Mon, 03 Mar 2025 04:55:20 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp2W6-0001s3-E2; Mon, 03 Mar 2025 04:55:19 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 3 Mar
 2025 17:55:00 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 3 Mar 2025 17:55:00 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v4 08/23] hw/intc/aspeed: Support different memory region ops
Date: Mon, 3 Mar 2025 17:54:36 +0800
Message-ID: <20250303095457.2337631-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303095457.2337631-1-jamin_lin@aspeedtech.com>
References: <20250303095457.2337631-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 85VwP0DcVkCX

The previous implementation set the "aspeed_intc_ops" struct, containing read
and write callbacks, to be used when I/O is performed on the INTC region.
Both "aspeed_intc_read" and "aspeed_intc_write" callback functions were used
for INTC (CPU Die).

To support the INTCIO (IO Die) model, introduces a new "reg_ops" class
attribute. This allows setting different memory region operations to support
different INTC models.

Will introduce "aspeed_intcio_read" and "aspeed_intcio_write" callback
functions are used for INTCIO.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/intc/aspeed_intc.h | 1 +
 hw/intc/aspeed_intc.c         | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
index 18ca405336..c1fe2dd15a 100644
--- a/include/hw/intc/aspeed_intc.h
+++ b/include/hw/intc/aspeed_intc.h
@@ -44,6 +44,7 @@ struct AspeedINTCClass {
     uint64_t mem_size;
     uint64_t reg_size;
     uint64_t reg_offset;
+    const MemoryRegionOps *reg_ops;
 };
 
 #endif /* ASPEED_INTC_H */
diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index e94ebb6f4e..90658ffb59 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -346,7 +346,7 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_mmio(sbd, &s->iomem_container);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_intc_ops, s,
+    memory_region_init_io(&s->iomem, OBJECT(s), aic->reg_ops, s,
                           TYPE_ASPEED_INTC ".regs", aic->reg_size);
 
     memory_region_add_subregion(&s->iomem_container, aic->reg_offset,
@@ -365,11 +365,14 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
 static void aspeed_intc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedINTCClass *aic = ASPEED_INTC_CLASS(klass);
 
     dc->desc = "ASPEED INTC Controller";
     dc->realize = aspeed_intc_realize;
     device_class_set_legacy_reset(dc, aspeed_intc_reset);
     dc->vmsd = NULL;
+
+    aic->reg_ops = &aspeed_intc_ops;
 }
 
 static const TypeInfo aspeed_intc_info = {
-- 
2.34.1

