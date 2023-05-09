Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2585050ejq;
        Tue, 9 May 2023 02:21:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4+rMfQids0bSLsjowsoySmDWdz7C/8+NvC9Xs/bTGm4ynhdRAFS9dkdRhoR7NK9aFKpyZ6
X-Received: by 2002:a05:622a:390:b0:3f1:f451:c13 with SMTP id j16-20020a05622a039000b003f1f4510c13mr19454243qtx.53.1683624097526;
        Tue, 09 May 2023 02:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683624097; cv=none;
        d=google.com; s=arc-20160816;
        b=pT8WGtrAsd7xy86nOMdXwzSmkpZVlEL9v+XbqVwr4s+0MRVRKP3nCHknnwS4AyC39S
         IL8PmikK+290OG3HUYhIgSPBqyZbaPN/OoeAkZwP4wRbJpTvNRLJDdB1xqYciBdML2Fn
         9O4xUWD7lDNltaHnobbUNOzI9203ciKV7IVzvT72gys0jk/ajJsjyW48BGD8EPt2ak4w
         M+gyWkXVyzecAohBzm2dYBxNPiQvj7uz/3YVGV4mWNmQ/4hfC3XjM2GmT2IGnXNVHJDo
         gG8+0QteIyVMeFrBDc1gwdiOAh7TlniyB2hjpzPdhK/cdHU01k7yX4ZVJprda6vQ31JJ
         JrPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=+r/fq8y/00SqGSXLXRvyK4Tm2x/E/80MRyeBjvpDum4=;
        b=zZjvs7cRA3NXiu1ZjSWOiJDwtlUglkM44EJZz+R0ifrlwngdRu43P9DV0razVFDnig
         QlUoEkgJWCxHFXkLi+hB5fM42mXd70Upc7CKPUAt+MtLeAPt2fzUgnTMyHLfTM88jE6s
         aWHjlpBksZqWb+GWPDUmCKOWxJxIVNHWH6xTx25eRF0fKmoiC39TkT3d9htSYNt9ltIL
         Cif2S3yMHvvLwq1fAkf77nonH1aYc4IDBAY8ccaycFQwf5BX7j+gn5diht8ek2AhQmuq
         PPLBpwkdewohtCiBRraZ4JTy5HVbT4CWVGwUiPwHIngKdTjkouNayAixRnLtFXIWifWt
         lBJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dQTX3EJY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12-20020a05622a060c00b003e62f65b6fdsi358271qta.142.2023.05.09.02.21.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 May 2023 02:21:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dQTX3EJY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pwJWs-00021r-I2; Tue, 09 May 2023 05:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwJWr-00021R-9k
 for qemu-arm@nongnu.org; Tue, 09 May 2023 05:21:05 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwJWp-00084D-0H
 for qemu-arm@nongnu.org; Tue, 09 May 2023 05:21:05 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f41d087b24so20342655e9.1
 for <qemu-arm@nongnu.org>; Tue, 09 May 2023 02:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683624061; x=1686216061;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=+r/fq8y/00SqGSXLXRvyK4Tm2x/E/80MRyeBjvpDum4=;
 b=dQTX3EJYudFGF0DlRf2d6FnVtEzGan8BR28NHKAd2v+jLw7FnXX53fjodqZEVfKliq
 5ggY1bNDfxa5feqGoAnpSRkaIpoOjPvEHwERX0VB32uW/6MLiINNzxk15U3f7oc+p48M
 BkPODpTC+FYznfmr5733qtQjMFA+cUMjzzTzUH1SXzs8fe+SEyMpdosN41bOMyVWATqP
 kyl73RVlV/YFMBw9VwBspBotHx2d5Zuyw/u0leX54CWBVJiYg3YF4kmyuZZSoIgx+mN3
 xitOA8vXQ2XpR8Sn57kwmBrEjBWl1nKB3LcpsmYwy24mhEfbhdoPVibAL/kzLYw9zEnI
 20NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683624061; x=1686216061;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+r/fq8y/00SqGSXLXRvyK4Tm2x/E/80MRyeBjvpDum4=;
 b=WJLqlr1CBwURzHEFz5EvFi2AAxuaPd52LiYXaYrr0lXBigcxSR9Blwv6gHBUPMGggv
 8SseacEm+xDFWBLdpAA3ecXld5YBtWNvf+YRtdM/cHoxC60BOvNSFtMT//yOwMV5U76g
 6VECWXQLZUndp7ipvRlur7gKQk/Ac1/j5fDazH7dHmZF5PS4NdBNLrpUz3P0fyQoZi4L
 AE/ptk3SsiEviqDz1nq2UWWqfHo1EZdIdhzDGk7Iro757Y1KYsrnGv+477lrA2jlo+di
 zRCcC/lmqHN8KoUHAEk1WtmsQFAuC9T9YfspQkwRBfPsTbPhIa2ZOuaLEMYj/LldVeC9
 GeEw==
