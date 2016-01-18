Received: by 10.25.159.19 with SMTP id i19csp1756580lfe;
        Sun, 17 Jan 2016 23:21:01 -0800 (PST)
X-Received: by 10.140.180.80 with SMTP id b77mr10840316qha.67.1453101661605;
        Sun, 17 Jan 2016 23:21:01 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 201si29538600qhm.125.2016.01.17.23.20.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:21:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58061 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL475-00080K-No
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:20:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zs-0003Aj-1D
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:13:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zr-00074W-26
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:13:03 -0500
Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232]:36736)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL3zq-00074L-Ox; Mon, 18 Jan 2016 02:13:03 -0500
Received: by mail-pa0-x232.google.com with SMTP id yy13so336755276pab.3;
	Sun, 17 Jan 2016 23:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=PXPXN+K05sxgzUVal5JLtA5eT1UEt8v+7dE1SEEGAB0=;
	b=Y5WsYSbtZFkBL4jasmfT1smoossuUTfn411jrL2imdAMk5byfxhM4drrmekJmSAwo+
	Q7uxK9NVwezvMiYPIFQXMcV457FHoYi16sGk8dkFBQ+cQR7zvQ7KIHmh4Z2PqnJF+qAv
	ar+sVnwDxBL2HOWC7JM6Uq1BMXrwgEEcpDg6mtbatbZnD3z2fP5EySvbz37wcPV373vU
	7jGl/5quwB/tcs4GEDyDeAHYWU9732H67v31q/o1Pt75KGiuLQGYCx/tOfjk3mPWg0O/
	Y21GGf+X+YD13gs9f9Xrwdo2CCbvQCS+ddHljDpyeQirtxdPo2vYe+sXa60n/vzOku9U
	y7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=PXPXN+K05sxgzUVal5JLtA5eT1UEt8v+7dE1SEEGAB0=;
	b=f2soFrr/tpZjYDY2jTIdSUMXHDHwMiYg36qbrgw3ioglSpNGH8CLUDBwdb2iMdlPFJ
	rkpPA2SrlN6E/S0qNMgWfjWcQNl7Q+v5f74ShJAMzY0vxW+iQGSMcCx3foV5YDKqsid5
	wLtzCH6Th+Pk2UhmI3kcMRzUsIwgKE8mXAxoLuOaNBD6Lofkkqiowj7Yzszu1SXaytYr
	6nvkA/BasyXZucw34Og9zusNUuxbkY2Kn6r8PJkTVnJcJdc0pQr6T2gS/RBMFuM9uvaT
	fhe3BKDJB7PlnchPngxjcy2QPI1R6Dqd69xGxaMo3G+OtQdsr+iqmUkH4BQDU6uJPGh5
	UGCA==
X-Gm-Message-State: ALoCoQkvw1xZemudkEFw5mdst8Otw0PHzHZHumyfWGch+jySyUHZReC5yy1Wp7rPSjtQbUa1nud4QFF6XF5wFsYE9u9FphDP4w==
X-Received: by 10.66.236.69 with SMTP id us5mr34285183pac.93.1453101182240;
	Sun, 17 Jan 2016 23:13:02 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm31471880pab.10.2016.01.17.23.13.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:13:01 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:12:35 -0800
Message-Id: <2d20fa6a88faf2b99719ac90c9205e280e632634.1453100525.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::232
Cc: peter.maydell@linaro.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v1 08/17] target-arm: cpu: Move
	cpu_is_big_endian to header
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
X-TUID: 3DboovNlK2D/

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

There is a CPU data endianness test that is used to drive the
virtio_big_endian test.

Move this up to the header so it can be more generally used for endian
tests. The KVM specific cpu_syncronize_state call is left behind in the
virtio specific function.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 target-arm/cpu.c | 19 +++----------------
 target-arm/cpu.h | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 35a1f12..d3b73bf 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -368,26 +368,13 @@ static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
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
+    return arm_cpu_is_big_endian(env);
 }
 
 #endif
@@ -1420,7 +1407,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->do_unaligned_access = arm_cpu_do_unaligned_access;
     cc->get_phys_page_debug = arm_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_arm_cpu;
-    cc->virtio_is_big_endian = arm_cpu_is_big_endian;
+    cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
 #endif
     cc->gdb_num_core_regs = 26;
     cc->gdb_core_xml_file = "arm-core.xml";
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index f83070a..54675c7 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1795,6 +1795,25 @@ static inline bool arm_singlestep_active(CPUARMState *env)
         && arm_generate_debug_exceptions(env);
 }
 
+/* Return true if the processor is in big-endian mode. */
+static bool arm_cpu_is_big_endian(CPUARMState *env)
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

