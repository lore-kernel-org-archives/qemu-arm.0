Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1052757wrm;
        Fri, 11 Oct 2019 09:29:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJHyWoV0TAzkygHMgpB0PCOtjRCMLHbPT2GU01nkG17pasnqG3O23UpQqMFcdlKYvhdfyZ
X-Received: by 2002:a05:6402:158f:: with SMTP id c15mr14673055edv.192.1570811387236;
        Fri, 11 Oct 2019 09:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570811387; cv=none;
        d=google.com; s=arc-20160816;
        b=jQdn1NRJRQ0kG9nReJ3ITYqQhFhY5ahhqJdABjMbP7Qg0xk+zLKEfXQ+dhzCsnp5OH
         mUOl1XLeXQMmASjvg2gVgn2IdEwktZ+72GrfGoPK8eDtjN9xWRTpvmb312Gx2Tnney6Y
         iMAULki9h75V0zDGqYuJwWHqo1iUChzPiCm/OAgLs045pHBYiaK+xuOjkQzBx5VClcNH
         M9Hbjd7BHfNo8gZdxVIgbHd7QPAeagwOdXLmTzfe5p4pSVaUw/YCpdy8V9evnrZmyPF8
         cUqPAKaO7j01/qNPo4OKCGr1B8/9tFNBafE5bMjZnlbElfUuyS6lFYuhvTMBFAir6wOQ
         Wiyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5TK2BjuSMMDdIP7qbR+6sWroGlmanOV91VZR8RZQmXE=;
        b=eSAGDg1skCBU/gMtJIWJetSgGoqZLD03FfpLq7dNKgxatOxaKPQGnWPyDijze7dZrX
         f3oLJNRAOUpWb2tLaq+H9wWelffpu/xuOdQjIQ52Kl79k/yIcQowHguwnXz5Tc9YDzrI
         k5dNzdIOC3Zdrm3IH5Nuy/VrgloDE8DfpklqfEN+ssPgtbzz7FQrvRmESI0BIxo9yGhM
         gaY+FSznir2k0EmI3sWqRIpj3ZRgJiLRvTRAmMF+c1EHFKtDPZ0GgMRpcvKt0MR315O0
         hUuurEInrUs+GAF5TnGBjf1KRUG+ccbQa0EVoC8RFywWPJyy0xqaH609innYuxc2ORey
         XI3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a2ptiFRh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a53si6918051edc.175.2019.10.11.09.29.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 09:29:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a2ptiFRh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIxnV-0000Ot-KA
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 12:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34015)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxH3-0002nS-2e
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxH1-0007tV-Sv
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:12 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:45857)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxH1-0007t2-Oh
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:11 -0400
Received: by mail-yb1-xb41.google.com with SMTP id q143so3241348ybg.12
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5TK2BjuSMMDdIP7qbR+6sWroGlmanOV91VZR8RZQmXE=;
 b=a2ptiFRhsf7+BU+L02eLqokAt4Qi1y0BibWRYxGi/ZF+3m3nbc4NmXIl/R3aDr7ok5
 nqTnu4S6Gl9V0/LxPeY+FI6M0M82BVKHVTIWCUnGhi+p+V82kc6Tq0GijY+h65EWCeHY
 eXeFxPatzoEQe/rbsaFMNviY/nYdUVwPYEUIgahuzhJIVPszMcycLBsLhIjsXSBC/tZ9
 nRX/Af09keUd5vo5cotY7UXkAP969d/zgNvxqbR/pzVayxQDRuN7cyh8tNCkH0Yqgzwu
 lAA6Wl+N4I8fb9S0tIArdmHANmciHVXB3pd076tTQNTY+gAMNNseDkq/6DV6E6qxYYD1
 J63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5TK2BjuSMMDdIP7qbR+6sWroGlmanOV91VZR8RZQmXE=;
 b=G4M38S4KxgflfC9/zDtDqMAQcZsjDnjppCRSFPNmK0NZP4PhidnQ9o7kl5tZl6g7+J
 zHmIR+96TYMfm4/KzEa1YmTn4Y3nMf6cwp2aRV0hSncn9mgkfO+M6QP9iW6tLikZYarO
 sjmrDMLqBVqnDiKFejkMnmtrixw9k2s09YAm66L50ovcU9pYsRqHDLhXdWGIgW3fFeIU
 R9yYKEJqasODIt5B856/d0cjGJmSRnz4yOGSgTLTqxPjz+D+cAOrvjhEMY5xo0Gn2EGU
 mVDV4PNHhZxPZyyJDElrTvcIN8zLNK2mCZU2CjSnbjMfhBEOHjF1/INkmMXsT0jm+JUK
 a4nw==
X-Gm-Message-State: APjAAAWnZeaOwXUxRBeoDp46P+setpIpMky9T+Zb1oEjKJwVhO5W99z6
 aSr84T0/INY+WR1gHBONjzKfCw==
X-Received: by 2002:a5b:d:: with SMTP id a13mr10962807ybp.187.1570809371167;
 Fri, 11 Oct 2019 08:56:11 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:56:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 20/20] target/arm: Rely on hflags correct in
 cpu_get_tb_cpu_state
Date: Fri, 11 Oct 2019 11:55:46 -0400
Message-Id: <20191011155546.14342-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011155546.14342-1-richard.henderson@linaro.org>
References: <20191011155546.14342-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wihcV6ACTYWE

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
index aae7b62458..c3e3dd2c41 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11249,12 +11249,15 @@ void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
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

