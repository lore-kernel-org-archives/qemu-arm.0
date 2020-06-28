Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2197768lfm;
        Sun, 28 Jun 2020 07:34:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKwrk58dVGvtb7ic3+U1TOllCV7I7303kR+enAQFpDKsXH426lHleB12jAlQnwOPn0aHY1
X-Received: by 2002:a25:24cb:: with SMTP id k194mr19414176ybk.81.1593354883978;
        Sun, 28 Jun 2020 07:34:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593354883; cv=none;
        d=google.com; s=arc-20160816;
        b=lLyrVFUYZ7X9u8czl1T5zcmeEHwndWttvpl06fzSiTzRZZyKHEZU9Qe8xX8ffTECFe
         agcE0h8KltW92TkN9+u8wTcgamEi5fthZX0oNKRZxWzC6872qVOlBp+pILVPpWSti8L2
         agjXalTAe1RotG+TnYiqyI707dPBbBV7vSNbthgkVWavU+dR+VcL6ZHSCacchzTEMCf7
         vOxoyYV2EKvl/b9lMlpxVIyS4raps6Qi43GoC70FLUvEK/3eQ1FswSEYtgsl9/v9fKyj
         En+nIzyvtJ0siPmQMeoJi+4gE87tGw0/+xRUyZpiQMceiS4PUmT9U99+APqsJJH1OCTM
         yNHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dJ0W5rRE5YZi83vxM8j/ufJhgS7qKl+8QXLVWJzvwUI=;
        b=RUmi/H8rqHK/r18ZqPGUAKRISyCclOPOyyB3LfE9ud6Jt56mtseO1i+AUDmLadj6rA
         f/8O6XggWvWH5571RWJcD7g2l7QidY9SyzpN1jmp+6xiN1qCdF4OSOmpK1sX/FrcJZSq
         FnBXKaTTDCxeIJio/q3FB+PX6YB0YqLuyVvW89ApeVCef7ZWH6+qMG1LdpIxZt1i2rhx
         s+g90yD8nxwTQLomH6+XrE+oka6LRIIbafazwquZih/qf1k5nYw7CoW2ZJ5fGEMq62eA
         eFpFInDbf7O8hsPZwJJcXZVDEA02GSlGMukIVw0xml9BeKLXaJgSyjGeeRAHIJAx+xSw
         DpZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ke3gNQQE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si6193596ybp.235.2020.06.28.07.34.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 07:34:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ke3gNQQE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpYOJ-0005cO-C9
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 10:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEl-0006WE-Ry
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 10:24:51 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEk-0004m7-2r
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 10:24:51 -0400
Received: by mail-wm1-x344.google.com with SMTP id o2so13694914wmh.2
 for <qemu-devel@nongnu.org>; Sun, 28 Jun 2020 07:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dJ0W5rRE5YZi83vxM8j/ufJhgS7qKl+8QXLVWJzvwUI=;
 b=ke3gNQQEkRbYWHL25HPVR/Gxz/sTkvZlVuaag2J9HEa5p+Me4nBuqzNQBWi8kIHC0T
 Lmc05XIEn/Vo/pNeeg6kk+Wo3Lqv6SEvrpUMiecDV2TMsksGBScIwlIWLd8NsYCvxpf8
 ebNJ6uBdxnxRDHnG8GKaW989MJHQUDHI3ylSCocu+fz8PKo2TuOplQeyxyv/QulI9E0Y
 EmXg621ntzEOCAEazxoCfSnS1qRvzL/Y7ILo1IuWFK7pzq4M4SrXIaBGbih+bX7MkrpN
 Pm9liknWWevRNEfOGy0P0qTrNhhQjICagu4MUmiiIBWVlhlC15Gm8WWruM8l0TMLlduz
 8WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dJ0W5rRE5YZi83vxM8j/ufJhgS7qKl+8QXLVWJzvwUI=;
 b=KLfBqehf013mbW3oumViCqq98sW7gi3BI1tR5hI1FhIpCS3sG/DhHqQjNmtwbcEoqp
 aEmPyicILcsWii8SODtvpLnZYbQNHsd/pZ1Nxp5YAek4yHiijnFylq83WPNZAnqayrX0
 y7V1tz0z3U0dOUVhO+ezjvBLhPcvqqIRjGKs3SrFNBUN0mrKYYYh27WpBmDip8ib2OvJ
 +Cy4v+DVlQDzI6a9o+Rl6s9xCzieOhsQtqxS4w58b2f190dVr365S1KdqEUL2KmoyXo6
 3pDGREVmLRZBAb6rInnsZrRRm8EnNN+sgDCzLJ3Xvg6QytNviwjnRtbtlXjgM4aOzeKB
 8/Fg==
X-Gm-Message-State: AOAM532g6qnAhvuEO0dZBs9qqlKPm32qpPzaDC+IdCDSqjlB/RCLJXq5
 qqle23iY1fxG/d04nUJkChXXYw==
X-Received: by 2002:a7b:c44d:: with SMTP id l13mr13183989wmi.66.1593354288842; 
 Sun, 28 Jun 2020 07:24:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5321555wml.42.2020.06.28.07.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 07:24:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/17] hw/arm/spitz: Use LOG_GUEST_ERROR for bad guest
 register accesses
Date: Sun, 28 Jun 2020 15:24:26 +0100
Message-Id: <20200628142429.17111-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200628142429.17111-1-peter.maydell@linaro.org>
References: <20200628142429.17111-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7FJwGzUv1k2x

Instead of logging guest accesses to invalid register offsets in the
Spitz flash device with zaurus_printf() (which just prints to stderr),
use the usual qemu_log_mask(LOG_GUEST_ERROR,...).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/spitz.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 6eb46869157..49eae3fce4e 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -23,6 +23,7 @@
 #include "hw/ssi/ssi.h"
 #include "hw/block/flash.h"
 #include "qemu/timer.h"
+#include "qemu/log.h"
 #include "hw/arm/sharpsl.h"
 #include "ui/console.h"
 #include "hw/audio/wm8750.h"
@@ -65,9 +66,6 @@ typedef struct {
 #define zaurus_printf(format, ...)                              \
     fprintf(stderr, "%s: " format, __func__, ##__VA_ARGS__)
 
-#undef REG_FMT
-#define REG_FMT                         "0x%02lx"
-
 /* Spitz Flash */
 #define FLASH_BASE              0x0c000000
 #define FLASH_ECCLPLB           0x00    /* Line parity 7 - 0 bit */
@@ -137,7 +135,9 @@ static uint64_t sl_read(void *opaque, hwaddr addr, unsigned size)
         return ecc_digest(&s->ecc, nand_getio(s->nand));
 
     default:
-        zaurus_printf("Bad register offset " REG_FMT "\n", (unsigned long)addr);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "sl_read: bad register offset 0x%02" HWADDR_PRIx "\n",
+                      addr);
     }
     return 0;
 }
@@ -168,7 +168,9 @@ static void sl_write(void *opaque, hwaddr addr,
         break;
 
     default:
-        zaurus_printf("Bad register offset " REG_FMT "\n", (unsigned long)addr);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "sl_write: bad register offset 0x%02" HWADDR_PRIx "\n",
+                      addr);
     }
 }
 
-- 
2.20.1

