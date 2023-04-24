Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2600169ejm;
        Sun, 23 Apr 2023 22:52:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350a0yJoSWp+fc70/XAo5Y0qq0z0NwGS0qJ6a+qC6cIHmNuoQqmIwDo+RzDo2YQ7TGr/fekg1
X-Received: by 2002:a05:622a:1393:b0:3ef:1af1:135e with SMTP id o19-20020a05622a139300b003ef1af1135emr21125651qtk.44.1682315559015;
        Sun, 23 Apr 2023 22:52:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315559; cv=none;
        d=google.com; s=arc-20160816;
        b=t6CfYRT28rgqOz+Xs0ahHebKppEPs/a6BssaYczzmqoNVkDr9XVjrZSyVTkdeeAWTr
         ldNW5eYBIpXpWXCM1++NmzOW54Bj45hb/LnyZgn0dM6yhLog9q975GpFExsCMMAU+WTp
         kDirKfKIEqezMyGVSVtMpEtfx4deyfqd5MKENapu+RDhX8CfQc5SSF8tlZJ2/cinXbTS
         NGFfdT9fMttpW+GhawAN8PQuESsuawWh8nNM6YlZ0P6zr/RcWY8H/6RVGwo9mg3wD6pK
         mRXH4N/BKS4VgXagLdrFXkXRsn2dTashfrQ53FtdTQYzJFHjbw3unwAOcSnUUfvDuPbs
         3Ywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=k8auTOlyLXqTfCckvUiWN7Zc35mefBco1qqtfpVHTz4=;
        b=Y2M8J0udQZ4l+GB1UauBtUzuvZbxNlOmuDVSDqxRdpQGcZlKr9H/pTTQ6mL4z6iBN8
         EHt4KDG4B0tAjDsc7KgSgLvBzMLMOGTHYl/d5sOz9JElC222B7cMFe8O2Z6G8lNmi8bn
         zg/CSUu8m+YcZqoxtdzcdY1Em2YtkfK6Pf680EEj46Kcvqm9wk6OsxC2umPqmb02x7AI
         SPc3aI0ZNESSfTNw8OWn9YyDvnSbTA94VRjIwfwLMUWikLiX140TcaYxfLKCTDmB6rek
         mxHzjnFx9Rg386qnWzZvE4foQQ6BY39EXZxuKPn/acRpMTVYfIXvttN2luEB4b/WFKEF
         Pnkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yq71wfiI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l1-20020a05622a174100b003e38a52d312si6914844qtk.276.2023.04.23.22.52.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:52:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yq71wfiI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqp5T-0008J8-Nx; Mon, 24 Apr 2023 01:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0x-0006jz-RY
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:45:42 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0I-0005Kf-V9
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:45:25 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so63482565e9.1
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315076; x=1684907076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8auTOlyLXqTfCckvUiWN7Zc35mefBco1qqtfpVHTz4=;
 b=Yq71wfiIl9tZ2CcABXmqp+Jj+f+6FnbojU+FVLL5tX86chUHYpQNq7MNCtwRe1X5hl
 KqqQqIk6VPCgdXJJCp0kWL4uyGY1IWrO9NRJNg1l1Mlj/0Y3qEZSDN90Jy/rM0SSuzbz
 f+jNy4E9eIM3nlrF6ZiFziyd+uOTnsIwDGEB5IEnLVMnOA9MEuSOQBfoKEuUlfcN3Nik
 zDmTeH06BVXZTPNeHRlFjOaiSlZ9ewWo4Mfxl0WkelotEVL/1QbETMAzdq+GY90dKN/J
 alq9stHHHInr0FC1y3BngygMkqeEOOOlQT/+ppaSUI2BvLMT/WXgDOAdkDbk/1ENcJ7V
 aRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315076; x=1684907076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k8auTOlyLXqTfCckvUiWN7Zc35mefBco1qqtfpVHTz4=;
 b=lXsbT64/tsTykyaLc11VwUSs23C3FLgCfbkKo7MQRdkhQ8L6I+mdEhKO/8QghmeQmV
 +lTLUjywmhgNQVDnK950DhVG+cvMOsOhCCGfq1qdGNOn1aPqW/KxyruoH428+Z6KMLp6
 /F9gMus1Fq6X5WPhugre8sMkq1PzubQhJMWYzkCzd6LpC4p84t6MdP5m3epnKtA4UgaH
 ORPwr4vmQnt6XTHfm8o/mXh8B0Z4VPqWmT85pw58hxgVlttCab6CloKqRsUvBRHUaqj8
 8rfTb8+YxdZbVRTfyFVDnGjCc5SpLet6KnMgPgsSFC1uFHHDyOMX9C75O+prABMwuVsi
 rP3w==
X-Gm-Message-State: AAQBX9cim0oKjRfIqSRbKr9ksM5PjaY/fLSo3zWCQ7kc3pUNi4+ER/ZZ
 uO5mCqfcmBixofhDi1lSaiWOqA==
X-Received: by 2002:a1c:7912:0:b0:3f1:94e2:e5bc with SMTP id
 l18-20020a1c7912000000b003f194e2e5bcmr6366520wme.11.1682315076267; 
 Sun, 23 Apr 2023 22:44:36 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 51/57] tcg/mips: Simplify constraints on qemu_ld/st
Date: Mon, 24 Apr 2023 06:40:59 +0100
Message-Id: <20230424054105.1579315-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: UCHAqd6u6MTs

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

