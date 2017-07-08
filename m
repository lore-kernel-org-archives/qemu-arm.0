Received: by 10.25.44.15 with SMTP id s15csp807241lfs;
        Fri, 7 Jul 2017 19:52:51 -0700 (PDT)
X-Received: by 10.200.43.208 with SMTP id n16mr27741404qtn.190.1499482371018;
        Fri, 07 Jul 2017 19:52:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499482371; cv=none;
        d=google.com; s=arc-20160816;
        b=Z0z+76Ti9booZT9Q2uoFJ/t+Eh2YYhaR4zv9KOaBhy4juJWUG/69ClzeHPI2wP0l+v
         61HLCj7lpZWfJpLknDsk8qbHdZlXu5R5bb4AxTrJUSGUJo9+5ON0Mit9uAunYhNVVCbB
         BZOsQpVn4UUcXuKztQJ7W27vaY8QMogDWRFFYzO9INNNEk0QpSp5KopL4F26eOMExluQ
         6y40baAp3y/5p9U7v+RiJefS0HeQwngyhztiduERiA35+Sp9NMz0DuSIBCPYZG6zbuTS
         Ep3wBOXuPpVmh1KSFpXkVnnvTraLDaiKYUiboGtubyL9Jq9UbbeEVoLNAUJYjxDJ7NhV
         oWKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=vK/P+XmBotxamGKAbyPmNTlVdfzn5UKNPl+nyZGjC6Q=;
        b=x1ZFDTHUH7a0S8ZBgwBe4jmS7xDpevd3rGu4tyja02AUiJpTVwvEMLUMCtUUdwV60p
         fYDoPQ0Gn6YciHy1D2L9DW1pSv4FoGOaAxiaGJbuxz3pYrEayArcVicLi1c2tv1RkZY3
         u+fEfctjIyO409auwbzLdchp7PD7iQzLPuYKNIzX1wqzm2tUOLcIRuXpXgJYP4sk/Yn6
         GiC5aPBiZ5dNSaqOPBejGVIXYJssaaQ2zsEUMw+kI9idDDKHA8+ExCbaHijRhB5wx/Ef
         w532gsqb6quRDsIEweL4+YN+Yjc0QLpX5BG6m4ldIJx/Qx8bW648EWu+HkQ+9u5c+hXL
         kvYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ZoQOfS2v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n4si4904262qte.232.2017.07.07.19.52.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Jul 2017 19:52:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ZoQOfS2v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59563 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTfrU-0002YB-9l
	for alex.bennee@linaro.org; Fri, 07 Jul 2017 22:52:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dTfpj-0001W3-U6
	for qemu-devel@nongnu.org; Fri, 07 Jul 2017 22:51:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dTfpi-00050b-PT
	for qemu-devel@nongnu.org; Fri, 07 Jul 2017 22:51:00 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33297)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dTfpi-00050M-Ki; Fri, 07 Jul 2017 22:50:58 -0400
Received: by mail-qk0-x243.google.com with SMTP id p21so6558521qke.0;
	Fri, 07 Jul 2017 19:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vK/P+XmBotxamGKAbyPmNTlVdfzn5UKNPl+nyZGjC6Q=;
	b=ZoQOfS2vK+BHjZHNTYl+OUbenUNnmHAO4m2MeuL0b1FnfmyYhnNVXM3D7AKUq6mVxh
	LcGld8B3/BIwG6cGkrS2IKHo9SD00Uav038zw6aKhPlpO+idgJyYtqlwOD+PMXHIdwRE
	fQwiwtG4FcYYS4anWDZoi/bzFVipPQozUwKgRYZpA7ylxavm8nfc2ucIafaxGe04O631
	SSqQIhf2FoxgK9X5d8rOgjmWioWKkwNbsMdq6arGEqotEgHiM0BMSzUtSo3e0p9e6sXj
	UHeFxf1ZRx2teQXYCoX3IKz6jbupRYvc2AU2O8jpb726YISaNm70jCti9yW1wXL8ozw9
	QGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=vK/P+XmBotxamGKAbyPmNTlVdfzn5UKNPl+nyZGjC6Q=;
	b=WWn2/f4EwTSyagihpHEB3E3OBhqJknUCdF08UDMfwq77zVxC6FEpkzLPq3a0STWB49
	YxAslfNzQZdDb1qtMH2H7AwncgUxR6MPH50IL2F6417bzjxwyybkcYgpA5lflx4eUeXn
	xrIEVQsJTjpc1Ct5PJDKDRpjQFJ2GANn7is60FQVWncL5MxKx+2paarHHsISDXI9NXtl
	06Kn7VhVxOPSBAVuIEXlzK/B9I4yjLZDDbCuFGp2hsV5DneqwffwjZlcIRjmV5EUf2xS
	4RASmoF1ZlLkLUFF2XghXqbGUUOVS2pz/gKdkFpy6ffqALR0jjz6l3Txy5n352sXFbAD
	I/sQ==
