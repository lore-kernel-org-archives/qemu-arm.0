Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2370223ejb;
        Sun, 3 Dec 2023 15:43:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFH03EDMYDQEnF63+i+WX12VfV74aQwPPOsCjdCdxve0vFnT68agyxeU1o3lqxm0sm8rj4E
X-Received: by 2002:a05:6808:bc4:b0:3b8:b063:6665 with SMTP id o4-20020a0568080bc400b003b8b0636665mr2955841oik.92.1701647036453;
        Sun, 03 Dec 2023 15:43:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701647036; cv=none;
        d=google.com; s=arc-20160816;
        b=vlLsl7C9OYnvqPJxd0owlqdHLwCxGgNqwPw4BMB/1lS24jrRH5d5eWK/yQyQMXJTTY
         Ve+1r81Q5Gli07gNplU0So/i9BcWaL42AXe9au0vIDDQKda3Ov98PaOsuKF+hgshYCkn
         UZTqrRxFbw+mhuIvIJc4/DNTcEK73RObbDFIVFHvOKMzTjGrX+Zo8SU0WHqm5MaZi175
         nCw6w01YLEg0Pfh30EjuJ5sYvZgXBS1y4u7j/GQ79a+h/lhyQJ4tAbCsZ/T2ucJ8/gtd
         iaRj1f5HYFZKcNNV4vBZgtsRAvHdxND1gnAiUZSoNnrGWtWt8piir+xd2rwID9grpA80
         1I/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tcKM0zsaUF6OxJgIAQHfOevQ93BKCzxRx4ONFnlRnhk=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=0f53PgbxmT1avyh/L95/p3dMXhxuBbF1ptufTw3xSuA8S+yK2SCb9OOejpL0n/T76S
         WuIAy1A12qFZBnuhcEHjCZgdonzzxVSUlMBXkar69h2aDUqk9/OnJ5fmjQ/Zb5XspFNV
         BKY31GwYMXOTGLkL4j7kk+snKK+Fxj1S2PsdqgIXqM+I8HTczyTAKAz6d30WSah9Holk
         uERArnAnZBLcodNuAdSdlE+hQjOrEt892IAiYKw7qHgnNAzeljwSx1svzvBzBBGGBQY6
         tM9YX5EkGV0RkeFOHpmq3K3G+/Z4Aojt7uyM3zOXartvmXsz151A6d2LBfGz1av9R8PY
         ilEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="JF4//J9G";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020a05620a0bd300b0077d7b6e079dsi8497525qki.404.2023.12.03.15.43.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 15:43:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="JF4//J9G";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r9w6r-0007A0-Dw; Sun, 03 Dec 2023 18:42:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w6k-00073w-A7; Sun, 03 Dec 2023 18:42:43 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w6i-0002lz-0e; Sun, 03 Dec 2023 18:42:41 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6d9a1a2fb22so259301a34.0; 
 Sun, 03 Dec 2023 15:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701646958; x=1702251758; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tcKM0zsaUF6OxJgIAQHfOevQ93BKCzxRx4ONFnlRnhk=;
 b=JF4//J9GvHzynok0hQHxLhXN1agiTx3/WIJT4MawszLvAJIB9jB6P+C5IKqWl/yBSb
 1Xm1g8XdeiCcdchUOaQt7TuBkuKBJi8CihfLAO8ljhhR2Elpp13Ec/L6oDpVTwuH6O+4
 Iq/7FkxqYqtsW7/20Ip6eK+uAud4x4bWCKNUJh3qmXko46QDCLxcFJKiBz6xdVDDNgRA
 3uw+3t10JjEegTXkA35Ab/QG8HRMRR+iGHDe0mDrpxqd4hiOD+JmPh1LEamq5Nq0/M15
 sw9CNUIzG3iBWn/7ooFeACs3GgZHRiu85C5hUJ8GFojBh+6gmj3mpH3G/KdFHVXHph6U
 M5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701646958; x=1702251758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tcKM0zsaUF6OxJgIAQHfOevQ93BKCzxRx4ONFnlRnhk=;
 b=jhAsMySFF1R9fzwJqTaLio5wd+0LA6POSw6ikRXzaW3LOOgITyJh/VcISvv3WrW5rX
 kKVTuP6aa8gYmXGO+5WBJNlV6YzViUhxoydiXZ9pLcyHpwkCyeXaHKVeDmB6g8vYpwHs
 J/5108g+J/nopli2cEOfXpqdcgDID4jq7c/qaFRzY7BxWcpPFnswoSsyLWlRoGr0UFQI
 BA9Dvt4QXaArqlL9M8ARQCmumBaxQ1NReeGVqObxEgLOeeku5gVjAqGB0qu22bdk08b0
 eu7cfTeFR3KfDFKkK+upYunBvtsTVmDd/T35VvInv1kHxXHyP/TmOjc9Qypxnid/VZL5
 rNRg==
