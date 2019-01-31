Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6749328wrt;
        Thu, 31 Jan 2019 03:23:36 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaAXBt/Nl1wqHdbj5tPcYxpBbtEheQNbEjmDxRbsAbcGqMHLsADJiiLtbqIFcQ1RltG6CXg
X-Received: by 2002:a25:3b02:: with SMTP id i2mr8325yba.232.1548933816129;
        Thu, 31 Jan 2019 03:23:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548933816; cv=none;
        d=google.com; s=arc-20160816;
        b=mElAxIJS3DIQVrmg93isieDAkmsGgxxYs1oYp5jci9Umo+B7u9Y3HpzzSjzfg+lhB/
         mE4oJcwSCf6gQWdrHO9emtn3EKpMImSf++p2nUZbo9nOvmT0TUlZ6FaxP9B6YTFyBOAg
         UrkoYfdwNQDiNRHEeEDy9rFa31qn1Gji6F0wetlwzw9LXI3XOHTveVWDhGmnx0gNQKs7
         CfGUbvuK2iQQMp0SlhawJcVSs3Y975yVHfaxTcEi3KhQeeJynzm3TVqfUx4LXB14sRJ9
         aZlV8vDEBcXxGk8VOGe9lY3+KFkQwc47+4FBTSun8RR3u5Pwad6RCFr+DPoJ0SPxhnw6
         eC+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ULXfIbeEbrOJ+8856c0Y/7Nen8Most1BOPfYn1VG/9k=;
        b=V744pyzxkWs8pOiPE57/CivaHRZ/R26F1cvApNBpPD0aafst26JMDKG4N1cx0ZIZQE
         8kxFZO5BqtAm2e8vTOFxSYE82uRujMPYklL2sCvwoTEc1ht8qgeyrIjfP2rwiz7MA8XW
         dc7O2QpDUQt2wtqSPIn4lN/+sUPoesgqmv4oeYdTL86JV2ozAvAcXog3dX/0p9C8WP4Q
         Ih3ZpscVaoBp2/HOW94DW7Yz6zGyyND/ScYv/V+ycGHR/tj4w5B/ZMUxCRq1NSHKXsqo
         9LclyagBGip4iT3m79zw1guUHaaojWU33/1V3X2YjO/u9aejBCaMGBi0q3V3EzSnYozt
         nIhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EMW0lQJA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6si2548375ybc.256.2019.01.31.03.23.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jan 2019 03:23:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EMW0lQJA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:53042 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpART-0002Yg-IO
	for alex.bennee@linaro.org; Thu, 31 Jan 2019 06:23:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpAQg-0002Cu-OX
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 06:22:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpAQf-0008Bk-PX
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 06:22:46 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39311)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gpAQf-0008BI-JV
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 06:22:45 -0500
Received: by mail-wm1-x341.google.com with SMTP id y8so2116300wmi.4
	for <qemu-devel@nongnu.org>; Thu, 31 Jan 2019 03:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ULXfIbeEbrOJ+8856c0Y/7Nen8Most1BOPfYn1VG/9k=;
	b=EMW0lQJAYLKpMNHwBSM7GNqO8CWI5CtFlju7S1It9+BYkA9Fs0zs5PmE5nMGRXAVkX
	7e6NMOcp6M7zptn+0pgOLxgxar2/Tx0bnsp33iXab1ASSuwqYmjS6fhEa67p+S7tqz2P
	Ratd6XRng0zF09h9h0csBWH2UmKRStuvr5hFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ULXfIbeEbrOJ+8856c0Y/7Nen8Most1BOPfYn1VG/9k=;
	b=cIHUcqyzFvQ4+ACxKw/rgeURb8iUS8w9j1sSy67AGCaMM/Q/4pjYbECXt78JDzIHv0
	WtaIfquuKwcLo1iN9CiLUCLHi8XhTk7FvuSPwTomGTAuFX00sZitQqvZBsSqKJ3Dk7rU
	tg6h30TTgNSjsTBvOrcpkIux5HLIXf0ryUkoBx6FGR8iXY6i9NPOZrEzaDzFZ+sECXC/
	6CUbrcn58m7XQbcLT6qQTYlgtBuuirFQVqiaHbPU6c8ecQZA+VM1GWtM886HuYAbh9FQ
	l55KK7UNG8QAIaucmfKTuqzupPGQqnoAAMs7OP6kxbE8H2JiFzzXEQTg/Xq3TfvK5x2r
	Ed/Q==
X-Gm-Message-State: AJcUukdx+MjaG05wUidjRsmthgbrZfTQ8+I7bn3gi+oHsHSe5SnazN5V
	mEYUwPVNGB4rbYQFlv0Zc8zwPA==
