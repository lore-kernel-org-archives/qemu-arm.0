Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54DACD6E52
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:16:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSrU-0000LU-E3; Sat, 30 May 2026 19:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrS-0000IH-Ad
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:58 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrQ-0007ZX-IW
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:58 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-c8585ecdd71so313738a12.0
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182775; x=1780787575; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uBm5qOgpGyxlvax8B3WVuYZhhYjwNRk7YVA60wElJQg=;
 b=iBEYWDWr8ROj87Ekpz3M9/KV2W/T7Au7lgUXdMQ07S+pGTtLq+q0hNvQECyBInkXAG
 sXIhNz4tHAnY0zeF3R6rT2HlcGOjgo4DgcKTg5pQgi91m5pizSCbkCpe78+nr3DG17I6
 LRx/9q+olcvSz8xHyoBNKwry7lr4NlF4ubHjE4BIpvJte6vOrRekGG96n4LZm3rSRG2G
 Hd00zqw/A+CCz1eZ+GVuUs1ZLigeH3Dqw3JgKAu3gxSWXnO45DBlCw+Z/enpyAcCkl+S
 JPEtpE8+HZYnNT0SyHLNu2LTBbF3bWqSE6XKSioynSCMUmTlifMoJVbVpnghXy/yy4Yx
 klPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182775; x=1780787575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uBm5qOgpGyxlvax8B3WVuYZhhYjwNRk7YVA60wElJQg=;
 b=U04vHgZD+uU2uK7ixsaxqyE217VnLWD3tGzJlCWyxIeD45ycf/Lbi6GKPLH/c5/95u
 OIIk3YkfrftisnaA/f0RMgkOkWnXsdu0MlyIg+rR/3FTSBEqP2MIWFaxvUYwi0/0vraQ
 b3Owc33y1TbJ0kujHmLA8UC4grM9T0V3WuKfZJjUAWfA0zpMVNu1lFQTWEhdxQFpT1KZ
 xlh8hlhtKemnlNsB/s82SDygzABC7MwzSyeftMspHMwQ+3ObZWdNo97Uz0RqNTBM/lb4
 S+iTsTWC2IG2991nbyZP3sYItSeOMaL1WWJbPOarqiQmzIXOlnSc6Xm9WM0dUf4zsjLY
 qNKw==
X-Gm-Message-State: AOJu0Yyfnyv501u8pnUNXXLSER7j5qkoBoPw5o0UqfERiGNu+ff0ZRAZ
 d4cveUvuEDhjebSgC2dT2IBiAk9TcjykpY3FuNZ6zYKIx5iitQUFB8bt05Vv8ld81M4=
X-Gm-Gg: Acq92OH0+K9jVFIBvC9CKigdhy3uvpjeKqpMEaRGmVGI44/BC0T16ZQCmW+ev2k058h
 7a2eOUE8s4OnuPoPIUhXGh/fXkG6AnRHhNz/5onrTxfH0HG0GVWgNU3cjA0pc0wCWr0I2Zr5MNy
 l/UNq393wJwAiAJDKk9uySjm65Z8D1acXarK8I1i6n+/ca9RgdffKjvTVz8vp4/et+8GuA0ZNxZ
 yRJKNPlEvpw2f1dQABZ9VmO5NR5TMXSsQJYxx1PcLYfjk6Khkc/mCnl2vxM4rKoKHy/7d2wUjBn
 erE8ae2wYtajRxmt0aw1ir747DQh99LJBf7FJ2aR/+qYuKcb11OoKOfpHLGjRLHmlmRKrrilYY8
 Y+U36i1DkeVnCLOpI4nf0C2PEuiFO6CywV+Xg6SimaSeDeje0M/CMv+IfHsu0JTdUypL/A3P8GC
 ZZ5GU2/TI2seSkMBW7bNyIGSzwiSPt7UwlRZ7wZzg=
X-Received: by 2002:a05:6a20:a114:b0:3a2:dc51:458 with SMTP id
 adf61e73a8af0-3b427f5b717mr5569806637.41.1780182774927; 
 Sat, 30 May 2026 16:12:54 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c857729d3d1sm5634356a12.21.2026.05.30.16.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:12:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 24/41] target/arm: Enable FEAT_SME_LUTv2 for -cpu max
Date: Sat, 30 May 2026 16:12:12 -0700
Message-ID: <20260530231229.400441-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530231229.400441-1-richard.henderson@linaro.org>
References: <20260530231229.400441-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 3 files changed, 3 insertions(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 1c0c404b7c..06c14e82ea 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -222,6 +222,7 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
     GET_FEATURE_ID(aa64_faminmax, ARM_HWCAP2_A64_FAMINMAX);
     GET_FEATURE_ID(aa64_fpmr, ARM_HWCAP2_A64_FPMR);
     GET_FEATURE_ID(aa64_lut, ARM_HWCAP2_A64_LUT);
+    GET_FEATURE_ID(aa64_sme2p1_lutv2, ARM_HWCAP2_A64_SME_LUTV2);
     GET_FEATURE_ID(aa64_f8cvt, ARM_HWCAP2_A64_F8CVT |
                                ARM_HWCAP2_A64_F8E4M3 |
                                ARM_HWCAP2_A64_F8E5M2);
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index b48dd01a2c..e466ab5b8a 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1389,6 +1389,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64SMFR0, F64F64, 1);   /* FEAT_SME_F64F64 */
     t = FIELD_DP64(t, ID_AA64SMFR0, I16I64, 0xf); /* FEAT_SME_I16I64 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SMEVER, 2);   /* FEAT_SME2p1 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, LUTv2, 1);    /* FEAT_SME_LUTv2 */
     t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
     SET_IDREG(isar, ID_AA64SMFR0, t);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 470f7d891e..41fa9bfca3 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -160,6 +160,7 @@ the following architecture extensions:
 - FEAT_SME_F16F16 (Non-widening half-precision FP16 arithmetic for SME2)
 - FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
+- FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
 - FEAT_SVE (Scalable Vector Extension)
 - FEAT_SVE_AES (Scalable Vector AES instructions)
 - FEAT_SVE_B16B16 (Non-widening BFloat16 arithmetic for SVE2)
-- 
2.43.0


