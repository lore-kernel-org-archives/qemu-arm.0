Received: by 10.28.91.67 with SMTP id p64csp729860wmb;
        Sat, 3 Mar 2018 06:42:08 -0800 (PST)
X-Google-Smtp-Source: AG47ELtvDkDhohMeKN/3d5CwzynBYeA21e3KA/6UM54Y25r07aUgzbIglCvDusRkGi6xPmg6Z3/g
X-Received: by 10.13.243.3 with SMTP id c3mr5807952ywf.336.1520088128747;
        Sat, 03 Mar 2018 06:42:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520088128; cv=none;
        d=google.com; s=arc-20160816;
        b=jm+YtWb1/gNXWXgA3PJSm3iIGMlE6bQL6Ja5EybGL8Rjgq5dbcL85/+7T/u1P34b2W
         FxFHZtGJ6ZBdoM6ClCBZPLk01xCslftlM28EyZZC6wKBgnWNSLfln0yl+y7VDdgA6qUX
         7dKg5kQHwnA5KmHSD5e/ufmDrqjy4nkOOc0tkUrGi35diSNcotv2OkStIHZs7wOTIE9B
         I13uuVJjAgVTtT0FACQx5R2kVPVzx+xxjTyaJoa9jSB0y2EABnMXlVpTf7+ljh12IFa+
         nQCHlDiOi9ka46oMyhh1H1Ow4hIhn6sYI8grB2v/95CyxxH+41RfCNkVbSK7pl/cFq0R
         HqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=LnFbmuldPnDENQxOdtBF+tFSPotpLRSL/upgvG0UeKs=;
        b=dkMFD0flBA/GtWM5sP8gCu10wGBRysyI4ATBD/EuGTvH04fR7tCc4Nn/hl4gt0FQmK
         57glxanD2mYv66Nrjpd2V34C7xxiCpFdmoYFenA/Rc0cl+okX9bg9b9ubP9pcaBcywpY
         tkquwfsXq9Y26q3YuQmUYFTD+vrjRYomD4AKe0Xa/g1Q9kgsuUuHFYXBUKuW0E3vDhW9
         QKTrsbFnnkeZyvvjIabu49aLTScXImHdlHhNmkz+YaakQwFqiAomE5CdpRPRObEnfTe+
         G8JtGE26E9ySiaMqTytyCJ2F2iBNUlqkqZvbMSGk/tS3ES0mFFxx9P3GBr5fhswji+x/
         ot8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UbUD20KC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h1si1476251ywf.301.2018.03.03.06.42.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Mar 2018 06:42:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UbUD20KC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40509 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1es8MS-0000my-4v
	for alex.bennee@linaro.org; Sat, 03 Mar 2018 09:42:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1es8J3-0006Dy-2S
	for qemu-arm@nongnu.org; Sat, 03 Mar 2018 09:38:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1es8J1-0003xL-Dv
	for qemu-arm@nongnu.org; Sat, 03 Mar 2018 09:38:37 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:39216)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1es8J1-0003x2-4w
	for qemu-arm@nongnu.org; Sat, 03 Mar 2018 09:38:35 -0500
Received: by mail-wr0-x242.google.com with SMTP id w77so12879218wrc.6
	for <qemu-arm@nongnu.org>; Sat, 03 Mar 2018 06:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LnFbmuldPnDENQxOdtBF+tFSPotpLRSL/upgvG0UeKs=;
	b=UbUD20KChOGKXvw0kTzeUuB5tSmJ/mvzIN2NKH+3GOVEEisb/LnY8pRQCRicO2WWFh
	/jgd1QuUOhOVGNPHIbvj5mB9a3WGUvC1SUSWD1jaaVd1Ga9MxMxkOKrhS3k9jHDu6Lkb
	9MuUOKzha9Niv7uK30wAFz1Q10DGCyGlUDLIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LnFbmuldPnDENQxOdtBF+tFSPotpLRSL/upgvG0UeKs=;
	b=pIlos5+YxZlqM/cONmGgabsvBlNiZK7TRHtyfu2yGpilkLIPc6gy7fYvHGmxarYgaQ
	tMG1VQXH2HLIk3rSsTk4a77TAR7QYdvxE7aM21K5C8qf0hauWWjpJNr2xlTifk31s9TW
	X5ITDPpk7kvl3Pfkq5g1hP6mdUAg9DJqvlnxhgOt4rBMV8gtP8TFw4O/y9qRxlkO/+Hy
	hj+WO4WinaRDt8gHzUd5D0eyMdwj7Rp9wfZpehb9NzF7KMBvgnLEsRMJxWa8szZGNdpw
	E+UfN6xgmwdjADY4ePftdJp/LsW2iAF+EZBi8BzkkwZ4X406C/NTVEBLBx0WhGE756n8
	1tew==
