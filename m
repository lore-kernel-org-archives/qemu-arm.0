Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp149473lfo;
        Thu, 28 Jan 2021 03:50:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCGItYREBui0XvT1DdhGEangakh5SJN9+ZQUx0NkHLOOWbWMD8nLW4B7avimlDVnw58jgW
X-Received: by 2002:a25:4fd6:: with SMTP id d205mr9143249ybb.145.1611834632704;
        Thu, 28 Jan 2021 03:50:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611834632; cv=none;
        d=google.com; s=arc-20160816;
        b=LfScbmDktPzoRnGEWy8X17ySPW/YzMFEnOHb3+AhQPoKvSsehf8kr2P0nNt3PIyx5x
         4L10Bec4mrxzwy7XBmlr+e9EdbZkoAGGJxWdFqaDC33eYADgXzEsPVEjRrZPDznpw4/a
         ywrqn3/oHKClfKlela1QX6BPb+/dLh6JHcj4hIIZBok+HsutC7MxVTnPEQDNpqmjKTX7
         sBrAseDKFj0GiNysfHjoe9E4Fdn0qwHXBN3x6HfFM73cAPo/SxMgMg5CJnwkd5UmRPzd
         0fKO6NRu3ZqhVdC1jwrMZvAGSOYUFqoL6funjHAYv4DMgOwnBcFovOza1EMpmr/EWlZv
         7SmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2e1YXz+Q0p/Ws1MZPKR+jaAmbZcN+lIEvqjMORMBP0Q=;
        b=f35p/BgcZAQaodoaknpVVxz8g7ua/K2z+3GWy86r6BVwdZL+Yt/4UMiczgbn+SdEAe
         ZjvkAI67JCicx/jRZrq3VSkBdFHaqCWCauJ+hXNARcNaZNapMnWsgqNX9KUm/X8L6eHc
         tQkd/ZMqe7BJ0zmdrRzOP1bthiof3GTWi5ErsVdwipQ6oBdr02LGOG/wqwu9BNlQfvxI
         4r7GMq551WrzHkd66e+1ntQFZUvSxV89Ua/L1PWNegc5UZGez/I7ySfZyTNSMvE4RjA0
         LLE8FN+BIzO5zKl8VjNI8BB8nMKq3Uz/aWt7mKcx5TrnMM28C/Muyn/YZFNj6fcfhZyu
         Y74Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ojOc5ay+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h124si5381327ybg.264.2021.01.28.03.50.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 03:50:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ojOc5ay+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l55ol-0004L2-QP
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 06:50:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gb-0001Oa-O4
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:42:05 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gV-00068Z-9k
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:42:05 -0500
Received: by mail-wm1-x32f.google.com with SMTP id u14so4042702wml.4
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 03:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2e1YXz+Q0p/Ws1MZPKR+jaAmbZcN+lIEvqjMORMBP0Q=;
 b=ojOc5ay+OjcuVNl6T/PWhX8DlCZ+Wmhn5VBAljuFbzDp+5+Us57W+8foaSlIlLqu/w
 XxOL5KBoT1bAbv5oisrpIRVeYCPpOh+7Rryo4dK41jQT7kAJlAXg4hW0VfcE/gIzJcnB
 sf7RwHkfCxvpt2ZBJ0hnbYjMhGnC4RAMb6oqrN97zfffhjqcYLe/298/T9rqnFbWuLdc
 hiSyeRMJeJ6gxFh6YQlZuaNqA1QviPxkEPQgFGy0ddGF2PWv0KRfgZ9N707KilS6gLQY
 tYiaCkFt5MNUJzMUKZPawlmH/HfoTJhehYuaBHHrhVWut7Bco0iMAiqbfE6QaILwsFZa
 VopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2e1YXz+Q0p/Ws1MZPKR+jaAmbZcN+lIEvqjMORMBP0Q=;
 b=YrEH1v3M+NSZKaYMabGmwJ5+l0Jzub3M7d1SAotd9crQnyN7Yzjbrrn5i5bKM4ahGF
 2H5+Dc39CizU8lztIQW2GldHoBRTZlOAW3+x5ShB1yaaKC4QNrNDk3kcKvs8CGz7J6pI
 S5jRre66OCmSq2DMP2ev9I8qrYWGdtAncuhMFeKlSp49hjGuMugtnLS/oCYNFWBQTA+a
 9agp2PI/tV82s8jAOgfIVeDTra1BraoIvQ/kH3G/nYFnbkZ4N9v0cReBvEZD5mgcaPmw
 tofkmUWKRVCfUxTZdtG78xaLd5ILU8srGj8ltRAMY5f0mapw1rvRW3a3sp+dcZcWiilI
 HMZg==
