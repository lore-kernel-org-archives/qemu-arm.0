Received: by 2002:a17:906:2499:b0:a38:6d10:c5dd with SMTP id e25csp378951ejb;
        Tue, 13 Feb 2024 00:13:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjYn3+82bOGCuKAnXqxHWPR5OnafOhSaEqiyRs0MXkxap76Vejl/MCONYpkTmSFPgHMX38
X-Received: by 2002:a05:620a:ec8:b0:785:aeb7:5ead with SMTP id x8-20020a05620a0ec800b00785aeb75eadmr8153641qkm.75.1707812009573;
        Tue, 13 Feb 2024 00:13:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707812009; cv=none;
        d=google.com; s=arc-20160816;
        b=P5bq6lyKXUzh8vBIIC3DxnNMzjC/ewm/VzZGhy2bAqs0gwSvVBxPUSPSDFX8/sN00C
         vsd3rF0/tTIFlE72CApWUxzZXCaAq2YoAdA+hgWa1QEnnD+DYjf3WQWaUTizey/DduK0
         Pg35JRneJGZKp3/bB8YgDgT2ldx0fMRRblZA0P6jDittX42lRhOwA3G1nJYuuPdH5W0c
         FESMePHow36XVuTYjntolhvKFRDgNsmyyZEuPzW+XnSJgGGfGXUxFqvQKUJrMU3tNeM8
         FBi4hS9slLC134hG8xw0xEpsK/9++wSyLGdyOgps0p4L2S6Rx2xAs44blb9IoF4Unkdm
         4ukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5xcNsXW9mDVOPPZyrAplUMmD9sMhDYldoYl40GQNnJE=;
        fh=y9ldpjpWutS+UoXHD4NZwZ9pvgDJ9yi5kkqqTKSiu/I=;
        b=SmG8DspWwyWQ7egx8Gsx/uqbzpfejLS+Z4JNSCCKlTE/V36BtOwDhHAsfLDnFOX4B4
         syoMlIuAK0c0ixdgiHNN6UWBTiaLN4ndBcD4rq0LlDbxAoM4PCd8wxp+60fIXtAeiv6f
         gmEjcOPHFftFE9qJdCRJMqMpox0aon0DfdbGo+87pWydcGs9V5t0QaNRV3TeHy3TNXEb
         WVwpT5rY4rXd5WBM4di7Q23SultkR+Qklcwc2Ck31jc8S6Ux7OE/NmG5mGidoLfqp9iG
         KbZWmIzZLvihikSYCbpcQEqzh4kK1pP7TAPyctqQJarwI+PiLEHjDdryqXUz3OAXp8jW
         E45g==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bt2K0ORg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCUUNI6aVbve9+gbQ15iwO6vmFmKw2riCNG51fZ6zbxkKrIpzm6gS4J17/711Ph5K7e3aAEmk3ighFCRvER3OmMH1wTtq1jI
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x26-20020ae9e91a000000b00785d3f38833si4493196qkf.543.2024.02.13.00.13.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 00:13:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bt2K0ORg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZnu0-0000Uv-In; Tue, 13 Feb 2024 03:12:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZntz-0000Uh-8B
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 03:12:27 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZntx-0000oq-HE
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 03:12:26 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-410db155e57so11924515e9.1
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 00:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707811944; x=1708416744; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5xcNsXW9mDVOPPZyrAplUMmD9sMhDYldoYl40GQNnJE=;
 b=bt2K0ORgObQUwQ/rduDMZ9j69987lh8ykygTRCUy27yMi7+xDO4WDSGZpKMIQ1irKY
 ho5QbZps7BNMSMip/1xA6zlY06AULWadYXdbWD2RqNmA0f2LFtDpx9se1pMYbcrxQnQb
 pX2E+U32z33OVzPYDtQgPMoGAtotrsWh5P0en1c1OxzW6UHlNjB6GStDFu4MqXeul7ho
 ClApyxCoaydoxNiyz1f9XPNaR09cFx2oa1SrCq3R23Ab+x83FrjZs624HiaHDCFvKArE
 V7QJcYE2LoNW4YEPInIZL0pn5ZaDgGDT5sSPW7nsYQWnxE4ct57tvIAehDcMzealYg/z
 gVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707811944; x=1708416744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5xcNsXW9mDVOPPZyrAplUMmD9sMhDYldoYl40GQNnJE=;
 b=wZ0mY8B3x6lhcVk/GioCPOTsxIyj0OLRewv+WZbD1I42aDXOHRqiSBtyf6c7GZZoXL
 bf/K1CZt9dRAXVlNNg834FNXryg3tX82PczUNM1SlDISRG4a/i64Dh/b8Bz10NTbGzZh
 stm77l0w1KKdEeGELKPwxjF+RITfdLHK/uUro4agtT9PjIjwacXBI15+FTJSnHQW2x52
 Ez5k/fj7yZlB8d0mI6uZNCcnGapahwbfLKH+bt+DNmbkPw4V8b+DYD+kQ+MMn9jBFIIb
 fM/6ItoESygNiRZ1u5Q9738wKHHpoTxnm6WmOLpf8vpc4phjlw9w8VCp2spu1zu9FUeW
 hb+g==
