Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9094667lfc;
        Fri, 19 Feb 2021 07:10:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVAxMuqRdQKlrSFU3pCZEsjjQ6tH9bR5AxWFnlXNnJGbays/i/Q43aMZQmaxMI3EqUH6dd
X-Received: by 2002:a25:2603:: with SMTP id m3mr14589739ybm.434.1613747411343;
        Fri, 19 Feb 2021 07:10:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613747411; cv=none;
        d=google.com; s=arc-20160816;
        b=mfrx5xotzZybZeXayhCSfRfCDPm3cJ48PRN7NWnIIoK8Vo47IRcsR76Vxt27UJfCFY
         oe8htEm4U5h2npPY4BDanQ0I3FVXTJDvUNx4evP43eF4paTylv0/iyLNfWcma2EG3huR
         IeEUlqO1le8yroxQXpUc38ga1vLJMzVyUhTo5SgB6+CN22hFMgy0mTBMc6D4BueBm3eW
         bHXIrkDpH2w3jMx87tFR/EZ6LrEfSpmCyrToaYISpxBf3vfzEX4+T2MpWt0tNxENauSR
         6psFMQjetE1A9SWmg70b85pYRswST4nxRDZnV3GBGkamyGZzR+qC44tFGXHkcTVX5Zlz
         L40Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hW6NWM9nxIp2NHn3uTePVNYECZHKfxs/17qf7kFubg4=;
        b=bcoOkRDfli6I5wp36BZUitd5q5Xq5AfgXJ2rvHx+XUfjSyZaBx2P9TJUljQfTSLfVe
         qbYwN+jCyjxzMUOPRCq6UHgxNTTaov1Z2W5btKyOsRpRmp2BAKyilOS0stZ8+W004AiW
         SAq1xpEoQ8vz42POhBWtxSIUfQbW2163jVBrBHu33+gVUG0NFfO+1IYgb/sHwd3UqKiF
         MAfSDs8n+dH/+OVN9FkRTkF6Zg07xqTnvWDb4vbpLKUvP/pEDgjt/BQHEEekEpM/Y1i+
         dMo0b+hIIAmUT+zoCBADigllNrUwEtCuykNoiVrU1lShliBkuetEPqBuGQmTJuthQ0VP
         C5jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ob1xp9NU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l132si1120322ybl.71.2021.02.19.07.10.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 07:10:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ob1xp9NU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD7Q2-0006oX-KB
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 10:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73t-0002mf-2J
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:18 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73Q-0003eP-8t
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:16 -0500
Received: by mail-wr1-x433.google.com with SMTP id f7so7727414wrt.12
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 06:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hW6NWM9nxIp2NHn3uTePVNYECZHKfxs/17qf7kFubg4=;
 b=Ob1xp9NU47jaz+Y0lDxQFURRxnJNpi1p1aB6YNv+/6WyCobBxScM5nz2IOlC/b4dqi
 WXQ+bZdmyTav3zS1Lh7rK4QfQd03HJXBNJMHWni1jiA6SojfKa/PE7tnC3PvmcqRpQTu
 xODucm0HA9oCKXGseDNKl3zsQYi9zRYWW3fNQjkvtsYv7Vw13AmlzxWzIKN5N/xlXf7y
 befj7SpttiPS3aKYIUGUa4vwgaRAKeGqmt8OGtkGN7+1gN7sW9+vyMTr9mw6Tsy5UMD9
 rmFlPD3l+30Kx/yAUSvuRXwbj2Lk3WDoeLPpa5zGEoOqBOZo0SrpAnb1VlAqBkQFjRTi
 7+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hW6NWM9nxIp2NHn3uTePVNYECZHKfxs/17qf7kFubg4=;
 b=BJOp4NDrmRRrovJykJnydfoxJ2iqkxv/N3HDi9q8HsKDjhk0c+KlgGM1fnTKAb0aIR
 ZafiB4sVikijVHuW7U2ifXpqioIAgkQcKGCklgIhHN4o9BfIRuU27z39DTYLEasIR6Nk
 Y2trbLzW7lLN2nxMBgP/8/10vTjljNK7Lu1/B8NKRu21KssCDItywpZaR9ezqfEpJnp1
 /9dN/3OjI1QzO5js9/CjNTHSCC7rLrURqd+DBHFEiZOlX46NN/HZHNFxHWbFj9QMBhjC
 lbrZuGNzgNy27O3As6XU4ZPbs8HriDVR3llQnEJlTCaymUMNP+aPgXMurlQCGJIfuxNd
 ip6g==
X-Gm-Message-State: AOAM532fOQnF1z5YORr6/vI7yPRJ1N4X7ompIRGTewsVdtCtKCv4+Yoz
 DtPkKet0Z6j2F1FMqK5KOWTGPtRSp0Y1hw==
X-Received: by 2002:adf:fb51:: with SMTP id c17mr9774726wrs.145.1613746006899; 
 Fri, 19 Feb 2021 06:46:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 36/44] hw/arm/mps2-tz: Make UART overflow IRQ board-specific
Date: Fri, 19 Feb 2021 14:46:09 +0000
Message-Id: <20210219144617.4782-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WG/JGHTW1P9w

The AN547 puts the combined UART overflow IRQ at 48, not 47 like the
other images. Make this setting board-specific.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index aca8efba6cf..779fdb9a544 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -111,6 +111,7 @@ struct MPS2TZMachineClass {
     uint32_t fpgaio_num_leds; /* Number of LEDs in FPGAIO LED0 register */
     bool fpgaio_has_switches; /* Does FPGAIO have SWITCH register? */
     int numirq; /* Number of external interrupts */
+    int uart_overflow_irq; /* number of the combined UART overflow IRQ */
     const RAMInfo *raminfo;
     const char *armsse_type;
 };
@@ -760,7 +761,7 @@ static void mps2tz_common_init(MachineState *machine)
                             &error_fatal);
     qdev_realize(DEVICE(&mms->uart_irq_orgate), NULL, &error_fatal);
     qdev_connect_gpio_out(DEVICE(&mms->uart_irq_orgate), 0,
-                          get_sse_irq_in(mms, 47));
+                          get_sse_irq_in(mms, mmc->uart_overflow_irq));
 
     /* Most of the devices in the FPGA are behind Peripheral Protection
      * Controllers. The required order for initializing things is:
@@ -1036,6 +1037,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
     mmc->numirq = 92;
+    mmc->uart_overflow_irq = 47;
     mmc->raminfo = an505_raminfo;
     mmc->armsse_type = TYPE_IOTKIT;
     mps2tz_set_default_ram_info(mmc);
@@ -1059,6 +1061,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
     mmc->numirq = 92;
+    mmc->uart_overflow_irq = 47;
     mmc->raminfo = an505_raminfo; /* AN521 is the same as AN505 here */
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
@@ -1082,6 +1085,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_num_leds = 10;
     mmc->fpgaio_has_switches = true;
     mmc->numirq = 95;
+    mmc->uart_overflow_irq = 47;
     mmc->raminfo = an524_raminfo;
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
-- 
2.20.1

