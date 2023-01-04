Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8311321ejb;
        Wed, 4 Jan 2023 14:10:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsrfj3A4KshvKxXsyoLPj3piTF1lG7S7PphzsN8ub2fm8u+wPzXaroIbDpMYFQQ/PEv/gbA
X-Received: by 2002:a05:6214:3c09:b0:52d:e201:c3d2 with SMTP id nt9-20020a0562143c0900b0052de201c3d2mr76830513qvb.33.1672870242994;
        Wed, 04 Jan 2023 14:10:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672870242; cv=none;
        d=google.com; s=arc-20160816;
        b=JwawWMXTSgNJ0G/sxS4idNRDioz7YvdwNsX86/jTvoid/LsY76Sx/aEtG1quzVHGNv
         wos0dRl/ZYaWTKPPDeVwGStKlkD24PDsy6Aw3pbwB2DBe4gKXpkBdJ2eFTPcHc4i+SIe
         45/JRkZKsw9WTS2xq3Fr9WDSLMZMbmq7Q7dp+WqgZHyTKXpqF9mvs1cyzuIoGe+gJSNP
         2Wzk7i4nd5Dv1HM95DDOOGengvdO/96hWzynXyxsmR3IwBpjkNixwtUSWguQhLjEh0kK
         lwp0K8uAy/rUtG/dj7bCB5IdoXLbUwuPcH/ykAGjkAAHPvUpJN9iuqefEYRe4nM1NuTB
         tOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AymZEv+37B+jt/sn5PVP1oF6IqgH4PMlbkATZu7erfY=;
        b=hqJg60UlGyIxAKIVnG1PNZEBxDlQKuy9SzuofhYc0vbbY1sUoE8fehTL5++uTiEDnD
         Qcvwy+v55vMjSgkHmPCNvK8DdnPE4+x3v035Ftz1k24Ml5WDdCpxtJ5pdXjerEDcb1pJ
         Qjod1DAagOEzJCtdS3lTNEnmDE7Xjmfmz/AcLlVzjgXnrHkLdcyZfKhc0m53RDlvH3vg
         KUdA60Apv5jIfKuSs49uYY8mvOYklTmlBetD6nzhemhcZ3lNbLcHUKsrZX+ZyWpmOAbZ
         1Dn9iz1A2PchC3NcgFst2vlj9jtCsdslqAAtpVYocbn4KSeMr1ZuCOgR6juhQj471qNS
         AZQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V/sFf4E1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq4-20020ad45964000000b004c6a0939a4dsi17559743qvb.57.2023.01.04.14.10.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jan 2023 14:10:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V/sFf4E1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDBsw-0008Lu-79; Wed, 04 Jan 2023 17:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBsh-0008Gh-Vv
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 17:05:10 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBse-0005Bs-Pc
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 17:05:07 -0500
Received: by mail-ej1-x62d.google.com with SMTP id kw15so85839435ejc.10
 for <qemu-arm@nongnu.org>; Wed, 04 Jan 2023 14:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AymZEv+37B+jt/sn5PVP1oF6IqgH4PMlbkATZu7erfY=;
 b=V/sFf4E1NoHzdzE0y2hhEA6AF2IhFKc1USaCA+9mNcb1txQzd1RYTEwCU8aoYz5Sk6
 lIH9/gFNBZO/3yRGixPD0j3uTLAAjCt0c5BmYAt8lpd7wGAigPHETbcyFxBhekOCPSgi
 u/c/avpkKQgljDC6miZAtV7aCmB6zNzyGwdy3w/UQh54KoUm/VbEmvSsTW4k+TNhLqXI
 A76NS9H/N2TI2GoBs6VIkSui55RNxbpTlB45g2LU9SIaDLGdJMKSx4jK+81P/wWVqzYS
 a6PqhtU6kUNsoMHF3y9qGYxLgxnm9udqN1I0qu4G9Bez23nfrPxgpf4lMUaaIvgb8+nL
 VX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AymZEv+37B+jt/sn5PVP1oF6IqgH4PMlbkATZu7erfY=;
 b=yyrq8eKRNPJZwoP6LJxDCrcC5EiQLHXpOt3G8XoaJ99RkdSaZgmQOxCmsB9UgpZ63R
 +MYk1VfQkiwCJOUNhoD71c70mm/2SHoIQaxKhNVd7MkXy3gWG9d33yn/ueCSk3BOWNyw
 zQ3jLqWuOZiLzOoWzaceArdeA1PxwLzwsD3cDvC64Uv4G6PlBeG52l576gpEpSAhcCC2
 vnF/HQu7YkwhbxIKnuXRXUpAq6jpXoDEoLeCqAWT4q4zjZobAIx/B/gW0e7Jk2EGF8VN
 tMUXJnAFxIp0NJStIS1Ho4iwBQ7ZG+5376gcYl60mX/qq83GsqbrsLZyjv71rsrWDCHQ
 /Iig==
