Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2653644wru;
        Mon, 1 Jul 2019 06:26:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqznz/i6BgmTLvZn9cnHttURnQBsYZIsvUdXriKi7jUoU8LgNaeEcqjUN7dCPVHMxwe7WpB6
X-Received: by 2002:ac8:2d6e:: with SMTP id o43mr19869500qta.195.1561987590048;
        Mon, 01 Jul 2019 06:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987590; cv=none;
        d=google.com; s=arc-20160816;
        b=qVUzJSRLnRs3/7cSoH7Qu90IUwnUb7RNGQ8qECDEF3B+W+x0OxWkH2cH1vZY3B/w5z
         rgmY0qM68Ta8spiAtksdE25OlXalo8eTMkl/0UMg8wdlWWQ60I/wmFeRhN6xsmFHAinS
         Bj1a6dOxRPWg+Y4NFBgaGfaTO5ryvqrJnbJR1o9mNnOZqvkRjtrbDEuiarzRR8mrT9LC
         m7xuBA+4msVzBvIFUWFkIpPnwPoal8Ka0zpfKy2WfHzXtHj8o/Kizf+/utVUhFWadvon
         nGa/0IYHWupeQ1eEVDuGrhZNVvoHFEDHvDQ99dR5qWgWj8rJPvA4Jkrvb8oG/txa0vVN
         QAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=NyvOz/UhVrOEQ3OB/I5vzp1dPutGm6BUarhkXnUW4aA=;
        b=E0MvK0G7SqgnyA/P0j1gu7ICpISeqpuDSee7imMOhW/IbMdw43+/U8oofVKuR/qAdB
         adIpigtvCZHfwfhAHoLOJre/AO3tC+P5wTHeODqC/w9nqQUkJCIHbksCJLNGtODzAw2w
         cdwoYWC7J085VsMl2oT++1ea2+8PJDMPAi+cTDw4Q7cuWvrRDNk6M1y+VPEzRg2Yo1a4
         0cticXD3e4yshB/zbNh5xuhGOtxyk4ZLtfGA6ccNmWqkLq++P796VxY4kxrTpKZCIPTu
         DwvCAIRD7FteIr0htoNB5/OidhvPUT11LpD3MhKnq8ecbGtFrWwWoja1uOqk/loUF+jX
         c1Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id w54si7369510qtj.114.2019.07.01.06.26.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:26:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A5013082231;
	Mon,  1 Jul 2019 13:26:29 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCEC66085B;
	Mon,  1 Jul 2019 13:26:24 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 15/27] target/arm/vfp_helper: Extract vfp_set_fpscr_to_host()
Date: Mon,  1 Jul 2019 15:25:04 +0200
Message-Id: <20190701132516.26392-16-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 01 Jul 2019 13:26:29 +0000 (UTC)
X-TUID: p6JmxgXxKnt0

The vfp_set_fpscr() helper contains code specific to the host
floating point implementation (here the SoftFloat library).
Extract this code to vfp_set_fpscr_to_host().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/vfp_helper.c | 127 +++++++++++++++++++++-------------------
 1 file changed, 66 insertions(+), 61 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index d54e325324..b19a395b67 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -81,71 +81,11 @@ static inline int vfp_exceptbits_to_host(int target_bits)
     return host_bits;
 }
 
