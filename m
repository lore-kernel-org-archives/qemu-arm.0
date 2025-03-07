Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1939800njm;
        Thu, 6 Mar 2025 20:05:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW1olfXQoPB5yuQNa6EOp8OZ56NJ0lhSpsLeWeef//2xgcXf50KQFbdTz7sPEH8alzksDUTvNUopWIdMQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEPmYmao3zCoS9DxE89QKpXGpI7oBhd0ZmXxd6nrrWDo523rzEMDR7qYfSagOoCNnZWTZR/
X-Received: by 2002:a05:620a:2b4a:b0:7c0:b9f3:bd1d with SMTP id af79cd13be357-7c4e61b703amr311567085a.45.1741320355531;
        Thu, 06 Mar 2025 20:05:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741320355; cv=none;
        d=google.com; s=arc-20240605;
        b=WkVphSoeUP+uzvv5rKi/575EchDJIqJIzRt5ayT/Vv7eq/jzbGdDnfCkY3dYybFKLB
         zoefD7xurMIFcF8FJiDop8NEeTpp2CJE8IpBgMbC6vlBcKOisco/Wbu6/hS+jhljD1Cs
         PkqbePqtFZ5iK4/CDCwuGjkh+UQIOQo7v3lJ6BrSX9x1Zl1ZdTXWPVwgXmH6Vd8WTQhZ
         cAotu37E2iXDWwKuEG8RkL3x/v84ggNp0lQ7Df2sntMPlUJIXWdkGaHRsge3jo80vgAn
         mc/8jJ3vDf5aNjd/X/JG4INz+rHOMLbGlOMHPZh3PFI19dzXqA+2n7y749d39k6sNuH2
         txOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=/ot0zyV72H6IGBkXkWIN1mFDDUSBomsEBS7etyPVEG0=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=bjnw1K7pB2CApFmXRWlpZWME04kxPnUELCBzXsuwn66r8lS9EJRlJUrZqmxi5csBEk
         4aYsfw9KlgBYFaYyyaM7MFuSIhvxJo4nIfQccA2K29zEf2ifAv+ZJO2A8vj436THl288
         I5hRC558vVMRlJtZOksVg5x2IIpqPnzmhCs2SEy+x+/ayKB850x+EL8CiOlDIQfz4Q7+
         QZ7P1kFD7gC+YjkWMcsNO53M+wYVwGYKC3aHWeXtmYXg7dq33txP49fzgahxbnrUYHCO
         DgfII7nJUSBObMxl+BQyTopZ7Yoz/0iokCW4yPhpNc6jQAaR2umWT0M0mpm2rup7jbaj
         eGyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e556f39bsi278594085a.593.2025.03.06.20.05.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 20:05:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqOsj-0007o5-Gi; Thu, 06 Mar 2025 23:00:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOse-0007lL-9p; Thu, 06 Mar 2025 23:00:12 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOsc-0004jN-IG; Thu, 06 Mar 2025 23:00:11 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 7 Mar
 2025 11:59:49 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 7 Mar 2025 11:59:49 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v6 10/29] hw/intc/aspeed: Support different memory region ops
Date: Fri, 7 Mar 2025 11:59:19 +0800
Message-ID: <20250307035945.3698802-11-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
References: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: edDxjYGEDAf/

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
index 208e764c4a..3433277d87 100644
--- a/include/hw/intc/aspeed_intc.h
+++ b/include/hw/intc/aspeed_intc.h
@@ -43,6 +43,7 @@ struct AspeedINTCClass {
     uint64_t mem_size;
     uint64_t nr_regs;
     uint64_t reg_offset;
+    const MemoryRegionOps *reg_ops;
 };
 
 #endif /* ASPEED_INTC_H */
diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index d06e697ecc..d8ee6e1c04 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -332,7 +332,7 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem_container);
 
     s->regs = g_new(uint32_t, aic->nr_regs);
-    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_intc_ops, s,
+    memory_region_init_io(&s->iomem, OBJECT(s), aic->reg_ops, s,
                           TYPE_ASPEED_INTC ".regs", aic->nr_regs << 2);
 
     memory_region_add_subregion(&s->iomem_container, aic->reg_offset,
@@ -359,12 +359,15 @@ static void aspeed_intc_unrealize(DeviceState *dev)
 static void aspeed_intc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedINTCClass *aic = ASPEED_INTC_CLASS(klass);
 
     dc->desc = "ASPEED INTC Controller";
     dc->realize = aspeed_intc_realize;
     dc->unrealize = aspeed_intc_unrealize;
     device_class_set_legacy_reset(dc, aspeed_intc_reset);
     dc->vmsd = NULL;
+
+    aic->reg_ops = &aspeed_intc_ops;
 }
 
 static const TypeInfo aspeed_intc_info = {
-- 
2.43.0

