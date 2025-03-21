Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp178455njc;
        Fri, 21 Mar 2025 02:28:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLZPYXFU4DZGFofFOxzlJpbr4lrDVj4gu8MQ3QFXKtFqbi69JrS7nP06o1xl7+ngWgD6/bA38EHCOipQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG18jnku+MEyReVtOBUa583hFucHwINFJefXZ0vBASdCqfARn55sNuWVW41KErRY+mVtqL5
X-Received: by 2002:a05:620a:45aa:b0:7c5:55f9:4bcb with SMTP id af79cd13be357-7c5ba190bf1mr354646985a.31.1742549292762;
        Fri, 21 Mar 2025 02:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742549292; cv=none;
        d=google.com; s=arc-20240605;
        b=E/L1o2Nh2Kd3E8RoNBAMF4d7wOY263lNGVMK8k/6PZZgL0scQxG1/fdD8/R8bDK34K
         1R11jakBtUF57wTTRuaKvOHYI/eDdTLWcYArv6CCZgkpghX6I5u4X3Vl84lqAhGBL4um
         l6ZswhbJuXjqMBTLKSMdZYJNDR0e0qwmLxqrvw4EsYtjqAejZLLNYS+LsOKv3P0FEScz
         LUsGQWG7p56DsFu+ltCFoLIWTYkT9czQsZBxTPupqRQKuRQGKplJbWGi2B6hTTVFTGMc
         RvUPsCUuhDkWg+Qstc89B5hSpubeAIGwZMrWDsJaNlViQcfUkie6VIuoxFRf3DaBWygh
         Pw/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=inpvI2tLmMmJRYewBkqsi55iju6JfoXM08iq6C9L6lY=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=M2LR6+1zMjcguBIgl8nRRDnBa8E8ZHpmI1tQYhjNemUx5ItIUdvFPHc9oZAhWjj/sv
         lanr5GuHUkQHgyIEG9fsWvoR+XrNpZ31ippZVhgT7kYswQ2E5cIMf9vWWSPo7zDovlMY
         7uH2dvvurP6KWFO37huvcwZbCvvCbk5YLbUKJlMhuxZTFL4aOUD+JBBxH+lXY3hFMD2G
         CGj7tGiROWTW76QR2fwK18WEbYP6Oh+L5eTO9l2f0dxKvhWQCWBTAVj1jZCdYgG4xUE+
         B6yCJ/NvTGuHN8xahRxAx7zs9RqWJPKjsefM7n1+y2Pbxbo5bysc0OedrzMRyD8g8QRh
         FNig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b9354ff7si153428385a.329.2025.03.21.02.28.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 02:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tvYez-0006vq-8r; Fri, 21 Mar 2025 05:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeR-0006TC-SQ; Fri, 21 Mar 2025 05:26:51 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeP-00056m-Fi; Fri, 21 Mar 2025 05:26:51 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 21 Mar
 2025 17:26:27 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 21 Mar 2025 17:26:27 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 10/22] hw/misc/aspeed_hace:: Support setting different
 memory size
Date: Fri, 21 Mar 2025 17:26:06 +0800
Message-ID: <20250321092623.2097234-11-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
References: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0hNdjoHD6oe7

The memory size was previously hardcoded to 0x1000 (4K). However, the actual
memory size of the HACE controller varies across different models:
1. AST2400/AST2500: 0x1000 (4K)
2. AST2600/AST1030: 0x10000 (64K)
3. AST2700: 0x100 (256 bytes)

To address this, a new class attribute, mem_size, has been introduced to
dynamically set the appropriate memory size for each HACE model, ensuring
correct allocation across AST2400, AST2500, AST2600, AST1030 and AST2700.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 include/hw/misc/aspeed_hace.h | 1 +
 hw/misc/aspeed_hace.c         | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
index 58fb66009a..db95f2fd4b 100644
--- a/include/hw/misc/aspeed_hace.h
+++ b/include/hw/misc/aspeed_hace.h
@@ -53,6 +53,7 @@ struct AspeedHACEClass {
     uint32_t dest_hi_mask;
     uint32_t key_hi_mask;
     bool has_dma64;
+    uint64_t mem_size;
 };
 
 #endif /* ASPEED_HACE_H */
diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index d4f653670e..53b3b390e3 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -463,11 +463,12 @@ static void aspeed_hace_realize(DeviceState *dev, Error **errp)
 {
     AspeedHACEState *s = ASPEED_HACE(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    AspeedHACEClass *ahc = ASPEED_HACE_GET_CLASS(s);
 
     sysbus_init_irq(sbd, &s->irq);
 
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_hace_ops, s,
-            TYPE_ASPEED_HACE, 0x1000);
+            TYPE_ASPEED_HACE, ahc->mem_size);
 
     if (!s->dram_mr) {
         error_setg(errp, TYPE_ASPEED_HACE ": 'dram' link not set");
@@ -521,6 +522,7 @@ static void aspeed_ast2400_hace_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "AST2400 Hash and Crypto Engine";
 
+    ahc->mem_size = 0x1000;
     ahc->src_mask = 0x0FFFFFFF;
     ahc->dest_mask = 0x0FFFFFF8;
     ahc->key_mask = 0x0FFFFFC0;
@@ -540,6 +542,7 @@ static void aspeed_ast2500_hace_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "AST2500 Hash and Crypto Engine";
 
+    ahc->mem_size = 0x1000;
     ahc->src_mask = 0x3fffffff;
     ahc->dest_mask = 0x3ffffff8;
     ahc->key_mask = 0x3FFFFFC0;
@@ -559,6 +562,7 @@ static void aspeed_ast2600_hace_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "AST2600 Hash and Crypto Engine";
 
+    ahc->mem_size = 0x10000;
     ahc->src_mask = 0x7FFFFFFF;
     ahc->dest_mask = 0x7FFFFFF8;
     ahc->key_mask = 0x7FFFFFF8;
@@ -578,6 +582,7 @@ static void aspeed_ast1030_hace_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "AST1030 Hash and Crypto Engine";
 
+    ahc->mem_size = 0x10000;
     ahc->src_mask = 0x7FFFFFFF;
     ahc->dest_mask = 0x7FFFFFF8;
     ahc->key_mask = 0x7FFFFFF8;
@@ -597,6 +602,7 @@ static void aspeed_ast2700_hace_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "AST2700 Hash and Crypto Engine";
 
+    ahc->mem_size = 0x100;
     ahc->src_mask = 0x7FFFFFFF;
     ahc->dest_mask = 0x7FFFFFF8;
     ahc->key_mask = 0x7FFFFFF8;
-- 
2.43.0

