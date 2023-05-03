Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2653000ejm;
        Wed, 3 May 2023 00:09:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7BrJ+n+w9znNSJHJPe8aldsW2dc6XqvkY4zHPPR1LEHOemoR8rg7JTLDTWkgbA7GA585FZ
X-Received: by 2002:ac8:5886:0:b0:3ea:c70f:c5f1 with SMTP id t6-20020ac85886000000b003eac70fc5f1mr29464453qta.63.1683097787630;
        Wed, 03 May 2023 00:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097787; cv=none;
        d=google.com; s=arc-20160816;
        b=W2X8adX/MQlCgtHhbLPBeeQzsN0Kf0/c/0PB04p23ubXxp/HTH1/oeUKVFcpc7T8sV
         z5PTnsdF7NAjm+PoLGI8wBpXQG5Sy51OOK+4fOPVxeoGjIZ+Y0z3GEgDMHUzqOlYe9hS
         DnKPa+yOF648D+CGeHLRUDN5fnvEcTo65XSZEg0RBwMGUtN2W5udcQRI/nmBbfDvWQfW
         TkPWLd4n4+pTHaWc2+L46g6ZvzSaKt2KVvraSjljoeZigJtfNhvE0w5taOtPoQFYgWI8
         azKihBCU8t861o9fiVkAM15xYxwC8IAyL4vaCBIWMXUdvmOe/2DYkG2bB60/69c2EJ7G
         hC6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=k8auTOlyLXqTfCckvUiWN7Zc35mefBco1qqtfpVHTz4=;
        b=vBGn+QKMj/J3xXCX1Sr5fR544P4Z3xbdmFg8V7SvDskCHR82mnKLFH8YBls1+SFki1
         2+cykQm8wOc7HCOB3CbC4TWM3nnPJAFZSdHVwRpuls0CJsefJ9Hv6uESsodCVSImwhAt
         Y8g1MtXgGsWkyixUHDe1FivHNQQmIs5/Q4ypX5QdIs8BmX2iNVmZWQMmZpn6vV1TcCsl
         Mst+h3RAzMlgIyXNBE1D17dDTT6LVAOdgg9nYgQVHeUJl4QQ8tkUth+tU14XuD/4FOlD
         D+5OSAi+LsRYCDYJHz/NH/sPqWPL2vacNg9kECTgxLJNplfC3u3YY67pgr3t38WnebSO
         fa/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ozma/VN+";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020a05622a148600b003ef49b66f03si11931085qtx.484.2023.05.03.00.09.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:09:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ozma/VN+";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6Uv-0007Ad-Lk; Wed, 03 May 2023 03:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UM-0006C4-3A
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:01:23 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6U8-0003Bq-B9
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:01:21 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f37a36b713so6982185e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097267; x=1685689267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8auTOlyLXqTfCckvUiWN7Zc35mefBco1qqtfpVHTz4=;
 b=ozma/VN+aTKITo+cGg8rt2aBl+1U1wi2tP6Crk4OHGKBZ1J6BWGa705s8QulUH/eMu
 7WLuoUmcx5gpOIiu0mG/P+SBS7cdSd9y+4y72KneBOOALRzDDRSr4NAAR0PYpH/SxSf5
 4PuSj03hvnqVEMD8Ngdp+OomqSznnZNoc28LBtEJVtDVlsYC4Pu0L9honBX3g+XEHR3R
 J28JSfwihu/hK8sPydajc5U2unjIjX8HLeMx2Jx43X+xeOGHC3hmAjFvAPsvUkeW3Jzk
 6WXVxqV1EgQVoC9wPENtKxEksGovjLtXp1BuxwDBfyC+/i86F7uV3kAuOyk4sZoV4Lhk
 aTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097267; x=1685689267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k8auTOlyLXqTfCckvUiWN7Zc35mefBco1qqtfpVHTz4=;
 b=emOF67yWmKzFl7w6J3/mBmdYy+e40K67JVOeMETxO4htF8Dd0ykD3YONJpwcRgLlPe
 P7v/wikxnznY40GUZzPzJbvlJhgay/dFpojhr1srhHXm+2gBt+VDF6EimX1cjjY0S18G
 l6yZm3Gc/RPt0ps0Yk6KtXYtx5gvjb27gpfrUo4t6dHeApIp4VLGDDmro5DIfmPykuv4
 zH1lhS9MCZWW1RmMzTDJ3v5UWpAs01KFH+ABzyl13z+B0GpemqyHHfK/i0uoA6u1peJC
 msxeepwWCeYWx0UHwqYJRjZaGHp9U7Fu65BGrHGZU9dLz2Hev4mw4ZApqCog8GS6pgoI
 tU8w==
X-Gm-Message-State: AC+VfDzDQt0zCS+5Q8o5KL05JKPzf5wNoTdRv5eSEswql21Hx43FxBhT
 RbetDt1sTALj7fvzjKRI7LMdJkdSJu2ZfrjYWQBmHw==
