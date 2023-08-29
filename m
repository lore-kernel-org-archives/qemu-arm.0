Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3990355ejc;
        Tue, 29 Aug 2023 16:27:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW15KubZbQlElt9F56xrYsdNfhWV6Lc7/wZnhbSzIuNRYAv0zz/+qtpnCjNKpO/rXVjfhg
X-Received: by 2002:a05:620a:d88:b0:76c:4388:faa7 with SMTP id q8-20020a05620a0d8800b0076c4388faa7mr517126qkl.4.1693351633115;
        Tue, 29 Aug 2023 16:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693351633; cv=none;
        d=google.com; s=arc-20160816;
        b=F4DGQPrkWDxd6DCBO6OmuxNLRuGloL7VAHiz1ruv/hDDuakHGEAQssDIpmPJ/eQAlD
         4QeRwPCsw+0YIkuffnSEQNZzrO47iSI5CMXvJZbVg9KYi1oa2hHl5CUblCMdI+Nu6EBY
         EAFEsxbaAJt7qfgcmJ71tOdSuRCfwQfDKjb+O5exS5YnVFthOJogQAibas4uTBVAxysr
         9oI8fmXIULy/kkVW1nz+ckw661WttVFjpizNnLFLktpCO5vCvdpXP/rW+qYXlGqJarfA
         QEKJKJEl8iYR/x4po1rwKWit6mJB21uqYgRW/4UA6U/C70b6HYeko2eJYYqvlJSYhCoq
         SifQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Tz0aWUu/vHl+1ntPEUMfK/rYoMDJR4BjrdL+Cy/mdVs=;
        fh=L6OjQZ2TPsHFQEGPRBuboSqhQBavDZ5pPqlyX67xn3A=;
        b=LsIwmGyfEEA29ULx/mLV9cDh+0DecONabO8SG2mQdFtWP90KcJ1p7G1FBn/e44BZ+G
         Bzk21lMPowzplh7S+5UN5OJirWsv7HrVUo5YrBL9DeS4jI87/vW4+Snt/tWapJsPRrSB
         CMxR7cSHUiGklAAVZtJHbaUc5MNz0OVRrr35p3Q/bQ1yhu15AnIa3PUujdhcLU4MZi8q
         4xIdi0N+rq1Dx1oEVU/lY6521vK1TMPHX42HtKaV6v+KH6dgoa6Q1ZXNwayeoKSbYfYK
         YBZGvLzEKzqlItFYMtGjmi6jBGGD8aNBk8cKaLhudIGhnUHPeYiQBYTD7xbZjKynhoRp
         LW0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m6n/TpIp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rb9-20020a05620a8d0900b00767f7a380d6si6686136qkn.27.2023.08.29.16.27.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 16:27:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m6n/TpIp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qb83s-00042t-Jk; Tue, 29 Aug 2023 19:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb83r-0003qC-1p
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 19:23:51 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb83l-0001NK-3l
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 19:23:50 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1c0ecb9a075so19957215ad.2
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 16:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693351423; x=1693956223; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tz0aWUu/vHl+1ntPEUMfK/rYoMDJR4BjrdL+Cy/mdVs=;
 b=m6n/TpIpbBGNBQuAUKMsHJ23fngCD5iKz2R34+H/gyI8U3PL6yS67MHbC4P/Yy42zf
 hfuEfuV+o8Y+ekBQLOndgbb6i4puKzsRv9gD8iAcoSF5n1fm6bXr7VN8EO6XJY84UEFW
 PBMbpty6vScIR284vl7AkzGz4NdxbK/sQTXtAkvDrTgECzBzbjBbL5UkoaiJmgvxoaRn
 mEl1E2avZwPBgwqwq8HWExlcYhDC3vZ4YRlWMKFF0mM00R9hG4mT/YO0HrTxQguQ10AN
 bGHCJvFOstoq3cRdQvmoTWS+NDT6JU9Hya7JYofzMxgheSouT2Qdv0eWz2yl24yQqUti
 NQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693351423; x=1693956223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tz0aWUu/vHl+1ntPEUMfK/rYoMDJR4BjrdL+Cy/mdVs=;
 b=Zbz9Y/4se6/z2BOVb+NGwylaYf3NuggN+jQyPdQGuG/cYMN/egLTS1g/iuF2ro4vWv
 4CAdU3yopMXdjhpoH1S3MmlHj41Y1RL5xDBi0mOFjL01pON2WDQxTQe+Zlu1j5ebhV3e
 2TAX1nfpjhuUbLu4B+zejzFa+kxQXW9t/qafp8cSx2/QGrg1yi4ewradzrrBRDuBmfxY
 OXl9m8I9sz6nwQ6McllwHB96mOgzWtmheOGv24w0SkD0z58EscfyLEd6R/Yv6v+Pkt+h
 C/zcH3Vq+Gc6XnU+q76rm0a9jocH4KYaw8Xgwa0MndR5vbhgpjnKpbi/qVo6ylRRRkyj
 dyHQ==
