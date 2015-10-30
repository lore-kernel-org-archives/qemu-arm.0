Received: by 10.182.105.169 with SMTP id gn9csp909406obb;
        Thu, 29 Oct 2015 22:36:18 -0700 (PDT)
X-Received: by 10.55.23.170 with SMTP id 42mr7313372qkx.42.1446183378028;
        Thu, 29 Oct 2015 22:36:18 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o84si4534238qkh.77.2015.10.29.22.36.17
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 29 Oct 2015 22:36:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zs2ML-0006Kp-Kn
	for alex.bennee@linaro.org; Fri, 30 Oct 2015 01:36:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zs2LR-0005Jp-Cx
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 01:35:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zs2LP-0002PE-Vn
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 01:35:21 -0400
Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a]:35410)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1Zs2LP-0002PA-OY; Fri, 30 Oct 2015 01:35:19 -0400
Received: by pasz6 with SMTP id z6so63138522pas.2;
	Thu, 29 Oct 2015 22:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=6Qk225tZ4pngtDd6kJOcjni8olKrxtcm42gVS7cX9qQ=;
	b=N9VrOPB0VCq49mVr557QNBwPZhD15Q4g+AKrfLbUKT10nkDcZweZy5WEM59uwZ9wI7
	wan69TGLvHrI0ffz3p+ULzj/GXQFy3un0NmA8/JAqPO9HLnY9ICxhPacAZ1nzJu+dYQq
	JlZse3ApCa6dr304jFbaK3OVCCvVw398kR7p6yRrfJCQe3EwlFB3f37A1GeEuU9bLJYW
	wLnFc+fVhVVOePu5uxmc+Iub9WsA0/2X+ZusNrBMkBiaSUOvpd9KQZZEE6MlfFOCRXfV
	VVaK43dqHLOFVepoTDMVFffgde9sP4sIcKSlJDrcZEAkDojGfQNay49zYxW64Drs/JeH
	9lqQ==
X-Received: by 10.68.135.40 with SMTP id pp8mr6423499pbb.50.1446183319187;
	Thu, 29 Oct 2015 22:35:19 -0700 (PDT)
Received: from pcrost-box.hsd1.ca.comcast.net
	(c-24-130-130-137.hsd1.ca.comcast.net. [24.130.130.137])
	by smtp.gmail.com with ESMTPSA id
	yi8sm5604313pab.22.2015.10.29.22.35.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Oct 2015 22:35:18 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Oct 2015 22:34:57 -0700
Message-Id: <070295644c6ac84696d743913296e8cfefb48c15.1446182614.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1446182614.git.crosthwaite.peter@gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1446182614.git.crosthwaite.peter@gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22a
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-arm@nongnu.org, linux@roeck-us.net, robh@kernel.org
Subject: [Qemu-devel] [PATCH v2 2/5] arm: boot: Add board specific setup
	code API
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aLDU4iC5/NBK

Add an API for boards to inject their own preboot software (or
firmware) sequence.

The software then returns to the bootloader via the link register. This
allows boards to do their own little bits of firmware setup without
needed to replace the bootloader completely (which is the requirement
for existing firmware support).

The blob is loaded by a callback if and only if doing a linux boot
(similar to the existing write_secondary support).

Rewrite the comment for the primary boot blob.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
Changed since v1:
Rewrite boot blob comment (PMM review)
s/setup/set up/ in comment (PMM review)
s/sequeunce/sequence in commit msg
Add missing "the" in commit message
Changed since RFC:
Load blob via firmware.
Remove un-needed 0-word in bootloader sequence.
Remove "blob", just use "board setup" consistently
Remove boolean for (just use a pointer NULL check on write_board_setup)
Adjust comment about functionality of primary bootloader

 hw/arm/boot.c        | 20 +++++++++++++++++++-
 include/hw/arm/arm.h | 10 ++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 2a151e2..b0879a5 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -31,6 +31,7 @@ typedef enum {
     FIXUP_NONE = 0,     /* do nothing */
     FIXUP_TERMINATOR,   /* end of insns */
     FIXUP_BOARDID,      /* overwrite with board ID number */
+    FIXUP_BOARD_SETUP,  /* overwrite with board specific setup code address */
     FIXUP_ARGPTR,       /* overwrite with pointer to kernel args */
     FIXUP_ENTRYPOINT,   /* overwrite with kernel entry point */
     FIXUP_GIC_CPU_IF,   /* overwrite with GIC CPU interface address */
@@ -58,8 +59,17 @@ static const ARMInsnFixup bootloader_aarch64[] = {
     { 0, FIXUP_TERMINATOR }
 };
 
-/* The worlds second smallest bootloader.  Set r0-r2, then jump to kernel.  */
+/* A very small bootloader: call the board-setup code (if needed),
+ * set r0-r2, then jump to the kernel.
+ * If we're not calling boot setup code then we don't copy across
+ * the first BOOTLOADER_NO_BOARD_SETUP_OFFSET insns in this array.
+ */
+
 static const ARMInsnFixup bootloader[] = {
+    { 0xe28fe008 }, /* add     lr, pc, #8 */
+    { 0xe51ff004 }, /* ldr     pc, [pc, #-4] */
+    { 0, FIXUP_BOARD_SETUP },
+#define BOOTLOADER_NO_BOARD_SETUP_OFFSET 3
     { 0xe3a00000 }, /* mov     r0, #0 */
     { 0xe59f1004 }, /* ldr     r1, [pc, #4] */
     { 0xe59f2004 }, /* ldr     r2, [pc, #4] */
@@ -131,6 +141,7 @@ static void write_bootloader(const char *name, hwaddr addr,
         case FIXUP_NONE:
             break;
         case FIXUP_BOARDID:
+        case FIXUP_BOARD_SETUP:
         case FIXUP_ARGPTR:
         case FIXUP_ENTRYPOINT:
         case FIXUP_GIC_CPU_IF:
@@ -640,6 +651,9 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
         elf_machine = EM_AARCH64;
     } else {
         primary_loader = bootloader;
+        if (!info->write_board_setup) {
+            primary_loader += BOOTLOADER_NO_BOARD_SETUP_OFFSET;
+        }
         kernel_load_offset = KERNEL_LOAD_ADDR;
         elf_machine = EM_ARM;
     }
@@ -745,6 +759,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
         info->initrd_size = initrd_size;
 
         fixupcontext[FIXUP_BOARDID] = info->board_id;
+        fixupcontext[FIXUP_BOARD_SETUP] = info->board_setup_addr;
 
         /* for device tree boot, we pass the DTB directly in r2. Otherwise
          * we point to the kernel args.
@@ -793,6 +808,9 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
         if (info->nb_cpus > 1) {
             info->write_secondary_boot(cpu, info);
         }
+        if (info->write_board_setup) {
+            info->write_board_setup(cpu, info);
+        }
 
         /* Notify devices which need to fake up firmware initialization
          * that we're doing a direct kernel boot.
diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index 4dcd4f9..9217b70 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -87,6 +87,16 @@ struct arm_boot_info {
      * -pflash. It also implies that fw_cfg_find() will succeed.
      */
     bool firmware_loaded;
+
+    /* Address at which board specific loader/setup code exists. If enabled,
+     * this code-blob will run before anything else. It must return to the
+     * caller via the link register. There is no stack set up. Enabled by
+     * defining write_board_setup, which is responsible for loading the blob
+     * to the specified address.
+     */
+    hwaddr board_setup_addr;
+    void (*write_board_setup)(ARMCPU *cpu,
+                              const struct arm_boot_info *info);
 };
 
 /**
-- 
1.9.1

