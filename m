Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp884282ejq;
        Sat, 6 May 2023 00:24:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4j2kmZ+VRX+VfzD/kTgs8j4lXgDs6HTXzsNiG9gICAc54WMiX2ruK6GDOvCqnq0QFAGZot
X-Received: by 2002:ad4:5fcc:0:b0:5f0:23be:a301 with SMTP id jq12-20020ad45fcc000000b005f023bea301mr6005577qvb.5.1683357898981;
        Sat, 06 May 2023 00:24:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683357898; cv=none;
        d=google.com; s=arc-20160816;
        b=HS0DCiChc1mJWL0xj0A7aOkFYQAmdlmC3u7a1Oyt5ww4NCNzihNmCNHYoNw9uyq3bi
         wmQGuMPU9x4JO5LzrGbWmdHcLq+i9Tfh24jRcutVm5Hd/Tr+0+Ee88XwLibIp5wRN2uR
         B8vRCEP9gg0VoBISHShwY6m5GPFlEd4E25KHzl5ENGRUXfp4XISeRZx9Z3vf3C9haCR0
         tacQc0h8I5uh011wnw5RzQFSMfr2IGAxbHwOGw1FP8r4As/dzHYePCqs6k4hxVdCl9Dj
         h/cniK9tdgjrsmpgkthkO3Cwh+aBYWl9ZrWPyH2r4c50o5TxQyaTREqQsmQXHv0LtYGn
         NZ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=M0CeyWjMqe57NR22sbQHD4MYtLkRo2vj3jA4zBvWRdg=;
        b=GXxHRV2XDx7pr/rmSN/YUm3i8Tz1rzeJNiHrNqcD+BZBsLreBaVhyq2sCcHYmlerMH
         ONH6xtlUKj1iH7PCCrqrwFAk6EeaQy6ohaLXXnFBk8eYgdzJE4gXPjugv7V7uP0CrrPQ
         luSpmalc7C4cEfxB+j/IA2XD5hTPiKpQsO4mCfIvM3ufRnWGuuTS6qr0pHR5TmkIT9mu
         Re8aUlVomxzPwwOpXVnmMCZSuqDKwXTElOykCluKrbXkYwJbLoVz0RT2FVj+Gz8h1tXm
         31j6Y31NIjzmDD3PkbEtzVMnCWnB+5l8pO1khXq8k7L2WPCzyhlae+TYxA/5zFQGbCIH
         yW3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jo1c1Ooc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020a0562140e4900b0057717863944si1221225qvc.407.2023.05.06.00.24.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 May 2023 00:24:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jo1c1Ooc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvCGW-0005iq-IP; Sat, 06 May 2023 03:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCGT-0005SK-0N
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:33 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFu-0004Vb-7J
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:32 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fd8so16888315e9.2
 for <qemu-arm@nongnu.org>; Sat, 06 May 2023 00:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357776; x=1685949776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M0CeyWjMqe57NR22sbQHD4MYtLkRo2vj3jA4zBvWRdg=;
 b=Jo1c1OocbpZioobhHwIxjN7vHeowKGFTA35RtHXKEcJ2EX0kVUCgm7eptIQbvUTNLP
 8Sw1voQg0whDbg3xkPLgD6Lk+kMJyqWnKB4Dcb9N0GezG46MbNTik1fB3zQElzbKRAA0
 19eevzWjJHNedrffklD2xmXfLtaKlj0pO3DGo2N4KrqOQNR5uLczrABz0cVcw2A7xC0k
 wMCgkh+at9fYtOEi1YOX5D4GgRgNOrVVsmT1o0g3kOWAj5YPFTbuchUX6wAw3gs8OmR8
 i4kAqj8u3GWLehqvwgCdM49gEhBulFL0MA8FyocCNs19F7684zXHttplvAN+FvXvup9+
 ek1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357776; x=1685949776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M0CeyWjMqe57NR22sbQHD4MYtLkRo2vj3jA4zBvWRdg=;
 b=ig1Ng7dOnY/8S67rB05UHAiZuMfDr3sV9dkTQBM50yZuDzZaONze4Aunqyw0L8/FVI
 cHBKZXVKUHIH8Ork1MnzvlcHuTGlj16bLQSAxJGYZ+7wdU+q0pV/szOSy3g4rUz3IaBP
 yor9nGG4Ygu7hBLObscrNqcd6jYvuF7bZh/chKQe3tA5qelytqk4GeDbGXU9PQ2oVvma
 Z5lgMj5/3BEuC4b9C14fOpYpxhck3IqKCExISqoDfUp7mlO2OH2qqyL4GPwNChjmZdln
 T70O3C/s/qUnQoCjrAbIvpU8u+W0bgY2/z70ruWkEyGNuGFD6NwdZ4PvmSK86BnmaYBy
 NreA==
X-Gm-Message-State: AC+VfDwrBFtsYIp1U11/MSm1WBWoWidCrrzTVtDoxBtEuzKuwejXWA9N
 M15XUoW78fQQ6UMZmufEGugoMw==
