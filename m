Received: by 10.25.208.211 with SMTP id h202csp2009887lfg;
        Tue, 1 Mar 2016 23:01:42 -0800 (PST)
X-Received: by 10.55.200.215 with SMTP id t84mr31999879qkl.55.1456902102633;
        Tue, 01 Mar 2016 23:01:42 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z134si34845783qkz.51.2016.03.01.23.01.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 23:01:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0mz-0006Fp-Kz
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 02:01:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0ij-0006pN-FL
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0ii-0003ZV-Jb
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:17 -0500
Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a]:36717)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0ii-0003ZL-9e; Wed, 02 Mar 2016 01:57:16 -0500
Received: by mail-pa0-x22a.google.com with SMTP id a9so5820464pat.3;
	Tue, 01 Mar 2016 22:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=H919to/5xqJZGCLfojJVoUcIfdnpw4lQ3TKc9JRZs/8=;
	b=aDK3ORrbKtwxeSzKlGW+g13jsnMVf2YKIq5O9nWLrmODPC+t6dT23Rp5s9Y41ouuNX
	jWzas+BERfTBrkK4VfEOk9bdb7gywNbKnkx06ORdkSpvgkW1Ln0xWk1fVQ/i/BT/hkVo
	jzbkyci2KyCYeEWT53/c8nTZJj4eYeBzziNLSsbS1cCfi350ynEUHji2aKDmlRFN9qBu
	SGh/btKDJbc/HES6j4YEO6TCKEOrxzasi2imkYRk5ayd9qm2lzMFAJyZgOAFp6wIGd9D
	Ujt1b3moj92yDhch7uacf/tD58Bzt/VIt0mTjeV7rPECSIuIeenqwYuZ5JFHWL7Ws93N
	M35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=H919to/5xqJZGCLfojJVoUcIfdnpw4lQ3TKc9JRZs/8=;
	b=GGdPbg57WUe9pd+8DwqufwKIYAXqi3Ku7EgrID2aRvFGAs8PfWjcBI16q5nFhnDv6O
	Nu7T5H3C3OGeqS3TTuP+uabIs/bZZuZYdTaV71wYbBHufnbP2DHIrua5lbp+0xAHTlJU
	T1GEOBKUAcauSiZonMgAtPh38Lqjgkw2233iuLeDvpcNqX3gUEEO9Qd+OG+yzq3S74tA
	1qymuhK5eD3I0f2fPltIgG/p+l8Pj804Mcs/fgyJPn7if6m+143eVj7U9fb7Csmj4gBX
	XhwYRKOlreuaBGfiqQW2qiD9alc5waqQnan+2Dx0ju0n+3CqwEskmU9n5D/nt6DEQhbZ
	qWIw==
X-Gm-Message-State: AD7BkJIm7I/2995LuTloyeG/hooq8rkCjOc6LLLunNr/VPoc5JVd7DpMOWTZjOEJ35wWxw==
X-Received: by 10.66.251.194 with SMTP id zm2mr36641732pac.131.1456901835538; 
	Tue, 01 Mar 2016 22:57:15 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.57.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:57:14 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:16 -0800
Message-Id: <80cd403f8b491b949edfee48751985c4764671ba.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22a
Cc: peter.maydell@linaro.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v2 12/18] target-arm: introduce tbflag for
	endianness
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
X-TUID: v3uTRwfBUvLu

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Introduce a tbflags for endianness, set based upon the CPUs current
endianness. This in turn propagates through to the disas endianness
flag.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
changed since v1:
s/MOE/BE_DATA (PMM review)

 target-arm/cpu.h           | 7 +++++++
 target-arm/translate-a64.c | 2 +-
 target-arm/translate.c     | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index cbf171c..279c91f 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1985,6 +1985,8 @@ static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
  */
 #define ARM_TBFLAG_NS_SHIFT         19
 #define ARM_TBFLAG_NS_MASK          (1 << ARM_TBFLAG_NS_SHIFT)
+#define ARM_TBFLAG_BE_DATA_SHIFT    20
+#define ARM_TBFLAG_BE_DATA_MASK     (1 << ARM_TBFLAG_BE_DATA_SHIFT)
 
 /* Bit usage when in AArch64 state: currently we have no A64 specific bits */
 
@@ -2015,6 +2017,8 @@ static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
     (((F) & ARM_TBFLAG_XSCALE_CPAR_MASK) >> ARM_TBFLAG_XSCALE_CPAR_SHIFT)
 #define ARM_TBFLAG_NS(F) \
     (((F) & ARM_TBFLAG_NS_MASK) >> ARM_TBFLAG_NS_SHIFT)
+#define ARM_TBFLAG_BE_DATA(F) \
+    (((F) & ARM_TBFLAG_BE_DATA_MASK) >> ARM_TBFLAG_BE_DATA_SHIFT)
 
 static inline bool bswap_code(bool sctlr_b)
 {
@@ -2157,6 +2161,9 @@ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             }
         }
     }
+    if (arm_cpu_data_is_big_endian(env)) {
+        *flags |= ARM_TBFLAG_BE_DATA_MASK;
+    }
     *flags |= fp_exception_el(env) << ARM_TBFLAG_FPEXC_EL_SHIFT;
 
     *cs_base = 0;
diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 539e6d9..f0c73df 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -11043,7 +11043,7 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
                                !arm_el_is_aa64(env, 3);
     dc->thumb = 0;
     dc->sctlr_b = 0;
-    dc->be_data = MO_TE;
+    dc->be_data = ARM_TBFLAG_BE_DATA(tb->flags) ? MO_BE : MO_LE;
     dc->condexec_mask = 0;
     dc->condexec_cond = 0;
     dc->mmu_idx = ARM_TBFLAG_MMUIDX(tb->flags);
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 88f24cb..fe0be00 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -11330,7 +11330,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
                                !arm_el_is_aa64(env, 3);
     dc->thumb = ARM_TBFLAG_THUMB(tb->flags);
     dc->sctlr_b = ARM_TBFLAG_SCTLR_B(tb->flags);
-    dc->be_data = MO_TE;
+    dc->be_data = ARM_TBFLAG_BE_DATA(tb->flags) ? MO_BE : MO_LE;
     dc->condexec_mask = (ARM_TBFLAG_CONDEXEC(tb->flags) & 0xf) << 1;
     dc->condexec_cond = ARM_TBFLAG_CONDEXEC(tb->flags) >> 4;
     dc->mmu_idx = ARM_TBFLAG_MMUIDX(tb->flags);
-- 
1.9.1

