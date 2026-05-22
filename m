Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6332FCD5BB3
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:11:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQXz3-0000gm-1D; Fri, 22 May 2026 18:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxt-0007kv-4P
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:36 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxo-0008GI-Km
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:31 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-366330b6751so6133396a91.1
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487405; x=1780092205; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJncXQdI40tUDui4jfOpY7wY6z/VL6EnB2oOLxS1dCg=;
 b=utauFvTRgfE4pRQ006qkNGv5DZy4g1jmA7QIcDnFAj2K1/tBukU6pzP+Bhac1FhrcY
 jFnO1mdOEX/3YUxcZaUpzz2QHdn/WkUfCV+72dT+ETVDe2ngbW+BVVEP3DVPM51nd3EV
 QL7V1uaFYG650xGp5/PNYWJmucp+q7ub30ZUkbIDzgk63EIcit0kkVWywY0RrNSlH1O/
 jAo0QAnkDdVl0pFYmUz9KC8mTAj2FZPlRzXU48dWMD5ICRhFljJ3dI/BJhIvTy3bYbqJ
 O9Qpful0X+d8yz2YPKl+Uu8exokOiH2tue1jDdlzmcWbMOjTIY5Ml2U/OwTRxgjqyuhw
 PlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487405; x=1780092205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CJncXQdI40tUDui4jfOpY7wY6z/VL6EnB2oOLxS1dCg=;
 b=XYjevnvlTWTi8JNk69eaM3adiDbiZ++FK6APvmWtMJ70m9UZgGr2OgPSSThfsct8pm
 haSBJq2B0G4TahwQeVLF+xgBfIqe3VK3KB6eCoF6PHf9VIVyqu/QKjFwb9J8mS+ZzADW
 ANp+qSoqU0xZLVA+mj/mQfAZb0Oj4Fq5ZlcWKm6WEQN1tqmyFOBpniJ0YM6jVi7u85FH
 OnGb4NmMcLV8SVrG4Fw/Akl+b9euWX19REA/Gc/Svj4Spg0E82TxqTfiX+PxS2TQ9y7U
 aIBdQU7RB0Rsp8fAP9nMs0dYvoOf2YnAMTjcfjtj18hLW2rQngPnnnRPZmMNp8MlsEJA
 qVXg==
X-Gm-Message-State: AOJu0Yw8v4eztMTUteUEgUUdlh7Sy9H0cLF9gpBkGQ4Pt3hWc4w9Sc/h
 +SPjub9GAamVDLpaVcQoODfKUzq0ThVTtyc+tz0bCBw3hH0C39TS3TviqKlSYHhgvV4=
X-Gm-Gg: Acq92OFrnMFQS6jT6nof0buJL8WhcOtWbTLrekZTN8uO+5/vP7Ee6cNx3SZ90ykt41f
 /L1JnZyS58ZBQHIhfKxe23snqn97NE8Gk3OMPywws34wjM0MAYw7Z25qPyq2doIu7YQnyrjNGX/
 155HYvBeyKl8kdDpXL7JKVSeXzsIbs4KbFspPsDUEfakMfyD6/veNS/gs8YgUKjhXErUz0++W39
 gf7SStziSYd5ZScQqr3FWQh7KEjdKFwfjS2AlZlfnDXi1xcOIVNOZGCLxeUQAaSnyF/P5GJ+pG2
 brqP3BRkJRzymNZCdRX0E4SxnOHv+hqaaEMZr18YZcXxnN82PhUew4Y6fFi5o6pRWp61p/1mpex
 PjoCjtTUXaJKEldMUxSP+sE+n3wB/qIHas0e78p4k6yr1xLiRERi1poVhyi9CPjtIG8oUtLI2Z8
 GTG5tSo9pTpYnFtvxePjEDjMDR6WJi
X-Received: by 2002:a17:90b:48c1:b0:35f:c729:de9b with SMTP id
 98e67ed59e1d1-36a677f44b2mr5682455a91.20.1779487405383; 
 Fri, 22 May 2026 15:03:25 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a6772f486sm1726789a91.2.2026.05.22.15.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:03:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 17/64] target/arm: Enable FEAT_FPMR for -cpu max
Date: Fri, 22 May 2026 15:02:19 -0700
Message-ID: <20260522220306.235200-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/elfload.c  | 1 +
 target/arm/tcg/cpu64.c        | 4 ++++
 docs/system/arm/emulation.rst | 1 +
 3 files changed, 6 insertions(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index c5ffe21368..ceeeee5315 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -219,6 +219,7 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
     GET_FEATURE_ID(aa64_cssc, ARM_HWCAP2_A64_CSSC);
     GET_FEATURE_ID(aa64_lse128, ARM_HWCAP2_A64_LSE128);
     GET_FEATURE_ID(aa64_faminmax, ARM_HWCAP2_A64_FAMINMAX);
+    GET_FEATURE_ID(aa64_fpmr, ARM_HWCAP2_A64_FPMR);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index ff0c2b1c47..a377f67b9c 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1297,6 +1297,10 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR1, GCS, 1);       /* FEAT_GCS */
     SET_IDREG(isar, ID_AA64PFR1, t);
 
+    t = GET_IDREG(isar, ID_AA64PFR2);
+    t = FIELD_DP64(t, ID_AA64PFR2, FPMR, 1);      /* FEAT_FPMR */
+    SET_IDREG(isar, ID_AA64PFR2, t);
+
     t = GET_IDREG(isar, ID_AA64MMFR0);
     t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index da5f7efce2..e44b3016be 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -77,6 +77,7 @@ the following architecture extensions:
 - FEAT_FPAC (Faulting on AUT* instructions)
 - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
 - FEAT_FPACC_SPEC (Speculative behavior of combined pointer authentication instructions)
+- FEAT_FPMR (Floating-point Mode Register)
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
-- 
2.43.0