X-Received: by 2002:a05:600c:2248:b0:3f3:46d9:4046 with SMTP id
 a8-20020a05600c224800b003f346d94046mr2763963wmm.32.1683357775871; 
 Sat, 06 May 2023 00:22:55 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v5 25/30] tcg/ppc: Adjust constraints on qemu_ld/st
Date: Sat,  6 May 2023 08:22:30 +0100
Message-Id: <20230506072235.597467-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: Iv68Ueq/aWp7

The softmmu tlb uses TCG_REG_{TMP1,TMP2,R0}, not any of the normally
available registers.  Now that we handle overlap betwen inputs and
helper arguments, we can allow any allocatable reg.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-set.h | 11 ++++-------
 tcg/ppc/tcg-target-con-str.h |  2 --
 tcg/ppc/tcg-target.c.inc     | 32 ++++++++++----------------------
 3 files changed, 14 insertions(+), 31 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-set.h b/tcg/ppc/tcg-target-con-set.h
index a1a345883d..f206b29205 100644
--- a/tcg/ppc/tcg-target-con-set.h
+++ b/tcg/ppc/tcg-target-con-set.h
@@ -12,18 +12,15 @@
 C_O0_I1(r)
 C_O0_I2(r, r)
 C_O0_I2(r, ri)
-C_O0_I2(S, S)
 C_O0_I2(v, r)
-C_O0_I3(S, S, S)
+C_O0_I3(r, r, r)
 C_O0_I4(r, r, ri, ri)
-C_O0_I4(S, S, S, S)
-C_O1_I1(r, L)
+C_O0_I4(r, r, r, r)
 C_O1_I1(r, r)
 C_O1_I1(v, r)
 C_O1_I1(v, v)
 C_O1_I1(v, vr)
 C_O1_I2(r, 0, rZ)
-C_O1_I2(r, L, L)
 C_O1_I2(r, rI, ri)
 C_O1_I2(r, rI, rT)
 C_O1_I2(r, r, r)
@@ -36,7 +33,7 @@ C_O1_I2(v, v, v)
 C_O1_I3(v, v, v, v)
 C_O1_I4(r, r, ri, rZ, rZ)
 C_O1_I4(r, r, r, ri, ri)
-C_O2_I1(L, L, L)
-C_O2_I2(L, L, L, L)
+C_O2_I1(r, r, r)
+C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, rI, rZM, r, r)
 C_O2_I4(r, r, r, r, rI, rZM)
diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index 298ca20d5b..f3bf030bc3 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -14,8 +14,6 @@ REGS('A', 1u << TCG_REG_R3)
 REGS('B', 1u << TCG_REG_R4)
 REGS('C', 1u << TCG_REG_R5)
 REGS('D', 1u << TCG_REG_R6)
-REGS('L', ALL_QLOAD_REGS)
-REGS('S', ALL_QSTORE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 6850ecbc80..5a4ec0470a 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -93,18 +93,6 @@
 #define ALL_GENERAL_REGS  0xffffffffu
 #define ALL_VECTOR_REGS   0xffffffff00000000ull
 
-#ifdef CONFIG_SOFTMMU
-#define ALL_QLOAD_REGS \
-    (ALL_GENERAL_REGS & \
-     ~((1 << TCG_REG_R3) | (1 << TCG_REG_R4) | (1 << TCG_REG_R5)))
-#define ALL_QSTORE_REGS \
-    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R3) | (1 << TCG_REG_R4) | \
-                          (1 << TCG_REG_R5) | (1 << TCG_REG_R6)))
-#else
-#define ALL_QLOAD_REGS  (ALL_GENERAL_REGS & ~(1 << TCG_REG_R3))
-#define ALL_QSTORE_REGS ALL_QLOAD_REGS
-#endif
-
 TCGPowerISA have_isa;
 static bool have_isel;
 bool have_altivec;
@@ -3752,23 +3740,23 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_qemu_ld_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O1_I1(r, L)
-                : C_O1_I2(r, L, L));
+                ? C_O1_I1(r, r)
+                : C_O1_I2(r, r, r));
 
     case INDEX_op_qemu_st_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O0_I2(S, S)
-                : C_O0_I3(S, S, S));
+                ? C_O0_I2(r, r)
+                : C_O0_I3(r, r, r));
 
     case INDEX_op_qemu_ld_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L)
-                : TARGET_LONG_BITS == 32 ? C_O2_I1(L, L, L)
-                : C_O2_I2(L, L, L, L));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r)
+                : TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, r)
+                : C_O2_I2(r, r, r, r));
 
     case INDEX_op_qemu_st_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(S, S)
-                : TARGET_LONG_BITS == 32 ? C_O0_I3(S, S, S)
-                : C_O0_I4(S, S, S, S));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(r, r)
+                : TARGET_LONG_BITS == 32 ? C_O0_I3(r, r, r)
+                : C_O0_I4(r, r, r, r));
 
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
-- 
2.34.1

