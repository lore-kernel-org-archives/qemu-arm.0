Received: by 10.28.91.67 with SMTP id p64csp728962wmb;
        Sat, 3 Mar 2018 06:40:49 -0800 (PST)
X-Google-Smtp-Source: AG47ELsxL5SOT5e1C96znr0Dlcx8tbCijFDS98Z+/wouGWKX7GXuTtaLYsgxfaBmdh8Tx8UCJZuM
X-Received: by 2002:a25:c6c7:: with SMTP id k190-v6mr2918940ybf.72.1520088049836;
        Sat, 03 Mar 2018 06:40:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520088049; cv=none;
        d=google.com; s=arc-20160816;
        b=P0L6mrtYsYdZ9SLdTRz/X9+LlodS+4X2KlylnHcvFzbWBJ/9t7IsrkMAzDODh5LBA7
         EAumoTQTKrArswtMPlrJfTpOjb0nDiiWIninFtEt7YurUU0ii1bieovxmh1B/jOils5H
         fnuJfVlM1vjrBGHOOCz+LazRYJMzj9qY8a4BznnXl0VL0qrnOLiJe2WvZijDzPt3JQvs
         nntxT5kz4wuu8i+5ixs5qaiw8+cKiPBMH+tsTHtiknYbyPlkkyHlW5ca35KLmKIRJPTV
         nS/ILOTA59nYfDWS71ASQLNUPHM/IbiuiV3qrnNutBddjOjgT1dL9qUBoyjTeelDRlwa
         KCvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=yojH82SiclSUcrsErdin1q/7h8rIc7kPmraRciKlO2w=;
        b=w3OCPFhO946H+8LJqWl2I0WmpESD6MqZ0YHpGujmnD/H+SsQ2Xrt+YgpJgwqMm6P4o
         IxeVyLC3Eed+dz8L3amZ0VSSx7tpoavK/vwUh5BJVkRQkjggCxeLJMDDljhj9cbJM7vw
         fghLHvBSf6dlSHiBDy+PF3zxZsHQMATAnhFDYKRLwj8VNQUtR6o6Hj/fFA54Sq7S6mTz
         57EcS90JbxRVDHSPXVk+mu8u4p04Sxv7s4umjGU+r66smO/bLgiaIAyrAJAG+qiHxADk
         4KZPsk6wBibxE5YdTvr80JguTA2/+S6jh3tOVa1QqSA15L1Ah/urMpfuC722ffcE9bKy
         T7ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YMEvrcNE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h125-v6si952774ybg.804.2018.03.03.06.40.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Mar 2018 06:40:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YMEvrcNE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1es8LB-0007QV-6n
	for alex.bennee@linaro.org; Sat, 03 Mar 2018 09:40:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1es8Iz-00064U-Ca
	for qemu-devel@nongnu.org; Sat, 03 Mar 2018 09:38:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1es8Ix-0003va-T2
	for qemu-devel@nongnu.org; Sat, 03 Mar 2018 09:38:33 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:45854)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1es8Ix-0003vL-JP
	for qemu-devel@nongnu.org; Sat, 03 Mar 2018 09:38:31 -0500
Received: by mail-wr0-x243.google.com with SMTP id p104so12863396wrc.12
	for <qemu-devel@nongnu.org>; Sat, 03 Mar 2018 06:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yojH82SiclSUcrsErdin1q/7h8rIc7kPmraRciKlO2w=;
	b=YMEvrcNE3lRH+shk1ss57tsXNmkuuioJGzk3OAd1kNVOP7G6Eh5Rk+YkmuB2bXCKzL
	2l2B7rRbFSf6dfDZCiqLVJaF2i8XSGawb2hLafEMl/w1sdIt230w1y5u0Eov/JPDlTjr
	nv8TpEGOJeiPtqnlUh6OeIYdj2TaL9IL+VJ0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yojH82SiclSUcrsErdin1q/7h8rIc7kPmraRciKlO2w=;
	b=qp/niPAD+l8w09qit5D5Ixd30Xn57PJ/j3nnDcdQia4vlq3XX3UlpKA7CosJAuoueq
	2fJnSzFLWu28ARlBoPRzNKf22EJjHZpK6v+F+4z/FrEmnGTENRjyPYth8xY3rrF509KA
	+4/LkPZD69fK0SrlcbbA5a7qTwEY0OknIy+CWUAihitTI2n5/mFZLyFvcHczg6DNTwhJ
	/k9tjfrRZuPmNMRNYAIwtWqa5jPhyuja14NnwXCe/DU+UuAYCIbqPcrQgA4xIlJxVnUJ
	WG4wqihoub73RzELSHqwcdiVxucSAZqsDcCWQF7WAj7o/N5/7mkt1TeUHQzwcRETJYf7
	j+EA==