X-Gm-Message-State: AOAM530gy0E1l3l0WHgBf7gsgHh1k79m8Te2HnmiN4BbS0KvIrbprXDY
 sEhwfyr/vm3M51OlfZzlzCpFGtgiJftQcg==
X-Received: by 2002:a05:600c:22cf:: with SMTP id
 15mr8170546wmg.19.1611834117966; 
 Thu, 28 Jan 2021 03:41:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:41:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 10/25] hw/arm/armsse: Rename "MAINCLK" property to
 "MAINCLK_FRQ"
Date: Thu, 28 Jan 2021 11:41:30 +0000
Message-Id: <20210128114145.20536-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pdPv7r4keNaW

While we transition the ARMSSE code from integer properties
specifying clock frequencies to Clock objects, we want to have the
device provide both at once.  We want the final name of the main
input Clock to be "MAINCLK", following the hardware name.
Unfortunately creating an input Clock with a name X creates an
under-the-hood QOM property X; for "MAINCLK" this clashes with the
existing UINT32 property of that name.

Rename the UINT32 property to MAINCLK_FRQ so it can coexist with the
MAINCLK Clock; once the transition is complete MAINCLK_FRQ will be
deleted.

Commit created with:
 perl -p -i -e 's/MAINCLK/MAINCLK_FRQ/g' hw/arm/{armsse,mps2-tz,musca}.c include/hw/arm/armsse.h

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-11-peter.maydell@linaro.org
---
 include/hw/arm/armsse.h | 2 +-
 hw/arm/armsse.c         | 6 +++---
 hw/arm/mps2-tz.c        | 2 +-
 hw/arm/musca.c          | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 83f5e28c16e..4860a793f4b 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -39,7 +39,7 @@
  * QEMU interface:
  *  + QOM property "memory" is a MemoryRegion containing the devices provided
  *    by the board model.
- *  + QOM property "MAINCLK" is the frequency of the main system clock
+ *  + QOM property "MAINCLK_FRQ" is the frequency of the main system clock
  *  + QOM property "EXP_NUMIRQ" sets the number of expansion interrupts.
  *    (In hardware, the SSE-200 permits the number of expansion interrupts
  *    for the two CPUs to be configured separately, but we restrict it to
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index baac027659d..d2ba0459c44 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -47,7 +47,7 @@ static Property iotkit_properties[] = {
     DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
-    DEFINE_PROP_UINT32("MAINCLK", ARMSSE, mainclk_frq, 0),
+    DEFINE_PROP_UINT32("MAINCLK_FRQ", ARMSSE, mainclk_frq, 0),
     DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
     DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
     DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], true),
@@ -59,7 +59,7 @@ static Property armsse_properties[] = {
     DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
-    DEFINE_PROP_UINT32("MAINCLK", ARMSSE, mainclk_frq, 0),
+    DEFINE_PROP_UINT32("MAINCLK_FRQ", ARMSSE, mainclk_frq, 0),
     DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
     DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
     DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], false),
@@ -448,7 +448,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     }
 
     if (!s->mainclk_frq) {
-        error_setg(errp, "MAINCLK property was not set");
+        error_setg(errp, "MAINCLK_FRQ property was not set");
         return;
     }
 
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 3707876d6d4..6a9eed9022a 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -402,7 +402,7 @@ static void mps2tz_common_init(MachineState *machine)
     object_property_set_link(OBJECT(&mms->iotkit), "memory",
                              OBJECT(system_memory), &error_abort);
     qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", MPS2TZ_NUMIRQ);
-    qdev_prop_set_uint32(iotkitdev, "MAINCLK", SYSCLK_FRQ);
+    qdev_prop_set_uint32(iotkitdev, "MAINCLK_FRQ", SYSCLK_FRQ);
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
 
     /*
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index b50157f63a6..d82bef11cf2 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -375,7 +375,7 @@ static void musca_init(MachineState *machine)
     qdev_prop_set_uint32(ssedev, "EXP_NUMIRQ", mmc->num_irqs);
     qdev_prop_set_uint32(ssedev, "init-svtor", mmc->init_svtor);
     qdev_prop_set_uint32(ssedev, "SRAM_ADDR_WIDTH", mmc->sram_addr_width);
-    qdev_prop_set_uint32(ssedev, "MAINCLK", SYSCLK_FRQ);
+    qdev_prop_set_uint32(ssedev, "MAINCLK_FRQ", SYSCLK_FRQ);
     /*
      * Musca-A takes the default SSE-200 FPU/DSP settings (ie no for
      * CPU0 and yes for CPU1); Musca-B1 explicitly enables them for CPU0.
-- 
2.20.1

