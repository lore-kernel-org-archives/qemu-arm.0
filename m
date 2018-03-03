Received: by 10.28.91.67 with SMTP id p64csp727815wmb;
        Sat, 3 Mar 2018 06:39:09 -0800 (PST)
X-Google-Smtp-Source: AG47ELtyFMQLF41QC4ksheuvhFYPsEtT1QUzrPoYUpD1a3G0HoCdCChm2Jm/aJTDu50SnyiWYxXO
X-Received: by 2002:a25:b98e:: with SMTP id r14-v6mr5679001ybg.173.1520087949577;
        Sat, 03 Mar 2018 06:39:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520087949; cv=none;
        d=google.com; s=arc-20160816;
        b=QE7ZXRW0UXUJMvNdhLIlLZF4PrQZbpphVVve0SrU5HlRazgVbaf8hE7oC0H4FCVWKz
         eraaqY1R+RHCMXhRjJu/zVpuVMMaffK9AZknSt7IYZ+ISPsbaQi5YjdBFLre/wMA4URb
         ydQFix2986vUySMHN5/IYBLDoY84OOmYtrzCaiBUfDf3NrcQlh1VZjW425h/rLSCEsg2
         DWKGMxUx+gcog7vJ2I1g1MWedLC4reR0JoqyxyYAeS6s3ARIRbijNH4O6lKASde32nQN
         3cNGNPavyqXCEX1b0gNMvC24tTZWBz5Z9LDSxRKTwrKuCZwDH8eVflKD9O67gzRid+cf
         ZiqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=+Vj7X9N/jUoXPPsO2JGGW6uWttdT7RWcuS4uatHjfYM=;
        b=riHZkEWvmd9W34X1mWjRVf1vs8QYoqhEODKP6pj4huigwx9ozoBcdu18FZhybXcKCa
         3GF1wdIo7ZPs0Yltq23PMFC6ObfnfgDTeoEgiM48dhsDKP2gJmqLFxmyJZ7CIKKcJVkI
         IoTCXemT1qxvCK70kIeL2fv0RuzKnIQKiavX0ybDcOAwu0pu1gdShDU10+Y/pnmLPGsJ
         6F6lXaXsjMAEVdmW+Cw8WrrVBfEO7qzda0fvpJI7i1wrhIUijQlnQ7MXI44mXDIEsFGi
         sCkTdzKWoxupIrzcoc8uM2uTLkPnIKYSeaZD6O2RAA7eYi5zvctAHnRFQKAGk02DysL1
         OUZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ezvVhIMX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w133si1478359ywg.297.2018.03.03.06.39.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Mar 2018 06:39:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ezvVhIMX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40485 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1es8JY-0006FT-TW
	for alex.bennee@linaro.org; Sat, 03 Mar 2018 09:39:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1es8J0-00066M-6w
	for qemu-devel@nongnu.org; Sat, 03 Mar 2018 09:38:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1es8Iz-0003wE-2j
	for qemu-devel@nongnu.org; Sat, 03 Mar 2018 09:38:34 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:36959)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1es8Iy-0003vg-Qa
	for qemu-devel@nongnu.org; Sat, 03 Mar 2018 09:38:33 -0500
Received: by mail-wr0-x244.google.com with SMTP id z12so12883081wrg.4
	for <qemu-devel@nongnu.org>; Sat, 03 Mar 2018 06:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+Vj7X9N/jUoXPPsO2JGGW6uWttdT7RWcuS4uatHjfYM=;
	b=ezvVhIMXtmH1IT+E/IgGYu+komRZnrrSb13A7dRjBb833pyA+QExD7qZZd7cl8lmrk
	7Ffqr0wiwBAwXdlT76lBNGhpC70dM0GhbkgutylmTyiAhJ5/jo7wg2mtyUCKaA/oFT8E
	QRvdX4I5r/zGM/DqzD9+mGSyJDXoHBUS1HsYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+Vj7X9N/jUoXPPsO2JGGW6uWttdT7RWcuS4uatHjfYM=;
	b=OlB3KeSQ1HOh+XVP+/PmAK9sFefXqt8bdMl1DPhNjpO0SPJKZ08wuPsTIadt2K01wi
	WeOsXV1Hqi8tlXWQ16NB3pDWptOr0LODQyVHmm7RP1eZ4kwWvxoDt7ALDITE17a/wSC3
	XY+97LJTJw1xm9k4ITPl/75lmcpwyPj3TYlowAkTouNc7PIHrNyrfoozA8SGGnhoopf7
	9Q4zFrpTnLdP0I6CAlB3fd7/XYmOkXGdIM5P2AZ9GtjOhfpKrUenF0B47E2GrANy8kLG
	/EF3RW7EdSu0MWqG9oxQ62sF1P+NeZpRwErqtQ8l14Tg6epYZF93ocRuiv0ZmiCXY4f4
	OuAg==
X-Gm-Message-State: APf1xPAvtGdRC0MFQHsCBrQJWUlR/YDCdQS5B+kQcUAFBPMwRYSA9saP
	GsNDAK3X8GIte2diFVDq6V6bZWh92c4=
X-Received: by 10.223.199.69 with SMTP id b5mr8577823wrh.212.1520087911509;
	Sat, 03 Mar 2018 06:38:31 -0800 (PST)
Received: from cloudburst.twiddle.net ([37.205.61.206])
	by smtp.gmail.com with ESMTPSA id 4sm2732686wmz.31.2018.03.03.06.38.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 03 Mar 2018 06:38:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  3 Mar 2018 14:38:21 +0000
Message-Id: <20180303143823.27055-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180303143823.27055-1-richard.henderson@linaro.org>
References: <20180303143823.27055-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: [Qemu-devel] [PATCH v4 3/5] aarch64-linux-user: Remove struct
 target_aux_context
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
X-TUID: 4v0tBC3ZhHbf

