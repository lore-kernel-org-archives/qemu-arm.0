Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2544682ejf;
        Tue, 27 Feb 2024 00:45:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVe1PhHC7xgordOVctMlcZA+A4VI1G48uKcu8PwZMaH/VOD6HJuHjVmucOdvCFVI/G9qR3KJ+YCoXAKv+N/0MA8DLtSt0dt
X-Google-Smtp-Source: AGHT+IGY9xksGp0ZsAcr/pyHUEqZH2j8mktm+jp4VUk3tjSt1AliSB+6jTnUpLzR6liVb/vESLTV
X-Received: by 2002:ad4:5fc7:0:b0:68f:4a0d:30c6 with SMTP id jq7-20020ad45fc7000000b0068f4a0d30c6mr2435643qvb.38.1709023518231;
        Tue, 27 Feb 2024 00:45:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709023518; cv=none;
        d=google.com; s=arc-20160816;
        b=nYDnXLYp2EumllSv3x1TCe/U0fGeaFsNHA2NHlRubn0vOZ4dBfqXP9auuMj2dS1m/b
         4ExSmnlQoPYfNvqz5W6zVXANC/SDgUikJ+GKMY5s9T1eVN9wCzGAlj+t3OjewrwtuIKt
         LvSZuq4UAtZmqlZku830lnRVU33xmCJS+7U6QbA50QiBGj3w6S75IiWH7t33cpRgLpKV
         pnx31AsYLKES8iJuWKLenpoXl7sXel7cnpYhrSoNoeIgNW9J7DgBuXDZxtWZlH+fXTl3
         lf1fG+0BkQ8q8FU1fbYWAWs0s0lyRpOhgi+7AjMFAkUK5xNwlDMtqAJbjI6wkkBoPazT
         eusw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AxCElssAJQElNOBysOkvX3JvR87QOEk2FLy7QknFoAM=;
        fh=fKbLHIzv/9WPW4AmHhm1tnDrMvJSyxCS6JVmMw5y3v0=;
        b=LTbllV0FC7NW09YtQgshSuMwScWy7+JwNiwVohhJeNTCVGP4wOHDgVyrFdGsT04AcT
         GGqCHAJSr6g4L4HMlJdnhvUdw8Gg8p9W4XABhxXmMDPWGdj/8JZWYfZTwblVfsg65Byf
         ocG8MMwtpXVB8LqpAgMolX08CBtfCFXDnzsQKLpEe+0z1gsiFSJBNQnjJ2AVulujQ/B/
         LJ6y34zsVSQAxApYlHrDMxdM1DuxWsMkTWOtHXpKFhRoAFeiNNmnGhCFqk9+u5Ts/+Ow
         nl7IQKC+6dGM5VDMGKvWWpHTojyqQr6HzAXIKbxmmQYEzjIBtvTpKpyXabkcePRAoBtO
         aEuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VQ1Mkk1C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12-20020a0562140cac00b0068cb7b24a38si6809581qvs.339.2024.02.27.00.45.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:45:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VQ1Mkk1C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ret31-0005Af-FA; Tue, 27 Feb 2024 03:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret2z-0004yX-AU
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:42:45 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret2x-0008SB-3D
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:42:45 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33dcd8dec88so1401159f8f.1
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709023361; x=1709628161; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AxCElssAJQElNOBysOkvX3JvR87QOEk2FLy7QknFoAM=;
 b=VQ1Mkk1Cj7SDrEYNCK4co8bU44HBS3UTI1F3lBj8WG854/q2G2+oDSOkXB5UTyLobB
 2pVtPBq1KqmILs1cJ/0TQatYNgfdvnHOnUeBls84TJaBZljdfvtehnaSgReX+lDTdjNn
 5XcOb7Fn8wkcKGKmNnrPTA7k1O3eLsWGzEwsHt38jp/SaFG2Hr2/rGA1bI6abH/geVlk
 7GeREy4TTF4htOmYT0z2Lp5VPPkDKJQ6BhATsUtOnPtWF6YFg4T2iiBPmz84bQTXh6la
 QIqk015TePbaeBf+5C4K2YJtz4B09Q9MwJRKe6grSXeOU8vysTr5HRKu+ftTyUgCSovN
 SOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709023361; x=1709628161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AxCElssAJQElNOBysOkvX3JvR87QOEk2FLy7QknFoAM=;
 b=g/mOBv4kpRcBH0x81uKQW1ZaiiRJk/iJ9T2RdIk80bo6wQBK/2jsprNYmUer2bXzVd
 2lAFmqzbZP0cq0tPjl+hoIDccU31JDnfOO010OHc1pxEKPgjkKIP8SR/cQaWR/k16pry
 4feuIShdtaNV4t4SLvVi0amQ+BLLh+E7q7Atz9CnPlm5xsp81YYU2n0LsnXdDE5+gCTD
 Uoc52o/dZvlv2i8zY1ntAp03a9u1N3emb72x9WUPmUOznSxjspyjrjNkg4tCnBjJ+5Gz
 5AIt75S0mxtv4TYkrKrIGm38XuOXt2J558HDPMV8FNZlPhOGl4vpoKRZ5R6Z+2FHkqPi
 /Z2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFA1RXZ/YLPw/pvEvZmHCCZ0B9jHbiGW/U4cp+H6+aLdWpo6eWGHj1NwkT7gmjgVahPTPkl2UfPHByGcSQXRz7owOz
X-Gm-Message-State: AOJu0YxruwMB1L7Qvd94++5VERjQIXZx39TkEvjPzHT4JNukop98y1Fe
 argcq6U7TZO7DKNOnM2A7XenyBOQANrBr+fEVB9zSmlcoF9d4Mc3cH00Q/w4oiU=
