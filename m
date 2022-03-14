Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1843248lfo;
        Sun, 13 Mar 2022 21:44:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE5Kph+X272+0cEvxNxuFZ0Vw4U4EPKYzoEXwoHsmeMoKTUIHB1hyzz/3d2wLAbDdl0V08
X-Received: by 2002:a25:6a54:0:b0:629:49dc:ce18 with SMTP id f81-20020a256a54000000b0062949dcce18mr2153044ybc.490.1647233073003;
        Sun, 13 Mar 2022 21:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647233072; cv=none;
        d=google.com; s=arc-20160816;
        b=DZf0iaS5VqWXSPsTAh3bXnipHxvbF48tKQfYBMrIwxYoGSs2ZBb0u5RAXtevhd3U/E
         bAbf3eFmKvOaxs5jN4Ie1aKF1Ih/gQhluUBRosl7vYMY4Bkz7vG6vf59Hc0ITjamfheC
         GYdtenP3eHZQp0Cnd+wNy/FeMXF7tVPWx4Hexdmp6ywV89rnCIg6KjGkPRlJmQdozlJy
         jmqnlSs10k27qbgA7d/4y4hMw9msv0sPHDHzrj0O+rwG13QGamzd/lugdlQEXIujIPLb
         aZXohysc05k+wPEWlCalBMumxLUXAfMrTKGqkalnmDIM/RVCcVNpLI+MyszLoYRE6Qqr
         a5bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cXCVIH7QbmZmA9NvwqwE9kMzF0Kq89R2K/T6009maKI=;
        b=hzm5j0ouAqAmTbBxDTvkPc39+6LT95I1HXD3WvjoORm39NyN07J3DrsZ3a3CF76FXZ
         gdOYchLPcP+U3PXifHXcBylSkOHD5Xd8rzCuiWuIT4tuYU/hVIcjRAEVB1e5LYwg34Ye
         OpEUI95y2Z6y7D9tgqTWO8jUMuJcezsZTYKC0+j6P7qTgtQsoc3t0xOgoF9/lEU0jynU
         R3O4Otuei/8rcno3gbg/89f81YrIWMMWAgURXo8LRC0Ywq/BxxUmPzRdbmaXz0p7Pmas
         CG4oEnAWSLJTq+uVyKt6PjHC/IoHHccr5DzSvd0Q9iwl66M2vi+Nj5WSR5ECFGQ1zu7j
         CaGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dz6nzMwV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d77-20020a256850000000b006288f284210si8584776ybc.133.2022.03.13.21.44.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Mar 2022 21:44:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dz6nzMwV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nTcZK-0003EQ-Io
	for alex.bennee@linaro.org; Mon, 14 Mar 2022 00:44:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTcY4-0003DE-Hl
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 00:43:13 -0400
Received: from [2607:f8b0:4864:20::62d] (port=38872
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTcY2-0004PB-PS
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 00:43:12 -0400
Received: by mail-pl1-x62d.google.com with SMTP id n18so9842401plg.5
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 21:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cXCVIH7QbmZmA9NvwqwE9kMzF0Kq89R2K/T6009maKI=;
 b=dz6nzMwVUdsXRCSMZRwfKSBpmM+u9enzfEceZtKo4p2QXg3hc2AJ08K8gLzBlM/n2T
 eve6+J5NO0QBj9RMK2hqkYGGe1NBfIMU+mSMK61AhFoDbfj2JeP80mu5YLzVtey1P+bz
 fat8sT+RQKLby+uCO+E3buy61U4bpBe3III85KVIcbqQesv8kqwV84ruQzPsGkROUS3u
 1RQ4L04KUj8p7BrBOzt3kA7nAETTLxzmxmfTY4IHJODM4QZLHirq5s8pyZ7EZTbY/5hZ
 EoXchcz7zplHkk8+6xHbdn9wyjCmPV9sRGixOde1b1HxKl+jCENCivgLjEg18KqD7Dv3
 mCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cXCVIH7QbmZmA9NvwqwE9kMzF0Kq89R2K/T6009maKI=;
 b=zU7uzWsNKLXCEZDfWcR+gbQCdinLBEkgDJOkAa25IeESiY1UtgILPj6VS7QnBCwsnk
 JCSg7HTpMK2eneTmYOviT8XfYmqRlYjgxRwSj3BEfN+V3vQ13LHkZbwcwUNqTEj0/QnH
 WaTtDnEBDnaVGHHZdBJUXQAM4eN8Sik+8ZdufopWg4TGRG5rWyFittXtwOvXNxt0eFBH
 Vr2EuP8RlTlgL5yZJXswOxSTSyvvwdKIb6rEFuJhC+xlr3C/LQt6EdszBSSjA8I2ppwN
 D/AkBBxm7LZRHP2Zdt3qhUJYmXNUXU6WgQQVQ6W6zQMQy70I0lj9A+U/D2oa/XBW1Ttz
 Q+Eg==
X-Gm-Message-State: AOAM530lnnkftX2tlC2TlS5MB44+0FpjQIWrl551QXPxY+RaqizJmaFG
 yuhCiuU8eXWI8ySVSZbI7sukNdbWgxoZ9w==
X-Received: by 2002:a17:90b:4f4e:b0:1bf:88f6:e5b5 with SMTP id
 pj14-20020a17090b4f4e00b001bf88f6e5b5mr33607904pjb.47.1647232989556; 
 Sun, 13 Mar 2022 21:43:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm18258153pfu.150.2022.03.13.21.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 21:43:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] linux-user/arm: Implement __kernel_cmpxchg64 with host
 atomics
