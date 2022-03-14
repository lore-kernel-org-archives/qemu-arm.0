Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1843302lfo;
        Sun, 13 Mar 2022 21:44:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1hxJYSbxGiXkb/geRLMVt2VDkjBpcUiDvMthKeOyy5r8FL0nhrDhYkbI+E7ngQADzgSUk
X-Received: by 2002:a81:4d2:0:b0:2dc:cf78:4908 with SMTP id 201-20020a8104d2000000b002dccf784908mr16747328ywe.349.1647233080820;
        Sun, 13 Mar 2022 21:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647233080; cv=none;
        d=google.com; s=arc-20160816;
        b=q76PY5NYMb3Pv1Ov00SrZAu3TOVNgvdlwL1tIJumKZYH6g7CTtZlXqNrdjF0A0rT5u
         MqBUFIG1Fw2QPbd9eZil755elqInBPlNn0+bxmDqtMsN/zSoo6lUK/y629vtxUfGbLFz
         /Uy1idDQOVbhcmFgdYgEesg+rdgkLSrzWCiSm/UD4EyU5E99AvEVc4LBNTS9MctjosN3
         jIhTVJdaOgSn00iC5HIZaNcrymhrwkeQl041iEyGSWzeqk+2u50j0yigcZe24qE2Tecf
         q5c9VuEy+Ei7f0/Qd+otYTFbg9ioxXSddFVou7u8TyhtBaUfankp/hekojOXYev/hXTK
         gLZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lXfB6B+XqNR5xcS/TG/PElhQ8wbvELzxHwZ/ZITikII=;
        b=KpLvKn3R4QzbNApHnvpR/LZKV4U13tkfLGXnipBnC0YJECpjwOAVQOGt8GeVWzu2tT
         b3Ow63BHnyAKwTtdsmoyERpgZiX0e7IFa0jzanh1ZDScF3w/lPOCKHxjF3NMAgi4oMwL
         b+A9effUB9ex2HdcFDfLwHt3++H85bN7tH4YNzMsLeICLvV5dsaRdnRUTCcMzQAkGY2/
         5fTfoasiiCOuUNFsBDdXFxQfS9+JcPRWUXAivksz8ErCJlQUHji0lUSAE6pGayG1eWvm
         mQv/HO8a7ovNf/sXQNb4cFTc6zmhAXj/xJw3fALJFQObi+6lfxG/LpuQr5PBvnnxQODl
         8wEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VweupA+x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f201-20020a25cfd2000000b00627f4bb8bb6si9025236ybg.76.2022.03.13.21.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Mar 2022 21:44:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VweupA+x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nTcZU-00044M-7x
	for alex.bennee@linaro.org; Mon, 14 Mar 2022 00:44:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTcY4-0003DC-4T
 for qemu-arm@nongnu.org; Mon, 14 Mar 2022 00:43:13 -0400
Received: from [2607:f8b0:4864:20::42d] (port=36647
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTcY2-0004On-JM
 for qemu-arm@nongnu.org; Mon, 14 Mar 2022 00:43:11 -0400
Received: by mail-pf1-x42d.google.com with SMTP id z16so13235210pfh.3
 for <qemu-arm@nongnu.org>; Sun, 13 Mar 2022 21:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lXfB6B+XqNR5xcS/TG/PElhQ8wbvELzxHwZ/ZITikII=;
 b=VweupA+xP8WZZ+y5fvL1xPzWUC67e1jgCvXMDCoPxnp1WSvTk/hwLDTOTyCvTVWspE
 uVbj+CO1pjH5QxxpTHm2dZcUhKflHeu77kVBW68OBrpC4tNde5a8xjdyPRPOnQellKpQ
 OJnMhkw64CPe808MN6ehDYWxVF7naV4zhbiadCEjjgjEKHma3QWOdGK9C9bqaQi76ne2
 qCGfNXP9aGtOgFjAoStPBKdZe1THCrIgtotk57Ok3wlvIdd7ys8flqfY6jf6oF536c7Z
 i1C1N5p/K2SU175mM5RI6/Jn6fptxX8Wjbr3eyZqOVr8O0y3DJQ784k6/FPLizTDKLeG
 nwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lXfB6B+XqNR5xcS/TG/PElhQ8wbvELzxHwZ/ZITikII=;
 b=z2kRlL38AQFkcZr7DWFtnwqKtuKUGu05ZfYDhm1FtpvzrgnojIQi09SAG2WmUrrzvr
 h78Lp+hEx9xVzC1RCGUyrQ9ZL/dXHAsUZOXGOgc31oN5cREK88F03/NdIsHYpnZOXfoG
 XNQi2bcCtEY+J2j6dOk6eeN03wglo1p8qdH8pjAFUj3rd6keWtb1UPqfe7+WE/Y/Y767
 LUWMQt6Gz/scFqxioC6FGSyvhHapktGvU2vXC0f7GGFy/q1/Q16F+k65PxGsqXcSRzbP
 b1ckA9Qck1NAVS0WdZCUFp8X1fTMjZOXuvc/Ncyl9LkBU44UtDVzocMi1THYbin6IdEP
 9L9g==
X-Gm-Message-State: AOAM531UizqP5hU3zdN/F9wbYIkChtjfz35f16zHyejZZMpL+W8mZ7pL
 YH05v5iy0j+DtxXpsscl6KKUBmRfUDP7oQ==
X-Received: by 2002:a63:2a0e:0:b0:380:aeb3:d46c with SMTP id
 q14-20020a632a0e000000b00380aeb3d46cmr18441023pgq.404.1647232988795; 
 Sun, 13 Mar 2022 21:43:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm18258153pfu.150.2022.03.13.21.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 21:43:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] linux-user/arm: Implement __kernel_cmpxchg with host
 atomics
