Received: by 10.182.105.169 with SMTP id gn9csp909955obb;
        Thu, 29 Oct 2015 22:37:49 -0700 (PDT)
X-Received: by 10.141.28.136 with SMTP id f130mr7790359qhe.66.1446183469502;
        Thu, 29 Oct 2015 22:37:49 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e142si4537972qhc.44.2015.10.29.22.37.49
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 29 Oct 2015 22:37:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48498 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zs2Np-0000qH-5t
	for alex.bennee@linaro.org; Fri, 30 Oct 2015 01:37:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zs2LS-0005Jx-Ir
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 01:35:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zs2LR-0002Pa-FX
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 01:35:22 -0400
Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b]:32976)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1Zs2LR-0002PK-AH; Fri, 30 Oct 2015 01:35:21 -0400
Received: by padhy1 with SMTP id hy1so57209480pad.0;
	Thu, 29 Oct 2015 22:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=MoJQpueCiuZ8SHAonjkXXV69KJqkM+TmKVBwA6XMtk0=;
	b=KLe5p9Dt9BQX+mnLxoDWrSw17wP2LTrdOanJeqbZncdsFCWTgTwym0ouKKgB3unM3R
	o8QEOwtC+xor2aLuewOIJTkLI8jvQnFObloKWOAz4x805IvXH+f+rri8XYh6w8vcbHwN
	Ji2Zwg0MV/3/4pnXeDW6HYW7vOPvnxoFOOKDQf3HAANizL+EOnjtFApliPCZlhevecKB
	baIvyEKVO6HnE9K7szhEzyFxWBM1GlbA9J3QKWxC0ivG0vXyTIgjJnzSd/sCkym4LIWD
	EXyQeNCD4M1JoxwVExIAlBeqHooCchC3F1WWYieCe02RVYwzF1LOKgw0hysb5gw19tnx
	n/8g==
X-Received: by 10.69.11.193 with SMTP id ek1mr6511515pbd.32.1446183320704;
	Thu, 29 Oct 2015 22:35:20 -0700 (PDT)
Received: from pcrost-box.hsd1.ca.comcast.net
	(c-24-130-130-137.hsd1.ca.comcast.net. [24.130.130.137])
	by smtp.gmail.com with ESMTPSA id
	yi8sm5604313pab.22.2015.10.29.22.35.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Oct 2015 22:35:19 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Oct 2015 22:34:58 -0700
Message-Id: <9a9025ea65572586b50dca4e5819032e3c436d64.1446182614.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1446182614.git.crosthwaite.peter@gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1446182614.git.crosthwaite.peter@gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22b
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, robh@kernel.org, linux@roeck-us.net
Subject: [Qemu-devel] [PATCH v2 3/5] arm: xilinx_zynq: Add linux pre-boot
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
X-TUID: EMIL4fZ5iN43

Add a Linux-specific pre-boot routine that matches the device-
specific bootloaders behaviour. This is needed for modern Linux that
expects the ARM PLL in SLCR to be a more even value (not 26).

Cc: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
Changed since v1:
Left main loader address unchanged
Added comments for SLCR_WRITE macro (PMM review)
Convert SLCR_WRITE impl. to use movw/movt (PMM review)
Missing "-" for device-specific
Changed since RFC:
Use bootloader callback to load blob.
Change "firmware" to "board-setup" for consistency.

 hw/arm/xilinx_zynq.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 9f89483..82a9db8 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -43,6 +43,45 @@ static const int dma_irqs[8] = {
     46, 47, 48, 49, 72, 73, 74, 75
 };
 
+#define BOARD_SETUP_ADDR        0x100
+
+#define SLCR_LOCK_OFFSET        0x004
+#define SLCR_UNLOCK_OFFSET      0x008
+#define SLCR_ARM_PLL_OFFSET     0x100
+
+#define SLCR_XILINX_UNLOCK_KEY  0xdf0d
+#define SLCR_XILINX_LOCK_KEY    0x767b
+
+#define ARMV7_IMM16(x) (extract32((x),  0, 12) | \
+                        extract32((x), 12,  4) << 16)
+
+/* Write immediate val to address r0 + addr. r0 should contain base offset
+ * of the SLCR block. Clobbers r1.
+ */
+
+#define SLCR_WRITE(addr, val) \
+    0xe3001000 + ARMV7_IMM16(extract32((val),  0, 16)), /* movw r1 ... */ \
+    0xe3401000 + ARMV7_IMM16(extract32((val), 16, 16)), /* movt r1 ... */ \
+    0xe5801000 + (addr)
+
+static void zynq_write_board_setup(ARMCPU *cpu,
+                                   const struct arm_boot_info *info)
+{
+    int n;
+    uint32_t board_setup_blob[] = {
+        0xe3a004f8, /* mov r0, #0xf8000000 */
+        SLCR_WRITE(SLCR_UNLOCK_OFFSET, SLCR_XILINX_UNLOCK_KEY),
+        SLCR_WRITE(SLCR_ARM_PLL_OFFSET, 0x00014008),
+        SLCR_WRITE(SLCR_LOCK_OFFSET, SLCR_XILINX_LOCK_KEY),
+        0xe12fff1e, /* bx lr */
+    };
+    for (n = 0; n < ARRAY_SIZE(board_setup_blob); n++) {
+        board_setup_blob[n] = tswap32(board_setup_blob[n]);
+    }
+    rom_add_blob_fixed("board-setup", board_setup_blob,
+                       sizeof(board_setup_blob), BOARD_SETUP_ADDR);
+}
+
 static struct arm_boot_info zynq_binfo = {};
 
 static void gem_init(NICInfo *nd, uint32_t base, qemu_irq irq)
@@ -252,6 +291,9 @@ static void zynq_init(MachineState *machine)
     zynq_binfo.nb_cpus = 1;
     zynq_binfo.board_id = 0xd32;
     zynq_binfo.loader_start = 0;
+    zynq_binfo.board_setup_addr = BOARD_SETUP_ADDR;
+    zynq_binfo.write_board_setup = zynq_write_board_setup;
+
     arm_load_kernel(ARM_CPU(first_cpu), &zynq_binfo);
 }
 
-- 
1.9.1

