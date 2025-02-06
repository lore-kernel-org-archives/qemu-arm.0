Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1524661njb;
        Thu, 6 Feb 2025 05:13:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU80Xe1XUWtxzdKCSRuKsO7naZi4tAWJhIcSHYcJHjqX6c6nZDUkh26/QvDL3Z5RL7wxTW/VM5AsGREUw==@linaro.org
X-Google-Smtp-Source: AGHT+IH6LZ6r0ul3bjsikmqwOykauIfIES5FYAM6NGMm5rJT7BFiv3H0mmtq74BkNVjrOZdcvTui
X-Received: by 2002:a05:6122:2488:b0:518:8753:34aa with SMTP id 71dfb90a1353d-51f0c50c659mr3968647e0c.10.1738847595567;
        Thu, 06 Feb 2025 05:13:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738847595; cv=none;
        d=google.com; s=arc-20240605;
        b=a3RQQgKwBonnxhHEnXkBB+83DLUvAmuzINGsZXpcE9qi5As5fos6dhdxv4Ykbe3TAu
         2V7GvipG/iuRiyjw+xfkaI9CAaK6nLh1kbKBpIDkUuAjIkFvmxfsmJRtrO6yf0TDfgvI
         ThPqpNHwNIyOGUdi15cZIOQtguYJ05N2qehs3E87v7k1B490jvkkPeS4qq8NqLsTXiQT
         gRmMPjZEbwOMwHc8/uqzDBt7vo4GL9iwyAxFGYeDl4YXJ0tB7g7sPY0Ab8/HlrCLYhZc
         6tN/E20MO4A5f029PS34UWP/LM7p12c86OY+XusRGsfkhvauqfCeh9NHA35rpAy7z5rF
         qbBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Y5yL8FD/exSYKs1rjCaM0CVY1gRhFjhBlCLpvUbDQjM=;
        fh=7NsVx5R+L140HvZ0es4udPXCD2KdHoHcZm3kdyNBbE4=;
        b=ZmvWUIZ+5mXJxFUJuOxAvhzjUCJe0ECJCP0BmSqum+ASL5j8HOK7sISmyg9dpVtlbr
         EtNwYLphBu2B9vMECHT0tBAsqF/C7k+YDUEwk128BYSbP6mKkQL+MiMXBMEVOij8Zh4N
         sHs4Q6Z7wcuAKAZkcx4YU4yOJjv1Cwzys6uRqijW3c2LYmM9DH2SHoqVxeZoYUcCxeOE
         pDJelXawAngg3wUUwd6MBQdryo/kJiiNVJvPEI+2KIxkqI9dofpl0jvf47SxmoW1ZxSS
         cpGAS0RxbwlmLt/0ymNXog+N95Bf/8RAUxNO1fRMVv9mL+zXCogXHsBidbaFc1yvB+6P
         MD2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vVR3F3iB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51f22798a1esi146814e0c.96.2025.02.06.05.13.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 05:13:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vVR3F3iB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg1fi-0005pm-SR; Thu, 06 Feb 2025 08:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fd-0005ie-OB
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:11:54 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fb-0008D0-Ji
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:11:53 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so5943825e9.3
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 05:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738847510; x=1739452310; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y5yL8FD/exSYKs1rjCaM0CVY1gRhFjhBlCLpvUbDQjM=;
 b=vVR3F3iBasdjciRsJQWA2uKaG/TtfHkLoBXGOoqxQBga6RCwd4Mjg1ZU1Ob5gLDFvX
 fRB8NHE3LJ3q1+VRi7lmbANARVWYupD88nE5lpjDq+w77bRc6WLvylwyFe2J0CyaC82X
 jjfCZiZvt3f8q0wdflJmWvBP5FrEqLGZPqhRDFchATvwTH0FbAj5HQq0ykP2ebh2HEpp
 cdC17g3jMvQdV3CgQq9TWyKcj+X68p1gBU6l9Fc/ejEk9sra7vunYDw29VcphE+/wvXX
 N3m72f2Cdt1CO/WPnzDX3tNqEf5ndBuxl8VCGFvRUiuZjj1ShLl1speG0z9Qpb6DDbsr
 4g7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738847510; x=1739452310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y5yL8FD/exSYKs1rjCaM0CVY1gRhFjhBlCLpvUbDQjM=;
 b=ku0GT/GneQyWdE8B/3DaQivqXIZCxASLvB8612f1bZMzk6wCNrqUvHr8s4fEQz3ZRd
 fXMEUIplgoBnaHE16vRZtFyWMztCYfGLx30uUqJM75lTf1/g1crW5yXheMVH5DMbij6y
 mrjmO3ACYPLVDCLzyZgNIcKKPvLyp1q8Amdxj83i8MPj1uHMQGay+ez8uDKbCqPRUd7d
 H7pbcjm8CrG28uKrrj6ze/10+Z3EhQJQLTiq8Gvndti+3k/hIcOM5kQH4Q0ij1kRSjI2
 8mw0HmGNSSsaXZ7hJs8aO1Kbc1BPm3UHpwEYuEPBgUR/Y2O/yUtAy6d+0aWmVXh4xpIK
 eoQQ==
