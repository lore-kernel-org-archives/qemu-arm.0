Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp559173njk;
        Thu, 23 Jan 2025 19:03:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWYWZ0/dSKb3xdPa7vmkYpFl1VrGnhHHi4gn3sDux51AuNfFci9l6CerJbPTzyhxgvHDIpdTjmtKLZp5A==@linaro.org
X-Google-Smtp-Source: AGHT+IGQO/S043V9WdQPe1s3PYX8KKYI7C2/8idi6BeWQyem2/+T+Tq3OmRStV+BcG2JP3gsGfj/
X-Received: by 2002:a05:622a:8c:b0:467:4395:2ac9 with SMTP id d75a77b69052e-46e12a87696mr385142771cf.31.1737687796794;
        Thu, 23 Jan 2025 19:03:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737687796; cv=none;
        d=google.com; s=arc-20240605;
        b=kTJMYrctlj+yz5Fp+3ZNE9BosysRjguhj9eYOciwkXIlgkAfsQ9n2k/ndnrAV6N853
         MYvBBLlRh/AUS4y6FHisezlR6O2j6zE9C2o8V6T7Xr3+G+jjVyq5GJXmcYYg6Eq7aIzN
         RIJZCJEryYe47WPcqH1SrHO5KLXy+x8ahkxchnPAsGN2+K4kxHzDya9DpN1tVKxr/UoE
         jX9lJ+nlo9wBqtCtdSD34H8FDx1bV7mJZwlBE2l3aRT3PI/8E76V2B1jb2BjRUtr9Vpx
         LnZOSux/Wo8PGoPDuLigVlANb7SwqJfvZ1nR/CoxW1mftq2iWlx8Si1L8kI2tQNjfj5f
         4oJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=BxS1lkUxNQ2FBqjVMaSRNPWYhR7lCj6lW3I34l483mE=;
        fh=oHzELYP6xEldnfh1elECkRDXzq+40wADKO/d7kYb8Lg=;
        b=JiBPaUcMQ6ov+q3qljWsjFNdoIBxE659j9C+Re4frwdeqYLG3+yGWRKljH5UPNYoDb
         jhJAxkxAfRgrq61wF3q14dnYimyArXGFPXaEysAI1LU8iRKGq1HekDM1qWhXhSYePsYF
         FbsRjv0aBdDUzPRhV2vKgS9mpfnQq6mGF8KVr7MPYK3ncpiJ34dmr0j/oqx43dbNk5zC
         qkIXpm6pYhexLvbasl2KyW5EDvul1V5ANWE+NGXV8C0VMvfy4QEEcV+NjWZrQ6yvOi6Q
         bw7IAykorJ38EdfcRVlgVsoU+wRWbv6/p/xF4VWRO4gAdK0HWEAmLaCo/9LTKPF001ck
         fQ7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66888508si13079441cf.200.2025.01.23.19.03.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2025 19:03:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tb9yK-0000vT-92; Thu, 23 Jan 2025 22:03:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tb9yJ-0000uw-53; Thu, 23 Jan 2025 22:03:03 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tb9yH-0007tm-PN; Thu, 23 Jan 2025 22:03:02 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 24 Jan
 2025 11:02:49 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 24 Jan 2025 11:02:49 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v2 2/2] aspeed/wdt: Support software reset mode for AST2600
Date: Fri, 24 Jan 2025 11:02:49 +0800
Message-ID: <20250124030249.1706996-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250124030249.1706996-1-jamin_lin@aspeedtech.com>
References: <20250124030249.1706996-1-jamin_lin@aspeedtech.com>
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
X-TUID: NOTA80FgTprq

On the AST2400 and AST2500 platforms, the system can only be reset by enabling
the WDT (Watchdog Timer) and waiting for the WDT timeout. However, starting
from the AST2600 platform, the reset event can be triggered directly and
intentionally by software, without relying on the WDT timeout.

This mechanism, referred to as "software restart", is implemented in hardware.
When using the software restart mechanism, the WDT counter is not enabled.

To trigger a reset generation in software mode, write 0xAEEDF123 to register
0x24 and software mode reset only support SOC reset mode.

A new function, "aspeed_wdt_is_soc_reset_mode", is introduced to determine
whether the SoC reset mode is active.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/watchdog/wdt_aspeed.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 22e94e7b9c..d94b83c109 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -51,11 +51,20 @@
 #define WDT_TIMEOUT_CLEAR               (0x14 / 4)
 
 #define WDT_RESTART_MAGIC               0x4755
+#define WDT_SW_RESET_ENABLE             0xAEEDF123
 
 #define AST2600_SCU_RESET_CONTROL1      (0x40 / 4)
 #define SCU_RESET_CONTROL1              (0x04 / 4)
 #define    SCU_RESET_SDRAM              BIT(0)
 
+static bool aspeed_wdt_is_soc_reset_mode(const AspeedWDTState *s)
+{
+    uint32_t mode;
+
+    mode = extract32(s->regs[WDT_CTRL], 5, 2);
+    return (mode == WDT_CTRL_RESET_MODE_SOC);
+}
+
 static bool aspeed_wdt_is_enabled(const AspeedWDTState *s)
 {
     return s->regs[WDT_CTRL] & WDT_CTRL_ENABLE;
@@ -199,13 +208,18 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
     case WDT_RESET_MASK2:
-    case WDT_SW_RESET_CTRL:
     case WDT_SW_RESET_MASK1:
     case WDT_SW_RESET_MASK2:
         qemu_log_mask(LOG_UNIMP,
                       "%s: uninmplemented write at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
         break;
+    case WDT_SW_RESET_CTRL:
+        if (aspeed_wdt_is_soc_reset_mode(s) &&
+            (data == WDT_SW_RESET_ENABLE)) {
+            watchdog_perform_action();
+        }
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
-- 
2.34.1

