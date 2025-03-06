Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1386781njm;
        Thu, 6 Mar 2025 02:40:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWo4Tie+S8rVLbMnAVLxGEuQtvOGcxjVSv1zPubHz7GJSOdjO7+eSURfFlOl5gzYjqhLpTpyIOj3Z5cfg==@linaro.org
X-Google-Smtp-Source: AGHT+IGvCfv3bFTVVica9OUTtvlzF4Y/dZlc/sMmBSqLWMMPnKr1yCtjAikSE2uJGIO4dLuqXL2l
X-Received: by 2002:a05:6214:2487:b0:6e6:646d:7550 with SMTP id 6a1803df08f44-6e8f4783ebamr45624186d6.19.1741257623514;
        Thu, 06 Mar 2025 02:40:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741257623; cv=none;
        d=google.com; s=arc-20240605;
        b=iENByTqeRKczk/8z2Ts/5ycONpd+npYLhcCRz8dcSPFxuNt2sgyYUk5BRNbGnPLhs8
         mgoM7al8pEESi69JQIrQdJe1/rE0r3aky4uHn7GUdMCeLXUAQtP9lk9MOqPDnMhExWYz
         Nh0N+DwKtSklSh2WCCRSNj8n8xmLOop3FjcMadthMKLBeiYUxvpxVSOuqtF2wglh+XIu
         ySeefqR/5JS6qRdK9myqI4SS5gKmodOFCgehlv8NxERQBqO6TIeZjsVztZ1iWXiFOW/4
         oK5U0wtRjogx5fPXsisH4BcFYYxE5VCb4RFL5An1RTh4VghQkPXS71PQ+bkauyzJKHRg
         Higg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=9wiI4d1WFGOkPlqftbfVq9uvv5+ythemDL5SAZ2rppo=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=eYQJQMcXycPQFtnkgaja3moKDtN1nbP3Q8vzRfTnD1Mo9y2FvGjum7J0UmZcidA8c7
         enLLV6aXij20Q0kQcqnsWGzne9hUTzCpbuMct+xx2d3BfJVfmbuJPHciRvj4haDjnHA1
         klT9IDk3odr21KH2wUxOszrAHT4XNvRsvLlXvj3YfD7685NQR2lLG9Cq76s7o3slZgU7
         C2RQhWhNQqk7iHr8QHDLieWar6dIcnXXzHH2h4gYE/G55uThFz3ihX7/1wpJYYjg6xXV
         0QrGAFmk6TrDxQL3BM/FTjK1wufsCOpZTd4CcXBQ4/jw0w/WU/lQ+VLvOMiNXypQ1S61
         dPEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f707cf00si9540166d6.24.2025.03.06.02.40.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 02:40:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tq8dB-0004pO-6e; Thu, 06 Mar 2025 05:39:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8d8-0004oJ-RA; Thu, 06 Mar 2025 05:39:06 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8d6-0000St-Tf; Thu, 06 Mar 2025 05:39:06 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Mar
 2025 18:38:47 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Mar 2025 18:38:47 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v5 03/29] hw/intc/aspeed: Introduce dynamic allocation for
 regs array
Date: Thu, 6 Mar 2025 18:38:11 +0800
Message-ID: <20250306103846.429221-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
References: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
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
X-TUID: lH+7kPN6YUd7

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
index 465f41e4fd..feb2c52441 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -289,7 +289,7 @@ static void aspeed_intc_reset(DeviceState *dev)
 {
     AspeedINTCState *s = ASPEED_INTC(dev);
 
-    memset(s->regs, 0, sizeof(s->regs));
+    memset(s->regs, 0, ASPEED_INTC_NR_REGS);
     memset(s->enable, 0, sizeof(s->enable));
     memset(s->mask, 0, sizeof(s->mask));
     memset(s->pending, 0, sizeof(s->pending));
@@ -307,6 +307,7 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_mmio(sbd, &s->iomem_container);
 
+    s->regs = g_malloc0(ASPEED_INTC_NR_REGS);
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

