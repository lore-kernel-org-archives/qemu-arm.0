Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1426914njb;
        Thu, 6 Feb 2025 01:54:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWzR8hTtUC08LZC3K7xjSnlh9WvgOR2R6pkloUFrrM778id9Vjm+5+xPjeT35jzoGY08gnN2DcsXCynlQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHIw850jUdSko7pBpb0JfXdM1PwtlTalDHVT9Hidw/x8qE/eTaJXSn5XNfEaMU3zLz1qcmX
X-Received: by 2002:a05:620a:45a8:b0:7b6:c4c7:ecfe with SMTP id af79cd13be357-7c039f97fc1mr788314885a.4.1738835654670;
        Thu, 06 Feb 2025 01:54:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738835654; cv=none;
        d=google.com; s=arc-20240605;
        b=DcJIhag4Mi8DFVnsGwnEEKrHfAE0eGSDuLQ5qp8/6DFLh/HBeYG9mvrjoSSidEmQ2y
         Gv99plpps3qw6cN0UrH16epAOfIs7IitrNj3/UoVApx7u3npp5D6rGm1Y+CUtgo7q6e4
         46YGXc3JbzE00s1uCy64KtWHZD+4lWU2fQ6fXg4MOHfUHHD4KMZtDaB4dIfSc96p4tU9
         fayCoTjeADb40UANUDPX2g1dMS+wdkBR4p0B9Saf/PSsmHtUoHQJIZL9kq6Zpapq4YNq
         A1+6i85IFc29jzeE6/jFNj3QQ9dQaXJ816IMCQw4t8hQIZCun6qsTkWGS7Pxc4EBZfK/
         EqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=X+gf9YETT0B6QSDyhb27iDPv7k09ZFq53wLlpFZ0y/s=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=OIfIOjJD0ErJ2YuKr4i+k/qfjiUCRYcnmn7PyXLDPadX+a+zQtwzGVoBaCdpqfJAA6
         /87DMhsGuk0ay9c3VC51pJMbdAnZAzUoW6jAis4WNZNrRYx1WZasdOKht2pj7/uYGQxf
         9WFJmpuKouMpMR7GsSozL7eiRnrrq8eLM5uQc6J+l0UQm6YNgclGKbHP6WiMg7hrECs9
         7GMCyuGBq7cCcVNKElYYE3J7Cu6B1QCCogziPCWt5ypKNviFDMlKhObSxZavjoSBSUqM
         0YPrE9P0V4eJns4vTtw6dwwdksMVwsUJqK8MmK3mwhn2aint4+NA2g9FUc+SHaekb6Yb
         w3+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041df4275si82731085a.106.2025.02.06.01.54.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 01:54:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfyZX-00023M-W0; Thu, 06 Feb 2025 04:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tfyZU-000215-1J; Thu, 06 Feb 2025 04:53:20 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tfyZS-00051a-J5; Thu, 06 Feb 2025 04:53:19 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Feb
 2025 17:52:54 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Feb 2025 17:52:54 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 6/6] hw/intc/aspeed: Support different memory region ops
Date: Thu, 6 Feb 2025 17:52:52 +0800
Message-ID: <20250206095253.928308-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250206095253.928308-1-jamin_lin@aspeedtech.com>
References: <20250206095253.928308-1-jamin_lin@aspeedtech.com>
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
X-TUID: BGF0+kYGiapD

The previous implementation set the "aspeed_intc_ops" struct, containing read
and write callbacks, to be used when I/O is performed on the INTC region.
Both "aspeed_intc_read" and "aspeed_intc_write" callback functions were used
for INTC (CPU Die).

To support the INTC_IO (IO Die) model, introduces a new "reg_ops" class
attribute. This allows setting different memory region operations to support
different INTC models.

Will introduce "aspeed_intc_io_read" and "aspeed_intc_io_write" callback
functions are used for INTC_IO.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/intc/aspeed_intc.c         | 5 ++++-
 include/hw/intc/aspeed_intc.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index e1e4a9fe59..e0e843201a 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -335,7 +335,7 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_mmio(sbd, &s->iomem_container);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_intc_ops, s,
+    memory_region_init_io(&s->iomem, OBJECT(s), aic->reg_ops, s,
                           TYPE_ASPEED_INTC ".regs", aic->reg_size);
 
     memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
@@ -353,11 +353,14 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
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

