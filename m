Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1507346njc;
        Mon, 30 Sep 2024 15:13:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUoaYYcPQvRJ+Z3cEjfeRJ4IQZm89NxjpjscSuS0BEPmALIy+dFiE0neEidkXcYWP7iapm1R9vNmvD3/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEsnZjK7wgHcMUDZtYQ457pAsOR+/p5IqMqDQwVRrn+VV9QR75lgaR/pDnJlnwvjxPENStL
X-Received: by 2002:a05:622a:5e89:b0:45d:5c76:3b0c with SMTP id d75a77b69052e-45d5c764201mr84803581cf.25.1727734405375;
        Mon, 30 Sep 2024 15:13:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727734405; cv=none;
        d=google.com; s=arc-20240605;
        b=MrADpcdoYvWO2EDelXx2sqH8oNz3vOan6xzRwxNvRgqoTvlYQROS5IIotTpJ3hcAxA
         Vstk9DeZnBS/D0qmxNK9vlZ2dz+k/sO3NsRUpRhGN1Kao/xLw8dEiMQXNRT2ZpoQ0W8i
         m+JA4ezF3hJTBneS+tLQH2sGY5g3EMeIJNPHyqQKjzDQl/2WMLW3WSim3aX4sVMnlJBV
         rfP21fMT+tgJebKocmKexbpLLqGUkEtX92efp41beJ2ibSRsqgO6hh9secfQsRxTVDrz
         4llVt5h83o/EAULCyyYUIOEeIFSIUekCHJbk291KA1yoEPzxCj6pTpQaZZft7393ZTil
         I0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=grjpT5kTsMGjq3j1/lhkj4QBsxYe83DKBpMh5569Dgk=;
        fh=msPJ3NfdtegtuQmzLlwbDjilMl77w45j8udA1lQy78Y=;
        b=iiH19SrQGnE7lm5Qav50pBCzzxgOjlcb4y8QOH3D2HnZnpogH+L9I17DDy3iA5sVfY
         bVq2AUNP6hWm1mOGXRq6OV35vN1uLZAofufmhj0YVOizX4Nb4KjdLC4jdysrVTIYap4C
         lklXJlmeNWk3MwiN2aOi/F8Ix0tF/ZqDM2waCkvjYuozA3/b9IbfJr0n8gYqTVUrHvRr
         daczN7/d0esfN4e+zqYtKkYzb0yZxMjbeq1mI5UbqlbYQrBxxbzlyCw9RYFTVbgrLxkR
         SMBtwQWCt1j8O90VzR/n7vTx1S0z7R/d0JarYHHdGjHF1JAWvhpRmjCZAmO4gRcVdNUs
         75Ag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oSF4xcxe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f28e9basi94425931cf.111.2024.09.30.15.13.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 15:13:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oSF4xcxe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svOd4-0003TI-Vv; Mon, 30 Sep 2024 18:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1svOd2-0003ME-Nd
 for qemu-arm@nongnu.org; Mon, 30 Sep 2024 18:12:28 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1svOd0-0002fg-Tv
 for qemu-arm@nongnu.org; Mon, 30 Sep 2024 18:12:28 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a93c1cc74fdso724886066b.3
 for <qemu-arm@nongnu.org>; Mon, 30 Sep 2024 15:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727734345; x=1728339145; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=grjpT5kTsMGjq3j1/lhkj4QBsxYe83DKBpMh5569Dgk=;
 b=oSF4xcxeKpE9rOxFKXgwYX/rgsKqXmEebX3rX+TPysuaXUbwll4HfpAr9tDt8ugRZ1
 QbLlLPuC5APuBkiiEpF71ap/Ry8PeWohncBn0Dw4FekV78+YuDOwkMfyz9fotNg1RGb7
 Av2+7KEB9zVA+M/TWs+JLLhQ27RGKjjUxRnem1Bwmqy7oc4vuHoeluQHBXQTLgbcWtP/
 yMtfv8an3VCF5hAHWco6y3J2bdXCSsv68umCbCp9+1M0OwrknQxkyMZfsSQbQt49iZmd
 PBTP8BoXKiojN3ghkZzU1eyfeX2XoXuyVWEkAtaXA3gwt5uNYUlGqSnGh7vpJfgeWNWT
 0Z6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727734345; x=1728339145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=grjpT5kTsMGjq3j1/lhkj4QBsxYe83DKBpMh5569Dgk=;
 b=gCZx28D3Yy/aJHcSDgPl9h/Xq5z0Civ59C2uH4YxoIX4wbLwr2a/dybGgjR87BKABP
 1RnjlCeZrtnFeKNbKs7tz9r3BCuc32YKQPbIaJnaUn69wAcDK70MSDCdWB67ypfgGC6t
 YwgHcXhf8OwW6E2Xgu0vHqMdgVV1o+SoKOmR28eQt1uWKEVtMYHNWaX10UUK1MkBO3K1
 GinoYvsO2//CDA4qbM4ZG/GxgxKrvuK71t9uh4MA/YAdtFHGAfvvYHxKGULbpWvCC/Un
 LxPvzic0GKVzBmy+omlgl2348JVajPEH4cmLOfPJvrqjhESgUt2xEj+ml2ePNVF0+7ht
 15Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxIQx7ZbrQU2sNtE1D+gRcJRMAC7lnmWF4jUh/WUqRmNoNS05OxOlaLSlP/r1I2wHdA0TnCY6htQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz3nSxv14XDHhF29tZhxHFBZI8086Buj1RjjgI9A4oQvL2D8dAo
 7hzHGXWXe0JJOwD1tOCVYMTeAHsdoc0+DuHTVVyTQ/EVMCgiZWHv9QzNzzllJ2s=
