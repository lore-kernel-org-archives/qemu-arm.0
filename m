Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8D2CDB479
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 01:54:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcZGK-0004w1-7L; Wed, 24 Jun 2026 21:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcZGF-0004sl-DR
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 21:52:11 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcZGD-0008VH-SA
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 21:52:11 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2c0b9328c4aso9621725ad.0
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 18:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782352328; x=1782957128; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w7sch0aXO9sSrSQo97ZaQHXFizG0XuXDtfv+0zk4Dj8=;
 b=peYgqFCMqnBLQXRxJFVjyICRoXX5H3Uww5Yodxxqer8wbPAJoUKjPxXMT0emh8bfJE
 raeUvimhkOB7dq+fjtc0+469g6gW2wlj/bRgtwv+VheIyL94P9GR8v+mfICkkuaKCU7Q
 BA7yaq/AMOdvmo3RPNUU8dezOwwIw/F4luZD2cCOaol0/3y601G9KDk4eynO/dgrh3oP
 f7gbwsgtiHSF7LOtnDwJVLnaPZAUvYGvvvAlg0dsYL7r7wI22QF25dNJx7KtG2ENUpRE
 O5gItNZ1kZum3ZOc6jQEdkQnODso11TtqplSPpbFzf3ovoi+aNIjDF825rHzPypSt5s+
 vjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782352328; x=1782957128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=w7sch0aXO9sSrSQo97ZaQHXFizG0XuXDtfv+0zk4Dj8=;
 b=iXISK5mz3HGLoNkhQ9vkeXJSy2d1+gtDkio6qg/fSqpr2nuSHsTzUedIJF3HMgnHd6
 novV9E+/zo+ryQC073FFfLEqge137HYep7XY47l1gOiIxjc4RzqVYJ+t8A1uiXxF1pjd
 VeDi8uT1QLsvqVopWeQuc5vx3/fSzPqMuiTM/XZUN3uNdjmOWx7WOZHNd7oMjIL6xxUP
 GvAwhpsCvkXKsYsPknK1XfyWop4jqG4aiV6oF1EJ+b3BIG0Tw40jeMnWPPmj/M/YkVHg
 ZovuM27i10raN/MAsaenmsy1hSsk+BdksxUxnLzhnfrW99u57KAkFiXynqj78MawDYWu
 yYew==
X-Gm-Message-State: AOJu0YzFbFk5IHEJd1h/Ny+ba8rPqNCQNWU6YDRva8Io8/FwFUaXDrEW
 l44UhLmdeyRd/AxxQqaWSDjfSEq2axzTRUQEAeAh+S9Qy/qYPbMqx27trAXlDY6SQ4a0WIqA3sE
 +j8FF
X-Gm-Gg: AfdE7cmnVcRI3FwsWFCTu1rw4xun4Zc358ol1W02ClsKvJnZc8NAeVMih0DkzRJhqoF
 O0eotKBTTFGncBJHpL/qUg4T0yCxEjozAL9BNorBbv61iutwBltOL7ToQIqBLzM6PWjHUUOndV8
 YHEBMlOgbx9JnGDuR4cqak1pQbPBB1QYVcnLSorcbGh0tD8vO8Z3I+z0mEpm/+LJjvL8vlYWgmk
 bXieSd03qq8M6jS5jnfri7n0hwuPxYRfT8MkApn/SJRItCGYNRwr0w4BovaAPWBsWIihr2F7p0T
 18cER0zZrekjBZQ0j54+KsAGLAXnhP7rPkeLPww7ls/33o4NY2Eh/95zG30KMKrLIMuAF1d2fCn
 sOSGSOw1cG69g9RTAEm5SVbfoSzlllQ4gzyEJzHyS8NqQ7p5hxNCqU/5oIBud+JX25VMUT54oBs
 8qYFS503EXIbQdVhCG8GLI9K2M7CeoxMoYO1wL8bOcbfavE5q1gw==
X-Received: by 2002:a17:902:f644:b0:2bf:211c:4980 with SMTP id
 d9443c01a7336-2c7fc8b106fmr6662345ad.35.1782352328271; 
 Wed, 24 Jun 2026 18:52:08 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7f5ac8908sm9060635ad.8.2026.06.24.18.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 18:52:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/10] target/arm: Enable FEAT_SME_F8F16 for -cpu max
Date: Wed, 24 Jun 2026 18:51:58 -0700
Message-ID: <20260625015159.719300-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625015159.719300-1-richard.henderson@linaro.org>
References: <20260625015159.719300-1-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 3 files changed, 3 insertions(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 20b9838520..42aeb29306 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -236,6 +236,7 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
     GET_FEATURE_ID(aa64_ssve_f8dp4, ARM_HWCAP2_A64_SME_SF8DP4);
     GET_FEATURE_ID(aa64_ssve_f8dp2, ARM_HWCAP2_A64_SME_SF8DP2);
     GET_FEATURE_ID(aa64_sme_f8f32, ARM_HWCAP2_A64_SME_F8F32);
+    GET_FEATURE_ID(aa64_sme_f8f16, ARM_HWCAP2_A64_SME_F8F16);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index e9eda8fbf1..42bff58e76 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1393,6 +1393,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64SMFR0, F16F32, 1);   /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64SMFR0, I8I32, 0xf);  /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64SMFR0, F8F32, 1);    /* FEAT_SME_F8F32 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, F8F16, 1);    /* FEAT_SME_F8F16 */
     t = FIELD_DP64(t, ID_AA64SMFR0, F16F16, 1);   /* FEAT_SME_F16F16 */
     t = FIELD_DP64(t, ID_AA64SMFR0, B16B16, 1);   /* FEAT_SME_B16B16 */
     t = FIELD_DP64(t, ID_AA64SMFR0, I16I32, 5);   /* FEAT_SME2 */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index a3a1607ff9..7b85ec6146 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -169,6 +169,7 @@ the following architecture extensions:
 - FEAT_SME_FA64 (Full A64 instruction set in Streaming SVE mode)
 - FEAT_SME_F16F16 (Non-widening half-precision FP16 arithmetic for SME2)
 - FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
+- FEAT_SME_F8F16 (SME2 ZA-targeting FP8 multiply-accumulate, dot product, and outer product to half-precision instructions)
 - FEAT_SME_F8F32 (SME2 ZA-targeting FP8 multiply-accumulate, dot product, and outer product to single-precision instructions)
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
-- 
2.43.0


