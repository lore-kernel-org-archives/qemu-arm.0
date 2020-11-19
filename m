Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp767772lfb;
        Thu, 19 Nov 2020 14:23:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYUsE+duU/3V+VRjFRSbsOW1cCkzCw9GNYg7WbW2fvQUFf40lwGFmYJh/6fi4eFVwg05kT
X-Received: by 2002:a05:6902:690:: with SMTP id i16mr5130837ybt.148.1605824616029;
        Thu, 19 Nov 2020 14:23:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605824616; cv=none;
        d=google.com; s=arc-20160816;
        b=Emp++LQjsKTga0htNGyh1cRfnm+1SZihzGteyuriuRiJbZX64kgbTyi7+Ox1u4nD5t
         RI7N9atHmFw7kqCCOlP3gvLxFotLATSUGRTnJkguDNQNFY4D2SlZ+HqDR5uio0l0t3W3
         ++6VtJhCo+4p5xmFCO5xpPf1eluitOx6feshhbnSeqMzaMCiXMsOGr3cBK/Ws/qF4kJN
         f/1JeC+QjpATJ0gOQGuNdsDPtVTH3Szk2sHp8XEUwLprqL483lMBczzlZRifXvbhUz6r
         zT15nLHl2HGE2XNbfkDabezyWgNS4HX0LwX7uYDQXlmExOtjdwclcu39Rb3hK0datUIp
         jZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bRQ6LKkswMJcfs4ISAyj5r3mJc9kOQ5yoQJcCkeM7Dg=;
        b=bvY4LiArB8CYaqoiyJ4mPsMIK8eak1mNf3WyaLJn0Vzq9UILNF2S+xxsF3f+a7/lpV
         VOZ2TEellBbZvm2dElEoU/cCC+qcpEkZH0IKt1iBXIZ/V6a350N6ZSysFLHV5JgIGkpz
         MsbEJe/m2hGRAJUJpMmfhAa+b8ukUDR/BllLDBL622tA3etpZ9CcNS5jKzML4QU9E54H
         8elqPpf1SOcFWFIv0GUXHRn2CHalW8V2nbQBSTyA7zYHmEEWAoSNowl12VzGoi1QOoVt
         rH5QF8sMTkaxpeNpkcGauMoIlh2ux9wJBPMC50vTS5El69G/vs4VZRjDM2orrgvPI3aH
         WvQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ANldRKYf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j129si857447ybg.386.2020.11.19.14.23.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:23:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ANldRKYf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfsL1-0007Qs-E9
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvK-00017i-H4
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:57:02 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrv6-0004FY-Si
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:57:02 -0500
Received: by mail-wm1-x343.google.com with SMTP id a65so8075423wme.1
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2020 13:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bRQ6LKkswMJcfs4ISAyj5r3mJc9kOQ5yoQJcCkeM7Dg=;
 b=ANldRKYfYFp7ZWO5tnor1LhxHF+ZknTbld/DqkdJZfbDDg87aNMMAaO/2uM4+myX4j
 AQCPJY3mNtq7Lnb+zc9QQDsHEEMnl4CRvLXJDj4bqQr/+3HoS0HR43/3AWzw9tn8GK3t
 r8934wzE8MNPfflF4bi+aVvLsBpoOpVpoWOYW85RbeWu3ZoUCcVtQULcc680G0LvZdmR
 P5I93ZIPCpa3KZipFJVQLuAkNORaPEzGejRURcNIttBWOLQ1Lpt37UdI7Me88F7ajYYX
 6RK45BSQiTMTuGgP7H+Z1OhyixwvT9rIPQygEZWj5dq/gw92HGIzlUWSZxmFCae5BBXY
 z6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bRQ6LKkswMJcfs4ISAyj5r3mJc9kOQ5yoQJcCkeM7Dg=;
 b=Sy3NIqRQhRyxjZ9ms8texKVJnHys8aEXCVOjlS1ck9r/2NLQG8BUif4RnPFEXY+3lJ
 ZGMV/2fBQqwZjhMzgE0pzL6DGz4KJ86o7py3vwbHWAAxYbyVLX7t53fmfMOtxZot39eQ
 tGb+1BMsYmSYcydmvvd+aGzz3fVjzQeApvaVitV4mOWFswKwBg2zp3iXc2vXIZP5gzRO
 PZj6+Iu4wmWqm59q32XUEozTXZ95exIqdj4aoXRZphW7qmQX/p1TzmpVXE+GZCbBZGzK
 jfdWp68wh182DBYyo7/E9pod0brKQoSPsywF8Y4xTyPITKXwbqvEzauNiH7YhE9g01T0
 CqMg==
X-Gm-Message-State: AOAM5336YhXeg/eiwloJFm6HSNws4vgd3lc4EVCgD04IkOB5Rl8oRY7x
 ERuW+aa16Z/tIs0I9CPt5gX4tqOAcudB4g==
