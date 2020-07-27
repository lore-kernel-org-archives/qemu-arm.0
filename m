Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3002157lfy;
        Mon, 27 Jul 2020 09:26:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxt7lN/4rqZuJEHGkHZ5Svfz6LKP7golbEPzgFC+hhANAXUP4QQC86t8Afn7cMguH7MFnM8
X-Received: by 2002:a5b:bc3:: with SMTP id c3mr16845148ybr.202.1595867192194;
        Mon, 27 Jul 2020 09:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595867192; cv=none;
        d=google.com; s=arc-20160816;
        b=b3t3NMu3MppKNOgnIlRy94SC1exYmpwUB5onfeI5MmayPRvmyyQty0bPtaAW545uMB
         G9fYfsbIus/dr4DTHgsXdUuY6sbcujmcDS0kPFZpPXfbBW35VhUr3K3cn/qUpcpKRXAR
         7a/PX4Nn8GxbpW4lOJ8Zd+GDH/IFsg3TKd/tT7hNbeyKER+BQL+9eX1AikjQDZhIdLU7
         VrvwozZxV1XRExN4oGIVAowefjDerRHcEMEYif54Vk0jc5JX0yjtaeYsq56wLbb4qdMl
         TdXTYsOnQ3ZBCg/GLMlQKwYHR8AKtuu8EUN2QcU1YPOVU16LdyPo5346ipLLnwJnkuE3
         4zsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ZKtxYGps5VFXsStAbHuqacbKwp4q81OIlKsuS5wAl+8=;
        b=MRt8yHwiCKM/W6J3MW3xyl1iyqS//5CcS5NeAizRyROiTgIWLX8D+GlwUpcva4148V
         OHbY7kZHS/hWEcMFr+DCYyxyLHJuNw6mWJsdlUj9v9pQGTWPwrcV16aNHfDl1aNUJIsY
         pCE720nw6sVy8N69JienDarL+OV2tFUF4vJOrQutqCcyVGhfKFpbgHOh5KvHlCruqAys
         ftYTywXEyR3Aumzqhzl1AQ+yau/AdIV9+oNwk1jdfrjFgZdKV4wuNYwDESS8gxB0MdPb
         Jc+SfSMH7vlRwPl1u88LJyl0MKda5QnPKoXn0ngPinKgC2Y/EBw5zjkHu5FA8rOTFAsb
         tGfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VL2us8VM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r189si10186045ybr.284.2020.07.27.09.26.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 09:26:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VL2us8VM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k05xP-0004wq-J9
	for alex.bennee@linaro.org; Mon, 27 Jul 2020 12:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k05xH-0004tg-Cc
 for qemu-arm@nongnu.org; Mon, 27 Jul 2020 12:26:23 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k05xF-0003XY-Qd
 for qemu-arm@nongnu.org; Mon, 27 Jul 2020 12:26:23 -0400
Received: by mail-wm1-x343.google.com with SMTP id g8so3543918wmk.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2020 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZKtxYGps5VFXsStAbHuqacbKwp4q81OIlKsuS5wAl+8=;
 b=VL2us8VMejHzZOFPHGi4LXD2WIw+WIvRsYOcjemVjYX+S5Qwedyw0b7MpSdx4vA5aE
 Z7o35QMusBvPTCHMmM0YXNWfmPj/7xpqKuS/xQK1o0B75emfHYxS3hp19n0ai9DT/jmy
 UbGOCIz3edOQ7VCjf7Gc5+D17eGY37wH4lBPZGlvtxIzuv3Oz8XouuSCfAtFc5B//r9o
 tEe/FEKg0MBLuZ5sl4OwDnwXFICG3wNTTqTFpikyasetlcf591ioqzKf43YRypR4wfV1
 llZeyK2r8zGdvczO9PAOJ1RROd/aCBMdUtTYP+Y5+fI7CkTT3GDZjsz9rHxyeY76PTfs
 Yhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZKtxYGps5VFXsStAbHuqacbKwp4q81OIlKsuS5wAl+8=;
 b=I4Rw2MYJahWR03NWfZUCh/9xEh6NRfOh0jfIHPlXHjk/NHGy2Ma6q+ohezbSwqjhTw
 o9cMQttYLqHmw1IXKLOh1eeHjNOdH0v6x4xsrHLTdhL0jkodQzT5APDxvCGxoZjYIlQz
 JHQ66hXAyOVy58soOlxEeZ7QcMPFO2WmKdJKY+ZiL7fVuRd7JEt/U8/o+cYTc/zm/MgY
 A9BPGcrvZaie1Z1C9jrhBqOzxkm+ir5CxGSSceACp7DQIh83qx/Dn1xlJZSW5muEp8pT
 bvxEZfdyD5nw/YNcuDHjuGNVX9SHivXB9Po+i7qZLRV+jbyokRbeIK+mc3Lua9CJs9yv
 Xahw==
