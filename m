Received: by 10.223.172.38 with SMTP id v35csp1208948wrc;
        Thu, 14 Sep 2017 11:45:17 -0700 (PDT)
X-Received: by 10.200.6.8 with SMTP id d8mr8107393qth.142.1505414717037;
        Thu, 14 Sep 2017 11:45:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505414717; cv=none;
        d=google.com; s=arc-20160816;
        b=wtPTKxmOqbK8CVAjZ3EHFbSpqxvJlY2+WScPbxHsW+a99CbDu36w0OtsoWgkroTdPu
         KY/qjJWSZq0snSIVXf65JYR+QyFsF1YhmCpARpzASfcp9jL/g21bKdlk8O25zO93V4hU
         8DR19MWfo2WwQepUf5bv4fodqCa6bgfJPryvXCcV8ZWJrmUGbV60WeFrNelDplvLpu/A
         hOm9EfBRQE4bPmpltVgO4unOmHFMKNiGP5zI2CBQ7bgWbizLEUD+kX1S2gx0imaju92W
         apckqWQcaFhZ0/IfU23DtMzQu0RK2jbr+4WOa4YEKN4mqTItsEVwuaAV6LMhkkdIScWH
         7ksA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=BJqyeQ0M3M1yn5ApG5bni6x3B5PmYk58/MJIa3Ocjvs=;
        b=ya/Ml2wvqmMKpQJbWkE72YlWhi0nN1n+sSzbNPgqoqJ44nNymh4Jvz6yKfVCg8gfdR
         uzdgPAija5AgRwSxoahNvzSVA0F13hh99XwCNSUlEWyxTOU05gfp0bsYwUndYfprqyNy
         Ex0xEXF/Gkx5Ubi7vGLSV0CwvXzcvHjP0dQrl45X6q04v4ss5AdJXfQ69PeTrEAtzQ0w
         vNyui4RViVmvONQg9Ac+lGWnPn43zD7akUoR7ZEvb88HqGZedV6fETk+KFmUl/rhOSje
         3WP75mYo1T5IvekXzWxXculL4Ps+IqX16wiT/x237E3fHXYUQZG9/TBkfFuH0zr+rqTc
         zv6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kffYuaSY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q128si4749921qkb.499.2017.09.14.11.45.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 11:45:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kffYuaSY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsZ8U-0000uE-UM
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 14:45:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsYz3-0000Qd-9I
	for qemu-devel@nongnu.org; Thu, 14 Sep 2017 14:35:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsYz2-0000XY-Ec
	for qemu-devel@nongnu.org; Thu, 14 Sep 2017 14:35:29 -0400
Received: from mail-pg0-x232.google.com ([2607:f8b0:400e:c05::232]:49374)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dsYz2-0000WA-6l
	for qemu-devel@nongnu.org; Thu, 14 Sep 2017 14:35:28 -0400
Received: by mail-pg0-x232.google.com with SMTP id m30so118660pgn.6
	for <qemu-devel@nongnu.org>; Thu, 14 Sep 2017 11:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BJqyeQ0M3M1yn5ApG5bni6x3B5PmYk58/MJIa3Ocjvs=;
	b=kffYuaSYGsKFT6OHxWW+QVw5wCI4nuTtRdVy0a6pXitTnortrYJGuT4NLdjYSXtoko
	vW1m698y5I33NJH8MLtZLulw/NUvY2pSXK9ezvTYLtxI32+dxo7MQz8lXerC/UVrjaTw
	Z/yuJdZ/J23MoQowcYwzlnwcDyllArI6WT82g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BJqyeQ0M3M1yn5ApG5bni6x3B5PmYk58/MJIa3Ocjvs=;
	b=dhkB4+CFtfs7bSkI9B8xFQ5bi4guSW+vjGsnxsXAx+ja6gEcngQ7KGK3z/tI1b4keQ
	0xu0XYN1GuE4BFTd1X4EoHe5jYy1GKfZHpsetJM2lV0FHNUGUfh7n/+fCO2XXGFwVC9D
	jBpknFh3LooAPM1Wo1P2q5wyg98v3sNZ1s5w6EBT82QWO+f3yr6idj3GkLSLrDQWcJgo
	Dchbez/YP1egdZdPsjmSR2KZ9eIhft7ujbn8nEzHy2GZxJ2dgByQK2+hl/ahky6MyC+W
	gXxJftO//Ebk5e+qwB4VjHGd1VSYJyS9kCWkadijq7fKqCgcAOqN0eRL6VN1Gq67gFgs
	3xQQ==
X-Gm-Message-State: AHPjjUhQQfVPbKSVCA4g7bmQh0fiwEu152tc0TqohbKohx7hScFGfDCo
	ck+QVsyHAXJX6A3CoaFsMA==
X-Google-Smtp-Source: ADKCNb4pdpBAgYs+bv/J0F7I78qJ03qTMZs+mbSKzjiN49v32hDDGulORBTdCBenCasA2MXeJvNP5A==
X-Received: by 10.98.11.214 with SMTP id 83mr22371354pfl.326.1505414127081;
	Thu, 14 Sep 2017 11:35:27 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-103-167.tukw.qwest.net.
	[97.126.103.167]) by smtp.gmail.com with ESMTPSA id
	l85sm32473848pfb.176.2017.09.14.11.35.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Sep 2017 11:35:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 14 Sep 2017 11:35:12 -0700
Message-Id: <20170914183516.19537-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170914183516.19537-1-richard.henderson@linaro.org>
References: <20170914183516.19537-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::232
Subject: [Qemu-devel] [PATCH 06/10] target/arm: Support Capstone in
 disas_set_info
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hm/nP0h2BBs3

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a1acce3c7a..92159ca0b1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -33,6 +33,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/hw_accel.h"
 #include "kvm_arm.h"
+#include "disas/capstone.h"
 
 static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -476,10 +477,24 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 #if defined(CONFIG_ARM_A64_DIS)
         info->print_insn = print_insn_arm_a64;
 #endif
-    } else if (env->thumb) {
-        info->print_insn = print_insn_thumb1;
+        info->cap_arch = CS_ARCH_ARM64;
     } else {
-        info->print_insn = print_insn_arm;
+        int cap_mode;
+        if (env->thumb) {
+            info->print_insn = print_insn_thumb1;
+            cap_mode = CS_MODE_THUMB;
+        } else {
+            info->print_insn = print_insn_arm;
+            cap_mode = CS_MODE_ARM;
+        }
+        if (arm_feature(env, ARM_FEATURE_V8)) {
+            cap_mode |= CS_MODE_V8;
+        }
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            cap_mode |= CS_MODE_MCLASS;
+        }
+        info->cap_arch = CS_ARCH_ARM;
+        info->cap_mode = cap_mode;
     }
     if (bswap_code(arm_sctlr_b(env))) {
 #ifdef TARGET_WORDS_BIGENDIAN
-- 
2.13.5

