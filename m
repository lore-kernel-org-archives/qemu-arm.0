Received: by 10.25.159.19 with SMTP id i19csp1755127lfe;
        Sun, 17 Jan 2016 23:16:48 -0800 (PST)
X-Received: by 10.140.218.72 with SMTP id o69mr29563750qhb.22.1453101408190;
        Sun, 17 Jan 2016 23:16:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a80si29619578qge.39.2016.01.17.23.16.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:16:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL43T-0001fF-G8
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:16:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zw-0003Ie-2R
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 02:13:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zv-000764-2m
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 02:13:07 -0500
Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233]:35541)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL3zs-000756-BT; Mon, 18 Jan 2016 02:13:04 -0500
Received: by mail-pf0-x233.google.com with SMTP id 65so153118389pff.2;
	Sun, 17 Jan 2016 23:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=TNT57Uu/xme2LgpVtzOS2Uq9P5ls0N6AIpVIV5V+YL0=;
	b=YxbjvF8GSvXuDNiYx/DdP7T2u01nJmABDQc3QyLG4/a+UCfJVo4hxx+KGzw9gff3zy
	juf5ZC/56rDezb3qnOiB/7QZ0SaoaGGMQ9KuFxxqzrkEE/hPIaMHgm1fWK6/WX6OvmDi
	xfI8i3kuKTNWhW5AlvBKPq/7b4G4+YnehmyGw+6gxUT2S6DSF74yy3owl+HyAsZLH5IH
	NqKkow0vwrk2n0vCWRFckTUIo738+hVVwriu+vxPtbZL2Wdr1g9YnwHWjJGtl1o2cXZj
	PqJrh/fEW5bEtnXlG5XYu2ARz5Y4CZBNNO8meMvXOWZCCaeyJB5UBtt8SAXNF1pdpQxO
	sTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=TNT57Uu/xme2LgpVtzOS2Uq9P5ls0N6AIpVIV5V+YL0=;
	b=c62ZixwRbECWQcRl+eeENkDfg4HUwWSI/pwvatPPoKoByICOnxw28qD+KMD3b7mqeE
	sEzgpkUgvrt7kqWkIqeUOxgDqpFenIECfZf1qm2cHZpjahLi/ysZbj8j2rgt1FoPDvj4
	2vQNCVizW+lJY+XoHCdboB2XiRpV5MTz74dlfGVRRcieDv3fqBKgQF3kK82R8aHGQMGB
	YxnOBX4ySh6KVmrIVkvU1Ct8BwnuOtQqZ8uNZ0zjuFwXIUugUu9YFc0O8SbxNliAAFAN
	DsXSxs7SumZ75ctSjRAd8NYEppfzNeuSTYdttHWnzd9Nv0O2xca3TOwQ7LHI3cS3Ebbr
	aEDg==
X-Gm-Message-State: ALoCoQk/AfhRBKSwS4ad02XkLCK22hW9OPEA9Zo1BuKcD+rNS5YTrIreQYYBKnkK3BgQjpH605hmwt4Dl8GKJAS3bsA6Z0wIhw==
X-Received: by 10.98.72.204 with SMTP id q73mr34424916pfi.69.1453101183822;
	Sun, 17 Jan 2016 23:13:03 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm31471880pab.10.2016.01.17.23.13.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:13:02 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:12:36 -0800
Message-Id: <c0f5e1844b6f9e40de952e8ae01fe53e76a9e03c.1453100525.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::233
Cc: peter.maydell@linaro.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-arm] [PATCH v1 09/17] target-arm: introduce tbflag for
	endianness
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
X-TUID: vN4VhT6sd8zv

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Introduce a tbflags for endianness, set based upon the CPUs current
endianness. This in turn propagates through to the disas endianness
flag.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 target-arm/cpu.h           | 7 +++++++
 target-arm/translate-a64.c | 2 +-
 target-arm/translate.c     | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 54675c7..74048d1 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1857,6 +1857,8 @@ static bool arm_cpu_is_big_endian(CPUARMState *env)
  */
 #define ARM_TBFLAG_NS_SHIFT         19
 #define ARM_TBFLAG_NS_MASK          (1 << ARM_TBFLAG_NS_SHIFT)
+#define ARM_TBFLAG_MOE_SHIFT        20
+#define ARM_TBFLAG_MOE_MASK         (1 << ARM_TBFLAG_MOE_SHIFT)
 
 /* Bit usage when in AArch64 state: currently we have no A64 specific bits */
 
@@ -1887,6 +1889,8 @@ static bool arm_cpu_is_big_endian(CPUARMState *env)
     (((F) & ARM_TBFLAG_XSCALE_CPAR_MASK) >> ARM_TBFLAG_XSCALE_CPAR_SHIFT)
 #define ARM_TBFLAG_NS(F) \
     (((F) & ARM_TBFLAG_NS_MASK) >> ARM_TBFLAG_NS_SHIFT)
+#define ARM_TBFLAG_MOE(F) \
+    (((F) & ARM_TBFLAG_MOE_MASK) >> ARM_TBFLAG_MOE_SHIFT)
 
 /* Return the exception level to which FP-disabled exceptions should
  * be taken, or 0 if FP is enabled.
@@ -2018,6 +2022,9 @@ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             }
         }
     }
+    if (arm_cpu_is_big_endian(env)) {
+        *flags |= ARM_TBFLAG_MOE_MASK;
+    }
     *flags |= fp_exception_el(env) << ARM_TBFLAG_FPEXC_EL_SHIFT;
 
     *cs_base = 0;
diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 59026b6..db68662 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -11044,7 +11044,7 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
                                !arm_el_is_aa64(env, 3);
     dc->thumb = 0;
     dc->bswap_code = 0;
-    dc->mo_endianness = MO_TE;
+    dc->mo_endianness = ARM_TBFLAG_MOE(tb->flags) ? MO_BE : MO_LE;
     dc->condexec_mask = 0;
     dc->condexec_cond = 0;
     dc->mmu_idx = ARM_TBFLAG_MMUIDX(tb->flags);
diff --git a/target-arm/translate.c b/target-arm/translate.c
index e1679d3..cb925ef 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -11274,7 +11274,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
                                !arm_el_is_aa64(env, 3);
     dc->thumb = ARM_TBFLAG_THUMB(tb->flags);
     dc->bswap_code = ARM_TBFLAG_BSWAP_CODE(tb->flags);
-    dc->mo_endianness = MO_TE;
+    dc->mo_endianness = ARM_TBFLAG_MOE(tb->flags) ? MO_BE : MO_LE;
     dc->condexec_mask = (ARM_TBFLAG_CONDEXEC(tb->flags) & 0xf) << 1;
     dc->condexec_cond = ARM_TBFLAG_CONDEXEC(tb->flags) >> 4;
     dc->mmu_idx = ARM_TBFLAG_MMUIDX(tb->flags);
-- 
1.9.1

