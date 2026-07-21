Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083BAC4452D
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 18:50:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmFWS-0001WS-4H; Tue, 21 Jul 2026 14:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUp-00011w-4f
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:15 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUm-0006dZ-St
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:14 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-3811f512167so11337840a91.3
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 11:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784659631; x=1785264431; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FJWOSYXRXrcK3TYmLUpBxwKeLPW6HbyV5XuewiFAFJI=;
 b=XjUk278oGG2PK3VCQhVJH5mJuJtslJweZxp4VUSdVDiDnMbubCurZT0tupyJGNaFer
 dQ1aa0JqjKobGk1yPfdazB+lF4jovBiv6IunC14ip0uKE+2lKSMnQGh76X2rqMfBNrgy
 dsZy0b3KIiDZdzWr3nO+pezfch2J9aXSDnLAUx6KEPLtzhdFecoU0kdKLkC6SZzRVzzA
 fEJfV/dN38z5R/q+O+dAp9M/3N4nPmnQXUCZJXMgI63hkXjKUsVDoU4dJ1N5I31QRm52
 Q4DerC7GMBcVwd9+nwm7u/TrZpscdnNFqLxP0hyjwrxv7v7dpDe5qBmHnzT14mp/cqah
 ni+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659631; x=1785264431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FJWOSYXRXrcK3TYmLUpBxwKeLPW6HbyV5XuewiFAFJI=;
 b=BYnaEInWjEKv4eEY9RvZjryMLZefH/wRXbfownVxnMInO0alIb7hEhwb/zcLqxAJYO
 LvTpfxPHkR7YBNeoaRGLLsloiMx7/baPAkx9/I331gVhqDz/sMiZwjCb23TC3Yy+5Gun
 8D9ODucj6aI926SiBhNs99jqG8Cv8/S2iMrsIptmNu5/izg+F0e1nk8oQP0FKLtsGvJM
 RHcLewhQgNE/vEAzgkEilcOyfST9cgYTsZqaoXU8nf4KDr4kxFAYfTlbLCz348/+V8X/
 U4+Cg5QlzvkaMoyTm/z3XM254tLqg5n37GRsBQfH9Mflx6CTMid/AwuMVx1ljLJC8Viu
 3OBg==
X-Gm-Message-State: AOJu0Yw6sBkNHZrarzt3omhz+BDTtXQLJpBJX6iBcOp/2x5qvSxBz06f
 HHcIf0sSH8/baDiEjuhoR3Uas3mXK84hGNlxaKF+x/xtw8BqibsE7qWHyU709tx4HaA=
X-Gm-Gg: AR+sD11L8pkHpu+zrOZ4KTTuvbqfuu3TtWN8vInue2l3rm2KoRdcDm/wsuDY7w5GjpI
 JigCwItVSQ3ZAauh9voZgBW4MIOcKd+00x99KuvA8h9GFv5srTh2oSM3U9lbeegIRgEiqifx2WN
 4tHywH1kN3LwHYi2L3QgPwy8A/W1DyOp7eLYPlikVXkicRw4nONKsqa3211/Gf7Q6N3dNwuWPk1
 6usXHCPsqfmpAuSBChT4qZlonDFUsIMePiBuKVgwgMnz8yABuXl/3IqYu5ISUcnixPxvhO6V5g3
 +hhKf2jm9wMz1HCgKV0/bcFqfL0Zd42UT97MvDsv/ar4EOCqJiDuhyvthVMQGIg4db5x0GayJoV
 Qz28ejiE8R6qVFTZAHnLQOuW6lHSdp6PYuqKkxNbju6yvydOi4DG3ZNd/C3wwD77W5QevOZhoA6
 9axYJ9kONr8Ocrvr8mWw==
X-Received: by 2002:a17:90b:5543:b0:382:1aaf:4bab with SMTP id
 98e67ed59e1d1-38e4b516631mr19334867a91.27.1784659631066; 
 Tue, 21 Jul 2026 11:47:11 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce29e340esm41108094c88.5.2026.07.21.11.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:47:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/20] target/arm: Enable FEAT_SVE_BFSCALE for -cpu max
Date: Tue, 21 Jul 2026 11:46:45 -0700
Message-ID: <20260721184656.530230-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721184656.530230-1-richard.henderson@linaro.org>
References: <20260721184656.530230-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/elfload.c  | 1 +
 target/arm/tcg/cpu64.c        | 3 ++-
 docs/system/arm/emulation.rst | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index c086548f7f..bcf2e6b9c1 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -180,6 +180,7 @@ abi_ulong get_elf_hwcap(CPUState *cs)
     GET_FEATURE_ID(aa64_sme_tmop, ARM_HWCAP_A64_SME_STMOP);
     GET_FEATURE_ID(aa64_sve2p2, ARM_HWCAP_A64_SVE2P2);
     GET_FEATURE_ID(aa64_sme2p2, ARM_HWCAP_A64_SME2P2);
+    GET_FEATURE_ID(aa64_sve_bfscale, ARM_HWCAP_A64_SVE_BFSCALE);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 33eafb467d..4a44d148e2 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1370,7 +1370,8 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ZFR0, ELTPERM, 1);   /* FEAT_SVE2p2 */
     t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);   /* FEAT_SVE_BitPerm */
     t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 2);  /* FEAT_BF16, FEAT_EBF16 */
-    t = FIELD_DP64(t, ID_AA64ZFR0, B16B16, 1);    /* FEAT_SVE_B16B16 */
+    /* FEAT_SVE_B16B16, FEAT_SVE_BFSCALE */
+    t = FIELD_DP64(t, ID_AA64ZFR0, B16B16, 2);
     t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);      /* FEAT_SVE_SHA3 */
     t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);       /* FEAT_SVE_SM4 */
     t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);      /* FEAT_I8MM */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 4d33be615f..4c91bb45c8 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -198,6 +198,7 @@ the following architecture extensions:
 - FEAT_SVE (Scalable Vector Extension)
 - FEAT_SVE_AES (Scalable Vector AES instructions)
 - FEAT_SVE_B16B16 (Non-widening BFloat16 arithmetic for SVE2)
+- FEAT_SVE_BFSCALE (BFloat16 Floating-Point Adjust Exponent)
 - FEAT_SVE_BitPerm (Scalable Vector Bit Permutes instructions)
 - FEAT_SVE_PMULL128 (Scalable Vector PMULL instructions)
 - FEAT_SVE_SHA3 (Scalable Vector SHA3 instructions)
-- 
2.43.0