Date: Sun, 13 Mar 2022 21:43:04 -0700
Message-Id: <20220314044305.138794-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314044305.138794-1-richard.henderson@linaro.org>
References: <20220314044305.138794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, laurent@vivier.eu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SyMCnV2H/ir+

The existing implementation using start/end_exclusive
does not provide atomicity across processes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 85 +++++++++++++++++++++++++++------------
 1 file changed, 60 insertions(+), 25 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index a0e43b261c..0122bb34f7 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -75,7 +75,65 @@
         put_user_u16(__x, (gaddr));                     \
     })
 
-/* Commpage handling -- there is no commpage for AArch64 */
+/*
+ * Similar to code in accel/tcg/user-exec.c, but outside the execution loop.
+ * Must be called with mmap_lock.
+ */
+static void *atomic_mmu_lookup(CPUArchState *env, uint32_t addr, int size)
+{
+    int need_flags = PAGE_READ | PAGE_WRITE_ORG | PAGE_VALID;
+    int page_flags;
+
+    /* Enforce guest required alignment.  */
+    if (unlikely(addr & (size - 1))) {
+        force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, addr);
+        return NULL;
+    }
+
+    page_flags = page_get_flags(addr);
+    if (unlikely((page_flags & need_flags) != need_flags)) {
+        force_sig_fault(TARGET_SIGSEGV,
+                        page_flags & PAGE_VALID ?
+                        TARGET_SEGV_ACCERR : TARGET_SEGV_MAPERR, addr);
+        return NULL;
+    }
+
+    return g2h(env_cpu(env), addr);
+}
+
+/*
+ * See the Linux kernel's Documentation/arm/kernel_user_helpers.rst
+ * Input:
+ * r0 = oldval
+ * r1 = newval
+ * r2 = pointer to target value
+ *
+ * Output:
+ * r0 = 0 if *ptr was changed, non-0 if no exchange happened
+ * C set if *ptr was changed, clear if no exchange happened
+ */
+static void arm_kernel_cmpxchg32_helper(CPUARMState *env)
+{
+    uint32_t oldval, newval, val, addr, cpsr, *host_addr;
+
+    oldval = env->regs[0];
+    newval = env->regs[1];
+    addr = env->regs[2];
+
+    mmap_lock();
+    host_addr = atomic_mmu_lookup(env, addr, 8);
+    if (!host_addr) {
+        mmap_unlock();
+        return;
+    }
+
+    val = qatomic_cmpxchg__nocheck(host_addr, oldval, newval);
+    mmap_unlock();
+
+    cpsr = (val == oldval) * CPSR_C;
+    cpsr_write(env, cpsr, CPSR_C, CPSRWriteByInstr);
+    env->regs[0] = cpsr ? 0 : -1;
+}
 
 /*
  * See the Linux kernel's Documentation/arm/kernel_user_helpers.txt
@@ -153,36 +211,13 @@ static int
 do_kernel_trap(CPUARMState *env)
 {
     uint32_t addr;
-    uint32_t cpsr;
-    uint32_t val;
 
     switch (env->regs[15]) {
     case 0xffff0fa0: /* __kernel_memory_barrier */
         smp_mb();
         break;
     case 0xffff0fc0: /* __kernel_cmpxchg */
-         /* XXX: This only works between threads, not between processes.
-            It's probably possible to implement this with native host
-            operations. However things like ldrex/strex are much harder so
-            there's not much point trying.  */
-        start_exclusive();
-        cpsr = cpsr_read(env);
-        addr = env->regs[2];
-        /* FIXME: This should SEGV if the access fails.  */
-        if (get_user_u32(val, addr))
-            val = ~env->regs[0];
-        if (val == env->regs[0]) {
-            val = env->regs[1];
-            /* FIXME: Check for segfaults.  */
-            put_user_u32(val, addr);
-            env->regs[0] = 0;
-            cpsr |= CPSR_C;
-        } else {
-            env->regs[0] = -1;
-            cpsr &= ~CPSR_C;
-        }
-        cpsr_write(env, cpsr, CPSR_C, CPSRWriteByInstr);
-        end_exclusive();
+        arm_kernel_cmpxchg32_helper(env);
         break;
     case 0xffff0fe0: /* __kernel_get_tls */
         env->regs[0] = cpu_get_tls(env);
-- 
2.25.1