X-Gm-Message-State: AFqh2kpTURjMFUryo+AQKMvxCMfa1HitxuFuWCT10zVfkiULnXm0JBSF
 7BQkmo0TwD9Z7s8VOKr/fskiWg==
X-Received: by 2002:a17:907:9394:b0:7b2:7ae8:3661 with SMTP id
 cm20-20020a170907939400b007b27ae83661mr44537804ejc.21.1672869903056; 
 Wed, 04 Jan 2023 14:05:03 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a170906292900b0073dd8e5a39fsm15648723ejd.156.2023.01.04.14.04.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:05:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 01/20] hw/block: Pass DeviceState to pflash_cfi01_get_blk()
Date: Wed,  4 Jan 2023 23:04:30 +0100
Message-Id: <20230104220449.41337-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
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
X-TUID: xsyS0NNU7rFk

The point of a getter() function is to not expose the structure
internal fields. Otherwise callers could simply access the
PFlashCFI01::blk field.

Have the callers pass a DeviceState* argument. The QOM
type check is done in the callee.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/sbsa-ref.c        | 2 +-
 hw/arm/virt.c            | 2 +-
 hw/block/pflash_cfi01.c  | 4 +++-
 hw/i386/pc_sysfw.c       | 4 ++--
 include/hw/block/flash.h | 2 +-
 5 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 4bb444684f..65b9acba04 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -346,7 +346,7 @@ static bool sbsa_firmware_init(SBSAMachineState *sms,
 
     sbsa_flash_map(sms, sysmem, secure_sysmem);
 
-    pflash_blk0 = pflash_cfi01_get_blk(sms->flash[0]);
+    pflash_blk0 = pflash_cfi01_get_blk(DEVICE(sms->flash[0]));
 
     bios_name = MACHINE(sms)->firmware;
     if (bios_name) {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ea2413a0ba..954e3ca5ce 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1233,7 +1233,7 @@ static bool virt_firmware_init(VirtMachineState *vms,
 
     virt_flash_map(vms, sysmem, secure_sysmem);
 
-    pflash_blk0 = pflash_cfi01_get_blk(vms->flash[0]);
+    pflash_blk0 = pflash_cfi01_get_blk(DEVICE(vms->flash[0]));
 
     bios_name = MACHINE(vms)->firmware;
     if (bios_name) {
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 0cbc2fb4cb..458c50ec45 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -984,8 +984,10 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
     return PFLASH_CFI01(dev);
 }
 
-BlockBackend *pflash_cfi01_get_blk(PFlashCFI01 *fl)
+BlockBackend *pflash_cfi01_get_blk(DeviceState *dev)
 {
+    PFlashCFI01 *fl = PFLASH_CFI01(dev);
+
     return fl->blk;
 }
 
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index c8d9e71b88..4b85c48ec8 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -152,7 +152,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
 
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
         system_flash = pcms->flash[i];
-        blk = pflash_cfi01_get_blk(system_flash);
+        blk = pflash_cfi01_get_blk(DEVICE(system_flash));
         if (!blk) {
             break;
         }
@@ -216,7 +216,7 @@ void pc_system_firmware_init(PCMachineState *pcms,
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
         pflash_cfi01_legacy_drive(pcms->flash[i],
                                   drive_get(IF_PFLASH, 0, i));
-        pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);
+        pflash_blk[i] = pflash_cfi01_get_blk(DEVICE(pcms->flash[i]));
     }
 
     /* Reject gaps */
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 86d8363bb0..961b6e9f74 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -21,7 +21,7 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
                                    uint16_t id0, uint16_t id1,
                                    uint16_t id2, uint16_t id3,
                                    int be);
-BlockBackend *pflash_cfi01_get_blk(PFlashCFI01 *fl);
+BlockBackend *pflash_cfi01_get_blk(DeviceState *dev);
 MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl);
 void pflash_cfi01_legacy_drive(PFlashCFI01 *dev, DriveInfo *dinfo);
 
-- 
2.38.1

