Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp106528njj;
        Tue, 29 Oct 2024 02:18:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOXr40Fxa7wVxCKQC9PLF1jPBdLlGFNIrqDW1SGgirX0eSornClQM1ah4uvK4n6bBo92c7Rc9Pu7HHgQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHyhGQ/jf9y4INJHGJ6Hlw0yR7OglplLULlsDir4lPeyDdoET2qjjSgveiHQxR9Yegi3Pge
X-Received: by 2002:a05:622a:11c5:b0:461:539d:f6e8 with SMTP id d75a77b69052e-461539df87dmr91023961cf.10.1730193520150;
        Tue, 29 Oct 2024 02:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730193520; cv=none;
        d=google.com; s=arc-20240605;
        b=VseP4cVhXGMk3KzI8+FQzzgRSbhCDQLT/cZMMmslHGm40K2QTOx3ZCg7HuzWNuX4a+
         WTZtYsWDDrllCgZq08jOyCiBcCpKcDtLaDYuOZLkqCDG5kPKHklf4i7ds25OjbhNPx4v
         qyw0819ooPJZ9U7fHFrqXqeEi/rz89tYsJliBi1mxxLb5OT9S7Bwm0jyK5YMuX1aVnEU
         TqYbyu7qRwL531N6bCt/mIIp7S23gctSmYkhrwqAUFfAnlYLVRYv2Qy2R10ymhIgzwoH
         skV/xA+4o1UsPEQqKNxuymk1EaR6MxDil03NKw3TKk/MI4hPdqnaT6hX5VuUKsy4IVLa
         sFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=JlwvIlBtC7+1/LWAJmWiSFuqSzWOK2Zx9nPXsA7THhM=;
        fh=4rHsaFhVkVMXk5u1IVZO4usPBujjRbqK1KMv0eZ+6CI=;
        b=Lt5AIoUZ08/ABPc98yM3HlDiyquoYNqMZ5jwxFrTuglxIOZ4Vx1wFZEfUK/HOm7F3W
         TFoKlvIkbRZPw+zhECddhvpWLMiSGTQxZrqzhJGr4qCV7Q46H+/IbJmRilK5wDwPPSeE
         f6t6l9MoThv3f/OTSAF7E4smkxjMR5qVRxhWE+Cvo4mD1I49qYnpWHO1Nw61Spr4exWJ
         lUiG1Mwrvg10FD9ACpKJptsvl+Dt5RVSTaOJnKXuQSfhMO4CqV8Q5mOAVduztpFI5PHB
         aXe8biqas9Op68cFk0pPOO3ydRS8TI8v+nVL+lex1VhTzsS24+gYpdgQwbW8yCl59pOF
         W4OQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4613241bffasi102506951cf.788.2024.10.29.02.18.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 02:18:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5iMk-0000lT-Ke; Tue, 29 Oct 2024 05:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t5iMQ-0000bU-Dh; Tue, 29 Oct 2024 05:18:04 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t5iMO-0003A3-Rx; Tue, 29 Oct 2024 05:17:58 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 29 Oct
 2024 17:17:31 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 29 Oct 2024 17:17:31 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 6/8] hw/sd/aspeed_sdhci: Introduce Capabilities Register 2
 for SD slot 0 and 1
Date: Tue, 29 Oct 2024 17:17:27 +0800
Message-ID: <20241029091729.3317512-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
References: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
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
X-TUID: pgEH7yOMTpMN

The size of SDHCI capabilities register is 64bits, so introduces new
Capabilities Register 2 for SD slot 0 (0x144) and SD slot1 (0x244).

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/sd/aspeed_sdhci.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index 427e5336a8..b73c18fbff 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -24,8 +24,10 @@
 #define  ASPEED_SDHCI_DEBOUNCE_RESET 0x00000005
 #define ASPEED_SDHCI_BUS             0x08
 #define ASPEED_SDHCI_SDIO_140        0x10
+#define ASPEED_SDHCI_SDIO_144        0x14
 #define ASPEED_SDHCI_SDIO_148        0x18
 #define ASPEED_SDHCI_SDIO_240        0x20
