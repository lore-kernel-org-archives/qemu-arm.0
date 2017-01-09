Received: by 10.25.205.13 with SMTP id d13csp11564460lfg;
        Mon, 9 Jan 2017 08:09:30 -0800 (PST)
X-Received: by 10.55.76.197 with SMTP id z188mr85246462qka.184.1483978170856;
        Mon, 09 Jan 2017 08:09:30 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b67si6122790qkg.291.2017.01.09.08.09.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jan 2017 08:09:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQcVk-0002ry-3D
	for alex.bennee@linaro.org; Mon, 09 Jan 2017 11:09:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQcS7-0007tT-1f
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 11:05:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQcS6-0003mL-4t
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 11:05:43 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cQcS5-0003hC-Q4; Mon, 09 Jan 2017 11:05:41 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cQcRr-0001j3-K6; Mon, 09 Jan 2017 16:05:27 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Jan 2017 16:05:11 +0000
Message-Id: <1483977924-14522-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 05/18] target-arm: Add ARMCPU fields for GIC
 CPU i/f config
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrew Jones <drjones@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ETvS/xuE1mgK

Add fields to the ARMCPU structure to allow CPU classes to
specify the configurable aspects of their GIC CPU interface.
In particular, the virtualization support allows different
values for number of list registers, priority bits and
preemption bits.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h   | 5 +++++
 target/arm/cpu64.c | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 764b511..28c5d8f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -659,6 +659,11 @@ struct ARMCPU {
     uint32_t dcz_blocksize;
     uint64_t rvbar;
 
+    /* Configurable aspects of GIC cpu interface (which is part of the CPU) */
+    int gic_num_lrs; /* number of list registers */
+    int gic_vpribits; /* number of virtual priority bits */
+    int gic_vprebits; /* number of virtual preemption bits */
+
     ARMELChangeHook *el_change_hook;
     void *el_change_hook_opaque;
 };
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 549cb1e..73c7f31 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -147,6 +147,9 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
     cpu->ccsidr[2] = 0x70ffe07a; /* 2048KB L2 cache */
     cpu->dcz_blocksize = 4; /* 64 bytes */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
     define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
 }
 
@@ -201,6 +204,9 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
     cpu->ccsidr[2] = 0x707fe07a; /* 1024KB L2 cache */
     cpu->dcz_blocksize = 4; /* 64 bytes */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
     define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
 }
 
-- 
2.7.4

