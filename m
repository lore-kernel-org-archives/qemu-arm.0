Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp449642ejb;
        Tue, 31 Oct 2023 10:37:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPKDVlPoLkW8E95zLBi7tBy4AR/2q3zDc3GeGhN6WMMvJtlrsIq8Y3i9t4DYniM6eiIGmc
X-Received: by 2002:a05:620a:3954:b0:775:7996:3431 with SMTP id qs20-20020a05620a395400b0077579963431mr16603967qkn.52.1698773875592;
        Tue, 31 Oct 2023 10:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698773875; cv=none;
        d=google.com; s=arc-20160816;
        b=VkTzr0mTFSQJf+MgWmMlCRIBlkaj/k/L1dKJ6XauE24hnIy+ZBraAXoZVa5GAwKSHY
         ikLdWBEqjkFjgbA+Yfqt1ravHr0nUjc7VCStV2fAaiHwMVs4uJDDdh6d7NSrOrU1cI/v
         0JUvzzoAosLbkipbSXqP9zU7hv7y4vdWXRRnDocqc3BDFVXLib5wsRfvOmr/0ZIRe3T/
         XY2Eewwwsfuaazmj7SzI29/QyrcvHeya+aBSKl3J+7ApIV5H6TcV+1FrlEWwY6ksB9yY
         gwVPT7VGzXvIdz+rS3PhEIFCcjf1I+Xx2/cBcmq9+uGLn6Gw0YBhei6NYbj3otQ9KBHk
         tZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=PdV1GeFlfaLHBKbxsOWgoRO1D00OQ9VZbqz3Qac7I2E=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=u+LLatND9TcskIgUWaG27Lf8675Rt1jlkunzXo+8ugA4r5t/qYbyclaNKJ+K+lnLpS
         OtwRqmkwOD/l/+8hbuojfe8SLdjB2my1Thw73mPlpD7LeCFk2sKeazKA4PHfmC9ZgLWo
         PS7t3T4s4nkMHaekmWVs+sddARbnTzF7leeHGzyg9RzHoDzZsEsSqW/5/KnK5e+6Ki0Y
         NwqXyVXsayieLfnaU8ra33U4Tkc2pxtvnliaCGmV9BGL2XxKNMr9LjHJlKpgPNV9vD1E
         mJs46nNL62UZiqfBr/ljzCFtIBn/58fj4HvotcMFZmQPRzw7mPA+5KXfT5MGVylEJxgL
         uLPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ixf1gyab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1-20020a05620a248100b007789dcffd6fsi1523843qkn.312.2023.10.31.10.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 10:37:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ixf1gyab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxsgG-0001FI-Cm; Tue, 31 Oct 2023 13:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxsgE-0001EM-K7
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 13:37:31 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxsgC-0008CX-Oe
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 13:37:30 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c50d1b9f22so77184161fa.0
 for <qemu-arm@nongnu.org>; Tue, 31 Oct 2023 10:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698773845; x=1699378645; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PdV1GeFlfaLHBKbxsOWgoRO1D00OQ9VZbqz3Qac7I2E=;
 b=ixf1gyabE4xUIUrUZceSsTbd9o5VwF1hYKjHpiZonLqG4T8gHPMguWrOzZsZAIj2mj
 PPO3a98G6KZmk31TyYxR+f9CylbOnCmddSsr7mKSezOv0I5kRfqXVH7GlwCfQ/Oh50Mn
 +9KEVW76t1uXeLj6QcN+J+SRCSK83yOCLRv8eMIQ1XJlfu05nwrrElhsdIQylZn8efY7
 cii7R05nxUeKjDGrq99rEteQOE+qDmytW8WpWsR4rK8rRqsgttwUvja+UUuRzwME8t3l
 ZpsOJMDFxR1OvSF6z7VMCHGyZQ59FxR5pd/w5rZrQiZQe/l2A8hmZbP32Gv8wWVg2ttd
 BU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698773845; x=1699378645;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PdV1GeFlfaLHBKbxsOWgoRO1D00OQ9VZbqz3Qac7I2E=;
 b=TRWx1hCp2kaYvzfkteFj1xXPeJCCmRtNGHPtqQJYMzRyTos6BlNltQ8llNviexenAJ
 fucGmMkwxM3fZ7salKfDr1lqNB0GRX+SHpHPqlawWL+WfaFYCrDd1SPo8koqNEBn4jkR
 OjLwXP6H+dWCPec8qHcrTj79+ryvcl/IDdHJaYHecc5btD2VDLGlgiI/wMrb5Y+uO13a
 YxQCFZiUxwgWSaFaizX6LQSDnAUfX3s1auaJofo/Uu/BB0hNF++ynhWVXTvGOrv9fGG7
 uqAk360B5s74iNv+8Zytn4J7nDCJfuoVFEIezKs1MJhleUvdzGDwLR7dB8srLBzpFuP8
 Ekiw==