X-Gm-Message-State: AOJu0YzfJkAQF1SUK5BQlZ8I72JH+J00P6RbthBR019UvRHvVoWsUywq
 jgROlqYyyY6lGn0nLfqY5i76b0kObhbLgg==
X-Received: by 2002:a05:6830:3493:b0:6d9:a191:404 with SMTP id
 c19-20020a056830349300b006d9a1910404mr754558otu.36.1701646958000; 
 Sun, 03 Dec 2023 15:42:38 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 c126-20020a0dda84000000b005d718fff165sm1536299ywe.78.2023.12.03.15.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 15:42:37 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 19/45] Get rid of RNG200 timer
Date: Sun,  3 Dec 2023 17:41:47 -0600
Message-Id: <20231203234213.1366214-20-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=serg.oker@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NbQhOCocHi9h

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/arm/bcm2838_peripherals.c         | 14 +++++
 hw/arm/raspi4b.c                     |  1 -
 hw/misc/bcm2838_rng200.c             | 78 ++++++++++++++++------------
 include/hw/arm/bcm2838_peripherals.h |  2 +
 include/hw/misc/bcm2838_rng200.h     |  4 +-
 5 files changed, 63 insertions(+), 36 deletions(-)

diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
index ee06214715..7c489c8e8a 100644
--- a/hw/arm/bcm2838_peripherals.c
+++ b/hw/arm/bcm2838_peripherals.c
@@ -34,6 +34,9 @@ static void bcm2838_peripherals_init(Object *obj)
                        bc->peri_low_size);
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->peri_low_mr);
 
+    /* Random Number Generator */
+    object_initialize_child(obj, "rng200", &s->rng200, TYPE_BCM2838_RNG200);
+
     /* PCIe Host Bridge */
     object_initialize_child(obj, "pcie-host", &s->pcie_host,
                             TYPE_BCM2838_PCIE_HOST);
@@ -85,6 +88,17 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
                                         BCM2838_VC_PERI_LOW_BASE,
                                         &s->peri_low_mr_alias, 1);
 
+    /* Random Number Generator */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->rng200), errp)) {
+        return;
+    }
+    memory_region_add_subregion(
+        &s_base->peri_mr, RNG_OFFSET,
+        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng200), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->rng200), 0,
+        qdev_get_gpio_in_named(DEVICE(&s_base->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_RNG));
+
     /* Extended Mass Media Controller 2 */
     object_property_set_uint(OBJECT(&s->emmc2), "sd-spec-version", 3,
                              &error_abort);
diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index 2e8474e1c5..7b5385b8dd 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -67,7 +67,6 @@ static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
 
     /* Temporarily disable following devices until they are implemented*/
     const char *to_be_removed_from_dt_as_wa[] = {
-        "brcm,bcm2711-rng200",
         "brcm,bcm2711-thermal",
         "brcm,bcm2711-genet-v5",
     };
diff --git a/hw/misc/bcm2838_rng200.c b/hw/misc/bcm2838_rng200.c
index f91ea0754c..1b334b94d5 100644
--- a/hw/misc/bcm2838_rng200.c
+++ b/hw/misc/bcm2838_rng200.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qom/object_interfaces.h"
 #include "qapi/error.h"
 #include "hw/qdev-properties.h"
 #include "hw/misc/bcm2838_rng200.h"
