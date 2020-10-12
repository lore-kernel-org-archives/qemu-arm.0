Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1153304lfa;
        Mon, 12 Oct 2020 08:42:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybcbgVDxMGKqaO4NZX+xl6CIUZgJSDmrW3ots06lg5VGnCTh1uo2L9YRvaXyrJGVvBJfRF
X-Received: by 2002:a25:af41:: with SMTP id c1mr35657462ybj.213.1602517328731;
        Mon, 12 Oct 2020 08:42:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517328; cv=none;
        d=google.com; s=arc-20160816;
        b=l92mVWHfG/SxPjhUbgOk+dbTr+SfD5yUSoLzCik5gn1s6gHe4cWrdqcOjWZpciL7FE
         Ao6qXa37b9rKZ/gDJRg5smHsxQUZcCQuBDo52okvQ1cB3DvYrFpahpCzIue6KyvPLQkq
         n6Kpaz8C7KHlqnNEbkxm5uzuS2P8wnLPcjmE/xdfh7vhzFQ+KfdSdSy8VoynSPCNMrk1
         FbRrOvF8uN0p9BKuP4+TrLajtRp4JqjveT6MKAlehJy0WJ3/nW6pg/xQc2zAvDrxpg7N
         R3C6Ph+NC4wrekl8Q1I3GHsfmKg9sdwBAIqeCwGJ8qTk+UZ1Sedz5l7V+s9zoCkEAEgS
         INaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZKtxYGps5VFXsStAbHuqacbKwp4q81OIlKsuS5wAl+8=;
        b=D6O7HPcnMWAwnd0g4be0DxET/Ro2UtkNzllIhgwa3U72CpcT0wFkJBKg8bmIFiWV2w
         YNyepyvYyZ/hwjP1bhl+3c+Xti/3aoEd/k74MQC9mQis3avHLy2GJSNmBqBJ7jY61BzF
         jNAPZZ61dmrOuXramSwsbnk72oLHUHI49arY10xGCBMn7ZRhAZbX+qxzwbNCQGDdRX1N
         jKBlUnKXNtsmtWW7VPa5rRW46l1ttbQW/qx4oRUmC7LwpJXkQ36VxtYtAtlm5EfRvaZd
         59g7RhgbR3PgmNOfwjPyvKGvc6Fs1x8viqQ95ZkZqIwqhzcpEXx9TYWEot23tH0VKWwI
         6f4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oopoGJUo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 191si14574509ybd.475.2020.10.12.08.42.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:42:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oopoGJUo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRzxe-0007KZ-An
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqF-0006nj-Qy
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:27 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqD-0007I3-VZ
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:27 -0400
Received: by mail-wr1-x442.google.com with SMTP id n6so19391221wrm.13
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZKtxYGps5VFXsStAbHuqacbKwp4q81OIlKsuS5wAl+8=;
 b=oopoGJUogC2SBAD0Fi+W7FkzqzSSo9fjMTFE3Li6I97azXcT8zr1SrPfoks+jqXoDX
 PF7vTkXgH/A7LTBYszojVWbJWKSGXNsDGV/e+9rB2GhfFBUA+xalI/o8zaGpzADwayyN
 lIVHQX3i5Os+2V6G/xiR5ka8Fa37X81BTjpTSRhYjPM72YxFepUGUKEcLXVPcjxAO1i2
 l+TxgbU7Jso+jWrn1NjOh97E7ebywvQ06MSCVbIsIjpvZt+hfrrPa5Xq/EwLvXzNoPia
 S9lXmIzztY3Ah0B8SnxRriHyzxpAYBZ2G4ER4LZ3QPOD768Iypn4eAIx508fhJfBX0wB
 GHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZKtxYGps5VFXsStAbHuqacbKwp4q81OIlKsuS5wAl+8=;
 b=srr5n99RXZM9dqZHxoeV9wrxAcl9i4v5mFzEoYAa4zVQCGG65xQzrsGrcAtbtoHyr8
 scxXuz/4eRgB7nCsAMVaikHXaIr2zQ21mJwMrvhpVYlWEMDFkYPlBEL3YB7/T2tEHklR
 uPs5hrlOlV9B/aMWainewT5YL2jPDoNY/SuzAePCKq2od7ibzW6f7wUN18F7Vfn5vnlA
 ZuonWPvS2CJ6E/qWEH1h2uXQu2EkJp4z8uHLKLju3/7Fm45dgba/3J7RuE5j7UuvYgwz
 HuVzRKQyiOyLxm33c0zqFxB2y1JCkWVllPCvSF2v/DIg2skfoAJDkYtjuOfhQjvenRc6
 P+zA==
X-Gm-Message-State: AOAM530bzrVIeEdiYDXDvphtK9STFWpHhBG2TBXdDMcQ1sYxjEbhfNch
 0HQE5Q8NALnYqDsxVQ0WjkmYIkymnoxVAJvg
X-Received: by 2002:adf:82e5:: with SMTP id 92mr29435427wrc.192.1602516864360; 
 Mon, 12 Oct 2020 08:34:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1] hw/arm/netduino2,
 netduinoplus2: Set system_clock_scale
Date: Mon, 12 Oct 2020 16:33:35 +0100
Message-Id: <20201012153408.9747-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aWDL/fiZR/v3

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

