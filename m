Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3911036njc;
        Wed, 6 Nov 2024 17:25:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWKsL312+KhoAlIzC8PbxsRqC17pbfCsthBAOgpMA7PJotcihxsMTI2TcDzm7yTrkx+z8uygxmS3NCiQg==@linaro.org
X-Google-Smtp-Source: AGHT+IGRlrpkZaENZj0e/xPBaUXkPZfnKM/ZIjeuNfVLcVIQAls8/INwKxDzLALmLXfUnLzePvHT
X-Received: by 2002:a05:6214:390a:b0:6cc:22eb:4508 with SMTP id 6a1803df08f44-6d396ce35b4mr3296656d6.47.1730942725624;
        Wed, 06 Nov 2024 17:25:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730942725; cv=none;
        d=google.com; s=arc-20240605;
        b=YkSq/u0x2GiqiW04n1UZoGzF3XxPJn9HcZznZCazkxoaPejtOPjuZGGINffocyJhT1
         r4Ioem9r3x12ulpeT+ULrWFGtI80HcCf2lNZAVyHfoPNC7r/1KHn1kUfFmOJ3f+HodSG
         xaKyLIx0b+7zFl2stZ2T8t3Lm2s3ZnqUMW/mVHSu4mYsvtEvqHgaf0leb2OmmhZluz7B
         HoLzDm/RZEqwI9UTBJDSk7IqAjXTd9aycE6kQ18DZMQma5CMaos5IXygsa8kPJv8hBco
         WuyNgVh6rH0Szs18UMQPlBWmaFDDVymTsi1cmY7GtPoBz5RVpSYLULUph4UPCJGgllVJ
         dmLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=T1tfsjNtlRpdhuZaJYWPeLaJhPcQ3W/JNZX/8IT58do=;
        fh=vM37qbNaPU3uR6f86jhqaKn305FaeOZskMegiez1DqE=;
        b=lqEyuVoZLsCawUZik6MPlttoyrKRtP9cgOfHC1PbrHQs9wyyGbVDRechEL5+A0wz3z
         AXgx+Eeew467ZNS/ES9Z/M9Uyy1CC8x/ublQwezytAw/BoqNs6Kf3BNnJFMcb0KGcVAZ
         YfzFqFPs7OchmUrKfjfEj50V2/NSpEwj/v92k0YcjGHDo4b9xBbQn4DmB6VATlC68h0X
         hND1kIM0Svo7KWrHxlKgb327OzZEP4XNny4Ww2RBM+y1t+BNzbQE+sfWktVXgieaivuk
         xSaJNmL7qC5IUmkSGtQBid6oxceRfI2pPluIPHcdXbEIVy3XuZctWkkZ4xsiJKVMKtv6
         4EOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LEcAslCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3966b07c2si3349716d6.407.2024.11.06.17.25.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2024 17:25:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LEcAslCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8rFn-0006sG-Dg; Wed, 06 Nov 2024 20:24:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rFf-0006NH-2Y
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:23:59 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rFb-0003EU-Np
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:23:58 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4315e62afe0so3804385e9.1
 for <qemu-arm@nongnu.org>; Wed, 06 Nov 2024 17:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730942634; x=1731547434; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T1tfsjNtlRpdhuZaJYWPeLaJhPcQ3W/JNZX/8IT58do=;
 b=LEcAslCW+MsIUjHjSTQBU+uMJxuj9/W/IOgfq8HzXxReCSKxK6sIiCZ4Ft22CGfcdD
 oLzBg3cC31m8sF9TDsbRsZ2E+TJ0mlLaSWPL04KObkE5OPPJp1dfWfiX3X25SMAkO49c
 8w9AmKAFiDreDg0fylS/lvRo8ImQypgR59M2cgwaKT7fKKlJAeZFGQH9cV7L3q8RLXin
 Hzqi9wh8Vp5rWWRQuEf+YIGmJU9P7MqWgNZ83SijIQE+7LntGqEcBwFF3247+Z3FxKJ2
 apiF9FyeNvorKUagVbTt0YMoANQtMAdg5uUD8NdXQ5Y1KX+WMfdoGy4f9LT0p+4RrJf9
 EhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730942634; x=1731547434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T1tfsjNtlRpdhuZaJYWPeLaJhPcQ3W/JNZX/8IT58do=;
 b=mSXTq5FQPHqZdIqu1Shx01hbhnp3OzEYAICdfL+FhW6rYQRR56Ax4b/sT4+5LtSOpS
 YwniQxf6gsQvQWI5Bb0NMfjz6GVR4eSsXiCPEZ+RpHjKScUiVDUqm1M+k/7J+Fbt1+5G
 8MkGg5+w3YMtpRiW4xEi9TFCLGIC5m1uYWb2RGqKJgoor8ed+fiOLqUp7rHgcbaNzB6Q
 4gqvVXIfVMDwxodPP6i1Dxed0mZRfNlP01c8+fwbWVMa6rqimRzU5odh73nOfMrE1U6d
 b2tcM9fgj7vQDLdGeHn+UaOETVvlodmTmbHugdIrcs2USmvHTJY44fdHggU7cb+ucply
 R9MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNwqGVrdMnmvhra6bEcX8kOaNvieyoRagunydT3G6a2rjbd+L0+13hhBEEBEU2QWhzhLF70500ZQ==@nongnu.org