X-Received: by 2002:a7b:cb8f:0:b0:3f1:885f:2e52 with SMTP id
 m15-20020a7bcb8f000000b003f1885f2e52mr14552889wmi.16.1683097266641; 
 Wed, 03 May 2023 00:01:06 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1ced02000000b003f19b3d89e9sm905035wmh.33.2023.05.03.00.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:01:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 47/54] tcg/mips: Simplify constraints on qemu_ld/st
Date: Wed,  3 May 2023 07:57:22 +0100
Message-Id: <20230503065729.1745843-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Q+WT7DNxn1j7

The softmmu tlb uses TCG_REG_TMP[0-3], not any of the normally available
registers.  Now that we handle overlap betwen inputs and helper arguments,
and have eliminated use of A0, we can allow any allocatable reg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target-con-set.h | 13 +++++--------
 tcg/mips/tcg-target-con-str.h |  2 --
 tcg/mips/tcg-target.c.inc     | 30 ++++++++----------------------
 3 files changed, 13 insertions(+), 32 deletions(-)

diff --git a/tcg/mips/tcg-target-con-set.h b/tcg/mips/tcg-target-con-set.h
index fe3e868a2f..864034f468 100644
--- a/tcg/mips/tcg-target-con-set.h
+++ b/tcg/mips/tcg-target-con-set.h
@@ -12,15 +12,13 @@
 C_O0_I1(r)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
-C_O0_I2(SZ, S)
-C_O0_I3(SZ, S, S)
-C_O0_I3(SZ, SZ, S)
+C_O0_I3(rZ, r, r)
+C_O0_I3(rZ, rZ, r)
 C_O0_I4(rZ, rZ, rZ, rZ)
-C_O0_I4(SZ, SZ, S, S)
-C_O1_I1(r, L)
+C_O0_I4(rZ, rZ, r, r)
 C_O1_I1(r, r)
 C_O1_I2(r, 0, rZ)
-C_O1_I2(r, L, L)
+C_O1_I2(r, r, r)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rIK)
@@ -30,7 +28,6 @@ C_O1_I2(r, rZ, rN)
 C_O1_I2(r, rZ, rZ)
 C_O1_I4(r, rZ, rZ, rZ, 0)
 C_O1_I4(r, rZ, rZ, rZ, rZ)
-C_O2_I1(r, r, L)
-C_O2_I2(r, r, L, L)
+C_O2_I1(r, r, r)
 C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, rZ, rZ, rN, rN)
diff --git a/tcg/mips/tcg-target-con-str.h b/tcg/mips/tcg-target-con-str.h
index e4b2965c72..413c280a7a 100644
--- a/tcg/mips/tcg-target-con-str.h
+++ b/tcg/mips/tcg-target-con-str.h
@@ -9,8 +9,6 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
-REGS('L', ALL_QLOAD_REGS)
-REGS('S', ALL_QSTORE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 695c137023..5ad9867882 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -176,20 +176,6 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define TCG_CT_CONST_WSZ  0x2000   /* word size */
 
 #define ALL_GENERAL_REGS  0xffffffffu
-#define NOA0_REGS         (ALL_GENERAL_REGS & ~(1 << TCG_REG_A0))
-
-#ifdef CONFIG_SOFTMMU
-#define ALL_QLOAD_REGS \
-    (NOA0_REGS & ~((TCG_TARGET_REG_BITS < TARGET_LONG_BITS) << TCG_REG_A2))
-#define ALL_QSTORE_REGS \
-    (NOA0_REGS & ~(TCG_TARGET_REG_BITS < TARGET_LONG_BITS   \
-                   ? (1 << TCG_REG_A2) | (1 << TCG_REG_A3)  \
-                   : (1 << TCG_REG_A1)))
-#else
-#define ALL_QLOAD_REGS   NOA0_REGS
-#define ALL_QSTORE_REGS  NOA0_REGS
-#endif
-
 
 static bool is_p2m1(tcg_target_long val)
 {
@@ -2232,18 +2218,18 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_qemu_ld_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O1_I1(r, L) : C_O1_I2(r, L, L));
+                ? C_O1_I1(r, r) : C_O1_I2(r, r, r));
     case INDEX_op_qemu_st_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O0_I2(SZ, S) : C_O0_I3(SZ, S, S));
+                ? C_O0_I2(rZ, r) : C_O0_I3(rZ, r, r));
     case INDEX_op_qemu_ld_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L)
-                : TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, L)
-                : C_O2_I2(r, r, L, L));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r)
+                : TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, r)
+                : C_O2_I2(r, r, r, r));
     case INDEX_op_qemu_st_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(SZ, S)
-                : TARGET_LONG_BITS == 32 ? C_O0_I3(SZ, SZ, S)
-                : C_O0_I4(SZ, SZ, S, S));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(rZ, r)
+                : TARGET_LONG_BITS == 32 ? C_O0_I3(rZ, rZ, r)
+                : C_O0_I4(rZ, rZ, r, r));
 
     default:
         g_assert_not_reached();
-- 
2.34.1

