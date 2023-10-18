Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4669089ejc;
        Wed, 18 Oct 2023 07:13:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlWtprRx0oSLqeXkp/T3lkIwTup1yIo3Knw73XK4kfQu3KpZ5B0gPGODnSJxEBvtlhoOcE
X-Received: by 2002:ac8:5f49:0:b0:410:8f33:e7fd with SMTP id y9-20020ac85f49000000b004108f33e7fdmr5455956qta.64.1697638411955;
        Wed, 18 Oct 2023 07:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697638411; cv=none;
        d=google.com; s=arc-20160816;
        b=cirLWLIV8X6U1ASKonefJCyJcBM/RafiBYXRBnS0cOLBE0JE+0tnkclyUAQof5UbUI
         /mZpWdTnO7fZSWiYxFoBxahT1iSOLgS5H3hvb45lrKp6NPSJIZHv6cQ6r36uU3MiJUk8
         8js9zYnSTts5sH78uBmTs0nzKCqAJ6qA87s5onEzw/uu76etMVto/wOTPoCDnct7l4IY
         8bV4xPRAud1+hVrfoxyh/5jiqW5+aaCwE6mqcTwroATmAU/lxrt2zrh36knSYIDrhCcl
         6MXcjmS/9fgFxhfq3QnRvEelQBybMVmPdeqJd8LFpa5iwC+MJjK8PLS1xAjMA6Zcg3g5
         0CMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4BhH2UDoy2g409CWMZ269iEOOSKpvxQS8Grq3jMtP+0=;
        fh=ANIikQnX6ADG7FYuHYnQUKFZKV9+VnxLLzGv0RFOlfg=;
        b=b2XYAM9NO5e/yTGKZXaJyN0SZkKaNK4ZtqExSPBiRipGjTONIVBVx05rp5dg4Ih5jf
         kB/lzIz78q1ww9k/yf6RquAnqH/a4qBavDRO+T2Zs5PsNmpO1K1s1RX95beLW1hz7APr
         b3NX0GZomK68HK4KcFH7b02sGTpqLV5+dOguEkqujdScLxs7NOYA5LLRWd3muGbJ4tvy
         Mz+DPNBhKYINt1fW7C4K/rY9OZdWkdkmM9DT82m1V3m+W3qCGA/BxDANnZsQ2H6D7j+q
         hEbShXauEwbHUoacEfzMx56GhswaH3dpyff0S4sofPRi8F94rH42QjTcvkRpvlsHaO9Z
         h3OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="D6h/oXSi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8-20020a05622a03c800b00417ce8008cdsi2698705qtx.803.2023.10.18.07.13.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 07:13:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="D6h/oXSi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt7I0-0007CX-CR; Wed, 18 Oct 2023 10:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt7Hy-0007AZ-UN
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 10:12:46 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt7Hx-0004rb-9A
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 10:12:46 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-507b18cf2e1so4232914e87.3
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 07:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697638363; x=1698243163; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4BhH2UDoy2g409CWMZ269iEOOSKpvxQS8Grq3jMtP+0=;
 b=D6h/oXSi/2L6NwPWT9G6O3IjvkMmmvh2AYXXS0UFHeahlOnL7jecYyfQ4XhLRf+wiM
 ofg4wuo/oi6wYjEqH0VsN1R4E0jhN0QKa38BrqW6cMCXNM2sSewRs+Qy6tPZPaejoDWk
 XXGNRe0FIFyqS2zju1E2G2juZwPXl/Cds1AzyF/4eWQE/nQMC4579CuEW2pqFyqpoalm
 WoQv/v6WIcYObJ8lczL3l8k16NREwl4ZFCcHGoKk01KFmH1HvYvc//ZhF+22ED0W/s9l
 JrNfvteL2K422jjJogKk2FAslgevueGo9KH/uEY+dFeRQCBTQU93q/2cXPop8KGtT731
 Khcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697638363; x=1698243163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4BhH2UDoy2g409CWMZ269iEOOSKpvxQS8Grq3jMtP+0=;
 b=jwtT8s7oh3opzyzHOjcWGnZfGlLctR61SatAglkZ55o4Ow2rwcU25hMiil47s5YXdD
 qaT0AGSSTZ22vl6KHz14rCzZ6yI1oUheDect+2n8owqakYoBvLV7wfX8qqy7+d1nrGfc
 oLTu86UkFYbf9bQK63qJs3Inu60upsifdfRvgxH5Dk2N0qPSlzpzPdETVI0Dnb2XM2Dg
 pwXqRzeVCbZrcxoiHIdV3plaJf/d4LJbgP6Y7I/ULS0akAsSrH/P88+XdQ0+mAgni63g
 aTcEVMuTEpqrZ/DH+K7OFYTJk6aM2sv4FWpKKcdgyYkwX5iBpzog9XjuPJXpx08XCdTW
 egng==
