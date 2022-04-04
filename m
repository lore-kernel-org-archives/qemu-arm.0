Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp299665lfu;
        Mon, 4 Apr 2022 09:03:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLjheYUDT1erg0M4Xcpf9D7mUFL2xAEZxn7/CwveYfE3QbxI8R/OKSE1BtG+u2tdjuGT34
X-Received: by 2002:a05:6130:422:b0:359:98ac:abdd with SMTP id ba34-20020a056130042200b0035998acabddmr282226uab.26.1649088195265;
        Mon, 04 Apr 2022 09:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649088195; cv=none;
        d=google.com; s=arc-20160816;
        b=GNCXVsSVSJHEtjHdTX9bI7Of0tFL7AJNs1KZ6Cxcl8vk9Vjz8fQ2u0P9NA2+YZhx56
         kXTwKNf/MndFyx6AvsFLWQwxR7kLpZklX0rXnuUoEonNypbrnpys920cwWhpRC1YtxIm
         yPgn3c+Strx7bCOMcvXvk7BaU6prOj0YPNrljIakKiltP4htG5m1gvOFL95IejtDAHHm
         yBbiD2gSLDsEnY+pszVWyZ/5gzXDI4BIN6l3wb6k83OFJz6yDg36+BM8guaCEkaTFTRA
         aUImRWWCZ3TUzCFHhUCl6cWVMFfjZV5eum8bRNBabc1b6HmQ9eEvL7qyKVGSgpu/q+bL
         s6Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RN7aOH0afMEAT2akl46RtlGW9JR9cRx5sHRZC9BW2bQ=;
        b=eVctha3OpxTDD1HZTbcOyu7Lm/glyzR0T3zI4bjaMBLA9GxSZG7W2ybmTlcLrgF5fM
         zmdV9kc4teejvR8lWm3u9qxWcGjHZfppA4IFwIhdPF4y1ndh4Bc4LY7hRrIqr1zDhX7S
         7GN4keI5WaotOAxPonF2awULe/Onx20VXR2UXT1vQ/wnOibV/9FSUAwacldlTnCftXOM
         jCbYA4I/JbCxyc35vSIPdiWDkOpec8XaBT+2n08Xtko7wCLp0SSoi09CPCJ2aoHfkfB9
         g/4xsTZ4ChWlXecoWi+kcjmHrAgTLM6fL4XPkhusA66yoYI5eWnSFh5AlcDDdN/mnlgW
         +Grw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yiC7RO0v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4-20020ac5c2c4000000b00344a19c5815si98357vkk.270.2022.04.04.09.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 09:03:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yiC7RO0v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbPAg-0000xX-Mt
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 12:03:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvK-00053K-Qq
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 11:47:23 -0400
Received: from [2a00:1450:4864:20::333] (port=44631
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvH-0000YS-S7
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 11:47:22 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 n38-20020a05600c502600b0038e4a0fc5easo136468wmr.3
 for <qemu-arm@nongnu.org>; Mon, 04 Apr 2022 08:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RN7aOH0afMEAT2akl46RtlGW9JR9cRx5sHRZC9BW2bQ=;
 b=yiC7RO0vJJ15p0RTWtv58eHUuRwm11YYdShCOfiZ4LL/mLVRIJLF7ocvLqE2X6si7h
 NYSBugzSfMd2uU+LsDkiNN+cnbcnP7KAFwjsz9EtWdvti4Zes3EOLKx8mrily429LaTh
 GqPOzox2+gNYVlbSZ3daSIZHXhachp8g9u1AgOtZTPXIFqLasqA5RaTKXlnbMVNti2pW
 3jK3HlioPJE91zsOgHmyvV8e4tR/ccaQ3ADOX6NCQIzDpk56BByPSrFIC0yMK0mQDnX3
 skPSLIkYwh5dwA53Gv1uNQ8/ifwb/x1hadyxylEjatlZ3VqJp9qTaK1NEaw/yc3sa6lb
 w/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RN7aOH0afMEAT2akl46RtlGW9JR9cRx5sHRZC9BW2bQ=;
 b=SSUiy7mRoYJG5eyzDwXHDq5dbwZyTh2caIXsfLTgDNg/1pZpBDO6RG6y/NJRoPPmWw
 h8pfu1pJcc/SVDYNSvdHFNPNMFHwc3vG7kASXXVoV+84gt+66oRScZNWX5AbInDOAtdL
 /K+dkqoCZkN/xRdNLYDH6cTzy5jbDD+P9ldYJGGhkCWt7lAqTebBjgd6/7w/Q85w6WpD
 zhfaU3C2VBKxncW8urQ5YSpRC1tXCA27b4jLcXusa8I1SUwwg8hXSIWavFyRf9XmCEwb
 EA08ETqCzAHf552Bc0bA+sqSwoiRUXxXfPKhjhQwFcDAVWl4TpUsuazL5H70Ji5uobNa
 j+mw==
X-Gm-Message-State: AOAM532VelwJLXLiGMdXamAHCpW33mpAoM/+bG6T2urPnosrhflNkPWh
 Fu3rTKUIbeHKGfOXGRNuQ4NVni8NtDo/Hg==
X-Received: by 2002:a05:600c:4e92:b0:38c:73e8:7dcd with SMTP id
 f18-20020a05600c4e9200b0038c73e87dcdmr127892wmq.196.1649087238629; 
 Mon, 04 Apr 2022 08:47:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 18/18] hw/arm/exynos4210: Drop Exynos4210Irq struct