+#define ASPEED_SDHCI_SDIO_244        0x24
 #define ASPEED_SDHCI_SDIO_248        0x28
 #define ASPEED_SDHCI_WP_POL          0xec
 #define ASPEED_SDHCI_CARD_DET        0xf0
@@ -35,21 +37,27 @@
 
 static uint64_t aspeed_sdhci_read(void *opaque, hwaddr addr, unsigned int size)
 {
-    uint32_t val = 0;
+    uint64_t val = 0;
     AspeedSDHCIState *sdhci = opaque;
 
     switch (addr) {
     case ASPEED_SDHCI_SDIO_140:
-        val = (uint32_t)sdhci->slots[0].capareg;
+        val = extract64(sdhci->slots[0].capareg, 0, 32);
+        break;
+    case ASPEED_SDHCI_SDIO_144:
+        val = extract64(sdhci->slots[0].capareg, 32, 32);
         break;
     case ASPEED_SDHCI_SDIO_148:
-        val = (uint32_t)sdhci->slots[0].maxcurr;
+        val = extract64(sdhci->slots[0].maxcurr, 0, 32);
         break;
     case ASPEED_SDHCI_SDIO_240:
-        val = (uint32_t)sdhci->slots[1].capareg;
+        val = extract64(sdhci->slots[1].capareg, 0, 32);
+        break;
+    case ASPEED_SDHCI_SDIO_244:
+        val = extract64(sdhci->slots[1].capareg, 32, 32);
         break;
     case ASPEED_SDHCI_SDIO_248:
-        val = (uint32_t)sdhci->slots[1].maxcurr;
+         val = extract64(sdhci->slots[1].maxcurr, 0, 32);
         break;
     default:
         if (addr < ASPEED_SDHCI_REG_SIZE) {
@@ -61,9 +69,9 @@ static uint64_t aspeed_sdhci_read(void *opaque, hwaddr addr, unsigned int size)
         }
     }
 
-    trace_aspeed_sdhci_read(addr, size, (uint64_t) val);
+    trace_aspeed_sdhci_read(addr, size, val);
 
-    return (uint64_t)val;
+    return val;
 }
 
 static void aspeed_sdhci_write(void *opaque, hwaddr addr, uint64_t val,
@@ -79,16 +87,26 @@ static void aspeed_sdhci_write(void *opaque, hwaddr addr, uint64_t val,
         sdhci->regs[TO_REG(addr)] = (uint32_t)val & ~ASPEED_SDHCI_INFO_RESET;
         break;
     case ASPEED_SDHCI_SDIO_140:
-        sdhci->slots[0].capareg = (uint64_t)(uint32_t)val;
+    sdhci->slots[0].capareg = deposit64(sdhci->slots[0].capareg, 0, 32, val);
+    break;
+    case ASPEED_SDHCI_SDIO_144:
+    sdhci->slots[0].capareg = deposit64(sdhci->slots[0].capareg, 32, 32, val);
         break;
     case ASPEED_SDHCI_SDIO_148:
-        sdhci->slots[0].maxcurr = (uint64_t)(uint32_t)val;
+        sdhci->slots[0].maxcurr = deposit64(sdhci->slots[0].maxcurr,
+                                            0, 32, val);
         break;
     case ASPEED_SDHCI_SDIO_240:
-        sdhci->slots[1].capareg = (uint64_t)(uint32_t)val;
+        sdhci->slots[1].capareg = deposit64(sdhci->slots[1].capareg,
+                                            0, 32, val);
+        break;
+    case ASPEED_SDHCI_SDIO_244:
+        sdhci->slots[1].capareg = deposit64(sdhci->slots[1].capareg,
+                                            32, 32, val);
         break;
     case ASPEED_SDHCI_SDIO_248:
-        sdhci->slots[1].maxcurr = (uint64_t)(uint32_t)val;
+        sdhci->slots[1].maxcurr = deposit64(sdhci->slots[0].maxcurr,
+                                            0, 32, val);
         break;
     default:
         if (addr < ASPEED_SDHCI_REG_SIZE) {
-- 
2.34.1

