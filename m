Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp3020804njc;
        Wed, 18 Jun 2025 01:01:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXnrgVLECYE/NdHQNqODoX3LEHCkRSgjdV27LJtL3jj9rBOLm6GRc5zhrttX80hnB9vkoOwfbGXHVcHBA==@linaro.org
X-Google-Smtp-Source: AGHT+IFmnPfUiNqGjfHsScgi6SLVJ8i7F8fiokV+sogDsfgDlsZzz0Zri+VfOA7nmcDNisjZf6Xz
X-Received: by 2002:a05:6102:cd1:b0:4db:e01:f2db with SMTP id ada2fe7eead31-4e7f5f6d18dmr12271883137.0.1750233666984;
        Wed, 18 Jun 2025 01:01:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750233666; cv=none;
        d=google.com; s=arc-20240605;
        b=cR1eoOf4cA9du3xtcNjvkAtwC1VOikIAfszymJMvVqzEedvn27TbmvYaiusTzCPlMp
         8SvGZK7iOVVAHI46C/+4a/xYHPbZsQQt6iod5v97VCOrrQ8Qe6ZTReWeRcBbO/ZhRON2
         RNN8Y5OBh9jdGDh80snQUuszy0Hqxl8JrL+07N0f1tJ5aMY2JqghIri1iJKkXCDrKcMr
         5WbKiqsA2e3bpTHUhjEdv1cA9xvcik8B7/bcqDRg9xcwbO1n2sN9OsD5i+R4+ef+gbxU
         fxEBfZ5F21IQD7zYRukKo5kSUutkgVC5wXbxEmaerBGh/cxTBkbEELnUJnukqXVt/xz/
         B1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=LRJKSeT7wcl/exEAFGNPzthmk8rgb/9+C64ErXlrV7A=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=dOekR/My61DL7TVPoHTJKaMWTp/4xh0HD5XAueuXmxe4PxoVe1/G4tcgGjyC/4RtVa
         SmuxOjRrxrg16j5He7Zl8AAXW/Nr3BqAPihtOfmAZs/vgTyL+ELt7n42ipHTpiCr9GnK
         TZoYoxQQwt+82Q6i7Qy9K0SDKtwcdQKv0fQl+yoWFwZCMQIX9LtoIMsO0eN63SnpmZu8
         VUf2xZfRG6WB4sWBVNzo8L131f9suuoZ7Q0xjm1Zleq1ysTzi06JbTl8P+tOZPhrbM3c
         hbf8z9wtcvp97lOVqAaOLOTuk6vVUZBqEqk+ttLSft3p173tRvxcQmDn+xv9X2Xr+0KX
         RrHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4e7e6e17069si2846454137.72.2025.06.18.01.01.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jun 2025 01:01:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRnin-0001LL-Vi; Wed, 18 Jun 2025 04:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uRnil-0001Ke-I8; Wed, 18 Jun 2025 04:00:35 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uRnii-0006A3-Vz; Wed, 18 Jun 2025 04:00:35 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 18 Jun
 2025 16:00:06 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 18 Jun 2025 16:00:06 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 2/2] hw/misc/aspeed_scu: Support the Frequency Counter
 Control register for AST2700
Date: Wed, 18 Jun 2025 16:00:05 +0800
Message-ID: <20250618080006.846355-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618080006.846355-1-jamin_lin@aspeedtech.com>
References: <20250618080006.846355-1-jamin_lin@aspeedtech.com>
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
X-TUID: 4pfgoaaDSjJ2

According to the datasheet:
BIT[1] (SCU_FREQ_OSC_EN) enables the oscillator frequency measurement counter.
BIT[6] (SCU_FREQ_DONE) indicates the measurement is finished.
Firmware polls BIT[6] to determine when measurement is complete.
The flag can be cleared by writing BIT[1] to 0.

To simulate this hardware behavior in QEMU:
If BIT[1] is set to 1, BIT[6] is immediately set to 1 to avoid
firmware hanging during polling.
If BIT[1] is cleared to 0, BIT[6] is also cleared to 0 to match
hardware semantics.

The initial value of this register is initialized to 0x80, reflecting the
default value confirmed from an EVB register dump.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_scu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 4930e00fed..11d0739108 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -176,6 +176,7 @@
 #define AST2700_SCUIO_UARTCLK_GEN       TO_REG(0x330)
 #define AST2700_SCUIO_HUARTCLK_GEN      TO_REG(0x334)
 #define AST2700_SCUIO_CLK_DUTY_MEAS_RST TO_REG(0x388)
+#define AST2700_SCUIO_FREQ_CNT_CTL      TO_REG(0x3A0)
 
 #define SCU_IO_REGION_SIZE 0x1000
 
@@ -1022,6 +1023,10 @@ static void aspeed_ast2700_scuio_write(void *opaque, hwaddr offset,
         s->regs[reg - 1] ^= data;
         updated = true;
         break;
+    case AST2700_SCUIO_FREQ_CNT_CTL:
+        s->regs[reg] = deposit32(s->regs[reg], 6, 1, !!(data & BIT(1)));
+        updated = true;
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Unhandled write at offset 0x%" HWADDR_PRIx "\n",
@@ -1066,6 +1071,7 @@ static const uint32_t ast2700_a0_resets_io[ASPEED_AST2700_SCU_NR_REGS] = {
     [AST2700_SCUIO_UARTCLK_GEN]         = 0x00014506,
     [AST2700_SCUIO_HUARTCLK_GEN]        = 0x000145c0,
     [AST2700_SCUIO_CLK_DUTY_MEAS_RST]   = 0x0c9100d2,
+    [AST2700_SCUIO_FREQ_CNT_CTL]        = 0x00000080,
 };
 
 static void aspeed_2700_scuio_class_init(ObjectClass *klass, const void *data)
-- 
2.43.0

