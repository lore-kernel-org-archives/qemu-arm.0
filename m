Received: by 10.25.150.194 with SMTP id y185csp328628lfd;
        Wed, 16 Nov 2016 12:43:47 -0800 (PST)
X-Received: by 10.237.38.226 with SMTP id q89mr3579556qtd.153.1479329026947;
        Wed, 16 Nov 2016 12:43:46 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g34si14371506qtc.112.2016.11.16.12.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Nov 2016 12:43:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c773Z-0001Dw-Ih
	for alex.bennee@linaro.org; Wed, 16 Nov 2016 15:43:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1c76R9-0002Ti-2w
	for qemu-devel@nongnu.org; Wed, 16 Nov 2016 15:04:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1c76R5-0002Wn-Ta
	for qemu-devel@nongnu.org; Wed, 16 Nov 2016 15:04:03 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:35089)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1c76R5-0002WK-Mq; Wed, 16 Nov 2016 15:03:59 -0500
Received: by mail-wm0-x242.google.com with SMTP id a20so14677152wme.2;
	Wed, 16 Nov 2016 12:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Z50Eid9076JcM3SbdgOcnoECjkdAjvKMvcIYjeLtky8=;
	b=VItGMDZDboojStOZlT1zaYaMc7XIe0uVeqYoAnPAIqUtWrfMcfyNZYT/S8pWkiu29E
	TsQG7nh6pIcb2IrTAt7kRkQvNYTeux1+tBCV1PIJF9WSsHo+zPFBst0yY5mBX/W6ITs+
	wVGWkq/+VUdpupWSKDp66M7+7Rn5+JE/YsDq8BArJwWQoAx3SbsQXTR3TbtVHfIC1vsZ
	NpluV9hzcxQPKOd81emj+98yIT5QLyvG4xoq4o06kmxiEC5LUU0Ya+ym7oJR2XZcNP3Z
	oqdzT8NA7aGdIAZEB98zdkRa5i8KQBdBZyKIdtQPvozmaympJf954p/5N5PDPG3bhQ6Z
	0wMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=Z50Eid9076JcM3SbdgOcnoECjkdAjvKMvcIYjeLtky8=;
	b=NY3bKTtvY0J6sRj2uJ/On/JqdSq/Rt9w+EoI3ayjdBm66hsLQhNjDPrWqv4Kb6sIY0
	zAd6IFG9xok/crCT1M642B0trUDJ3XxLHHCmjTlWfb16BkYPri7AN3QVH+OItmxJNxxD
	U8P+0cQa1gDEZsObvYsPN8uWgI7YrXciZbSxL1e7aiSPcGPDxxh1LqDDh7xhYIKQJFe2
	dpUnpNbNaxTGXvdDZhUTz/Crl9PF+AV5fFjkcSWTnso/C/paK7ZtqZeHPXwU1wejOMS0
	VNkLVyU2vynd2oHKVRvFiS3u9hy3SCj3p3MiVD7isZ12Q6IfLUKDqS/8V3BJSntG3Kka
	hmwA==
X-Gm-Message-State: ABUngvdnmGyzypcZqTyCjAqDMaC7KfR5iWtWSo0vnv7BQ+ZMFGIaU3x20mOTypz5CvWAmQ==
X-Received: by 10.28.193.199 with SMTP id r190mr11713172wmf.58.1479326638210; 
	Wed, 16 Nov 2016 12:03:58 -0800 (PST)
Received: from bigtime.twiddle.net ([87.111.149.139])
	by smtp.gmail.com with ESMTPSA id x188sm3292wmx.4.2016.11.16.12.03.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Nov 2016 12:03:57 -0800 (PST)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Wed, 16 Nov 2016 21:03:32 +0100