This changes the qemu signal frame layout to be more like the kernel's,
in that the various records are dynamically allocated rather than fixed
in place by a structure.

For now, all of the allocation is out of uc.tuc_mcontext.__reserved,
so the allocation is actually trivial.  That will change with SVE support.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/signal.c | 89 ++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 61 insertions(+), 28 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 25c9743aed..f9eef3d753 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1443,20 +1443,12 @@ struct target_fpsimd_context {
     uint64_t vregs[32 * 2]; /* really uint128_t vregs[32] */
 };
 
-/*
- * Auxiliary context saved in the sigcontext.__reserved array. Not exported to
- * user space as it will change with the addition of new context. User space
- * should check the magic/size information.
- */
-struct target_aux_context {
-    struct target_fpsimd_context fpsimd;
-    /* additional context to be added before "end" */
-    struct target_aarch64_ctx end;
-};
-
 struct target_rt_sigframe {
     struct target_siginfo info;
     struct target_ucontext uc;
+};
+
+struct target_rt_frame_record {
     uint64_t fp;
     uint64_t lr;
     uint32_t tramp[2];
@@ -1562,20 +1554,47 @@ static void target_restore_fpsimd_record(CPUARMState *env,
 static int target_restore_sigframe(CPUARMState *env,
                                    struct target_rt_sigframe *sf)
 {
-    struct target_aux_context *aux
-        = (struct target_aux_context *)sf->uc.tuc_mcontext.__reserved;
-    uint32_t magic, size;
+    struct target_aarch64_ctx *ctx;
+    struct target_fpsimd_context *fpsimd = NULL;
 
     target_restore_general_frame(env, sf);
 
-    __get_user(magic, &aux->fpsimd.head.magic);
-    __get_user(size, &aux->fpsimd.head.size);
-    if (magic == TARGET_FPSIMD_MAGIC
-        && size == sizeof(struct target_fpsimd_context)) {
-        target_restore_fpsimd_record(env, &aux->fpsimd);
-    } else {
+    ctx = (struct target_aarch64_ctx *)sf->uc.tuc_mcontext.__reserved;
+    while (ctx) {
+        uint32_t magic, size;
+
+        __get_user(magic, &ctx->magic);
+        __get_user(size, &ctx->size);
+        switch (magic) {
+        case 0:
+            if (size != 0) {
+                return 1;
+            }
+            ctx = NULL;
+            continue;
+
+        case TARGET_FPSIMD_MAGIC:
+            if (fpsimd || size != sizeof(struct target_fpsimd_context)) {
+                return 1;
+            }
+            fpsimd = (struct target_fpsimd_context *)ctx;
+            break;
+
+        default:
+            /* Unknown record -- we certainly didn't generate it.
+             * Did we in fact get out of sync?
+             */
+            return 1;
+        }
+        ctx = (void *)ctx + size;
+    }
+
+    /* Require FPSIMD always.  */
+    if (!fpsimd) {
         return 1;
     }
+    target_restore_fpsimd_record(env, fpsimd);
+
     return 0;
 }
 
@@ -1601,20 +1620,33 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
                                target_siginfo_t *info, target_sigset_t *set,
                                CPUARMState *env)
 {
+    int size = offsetof(struct target_rt_sigframe, uc.tuc_mcontext.__reserved);
+    int fpsimd_ofs, end1_ofs, fr_ofs;
     struct target_rt_sigframe *frame;
-    struct target_aux_context *aux;
+    struct target_rt_frame_record *fr;
     abi_ulong frame_addr, return_addr;
 
+    fpsimd_ofs = size;
+    size += sizeof(struct target_fpsimd_context);
+    end1_ofs = size;
+    size += sizeof(struct target_aarch64_ctx);
+    fr_ofs = size;
+    size += sizeof(struct target_rt_frame_record);
+
     frame_addr = get_sigframe(ka, env);
     trace_user_setup_frame(env, frame_addr);
     if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
         goto give_sigsegv;
     }
-    aux = (struct target_aux_context *)frame->uc.tuc_mcontext.__reserved;
 
     target_setup_general_frame(frame, env, set);
-    target_setup_fpsimd_record(&aux->fpsimd, env);
-    target_setup_end_record(&aux->end);
+    target_setup_fpsimd_record((void *)frame + fpsimd_ofs, env);
+    target_setup_end_record((void *)frame + end1_ofs);
+
+    /* Set up the stack frame for unwinding.  */
+    fr = (void *)frame + fr_ofs;
+    __put_user(env->xregs[29], &fr->fp);
+    __put_user(env->xregs[30], &fr->lr);
 
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         return_addr = ka->sa_restorer;
@@ -1624,13 +1656,14 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
          * Since these are instructions they need to be put as little-endian
          * regardless of target default or current CPU endianness.
          */
-        __put_user_e(0xd2801168, &frame->tramp[0], le);
-        __put_user_e(0xd4000001, &frame->tramp[1], le);
-        return_addr = frame_addr + offsetof(struct target_rt_sigframe, tramp);
+        __put_user_e(0xd2801168, &fr->tramp[0], le);
+        __put_user_e(0xd4000001, &fr->tramp[1], le);
+        return_addr = frame_addr + fr_ofs
+            + offsetof(struct target_rt_frame_record, tramp);
     }
     env->xregs[0] = usig;
     env->xregs[31] = frame_addr;
-    env->xregs[29] = env->xregs[31] + offsetof(struct target_rt_sigframe, fp);
+    env->xregs[29] = frame_addr + fr_ofs;
     env->pc = ka->_sa_handler;
     env->xregs[30] = return_addr;
     if (info) {
-- 
2.14.3