X-Received: by 2002:adf:f10a:0:b0:33d:afc6:3ba6 with SMTP id
 r10-20020adff10a000000b0033dafc63ba6mr7099097wro.34.1709023361722; 
 Tue, 27 Feb 2024 00:42:41 -0800 (PST)
Received: from m1x-phil.lan (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 r29-20020adfa15d000000b0033de7a30b4fsm2031402wrr.26.2024.02.27.00.42.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Feb 2024 00:42:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 27/30] hw/i386/pc: Populate RTC attribute directly
Date: Tue, 27 Feb 2024 09:39:43 +0100
Message-ID: <20240227083948.5427-28-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240227083948.5427-1-philmd@linaro.org>
References: <20240227083948.5427-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: AkzhQDRKU5cn

From: Bernhard Beschow <shentey@gmail.com>

Both the piix and the q35 machines introduce an rtc_state variable and defer the
initialization of the X86MachineState::rtc attribute to pc_cmos_init(). Resolve
this complication which makes pc_cmos_init() do what it says on the tin.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Message-ID: <20240224135851.100361-6-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c      |  8 --------
 hw/i386/pc_piix.c | 15 +++++++--------
 hw/i386/pc_q35.c  |  7 +++----
 3 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a80f809b83..880e95de26 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -611,14 +611,6 @@ void pc_cmos_init(PCMachineState *pcms,
     mc146818rtc_set_cmos_data(s, 0x5c, val >> 8);
     mc146818rtc_set_cmos_data(s, 0x5d, val >> 16);
 
-    object_property_add_link(OBJECT(pcms), "rtc_state",
-                             TYPE_ISA_DEVICE,
-                             (Object **)&x86ms->rtc,
-                             object_property_allow_set_link,
-                             OBJ_PROP_LINK_STRONG);
-    object_property_set_link(OBJECT(pcms), "rtc_state", OBJECT(s),
-                             &error_abort);
-
     set_boot_dev(s, MACHINE(pcms)->boot_config.order, &error_fatal);
 
     val = 0;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 49d5d48db9..ce6aad758d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -112,7 +112,6 @@ static void pc_init1(MachineState *machine,
     Object *piix4_pm = NULL;
     qemu_irq smi_irq;
     GSIState *gsi_state;
-    ISADevice *rtc_state;
     MemoryRegion *ram_memory;
     MemoryRegion *pci_memory = NULL;
     MemoryRegion *rom_memory = system_memory;
@@ -276,8 +275,8 @@ static void pc_init1(MachineState *machine,
         }
 
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(pci_dev), "isa.0"));
-        rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
-                                                             "rtc"));
+        x86ms->rtc = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
+                                                              "rtc"));
         piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
         dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "ide"));
         pci_ide_create_devs(PCI_DEVICE(dev));
@@ -288,9 +287,9 @@ static void pc_init1(MachineState *machine,
                               &error_abort);
         isa_bus_register_input_irqs(isa_bus, x86ms->gsi);
 
-        rtc_state = isa_new(TYPE_MC146818_RTC);
-        qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
-        isa_realize_and_unref(rtc_state, isa_bus, &error_fatal);
+        x86ms->rtc = isa_new(TYPE_MC146818_RTC);
+        qdev_prop_set_int32(DEVICE(x86ms->rtc), "base_year", 2000);
+        isa_realize_and_unref(x86ms->rtc, isa_bus, &error_fatal);
 
         i8257_dma_init(OBJECT(machine), isa_bus, 0);
         pcms->hpet_enabled = false;
@@ -316,7 +315,7 @@ static void pc_init1(MachineState *machine,
     }
 
     /* init basic PC hardware */
-    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, true,
+    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, x86ms->rtc, true,
                          0x4);
 
     pc_nic_init(pcmc, isa_bus, pcms->pcibus);
@@ -343,7 +342,7 @@ static void pc_init1(MachineState *machine,
     }
 #endif
 
-    pc_cmos_init(pcms, rtc_state);
+    pc_cmos_init(pcms, x86ms->rtc);
 
     if (piix4_pm) {
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 9e4b8f79c2..45a4102e75 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -125,7 +125,6 @@ static void pc_q35_init(MachineState *machine)
     Object *phb;
     PCIDevice *lpc;
     DeviceState *lpc_dev;
-    ISADevice *rtc_state;
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *system_io = get_system_io();
     MemoryRegion *pci_memory = g_new(MemoryRegion, 1);
@@ -232,7 +231,7 @@ static void pc_q35_init(MachineState *machine)
     }
     pci_realize_and_unref(lpc, pcms->pcibus, &error_fatal);
 
-    rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(lpc), "rtc"));
+    x86ms->rtc = ISA_DEVICE(object_resolve_path_component(OBJECT(lpc), "rtc"));
 
     object_property_add_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
                              TYPE_HOTPLUG_HANDLER,
@@ -274,7 +273,7 @@ static void pc_q35_init(MachineState *machine)
     }
 
     /* init basic PC hardware */
-    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, !mc->no_floppy,
+    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, x86ms->rtc, !mc->no_floppy,
                          0xff0104);
 
     if (pcms->sata_enabled) {
@@ -312,7 +311,7 @@ static void pc_q35_init(MachineState *machine)
         smbus_eeprom_init(pcms->smbus, 8, NULL, 0);
     }
 
-    pc_cmos_init(pcms, rtc_state);
+    pc_cmos_init(pcms, x86ms->rtc);
 
     /* the rest devices to which pci devfn is automatically assigned */
     pc_vga_init(isa_bus, pcms->pcibus);
-- 
2.41.0