X-Gm-Message-State: APf1xPC1aJqoFWj8gfbTrGCv47jGIuvEI66PiDpFzZnaKOO0wV5WNAQN
	nL9ApEpxwIqFlUvcv/MmiiwdqfEFc24=
X-Received: by 10.223.175.230 with SMTP id y38mr7765856wrd.26.1520087910286;
	Sat, 03 Mar 2018 06:38:30 -0800 (PST)
Received: from cloudburst.twiddle.net ([37.205.61.206])
	by smtp.gmail.com with ESMTPSA id 4sm2732686wmz.31.2018.03.03.06.38.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 03 Mar 2018 06:38:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  3 Mar 2018 14:38:20 +0000
Message-Id: <20180303143823.27055-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180303143823.27055-1-richard.henderson@linaro.org>
References: <20180303143823.27055-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: [Qemu-devel] [PATCH v4 2/5] aarch64-linux-user: Split out helpers
 for guest signal handling
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
X-TUID: n/4tJIIjZv4A

Split out helpers from target_setup_frame and target_restore_sigframe
for dealing with general registers, fpsimd registers, and the end record.

When we add support for sve registers, the relative positions of
these will change.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/signal.c | 120 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 69 insertions(+), 51 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 9a380b9e31..25c9743aed 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1462,16 +1462,17 @@ struct target_rt_sigframe {
     uint32_t tramp[2];
 };
 
