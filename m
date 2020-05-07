Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1985083lfb;
        Thu, 7 May 2020 06:51:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypIvF6ZM41SrMFMQbGy52ab174K3jVVQbQYAiUY1e8an4mRcNNHpjHhcRAIAn/gVJXrWdCAF
X-Received: by 2002:a05:620a:a93:: with SMTP id v19mr14418290qkg.416.1588859508315;
        Thu, 07 May 2020 06:51:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588859508; cv=none;
        d=google.com; s=arc-20160816;
        b=Np1Lc9KuKjvSDOn1i5WWntDhg3L7VaKLviqOvSZQtC5F7cAc5Y+IyyWFVjeEZkzJAE
         OBf6qgWh3KR74ecGHbk72oBQSKiu70UR7NyKCkKe+i1kXuEIdrcvhV4uFKCbKp3gk+hV
         NtSnF1UJD/Qqi6PEjwUPSWNSEpeKGEVJwDuMm3CIRHMlYtvLDfu5su5SeyLOGcZRR8sX
         owCN3bsAR0PTS+LEAhnE5usGlZR85zIB//wxxHk82j0WF6b2Yoe87ccLv83Pk2hKm2C0
         udQNrJ2GZ5V5FL9n4edPPCdEKDNjYjhwcnLbRO3urMm51nvrOJgC9ix3KiHiPLFfXinn
         WeeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=omD69ttFpxcDTaYekNBFVUzGkRuZKIclc+69h9JbEvA=;
        b=khCOLjRbd7WSR8qxMj7013b8CPEBfYJLsnGQ6gdnJIzf2g6BCoAYb7OEcFAohR6Inv
         30SgZoAGFRxrhSpNsC8C3xsDE3RK3SWnqwe+ilS416R8kHbsDumC4xl98WmtHHqUck9P
         9cw1gw2o2St6orXEWEAmyYJataJQnFP1lT8spoDQA9+dQxrIyoKy4WWXmTN4bl2mo1U9
         Jj/CfsPg5yoYdsZw9XSsqTFugRdgn5ZBv56xcFUX6W3MPvUR4qsbufGzezs4G6zZ02F4
         vkGNfjPpVNQSjIIaPx4Co4PeB8ZyfpmGC6alyC4jHMqLAPpyMktoqRcWV4jDdsPhf5Xb
         EkMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IEl0+1Qh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id o55si2934051qtf.240.2020.05.07.06.51.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 06:51:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IEl0+1Qh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWgwF-0007qk-Nq
	for alex.bennee@linaro.org; Thu, 07 May 2020 09:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWgsc-0002sC-UW
 for qemu-arm@nongnu.org; Thu, 07 May 2020 09:48:03 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWgsZ-0002Rg-CO
 for qemu-arm@nongnu.org; Thu, 07 May 2020 09:48:01 -0400
Received: by mail-wr1-x436.google.com with SMTP id k1so6480961wrx.4
 for <qemu-arm@nongnu.org>; Thu, 07 May 2020 06:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=omD69ttFpxcDTaYekNBFVUzGkRuZKIclc+69h9JbEvA=;
 b=IEl0+1Qh8WlMukYuKO3rZbTOC+RE6IQVl4gHr8vXgUgCjDXYIm3uIEU7grgG06pBGN
 j2rohfKXSesZ9uVtfxxG5wA4YML1chSKWFXlaIe0dFKNgfiXWVyHF3UJyPYCnuEc26zh
 t8p4igrhcHJHzaFrnQxk+6BK6Zl9xY0BtC9Us/zt1LzSmL9yJAM3us7wQzy2f2mM1a9Z
 NgzM+2N5fANampKxM/P/OfN02KmDhm/IC3ExDczryKJXYfjQpQYSnrnYdT1txh9oN9NZ
 eJcAhtd9AjKGW9Sv2xrOcJaQ8v+j2sEVU/nWFGGJN+/m0VRpj3927akvbtiFX+klas+j
 Sguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=omD69ttFpxcDTaYekNBFVUzGkRuZKIclc+69h9JbEvA=;
 b=XxlW7yzNNyKf/uRmu81IRwzJX9uBVAR3RwZWDGxwK3ARWmf1O2t/w02rDTA3S5LwHF
 uHP7Fhy6SfGkENqJatLxmw0AomO2STVHQpbUbywIm0VeJpP0CXPrKj8Ad3KjTOSKzcX7
 OSD5x+C2iP4tqj+wzyUqFpoHpqSD3x3aPT+XkWgmd//nXj/4K5G2EQlSUoUphcRJWQnR
 IOF+zjkVZcOtI1P34IdcFboVSEer9/QybOyWEii18oEwnBUEQ/fA4iS/qa67BtDtuCrX
 UMhBaKfqPY6/DwXQsHCzkO1GSXFZHFKOebIXQj5mQ8+FXYaY4zqNPpIxN73kbp0/hlzg
 ffmg==
X-Gm-Message-State: AGi0PuZQ2q3PjOcN/Frcf+WP8ZZklj5wj5A85V6zFQ39p/3c20wxseWt
 zQ6kE0UHXYhbret2KRpARtfTm9cbxkeOHA==
X-Received: by 2002:a5d:650b:: with SMTP id x11mr15299876wru.405.1588859277480; 
 Thu, 07 May 2020 06:47:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s14sm8443128wme.33.2020.05.07.06.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 06:47:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Use correct GDB XML for M-profile cores
