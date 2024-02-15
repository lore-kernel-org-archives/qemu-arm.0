Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp740827ejb;
        Thu, 15 Feb 2024 10:06:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX9HTBBoAm1zBO1SU0VlukQjmQbKftkTY7TIOeyMYr9t8h2vG1x+baq67LW9grfmtznO1CQCJYxzirAEhQhopOAcZWLHL5v
X-Google-Smtp-Source: AGHT+IE4QUd0B7/8NHGo8vo4pmKg53nhyd6S3WZmEIIiAnexbHOXnFPcWRm80H5TSXkCVMyrkaqb
X-Received: by 2002:a05:6830:4120:b0:6e2:efbb:3273 with SMTP id w32-20020a056830412000b006e2efbb3273mr2874578ott.20.1708020362688;
        Thu, 15 Feb 2024 10:06:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020362; cv=none;
        d=google.com; s=arc-20160816;
        b=RxlU91qS8hNvomo/0ioOW+YW76+U5ouNbPb3W3eezTTkjuUTYNlp80Un3s7wpEkG1x
         O6Teb1NyUsmIHpmkcCpLGdU08VMvAykISUN5pF7nL0GboL+e+nDzxu9shqAr8McdLm6+
         5oEqAH8n5NAHwgkcpRrxUQXIDUqW80UUnv+1jaPW4SE3M9xC9bFafxwxkHD+KnSI9eAr
         +9gFtMwr9VtibDXLCZbX2p8efVnd7ehHUrbyEIaJUP2GEqqwH5ku7qFbnEAuz4Fh71ub
         yhf3Nm6Kofn2iMSUc2eDoJHxkXzzZEm2zyI84/OM3TtTQpm3SMrM6CVlUOfcMY5wY5D8
         jRig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Lw97jjpNW0qnluWLs9FH7pp1lrQFlkFyUFYsFWqMU1o=;
        fh=mrokAqtAVSt+T/rArtcjy5KpWXznXH0vHAG5GMmNFuQ=;
        b=cQHfrSj5f53vxtof46PFrcQL+f7fqH5iFV/dNEtTdP5KNrguQt+lE9iqJDmZHGu1DS
         /PsmfBA1EeB06wyl+vHpZWH6AQXgI4JZBTyJSt3unlvwuk/VrRMIfYwyMio01MpC86S2
         NKakgiEULywcHXOC9Ml/zKOVLHrSNRWVyHPEX2YsDgZHCb7TBNbWa12LZzuLqcsn6M42
         IDYe4pK6iGm0zeRlO0ewtIr6RCGnrGrIw680QB5KhAkoxY8ZuKzLGeLb4GKHMZMxBLBA
         EZu7UW4tMe7rgU9f0Occcnrknh5/BvDQMywWjohVn1f7BsGQWH2hwDik25Jpn8Utpxwi
         xtrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v28xvI8E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020a056102150b00b0046afbbbd4ccsi430752vsv.34.2024.02.15.10.06.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:06:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v28xvI8E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag5R-000295-I4; Thu, 15 Feb 2024 13:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag51-0000ni-K5
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:03:27 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag4z-000380-My
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:03:27 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a271a28aeb4so150502866b.2
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 10:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020204; x=1708625004; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lw97jjpNW0qnluWLs9FH7pp1lrQFlkFyUFYsFWqMU1o=;
 b=v28xvI8EPp4Cg5DXIfPVVTDliY50wUlIWSRMVitpklKSyP3vShtfYSs4KEZL5VGjQt
 HoYjvJk2zYibKyw0qh/6MOX3TnbkVd7rBtZZC52aSASvG4MeI11sC4eqKLXmbP1TH3+W
 b+GB0sC1mtRzg0M6Lt12Zh+ELdIFY59nV2CGLoJe0/+L35qcSMEzt4KYfs/0/TiPXYpG
 6qGeMcqKTf7/XapkEcZc44vKGBAsepXd8yARdH0DYSft7+HEgzvHcSSwg5gZDDFbg+Nk
 kgX7dSM1fqJeOLsNakbC8hjZ6/yKOc7jLp0Mz9nMaEL8irUyhHNq3Zxkk0vjTvVFZbBA
 Z75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020204; x=1708625004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lw97jjpNW0qnluWLs9FH7pp1lrQFlkFyUFYsFWqMU1o=;
 b=RlLInIlcvuFYbj/8tE0GSupvXj/g7TVtDD4xjAZ4GbItqLplz2IGgEVrV0wDsLuggQ
 F5zAWtJfiWDugIRlM1qhmbq5mrie7EzPEe/Pkh0CsaEa+kA2ojn81g6RxTB3RFmpdqhI
 +dzIKXNtvDus6d3ed5tpc0wq/ueXyDzsmwQ+lxvVFN9i16JNIlJvCBclz6u+Ohw6Cv34
 ZufvXV+OktiXZtMPnqJvYHuICYqZl/abuVMXvbphbq+ZGjjyx3KgYtaQTz8rBKcVdd4J
 QKkROub/2914QhNeF1D/zqTBAYNQoSuzooMyV5e0YGOwX15OT1hNcaKPT5UlfIA+3jjd
 cd0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrAi8KkKIiuucrJVK+t2XM9qkwy066onEM0oxuul3OsZ1dJYj/rr6B9SRNq1JeLmDDoInqHk0Q9S5YVMs1khAe8TBW
