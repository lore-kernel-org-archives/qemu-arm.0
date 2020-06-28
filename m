Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2410380lfm;
        Sun, 28 Jun 2020 13:38:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC6+a7TexBpX2zb52nQvOie4edrRWoYgGqiNS3PUYPv7yt6HMkWAf7I3IKl3cIvZLLqMTv
X-Received: by 2002:a25:49c7:: with SMTP id w190mr9928983yba.302.1593376734112;
        Sun, 28 Jun 2020 13:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593376734; cv=none;
        d=google.com; s=arc-20160816;
        b=GuN95pwrFS9jSpAzXjV0rRfUDUfnV7JXDUoovxKLcEo4vYovV7Rd2a4ES0vjHJxJ6T
         1PUaTMZ0Z0Q3fKieRSp2lNVsMH8IuB27zIde5ezrtVt2GqQfs0igVy/lE2oXKqafXAYM
         7V6Xd2b0MDpmlp5m8i5eli5JMhg/nxlSa+8WDEGu5Vd/CknfVDshnaNsSgNx3onZenHi
         z0zkk0SG1uRgc+tGsvXa3JQ5ndD10Kxv78tLzOTfKBUSl/P7YJtGdLvYBj+H/JE6uk8t
         3GA5u16nbziuyU48XWZWcnQOAMyo0SUCPYw12o2s5+sG59ekX4TrD6P2xG+MnPRAyHLJ
         sW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sGq5A8U/HkYmNGDU8QGn69UW6Q4H2kgeZUf5MRmgNsE=;
        b=j4DdU/nfq3r9WlAqM9B5/09IGM3+ahoXK4+9nWATOG2iSRGtyTw8RxUD85iRgx7qZ5
         HpTsCleEf/ZYeXAo4uu37UaiGmmkLQTuhtWNzOMVirM0f2Go2lxevKFcKb9AG+Ld4moD
         IeNRv16Xnk+hNST5khLTrdd9+a4HTo0R6LupvUlqxaK6Tk42UPv4OXAvNJ2VwbZjcmEv
         qt6rO9MKJqEqASSPIW10q14mOlxeDUeTH4+d0wiPVsId0DzhoDGZatN62x9DoYIuaum8
         KagLRRpar3NtRoqCsanRsOhkqjUy8PmvCZyfvaQFfz+eFXVzXO4AnXkMTajBvtfWpijK
         eUPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FgK4WBQY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12si35248674ybq.372.2020.06.28.13.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 13:38:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FgK4WBQY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpe4j-0005KH-H4
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 16:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpe3n-0004T7-EO
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 16:37:55 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpe3l-0006T9-Qd
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 16:37:55 -0400
Received: by mail-wr1-x442.google.com with SMTP id o11so14572238wrv.9
 for <qemu-devel@nongnu.org>; Sun, 28 Jun 2020 13:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sGq5A8U/HkYmNGDU8QGn69UW6Q4H2kgeZUf5MRmgNsE=;
 b=FgK4WBQY1vapFF1Ppz1+FItPHUeJQUPBdg/0grzAAtif65NT0flkopRRRdwngqwhLp
 rWS7hwDLwzWFwKrbKqZ/7JWLd4EfGxMkINqzLgqL/Mxe/RuVJEfpn0TcLzKRPhz8EjNv
 HnGVKu0RtqfQtix841Rv82yBsZMz1JaxhPc3x77Z1WwVtLueBxloeo+u/AiHFrL7mFFH
 6WUSDPqgCzNg9xLr1NPJKRlghcHMXv4f4G9JuZoRBsI7bEOAFlsLZ5s7ty7MEGfZnJol
 WevLX1uWDcU7SS29qDyKQD/tmgRCho6t4bffHnya50/UjOXJ63CtjD9nIjuO+MISqP0z
 1yoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sGq5A8U/HkYmNGDU8QGn69UW6Q4H2kgeZUf5MRmgNsE=;
 b=ZZcQe7bN7UQJTUcou7k4aX2qItGOoWEYUJAImueyK4ydG1xlvK4pz4w/b49eG3SOfp
 XbdjGOlpNw6HPeB5DYB+3KVUfmk/jrX8mP0+CYeBqO0lYV5Xnr9pt5mMqZioFK+8AgS8
 UeqrI0UWko5dtFFJhpXwm6zVwre1F8kYMVOdgcxOEHTw0rnzkaPypjpKHtSScnSVEriW
 vLd27Bbz2k4VUIfaQKoHjZcIgJqDYibGhiea/O0r6NJYpXrxMYu1JGK3C+74T0BFIKOZ
 UY9YZ3toGH477RjYoXt+3NhlJplO67s1g20//ktsBFUMrMH2We7sOgtaWLcGBuT8x5oY
 Hv8w==