@@ -64,10 +65,7 @@ static const VMStateDescription vmstate_bcm2838_rng200 = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT32(rbg_period, BCM2838Rng200State),
         VMSTATE_UINT32(rng_fifo_cap, BCM2838Rng200State),
-        VMSTATE_BOOL(use_timer, BCM2838Rng200State),
-
         VMSTATE_ARRAY(regs, BCM2838Rng200State, N_BCM2838_RNG200_REGS, 0,
                       vmstate_info_uint32, uint32_t),
 
@@ -90,6 +88,15 @@ static void bcm2838_rng200_update_irq(BCM2838Rng200State *s)
                 !!(s->regs[R_RNG_INT_ENABLE] & s->regs[R_RNG_INT_STATUS]));
 }
 
+static void bcm2838_rng200_update_rbg_period(void *opaque, ClockEvent event)
+{
+    BCM2838Rng200State *s = (BCM2838Rng200State *)opaque;
+
+    ptimer_transaction_begin(s->ptimer);
+    ptimer_set_period_from_clock(s->ptimer, s->clock, s->rng_fifo_cap * 8);
+    ptimer_transaction_commit(s->ptimer);
+}
+
 static void bcm2838_rng200_update_fifo(void *opaque, const void *buf,
                                        size_t size)
 {
@@ -121,18 +128,17 @@ static void bcm2838_rng200_update_fifo(void *opaque, const void *buf,
     if ((num == 0) && (num_bits > 0)) {
         num = 1;
     }
-    if (num > 0) {
-        fifo8_push_all(fifo, buf, num);
 
+    fifo8_push_all(fifo, buf, num);
 
-        fifo_thld = FIELD_EX32(s->regs[R_RNG_FIFO_COUNT],
-                               RNG_FIFO_COUNT, THRESHOLD);
 
-        if (fifo8_num_used(fifo) > fifo_thld) {
-            s->regs[R_RNG_INT_STATUS] = FIELD_DP32(s->regs[R_RNG_INT_STATUS],
-                                                   RNG_INT_STATUS,
-                                                   TOTAL_BITS_COUNT_IRQ, 1);
-        }
+    fifo_thld = FIELD_EX32(s->regs[R_RNG_FIFO_COUNT],
+                            RNG_FIFO_COUNT, THRESHOLD);
+
+    if (fifo8_num_used(fifo) > fifo_thld) {
+        s->regs[R_RNG_INT_STATUS] = FIELD_DP32(s->regs[R_RNG_INT_STATUS],
+                                                RNG_INT_STATUS,
+                                                TOTAL_BITS_COUNT_IRQ, 1);
     }
 
     s->regs[R_RNG_FIFO_COUNT] = FIELD_DP32(s->regs[R_RNG_FIFO_COUNT],
@@ -149,9 +155,7 @@ static void bcm2838_rng200_fill_fifo(BCM2838Rng200State *s)
                                 bcm2838_rng200_update_fifo, s);
 }
 
-/* This function will be implemnented in upcoming commits */
-static void bcm2838_rng200_disable_rbg(BCM2838Rng200State *s
-                                       __attribute__((unused)))
+static void bcm2838_rng200_disable_rbg(void)
 {
     trace_bcm2838_rng200_disable_rbg();
 }
@@ -184,23 +188,21 @@ static void bcm2838_rng200_rbg_reset(BCM2838Rng200State *s)
 
 static uint32_t bcm2838_rng200_read_fifo_data(BCM2838Rng200State *s)
 {
-    Fifo8 *fifo = &s->fifo;
     const uint8_t *buf;
+    Fifo8 *fifo = &s->fifo;
+    uint32_t to_read = MIN(fifo8_num_used(fifo), 4);
+    uint8_t byte_buf[4] = {};
+    uint8_t *p = byte_buf;
     uint32_t ret = 0;
     uint32_t num = 0;
-    uint32_t max = MIN(fifo8_num_used(fifo), sizeof(ret));
 
-    if (max > 0) {
-        buf = fifo8_pop_buf(fifo, max, &num);
-        if ((buf != NULL) && (num > 0)) {
-            memcpy(&ret, buf, num);
-        }
-    } else {
-        qemu_log_mask(
-            LOG_GUEST_ERROR,
-            "bcm2838_rng200_read_fifo_data: FIFO is empty\n"
-        );
+    while (to_read) {
+        buf = fifo8_pop_buf(fifo, to_read, &num);
+        memcpy(p, buf, num);
+        p += num;
+        to_read -= num;
     }
+    ret = ldl_le_p(byte_buf);
 
     s->regs[R_RNG_FIFO_COUNT] = FIELD_DP32(s->regs[R_RNG_FIFO_COUNT],
                                            RNG_FIFO_COUNT,
@@ -222,7 +224,7 @@ static void bcm2838_rng200_ctrl_write(BCM2838Rng200State *s, uint32_t value)
     if (!currently_enabled && enable_requested) {
         bcm2838_rng200_enable_rbg(s);
     } else if (currently_enabled && !enable_requested) {
-        bcm2838_rng200_disable_rbg(s);
+        bcm2838_rng200_disable_rbg();
     }
 }
 
@@ -321,6 +323,14 @@ static const MemoryRegionOps bcm2838_rng200_ops = {
     .read = bcm2838_rng200_read,
     .write = bcm2838_rng200_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .max_access_size = 4,
+        .min_access_size = 4,
+    },
+    .valid = {
+        .max_access_size = 4,
+        .min_access_size = 4
+    },
 };
 
 static void bcm2838_rng200_realize(DeviceState *dev, Error **errp)
@@ -330,6 +340,13 @@ static void bcm2838_rng200_realize(DeviceState *dev, Error **errp)
     if (s->rng == NULL) {
         Object *default_backend = object_new(TYPE_RNG_BUILTIN);
 
+        if (!user_creatable_complete(USER_CREATABLE(default_backend),
+                                     errp)) {
+            object_unref(default_backend);
+            error_setg(errp, "Failed to create user creatable RNG backend");
+            return;
+        }
+
         object_property_add_child(OBJECT(dev), "default-backend",
                                   default_backend);
         object_unref(default_backend);
@@ -347,13 +364,10 @@ static void bcm2838_rng200_init(Object *obj)
     BCM2838Rng200State *s = BCM2838_RNG200(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    s->rbg_period = 250;
-    s->use_timer = true;
-
     s->rng_fifo_cap = 128;
 
     s->clock = qdev_init_clock_in(DEVICE(s), "rbg-clock",
-                                  NULL, s,
+                                  bcm2838_rng200_update_rbg_period, s,
                                   ClockPreUpdate);
     if (s->clock == NULL) {
         error_setg(&error_fatal, "Failed to init RBG clock");
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index 2af96df1c6..317df005bf 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -10,6 +10,7 @@
 #define BCM2838_PERIPHERALS_H
 
 #include "hw/arm/bcm2835_peripherals.h"
+#include "hw/misc/bcm2838_rng200.h"
 #include "hw/arm/bcm2838_pcie.h"
 #include "hw/sd/sdhci.h"
 #include "hw/gpio/bcm2838_gpio.h"
@@ -65,6 +66,7 @@ struct BCM2838PeripheralState {
     MemoryRegion mphi_mr_alias;
     MemoryRegion pcie_mmio_alias;
 
+    BCM2838Rng200State rng200;
     SDHCIState emmc2;
     BCM2838PcieHostState pcie_host;
     BCM2838GpioState gpio;
diff --git a/include/hw/misc/bcm2838_rng200.h b/include/hw/misc/bcm2838_rng200.h
index 46fdba48da..8e084b7254 100644
--- a/include/hw/misc/bcm2838_rng200.h
+++ b/include/hw/misc/bcm2838_rng200.h
@@ -32,11 +32,9 @@ struct BCM2838Rng200State {
     RngBackend *rng;
     Clock *clock;
 
-    uint32_t rbg_period;
     uint32_t rng_fifo_cap;
-    bool use_timer;
-
     Fifo8    fifo;
+
     qemu_irq irq;
 
     uint32_t regs[N_BCM2838_RNG200_REGS];
-- 
2.34.1