X-Gm-Message-State: AKS2vOx4VdXzxd38xhZNubAZNttHU4+asg9C1cJ5rDfK08CqE3FJZaYD
	hrjMF4oPhmC6/Psk3VI=
X-Received: by 10.55.1.65 with SMTP id 62mr65811070qkb.210.1499482257754;
	Fri, 07 Jul 2017 19:50:57 -0700 (PDT)
Received: from bigtime.twiddle.net.com (rrcs-66-91-136-156.west.biz.rr.com.
	[66.91.136.156]) by smtp.gmail.com with ESMTPSA id
	q90sm3793925qki.11.2017.07.07.19.50.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jul 2017 19:50:57 -0700 (PDT)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jul 2017 16:50:29 -1000
Message-Id: <20170708025030.15845-3-rth@twiddle.net>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170708025030.15845-1-rth@twiddle.net>
References: <20170708025030.15845-1-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH 2/3] linux-user: Tidy and enforce reserved_va
 initialization
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
Cc: aurelien@aurel32.net, riku.voipio@iki.fi, laurent@vivier.eu,
	qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T+erX9fL8LKn

We had a check using TARGET_VIRT_ADDR_SPACE_BITS to make sure
that the allocation coming in from the command-line option was
not too large, but that didn't include target-specific knowledge
about other restrictions on user-space.

Remove several target-specific hacks in linux-user/main.c.

For MIPS and Nios, we can replace them with proper adjustments
to the respective target's TARGET_VIRT_ADDR_SPACE_BITS definition.

For ARM, we had no existing ifdef but I suspect that the current
default value of 0xf7000000 was chosen with this in mind.  Define
a workable value in linux-user/arm/, and also document why the
special case is required.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 linux-user/arm/target_cpu.h |  4 ++++
 target/mips/mips-defs.h     |  6 +++++-
 target/nios2/cpu.h          |  6 +++++-
 linux-user/main.c           | 38 +++++++++++++++++++++++++-------------
 4 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/linux-user/arm/target_cpu.h b/linux-user/arm/target_cpu.h
index d888219..c4f79eb 100644
--- a/linux-user/arm/target_cpu.h
+++ b/linux-user/arm/target_cpu.h
@@ -19,6 +19,10 @@
 #ifndef ARM_TARGET_CPU_H
 #define ARM_TARGET_CPU_H
 
