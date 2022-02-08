Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp280774lfk;
        Tue, 8 Feb 2022 09:39:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/hXJlOqIE88jmY/oer9BOCz4w6Zdu2YUsweS32imIoEpL9mDUieBBZJcrKbQH9UZHsRmw
X-Received: by 2002:a25:e0c1:: with SMTP id x184mr5684609ybg.500.1644341997745;
        Tue, 08 Feb 2022 09:39:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644341997; cv=none;
        d=google.com; s=arc-20160816;
        b=LWiGNxcg5XV9ni9v7PJWOS1Pb5J+u/lNBPF3MZARsGNt958Fm7MW3UTN6ngYGaYtJ1
         oPsjkliAhsmIOhxZO3+iia1Ly6QSHHfXZcMTX8e5wTvG4Bc9/DUr0JpYZoMOh7MyuVnn
         1f913vba8Lrr12LpVbFvctwPDapoPEU/ZgEOB8xiMch7bn78mabgAIm2yT6LtFMJg7Hd
         n52tyGOZJkVN799r2CIe616pBTrhIVM1DS4ho1e3xtYs9/GbhIQ/Wo432Lg8Km5eI1D0
         fOlPYTlcVnIWlMXzFDzdoZIrfVEvKuz97BHkPCRR4Zlk/KI50gkMkqArwivXctGon/Gd
         i39g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=X+5q8Q245RMXKO+FXIQP2z10d5lBl/C2tAq9zh99WDw=;
        b=Y7CfJisX7INgBPlMg8bPF+yMtT/lTD4ZMuyqHnVVLt0ZkZbsWgwmdNO32u5Y1NK0i+
         4AUR45I84DuiWfIVLZkKdaORla+Z7Ij9cz0GEu/EaVuVs4C3DXeSfDkDq5QezjeKgpLi
         sSkZE2wqrIJdjmCsNSWMBzcdXYmYiGOaPj9KBwsQGhTQqm0DgviQ3sUOLtBMvwzPak19
         RIEOJYa6dVl3sMIe01/zzKyFyTG8SpGvVTB8zHF/5SGG8X9gt7xS4j1/5ABK1QTqlVx2
         WcUEqeSLj/0kWe0Oz3ogxfHJ1JFBXRyxMIwhGiAS9uPhQIr/qYp4IgEsYv0QllOGYjxu
         SBoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IClUJYyQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i186si9634689ywf.204.2022.02.08.09.39.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Feb 2022 09:39:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IClUJYyQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nHUT7-0002Mo-4u
	for alex.bennee@linaro.org; Tue, 08 Feb 2022 12:39:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHU6l-0003fW-5c
 for qemu-arm@nongnu.org; Tue, 08 Feb 2022 12:16:51 -0500