X-Received: by 2002:a1c:cf0d:: with SMTP id f13mr28523283wmg.70.1548933764527; 
	Thu, 31 Jan 2019 03:22:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id c8sm4078173wrx.42.2019.01.31.03.22.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 03:22:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 31 Jan 2019 11:22:36 +0000
Message-Id: <20190131112240.8395-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190131112240.8395-1-peter.maydell@linaro.org>
References: <20190131112240.8395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH 1/5] hw/arm/boot: Fix block comment style in
 arm_load_kernel()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, Igor Mammedov <imammedo@redhat.com>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BG+CUcu5Jo5D

Fix the block comment style in arm_load_kernel() to QEMU's
current style preferences. This will allow us to do some
refactoring of this function without checkpatch complaining
about the code-motion patches.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index c7a67af7a97..6f9ceeb0e89 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -965,7 +965,8 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
     static const ARMInsnFixup *primary_loader;
     AddressSpace *as = arm_boot_address_space(cpu, info);
 
-    /* CPU objects (unlike devices) are not automatically reset on system
+    /*
+     * CPU objects (unlike devices) are not automatically reset on system
      * reset, so we must always register a handler to do so. If we're
      * actually loading a kernel, the handler is also responsible for
      * arranging that we start it correctly.
@@ -974,7 +975,8 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
         qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
     }
 
-    /* The board code is not supposed to set secure_board_setup unless
+    /*
+     * The board code is not supposed to set secure_board_setup unless
      * running its code in secure mode is actually possible, and KVM
      * doesn't support secure.
      */
@@ -987,7 +989,8 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
     if (!info->kernel_filename || info->firmware_loaded) {
 
         if (have_dtb(info)) {
-            /* If we have a device tree blob, but no kernel to supply it to (or
+            /*
+             * If we have a device tree blob, but no kernel to supply it to (or
              * the kernel is supposed to be loaded by the bootloader), copy the
              * DTB to the base of RAM for the bootloader to pick up.
              */
@@ -1002,7 +1005,8 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
             try_decompressing_kernel = arm_feature(&cpu->env,
                                                    ARM_FEATURE_AARCH64);
 
-            /* Expose the kernel, the command line, and the initrd in fw_cfg.
+            /*
+             * Expose the kernel, the command line, and the initrd in fw_cfg.
              * We don't process them here at all, it's all left to the
              * firmware.
              */
@@ -1022,7 +1026,8 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
             }
         }
 
-        /* We will start from address 0 (typically a boot ROM image) in the
+        /*
+         * We will start from address 0 (typically a boot ROM image) in the
          * same way as hardware.
          */
         return;
@@ -1049,7 +1054,8 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
     if (info->nb_cpus == 0)
         info->nb_cpus = 1;
 
-    /* We want to put the initrd far enough into RAM that when the
+    /*
+     * We want to put the initrd far enough into RAM that when the
      * kernel is uncompressed it will not clobber the initrd. However
      * on boards without much RAM we must ensure that we still leave
      * enough room for a decent sized initrd, and on boards with large
@@ -1066,12 +1072,14 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
     kernel_size = arm_load_elf(info, &elf_entry, &elf_low_addr,
                                &elf_high_addr, elf_machine, as);
     if (kernel_size > 0 && have_dtb(info)) {
-        /* If there is still some room left at the base of RAM, try and put
+        /*
+         * If there is still some room left at the base of RAM, try and put
          * the DTB there like we do for images loaded with -bios or -pflash.
          */
         if (elf_low_addr > info->loader_start
             || elf_high_addr < info->loader_start) {
-            /* Set elf_low_addr as address limit for arm_load_dtb if it may be
+            /*
+             * Set elf_low_addr as address limit for arm_load_dtb if it may be
              * pointing into RAM, otherwise pass '0' (no limit)
              */
             if (elf_low_addr < info->loader_start) {
@@ -1132,7 +1140,8 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
         fixupcontext[FIXUP_BOARDID] = info->board_id;
         fixupcontext[FIXUP_BOARD_SETUP] = info->board_setup_addr;
 
-        /* for device tree boot, we pass the DTB directly in r2. Otherwise
+        /*
+         * for device tree boot, we pass the DTB directly in r2. Otherwise
          * we point to the kernel args.
          */
         if (have_dtb(info)) {
@@ -1185,7 +1194,8 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
             info->write_board_setup(cpu, info);
         }
 
-        /* Notify devices which need to fake up firmware initialization
+        /*
+         * Notify devices which need to fake up firmware initialization
          * that we're doing a direct kernel boot.
          */
         object_child_foreach_recursive(object_get_root(),
-- 
2.20.1