X-Gm-Message-State: AOJu0YzcfrjiUx7IrTDLgjeYR9f8/bjrlj9DvKcDc+5kY1mHjS5S0Brq
 wlZUz7X3hO1s67T7yeuL+q37v3TrhGPhQa3SHaq75fy0nhozOBlMJag79npJKPVg6GjyaeKpXWP
 N
X-Received: by 2002:adf:9bd4:0:b0:37d:4e74:687 with SMTP id
 ffacd0b85a97d-380611e1392mr28424265f8f.41.1730942633996; 
 Wed, 06 Nov 2024 17:23:53 -0800 (PST)
Received: from localhost.localdomain ([154.14.63.34])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05e5d1bsm5106125e9.40.2024.11.06.17.23.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 06 Nov 2024 17:23:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, devel@lists.libvirt.org,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 14/16] hw/microblaze: Support various endianness for
 s3adsp1800 machines
Date: Thu,  7 Nov 2024 01:22:20 +0000
Message-ID: <20241107012223.94337-15-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107012223.94337-1-philmd@linaro.org>
References: <20241107012223.94337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: 5cSYnjXNpni1

Introduce an abstract machine parent class which defines
the 'little_endian' property. Duplicate the current machine,
which endian is tied to the binary endianness, to one big
endian and a little endian machine; updating the machine
description. Keep the current default machine for each binary.

'petalogix-s3adsp1800' machine is aliased as:
- 'petalogix-s3adsp1800-be' on big-endian binary,
- 'petalogix-s3adsp1800-le' on little-endian one.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 62 +++++++++++++++++++-----
 1 file changed, 51 insertions(+), 11 deletions(-)

diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index bd8b85fa54..533a833b41 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -55,8 +55,17 @@
 #define ETHLITE_IRQ         1
 #define UARTLITE_IRQ        3
 
+typedef struct PetalogixS3adsp1800MachineClass {
+    MachineClass parent_obj;
+
+    bool little_endian;
+} PetalogixS3adsp1800MachineClass;
+
 #define TYPE_PETALOGIX_S3ADSP1800_MACHINE \
-            MACHINE_TYPE_NAME("petalogix-s3adsp1800")
+            MACHINE_TYPE_NAME("petalogix-s3adsp1800-common")
+DECLARE_CLASS_CHECKERS(PetalogixS3adsp1800MachineClass,
+                       PETALOGIX_S3ADSP1800_MACHINE,
+                       TYPE_PETALOGIX_S3ADSP1800_MACHINE)
 
 static void
 petalogix_s3adsp1800_init(MachineState *machine)
@@ -71,11 +80,13 @@ petalogix_s3adsp1800_init(MachineState *machine)
     MemoryRegion *phys_ram = g_new(MemoryRegion, 1);
     qemu_irq irq[32];
     MemoryRegion *sysmem = get_system_memory();
+    PetalogixS3adsp1800MachineClass *pmc;
 
+    pmc = PETALOGIX_S3ADSP1800_MACHINE_GET_CLASS(machine);
     cpu = MICROBLAZE_CPU(object_new(TYPE_MICROBLAZE_CPU));
     object_property_set_str(OBJECT(cpu), "version", "7.10.d", &error_abort);
     object_property_set_bool(OBJECT(cpu), "little-endian",
-                             !TARGET_BIG_ENDIAN, &error_abort);
+                             pmc->little_endian, &error_abort);
     qdev_realize(DEVICE(cpu), NULL, &error_abort);
 
     /* Attach emulated BRAM through the LMB.  */
@@ -95,7 +106,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
                           64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
 
     dev = qdev_new("xlnx.xps-intc");
