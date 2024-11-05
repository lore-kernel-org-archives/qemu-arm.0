Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2807600njc;
        Tue, 5 Nov 2024 05:07:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXUzBXmfj67Didp/vTS+RPMPDzOJMjvq3IIk/QeUdMtXyW2kHaYsfBuTxAfhmeeeZmySGOLJbkOB7/BTw==@linaro.org
X-Google-Smtp-Source: AGHT+IF3KU+WACFKIYTZq/zDNHAo9bdjdUGuh19fZW1IbYO68w1mEHJosOIbaQnQCNc4lihqh35/
X-Received: by 2002:a05:620a:f04:b0:7b1:12f5:7af5 with SMTP id af79cd13be357-7b2fb950d71mr2478882885a.3.1730812061939;
        Tue, 05 Nov 2024 05:07:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730812061; cv=none;
        d=google.com; s=arc-20240605;
        b=i4NB6eWwOdtJGrJudErKCoch/fNwJTCafLiFuG2lLsnIq6MwgK2d6l93WdNaiyTkw2
         kuA1vO8k43dTBBvymzdgH7a9CdD3+sQm83ZFAR6D9lqO1wtSWhdgkenaxy4D4QWc45KS
         MhGPuI0CE2p2LYbeCgsN5eSlkTvK69kbpsVyaoieHoyWNU73WHcbjNUZEU+rG/g/ro0t
         CPVaOt9UQ/KClx8b3mUeTu3l8BoQc6bZ+yFYmhbPReOU8bszRn623QE+zSgH3uo6/D1J
         4nFFQ1KQ0G50PTxcnqJyFxgwnurLht38iUyRC9lzKZTlvtsL9II0yDEO32SRRc92V5e+
         KXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=haV4HgajOuBZyaKR8WLf7rNEDHwvap87jZ2MipEC/AA=;
        fh=76g7BlE/RD9+PdxLwykKqvOpTTyKHNSOHqaw+/ImHzU=;
        b=aYWLx9ERneW0+TSfF4XCRSokJv5hnQ8+PPFyy78c+BqfqR4y12FaGnFGKBjjCOKtZn
         P39mCyBoRoJk+wdNUY3g/J/HOCUaXNlTUQwR2OaIRe62qqaVJDpx/ymJrse2JXHTObMy
         EzmRbXR9oBWYARptox91Fsbg3R5YmyTJd1wtq8ieEElPqDsN6A6T5ZX0aKX8qwDAXQUH
         SydTkjHSTot2BV6tFheF0mnqqg2kmcaE0wgi2WMN2SK6QnRIg8XqrSRcZAR31KeWepEC
         JXA2kjixbib39wjs39fs3Hn222hfuFEYJldoNVh4UruouRuqEQ1Fp5Wj7SgleWdfiuei
         AGgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s1Aiu+VY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3aae284si1308791685a.535.2024.11.05.05.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:07:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s1Aiu+VY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8JHL-0007se-KN; Tue, 05 Nov 2024 08:07:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JHI-0007Wp-HH
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:07:24 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JHG-0002ii-GV
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:07:24 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43193678216so46703385e9.0
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 05:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730812041; x=1731416841; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=haV4HgajOuBZyaKR8WLf7rNEDHwvap87jZ2MipEC/AA=;
 b=s1Aiu+VY1z0Dm2oTkkBy6GKbQsiTcUGXL1TDRUg1ujpQLdQtoFGAFnbVFYCScpwBH4
 9UyngPnCQre4b8mfU6IzxXwc/MwnBctuc/iYS/kTCzHsPCc8e86fpVhha57CTRLq3mgp
 d7gUBTscT7zlyzZuWu2f3n6EofCAq1qDYvCwvtll3e+2/iV8/LwLzylRHvO4rtFvg4TM
 zf9CoFOnFaTYkYJ0LyuufnvucqdCXZg0uhmwkueQ9N9kSwBVsFKv0Ox5dw7Gz9SJUL41
 XxoiGmXzO2ah9VPUWUva42gyZYYTVhVCVB9ckwZP5r2v8ciV5co29hVlZF73reXFobEB
 CStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730812041; x=1731416841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=haV4HgajOuBZyaKR8WLf7rNEDHwvap87jZ2MipEC/AA=;
 b=bDMT23Ub8k8bjH6ExIQ2w6WVSc/HZF92WBvw16JlpDqQ3i3Yg05/aevlzobs1IdzQq
 fdPzYgBD+6d/oUrQwpVF8Lp3zbAX/uB/DWGJ/CinR4WUq5GzA+JBpAHB7LZIwkewIHx0
 SZlBlKbqr8csfegYMtSMvaVmF3TpxVCjN4CJ9JAJkny772URiwBUpxHFyuJ8iX98QVT6
 KZqVZVDhufgO3RB4U6VKR4qnfojZzhHv9UxHo5f1RdZbxjEZ7wCQO0U6dBA/9Axwb65K
 W8JkiCjEQbQFQabIBpYB5y5qPqqlQMMYpnpzAvK7My6WyTvCAlOUyVaMvAqZUS6lS5wk
 y4eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkFxZtT0TrocZ5SJyRk9EzcfQptmZKFqKBpanxYzaLK+QL/00G1qf0op/lEz6bxYOzBGrnTOYThg==@nongnu.org
