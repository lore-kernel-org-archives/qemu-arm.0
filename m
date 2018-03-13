Received: by 10.28.91.67 with SMTP id p64csp852815wmb;
        Tue, 13 Mar 2018 08:39:15 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuSgJz4pqSQWwuzCaMjtMwzoBb6M9tMAijxk8UiKY2S29zrJaWgWWCH1t0ki3SDOv0P3w/d
X-Received: by 10.55.163.130 with SMTP id m124mr1659152qke.256.1520955555719;
        Tue, 13 Mar 2018 08:39:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520955555; cv=none;
        d=google.com; s=arc-20160816;
        b=U0jvXagM7Uj1HxjsIBM+1bL6OvT/pFuY6TK/RO2IqFWYfaJ0z73thE6XimGrc4YfoG
         oJsm2J3wsjoMDP75a5pfqGcWEqH5kJIECxPawA0ZEp+9MdnzZbTRzbY72kS+tocz46Zl
         F0xizrWuWu34fW/n7LVtuo6QOli0qvw/ooXjw22S3yPXs6T7hopasNJ52a+oYAp81k5s
         dmVffQn6lbcrzuNd1CV6RsHMg+1prciaV48XM7FIkrHeMnIukGStmBXDtlmTJO7AueAj
         m9hOB6QWgJisH39kb6Ib9wlIPL0A43iPMmuldNDE0pqQTsfPrisCk/AMqrnZrhtxxABg
         doCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=CvnRNeh6ibfMrYNuS93D15H2Eb2EK4mAY4BMUSe1ppY=;
        b=ThWesdKvenBs4KFrUTJSbd1zgjbvUKFoVSXql8v1ffUbVpJxLYIJQs1USkoAyvsQ+T
         7n648Zauk9Efd+pdtf+vdN9dAB4OPvrWbxl4lxotlYxpKaMgVUy4UXoDkRNZgeDFr009
         gBsgprvfTu7hV6wCdVIpmqxXvcl+/v6txc4SnBDs/R0vpoVMuivq//lGPlcdmpC+kbb7
         vdZHsbqETkiihEqDEcgRGtXvryO8WKrR4rjbHm//UTu33JbR0aTJU+80nBTbk3Se0oFG
         VqcS7b1noSCoRZmjqIBFv6yqoWpR+HJizYRbvR7LLsFhCG9+yY5p8gzv/38D1NnB7TKV
         8LXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k97si460909qkh.153.2018.03.13.08.39.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 08:39:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evm1D-0000OL-4g
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 11:39:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxV-0005fK-O6
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 11:35:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxP-0005sb-Rw
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 11:35:25 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1evlxH-0005j0-8X; Tue, 13 Mar 2018 11:35:11 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1evlxD-0003Gh-Gd; Tue, 13 Mar 2018 15:35:07 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Mar 2018 15:34:58 +0000
Message-Id: <20180313153458.26822-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180313153458.26822-1-peter.maydell@linaro.org>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 9/9] hw/arm/raspi: Provide spin-loop code for
 AArch64 CPUs
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I0kX3g2T2qdN

The raspi3 has AArch64 CPUs, which means that our smpboot
code for keeping the secondary CPUs in a pen needs to have
a version for A64 as well as A32. Without this, the
secondary CPUs go into an infinite loop of taking undefined
instruction exceptions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/raspi.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index ae15997669..06f1e08ca9 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -27,6 +27,7 @@
 #define BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */
 #define FIRMWARE_ADDR_2 0x8000 /* Pi 2 loads kernel.img here by default */
 #define FIRMWARE_ADDR_3 0x80000 /* Pi 3 loads kernel.img here by default */
+#define SPINTABLE_ADDR  0xd8 /* Pi 3 bootloader spintable */
 
 /* Table of Linux board IDs for different Pi versions */
 static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43, [3] = 0xc44};
@@ -63,6 +64,40 @@ static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
                        info->smp_loader_start);
 }
 
+static void write_smpboot64(ARMCPU *cpu, const struct arm_boot_info *info)
+{
+    /* Unlike the AArch32 version we don't need to call the board setup hook.
+     * The mechanism for doing the spin-table is also entirely different.
+     * We must have four 64-bit fields at absolute addresses
+     * 0xd8, 0xe0, 0xe8, 0xf0 in RAM, which are the flag variables for
+     * our CPUs, and which we must ensure are zero initialized before
+     * the primary CPU goes into the kernel. We put these variables inside
+     * a rom blob, so that the reset for ROM contents zeroes them for us.
+     */
+    static const uint32_t smpboot[] = {
+        0xd2801b05, /*        mov     x5, 0xd8 */
+        0xd53800a6, /*        mrs     x6, mpidr_el1 */
+        0x924004c6, /*        and     x6, x6, #0x3 */
+        0xd503205f, /* spin:  wfe */
+        0xf86678a4, /*        ldr     x4, [x5,x6,lsl #3] */
+        0xb4ffffc4, /*        cbz     x4, spin */
+        0xd2800000, /*        mov     x0, #0x0 */
+        0xd2800001, /*        mov     x1, #0x0 */
+        0xd2800002, /*        mov     x2, #0x0 */
+        0xd2800003, /*        mov     x3, #0x0 */
+        0xd61f0080, /*        br      x4 */
+    };
+
+    static const uint64_t spintables[] = {
+        0, 0, 0, 0
+    };
+
+    rom_add_blob_fixed("raspi_smpboot", smpboot, sizeof(smpboot),
+                       info->smp_loader_start);
+    rom_add_blob_fixed("raspi_spintables", spintables, sizeof(spintables),
+                       SPINTABLE_ADDR);
+}
+
 static void write_board_setup(ARMCPU *cpu, const struct arm_boot_info *info)
 {
     arm_write_secure_board_setup_dummy_smc(cpu, info, MVBAR_ADDR);
@@ -99,7 +134,11 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
     /* Pi2 and Pi3 requires SMP setup */
     if (version >= 2) {
         binfo.smp_loader_start = SMPBOOT_ADDR;
-        binfo.write_secondary_boot = write_smpboot;
+        if (version == 2) {
+            binfo.write_secondary_boot = write_smpboot;
+        } else {
+            binfo.write_secondary_boot = write_smpboot64;
+        }
         binfo.secondary_cpu_reset_hook = reset_secondary;
     }
 
-- 
2.16.2