X-Gm-Message-State: AOJu0Yz1KYHGgpxd47XyZTV4HZMeWqQd1oc7ghPfo/o2pJyJqK9RqYtg
 o0cR8l4pkqz4TIxZ4QDKj86AdQ==
X-Received: by 2002:a17:903:11d1:b0:1b8:78e:7c1 with SMTP id
 q17-20020a17090311d100b001b8078e07c1mr585119plh.51.1693351423715; 
 Tue, 29 Aug 2023 16:23:43 -0700 (PDT)
Received: from stoup.. ([71.212.131.115]) by smtp.gmail.com with ESMTPSA id
 t9-20020a170902e84900b001b9dadf8bd2sm9829970plg.190.2023.08.29.16.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 16:23:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: aaron@os.amperecomputing.com, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 07/12] target/arm: Implement FEAT_Pauth2
Date: Tue, 29 Aug 2023 16:23:30 -0700
Message-Id: <20230829232335.965414-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230829232335.965414-1-richard.henderson@linaro.org>
References: <20230829232335.965414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: mlc2wEZlYDJA

From: Aaron Lindsay <aaron@os.amperecomputing.com>

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230609172324.982888-6-aaron@os.amperecomputing.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/tcg/cpu64.c        |  2 +-
 target/arm/tcg/pauth_helper.c | 21 +++++++++++++++++----
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 4866a73ca0..54234ac090 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -63,6 +63,7 @@ the following architecture extensions:
 - FEAT_PAN2 (AT S1E1R and AT S1E1W instruction variants affected by PSTATE.PAN)
 - FEAT_PAN3 (Support for SCTLR_ELx.EPAN)
 - FEAT_PAuth (Pointer authentication)
+- FEAT_PAuth2 (Enhacements to pointer authentication)
 - FEAT_PMULL (PMULL, PMULL2 instructions)
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 85bf94ee40..d3be14137e 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -758,7 +758,7 @@ void aarch64_max_tcg_initfn(Object *obj)
 
     t = cpu->isar.id_aa64isar1;
     t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);      /* FEAT_DPB2 */
-    t = FIELD_DP64(t, ID_AA64ISAR1, APA, PauthFeat_EPAC);
+    t = FIELD_DP64(t, ID_AA64ISAR1, APA, PauthFeat_2);
     t = FIELD_DP64(t, ID_AA64ISAR1, API, 1);
     t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);    /* FEAT_JSCVT */
     t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);     /* FEAT_FCMA */
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index 63e1009ea7..b6aeb90548 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -353,7 +353,9 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
      */
     test = sextract64(ptr, bot_bit, top_bit - bot_bit);
     if (test != 0 && test != -1) {
-        if (pauth_feature == PauthFeat_EPAC) {
+        if (pauth_feature >= PauthFeat_2) {
+            /* No action required */
+        } else if (pauth_feature == PauthFeat_EPAC) {
             pac = 0;
         } else {
             /*
@@ -368,6 +370,9 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
      * Preserve the determination between upper and lower at bit 55,
      * and insert pointer authentication code.
      */
+    if (pauth_feature >= PauthFeat_2) {
+        pac ^= ptr;
+    }
     if (param.tbi) {
         ptr &= ~MAKE_64BIT_MASK(bot_bit, 55 - bot_bit + 1);
         pac &= MAKE_64BIT_MASK(bot_bit, 54 - bot_bit + 1);
@@ -394,18 +399,26 @@ static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                            ARMPACKey *key, bool data, int keynumber)
 {
+    ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
     ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data, false);
+    ARMPauthFeature pauth_feature = cpu_isar_feature(pauth_feature, cpu);
     int bot_bit, top_bit;
-    uint64_t pac, orig_ptr, test;
+    uint64_t pac, orig_ptr, cmp_mask;
 
     orig_ptr = pauth_original_ptr(ptr, param);
     pac = pauth_computepac(env, orig_ptr, modifier, *key);
     bot_bit = 64 - param.tsz;
     top_bit = 64 - 8 * param.tbi;
 
-    test = (pac ^ ptr) & ~MAKE_64BIT_MASK(55, 1);
-    if (unlikely(extract64(test, bot_bit, top_bit - bot_bit))) {
+    cmp_mask = MAKE_64BIT_MASK(bot_bit, top_bit - bot_bit);
+    cmp_mask &= ~MAKE_64BIT_MASK(55, 1);
+
+    if (pauth_feature >= PauthFeat_2) {
+        return ptr ^ (pac & cmp_mask);
+    }
+
+    if ((pac ^ ptr) & cmp_mask) {
         int error_code = (keynumber << 1) | (keynumber ^ 1);
         if (param.tbi) {
             return deposit64(orig_ptr, 53, 2, error_code);
-- 
2.34.1