X-Received: by 2002:a17:907:928b:b0:a89:f5f6:395 with SMTP id
 a640c23a62f3a-a93c48f0902mr1722277466b.1.1727734344660; 
 Mon, 30 Sep 2024 15:12:24 -0700 (PDT)
Received: from localhost.localdomain (46.170.88.92.rev.sfr.net. [92.88.170.46])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c299ac60sm596492866b.221.2024.09.30.15.12.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 Sep 2024 15:12:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, Laurent Vivier <laurent@vivier.eu>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>, Tyrone Ting <kfting@nuvoton.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Anton Johansson <anjo@rev.ng>
Subject: [PATCH 2/3] hw/arm: Have arm_write_bootloader() take a ARMCPU argument
Date: Tue,  1 Oct 2024 00:12:03 +0200
Message-ID: <20240930221205.59101-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930221205.59101-1-philmd@linaro.org>
References: <20240930221205.59101-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
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
X-TUID: WhxZIP7pNds+

The next commit will replace tswap32() calls by stl_endian_p()
ones in bootloader.c. In order to do that, we'll need to know
the vCPU endianness. This information is retrievable with
arm_cpu_code_is_big_endian(), but we need to access CPUARMState.
As a first step, pass ARMCPU as argument to arm_write_bootloader()
so it'll be able to access cpu->env.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/boot.h | 9 ++++++---
 hw/arm/aspeed.c       | 3 +--
 hw/arm/boot.c         | 9 +++++----
 hw/arm/raspi.c        | 4 ++--
 4 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index 80c492d742..3d1226ab00 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -206,13 +206,15 @@ typedef struct ARMInsnFixup {
 /**
  * arm_write_bootloader - write a bootloader to guest memory
  * @name: name of the bootloader blob
- * @as: AddressSpace to write the bootloader
+ * @cpu: handle to the first CPU object
+ * @info: handle to the boot info struct
  * @addr: guest address to write it
  * @insns: the blob to be loaded
  * @fixupcontext: context to be used for any fixups in @insns
  *
  * Write a bootloader to guest memory at address @addr in the address
- * space @as. @name is the name to use for the resulting ROM blob, so
+ * space returned by @arm_boot_address_space().
+ * @name is the name to use for the resulting ROM blob, so
  * it should be unique in the system and reasonably identifiable for debugging.
  *
  * @insns must be an array of ARMInsnFixup structs, each of which has
@@ -228,7 +230,8 @@ typedef struct ARMInsnFixup {
  * the entries that @insns refers to.
  */
 void arm_write_bootloader(const char *name,
-                          AddressSpace *as, hwaddr addr,
+                          ARMCPU *cpu, const struct arm_boot_info *info,
+                          hwaddr addr,
                           const ARMInsnFixup *insns,
                           const uint32_t *fixupcontext);
 
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cf0c6c580b..cf5fb92238 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -217,7 +217,6 @@ struct AspeedMachineState {
 static void aspeed_write_smpboot(ARMCPU *cpu,
                                  const struct arm_boot_info *info)
 {
-    AddressSpace *as = arm_boot_address_space(cpu, info);
     static const ARMInsnFixup poll_mailbox_ready[] = {
         /*
          * r2 = per-cpu go sign value
@@ -244,7 +243,7 @@ static void aspeed_write_smpboot(ARMCPU *cpu,
     };
     static const uint32_t fixupcontext[FIXUP_MAX] = { 0 };
 
-    arm_write_bootloader("aspeed.smpboot", as, info->smp_loader_start,
+    arm_write_bootloader("aspeed.smpboot", cpu, info, info->smp_loader_start,
                          poll_mailbox_ready, fixupcontext);
 }
 
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 5301d8d318..6efd21f9c2 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -131,10 +131,12 @@ static const ARMInsnFixup smpboot[] = {
 };
 
 void arm_write_bootloader(const char *name,
-                          AddressSpace *as, hwaddr addr,
+                          ARMCPU *cpu, const struct arm_boot_info *info,
+                          hwaddr addr,
                           const ARMInsnFixup *insns,
                           const uint32_t *fixupcontext)
 {
+    AddressSpace *as = arm_boot_address_space(cpu, info);
     /* Fix up the specified bootloader fragment and write it into
      * guest memory using rom_add_blob_fixed(). fixupcontext is
      * an array giving the values to write in for the fixup types
@@ -185,7 +187,6 @@ static void default_write_secondary(ARMCPU *cpu,
                                     const struct arm_boot_info *info)
 {
     uint32_t fixupcontext[FIXUP_MAX];
-    AddressSpace *as = arm_boot_address_space(cpu, info);
 
     fixupcontext[FIXUP_GIC_CPU_IF] = info->gic_cpu_if_addr;
     fixupcontext[FIXUP_BOOTREG] = info->smp_bootreg_addr;
@@ -195,7 +196,7 @@ static void default_write_secondary(ARMCPU *cpu,
         fixupcontext[FIXUP_DSB] = CP15_DSB_INSN;
     }
 
-    arm_write_bootloader("smpboot", as, info->smp_loader_start,
+    arm_write_bootloader("smpboot", cpu, info, info->smp_loader_start,
                          smpboot, fixupcontext);
 }
 
@@ -1128,7 +1129,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         fixupcontext[FIXUP_ENTRYPOINT_LO] = entry;
         fixupcontext[FIXUP_ENTRYPOINT_HI] = entry >> 32;
 
-        arm_write_bootloader("bootloader", as, info->loader_start,
+        arm_write_bootloader("bootloader", cpu, info, info->loader_start,
                              primary_loader, fixupcontext);
 
         if (info->write_board_setup) {
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index a7a662f40d..84fffe2a02 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -137,7 +137,7 @@ static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
     QEMU_BUILD_BUG_ON((BOARDSETUP_ADDR & 0xf) != 0
                       || (BOARDSETUP_ADDR >> 4) >= 0x100);
 
-    arm_write_bootloader("raspi_smpboot", arm_boot_address_space(cpu, info),
+    arm_write_bootloader("raspi_smpboot", cpu, info,
                          info->smp_loader_start, smpboot, fixupcontext);
 }
 
@@ -172,7 +172,7 @@ static void write_smpboot64(ARMCPU *cpu, const struct arm_boot_info *info)
         0, 0, 0, 0
     };
 
-    arm_write_bootloader("raspi_smpboot", as, info->smp_loader_start,
+    arm_write_bootloader("raspi_smpboot", cpu, info, info->smp_loader_start,
                          smpboot, fixupcontext);
     rom_add_blob_fixed_as("raspi_spintables", spintables, sizeof(spintables),
                           SPINTABLE_ADDR, as);
-- 
2.45.2

