Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp624wrs;
        Tue, 20 Aug 2019 14:19:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxqEIPnZIKQ7jq3QMqDzkFm0czWUTEaLmSJ1LDKqn2VfVXCbBPmrg1lYAe7+SctSrgTg/H
X-Received: by 2002:ae9:e118:: with SMTP id g24mr28378657qkm.378.1566335974832;
        Tue, 20 Aug 2019 14:19:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566335974; cv=none;
        d=google.com; s=arc-20160816;
        b=gYmDdAjJQdtaO2rpJ4Xvb59wbXnwSJuZ3Yy2MOFjc1BJTUlsJ1Lii68A3GwHUbExXL
         qmFIiBzVN46wwCz8U5JGLvyoEM2JvkPg2MUuQDW2oNyiCVNcf3hfIAUQggKkW+EbkqlW
         cwWx1rroNK+ROwmkvioQmCjq9PPpbs+RzckUNMSQGOtatRModJI+ZIzOfn0aRbnnkLTI
         eXVAHmSfy6s2sj5sn+gRkPeTOetlFHJK1xpQq74EwcMj8pfPaxL3x2JFdQzlBMx1a+K1
         4wUMj80QQGsgNFL3X0tzLuEjRASvVCboPNTPIPP484N9VSkltUTHxfzghcsRoITX4bzd
         Dshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=uEuMTFJPriSi6tDBht/B2C/M+eVLAfQCMhLFMcHsiGA=;
        b=aqjJBNHmHY83G8dgtzVSvDn31HOC9McxeFYEZKPJlIvZMuOeVQxPvnUzFdK5lkhOWN
         FloXSMHbRXNNn94B6m5+ntR1RjyUx/QlACDZL0cNhT8vj4CEJ4Dop2vIHJbdTAgMHY6P
         9nbvfOHShVTSxEnFhF4FRsawEPDbhlEIeMGzbZN7xcuHrT2JptzjEbifHKn4jLy/p8KN
         2h1L3iYWy/YgpnulJSKt6N0gK+HRz/dkVfxNg57PrVi/fprPofz2t7TBFOAzCLVLhtL6
         CjFGgT060fnAT9dZZ5opRMXmDDubgBuwgTB72+gvYTJInZEtJwQawDN9uoU8bGOoAGnY
         3a3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=seU9CvbP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i62si11030414qke.115.2019.08.20.14.19.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 14:19:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=seU9CvbP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0BXR-0002zT-Iv
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 17:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54038)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BM3-0000Np-Gh
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BM2-0000Er-9N
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:47 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46088)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0BM2-0000Dv-2m
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:46 -0400
Received: by mail-pg1-x544.google.com with SMTP id m3so3893501pgv.13
 for <qemu-arm@nongnu.org>; Tue, 20 Aug 2019 14:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uEuMTFJPriSi6tDBht/B2C/M+eVLAfQCMhLFMcHsiGA=;
 b=seU9CvbPFWQC6HXFlU4qGeJJOEoKi3ivDF7hxy/kTPUlSwz+PanrBNm6RCvT2te+He
 wa1zY3vZI5hIVXtpr6XAieAWB9ejmxhi0ayDvZUBPOEtkJmHwikSRoYmoWc5OIl5hE/Q
 ROJJcZMaeAA8itUVPGVM1WCJMVPDTZO7iV75WtgXXH1crLSa3jjYdDwnKZfDrqzcxMly
 enPgJj8H+6XE4Gg2E/GpJfVbeXi4pz+dlWG/cQes34VEXWyKEla5nwEuh4soR9H20m5M
 JAvs0kHCIzAFCOUyXoVdvF/e8lCbnl6ZTnYo6sp/H3SK39N8jIhjT2PgGfSO/IumBJ43
 U0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uEuMTFJPriSi6tDBht/B2C/M+eVLAfQCMhLFMcHsiGA=;
 b=Q2DI6aOABmYrs9pOtU+lNla4jiT6gTy+I1AT+1jJWOgOUPKaaQUyk8wSaAE0mliMSO
 FMkdq/TUNPolU1wEkJC2t6CiQN9m5i1uSFDu900JPTCqi8gOIrJwqm9EEDElmQq0Fdbc
 XyLMc7LF+ggKf9o7kHm7x+vW6pZGkm2C6i9Dm+hDLVEi9ErbBMVx363l8Nuo4lhym9zH
 WWsF5EGbPv+q4S48fUWfep84aBViAkxHILKEpQgFABB022dnZ6PlAJa4GLPA79Fjgoxh
 7JIqHlPDGVeCbsCRG3DGnw4sUch2Kn/WwXW/dYCWSH/ArnnAb/e0FtrB5rCfYo9tiCUU
 UTcQ==