+/* We need to be able to map the commpage.
+   See validate_guest_space in linux-user/elfload.c.  */
+#define MAX_RESERVED_VA  0xfff00000ul
+
 static inline void cpu_clone_regs(CPUARMState *env, target_ulong newsp)
 {
     if (newsp) {
diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 047554e..d239069 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -15,7 +15,11 @@
 #else
 #define TARGET_LONG_BITS 32
 #define TARGET_PHYS_ADDR_SPACE_BITS 40
-#define TARGET_VIRT_ADDR_SPACE_BITS 32
+# ifdef CONFIG_USER_ONLY
+#  define TARGET_VIRT_ADDR_SPACE_BITS 31
+# else
+#  define TARGET_VIRT_ADDR_SPACE_BITS 32
+#endif
 #endif
 
 /* Masks used to mark instructions to indicate which ISA level they
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 13931f3..da3f637 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -227,7 +227,11 @@ qemu_irq *nios2_cpu_pic_init(Nios2CPU *cpu);
 void nios2_check_interrupts(CPUNios2State *env);
 
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
-#define TARGET_VIRT_ADDR_SPACE_BITS 32
+#ifdef CONFIG_USER_ONLY
+# define TARGET_VIRT_ADDR_SPACE_BITS 31
+#else
+# define TARGET_VIRT_ADDR_SPACE_BITS 32
+#endif
 
 #define cpu_init(cpu_model) CPU(cpu_nios2_init(cpu_model))
 
diff --git a/linux-user/main.c b/linux-user/main.c
index ad03c9e..e000533 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -60,23 +60,38 @@ do {                                                                    \
     }                                                                   \
 } while (0)
 
-#if (TARGET_LONG_BITS == 32) && (HOST_LONG_BITS == 64)
 /*
  * When running 32-on-64 we should make sure we can fit all of the possible
  * guest address space into a contiguous chunk of virtual host memory.
  *
  * This way we will never overlap with our own libraries or binaries or stack
  * or anything else that QEMU maps.
+ *
+ * Many cpus reserve the high bit (or more than one for some 64-bit cpus)
+ * of the address for the kernel.  Some cpus rely on this and user space
+ * uses the high bit(s) for pointer tagging and the like.  For them, we
+ * must preserve the expected address space.
  */
-# if defined(TARGET_MIPS) || defined(TARGET_NIOS2)
-/*
- * MIPS only supports 31 bits of virtual address space for user space.
- * Nios2 also only supports 31 bits.
- */
-unsigned long reserved_va = 0x77000000;
+#ifndef MAX_RESERVED_VA
+# if HOST_LONG_BITS > TARGET_VIRT_ADDR_SPACE_BITS
+#  if TARGET_VIRT_ADDR_SPACE_BITS == 32 && \
+      (TARGET_LONG_BITS == 32 || defined(TARGET_ABI32))
+/* There are a number of places where we assign reserved_va to a variable
+   of type abi_ulong and expect it to fit.  Avoid the last page.  */
+#   define MAX_RESERVED_VA  (0xfffffffful & TARGET_PAGE_MASK)
+#  else
+#   define MAX_RESERVED_VA  (1ul << TARGET_VIRT_ADDR_SPACE_BITS)
+#  endif
 # else
-unsigned long reserved_va = 0xf7000000;
+#  define MAX_RESERVED_VA  0
 # endif
+#endif
+
+/* That said, reserving *too* much vm space via mmap can run into problems
+   with rlimits, oom due to page table creation, etc.  We will still try it,
+   if directed by the command-line option, but not by default.  */
+#if HOST_LONG_BITS == 64 && TARGET_VIRT_ADDR_SPACE_BITS <= 32
+unsigned long reserved_va = MAX_RESERVED_VA;
 #else
 unsigned long reserved_va;
 #endif
@@ -3975,11 +3990,8 @@ static void handle_arg_reserved_va(const char *arg)
         unsigned long unshifted = reserved_va;
         p++;
         reserved_va <<= shift;
-        if (((reserved_va >> shift) != unshifted)
-#if HOST_LONG_BITS > TARGET_VIRT_ADDR_SPACE_BITS
-            || (reserved_va > (1ul << TARGET_VIRT_ADDR_SPACE_BITS))
-#endif
-            ) {
+        if (reserved_va >> shift != unshifted
+            || (MAX_RESERVED_VA && reserved_va > MAX_RESERVED_VA)) {
             fprintf(stderr, "Reserved virtual address too big\n");
             exit(EXIT_FAILURE);
         }
-- 
2.9.4