Date: Sun, 13 Mar 2022 21:43:05 -0700
Message-Id: <20220314044305.138794-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314044305.138794-1-richard.henderson@linaro.org>
References: <20220314044305.138794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YEl+2BISJ4sE

If CONFIG_ATOMIC64, we can use a host cmpxchg and provide
atomicity across processes; otherwise we have no choice but
to continue using start/end_exclusive.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 79 +++++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 41 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 0122bb34f7..d9651f199f 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -136,7 +136,7 @@ static void arm_kernel_cmpxchg32_helper(CPUARMState *env)
 }
 
 /*
- * See the Linux kernel's Documentation/arm/kernel_user_helpers.txt
+ * See the Linux kernel's Documentation/arm/kernel_user_helpers.rst
  * Input:
  * r0 = pointer to oldval
  * r1 = pointer to newval
@@ -153,57 +153,54 @@ static void arm_kernel_cmpxchg64_helper(CPUARMState *env)
 {
     uint64_t oldval, newval, val;
     uint32_t addr, cpsr;
+    uint64_t *host_addr;
 
-    /* Based on the 32 bit code in do_kernel_trap */
+    addr = env->regs[0];
+    if (get_user_u64(oldval, addr)) {
+        goto segv;
+    }
 
-    /* XXX: This only works between threads, not between processes.
-       It's probably possible to implement this with native host
-       operations. However things like ldrex/strex are much harder so
-       there's not much point trying.  */
-    start_exclusive();
-    cpsr = cpsr_read(env);
+    addr = env->regs[1];
+    if (get_user_u64(newval, addr)) {
+        goto segv;
+    }
+
+    mmap_lock();
     addr = env->regs[2];
-
-    if (get_user_u64(oldval, env->regs[0])) {
-        env->exception.vaddress = env->regs[0];
-        goto segv;
-    };
-
-    if (get_user_u64(newval, env->regs[1])) {
-        env->exception.vaddress = env->regs[1];
-        goto segv;
-    };
-
-    if (get_user_u64(val, addr)) {
-        env->exception.vaddress = addr;
-        goto segv;
+    host_addr = atomic_mmu_lookup(env, addr, 8);
+    if (!host_addr) {
+        mmap_unlock();
+        return;
     }
 
+#ifdef CONFIG_ATOMIC64
+    val = qatomic_cmpxchg__nocheck(host_addr, oldval, newval);
+    cpsr = (val == oldval) * CPSR_C;
+#else
+    /*
+     * This only works between threads, not between processes, but since
+     * the host has no 64-bit cmpxchg, it is the best that we can do.
+     */
+    start_exclusive();
+    val = *host_addr;
     if (val == oldval) {
-        val = newval;
-
-        if (put_user_u64(val, addr)) {
-            env->exception.vaddress = addr;
-            goto segv;
-        };
-
-        env->regs[0] = 0;
-        cpsr |= CPSR_C;
+        *host_addr = newval;
+        cpsr = CPSR_C;
     } else {
-        env->regs[0] = -1;
-        cpsr &= ~CPSR_C;
+        cpsr = 0;
     }
-    cpsr_write(env, cpsr, CPSR_C, CPSRWriteByInstr);
     end_exclusive();
+#endif
+    mmap_unlock();
+
+    cpsr_write(env, cpsr, CPSR_C, CPSRWriteByInstr);
+    env->regs[0] = cpsr ? 0 : -1;
     return;
 
-segv:
-    end_exclusive();
-    /* We get the PC of the entry address - which is as good as anything,
-       on a real kernel what you get depends on which mode it uses. */
-    /* XXX: check env->error_code */
-    force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR,
-                    env->exception.vaddress);
+ segv:
+    force_sig_fault(TARGET_SIGSEGV,
+                    page_get_flags(addr) & PAGE_VALID ?
+                    TARGET_SEGV_ACCERR : TARGET_SEGV_MAPERR, addr);
 }
 
 /* Handle a jump to the kernel code page.  */
-- 
2.25.1

