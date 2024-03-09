Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp368208ejc;
        Sat, 9 Mar 2024 11:24:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVlS5PrAmHLZS8QH3ZEkFh10FtJSnui4Y/peF8+VK3144Jbvgaz9WWdgODSTZFGmVdH5jo4jKTEcfaSATedqQSD0evWtSTZ
X-Google-Smtp-Source: AGHT+IGSIFErV0iXR4FldRC21xnhYIvXXjO1z0dtkVkCf6lM1GFc2M4UtJhWZB+bfKv5IC7ah0gJ
X-Received: by 2002:a05:622a:50e:b0:42e:e3b4:c620 with SMTP id l14-20020a05622a050e00b0042ee3b4c620mr4035618qtx.55.1710012273595;
        Sat, 09 Mar 2024 11:24:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012273; cv=none;
        d=google.com; s=arc-20160816;
        b=KkHOXyn+j4aSKkMwTTMdUw4dkrVX5HwFCv0a31nuEqmB4Lmo2urCdCEDCC6szd+g3y
         NVdOzjE7AQYBS9ohf+zN/w76p5+xieJz3S0m7MqQmm08kz1k2upEGeYFqG9WBnwV/3mg
         /dloqRuEY6zzJ+GxBPqXtV3ueMC2PjJPzgH7PUZB0Wt8dTbMG6OS8m0WtWbUGD474VHh
         zu3F7WFIaRb/tvbiCPafuJ0ps/pXbWSQ6b163RNSxQUhyN1MqPC23tm9PW8WaEMziPY0
         88SQC+ZTW46a7mUyERtDNnisRoHzwVBMsMp7NTSG5cOzKvCPeDsEwYWd0XQ0WyuG0L3l
         nnEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gNfhZGSEMDNFGE0Bt1N9Am3VGUZ7rx8bc74P/nXROpw=;
        fh=F/6qtZ96GiTIUMtsCZpLHWCYfSiHQv9+KwDGmTMvCds=;
        b=HO86iCXdE2eR0JiTsoX8h2fwGZJ13Z2SVoWoNU3POgqnQ8rwvDvboSfNaBmaAVRwVz
         vj6i9XW8UBF4q2f14TvyddsH6Z9vXNaTaBVf9ukXKL7mkEwrHgk7N6uOCuDlnOk3qjVO
         +J7peS3x+BcsPoQD63fBtiAy+ov1V0WcvnMx09WdXs/oH7RXSOgc9UvANVCwkeC6vCoi
         +RHm48jFhxAHD8+hYq7y6Xu7Ok4qkiDvNqYA3jQlSgKuB9GxgQFRREjgkEIcnfK+98QZ
         OwA9PaDAF6xgXwtRbfhv6JNxDKH8ooe37VBZeBLyQXKzy0thwZNuWpsJrNbyor0McYdU
         DjaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ne1rZ2Vf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n11-20020ac85a0b000000b0042edaeccfe4si2175459qta.139.2024.03.09.11.24.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:24:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ne1rZ2Vf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rj2J0-0003nW-GB; Sat, 09 Mar 2024 14:24:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2Iz-0003jE-NC
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:24:25 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2Ix-0002mR-Sd
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:24:25 -0500
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5133bd7eb47so3768044e87.3
 for <qemu-arm@nongnu.org>; Sat, 09 Mar 2024 11:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012262; x=1710617062; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gNfhZGSEMDNFGE0Bt1N9Am3VGUZ7rx8bc74P/nXROpw=;
 b=ne1rZ2Vf3nDTNU1KeRP3pQ0Lt+fHPTUsppkIg+7v1TPYIUOiMcBQXh6XwMaUTYVhVd
 RMJfoLOozhUJTEGaj+XOBH4Ry/zMU9JYd30J3FLYBWOqOFJNyo6APzniQP8MJtDYnCmE
 02+SQsQmgQk69x9Qz7GfydSlp3iZlxgD5SCpSd9ehFL3KKbvtP6Kico/FFA4WjYdIPZg
 BjX8lQKkKxZUjhsJ1NCAB2+bNrwbcY37axSFYxl66KVESr6oMs5Gc8EOp8SaqZbuV6Nh
 uJVNBOcP4aFnNkihA3/ejWlspGhk02ondPBcgPvRz8fVfBmzjizdfZZw5WyZApNZDjsx
 4vxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012262; x=1710617062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gNfhZGSEMDNFGE0Bt1N9Am3VGUZ7rx8bc74P/nXROpw=;
 b=uKs/dJQSrl1TWeSLhoqnGHEnYxsdMaJUMdu+5shwozGpSXgdP+nZC/AQjwaMN3nTWx
 I9VgChDOmCvxnYfrFk48Q+cPMU0yfuJSunrIuByd2f9j3gSlUi74ecCrmF8E5lKywm81
 2WJilJVhm7aaKJdhh62nmeggzqzvKCqXAGeFzbv06GGUf81QFU38t5dU3aExP77Hz2tP
 dARYinteoeoYhS84VmE6XksQAMqvHZVh8RvwVL+IS+y+sOrQRmFDDhTrTc3oigmljlG/
 SfobWY0Lr/LK1pK9igTdbTR+e55jtxeC8wb1k7sUbZcRaK4Fj2PUF2jMYUWOb0cfkQsd
 crcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFIMxfzENjPUWVm1VTeRLaXwUStAdXpP82CoPDRhX12ClxJscfdxfBcq4H4l8NibZ06QTLw26ApfvAs/JSvzTgBSJt