-uint32_t HELPER(vfp_get_fpscr)(CPUARMState *env)
-{
-    uint32_t i, fpscr;
-
-    fpscr = env->vfp.xregs[ARM_VFP_FPSCR]
-            | (env->vfp.vec_len << 16)
-            | (env->vfp.vec_stride << 20);
-
-    i = get_float_exception_flags(&env->vfp.fp_status);
-    i |= get_float_exception_flags(&env->vfp.standard_fp_status);
-    /* FZ16 does not generate an input denormal exception.  */
-    i |= (get_float_exception_flags(&env->vfp.fp_status_f16)
-          & ~float_flag_input_denormal);
-    fpscr |= vfp_exceptbits_from_host(i);
-
-    i = env->vfp.qc[0] | env->vfp.qc[1] | env->vfp.qc[2] | env->vfp.qc[3];
-    fpscr |= i ? FPCR_QC : 0;
-
-    return fpscr;
-}
-
-uint32_t vfp_get_fpscr(CPUARMState *env)
-{
-    return HELPER(vfp_get_fpscr)(env);
-}
-
-void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
+static void vfp_set_fpscr_to_host(CPUARMState *env, uint32_t val)
 {
     int i;
     uint32_t changed = env->vfp.xregs[ARM_VFP_FPSCR];
 
-    /* When ARMv8.2-FP16 is not supported, FZ16 is RES0.  */
-    if (!cpu_isar_feature(aa64_fp16, env_archcpu(env))) {
-        val &= ~FPCR_FZ16;
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        /*
-         * M profile FPSCR is RES0 for the QC, STRIDE, FZ16, LEN bits
-         * and also for the trapped-exception-handling bits IxE.
-         */
-        val &= 0xf7c0009f;
-    }
-
-    /*
-     * We don't implement trapped exception handling, so the
-     * trap enable bits, IDE|IXE|UFE|OFE|DZE|IOE are all RAZ/WI (not RES0!)
-     *
-     * If we exclude the exception flags, IOC|DZC|OFC|UFC|IXC|IDC
-     * (which are stored in fp_status), and the other RES0 bits
-     * in between, then we clear all of the low 16 bits.
-     */
-    env->vfp.xregs[ARM_VFP_FPSCR] = val & 0xf7c80000;
-    env->vfp.vec_len = (val >> 16) & 7;
-    env->vfp.vec_stride = (val >> 20) & 3;
-
-    /*
-     * The bit we set within fpscr_q is arbitrary; the register as a
-     * whole being zero/non-zero is what counts.
-     */
-    env->vfp.qc[0] = val & FPCR_QC;
-    env->vfp.qc[1] = 0;
-    env->vfp.qc[2] = 0;
-    env->vfp.qc[3] = 0;
-
     changed ^= val;
     if (changed & (3 << 22)) {
         i = (val >> 22) & 3;
@@ -193,6 +133,71 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
     set_float_exception_flags(0, &env->vfp.standard_fp_status);
 }
 
+uint32_t HELPER(vfp_get_fpscr)(CPUARMState *env)
+{
+    uint32_t i, fpscr;
+
+    fpscr = env->vfp.xregs[ARM_VFP_FPSCR]
+            | (env->vfp.vec_len << 16)
+            | (env->vfp.vec_stride << 20);
+
+    i = get_float_exception_flags(&env->vfp.fp_status);
+    i |= get_float_exception_flags(&env->vfp.standard_fp_status);
+    /* FZ16 does not generate an input denormal exception.  */
+    i |= (get_float_exception_flags(&env->vfp.fp_status_f16)
+          & ~float_flag_input_denormal);
+    fpscr |= vfp_exceptbits_from_host(i);
+
+    i = env->vfp.qc[0] | env->vfp.qc[1] | env->vfp.qc[2] | env->vfp.qc[3];
+    fpscr |= i ? FPCR_QC : 0;
+
+    return fpscr;
+}
+
+uint32_t vfp_get_fpscr(CPUARMState *env)
+{
+    return HELPER(vfp_get_fpscr)(env);
+}
+
+void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
+{
+    /* When ARMv8.2-FP16 is not supported, FZ16 is RES0.  */
+    if (!cpu_isar_feature(aa64_fp16, env_archcpu(env))) {
+        val &= ~FPCR_FZ16;
+    }
+
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        /*
+         * M profile FPSCR is RES0 for the QC, STRIDE, FZ16, LEN bits
+         * and also for the trapped-exception-handling bits IxE.
+         */
+        val &= 0xf7c0009f;
+    }
+
+    /*
+     * We don't implement trapped exception handling, so the
+     * trap enable bits, IDE|IXE|UFE|OFE|DZE|IOE are all RAZ/WI (not RES0!)
+     *
+     * If we exclude the exception flags, IOC|DZC|OFC|UFC|IXC|IDC
+     * (which are stored in fp_status), and the other RES0 bits
+     * in between, then we clear all of the low 16 bits.
+     */
+    env->vfp.xregs[ARM_VFP_FPSCR] = val & 0xf7c80000;
+    env->vfp.vec_len = (val >> 16) & 7;
+    env->vfp.vec_stride = (val >> 20) & 3;
+
+    /*
+     * The bit we set within fpscr_q is arbitrary; the register as a
+     * whole being zero/non-zero is what counts.
+     */
+    env->vfp.qc[0] = val & FPCR_QC;
+    env->vfp.qc[1] = 0;
+    env->vfp.qc[2] = 0;
+    env->vfp.qc[3] = 0;
+
+    vfp_set_fpscr_to_host(env, val);
+}
+
 void vfp_set_fpscr(CPUARMState *env, uint32_t val)
 {
     HELPER(vfp_set_fpscr)(env, val);
-- 
2.20.1
