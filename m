Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp167103lfb;
        Thu, 21 Jan 2021 11:18:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2TXQTZbuCnEf3ykfAGBzwAzyh03CcG0X7EMxsOFYPYQMWIWkqzgjOfIiTjwR4GPVX4IOt
X-Received: by 2002:a05:6902:20a:: with SMTP id j10mr1217231ybs.293.1611256732297;
        Thu, 21 Jan 2021 11:18:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611256732; cv=none;
        d=google.com; s=arc-20160816;
        b=A2T+v9Q0KcpDRsY+cEqfWRLrbuOdeEWhPl5cUNFh6V2fDLMpuuOv/CAOfcyvpQeznm
         J7a0LHfuPe+ER4Oc4nMLpVe0z7mqdUXavPkIIU2bthyR8MWfgn/9HUMXfOKI6CGFEdUJ
         hcmEjc/YRF3lKtI5EiL/wrJ99QbNeV76o7QWEjHbzXh1+GBkrvtelQcmZpmWK17w3tj5
         vBj88PdJ3P3oCUjR5cuNYbSqcMfWFi7o8ZHrnEZfpe6hLE29tO0/326RUVBfRVzLQezl
         5E4wKl2Vu6K2WtDDecLMlzmEx5VUD47zvWPD84rGT1yErGtAdVYwnrH8ZCF/qL3q3HcM
         7Pcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HsBmuYHOmkArh8+q9PdOyKcEeylmhF/poYkrDZaJKS8=;
        b=n9giGionwpt/uy0SxlWBeZ1Z8lLTmiCMf71nnOq21rZvmHzqszjU/IRsqb8v6Bg293
         NDWpkZNhSZLY3bZvfW5W8L3JFkhCjXW3f8QmjVrhsqWKw4LZ4GXRDnsI5jXr4UhGWwi4
         nLAZ1H+ijoOJ4xWPxqjUsplexFcZ9Xl9637R++Y2Zom1gFqVpgite8+Q3cvyOv2BpMOH
         w6LItwg0kKfW6Ne0/F7jdK7PGoXVqOhHDY70QnXDK1dgJslqT9xkfJhf/CLZc8jPIqdt
         Ar6O3FWKympCZRVxWywCQW1UrRYPd/uORTPBMUmLDX+UPN/j/z6Y4uEFBYZyuSPZ6bxx
         LVuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yisn4cUG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g37si6377042ybe.381.2021.01.21.11.18.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 11:18:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yisn4cUG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2fTn-0004iN-Iy
	for alex.bennee@linaro.org; Thu, 21 Jan 2021 14:18:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIC-0002IJ-W6
 for qemu-arm@nongnu.org; Thu, 21 Jan 2021 14:06:54 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fHz-0005pd-Gd
 for qemu-arm@nongnu.org; Thu, 21 Jan 2021 14:06:52 -0500
Received: by mail-wr1-x432.google.com with SMTP id m1so2128650wrq.12
 for <qemu-arm@nongnu.org>; Thu, 21 Jan 2021 11:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HsBmuYHOmkArh8+q9PdOyKcEeylmhF/poYkrDZaJKS8=;
 b=yisn4cUGdww2SlwDR5c54nQMqTTYh8EOQhrsJdfyPmvpyRwCE4n9L7WBTuUtLtCA3C
 WOYyIvqlt49QfbiliXLikJBY8lUhhUi/1TPb98YY5RYpUUXHg39iN4RgC8ZuuQoYzwS1
 8E4yWg5nDiapQt03a3FT35rlSoWzWIVpL7xut+bnmMs+/tDyeOUhEe7lq1t2XZKyNwTu
 P3amsZQnvd6TFsZPQXZ5ht9fmyFYuQtDlmdzPicSkT8s6qZS4lWElGFNDUOYj+WQsoq9
 4V1rqC/6OgbVHtBm+OJtevMXKPxxFXz+WjlN99igzXoo5Bthw1EstlGNvFmvqsqowCq/
 RZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HsBmuYHOmkArh8+q9PdOyKcEeylmhF/poYkrDZaJKS8=;
 b=nXjZbpRDbd5QGls0bganqGpOHL8Y58XHAB8CsN4tjO7xukbjC41nmabLdTfByrP27E
 O0hm03qGFdN8ZlyoXb5kVUe5IYAyVaDWy36cwSIk67S+kJ8VLn430eVwbig9MjIfKmsj
 bMm0J2YGI2PNu1htQUkhEeW9J6MnTjVgmLZCdKYKgiaanF8YmPgpu8co6P9VN1OFvdfJ
 mFialwz2ypLv/GpgYTk5fmFkjsny7xAUtyrJgQL/BHiqn5+UkH7+dLqIpQMuCPxNoc4c
 Sa78elK8tppqVuvDUMMWahMpw6Mk7/5zTvOx5KuXUzv0zW3ITp3gZLUmZc+GHpM+3nWu
 KCLg==