X-Gm-Message-State: AOJu0Yx7eWuY6Yf1ZhV4ghKdRWgQLx+y0U9DHEdTwECUU19DcBUxUW5s
 R0+6yMs1OwtinNanTh5MFz2Rs0bjaiwfp0JvVVJqzyJPhB/J77GBZNyw5izPqzWvULAmnZcsw59
 YKpc=
X-Received: by 2002:a05:600c:4f83:b0:42c:c28c:e477 with SMTP id
 5b1f17b1804b1-4319ad089b0mr277982415e9.23.1730812040858; 
 Tue, 05 Nov 2024 05:07:20 -0800 (PST)
Received: from localhost.localdomain (86.red-88-29-160.dynamicip.rima-tde.net.
 [88.29.160.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd8e8471sm226896305e9.4.2024.11.05.05.07.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 05:07:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 17/19] hw/microblaze: Support various endianness for
 s3adsp1800 machines
Date: Tue,  5 Nov 2024 14:04:29 +0100
Message-ID: <20241105130431.22564-18-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241105130431.22564-1-philmd@linaro.org>
References: <20241105130431.22564-1-philmd@linaro.org>
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
X-TUID: 9ptV/tCMMfAu

Introduce an abstract machine parent class which defines
the 'little_endian' property. Duplicate the current machine,
which endian is tied to the binary endianness, to one big
endian and a little endian machine; updating the machine
description. Keep the current default machine for each binary.

'petalogix-s3adsp1800' machine is aliased as:
- 'petalogix-s3adsp1800-be' on big-endian binary,
- 'petalogix-s3adsp1800-le' on little-endian one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 55 +++++++++++++++++++++---
 1 file changed, 48 insertions(+), 7 deletions(-)

diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 8407dbee12a..f5195327b76 100644
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
@@ -123,33 +134,63 @@ petalogix_s3adsp1800_init(MachineState *machine)
     qemu_configure_nic_device(dev, true, NULL);
     qdev_prop_set_uint32(dev, "tx-ping-pong", 0);
     qdev_prop_set_uint32(dev, "rx-ping-pong", 0);
-    qdev_prop_set_bit(dev, "access-little-endian", !TARGET_BIG_ENDIAN);
+    qdev_prop_set_bit(dev, "access-little-endian", pmc->little_endian);
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
+static void petalogix_s3adsp1800_machine_class_init_be(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    PetalogixS3adsp1800MachineClass *pmc = PETALOGIX_S3ADSP1800_MACHINE_CLASS(oc);
 
-    mc->desc = "PetaLogix linux refdesign for xilinx Spartan 3ADSP1800";
+    pmc->little_endian = false;
+    mc->desc = "PetaLogix linux refdesign for xilinx Spartan 3ADSP1800 (big endian)";
     mc->init = petalogix_s3adsp1800_init;
+#if TARGET_BIG_ENDIAN
     mc->is_default = true;
+    mc->alias = "petalogix-s3adsp1800";
+#endif
+}
+
+static void petalogix_s3adsp1800_machine_class_init_le(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    PetalogixS3adsp1800MachineClass *pmc = PETALOGIX_S3ADSP1800_MACHINE_CLASS(oc);
+
+    pmc->little_endian = true;
+    mc->desc = "PetaLogix linux refdesign for xilinx Spartan 3ADSP1800 (little endian)";
+    mc->init = petalogix_s3adsp1800_init;
+#if !TARGET_BIG_ENDIAN
+    mc->is_default = true;
+    mc->alias = "petalogix-s3adsp1800";
+#endif
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