X-Gm-Message-State: APf1xPBmzGOrgfLHt0dYXywk9Kcp3AbHkZN6nTT+HvwIqXegMBbiy1s4
	XK3Hr5HagSdqYqmAJRrdU9TbiNml0WY=
X-Received: by 10.223.150.148 with SMTP id u20mr7248045wrb.276.1520087913950; 
	Sat, 03 Mar 2018 06:38:33 -0800 (PST)
Received: from cloudburst.twiddle.net ([37.205.61.206])
	by smtp.gmail.com with ESMTPSA id 4sm2732686wmz.31.2018.03.03.06.38.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 03 Mar 2018 06:38:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  3 Mar 2018 14:38:23 +0000
Message-Id: <20180303143823.27055-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180303143823.27055-1-richard.henderson@linaro.org>
References: <20180303143823.27055-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: [Qemu-arm] [PATCH v4 5/5] aarch64-linux-user: Add support for SVE
 signal frame records
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YIaD3vO7V5WS

Depending on the currently selected size of the SVE vector registers,
we can either store the data within the "standard" allocation, or we
may beedn to allocate additional space with an EXTRA record.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/signal.c | 210 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 192 insertions(+), 18 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index c31cf0601d..92513f655c 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1452,6 +1452,34 @@ struct target_extra_context {
     uint32_t reserved[3];
 };
 
+#define TARGET_SVE_MAGIC    0x53564501
+
+struct target_sve_context {
+    struct target_aarch64_ctx head;
+    uint16_t vl;
+    uint16_t reserved[3];
+    /* The actual SVE data immediately follows.  It is layed out
+     * according to TARGET_SVE_SIG_{Z,P}REG_OFFSET, based off of
+     * the original struct pointer.
+     */
+};
+
+#define TARGET_SVE_VQ_BYTES  16
+
+#define TARGET_SVE_SIG_ZREG_SIZE(VQ)  ((VQ) * TARGET_SVE_VQ_BYTES)
+#define TARGET_SVE_SIG_PREG_SIZE(VQ)  ((VQ) * (TARGET_SVE_VQ_BYTES / 8))
+
+#define TARGET_SVE_SIG_REGS_OFFSET \
+    QEMU_ALIGN_UP(sizeof(struct target_sve_context), TARGET_SVE_VQ_BYTES)
+#define TARGET_SVE_SIG_ZREG_OFFSET(VQ, N) \
+    (TARGET_SVE_SIG_REGS_OFFSET + TARGET_SVE_SIG_ZREG_SIZE(VQ) * (N))
+#define TARGET_SVE_SIG_PREG_OFFSET(VQ, N) \
+    (TARGET_SVE_SIG_ZREG_OFFSET(VQ, 32) + TARGET_SVE_SIG_PREG_SIZE(VQ) * (N))
+#define TARGET_SVE_SIG_FFR_OFFSET(VQ) \
+    (TARGET_SVE_SIG_PREG_OFFSET(VQ, 16))
+#define TARGET_SVE_SIG_CONTEXT_SIZE(VQ) \
+    (TARGET_SVE_SIG_PREG_OFFSET(VQ, 17))
+
 struct target_rt_sigframe {
     struct target_siginfo info;
     struct target_ucontext uc;
@@ -1526,6 +1554,34 @@ static void target_setup_end_record(struct target_aarch64_ctx *end)
     __put_user(0, &end->size);
 }
 
+static void target_setup_sve_record(struct target_sve_context *sve,
+                                    CPUARMState *env, int vq, int size)
+{
+    int i, j;
+
+    __put_user(TARGET_SVE_MAGIC, &sve->head.magic);
+    __put_user(size, &sve->head.size);
+    __put_user(vq * TARGET_SVE_VQ_BYTES, &sve->vl);
+
+    /* Note that SVE regs are stored as a byte stream, with each byte element
+     * at a subsequent address.  This corresponds to a little-endian store
+     * of our 64-bit hunks.
+     */
+    for (i = 0; i < 32; ++i) {
+        uint64_t *z = (void *)sve + TARGET_SVE_SIG_ZREG_OFFSET(vq, i);
+        for (j = 0; j < vq * 2; ++j) {
+            __put_user_e(env->vfp.zregs[i].d[j], z + j, le);
+        }
+    }
+    for (i = 0; i <= 16; ++i) {
+        uint16_t *p = (void *)sve + TARGET_SVE_SIG_PREG_OFFSET(vq, i);
+        for (j = 0; j < vq; ++j) {
+            uint64_t r = env->vfp.pregs[i].p[j >> 2];
+            __put_user_e(r >> ((j & 3) * 16), p + j, le);
+        }
+    }
+}
+
 static void target_restore_general_frame(CPUARMState *env,
                                          struct target_rt_sigframe *sf)
 {
@@ -1569,14 +1625,45 @@ static void target_restore_fpsimd_record(CPUARMState *env,
     }
 }
 