Date: Mon,  4 Apr 2022 16:46:58 +0100
Message-Id: <20220404154658.565020-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WvR2zuv/FNS8

The only time we use the int_combiner_irq[] and ext_combiner_irq[]
arrays in the Exynos4210Irq struct is during realize of the SoC -- we
initialize them with the input IRQs of the combiner devices, and then
connect those to outputs of other devices in
exynos4210_init_board_irqs().  Now that the combiner objects are
easily accessible as s->int_combiner and s->ext_combiner we can make
the connections directly from one device to the other without going
via these arrays.

Since these are the only two remaining elements of Exynos4210Irq,
we can remove that struct entirely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/exynos4210.h |  6 ------
 hw/arm/exynos4210.c         | 34 ++++++++--------------------------
 2 files changed, 8 insertions(+), 32 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index d38be8767b3..97353f1c02f 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -82,17 +82,11 @@
  */
 #define EXYNOS4210_NUM_SPLITTERS (EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ + 38)
 
-typedef struct Exynos4210Irq {
-    qemu_irq int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
-    qemu_irq ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
-} Exynos4210Irq;
-
 struct Exynos4210State {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
     ARMCPU *cpu[EXYNOS4210_NCPUS];
-    Exynos4210Irq irqs;
     qemu_irq irq_table[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
 
     MemoryRegion chipid_mem;
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 27c6ab27123..8dafa2215b6 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -331,8 +331,9 @@ static int mapline_size(const int *mapline)
 static void exynos4210_init_board_irqs(Exynos4210State *s)
 {
     uint32_t grp, bit, irq_id, n;
-    Exynos4210Irq *is = &s->irqs;
     DeviceState *extgicdev = DEVICE(&s->ext_gic);
+    DeviceState *intcdev = DEVICE(&s->int_combiner);
+    DeviceState *extcdev = DEVICE(&s->ext_combiner);
     int splitcount = 0;
     DeviceState *splitter;
     const int *mapline;
@@ -375,8 +376,10 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
         splitin = 0;
         for (;;) {
             s->irq_table[in] = qdev_get_gpio_in(splitter, 0);
-            qdev_connect_gpio_out(splitter, splitin, is->int_combiner_irq[in]);
-            qdev_connect_gpio_out(splitter, splitin + 1, is->ext_combiner_irq[in]);
+            qdev_connect_gpio_out(splitter, splitin,
+                                  qdev_get_gpio_in(intcdev, in));
+            qdev_connect_gpio_out(splitter, splitin + 1,
+                                  qdev_get_gpio_in(extcdev, in));
             splitin += 2;
             if (!mapline) {
                 break;
@@ -414,11 +417,11 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
             qdev_realize(splitter, NULL, &error_abort);
             splitcount++;
             s->irq_table[n] = qdev_get_gpio_in(splitter, 0);
-            qdev_connect_gpio_out(splitter, 0, is->int_combiner_irq[n]);
+            qdev_connect_gpio_out(splitter, 0, qdev_get_gpio_in(intcdev, n));
             qdev_connect_gpio_out(splitter, 1,
                                   qdev_get_gpio_in(extgicdev, irq_id - 32));
         } else {
-            s->irq_table[n] = is->int_combiner_irq[n];
+            s->irq_table[n] = qdev_get_gpio_in(intcdev, n);
         }
     }
     /*
@@ -440,25 +443,6 @@ uint32_t exynos4210_get_irq(uint32_t grp, uint32_t bit)
     return EXYNOS4210_COMBINER_GET_IRQ_NUM(grp, bit);
 }
 
-/*
- * Get Combiner input GPIO into irqs structure
- */
-static void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs,
-                                           DeviceState *dev, int ext)
-{
-    int n;
-    int max;
-    qemu_irq *irq;
-
-    max = ext ? EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ :
-        EXYNOS4210_MAX_INT_COMBINER_IN_IRQ;
-    irq = ext ? irqs->ext_combiner_irq : irqs->int_combiner_irq;
-
-    for (n = 0; n < max; n++) {
-        irq[n] = qdev_get_gpio_in(dev, n);
-    }
-}
-
 static uint8_t chipid_and_omr[] = { 0x11, 0x02, 0x21, 0x43,
                                     0x09, 0x00, 0x00, 0x00 };
 
@@ -630,7 +614,6 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
         sysbus_connect_irq(busdev, n,
                            qdev_get_gpio_in(DEVICE(&s->a9mpcore), n));
     }
-    exynos4210_combiner_get_gpioin(&s->irqs, DEVICE(&s->int_combiner), 0);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_INT_COMBINER_BASE_ADDR);
 
     /* External Interrupt Combiner */
@@ -640,7 +623,6 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
         sysbus_connect_irq(busdev, n, qdev_get_gpio_in(DEVICE(&s->ext_gic), n));
     }
-    exynos4210_combiner_get_gpioin(&s->irqs, DEVICE(&s->ext_combiner), 1);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_EXT_COMBINER_BASE_ADDR);
 
     /* Initialize board IRQs. */
-- 
2.25.1