X-Gm-Message-State: AOAM532Gd10/kVylwE62l+IYZODKh3596Wd+Y0aC1EYSYXk1oeKYLK2f
 8yX+t9TP2AubOPMPwrWaVM0BslcQuKLP4Q==
X-Received: by 2002:adf:f512:: with SMTP id q18mr900026wro.55.1611255997892;
 Thu, 21 Jan 2021 11:06:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/25] hw/arm/mps2: Create and connect SYSCLK Clock
Date: Thu, 21 Jan 2021 19:06:10 +0000
Message-Id: <20210121190622.22000-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0EbHa4i3JO+z

Create a fixed-frequency Clock object to be the SYSCLK, and wire it
up to the devices that require it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index f762d1b46af..cd1c215f941 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -46,6 +46,7 @@
 #include "hw/net/lan9118.h"
 #include "net/net.h"
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
+#include "hw/qdev-clock.h"
 #include "qom/object.h"
 
 typedef enum MPS2FPGAType {
@@ -84,6 +85,7 @@ struct MPS2MachineState {
     CMSDKAPBDualTimer dualtimer;
     CMSDKAPBWatchdog watchdog;
     CMSDKAPBTimer timer[2];
+    Clock *sysclk;
 };
 
 #define TYPE_MPS2_MACHINE "mps2"
@@ -140,6 +142,10 @@ static void mps2_common_init(MachineState *machine)
         exit(EXIT_FAILURE);
     }
 
+    /* This clock doesn't need migration because it is fixed-frequency */
+    mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
+    clock_set_hz(mms->sysclk, SYSCLK_FRQ);
+
     /* The FPGA images have an odd combination of different RAMs,
      * because in hardware they are different implementations and
      * connected to different buses, giving varying performance/size
@@ -341,6 +347,7 @@ static void mps2_common_init(MachineState *machine)
                                 TYPE_CMSDK_APB_TIMER);
         sbd = SYS_BUS_DEVICE(&mms->timer[i]);
         qdev_prop_set_uint32(DEVICE(&mms->timer[i]), "pclk-frq", SYSCLK_FRQ);
+        qdev_connect_clock_in(DEVICE(&mms->timer[i]), "pclk", mms->sysclk);
         sysbus_realize_and_unref(sbd, &error_fatal);
         sysbus_mmio_map(sbd, 0, base);
         sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(armv7m, irqno));
@@ -349,6 +356,7 @@ static void mps2_common_init(MachineState *machine)
     object_initialize_child(OBJECT(mms), "dualtimer", &mms->dualtimer,
                             TYPE_CMSDK_APB_DUALTIMER);
     qdev_prop_set_uint32(DEVICE(&mms->dualtimer), "pclk-frq", SYSCLK_FRQ);
+    qdev_connect_clock_in(DEVICE(&mms->dualtimer), "TIMCLK", mms->sysclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->dualtimer), &error_fatal);
     sysbus_connect_irq(SYS_BUS_DEVICE(&mms->dualtimer), 0,
                        qdev_get_gpio_in(armv7m, 10));
@@ -356,6 +364,7 @@ static void mps2_common_init(MachineState *machine)
     object_initialize_child(OBJECT(mms), "watchdog", &mms->watchdog,
                             TYPE_CMSDK_APB_WATCHDOG);
     qdev_prop_set_uint32(DEVICE(&mms->watchdog), "wdogclk-frq", SYSCLK_FRQ);
+    qdev_connect_clock_in(DEVICE(&mms->watchdog), "WDOGCLK", mms->sysclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->watchdog), &error_fatal);
     sysbus_connect_irq(SYS_BUS_DEVICE(&mms->watchdog), 0,
                        qdev_get_gpio_in_named(armv7m, "NMI", 0));
-- 
2.20.1