X-Gm-Message-State: AOAM531+VYbpCDPl+chHkWh21a2NloaK55qgzqYiOtK2JrgEbhWuu8sI
 56hXczL463LeWM+DYDIF3+Z2NA==
X-Received: by 2002:adf:ed47:: with SMTP id u7mr15025214wro.201.1593376672529; 
 Sun, 28 Jun 2020 13:37:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r11sm8402884wmh.1.2020.06.28.13.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 13:37:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/arm/tosa.c: Detabify
Date: Sun, 28 Jun 2020 21:37:47 +0100
Message-Id: <20200628203748.14250-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200628203748.14250-1-peter.maydell@linaro.org>
References: <20200628203748.14250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zw2PR+9GPYB4

Remove the hardcoded tabs from hw/arm/tosa.c. There aren't
many, but since they're all in constant #defines they're not
going to go away with our usual "only when we touch a function"
policy on reformatting.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/tosa.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 5dee2d76c61..06ecf1e7824 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -26,32 +26,32 @@
 #include "hw/sysbus.h"
 #include "exec/address-spaces.h"
 
-#define TOSA_RAM    0x04000000
-#define TOSA_ROM	0x00800000
+#define TOSA_RAM 0x04000000
+#define TOSA_ROM 0x00800000
 
-#define TOSA_GPIO_USB_IN		(5)
-#define TOSA_GPIO_nSD_DETECT	(9)
-#define TOSA_GPIO_ON_RESET		(19)
-#define TOSA_GPIO_CF_IRQ		(21)	/* CF slot0 Ready */
-#define TOSA_GPIO_CF_CD			(13)
-#define TOSA_GPIO_TC6393XB_INT  (15)
-#define TOSA_GPIO_JC_CF_IRQ		(36)	/* CF slot1 Ready */
+#define TOSA_GPIO_USB_IN                (5)
+#define TOSA_GPIO_nSD_DETECT            (9)
+#define TOSA_GPIO_ON_RESET              (19)
+#define TOSA_GPIO_CF_IRQ                (21)    /* CF slot0 Ready */
+#define TOSA_GPIO_CF_CD                 (13)
+#define TOSA_GPIO_TC6393XB_INT          (15)
+#define TOSA_GPIO_JC_CF_IRQ             (36)    /* CF slot1 Ready */
 
-#define TOSA_SCOOP_GPIO_BASE	1
-#define TOSA_GPIO_IR_POWERDWN	(TOSA_SCOOP_GPIO_BASE + 2)
-#define TOSA_GPIO_SD_WP			(TOSA_SCOOP_GPIO_BASE + 3)
-#define TOSA_GPIO_PWR_ON		(TOSA_SCOOP_GPIO_BASE + 4)
+#define TOSA_SCOOP_GPIO_BASE            1
+#define TOSA_GPIO_IR_POWERDWN           (TOSA_SCOOP_GPIO_BASE + 2)
+#define TOSA_GPIO_SD_WP                 (TOSA_SCOOP_GPIO_BASE + 3)
+#define TOSA_GPIO_PWR_ON                (TOSA_SCOOP_GPIO_BASE + 4)
 
-#define TOSA_SCOOP_JC_GPIO_BASE		1
-#define TOSA_GPIO_BT_LED		(TOSA_SCOOP_JC_GPIO_BASE + 0)
-#define TOSA_GPIO_NOTE_LED		(TOSA_SCOOP_JC_GPIO_BASE + 1)
-#define TOSA_GPIO_CHRG_ERR_LED		(TOSA_SCOOP_JC_GPIO_BASE + 2)
-#define TOSA_GPIO_TC6393XB_L3V_ON	(TOSA_SCOOP_JC_GPIO_BASE + 5)
-#define TOSA_GPIO_WLAN_LED		(TOSA_SCOOP_JC_GPIO_BASE + 7)
+#define TOSA_SCOOP_JC_GPIO_BASE         1
+#define TOSA_GPIO_BT_LED                (TOSA_SCOOP_JC_GPIO_BASE + 0)
+#define TOSA_GPIO_NOTE_LED              (TOSA_SCOOP_JC_GPIO_BASE + 1)
+#define TOSA_GPIO_CHRG_ERR_LED          (TOSA_SCOOP_JC_GPIO_BASE + 2)
+#define TOSA_GPIO_TC6393XB_L3V_ON       (TOSA_SCOOP_JC_GPIO_BASE + 5)
+#define TOSA_GPIO_WLAN_LED              (TOSA_SCOOP_JC_GPIO_BASE + 7)
 
-#define	DAC_BASE	0x4e
-#define DAC_CH1		0
-#define DAC_CH2		1
+#define DAC_BASE 0x4e
+#define DAC_CH1 0
+#define DAC_CH2 1
 
 static void tosa_microdrive_attach(PXA2xxState *cpu)
 {
-- 
2.20.1

