Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp344702njc;
        Wed, 12 Feb 2025 19:38:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFIuUxCLFrCHPh+x2I+FTRtRHXdWUm5RGW54pMvL+SkNV9QBoch1Zl6AzzwYlZCiYHcpSaSRTwoypHkA==@linaro.org
X-Google-Smtp-Source: AGHT+IG7WtZBZlBBMxNIaHPCbcV9WYxg1QoRcaa79gBNfJYNjCnTTZG7d8oj89qhfB1BfrOPuVdi
X-Received: by 2002:a05:620a:4042:b0:7c0:679f:f4cf with SMTP id af79cd13be357-7c07a1cf678mr360308685a.40.1739417889441;
        Wed, 12 Feb 2025 19:38:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739417889; cv=none;
        d=google.com; s=arc-20240605;
        b=T6HPK79TGk1qZqgjNgsazu6sGKM1hW0I+lXWOiyuYhIAyD5TCMlmzHo2XLLimECleJ
         AunN1coYn8DbFKE/kev1E5xqHIJ3vMmi1UomH9SdKiYztixJgES0tfw1Z+u7+s4dJNXR
         bDbsaQt7zeZ+7O5guaf0hNv9o2ijWglg+PtjXWVXz8gUkZ3e5r/NH6HavUUgTrGEW5ox
         o+vFYApRruWDZ5dS9DxDwL1A85qWmdQAyzgNol9tDX4D0QOrtJVv9yVNAp5Xk4wMYVPg
         CEMOnTbVy+xbQrgoIsA247xNpgCrggdKv2kyHLYhUmqCZj00H79h7Lq0CK6P98TLlNCw
         +/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=MjMaLAE7qydB6/nZ1diFusBT4eXLog2cOspq43XMvqc=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=Dk4Am8tjP7nYMvUMe79DCe0p3W/j3zgH5V67owo9JdY+LqT2eG+Y6BRw6oT9iLLTCQ
         NWsbuv+jXj+X0Gz9PMANpsVOYuU3oxioT9pMEuZtKJkA29sSmDnQhCsY7R1wxRMG1iyN
         5uM1wkDM+oQix5PwI0rRVzsTqb+EoinMk2MO5TbJiBs610h/qq1kUmr1B/QQmULPmbEO
         HxMmKd+09Y+7dLHcoT12Veqi3qFNixfDC1TSKViUwdBvf4MJMRuP9co2oXWWMnBkb8QM
         TqBa/KwEQQUsNlUFqt+uhJzpeL8B3U88TxRLjAuiAQaIczYJOU0eqquHaJmqeoFW5iJE
         kPsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c07c622920si51473085a.122.2025.02.12.19.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 19:38:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiQ1M-0007Ej-5N; Wed, 12 Feb 2025 22:36:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ14-0007A9-RW; Wed, 12 Feb 2025 22:35:54 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ13-0000hG-I8; Wed, 12 Feb 2025 22:35:54 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Feb
 2025 11:35:34 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Feb 2025 11:35:34 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 06/28] hw/intc/aspeed: Support different memory region ops
Date: Thu, 13 Feb 2025 11:35:09 +0800
Message-ID: <20250213033531.3367697-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
References: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
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
X-TUID: OwgRBgfkBtsI

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
---
 hw/intc/aspeed_intc.c         | 5 ++++-
 include/hw/intc/aspeed_intc.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 91d8edb261..cc2426fbac 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -340,7 +340,7 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_mmio(sbd, &s->iomem_container);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_intc_ops, s,
+    memory_region_init_io(&s->iomem, OBJECT(s), aic->reg_ops, s,
                           TYPE_ASPEED_INTC ".regs", aic->reg_size);
 
     memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
@@ -358,11 +358,14 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
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
diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
index ecaeb15aea..749d7c55be 100644
--- a/include/hw/intc/aspeed_intc.h
+++ b/include/hw/intc/aspeed_intc.h
@@ -43,6 +43,7 @@ struct AspeedINTCClass {
     uint32_t num_ints;
     uint64_t mem_size;
     uint64_t reg_size;
+    const MemoryRegionOps *reg_ops;
 };
 
 #endif /* ASPEED_INTC_H */
-- 
2.34.1