X-Gm-Message-State: AOJu0Yxuzp7Gq5z8pLhhWDFWXpgDrOVJXnp9rItruba9Bqul8oEggn3j
 rQgwVHTckrjgPBDMUocf77FKBg2Bx9AjCHeaxCuLRyiPc2o9wRi2hXYjYMXQfWA=
X-Received: by 2002:a05:600c:c89:b0:410:888f:f342 with SMTP id
 fj9-20020a05600c0c8900b00410888ff342mr7260646wmb.4.1707811944206; 
 Tue, 13 Feb 2024 00:12:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVNvjQ2bTAysAnkRoMSOG0D/8BnRZOKyOXKKUUDRAjHR003X98VUGsTFLG1MZRTMGHUj0MA3wj5i3qAmdxzaTWa6ynfVBwGZe/4fbu7HwBdQzILKZxcruW9IAQc78iTES5IPL6vRAxDSV9J3xLrS9lrYunSRrqof3GoWxqO7C7zbdfZOZf982xJN4tLX7P0eX6aEQ/6GWbZFQpiOnBT+ijlCTmMJgQ//q7NLry/xEni/wbV9ZWfILxMFdBRDOchW66fYjqR+yvFIUxoAlUr7jW9TbUIn+09I6g1U86Leepp1tw6HGlsQz1kQbJkKVnPMAT2GZV9IAyML9aG3nxoQ9Vp+W7i/mXv2aqY3w==
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 cc19-20020a5d5c13000000b0033b728190c1sm8318048wrb.79.2024.02.13.00.12.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Feb 2024 00:12:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH 3/9] hw/ide/ahci: Rename AHCI PCI function as 'pdev'
Date: Tue, 13 Feb 2024 09:11:54 +0100
Message-ID: <20240213081201.78951-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213081201.78951-1-philmd@linaro.org>
References: <20240213081201.78951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: vWNcYaoXf+EF

We want to access AHCIPCIState::ahci field. In order to keep
the code simple (avoiding &ahci->ahci), rename the current
'ahci' variable as 'pdev'

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_q35.c | 15 ++++++++-------
 hw/mips/boston.c | 10 +++++-----
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index ace8d3839a..e298f4ff32 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -135,7 +135,6 @@ static void pc_q35_init(MachineState *machine)
     GSIState *gsi_state;
     ISABus *isa_bus;
     int i;
-    PCIDevice *ahci;
     ram_addr_t lowmem;
     DriveInfo *hd[MAX_SATA_PORTS];
     MachineClass *mc = MACHINE_GET_CLASS(machine);
@@ -304,16 +303,18 @@ static void pc_q35_init(MachineState *machine)
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