-    qdev_prop_set_bit(dev, "little-endian", !TARGET_BIG_ENDIAN);
+    qdev_prop_set_bit(dev, "little-endian", pmc->little_endian);
     qdev_prop_set_uint32(dev, "kind-of-intr",
                          1 << ETHLITE_IRQ | 1 << UARTLITE_IRQ);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
@@ -107,7 +118,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
     }
 
     dev = qdev_new(TYPE_XILINX_UARTLITE);
-    qdev_prop_set_bit(dev, "little-endian", !TARGET_BIG_ENDIAN);
+    qdev_prop_set_bit(dev, "little-endian", pmc->little_endian);
     qdev_prop_set_chr(dev, "chardev", serial_hd(0));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, UARTLITE_BASEADDR);
@@ -115,7 +126,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
 
     /* 2 timers at irq 2 @ 62 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
-    qdev_prop_set_bit(dev, "little-endian", !TARGET_BIG_ENDIAN);
+    qdev_prop_set_bit(dev, "little-endian", pmc->little_endian);
     qdev_prop_set_uint32(dev, "one-timer-only", 0);
     qdev_prop_set_uint32(dev, "clock-frequency", 62 * 1000000);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
@@ -127,33 +138,62 @@ petalogix_s3adsp1800_init(MachineState *machine)
     qemu_configure_nic_device(dev, true, NULL);
     qdev_prop_set_uint32(dev, "tx-ping-pong", 0);
     qdev_prop_set_uint32(dev, "rx-ping-pong", 0);
-    qdev_prop_set_bit(dev, "little-endian-model", !TARGET_BIG_ENDIAN);
+    qdev_prop_set_bit(dev, "little-endian", pmc->little_endian);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, ETHLITE_BASEADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[ETHLITE_IRQ]);
 
     create_unimplemented_device("xps_gpio", GPIO_BASEADDR, 0x10000);
 
-    microblaze_load_kernel(cpu, !TARGET_BIG_ENDIAN, ddr_base, ram_size,
+    microblaze_load_kernel(cpu, pmc->little_endian, ddr_base, ram_size,
                            machine->initrd_filename,
                            BINARY_DEVICE_TREE_FILE,
                            NULL);
 }
 
-static void petalogix_s3adsp1800_machine_class_init(ObjectClass *oc, void *data)
+static void petalogix_s3adsp1800_machine_class_init(ObjectClass *oc,
+                                                    bool little_endian)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    PetalogixS3adsp1800MachineClass *pmc = PETALOGIX_S3ADSP1800_MACHINE_CLASS(oc);
 
-    mc->desc = "PetaLogix linux refdesign for xilinx Spartan 3ADSP1800";
     mc->init = petalogix_s3adsp1800_init;
-    mc->is_default = true;
+    pmc->little_endian = little_endian;
+    mc->desc = little_endian
+        ? "PetaLogix linux refdesign for xilinx Spartan 3ADSP1800 (little endian)"
+        : "PetaLogix linux refdesign for xilinx Spartan 3ADSP1800 (big endian)";
+    if (little_endian == !TARGET_BIG_ENDIAN) {
+        mc->is_default = true;
+        mc->alias = "petalogix-s3adsp1800";
+    }
+}
+
+static void petalogix_s3adsp1800_machine_class_init_be(ObjectClass *oc, void *data)
+{
+    petalogix_s3adsp1800_machine_class_init(oc, false);
+}
+
+static void petalogix_s3adsp1800_machine_class_init_le(ObjectClass *oc, void *data)
+{
+    petalogix_s3adsp1800_machine_class_init(oc, true);
 }
 
 static const TypeInfo petalogix_s3adsp1800_machine_types[] = {
     {
         .name           = TYPE_PETALOGIX_S3ADSP1800_MACHINE,
         .parent         = TYPE_MACHINE,
-        .class_init     = petalogix_s3adsp1800_machine_class_init,
+        .abstract       = true,
+        .class_size     = sizeof(PetalogixS3adsp1800MachineClass),
+    },
+    {
+        .name           = MACHINE_TYPE_NAME("petalogix-s3adsp1800-be"),
+        .parent         = TYPE_PETALOGIX_S3ADSP1800_MACHINE,
+        .class_init     = petalogix_s3adsp1800_machine_class_init_be,
+    },
+    {
+        .name           = MACHINE_TYPE_NAME("petalogix-s3adsp1800-le"),
+        .parent         = TYPE_PETALOGIX_S3ADSP1800_MACHINE,
+        .class_init     = petalogix_s3adsp1800_machine_class_init_le,
     },
 };
 
-- 
2.45.2