X-Received: by 2002:a7b:c92d:: with SMTP id h13mr6481295wml.96.1605823006157; 
 Thu, 19 Nov 2020 13:56:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 23/28] target/arm: Implement CCR_S.TRD behaviour for SG
 insns
Date: Thu, 19 Nov 2020 21:56:12 +0000
Message-Id: <20201119215617.29887-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T1DOyA4I5+Da

v8.1M introduces a new TRD flag in the CCR register, which enables
checking for stack frame integrity signatures on SG instructions.
Add the code in the SG insn implementation for the new behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c | 86 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 0bdd3cc10e9..643dcafb83d 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -1999,6 +1999,64 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     return true;
 }
 
+static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
+                                   uint32_t addr, uint32_t *spdata)
+{
+    /*
+     * Read a word of data from the stack for the SG instruction,
+     * writing the value into *spdata. If the load succeeds, return
+     * true; otherwise pend an appropriate exception and return false.
+     * (We can't use data load helpers here that throw an exception
+     * because of the context we're called in, which is halfway through
+     * arm_v7m_cpu_do_interrupt().)
+     */
+    CPUState *cs = CPU(cpu);
+    CPUARMState *env = &cpu->env;
+    MemTxAttrs attrs = {};
+    MemTxResult txres;
+    target_ulong page_size;
+    hwaddr physaddr;
+    int prot;
+    ARMMMUFaultInfo fi = {};
+    ARMCacheAttrs cacheattrs = {};
+    uint32_t value;
+
+    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &physaddr,
+                      &attrs, &prot, &page_size, &fi, &cacheattrs)) {
+        /* MPU/SAU lookup failed */
+        if (fi.type == ARMFault_QEMU_SFault) {
+            qemu_log_mask(CPU_LOG_INT,
+                          "...SecureFault during stack word read\n");
+            env->v7m.sfsr |= R_V7M_SFSR_AUVIOL_MASK | R_V7M_SFSR_SFARVALID_MASK;
+            env->v7m.sfar = addr;
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
+        } else {
+            qemu_log_mask(CPU_LOG_INT,
+                          "...MemManageFault during stack word read\n");
+            env->v7m.cfsr[M_REG_S] |= R_V7M_CFSR_DACCVIOL_MASK |
+                R_V7M_CFSR_MMARVALID_MASK;
+            env->v7m.mmfar[M_REG_S] = addr;
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, false);
+        }
+        return false;
+    }
+    value = address_space_ldl(arm_addressspace(cs, attrs), physaddr,
+                              attrs, &txres);
+    if (txres != MEMTX_OK) {
+        /* BusFault trying to read the data */
+        qemu_log_mask(CPU_LOG_INT,
+                      "...BusFault during stack word read\n");
+        env->v7m.cfsr[M_REG_NS] |=
+            (R_V7M_CFSR_PRECISERR_MASK | R_V7M_CFSR_BFARVALID_MASK);
+        env->v7m.bfar = addr;
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_BUS, false);
+        return false;
+    }
+
+    *spdata = value;
+    return true;
+}
+
 static bool v7m_handle_execute_nsc(ARMCPU *cpu)
 {
     /*
@@ -2055,6 +2113,34 @@ static bool v7m_handle_execute_nsc(ARMCPU *cpu)
      */
     qemu_log_mask(CPU_LOG_INT, "...really an SG instruction at 0x%08" PRIx32
                   ", executing it\n", env->regs[15]);
+
+    if (cpu_isar_feature(aa32_m_sec_state, cpu) &&
+        !arm_v7m_is_handler_mode(env)) {
+        /*
+         * v8.1M exception stack frame integrity check. Note that we
+         * must perform the memory access even if CCR_S.TRD is zero
+         * and we aren't going to check what the data loaded is.
+         */
+        uint32_t spdata, sp;
+
+        /*
+         * We know we are currently NS, so the S stack pointers must be
+         * in other_ss_{psp,msp}, not in regs[13]/other_sp.
+         */
+        sp = v7m_using_psp(env) ? env->v7m.other_ss_psp : env->v7m.other_ss_msp;
+        if (!v7m_read_sg_stack_word(cpu, mmu_idx, sp, &spdata)) {
+            /* Stack access failed and an exception has been pended */
+            return false;
+        }
+
+        if (env->v7m.ccr[M_REG_S] & R_V7M_CCR_TRD_MASK) {
+            if (((spdata & ~1) == 0xfefa125a) ||
+                !(env->v7m.control[M_REG_S] & 1)) {
+                goto gen_invep;
+            }
+        }
+    }
+
     env->regs[14] &= ~1;
     env->v7m.control[M_REG_S] &= ~R_V7M_CONTROL_SFPA_MASK;
     switch_v7m_security_state(env, true);
-- 
2.20.1

