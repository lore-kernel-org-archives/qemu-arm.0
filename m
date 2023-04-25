Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3721685ejm;
        Tue, 25 Apr 2023 12:45:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZhyfzWx9EZvIIQZPSrtuST8gN6xNMoGENdSUROwoRLDCEgryqiYV5AqsS2kosSmLm2NCCE
X-Received: by 2002:a05:6214:19cb:b0:5f9:ba55:395f with SMTP id j11-20020a05621419cb00b005f9ba55395fmr34840299qvc.52.1682451902632;
        Tue, 25 Apr 2023 12:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451902; cv=none;
        d=google.com; s=arc-20160816;
        b=B9W8DUcazU8J+Gj00MbZ6oJDOoAJ8basINURTC5nAMHbxI0EoCizuxEZc1nuqXbrFw
         /1fVucv4MlMzWA5GzZltE7MKkrwnH085cj/XMJR9DJjqYrQVVmXODrlR5/BpmlFJev2b
         lRzKxceiWTTSyNd9M3FvqZhmMZMFnhN4SemS/JfIjgmThkMi/9iRcbg5yS6nAhmqLbHk
         4z9tUH8RYBtlwWwsqOlKoFA6vVA9U6rOjkr2VYbBrPTejmW9cgGjeOaqFPx5jZWTCG2z
         k+FoZfspOwkbTvuEm0iGDbYeZn4gmNDL4LQCrH0Fl60C0iACJ6v338K2Wc/f1JodjWLT
         QMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YyONh+q6+JPHpqSgz1eedz8qFY8evuyzGRq8DlknugQ=;
        b=MnBBxtf4SIX+CMSX9DWOTKQLMHbvEbwtdv36itwOO2VDy+vkdHkfpvVNzVuX6QVDv2
         od6eakJH2VGfWqvuV0ATLy82Ny+4diRBD/AsBbgN/RznEIKI7rIVsHhZKgjGIt9H1GVv
         +FeXwWlSRGnh8oOjaXKoi/4uwYUK/L5BFyjp9SOLw11WKnzQ2clgnCxt+xQ6tj3+T5A9
         KOI3XNdvLJOuiUOYvyYBd15lX6MIxXzWNc3HkJzZQAeqolyZvvIdAdoVSQlpk16AY4LE
         BErhUv3O/MS3t0fULKCvnIoL2FPQcq7LBC7NKcVgo9CCyr88ZXmXeZBFnnboRE4z/mTF
         4rpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rMKJQysL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd19-20020a056214401300b005ef665a18f7si9144911qvb.429.2023.04.25.12.45.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:45:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rMKJQysL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOS3-0005ug-JW; Tue, 25 Apr 2023 15:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORA-0004I9-Ei
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:52 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOR5-00054A-9E
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:51 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4eff055d4d3so3380491e87.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451285; x=1685043285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YyONh+q6+JPHpqSgz1eedz8qFY8evuyzGRq8DlknugQ=;
 b=rMKJQysLKXuVdE5xNwwzuvY92+k2XiQhe8H+YtNOz5CBLxQotHSxmW7HWBbwvInB4a
 VVz/f79zBmukyRjcvpUNH/7AitUmW8Lp0+pqr81Kox2Os8Wxxu0cS043bbs9DjEfdKgG
 IO3IHFefwXirMV2CoqmGqd4foIggkUhWArdo1guilWiqq83pXL2A7Z8jyuW4/aY82q4q
 EgDAYAyKUwzL5UZdY58pfju+ernZnzywt/HOjWJjSkg66/PdiGhkMzMh4dcH9eSY0BXC
 XZ/cUmyAGAr1DASSHDlf0JKIJUJ8b2lBgah7iMo/FRjMg+RrZtGg2C/UcRcJeeqqf6FI
 zKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451285; x=1685043285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YyONh+q6+JPHpqSgz1eedz8qFY8evuyzGRq8DlknugQ=;
 b=bufnmNKVnO1XkvcZtDew4MgUbKO355eqHM2Ua8k2EMPU3bbRJrblic/Bm47sQl+sPF
 DhnwWKtQP+Unk5kLWldHS8i0O/t1xZt4B+j0EoI58xkbPTG0XubDEv6aTvuyBNlohEui
 sLafiR1uIxSLcAMhT0Q/vlsI+R/J7W8N2PdUG6BHVa21urTfZVGvKgRYqE+PDskFkUIf
 13JG2nmQ3W3O3LVaehPMrLqgu7Zo+Yt/WJRunTdKigY5rJbnnzxwpThtr7v6LXVLWS2V
 Jfe8taR/nxZhj60/SKVcyDd/r5MaQbUYUaQYQ6jf0fwhRG7yWGn7IPy470a1IFUTaz9l
 jE3Q==
X-Gm-Message-State: AAQBX9ecjWmLKJ55rD0FEyZo1Qy9TliW1jzYU3iJ+gXEn6PPcLnHL9Xd
 wHar4GjLDO7R2vr4iCdTrniPp18DoUOmDaujcB4XTg==
X-Received: by 2002:ac2:454c:0:b0:4de:e802:b7e3 with SMTP id
 j12-20020ac2454c000000b004dee802b7e3mr5187676lfm.19.1682451285752; 
 Tue, 25 Apr 2023 12:34:45 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 30/57] tcg/sparc64: Allocate %g2 as a third temporary
Date: Tue, 25 Apr 2023 20:31:19 +0100
Message-Id: <20230425193146.2106111-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12f.google.com
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
X-TUID: Mv/IK6wpQ1jH

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index e997db2645..64464ab363 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -83,9 +83,10 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 32)
 #define ALL_QLDST_REGS       (ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
 
-/* Define some temporary registers.  T2 is used for constant generation.  */
+/* Define some temporary registers.  T3 is used for constant generation.  */
 #define TCG_REG_T1  TCG_REG_G1
-#define TCG_REG_T2  TCG_REG_O7
+#define TCG_REG_T2  TCG_REG_G2
+#define TCG_REG_T3  TCG_REG_O7
 
 #ifndef CONFIG_SOFTMMU
 # define TCG_GUEST_BASE_REG TCG_REG_I5
@@ -110,7 +111,6 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_I4,
     TCG_REG_I5,
 
-    TCG_REG_G2,
     TCG_REG_G3,
     TCG_REG_G4,
     TCG_REG_G5,
@@ -492,8 +492,8 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg)
 {
-    tcg_debug_assert(ret != TCG_REG_T2);
-    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
+    tcg_debug_assert(ret != TCG_REG_T3);
+    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T3);
 }
 
 static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
@@ -885,10 +885,8 @@ static void tcg_out_jmpl_const(TCGContext *s, const tcg_insn_unit *dest,
 {
     uintptr_t desti = (uintptr_t)dest;
 
-    /* Be careful not to clobber %o7 for a tail call. */
     tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_REG_T1,
-                     desti & ~0xfff, in_prologue,
-                     tail_call ? TCG_REG_G2 : TCG_REG_O7);
+                     desti & ~0xfff, in_prologue, TCG_REG_T2);
     tcg_out_arithi(s, tail_call ? TCG_REG_G0 : TCG_REG_O7,
                    TCG_REG_T1, desti & 0xfff, JMPL);
 }
@@ -1856,6 +1854,7 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_O6); /* stack pointer */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_T1); /* for internal use */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_T2); /* for internal use */
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_T3); /* for internal use */
 }
 
 #define ELF_HOST_MACHINE  EM_SPARCV9
-- 
2.34.1