X-Gm-Message-State: AC+VfDwoj8fiMg8fCFSwITJajUnzlucWMHXnFZ/5iR3wZVwUbpv0RuZa
 sNpyF2LSxZCa+36uf8BeeOyyMp3tj+jwuczW3EU=
X-Received: by 2002:a1c:7517:0:b0:3f4:2610:5cbb with SMTP id
 o23-20020a1c7517000000b003f426105cbbmr3780954wmc.2.1683624061115; 
 Tue, 09 May 2023 02:21:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a1c7213000000b003f4268f51f5sm4888481wmc.0.2023.05.09.02.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:21:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Correct AArch64.S2MinTxSZ 32-bit EL1 input size
 check
Date: Tue,  9 May 2023 10:20:59 +0100
Message-Id: <20230509092059.3176487-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gmVnEI0D62BP

In check_s2_mmu_setup() we have a check that is attempting to
implement the part of AArch64.S2MinTxSZ that is specific to when EL1
is AArch32:

    if !s1aarch64 then
        // EL1 is AArch32
        min_txsz = Min(min_txsz, 24);

Unfortunately we got this wrong in two ways:

(1) The minimum txsz corresponds to a maximum inputsize, but we got
the sense of the comparison wrong and were faulting for all
inputsizes less than 40 bits

(2) We try to implement this as an extra check that happens after
we've done the same txsz checks we would do for an AArch64 EL1, but
in fact the pseudocode is *loosening* the requirements, so that txsz
values that would fault for an AArch64 EL1 do not fault for AArch32
EL1, because it does Min(old_min, 24), not Max(old_min, 24).

You can see this also in the text of the Arm ARM in table D8-8, which
shows that where the implemented PA size is less than 40 bits an
AArch32 EL1 is still OK with a configured stage2 T0SZ for a 40 bit
IPA, whereas if EL1 is AArch64 then the T0SZ must be big enough to
constrain the IPA to the implemented PA size.

Because of part (2), we can't do this as a separate check, but
have to integrate it into aa64_va_parameters(). Add a new argument
to that function to indicate that EL1 is 32-bit. All the existing
callsites except the one in get_phys_addr_lpae() can pass 'false',
because they are either doing a lookup for a stage 1 regime or
else they don't care about the tsz/tsz_oob fields.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1627
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Since we pass the CPUARMState to aa64_va_parameters(), it would be
possible to have that function call arm_el_is_aa64(env, 1) itself;
but since that seems a rather non-obvious thing for the function to
be doing and a potentially more transient (or at least "not
configured yet") bit of CPU state than the translation regime
configuration, I preferred to have the callers pass in the
information explicitly.  I don't feel super strongly about this
though, so we could do it the other way if you prefer.
---
 target/arm/internals.h        | 12 +++++++++++-
 target/arm/gdbstub64.c        |  2 +-
 target/arm/helper.c           | 15 +++++++++++++--
 target/arm/ptw.c              | 14 ++------------
 target/arm/tcg/pauth_helper.c |  6 +++---
 5 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 0df8f3b8bca..c869d18c38c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1091,8 +1091,18 @@ typedef struct ARMVAParameters {
     ARMGranuleSize gran : 2;
 } ARMVAParameters;
 
+/**
+ * aa64_va_parameters: Return parameters for an AArch64 virtual address
+ * @env: CPU
+ * @va: virtual address to look up
+ * @mmu_idx: determines translation regime to use
+ * @data: true if this is a data access
+ * @el1_is_aa32: true if we are asking about stage 2 when EL1 is AArch32
+ *  (ignored if @mmu_idx is for a stage 1 regime; only affects tsz/tsz_oob)
+ */
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
-                                   ARMMMUIdx mmu_idx, bool data);
+                                   ARMMMUIdx mmu_idx, bool data,
+                                   bool el1_is_aa32);
 
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx);
 int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx);
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index c1f7e8c934b..d7b79a6589b 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -233,7 +233,7 @@ int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg)
             ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
             ARMVAParameters param;
 
