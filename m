Received: by 10.223.172.38 with SMTP id v35csp5069796wrc;
        Tue, 19 Sep 2017 08:32:19 -0700 (PDT)
X-Received: by 10.55.221.217 with SMTP id u86mr2573130qku.64.1505835138959;
        Tue, 19 Sep 2017 08:32:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505835138; cv=none;
        d=google.com; s=arc-20160816;
        b=XBqC+2qLnutCPoXxe0PbUb2ARlWXk5DqKhKIRP0ASR2VNGD7WbVvFNl6+9GziAl4dk
         s6JHfJ3aQUldgof7t5fBuwNUmiQgRAjxm2uKB0K93brQZvmymyOAyFG3ie9HOBSjBlMA
         vQ28ngG0J1vLH//uL6Xf8n9Xf0jAmRRo34h8Dh9cykRtP+eXWzBk+rX8bJqTrLiDv2+Z
         CZhhYWWqfAwt2YoXQf+XvyqC390pGwwKVW/aPuKVeWsJjoklrKcXT57RcEcQboZ9Lhku
         qOKkj0G4IXiMBWIxlnGbltyBgziFb58/Q+Xh/+tbdNztG9RE4JxlPDWBMIJlqcJAyg90
         oq4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ho6Nr7OxqVnfQnw1KrdzKdigx/0D5Zw/N3pClcZNIz0=;
        b=gL7B4niij61ZWDCnKv36r4iTYzQYv6pJOgvQMK/37d3CaPXb/gceoHFLnaboAtj1C7
         frGKGUoBzuzT1eG4BVY8DrviqhDMf/ImE47MAL7riuYDG8I23Zb5cbsQ1HGXmvh5z5ow
         nd7neeI91yEAUGCXX2uPqY2a7T1aydUl6Nsg+XfdMqS5OwbMeIYFXVVHDDINSXcb72n6
         41cvb8K4ZAOdry7yi4Zy8bQY9gb23kCM1Hek19Fgbf89hrVOpdGh+hAhDCfx4q4Bsal6
         dfDJnjm5aMXj6vuoQ0J7Ts5EkA87c6yq5DalvjlfTvip7FPfZ1hvg+lI9+rk4B4KPPXs
         F6Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FeHrzFvu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i60si9573442qtd.471.2017.09.19.08.32.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 08:32:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FeHrzFvu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duKVU-0000Tv-JH
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 11:32:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duK3j-0008A9-LW
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 11:03:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duK3e-0003jt-SV
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 11:03:35 -0400
Received: from mail-io0-x231.google.com ([2607:f8b0:4001:c06::231]:52410)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1duK3e-0003j8-Oa
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 11:03:30 -0400
Received: by mail-io0-x231.google.com with SMTP id i197so715549ioe.9
	for <qemu-devel@nongnu.org>; Tue, 19 Sep 2017 08:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ho6Nr7OxqVnfQnw1KrdzKdigx/0D5Zw/N3pClcZNIz0=;
	b=FeHrzFvuXd7pN9zYjhHjqB9vl/y044igRlLhqHwhn1jhl3jJ7IDN8wP9omE1UHs8tQ
	F9xVkEl8mY3M/4/2QnHiBBxq6GKMTcQMk44b5B0vCXr31YJD/FYnjJ2CnZ69ixYPeDFx
	CaYSq8Br2Szc9cqqiknSxTtTOm6KyJJSECE9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ho6Nr7OxqVnfQnw1KrdzKdigx/0D5Zw/N3pClcZNIz0=;
	b=smqvsHFHWJMqa1/M+ghxT2QptPIZEdqL+a/LNA88DyC8D2mtUbauwsKetRh1aFQNrm
	cgqzC4Pn8APuA46WDYaLJHHSeiRvBe1y6XwUvHK+F+xJPtdRTIlwTFOOFD2F4Cxbne7Y
	a0PJjhKuFqvU6GfCbcn/mNt4g0jR9PkZuucRyR8MX4s/qaulaNdnVt5sbdsdP4vGAiDJ
	CuH15kWRk0haNO+P7F5XJgnNb2xGM0gEpB/7TpCvRUfRmS60eVohp531NSU0fFXIMhiA
	7WJtb5ylIibwfhDc8Rkgstdu0jFJtsf4REKsMmWOIbqsl4f8LdtsqbA8enzhSmUbsgho
	FSTg==
X-Gm-Message-State: AHPjjUhKapiYOg4QSFvxNBVZ/sYXFQW3VMJiqya7N+lcCIW7fPmgf1cX
	2y3ZrqT2xuIAHvjDvFUbjv208AUokFo=
X-Google-Smtp-Source: AOwi7QCYzLH2L01dWnZoO7ohYLh6yAlZ39KS5PKTHNS4WbEgZba3i14Zht7cs4zbnt+E7xI3w7bsnw==
X-Received: by 10.202.84.11 with SMTP id i11mr1711781oib.152.1505833409607;
	Tue, 19 Sep 2017 08:03:29 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162])
	by smtp.gmail.com with ESMTPSA id h63sm360621otb.59.2017.09.19.08.03.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Sep 2017 08:03:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 19 Sep 2017 10:03:11 -0500
Message-Id: <20170919150313.10833-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170919150313.10833-1-richard.henderson@linaro.org>
References: <20170919150313.10833-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::231
Subject: [Qemu-devel] [PATCH v2 6/8] arm: Support Capstone in disas_set_info
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
X-TUID: XwaPLLDhZ9rY

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas.c          |  3 +++
 target/arm/cpu.c | 21 ++++++++++++++++++---
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/disas.c b/disas.c
index 42fae735ee..ea295f9cfc 100644
--- a/disas.c
+++ b/disas.c
@@ -451,6 +451,7 @@ void disas(FILE *out, void *code, unsigned long size)
     print_insn = print_insn_ppc;
 #elif defined(__aarch64__) && defined(CONFIG_ARM_A64_DIS)
     print_insn = print_insn_arm_a64;
+    s.info.cap_arch = CS_ARCH_ARM64;
 #elif defined(__alpha__)
     print_insn = print_insn_alpha;
 #elif defined(__sparc__)
@@ -458,6 +459,8 @@ void disas(FILE *out, void *code, unsigned long size)
     s.info.mach = bfd_mach_sparc_v9b;
 #elif defined(__arm__)
     print_insn = print_insn_arm;
+    s.info.cap_arch = CS_ARCH_ARM;
+    /* TCG only generates code for arm mode.  */
 #elif defined(__MIPSEB__)
     print_insn = print_insn_big_mips;
 #elif defined(__MIPSEL__)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 412e94c7ad..53320709ac 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -33,6 +33,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/hw_accel.h"
 #include "kvm_arm.h"
+#include "disas/capstone.h"
 
 static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -482,10 +483,24 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
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

