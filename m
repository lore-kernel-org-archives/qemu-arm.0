Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1938501njm;
        Thu, 6 Mar 2025 20:02:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUnNQHdIbxhm/r8MRe41giHXci8iNKbhF7nxqO9TAs/50IQ90Fwpw3KFgFGGF25NzBOvF+YsWUr/lBqfw==@linaro.org
X-Google-Smtp-Source: AGHT+IEQHRl2SrdARApIeLP33HVUzcqnyZDV/PT4Mxlc34lTScir3IMhQaIjMAuQsF5UmGtQ2FQY
X-Received: by 2002:a05:6214:519a:b0:6e8:f9a9:397b with SMTP id 6a1803df08f44-6e900636da3mr23603036d6.15.1741320160922;
        Thu, 06 Mar 2025 20:02:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741320160; cv=none;
        d=google.com; s=arc-20240605;
        b=KpYx7H6WWxBY5aglrUhvJGdf6FLD8emifgp/Or6CMYbc8EbMWO0MtwPcS8Lz7d/EuB
         IY2ey+Yj6BkDXP0k7VNT11QJ8HYltnXoa/jw2XtoAitb/JaQYEGfOoj3hoqRRv/mEW4P
         oLhxKFymIqVkOqu0js2XdknzcOdwKX78F3yURrblYIT96EHz26uEYCXMANpRENj43PSy
         62UFRg4HxkYmsOSMBRjynYyvR8BKychsHkdgLdcKN5BI4Sxg/a19RUa9FxN18vikSbYI
         xz9QLsuf7fEQ/1P2XGTA/zo5kWtxFad7/yecldXsiv3228Eh1XmCPFF29BnZdLj4UZPa
         jh1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=pFmp7glS0PpQZMrJDxT1M4TSR01gDF/pU/a5M7kUfrs=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=jk/Ih3OgNn2lsjwjMpetBhseTUC7tPtTOH7TbeWCg8NYZkDF19xp4SlhuJ8BtrJPYK
         bvHuzNxbppX/4LXfkD0AfSPhQ71IVePT123o9UppWnZrRAP041dGoO7w0C8hHJUiAfWJ
         wuzkQgtTbujM1QFFelcbTb+KA895l6Ofqx58QCj4Q9jVo15CcJQWqtBYf3oUQMuGEP1r
         s5GeAKBR+/XpbSPiWYM5Cn870O1AYe1rt2qa0fRbpr++KTiJ9kDevksh6m3tHsIzDoTb
         AFjosovq51fTBRMDULX5uHEib9L2ZCQnmHzR9dPW8+RPWMOBD0AUMefIG1MjScbUyhuf
         9WfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f74881aasi25215776d6.511.2025.03.06.20.02.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 20:02:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqOsa-0007ht-8P; Thu, 06 Mar 2025 23:00:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOsU-0007bC-3L; Thu, 06 Mar 2025 23:00:02 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOsS-0004iq-0E; Thu, 06 Mar 2025 23:00:01 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 7 Mar
 2025 11:59:46 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 7 Mar 2025 11:59:46 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v6 03/29] hw/intc/aspeed: Introduce dynamic allocation for
 regs array
Date: Fri, 7 Mar 2025 11:59:12 +0800
Message-ID: <20250307035945.3698802-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
References: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: kE0DyB5exKOt

Currently, the size of the "regs" array is 0x2000, which is too large. To save
code size and avoid mapping large unused gaps, will update it to only map the
useful set of registers. This update will support multiple sub-regions with
different sizes.

To address the redundant size issue, replace the static "regs" array with a
dynamically allocated "regs" memory.

Introduce a new "aspeed_intc_unrealize" function to free the allocated "regs"
memory.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 include/hw/intc/aspeed_intc.h |  2 +-
 hw/intc/aspeed_intc.c         | 12 +++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
index 03324f05ab..47ea0520b5 100644
--- a/include/hw/intc/aspeed_intc.h
+++ b/include/hw/intc/aspeed_intc.h
@@ -27,7 +27,7 @@ struct AspeedINTCState {
     MemoryRegion iomem;
     MemoryRegion iomem_container;
 
-    uint32_t regs[ASPEED_INTC_NR_REGS];
+    uint32_t *regs;
     OrIRQState orgates[ASPEED_INTC_NR_INTS];
     qemu_irq output_pins[ASPEED_INTC_NR_INTS];
 
diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 465f41e4fd..558901570f 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -289,7 +289,7 @@ static void aspeed_intc_reset(DeviceState *dev)
 {
     AspeedINTCState *s = ASPEED_INTC(dev);
 
-    memset(s->regs, 0, sizeof(s->regs));
+    memset(s->regs, 0, ASPEED_INTC_NR_REGS << 2);
     memset(s->enable, 0, sizeof(s->enable));
     memset(s->mask, 0, sizeof(s->mask));
     memset(s->pending, 0, sizeof(s->pending));
@@ -307,6 +307,7 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_mmio(sbd, &s->iomem_container);
 
+    s->regs = g_new(uint32_t, ASPEED_INTC_NR_REGS);
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_intc_ops, s,
                           TYPE_ASPEED_INTC ".regs", ASPEED_INTC_NR_REGS << 2);
 
@@ -322,12 +323,21 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
     }
 }
 
+static void aspeed_intc_unrealize(DeviceState *dev)
+{
+    AspeedINTCState *s = ASPEED_INTC(dev);
+
+    g_free(s->regs);
+    s->regs = NULL;
+}
+
 static void aspeed_intc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->desc = "ASPEED INTC Controller";
     dc->realize = aspeed_intc_realize;
+    dc->unrealize = aspeed_intc_unrealize;
     device_class_set_legacy_reset(dc, aspeed_intc_reset);
     dc->vmsd = NULL;
 }
-- 
2.43.0