+static void target_restore_sve_record(CPUARMState *env,
+                                      struct target_sve_context *sve, int vq)
+{
+    int i, j;
+
+    /* Note that SVE regs are stored as a byte stream, with each byte element
+     * at a subsequent address.  This corresponds to a little-endian load
+     * of our 64-bit hunks.
+     */
+    for (i = 0; i < 32; ++i) {
+        uint64_t *z = (void *)sve + TARGET_SVE_SIG_ZREG_OFFSET(vq, i);
+        for (j = 0; j < vq * 2; ++j) {
+            __get_user_e(env->vfp.zregs[i].d[j], z + j, le);
+        }
+    }
+    for (i = 0; i <= 16; ++i) {
+        uint16_t *p = (void *)sve + TARGET_SVE_SIG_PREG_OFFSET(vq, i);
+        for (j = 0; j < vq; ++j) {
+            uint16_t r;
+            __get_user_e(r, p + j, le);
+            if (j & 3) {
+                env->vfp.pregs[i].p[j >> 2] |= (uint64_t)r << ((j & 3) * 16);
+            } else {
+                env->vfp.pregs[i].p[j >> 2] = r;
+            }
+        }
+    }
+}
+
 static int target_restore_sigframe(CPUARMState *env,
                                    struct target_rt_sigframe *sf)
 {
     struct target_aarch64_ctx *ctx, *extra = NULL;
     struct target_fpsimd_context *fpsimd = NULL;
+    struct target_sve_context *sve = NULL;
     uint64_t extra_datap = 0;
     bool used_extra = false;
     bool err = false;
+    int vq = 0, sve_size = 0;
 
     target_restore_general_frame(env, sf);
 
@@ -1608,6 +1695,18 @@ static int target_restore_sigframe(CPUARMState *env,
             fpsimd = (struct target_fpsimd_context *)ctx;
             break;
 
+        case TARGET_SVE_MAGIC:
+            if (arm_feature(env, ARM_FEATURE_SVE)) {
+                vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+                sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
+                if (!sve && size == sve_size) {
+                    sve = (struct target_sve_context *)ctx;
+                    break;
+                }
+            }
+            err = true;
+            goto exit;
+
         case TARGET_EXTRA_MAGIC:
             if (extra || size != sizeof(struct target_extra_context)) {
                 err = true;
@@ -1637,12 +1736,18 @@ static int target_restore_sigframe(CPUARMState *env,
         err = true;
     }
 
+    /* SVE data, if present, overwrites FPSIMD data.  */
+    if (sve) {
+        target_restore_sve_record(env, sve, vq);
+    }
+
  exit:
     unlock_user(extra, extra_datap, 0);
     return err;
 }
 
-static abi_ulong get_sigframe(struct target_sigaction *ka, CPUARMState *env)
+static abi_ulong get_sigframe(struct target_sigaction *ka,
+                              CPUARMState *env, int size)
 {
     abi_ulong sp;
 
@@ -1655,30 +1760,97 @@ static abi_ulong get_sigframe(struct target_sigaction *ka, CPUARMState *env)
         sp = target_sigaltstack_used.ss_sp + target_sigaltstack_used.ss_size;
     }
 
-    sp = (sp - sizeof(struct target_rt_sigframe)) & ~15;
+    sp = (sp - size) & ~15;
 
     return sp;
 }
 
+typedef struct {
+    int total_size;
+    int extra_base;
+    int extra_size;
+    int std_end_ofs;
+    int extra_ofs;
+    int extra_end_ofs;
+} target_sigframe_layout;
+
+static int alloc_sigframe_space(int this_size, target_sigframe_layout *l)
+{
+    /* Make sure there will always be space for the end marker.  */
+    const int std_size = sizeof(struct target_rt_sigframe)
+                         - sizeof(struct target_aarch64_ctx);
+    int this_loc = l->total_size;
+
+    if (l->extra_base) {
+        /* Once we have begun an extra space, all allocations go there.  */
+        l->extra_size += this_size;
+    } else if (this_size + this_loc > std_size) {
+        /* This allocation does not fit in the standard space.  */
+        /* Allocate the extra record.  */
+        l->extra_ofs = this_loc;
+        l->total_size += sizeof(struct target_extra_context);
+
+        /* Allocate the standard end record.  */
+        l->std_end_ofs = l->total_size;
+        l->total_size += sizeof(struct target_aarch64_ctx);
+
+        /* Allocate the requested record.  */
+        l->extra_base = this_loc = l->total_size;
+        l->extra_size = this_size;
+    }
+    l->total_size += this_size;
+
+    return this_loc;
+}
+
 static void target_setup_frame(int usig, struct target_sigaction *ka,
                                target_siginfo_t *info, target_sigset_t *set,
                                CPUARMState *env)
 {
-    int size = offsetof(struct target_rt_sigframe, uc.tuc_mcontext.__reserved);
-    int fpsimd_ofs, end1_ofs, fr_ofs, end2_ofs = 0;
-    int extra_ofs = 0, extra_base = 0, extra_size = 0;
+    target_sigframe_layout layout = {
+        /* Begin with the size pointing to the reserved space.  */
+        .total_size = offsetof(struct target_rt_sigframe,
+                               uc.tuc_mcontext.__reserved),
+    };
+    int fpsimd_ofs, fr_ofs, sve_ofs = 0, vq = 0, sve_size = 0;
     struct target_rt_sigframe *frame;
     struct target_rt_frame_record *fr;
     abi_ulong frame_addr, return_addr;
 
-    fpsimd_ofs = size;
-    size += sizeof(struct target_fpsimd_context);
-    end1_ofs = size;
-    size += sizeof(struct target_aarch64_ctx);
-    fr_ofs = size;
-    size += sizeof(struct target_rt_frame_record);
+    /* FPSIMD record is always in the standard space.  */
+    fpsimd_ofs = alloc_sigframe_space(sizeof(struct target_fpsimd_context),
+                                      &layout);
 
-    frame_addr = get_sigframe(ka, env);
+    /* SVE state needs saving only if it exists.  */
+    if (arm_feature(env, ARM_FEATURE_SVE)) {
+        vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+        sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
+        sve_ofs = alloc_sigframe_space(sve_size, &layout);
+    }
+
+    if (layout.extra_ofs) {
+        /* Reserve space for the extra end marker.  The standard end marker
+         * will have been allocated when we allocated the extra record.
+         */
+        layout.extra_end_ofs
+            = alloc_sigframe_space(sizeof(struct target_aarch64_ctx), &layout);
+    } else {
+        /* Reserve space for the standard end marker.
+         * Do not use alloc_sigframe_space because we cheat
+         * std_size therein to reserve space for this.
+         */
+        layout.std_end_ofs = layout.total_size;
+        layout.total_size += sizeof(struct target_aarch64_ctx);
+    }
+
+    /* Reserve space for the return code.  On a real system this would
+     * be within the VDSO.  So, despite the name this is not a "real"
+     * record within the frame.
+     */
+    fr_ofs = layout.total_size;
+    layout.total_size += sizeof(struct target_rt_frame_record);
+
+    frame_addr = get_sigframe(ka, env, layout.total_size);
     trace_user_setup_frame(env, frame_addr);
     if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
         goto give_sigsegv;
@@ -1686,13 +1858,15 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
 
     target_setup_general_frame(frame, env, set);
     target_setup_fpsimd_record((void *)frame + fpsimd_ofs, env);
-    if (extra_ofs) {
-        target_setup_extra_record((void *)frame + extra_ofs,
-                                  frame_addr + extra_base, extra_size);
+    target_setup_end_record((void *)frame + layout.std_end_ofs);
+    if (layout.extra_ofs) {
+        target_setup_extra_record((void *)frame + layout.extra_ofs,
+                                  frame_addr + layout.extra_base,
+                                  layout.extra_size);
+        target_setup_end_record((void *)frame + layout.extra_end_ofs);
     }
-    target_setup_end_record((void *)frame + end1_ofs);
-    if (end2_ofs) {
-        target_setup_end_record((void *)frame + end2_ofs);
+    if (sve_ofs) {
+        target_setup_sve_record((void *)frame + sve_ofs, env, vq, sve_size);
     }
 
     /* Set up the stack frame for unwinding.  */
-- 
2.14.3