X-Gm-Message-State: AOJu0YzlZZ78cWI0KIRXuu0CxXH4CGsLZ65WMSw/4w9r+jQelr2x33ko
 B6e2P1ryuQij2OcyENyTJMA8KvOZHkTU9HF9oMN0kq7yk84PMD2aboSbPtYVrTM=
X-Received: by 2002:a17:906:494e:b0:a3d:88be:94d7 with SMTP id
 f14-20020a170906494e00b00a3d88be94d7mr1603043ejt.70.1708020204492; 
 Thu, 15 Feb 2024 10:03:24 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 wb13-20020a170907d50d00b00a3d28aa375bsm771690ejc.151.2024.02.15.10.03.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:03:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 49/56] hw/ide/ahci: Rename AHCI PCI function as 'pdev'
Date: Thu, 15 Feb 2024 18:57:43 +0100
Message-ID: <20240215175752.82828-50-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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
X-TUID: z4sGuT7v5MgE

We want to access AHCIPCIState::ahci field. In order to keep
the code simple (avoiding &ahci->ahci), rename the current
'ahci' variable as 'pdev'

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240213081201.78951-4-philmd@linaro.org>
---
 hw/i386/pc_q35.c | 15 ++++++++-------
 hw/mips/boston.c | 10 +++++-----
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 76b3b6032b..a89f900c4c 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -134,7 +134,6 @@ static void pc_q35_init(MachineState *machine)
     GSIState *gsi_state;
     ISABus *isa_bus;
     int i;
-    PCIDevice *ahci;
     ram_addr_t lowmem;
     DriveInfo *hd[MAX_SATA_PORTS];
     MachineClass *mc = MACHINE_GET_CLASS(machine);
@@ -292,16 +291,18 @@ static void pc_q35_init(MachineState *machine)
                          0xff0104);
 
     if (pcms->sata_enabled) {
+        PCIDevice *pdev;
+
         /* ahci and SATA device, for q35 1 ahci controller is built-in */
-        ahci = pci_create_simple_multifunction(host_bus,
+        pdev = pci_create_simple_multifunction(host_bus,
                                                PCI_DEVFN(ICH9_SATA1_DEV,
                                                          ICH9_SATA1_FUNC),
                                                "ich9-ahci");
-        idebus[0] = qdev_get_child_bus(DEVICE(ahci), "ide.0");
-        idebus[1] = qdev_get_child_bus(DEVICE(ahci), "ide.1");
-        g_assert(MAX_SATA_PORTS == ahci_get_num_ports(ahci));
-        ide_drive_get(hd, ahci_get_num_ports(ahci));
-        ahci_ide_create_devs(ahci, hd);
+        idebus[0] = qdev_get_child_bus(DEVICE(pdev), "ide.0");
+        idebus[1] = qdev_get_child_bus(DEVICE(pdev), "ide.1");
+        g_assert(MAX_SATA_PORTS == ahci_get_num_ports(pdev));
+        ide_drive_get(hd, ahci_get_num_ports(pdev));
+        ahci_ide_create_devs(pdev, hd);
     } else {
         idebus[0] = idebus[1] = NULL;
     }
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index cbcefdd693..0ec0b98066 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -677,7 +677,7 @@ static void boston_mach_init(MachineState *machine)
     MemoryRegion *flash, *ddr_low_alias, *lcd, *platreg;
     MemoryRegion *sys_mem = get_system_memory();
     XilinxPCIEHost *pcie2;
-    PCIDevice *ahci;
+    PCIDevice *pdev;
     DriveInfo *hd[6];
     Chardev *chr;
     int fw_size, fit_err;
@@ -769,11 +769,11 @@ static void boston_mach_init(MachineState *machine)
     qemu_chr_fe_set_handlers(&s->lcd_display, NULL, NULL,
                              boston_lcd_event, NULL, s, NULL, true);
 
-    ahci = pci_create_simple_multifunction(&PCI_BRIDGE(&pcie2->root)->sec_bus,
+    pdev = pci_create_simple_multifunction(&PCI_BRIDGE(&pcie2->root)->sec_bus,
                                            PCI_DEVFN(0, 0), TYPE_ICH9_AHCI);
-    g_assert(ARRAY_SIZE(hd) == ahci_get_num_ports(ahci));
-    ide_drive_get(hd, ahci_get_num_ports(ahci));
-    ahci_ide_create_devs(ahci, hd);
+    g_assert(ARRAY_SIZE(hd) == ahci_get_num_ports(pdev));
+    ide_drive_get(hd, ahci_get_num_ports(pdev));
+    ahci_ide_create_devs(pdev, hd);
 
     if (machine->firmware) {
         fw_size = load_image_targphys(machine->firmware,
-- 
2.41.0

