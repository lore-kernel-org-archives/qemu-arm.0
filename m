Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1248436wrm;
        Fri, 18 Oct 2019 11:08:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyWcbaXBMKahLH5Ue3GU1LRTOoe/dLMRuP2MJiQtSGf3To5vwAvjeA8Q+8o4N2/OFwp6fhm
X-Received: by 2002:a05:6402:1454:: with SMTP id d20mr11451361edx.53.1571422133099;
        Fri, 18 Oct 2019 11:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571422133; cv=none;
        d=google.com; s=arc-20160816;
        b=m1GM3yeLD/nH5Ki+c0cQH0K9fnBmG+45pebMBEvyTTldes/Rlp0sKVh0iJydaFkhGB
         7q0IeDo1bFe4mWWtTjJD52unoEeYtONn9yxHUYR+H2CRPmFnDChAm+HWHaviy6Hmhr1p
         e48EKJQ56P5HuPTKPR+GCisB4O2e3lH7A8RnKn7gk/kGd+OXBQHw7mmLBeTig57x6GOw
         G6hshX9Xd+qoSyhr7uU3TK283oroOI2+PqncT8CHKo22O4dw4t0S+cl7xxBGOj0EhHiH
         3a0+fMSysiAPDRu8bK7IZREjap9XtIcB28aelyOqZuQKmJY9awceosd0ip3HR6H4Yw0f
         iUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xYzA79nlkAAXT+tYBTRBvIlOCILLFnnuEHFTBSl+bu8=;
        b=NUNfbxVJgaxr5lZ5PCxCP2pVHYxiE8d3RyLn9lkytlWGWFk+UT7LL49edxpgTx9c6q
         crnU+Bzwqe7g8GvrS7ScVJfPxNtFFxULq8bkm3MZe3L8H9bOfmV5nXlMC6KkF+gQZSQE
         DyFwCzB5gbd0OhxLbu+ZO+/BQdJTxr5nblUHgXMqEQLxO+BaIYdXCSjW96Vhot6u0/a0
         k+JgadZTl54oJ9pKAwlWAu/oUtcBmMlGG+z2HhVUH9wG4e0ufjOtkgSUIC4Tc017Q97I
         54bB6/f5xaXNvMVmJ1F4FFMaN4RaZw4p/HM0m9MbvJbvTa2jpCPPu+NJqRwRTHLxsb71
         wYOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vSIDsLNq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oz25si3671897ejb.175.2019.10.18.11.08.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 11:08:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vSIDsLNq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWgG-0006Tr-49
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 14:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59571)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJE-0006zr-5M
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:45:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJC-0005hx-Uo
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:45:03 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:45361)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWJC-0005hQ-NR
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:45:02 -0400
Received: by mail-pf1-x441.google.com with SMTP id y72so4303689pfb.12
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 10:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xYzA79nlkAAXT+tYBTRBvIlOCILLFnnuEHFTBSl+bu8=;
 b=vSIDsLNqsnrQQPJVv21MsXEaz4hVN60xT3imyizOIAuCOBHlxzIpfVSEN7ngciqPVv
 HCRNpEGWxcfpAC30lbz6eEB94vkXTh/Bzeg+sIPc039kJeTPyPRcZKngAujNtbIaHMuw
 Xex2OQfPcj8wyGm21ub2exiE7HoeZ3mDNUuzceF+sm+Qbhn/SiJvbDhTGlutN85l7KiE
 8DPYmi75i9pXbnqMF2WhnzipDr2fOnDriz4518pbZ310JKLW3Crao8XBtqbT+hwDu35u
 i1GphTsBa2aDA8fPOMONO66ombvkYAdmVTC+Sjpo7cJVYIoiRpvffZmbaCRgNjmzytB0
 JF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xYzA79nlkAAXT+tYBTRBvIlOCILLFnnuEHFTBSl+bu8=;
 b=MbRoz7R0laPnVo/k40jSVTvE4W1m2cqnRgzsWqwwECc8smD+TM7qyZFGe39UIrhLkg
 pwQcYhPcJ5aUeUwmaU4tZL3y4XnDsWWUbSHmMe0e+FBWU8o7siEhFsAm5p9mpwiqR+3g
 OJxD7KTffrETQK1fIgM/wOvYS8i/TSAW0MwrRKxCplEJTnoz9lNg94O5VLK3EpJ39BTi
 9Lswo/Y1OHSL1HoIU6LZUhQyOht1pRWjFYP1fkfFVH4ZUFF2KHLCQspeOoKaysWch/W5
 dcPU1sPPrFyZSCJzbOuxAhiNAMTchexucynghM7Il5Tr2Y0YSXu8mFUydoJODfVEHYRl
 Fx1g==
X-Gm-Message-State: APjAAAWZdIYoqHh/WVtnwMLWzLRL6XIEgrLz27Wg4yUbxHRXD4LhWbbb
 ptAmsDLDv8gBsOtpP2uvtyN6w6YqlxI=
X-Received: by 2002:a65:5a81:: with SMTP id c1mr11210178pgt.245.1571420700036; 
 Fri, 18 Oct 2019 10:45:00 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 22/22] target/arm: Rely on hflags correct in
 cpu_get_tb_cpu_state
Date: Fri, 18 Oct 2019 10:44:31 -0700
Message-Id: <20191018174431.1784-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9nDQwo1/qN+x

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
index c55783e540..63815fc4cf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11259,12 +11259,15 @@ void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
-    uint32_t flags, pstate_for_ss;
+    uint32_t flags = env->hflags;
+    uint32_t pstate_for_ss;
 
     *cs_base = 0;
-    flags = rebuild_hflags_internal(env);
+#ifdef CONFIG_DEBUG_TCG
+    assert(flags == rebuild_hflags_internal(env));
+#endif
 
-    if (is_a64(env)) {
+    if (FIELD_EX32(flags, TBFLAG_ANY, AARCH64_STATE)) {
         *pc = env->pc;
         if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
             flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
-- 
2.17.1