Received: from [2a00:1450:4864:20::435] (port=42864
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHU6h-0002NR-Uz
 for qemu-arm@nongnu.org; Tue, 08 Feb 2022 12:16:50 -0500
Received: by mail-wr1-x435.google.com with SMTP id h6so13307688wrb.9
 for <qemu-arm@nongnu.org>; Tue, 08 Feb 2022 09:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X+5q8Q245RMXKO+FXIQP2z10d5lBl/C2tAq9zh99WDw=;
 b=IClUJYyQkhtkPpKMZmFwxgEZnJBygzTsZLIKirMwPUI2NacdoEtEgkdIDA9AzNB50e
 KUJrEQAi1I2euB9pBYGW5IpPbeWrsvpXFaQ2Y3/NHWItXjpCMwO1Q2OEKly/TVFkR8iH
 WTKOnWJuHpXK7uj0agXsJPgaExzGkdp5FNkBZSSovjmy7xQ/OsDuYU4rd7PHHv603lQh
 p8vQ7sNK/CfvLSzQ1DTu7f/6Pw7vk8KGtKoDAU8rY8fZqsRCShHa6nehwyTxtNaIpjU+
 Du0LyeKOw3ipugoWJDQcWWnBrXfO2rJBOvil4ZAd0BCVhCq/GdSoBkt96GnA77VhH0um
 h6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X+5q8Q245RMXKO+FXIQP2z10d5lBl/C2tAq9zh99WDw=;
 b=525qIqV17GYtJoGA20pis5wVUlAd05YLqH3NoRyHBvATZWl1FG8uhQ884DmVwpcGsd
 5MiLi0KnLjYXR5o4UuZhE4UiOOo2snP8mcm9JKIyEDfHKPuUDTEI2tcGBqOONBDOfOY+
 Ni9lyVymiz8kMrnTlt4XMSFW8O06te7hxyWcDsYXI5pqiVTjNafRA9WVdpAvPpbMCT9O
 UsJx3rbOtBVqXXRvnLgj9nihIDStC190jjHtmg7ilbRRFF/SW/+YrW2dwrs/FyqlT4qs
 yLqGkFpkD0w//aHgSJtELjhfksaHsOnz4TgmRfl9rLE+VoQaEMEFrI/+PY29JjMO+QLG
 soIA==
X-Gm-Message-State: AOAM530QcZZ9pkDpfvHIaFb3t24R+sKCzD13jTLJhSg8asW5SN5AWQdo
 ZG5GBgc743H1+qnCVcu5xrOGxCSnFOCxlQ==
X-Received: by 2002:a5d:4089:: with SMTP id o9mr2689911wrp.634.1644340605938; 
 Tue, 08 Feb 2022 09:16:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t14sm2718680wmq.43.2022.02.08.09.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 09:16:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/armv7m: Handle disconnected clock inputs
Date: Tue,  8 Feb 2022 17:16:43 +0000
Message-Id: <20220208171643.3486277-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-stable@nongnu.org, Richard Petri <git@rpls.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SbnnEYS59fZX

In the armv7m object, handle clock inputs that aren't connected.
This is always an error for 'cpuclk'. For 'refclk' it is OK for this
to be disconnected, but we need to handle it by not trying to connect
a sourceless-clock to the systick device.

This fixes a bug where on the mps2-an521 and similar boards (which
do not have a refclk) the systick device incorrectly reset with
SYST_CSR.CLKSOURCE 0 ("use refclk") rather than 1 ("use CPU clock").

Cc: qemu-stable@nongnu.org
Reported-by: Richard Petri <git@rpls.de>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The other option would be to have clock_has_source() look not
just at clk->source but somehow walk up the clock tree to see
if it can find something that looks like a "root". That seems
overcomplicated...
---
 hw/arm/armv7m.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index ceb76df3cd4..41cfca0f223 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -284,6 +284,12 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    /* cpuclk must be connected; refclk is optional */
+    if (!clock_has_source(s->cpuclk)) {
+        error_setg(errp, "armv7m: cpuclk must be connected");
+        return;
+    }
+
     memory_region_add_subregion_overlap(&s->container, 0, s->board_memory, -1);
 
     s->cpu = ARM_CPU(object_new_with_props(s->cpu_type, OBJECT(s), "cpu",
@@ -420,8 +426,18 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
                                     &s->sysreg_ns_mem);
     }
 
-    /* Create and map the systick devices */
-    qdev_connect_clock_in(DEVICE(&s->systick[M_REG_NS]), "refclk", s->refclk);
+    /*
+     * Create and map the systick devices. Note that we only connect
+     * refclk if it has been connected to us; otherwise the systick
+     * device gets the wrong answer for clock_has_source(refclk), because
+     * it has an immediate source (the ARMv7M's clock object) but not
+     * an ultimate source, and then it won't correctly auto-select the
+     * CPU clock as its only possible clock source.
+     */
+    if (clock_has_source(s->refclk)) {
+        qdev_connect_clock_in(DEVICE(&s->systick[M_REG_NS]), "refclk",
+                              s->refclk);
+    }
     qdev_connect_clock_in(DEVICE(&s->systick[M_REG_NS]), "cpuclk", s->cpuclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), errp)) {
         return;
@@ -438,8 +454,10 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
          */
         object_initialize_child(OBJECT(dev), "systick-reg-s",
                                 &s->systick[M_REG_S], TYPE_SYSTICK);
-        qdev_connect_clock_in(DEVICE(&s->systick[M_REG_S]), "refclk",
-                              s->refclk);
+        if (clock_has_source(s->refclk)) {
+            qdev_connect_clock_in(DEVICE(&s->systick[M_REG_S]), "refclk",
+                                  s->refclk);
+        }
         qdev_connect_clock_in(DEVICE(&s->systick[M_REG_S]), "cpuclk",
                               s->cpuclk);
 
-- 
2.25.1

