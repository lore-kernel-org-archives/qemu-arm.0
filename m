Received: by 10.25.208.211 with SMTP id h202csp2008269lfg;
        Tue, 1 Mar 2016 22:57:02 -0800 (PST)
X-Received: by 10.140.133.133 with SMTP id 127mr33270123qhf.42.1456901822390;
        Tue, 01 Mar 2016 22:57:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f185si34742386qhd.52.2016.03.01.22.57.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 22:57:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54423 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0iT-0006EX-Mf
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 01:57:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iQ-00067d-5v
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 01:56:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iP-0003SF-6J
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 01:56:58 -0500
Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230]:35766)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0iM-0003RM-Vt; Wed, 02 Mar 2016 01:56:55 -0500
Received: by mail-pa0-x230.google.com with SMTP id bj10so58528058pad.2;
	Tue, 01 Mar 2016 22:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=bCO8dTI8bEivl7hz+ME3DpN2V0T0vMzqMoXxkznGneA=;
	b=kNGUKng8VjepMdCOuLkO4kTJOnrHSdoOwX0X9kIrSH0lFEoPfjuyFnIxERYJhRvoWz
	XwVeD5sC5U/Q9BrmOYfQ3egHZZ1TMNP50cKTmf6dG4gKylt6KlJcuTjj+brWy3OmYyyI
	wycVsAXj0exKgg+GYK+HpxvWXM5MfdzELA/h1GTf/YV3XOlSHnGobUqjRPPWoYhOEUoN
	VJDD16UpKWSTtpDFme8uUFfF8Co2EJBl4qz1AJyw60kkNl2qDP7gWpLyvB5MZf1zH6st
	UPEESIc/OCmmIy1ZJJki61C56RKhxoddD3mMV2B/NObVE3/3Phgi8Ib2EYuMEnZ6R7Sn
	515A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=bCO8dTI8bEivl7hz+ME3DpN2V0T0vMzqMoXxkznGneA=;
	b=J+PBgVXBFm5tFSDpfrsYGRqq0bFtqCTP8uEFO0OnlQTt0MwWYFgfkVhduihLDS9utO
	ZsvliOrT7QklseJZkhfCZiqEP7NnbyV/509n4aQyN3VoshJ93VlyKM3V7IfGwzQMyGcZ
	MkiL6RzPghS0MFMNGYrytLXR25s5QpIspxEa0fLueQZsneXtxjMvVhlnDNRNptoQHdpR
	zPUzYvJatm2Un3x/01f26tS82uPacRYetyE7p6DLOWEKfMIaU1HhKs/rPqHyMHMafcFs
	WlqCweQ2yd+AEPuI3fCewbxsge5gfWrHg6gbH9saGavTDnklfliiUXuWL1AfFchUIaCi
	zMLA==
X-Gm-Message-State: AD7BkJLdHTf1/chvA+xZVQBJ/eZKIuwJPrXi7sRF0w7XTGsPIvwQ1Ulv1ZwphRpik32u6Q==
X-Received: by 10.67.30.163 with SMTP id kf3mr36398963pad.45.1456901814205;
	Tue, 01 Mar 2016 22:56:54 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.56.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:56:53 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:08 -0800
Message-Id: <a6e339ac2fb58e7109f4df9cd5e2c344e7e990a1.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::230
Cc: peter.maydell@linaro.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-arm] [PATCH v2 04/18] target-arm: cpu: Move cpu_is_big_endian
	to header
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: se5/DsyjPRR1

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

There is a CPU data endianness test that is used to drive the
virtio_big_endian test.

Move this up to the header so it can be more generally used for endian
tests. The KVM specific cpu_syncronize_state call is left behind in the
virtio specific function.

Rename it arm_cpu-data_is_big_endian() to more accurately capture that
this is for data accesses only.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
TEST result: 0 (log@ logs/qemu-armeb-BE32-)
TEST result: 0 (log@ logs/qemu-armeb-BE8-)
TEST result: 0 (log@ logs/qemu-arm-LE-)
TEST result: 0 (log@ logs/qemu-system-arm-LE-)
Changed since v1:
rename to arm_cpu_data_is_big_endian (PMM review)
inline function to suppress compile warning.

 target-arm/cpu.c | 19 +++----------------
 target-arm/cpu.h | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 001fccf..352d9f8 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -369,26 +369,13 @@ static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
 #endif
 }
 
-static bool arm_cpu_is_big_endian(CPUState *cs)
+static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    int cur_el;
 
     cpu_synchronize_state(cs);
-
-    /* In 32bit guest endianness is determined by looking at CPSR's E bit */
-    if (!is_a64(env)) {
-        return (env->uncached_cpsr & CPSR_E) ? 1 : 0;
-    }
-
-    cur_el = arm_current_el(env);
-
-    if (cur_el == 0) {
-        return (env->cp15.sctlr_el[1] & SCTLR_E0E) != 0;
-    }
-
-    return (env->cp15.sctlr_el[cur_el] & SCTLR_EE) != 0;
+    return arm_cpu_data_is_big_endian(env);
 }
 
 #endif
@@ -1476,7 +1463,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->vmsd = &vmstate_arm_cpu;
-    cc->virtio_is_big_endian = arm_cpu_is_big_endian;
+    cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
 #endif
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 61b8b03..75e5ea0 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1908,6 +1908,25 @@ static inline bool arm_sctlr_b(CPUARMState *env)
         (env->cp15.sctlr_el[1] & SCTLR_B) != 0;
 }
 
+/* Return true if the processor is in big-endian mode. */
+static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
+{
+    int cur_el;
+
+    /* In 32bit endianness is determined by looking at CPSR's E bit */
+    if (!is_a64(env)) {
+        return (env->uncached_cpsr & CPSR_E) ? 1 : 0;
+    }
+
+    cur_el = arm_current_el(env);
+
+    if (cur_el == 0) {
+        return (env->cp15.sctlr_el[1] & SCTLR_E0E) != 0;
+    }
+
+    return (env->cp15.sctlr_el[cur_el] & SCTLR_EE) != 0;
+}
+
 #include "exec/cpu-all.h"
 
 /* Bit usage in the TB flags field: bit 31 indicates whether we are
-- 
1.9.1