X-Gm-Message-State: AOJu0YwVTz0x5T0ue8zr0Hhm3qIZkNHCksZhd21eRUDW7s/ES565U/Tv
 9iw3HC9CdR6rE8pRWzFxdkvVvKqHU1TY6O6fAHtZkpgqfWVdKsY5T04hUDhGwBQ=
X-Gm-Gg: ASbGncsj5GQD3s0RfW2ZFN2m67txsdmOf/B38BbBzU04h/4dGw0TdZIK+x8irQP+C1z
 +eON/tECikw+eic2WEJf0fbhqspB1AQQeqtn/0z8MLTnQbCEAlu+7/kPO3Q2G684xasMImjXH2u
 pNzz43FeFOywxCPllTSPccwbu66o+a0eafSNGjnoUv287kIyU1b3nWWlxoCdJYOu6XDiFEixgId
 EyQNUGcN8Fc0MpgOzXfwho55jW0SrjukIEiHr0SnlDa/5I7DKpZ+rTIiq+OzEchgijrnQKr9CR9
 FsHzjVpTGGtaIveYop6cQffvmc9aAAvxMf4J1RN3EeVysPJ1cqCjcnBcCtZyCcBNSQ==
X-Received: by 2002:a5d:6d8c:0:b0:38d:c2d4:2399 with SMTP id
 ffacd0b85a97d-38dc2d425admr1321247f8f.41.1738847510203; 
 Thu, 06 Feb 2025 05:11:50 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d94d802sm57701525e9.12.2025.02.06.05.11.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 06 Feb 2025 05:11:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 11/16] hw/microblaze: Support various endianness for
 s3adsp1800 machines
Date: Thu,  6 Feb 2025 14:10:47 +0100
Message-ID: <20250206131052.30207-12-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206131052.30207-1-philmd@linaro.org>
References: <20250206131052.30207-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: XRR5+zcQuiNi

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
index 96aed4ed1a3..aea727eb7ee 100644
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
@@ -123,7 +134,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[TIMER_IRQ]);
 
     dev = qdev_new("xlnx.xps-ethernetlite");
-    qdev_prop_set_bit(dev, "little-endian", !TARGET_BIG_ENDIAN);
+    qdev_prop_set_bit(dev, "little-endian", pmc->little_endian);
     qemu_configure_nic_device(dev, true, NULL);
     qdev_prop_set_uint32(dev, "tx-ping-pong", 0);
     qdev_prop_set_uint32(dev, "rx-ping-pong", 0);
@@ -133,26 +144,55 @@ petalogix_s3adsp1800_init(MachineState *machine)
 
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
2.47.1

