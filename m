Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1232369wrm;
        Fri, 18 Oct 2019 10:53:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw2YjEZef8cUg9Um6QiXEqEBj4eNcFobVWGRjNT7whaOX0+NklUaJtH7S2p58r64egaQC9Q
X-Received: by 2002:ac8:3473:: with SMTP id v48mr11395947qtb.240.1571421234763;
        Fri, 18 Oct 2019 10:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571421234; cv=none;
        d=google.com; s=arc-20160816;
        b=rDrhj522ysjMwh9frZvD+oIqlt4PE2OGhG4nqeTeytIqpnyWq6WihqRzVJhDUknfay
         PjGYg5UXSt2e8DF8sIBcR2/iur36FPGUokyWQvKTGC1LLUnS1+P9z0Z/aftynH2SWHzD
         4wcBrNfBYx7WPo/JgXGZ6TdV0MEkD0/LdVet21iv3bH1dZY/FWr6/NWncAsyEpvQF8gw
         YNe0KWZnIvRML0RkgBsWfDFGazM6az19433xesgJC9vinNakpH0FD7uyCO33781HBZI2
         rgSkAQ6ayTUJt0upgp7yDbE7HSnlAc4mUdOzClDm3ImMrBAlaBWZKzWmeEN77gt8O8yE
         iMKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xWBixVJrplgoFEDYWsC1KvhyFbMO/zEb6ezvCN+GZN0=;
        b=mfwWn5JIEO/kdzdcsQp+95LfWMwKgRWmOIRWWarjihBtlooiaCATBzRwXb9VVo8FgG
         DDnbha+oeBh56G1rGu5bLjdYN8KbJoeZktp3Ri2SbeKOZNxccHUmgSZ6e1Xak49Dr7E/
         0qDwUsY5CZRA7e4B+NdXLVj6OhEk7C71BDYSl3X+UkYsaSbkigchb55f2Q0CMHWdmHdv
         lS/h0RwVMeRcUbQtNRmngrCKNCAnbrURkkaBJd5wd56HrSxzkRW0SGEwUtNWJsMf7BPW
         sREwAwqnB/mLXIFru3rykIrvUGKyh7aF8DjLh59+1mFh1gwCKGafkTs5TQ6cFk9LKeOc
         zm8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dglCRhRm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m27si7561287qtg.81.2019.10.18.10.53.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:53:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dglCRhRm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWRk-0007aq-Kc
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59341)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJ1-0006h3-5G
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIz-0005WG-GA
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:50 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:44720)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWIz-0005Vm-AA
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:49 -0400
Received: by mail-pg1-x544.google.com with SMTP id e10so3741531pgd.11
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 10:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xWBixVJrplgoFEDYWsC1KvhyFbMO/zEb6ezvCN+GZN0=;
 b=dglCRhRmDlAuRYTGEnSfh2itP+od7kl+pn1w7imqqkyyp60rDuE+rhaxKvmhN8IdQQ
 MgTCl5n8s+BRdC/VmrXsz6G5l9UCzBwFECtEiIBiMibpFLUreQgN83UiYv0EqZCHAwwm
 jbR/pEMeuJOoIaUkFucA90yAcTMq7fuZRtZGv8v+zw2EPQVeItt0l2WeyF3RzXTLlYSO
 sar+2KQyzoXqe+QTFmd4Cl1thsy+/4Ny1VUoM5xxXCmcz3UkL/Xwo3wW9Nn84Lsmul1c
 rVjsccj+3IDTvK1gXzqhyuS096/Fyi/eFG+as9ljQ++tgcN6ha+Ia6Cms+MW1Bn20eWn
 zQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xWBixVJrplgoFEDYWsC1KvhyFbMO/zEb6ezvCN+GZN0=;
 b=jAbm4uCnVERvoWhh4YwwbwLrCDk4X2zczeCyeMIfpptXAi6Z4S08FS91WMaSihW9IM
 Ny8k4mwFOPDmTDj43Arq8PW7dHN8VTqMJ2H1LtDHj1AIrSOHOHHZdVLzGiTDgvliqcO+
 TGaypheYdAuOsdS2FGtM7m29Kt87dpHG0LJOOnu1wWQ5Q21Jof8jEhOksBUOnEjN7M2X
 qN5Nm/ES9xNN4Z4kRLK3RZgxHs96WjXcPcK63u2USZkuqRP40H8JqTlvtKvCuKS4qngZ
 MpnuUGkqtK1teuRcHfcW0jGAJYkq4g+nZ/Vu6623Wp936wg1roFKwTShzqhLAZfXEhiT
 TJug==
X-Gm-Message-State: APjAAAVFfFBSbNgi/0MVUPKjqSNTqaAENA3v1h5IgylB4SPrGe8KfFDQ
 58Lx+nHOTJFKh6+Ta3/xwBjZ0QIMtDY=
X-Received: by 2002:a17:90a:a407:: with SMTP id
 y7mr12510200pjp.124.1571420688434; 
 Fri, 18 Oct 2019 10:44:48 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 13/22] target/arm: Split out arm_mmu_idx_el
Date: Fri, 18 Oct 2019 10:44:22 -0700
Message-Id: <20191018174431.1784-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yObJf0gqT7IQ

Avoid calling arm_current_el() twice.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  9 +++++++++
 target/arm/helper.c    | 12 +++++++-----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 232d963875..f5313dd3d4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -949,6 +949,15 @@ void arm_cpu_update_virq(ARMCPU *cpu);
  */
 void arm_cpu_update_vfiq(ARMCPU *cpu);
 
+/**
+ * arm_mmu_idx_el:
+ * @env: The cpu environment
+ * @el: The EL to use.
+ *
+ * Return the full ARMMMUIdx for the translation regime for EL.
+ */
+ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el);
+
 /**
  * arm_mmu_idx:
  * @env: The cpu environment
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 85de96d071..3f7d3f257d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11026,15 +11026,12 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 }
 #endif
 
-ARMMMUIdx arm_mmu_idx(CPUARMState *env)
+ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
 {
-    int el;
-
     if (arm_feature(env, ARM_FEATURE_M)) {
         return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
     }
 
-    el = arm_current_el(env);
     if (el < 2 && arm_is_secure_below_el3(env)) {
         return ARMMMUIdx_S1SE0 + el;
     } else {
@@ -11042,6 +11039,11 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     }
 }
 
+ARMMMUIdx arm_mmu_idx(CPUARMState *env)
+{
+    return arm_mmu_idx_el(env, arm_current_el(env));
+}
+
 int cpu_mmu_index(CPUARMState *env, bool ifetch)
 {
     return arm_to_core_mmu_idx(arm_mmu_idx(env));
@@ -11202,7 +11204,7 @@ static uint32_t rebuild_hflags_internal(CPUARMState *env)
 {
     int el = arm_current_el(env);
     int fp_el = fp_exception_el(env, el);
-    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
 
     if (is_a64(env)) {
         return rebuild_hflags_a64(env, el, fp_el, mmu_idx);
-- 
2.17.1

