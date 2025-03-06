Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1386876njm;
        Thu, 6 Mar 2025 02:40:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXy9rYh4wKrU5RG/+OeHr8/hRfdGU/xz9yGXBO8dgZiMPMJvBAzNwMZmSEmA+9crotOMfMxv6z8Y1wf+Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFqNc7mkY5AJFgP2O25p3sbZsZ1WcplIoAt9SqqWm5tqTqD1WP65hJwrFzwnKtn2Cjl/fpj
X-Received: by 2002:a05:620a:269e:b0:7c0:a70e:b934 with SMTP id af79cd13be357-7c3d8e46626mr1122850385a.7.1741257634760;
        Thu, 06 Mar 2025 02:40:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741257634; cv=none;
        d=google.com; s=arc-20240605;
        b=Fl95KwX/QL3Z4j75AM4oEtoMeXNUlTejyg35GD87LECNSSqPZUfo64bO4ohhfjdP/a
         1xzu+BHUryilNl7/nY4Bmua1ZBH9uTtkORqW9p9nsk+rH2oCtaQ04Tt+GSoco9ffIFKq
         NO4wvpfMlbsA2nVBbMBp9QpaM5VhWZvhfDKcKf27EMz6EdaaWED+cTScRKmZIh2CLM9U
         Io5DkCTnENyHa150DGMmeA60cRHUl+xURMVZ3p4zbizdEP3JNZS2M+aSQylXHJe6fO8h
         WnMd4atUCV1yPCOvXo1vKsSQLXoWBnqYM/o7XMWE2mF5fVXOCAe9/mWo77IUMjTtOEV0
         Bdfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=WeR/kd+YfNJRvn5013GhBZQFDHk/7I7oYtAiyqV2JTg=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=OGo6hKy7gdUkpUmCTHFA+lMbQCg4SZxtMvH9wLFUgwUgzX0muRmKcRNybfI9i7sH8P
         +aOUHR/TstmjtoDMKx5FH5UGY8GhwZF6zzm2bkGuYu63cy2D2klAqkM7n65Rc5nlbcxK
         MuQE+djS+1yEX/jqMDfqD3VBy1BLeLqh9NCOaeIDATYXoGtiut6MmzFRhrNFIFot6SPB
         bwcOaMfPynAVL3ROlA/OeFMB6NKFDsmHxhLAP4yCtcBHKTaGqsNvkMflVKrLOyNXA+8k
         MF9x2Z2gFwWbQO01hP0UcGKLiMlBE+9diAoZam2MaVwWdmi8imMwqGYPUXACbBCRDcH8
         EauA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e551fe2asi98142085a.450.2025.03.06.02.40.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 02:40:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tq8dO-0004w0-Ei; Thu, 06 Mar 2025 05:39:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8dL-0004uH-6I; Thu, 06 Mar 2025 05:39:19 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8dJ-0000TZ-26; Thu, 06 Mar 2025 05:39:18 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Mar
 2025 18:38:50 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Mar 2025 18:38:50 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v5 10/29] hw/intc/aspeed: Support different memory region ops
Date: Thu, 6 Mar 2025 18:38:18 +0800
Message-ID: <20250306103846.429221-11-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
References: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
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
X-TUID: Hx5brnnvbpc9

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
index d72a5b4ab1..3e5068fd50 100644
--- a/include/hw/intc/aspeed_intc.h
+++ b/include/hw/intc/aspeed_intc.h
@@ -43,6 +43,7 @@ struct AspeedINTCClass {
     uint64_t mem_size;
     uint64_t reg_size;
     uint64_t reg_offset;
+    const MemoryRegionOps *reg_ops;
 };
 
 #endif /* ASPEED_INTC_H */
diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 9852094953..570da39b37 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -332,7 +332,7 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem_container);
 
     s->regs = g_malloc0(aic->reg_size);
-    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_intc_ops, s,
+    memory_region_init_io(&s->iomem, OBJECT(s), aic->reg_ops, s,
                           TYPE_ASPEED_INTC ".regs", aic->reg_size << 2);
 
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