Date: Thu,  7 May 2020 14:47:55 +0100
Message-Id: <20200507134755.13997-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fUjzkpbWMdWW

GDB's remote protocol requires M-profile cores to use the feature
name 'org.gnu.gdb.arm.m-profile' instead of the 'org.gnu.gdb.arm.core'
feature used for A- and R-profile cores. We weren't doing this, which
meant GDB treated our M-profile cores like A-profile ones. This mostly
doesn't matter, but for instance means that it doesn't correctly
handle backtraces where an M-profile exception frame is involved.

Ship a copy of GDB's arm-m-profile.xml and use it on the M-profile
cores.  The integer registers have the same offsets as the
arm-core.xml, but register 25 is the M-profile XPSR rather than the
A-profile CPSR, so we need to update arm_cpu_gdb_read_register() and
arm_cpu_gdb_write_register() to handle XSPR reads and writes.

Fixes: https://bugs.launchpad.net/qemu/+bug/1877136
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure                 |  4 ++--
 target/arm/cpu.c          |  1 +
 target/arm/gdbstub.c      | 22 ++++++++++++++++++----
 gdb-xml/arm-m-profile.xml | 27 +++++++++++++++++++++++++++
 4 files changed, 48 insertions(+), 6 deletions(-)
 create mode 100644 gdb-xml/arm-m-profile.xml

diff --git a/configure b/configure
index 0d69c360c0e..360e7e6a0a4 100755
--- a/configure
+++ b/configure
@@ -7806,14 +7806,14 @@ case "$target_name" in
     TARGET_SYSTBL_ABI=common,oabi
     bflt="yes"
     mttcg="yes"
-    gdb_xml_files="arm-core.xml arm-vfp.xml arm-vfp3.xml arm-neon.xml"
+    gdb_xml_files="arm-core.xml arm-vfp.xml arm-vfp3.xml arm-neon.xml arm-m-profile.xml"
   ;;
   aarch64|aarch64_be)
     TARGET_ARCH=aarch64
     TARGET_BASE_ARCH=arm
     bflt="yes"
     mttcg="yes"
-    gdb_xml_files="aarch64-core.xml aarch64-fpu.xml arm-core.xml arm-vfp.xml arm-vfp3.xml arm-neon.xml"
+    gdb_xml_files="aarch64-core.xml aarch64-fpu.xml arm-core.xml arm-vfp.xml arm-vfp3.xml arm-neon.xml arm-m-profile.xml"
   ;;
   cris)
   ;;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5d64adfe76e..b386bbbfd12 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2179,6 +2179,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 #endif
 
     cc->cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
+    cc->gdb_core_xml_file = "arm-m-profile.xml";
 }
 
 static const ARMCPRegInfo cortexr5_cp_reginfo[] = {
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 063551df234..ecfa88f8e60 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -57,8 +57,12 @@ int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
         }
         return gdb_get_reg32(mem_buf, 0);
     case 25:
-        /* CPSR */
-        return gdb_get_reg32(mem_buf, cpsr_read(env));
+        /* CPSR, or XPSR for M-profile */
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            return gdb_get_reg32(mem_buf, xpsr_read(env));
+        } else {
+            return gdb_get_reg32(mem_buf, cpsr_read(env));
+        }
     }
     /* Unknown register.  */
     return 0;
@@ -98,8 +102,18 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         }
         return 4;
     case 25:
-        /* CPSR */
-        cpsr_write(env, tmp, 0xffffffff, CPSRWriteByGDBStub);
+        /* CPSR, or XPSR for M-profile */
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            /*
+             * Don't allow writing to XPSR.Exception as it can cause
+             * a transition into or out of handler mode (it's not
+             * writeable via the MSR insn so this is a reasonable
+             * restriction). Other fields are safe to update.
+             */
+            xpsr_write(env, tmp, ~XPSR_EXCP);
+        } else {
+            cpsr_write(env, tmp, 0xffffffff, CPSRWriteByGDBStub);
+        }
         return 4;
     }
     /* Unknown register.  */
diff --git a/gdb-xml/arm-m-profile.xml b/gdb-xml/arm-m-profile.xml
new file mode 100644
index 00000000000..5319d764eeb
--- /dev/null
+++ b/gdb-xml/arm-m-profile.xml
@@ -0,0 +1,27 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2010-2020 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.arm.m-profile">
+  <reg name="r0" bitsize="32"/>
+  <reg name="r1" bitsize="32"/>
+  <reg name="r2" bitsize="32"/>
+  <reg name="r3" bitsize="32"/>
+  <reg name="r4" bitsize="32"/>
+  <reg name="r5" bitsize="32"/>
+  <reg name="r6" bitsize="32"/>
+  <reg name="r7" bitsize="32"/>
+  <reg name="r8" bitsize="32"/>
+  <reg name="r9" bitsize="32"/>
+  <reg name="r10" bitsize="32"/>
+  <reg name="r11" bitsize="32"/>
+  <reg name="r12" bitsize="32"/>
+  <reg name="sp" bitsize="32" type="data_ptr"/>
+  <reg name="lr" bitsize="32"/>
+  <reg name="pc" bitsize="32" type="code_ptr"/>
+  <reg name="xpsr" bitsize="32" regnum="25"/>
+</feature>
-- 
2.20.1