-static int target_setup_sigframe(struct target_rt_sigframe *sf,
-                                 CPUARMState *env, target_sigset_t *set)
+static void target_setup_general_frame(struct target_rt_sigframe *sf,
+                                       CPUARMState *env, target_sigset_t *set)
 {
     int i;
-    struct target_aux_context *aux =
-        (struct target_aux_context *)sf->uc.tuc_mcontext.__reserved;
 
-    /* set up the stack frame for unwinding */
-    __put_user(env->xregs[29], &sf->fp);
-    __put_user(env->xregs[30], &sf->lr);
+    __put_user(0, &sf->uc.tuc_flags);
+    __put_user(0, &sf->uc.tuc_link);
+
+    __put_user(target_sigaltstack_used.ss_sp, &sf->uc.tuc_stack.ss_sp);
+    __put_user(sas_ss_flags(env->xregs[31]), &sf->uc.tuc_stack.ss_flags);
+    __put_user(target_sigaltstack_used.ss_size, &sf->uc.tuc_stack.ss_size);
 
     for (i = 0; i < 31; i++) {
         __put_user(env->xregs[i], &sf->uc.tuc_mcontext.regs[i]);
@@ -1485,39 +1486,42 @@ static int target_setup_sigframe(struct target_rt_sigframe *sf,
     for (i = 0; i < TARGET_NSIG_WORDS; i++) {
         __put_user(set->sig[i], &sf->uc.tuc_sigmask.sig[i]);
     }
+}
+
+static void target_setup_fpsimd_record(struct target_fpsimd_context *fpsimd,
+                                       CPUARMState *env)
+{
+    int i;
+
+    __put_user(TARGET_FPSIMD_MAGIC, &fpsimd->head.magic);
+    __put_user(sizeof(struct target_fpsimd_context), &fpsimd->head.size);
+    __put_user(vfp_get_fpsr(env), &fpsimd->fpsr);
+    __put_user(vfp_get_fpcr(env), &fpsimd->fpcr);
 
     for (i = 0; i < 32; i++) {
         uint64_t *q = aa64_vfp_qreg(env, i);
 #ifdef TARGET_WORDS_BIGENDIAN
-        __put_user(q[0], &aux->fpsimd.vregs[i * 2 + 1]);
-        __put_user(q[1], &aux->fpsimd.vregs[i * 2]);
+        __put_user(q[0], &fpsimd->vregs[i * 2 + 1]);
+        __put_user(q[1], &fpsimd->vregs[i * 2]);
 #else
-        __put_user(q[0], &aux->fpsimd.vregs[i * 2]);
-        __put_user(q[1], &aux->fpsimd.vregs[i * 2 + 1]);
+        __put_user(q[0], &fpsimd->vregs[i * 2]);
+        __put_user(q[1], &fpsimd->vregs[i * 2 + 1]);
 #endif
     }
-    __put_user(vfp_get_fpsr(env), &aux->fpsimd.fpsr);
-    __put_user(vfp_get_fpcr(env), &aux->fpsimd.fpcr);
-    __put_user(TARGET_FPSIMD_MAGIC, &aux->fpsimd.head.magic);
-    __put_user(sizeof(struct target_fpsimd_context),
-            &aux->fpsimd.head.size);
-
-    /* set the "end" magic */
-    __put_user(0, &aux->end.magic);
-    __put_user(0, &aux->end.size);
-
-    return 0;
 }
 
-static int target_restore_sigframe(CPUARMState *env,
-                                   struct target_rt_sigframe *sf)
+static void target_setup_end_record(struct target_aarch64_ctx *end)
+{
+    __put_user(0, &end->magic);
+    __put_user(0, &end->size);
+}
+
+static void target_restore_general_frame(CPUARMState *env,
+                                         struct target_rt_sigframe *sf)
 {
     sigset_t set;
-    int i;
-    struct target_aux_context *aux =
-        (struct target_aux_context *)sf->uc.tuc_mcontext.__reserved;
-    uint32_t magic, size, fpsr, fpcr;
     uint64_t pstate;
+    int i;
 
     target_to_host_sigset(&set, &sf->uc.tuc_sigmask);
     set_sigmask(&set);
@@ -1530,30 +1534,48 @@ static int target_restore_sigframe(CPUARMState *env,
     __get_user(env->pc, &sf->uc.tuc_mcontext.pc);
     __get_user(pstate, &sf->uc.tuc_mcontext.pstate);
     pstate_write(env, pstate);
+}
 
-    __get_user(magic, &aux->fpsimd.head.magic);
-    __get_user(size, &aux->fpsimd.head.size);
+static void target_restore_fpsimd_record(CPUARMState *env,
+                                         struct target_fpsimd_context *fpsimd)
+{
+    uint32_t fpsr, fpcr;
+    int i;
 
-    if (magic != TARGET_FPSIMD_MAGIC
-        || size != sizeof(struct target_fpsimd_context)) {
-        return 1;
-    }
+    __get_user(fpsr, &fpsimd->fpsr);
+    vfp_set_fpsr(env, fpsr);
+    __get_user(fpcr, &fpsimd->fpcr);
+    vfp_set_fpcr(env, fpcr);
 
     for (i = 0; i < 32; i++) {
         uint64_t *q = aa64_vfp_qreg(env, i);
 #ifdef TARGET_WORDS_BIGENDIAN
-        __get_user(q[0], &aux->fpsimd.vregs[i * 2 + 1]);
-        __get_user(q[1], &aux->fpsimd.vregs[i * 2]);
+        __get_user(q[0], &fpsimd->vregs[i * 2 + 1]);
+        __get_user(q[1], &fpsimd->vregs[i * 2]);
 #else
-        __get_user(q[0], &aux->fpsimd.vregs[i * 2]);
-        __get_user(q[1], &aux->fpsimd.vregs[i * 2 + 1]);
+        __get_user(q[0], &fpsimd->vregs[i * 2]);
+        __get_user(q[1], &fpsimd->vregs[i * 2 + 1]);
 #endif
     }
-    __get_user(fpsr, &aux->fpsimd.fpsr);
-    vfp_set_fpsr(env, fpsr);
-    __get_user(fpcr, &aux->fpsimd.fpcr);
-    vfp_set_fpcr(env, fpcr);
+}
 
+static int target_restore_sigframe(CPUARMState *env,
+                                   struct target_rt_sigframe *sf)
+{
+    struct target_aux_context *aux
+        = (struct target_aux_context *)sf->uc.tuc_mcontext.__reserved;
+    uint32_t magic, size;
+
+    target_restore_general_frame(env, sf);
+
+    __get_user(magic, &aux->fpsimd.head.magic);
+    __get_user(size, &aux->fpsimd.head.size);
+    if (magic == TARGET_FPSIMD_MAGIC
+        && size == sizeof(struct target_fpsimd_context)) {
+        target_restore_fpsimd_record(env, &aux->fpsimd);
+    } else {
+        return 1;
+    }
     return 0;
 }
 
@@ -1580,6 +1602,7 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
                                CPUARMState *env)
 {
     struct target_rt_sigframe *frame;
+    struct target_aux_context *aux;
     abi_ulong frame_addr, return_addr;
 
     frame_addr = get_sigframe(ka, env);
@@ -1587,17 +1610,12 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
     if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
         goto give_sigsegv;
     }
+    aux = (struct target_aux_context *)frame->uc.tuc_mcontext.__reserved;
 
-    __put_user(0, &frame->uc.tuc_flags);
-    __put_user(0, &frame->uc.tuc_link);
+    target_setup_general_frame(frame, env, set);
+    target_setup_fpsimd_record(&aux->fpsimd, env);
+    target_setup_end_record(&aux->end);
 
-    __put_user(target_sigaltstack_used.ss_sp,
-                      &frame->uc.tuc_stack.ss_sp);
-    __put_user(sas_ss_flags(env->xregs[31]),
-                      &frame->uc.tuc_stack.ss_flags);
-    __put_user(target_sigaltstack_used.ss_size,
-                      &frame->uc.tuc_stack.ss_size);
-    target_setup_sigframe(frame, env, set);
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         return_addr = ka->sa_restorer;
     } else {
-- 
2.14.3