-            param = aa64_va_parameters(env, -is_high, mmu_idx, is_data);
+            param = aa64_va_parameters(env, -is_high, mmu_idx, is_data, false);
             return gdb_get_reg64(buf, pauth_ptr_mask(param));
         }
     default:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2297626bfb3..0b7fd2e7e6c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4904,7 +4904,7 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
     unsigned int page_size_granule, page_shift, num, scale, exponent;
     /* Extract one bit to represent the va selector in use. */
     uint64_t select = sextract64(value, 36, 1);
-    ARMVAParameters param = aa64_va_parameters(env, select, mmuidx, true);
+    ARMVAParameters param = aa64_va_parameters(env, select, mmuidx, true, false);
     TLBIRange ret = { };
     ARMGranuleSize gran;
 
@@ -11193,7 +11193,8 @@ static ARMGranuleSize sanitize_gran_size(ARMCPU *cpu, ARMGranuleSize gran,
 }
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
-                                   ARMMMUIdx mmu_idx, bool data)
+                                   ARMMMUIdx mmu_idx, bool data,
+                                   bool el1_is_aa32)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
     bool epd, hpd, tsz_oob, ds, ha, hd;
@@ -11289,6 +11290,16 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         }
     }
 
+    if (stage2 && el1_is_aa32) {
+        /*
+         * For AArch32 EL1 the min txsz (and thus max IPA size) requirements
+         * are loosened: a configured IPA of 40 bits is permitted even if
+         * the implemented PA is less than that (and so a 40 bit IPA would
+         * fault for an AArch64 EL1). See R_DTLMN.
+         */
+        min_tsz = MIN(min_tsz, 24);
+    }
+
     if (tsz > max_tsz) {
         tsz = max_tsz;
         tsz_oob = true;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a89aa70b8b2..69c05cd9dad 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1134,17 +1134,6 @@ static int check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint64_t tcr,
 
     sl0 = extract32(tcr, 6, 2);
     if (is_aa64) {
-        /*
-         * AArch64.S2InvalidTxSZ: While we checked tsz_oob near the top of
-         * get_phys_addr_lpae, that used aa64_va_parameters which apply
-         * to aarch64.  If Stage1 is aarch32, the min_txsz is larger.
-         * See AArch64.S2MinTxSZ, where min_tsz is 24, translated to
-         * inputsize is 64 - 24 = 40.
-         */
-        if (iasize < 40 && !arm_el_is_aa64(&cpu->env, 1)) {
-            goto fail;
-        }
-
         /*
          * AArch64.S2InvalidSL: Interpretation of SL depends on the page size,
          * so interleave AArch64.S2StartLevel.
@@ -1284,7 +1273,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         int ps;
 
         param = aa64_va_parameters(env, address, mmu_idx,
-                                   access_type != MMU_INST_FETCH);
+                                   access_type != MMU_INST_FETCH,
+                                   !arm_el_is_aa64(env, 1));
         level = 0;
 
         /*
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index de067fa7168..62af5693419 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -293,7 +293,7 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                              ARMPACKey *key, bool data)
 {
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
-    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data, false);
     uint64_t pac, ext_ptr, ext, test;
     int bot_bit, top_bit;
 
@@ -355,7 +355,7 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                            ARMPACKey *key, bool data, int keynumber)
 {
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
-    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data, false);
     int bot_bit, top_bit;
     uint64_t pac, orig_ptr, test;
 
@@ -379,7 +379,7 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
 static uint64_t pauth_strip(CPUARMState *env, uint64_t ptr, bool data)
 {
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
-    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data, false);
 
     return pauth_original_ptr(ptr, param);
 }
-- 
2.34.1