X-Gm-Message-State: AOJu0YzleaLOZzZPrr8BEeKtmYQf5uCVT0qeFle2/seHlQsG0CpyZdDA
 W4MQMoNg5CFjD2hnxJ7EAIay9WRq0HolokkWg9XN2ga2G6N5awmzN+DG29dc4dE=
X-Received: by 2002:ac2:484a:0:b0:513:3741:7357 with SMTP id
 10-20020ac2484a000000b0051337417357mr1595051lfy.56.1710012262092; 
 Sat, 09 Mar 2024 11:24:22 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a1709060e0600b00a42ea946917sm1177309eji.130.2024.03.09.11.24.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:24:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 21/43] hw/i386/pc: Remove 'host_type' argument from pc_init1()
Date: Sat,  9 Mar 2024 20:21:48 +0100
Message-ID: <20240309192213.23420-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: YCQfjYvPpezn

All callers use host_type=TYPE_I440FX_PCI_HOST_BRIDGE.
Directly use this definition within pc_init1().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240301185936.95175-4-philmd@linaro.org>
---
 hw/i386/pc_piix.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index ed777e3d61..e14dce951d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -101,8 +101,7 @@ static void piix_intx_routing_notifier_xen(PCIDevice *dev)
 }
 
 /* PC hardware initialisation */
-static void pc_init1(MachineState *machine,
-                     const char *host_type, const char *pci_type)
+static void pc_init1(MachineState *machine, const char *pci_type)
 {
     PCMachineState *pcms = PC_MACHINE(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
@@ -194,7 +193,7 @@ static void pc_init1(MachineState *machine,
         memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
         rom_memory = pci_memory;
 
-        phb = OBJECT(qdev_new(host_type));
+        phb = OBJECT(qdev_new(TYPE_I440FX_PCI_HOST_BRIDGE));
         object_property_add_child(OBJECT(machine), "i440fx", phb);
         object_property_set_link(phb, PCI_HOST_PROP_RAM_MEM,
                                  OBJECT(ram_memory), &error_fatal);
@@ -451,7 +450,7 @@ static void pc_compat_2_0_fn(MachineState *machine)
 #ifdef CONFIG_ISAPC
 static void pc_init_isa(MachineState *machine)
 {
-    pc_init1(machine, TYPE_I440FX_PCI_HOST_BRIDGE, TYPE_I440FX_PCI_DEVICE);
+    pc_init1(machine, TYPE_I440FX_PCI_DEVICE);
 }
 #endif
 
@@ -461,9 +460,7 @@ static void pc_xen_hvm_init_pci(MachineState *machine)
     const char *pci_type = xen_igd_gfx_pt_enabled() ?
                 TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE : TYPE_I440FX_PCI_DEVICE;
 
-    pc_init1(machine,
-             TYPE_I440FX_PCI_HOST_BRIDGE,
-             pci_type);
+    pc_init1(machine, pci_type);
 }
 
 static void pc_xen_hvm_init(MachineState *machine)
@@ -488,8 +485,7 @@ static void pc_xen_hvm_init(MachineState *machine)
         if (compat) { \
             compat(machine); \
         } \
-        pc_init1(machine, TYPE_I440FX_PCI_HOST_BRIDGE, \
-                 TYPE_I440FX_PCI_DEVICE); \
+        pc_init1(machine, TYPE_I440FX_PCI_DEVICE); \
     } \
     DEFINE_PC_MACHINE(suffix, name, pc_init_##suffix, optionfn)
 
-- 
2.41.0