X-Gm-Message-State: AOAM532xtJ/ZKghVErVURDhd4Pf5g9LQoiTqMQRynBIa0Iy+UTMgmH35
 4LL89hzhcCyoqGVs6KZwqBWF0rptv+DcpQ==
X-Received: by 2002:a1c:7fd3:: with SMTP id a202mr79168wmd.67.1595867179573;
 Mon, 27 Jul 2020 09:26:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g16sm12875278wrs.88.2020.07.27.09.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 09:26:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1] hw/arm/netduino2,
 netduinoplus2: Set system_clock_scale
Date: Mon, 27 Jul 2020 17:26:17 +0100
Message-Id: <20200727162617.26227-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hQpXuUBfsOcJ

The netduino2 and netduinoplus2 boards forgot to set the system_clock_scale
global, which meant that if guest code used the systick timer in "use
the processor clock" mode it would hang because time never advances.

Set the global to match the documented CPU clock speed of these boards.
Judging by the data sheet this is slightly simplistic because the
SoC allows configuration of the SYSCLK source and frequency via the
RCC (reset and clock control) module, but we don't model that.

Fixes: https://bugs.launchpad.net/qemu/+bug/1876187
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
NB: tested with "make check" only...

 hw/arm/netduino2.c     | 10 ++++++++++
 hw/arm/netduinoplus2.c | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
index 79e19392b56..8f103341443 100644
--- a/hw/arm/netduino2.c
+++ b/hw/arm/netduino2.c
@@ -30,10 +30,20 @@
 #include "hw/arm/stm32f205_soc.h"
 #include "hw/arm/boot.h"
 
+/* Main SYSCLK frequency in Hz (120MHz) */
+#define SYSCLK_FRQ 120000000ULL
+
 static void netduino2_init(MachineState *machine)
 {
     DeviceState *dev;
 
+    /*
+     * TODO: ideally we would model the SoC RCC and let it handle
+     * system_clock_scale, including its ability to define different
+     * possible SYSCLK sources.
+     */
+    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
+
     dev = qdev_new(TYPE_STM32F205_SOC);
     qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
index 958d21dd9f9..68abd3ec69d 100644
--- a/hw/arm/netduinoplus2.c
+++ b/hw/arm/netduinoplus2.c
@@ -30,10 +30,20 @@
 #include "hw/arm/stm32f405_soc.h"
 #include "hw/arm/boot.h"
 
+/* Main SYSCLK frequency in Hz (168MHz) */
+#define SYSCLK_FRQ 168000000ULL
+
 static void netduinoplus2_init(MachineState *machine)
 {
     DeviceState *dev;
 
+    /*
+     * TODO: ideally we would model the SoC RCC and let it handle
+     * system_clock_scale, including its ability to define different
+     * possible SYSCLK sources.
+     */
+    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
+
     dev = qdev_new(TYPE_STM32F405_SOC);
     qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-- 
2.20.1