X-Gm-Message-State: AOJu0YxevAcr3wumS7Z24fNDeMsAbcY0FxpVzL2IV5uMN3mpRQ7xW6XN
 5o0Q1izbCQ3jeBhgJxhG+XCOLX7N239WxQdiP6Q=
X-Received: by 2002:a2e:3e1a:0:b0:2bf:ab17:d48b with SMTP id
 l26-20020a2e3e1a000000b002bfab17d48bmr11174988lja.34.1698773845272; 
 Tue, 31 Oct 2023 10:37:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a05600c0a4900b00407460234f9sm2415161wmq.21.2023.10.31.10.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 10:37:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Correctly propagate stage 1 BTI guarded bit in a
 two-stage walk
Date: Tue, 31 Oct 2023 17:37:23 +0000
Message-Id: <20231031173723.26582-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: uJVWGlUWddL5

In a two-stage translation, the result of the BTI guarded bit should
be the guarded bit from the first stage of translation, as there is
no BTI guard information in stage two.  Our code tried to do this,
but got it wrong, because we currently have two fields where the GP
bit information might live (ARMCacheAttrs::guarded and
CPUTLBEntryFull::extra::arm::guarded), and we were storing the GP bit
in the latter during the stage 1 walk but trying to copy the former
in combine_cacheattrs().

Remove the duplicated storage, and always use the field in
CPUTLBEntryFull; correctly propagate the stage 1 value to the output
in get_phys_addr_twostage().

Note for stable backports: in v8.0 and earlier the field is named
result->f.guarded, not result->f.extra.arm.guarded.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1950
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 1 -
 target/arm/ptw.c       | 7 +++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f7224e6f4d9..c837506e448 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1181,7 +1181,6 @@ typedef struct ARMCacheAttrs {
     unsigned int attrs:8;
     unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
     bool is_s2_format:1;
-    bool guarded:1;              /* guarded bit of the v8-64 PTE */
 } ARMCacheAttrs;
 
 /* Fields that are valid upon success. */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 53713e03006..1762b058aec 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3032,7 +3032,6 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
 
     assert(!s1.is_s2_format);
     ret.is_s2_format = false;
-    ret.guarded = s1.guarded;
 
     if (s1.attrs == 0xf0) {
         tagged = true;
@@ -3175,7 +3174,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     hwaddr ipa;
     int s1_prot, s1_lgpgsz;
     ARMSecuritySpace in_space = ptw->in_space;
-    bool ret, ipa_secure;
+    bool ret, ipa_secure, s1_guarded;
     ARMCacheAttrs cacheattrs1;
     ARMSecuritySpace ipa_space;
     uint64_t hcr;
@@ -3202,6 +3201,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
      */
     s1_prot = result->f.prot;
     s1_lgpgsz = result->f.lg_page_size;
+    s1_guarded = result->f.extra.arm.guarded;
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
@@ -3252,6 +3252,9 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     result->cacheattrs = combine_cacheattrs(hcr, cacheattrs1,
                                             result->cacheattrs);
 
+    /* No BTI GP information in stage 2, we just use the S1 value */
+    result->f.extra.arm.guarded = s1_guarded;
+
     /*
      * Check if IPA translates to secure or non-secure PA space.
      * Note that VSTCR overrides VTCR and {N}SW overrides {N}SA.
-- 
2.34.1