X-Gm-Message-State: APjAAAWYU0q3GPBwmwubGXGMRBn5JDthsaMS2g1ZzOB055rqs7XgK/vm
 CpoABt0ZZ3zNSIkpZHTlN6pmjw==
X-Received: by 2002:aa7:95b8:: with SMTP id a24mr31913578pfk.103.1566335265240; 
 Tue, 20 Aug 2019 14:07:45 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id k22sm21690743pfk.157.2019.08.20.14.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 14:07:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 14:07:20 -0700
Message-Id: <20190820210720.18976-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820210720.18976-1-richard.henderson@linaro.org>
References: <20190820210720.18976-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-arm] [PATCH v5 17/17] target/arm: Rely on hflags correct in
 cpu_get_tb_cpu_state
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
X-TUID: dN3zF3EguoLD

This is the payoff.

From perf record -g data of ubuntu 18 boot and shutdown:

BEFORE:

-   23.02%     2.82%  qemu-system-aar  [.] helper_lookup_tb_ptr
   - 20.22% helper_lookup_tb_ptr
      + 10.05% tb_htable_lookup
      - 9.13% cpu_get_tb_cpu_state
           3.20% aa64_va_parameters_both
           0.55% fp_exception_el

-   11.66%     4.74%  qemu-system-aar  [.] cpu_get_tb_cpu_state
   - 6.96% cpu_get_tb_cpu_state
        3.63% aa64_va_parameters_both
        0.60% fp_exception_el
        0.53% sve_exception_el

AFTER:

-   16.40%     3.40%  qemu-system-aar  [.] helper_lookup_tb_ptr
   - 13.03% helper_lookup_tb_ptr
      + 11.19% tb_htable_lookup
        0.55% cpu_get_tb_cpu_state

     0.98%     0.71%  qemu-system-aar  [.] cpu_get_tb_cpu_state

     0.87%     0.24%  qemu-system-aar  [.] rebuild_hflags_a64

Before, helper_lookup_tb_ptr is the second hottest function in the
application, consuming almost a quarter of the runtime.  Within the
entire execution, cpu_get_tb_cpu_state consumes about 12%.

After, helper_lookup_tb_ptr has dropped to the fourth hottest function,
with consumption dropping to a sixth of the runtime.  Within the
entire execution, cpu_get_tb_cpu_state has dropped below 1%, and the
supporting function to rebuild hflags also consumes about 1%.

Assertions are retained for --enable-debug-tcg.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Retain asserts for future debugging.
---
 target/arm/helper.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d1bf71a260..5e4f996882 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11211,12 +11211,15 @@ void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
-    uint32_t flags, pstate_for_ss;
+    uint32_t flags = env->hflags;
+    uint32_t pstate_for_ss;
 
     *cs_base = 0;
-    flags = rebuild_hflags_internal(env);
+#ifdef CONFIG_TCG_DEBUG
+    assert(flags == rebuild_hflags_internal(env));
+#endif
 
-    if (is_a64(env)) {
+    if (FIELD_EX32(flags, TBFLAG_ANY, AARCH64_STATE)) {
         *pc = env->pc;
         if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
             flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
-- 
2.17.1