Message-Id: <1479326625-10682-6-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479326625-10682-1-git-send-email-rth@twiddle.net>
References: <1479326625-10682-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: [Qemu-devel] [patch v3 05/18] tcg/arm: Move isa detection to
 tcg-target.h
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
X-TUID: d/1yZ3iN/rU/

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 tcg/arm/tcg-target.h     | 36 ++++++++++++++++++++++++++++++++----
 tcg/arm/tcg-target.inc.c | 41 +----------------------------------------
 2 files changed, 33 insertions(+), 44 deletions(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 8e724be..d1fe12b 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -26,6 +26,37 @@
 #ifndef ARM_TCG_TARGET_H
 #define ARM_TCG_TARGET_H
 
+/* The __ARM_ARCH define is provided by gcc 4.8.  Construct it otherwise.  */
+#ifndef __ARM_ARCH
+# if defined(__ARM_ARCH_7__) || defined(__ARM_ARCH_7A__) \
+     || defined(__ARM_ARCH_7R__) || defined(__ARM_ARCH_7M__) \
+     || defined(__ARM_ARCH_7EM__)
+#  define __ARM_ARCH 7
+# elif defined(__ARM_ARCH_6__) || defined(__ARM_ARCH_6J__) \
+       || defined(__ARM_ARCH_6Z__) || defined(__ARM_ARCH_6ZK__) \
+       || defined(__ARM_ARCH_6K__) || defined(__ARM_ARCH_6T2__)
+#  define __ARM_ARCH 6
+# elif defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5E__) \
+       || defined(__ARM_ARCH_5T__) || defined(__ARM_ARCH_5TE__) \
+       || defined(__ARM_ARCH_5TEJ__)
+#  define __ARM_ARCH 5
+# else
+#  define __ARM_ARCH 4
+# endif
+#endif
+
+extern int arm_arch;
+
+#if defined(__ARM_ARCH_5T__) \
+    || defined(__ARM_ARCH_5TE__) || defined(__ARM_ARCH_5TEJ__)
+# define use_armv5t_instructions 1
+#else
+# define use_armv5t_instructions use_armv6_instructions
+#endif
+
+#define use_armv6_instructions  (__ARM_ARCH >= 6 || arm_arch >= 6)
+#define use_armv7_instructions  (__ARM_ARCH >= 7 || arm_arch >= 7)
+
 #undef TCG_TARGET_STACK_GROWSUP
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
@@ -79,7 +110,7 @@ extern bool use_idiv_instructions;
 #define TCG_TARGET_HAS_eqv_i32          0
 #define TCG_TARGET_HAS_nand_i32         0
 #define TCG_TARGET_HAS_nor_i32          0
-#define TCG_TARGET_HAS_deposit_i32      1
+#define TCG_TARGET_HAS_deposit_i32      use_armv7_instructions
 #define TCG_TARGET_HAS_extract_i32      0
 #define TCG_TARGET_HAS_sextract_i32     0
 #define TCG_TARGET_HAS_movcond_i32      1
@@ -90,9 +121,6 @@ extern bool use_idiv_instructions;
 #define TCG_TARGET_HAS_div_i32          use_idiv_instructions
 #define TCG_TARGET_HAS_rem_i32          0
 
-extern bool tcg_target_deposit_valid(int ofs, int len);
-#define TCG_TARGET_deposit_i32_valid  tcg_target_deposit_valid
-
 enum {
     TCG_AREG0 = TCG_REG_R6,
 };
diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
index ffa0d40..1415c27 100644
--- a/tcg/arm/tcg-target.inc.c
+++ b/tcg/arm/tcg-target.inc.c
@@ -25,36 +25,7 @@
 #include "elf.h"
 #include "tcg-be-ldst.h"
 
-/* The __ARM_ARCH define is provided by gcc 4.8.  Construct it otherwise.  */
-#ifndef __ARM_ARCH
-# if defined(__ARM_ARCH_7__) || defined(__ARM_ARCH_7A__) \
-     || defined(__ARM_ARCH_7R__) || defined(__ARM_ARCH_7M__) \
-     || defined(__ARM_ARCH_7EM__)
-#  define __ARM_ARCH 7
-# elif defined(__ARM_ARCH_6__) || defined(__ARM_ARCH_6J__) \
-       || defined(__ARM_ARCH_6Z__) || defined(__ARM_ARCH_6ZK__) \
-       || defined(__ARM_ARCH_6K__) || defined(__ARM_ARCH_6T2__)
-#  define __ARM_ARCH 6
-# elif defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5E__) \
-       || defined(__ARM_ARCH_5T__) || defined(__ARM_ARCH_5TE__) \
-       || defined(__ARM_ARCH_5TEJ__)
-#  define __ARM_ARCH 5
-# else
-#  define __ARM_ARCH 4
-# endif
-#endif
-
-static int arm_arch = __ARM_ARCH;
-
-#if defined(__ARM_ARCH_5T__) \
-    || defined(__ARM_ARCH_5TE__) || defined(__ARM_ARCH_5TEJ__)
-# define use_armv5t_instructions 1
-#else
-# define use_armv5t_instructions use_armv6_instructions
-#endif
-
-#define use_armv6_instructions  (__ARM_ARCH >= 6 || arm_arch >= 6)
-#define use_armv7_instructions  (__ARM_ARCH >= 7 || arm_arch >= 7)
+int arm_arch = __ARM_ARCH;
 
 #ifndef use_idiv_instructions
 bool use_idiv_instructions;
@@ -730,16 +701,6 @@ static inline void tcg_out_bswap32(TCGContext *s, int cond, int rd, int rn)
     }
 }
 
-bool tcg_target_deposit_valid(int ofs, int len)
-{
-    /* ??? Without bfi, we could improve over generic code by combining
-       the right-shift from a non-zero ofs with the orr.  We do run into
-       problems when rd == rs, and the mask generated from ofs+len doesn't
-       fit into an immediate.  We would have to be careful not to pessimize
-       wrt the optimizations performed on the expanded code.  */
-    return use_armv7_instructions;
-}
-
 static inline void tcg_out_deposit(TCGContext *s, int cond, TCGReg rd,
                                    TCGArg a1, int ofs, int len, bool const_a1)
 {
-- 
2.7.4