X-Gm-Message-State: AOJu0YwWWsoWW9c3jAL8NiEmjZvJrS5nE2JUpsvF6/q8tVkYCK4eYywI
 jsKryA6fdMjqIjA6g2iovTfiqA==
X-Received: by 2002:a05:6512:73:b0:505:79f2:5c6c with SMTP id
 i19-20020a056512007300b0050579f25c6cmr3668824lfo.6.1697638363554; 
 Wed, 18 Oct 2023 07:12:43 -0700 (PDT)
Received: from m1x-phil.lan (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr.
 [176.171.218.149]) by smtp.gmail.com with ESMTPSA id
 p4-20020a170906b20400b009c7518b131dsm1046127ejz.196.2023.10.18.07.12.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Oct 2023 07:12:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 06/12] hw/acpi: Realize ACPI_GED sysbus device before
 accessing it
Date: Wed, 18 Oct 2023 16:11:44 +0200
Message-ID: <20231018141151.87466-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018141151.87466-1-philmd@linaro.org>
References: <20231018141151.87466-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gcC8xz8G76ZP

sysbus_mmio_map() should not be called on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c       | 3 +--
 hw/i386/microvm.c   | 2 +-
 hw/loongarch/virt.c | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 15e74249f9..02c7a7ff3c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -647,13 +647,12 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
 
     dev = qdev_new(TYPE_ACPI_GED);
     qdev_prop_set_uint32(dev, "ged-event", event);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(vms->gic, irq));
 
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-
     return dev;
 }
 
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index b9c93039e2..ca55aecc3b 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -206,12 +206,12 @@ static void microvm_devices_init(MicrovmMachineState *mms)
     if (x86_machine_is_acpi_enabled(x86ms)) {
         DeviceState *dev = qdev_new(TYPE_ACPI_GED);
         qdev_prop_set_uint32(dev, "ged-event", ACPI_GED_PWR_DOWN_EVT);
+        sysbus_realize(SYS_BUS_DEVICE(dev), &error_fatal);
         sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, GED_MMIO_BASE);
         /* sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, GED_MMIO_BASE_MEMHP); */
         sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, GED_MMIO_BASE_REGS);
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
                            x86ms->gsi[GED_MMIO_IRQ]);
-        sysbus_realize(SYS_BUS_DEVICE(dev), &error_fatal);
         x86ms->acpi_dev = HOTPLUG_HANDLER(dev);
     }
 
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 2952fe452e..4b7dc67a2d 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -412,6 +412,7 @@ static DeviceState *create_acpi_ged(DeviceState *pch_pic, LoongArchMachineState
     }
     dev = qdev_new(TYPE_ACPI_GED);
     qdev_prop_set_uint32(dev, "ged-event", event);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     /* ged event */
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, VIRT_GED_EVT_ADDR);
@@ -422,7 +423,6 @@ static DeviceState *create_acpi_ged(DeviceState *pch_pic, LoongArchMachineState
 
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
                        qdev_get_gpio_in(pch_pic, VIRT_SCI_IRQ - VIRT_GSI_BASE));
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     return dev;
 }
 
-- 
2.41.0

