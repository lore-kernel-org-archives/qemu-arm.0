Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp708931ejl;
        Wed, 15 May 2024 08:00:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWBZnP+4eS7BYNNC0vGidEpbrHWksPhhhhd48El8vTkBFFfID84KoRamcrsK2lK+xiuXkzAGS8XglupRlJnTu54G1nwERKn
X-Google-Smtp-Source: AGHT+IFB7alt7zql0UQLRm0ZYkeAbXeT9+davLs4dT6JQXlCe6kjVvjurmf4a4hbdphOHqujV/lB
X-Received: by 2002:a05:620a:2708:b0:792:cce6:cef8 with SMTP id af79cd13be357-792cce6cf7amr1834125485a.25.1715785212371;
        Wed, 15 May 2024 08:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715785212; cv=none;
        d=google.com; s=arc-20160816;
        b=1Ivn/OMm6UV8a7Tv7QyMJaabEIa7l+h/GA8u8emR2lyOl4CcekT8Fd+0Tf4QwvlMdA
         6v4ibkkhGKFShCQDLr8Wu4W5S3f16/cZwPb/HgSXtvY+dA04AE1cj+r8CH1kmrWlrjIP
         LPzwshHHLfvQ2FHccsCzYws+/LqVllhzNFySxOeV/8qrPP4Xtm3I+B6cMpe2qf3rgyp7
         rYGrCmXVemBNDqCNqqsG8ZP9o1l3viV8PTMh9IinG3N9jto06aNT2DjohNZriKUAzO9A
         HF1wihAbTgWROUN5U2tZ0nCOr8mHAawbYNo48FNiGsmhXkiXtCNlEeYxzqahcqSSDPGN
         3L0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WpiThysDuX7JPl+AhNyZ7t+FQuyygOMAjCR+jn6zrYU=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=0X4W7jOUiC/Y/ghPyXR/yFq+pBVYU8+NK4YJJf/YEH9dPx4SceCyJzis4K/ceLqLdG
         JdJEIZw4nnZJlpWALeJje62HpZ8dtFrmUvEDNQwqMgtVo/Nb5zOkNMqNAAdQhTdhDirj
         mFFFf7GLl5J0V7+PCSs3fl/vW0g3jN+9q5zCDJYux6TUymWaLtyXUuBPx2zxKjzPwPY9
         wkwhY8fQeqEnrW3N7BM0qpVNFYXCSXQ/ivibHgItWLcrHjOjaXLVKkqdBCy6pQXHjdgA
         jy5YaaORz10bMzaCc44YhVS6b6ufHI1TIYTlKmpWklj7C79nIfeeCGtMql7SosAe0BUU
         vUFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VAj7sfll;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792f1f51c36si326420485a.702.2024.05.15.08.00.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2024 08:00:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VAj7sfll;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s7G6F-0005H0-2w; Wed, 15 May 2024 10:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s7G68-0005EH-KH
 for qemu-devel@nongnu.org; Wed, 15 May 2024 10:59:17 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s7G5x-00079t-Iq
 for qemu-devel@nongnu.org; Wed, 15 May 2024 10:59:16 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-420180b58c3so23928165e9.2
 for <qemu-devel@nongnu.org>; Wed, 15 May 2024 07:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715785144; x=1716389944; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WpiThysDuX7JPl+AhNyZ7t+FQuyygOMAjCR+jn6zrYU=;
 b=VAj7sfll52bIq08uflTWutQGWAiqZlQkktxno/BnZ8fC1s7YkFZdxhFFn1JtEnvMJj
 EMxcARCwNI0cWeRFm9HBLHAMaJJp6M4vxuaBTvB3RhybZ83WdyJJ9vGATafXryutSf2W
 vSDTGeRQMtlmbtiFPKlloCzvSI6vd+9VqE+qCodl5DLnBdvLsnYATl4cjOO0xbEVLwda
 wdZQ1ofUSVOFDVL6jQEDtlinYc3mefsmg4BT9pwXYAEs3fQ1znG5KRkHSf1f+VtiL+Q6
 v3XMNzL25XAgot88huNi6L2SljvBcgapf6qRhAfOxhnP4kL3YfN5hrixjGJvZx6sxE4g
 B1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715785144; x=1716389944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WpiThysDuX7JPl+AhNyZ7t+FQuyygOMAjCR+jn6zrYU=;
 b=ecOxnlQJgaLklF1C896yzADJEYfivOrayR5fMl/XtK7BmFg98DFTcH8c1TgP6BAi3Y
 vrE6jMtVAuRXVKySdlcrckYM/xurYNTNV3XZf5e1dl9GHQDHxYQj4TBhfCKfJYkdtSVh
 yNOYZIoB7lO8U3u/8YqU9WAo7Eibtk0iecM8iKYA7pgZeqbSngv113gT4lLDeYSmsV0j
 usMt91OZQFC3fgzz6bXTkRO+CEC9JvFC0BTgV2nmtU+KskqaQrwV4nayizv4njWgN0oO
 iuvb1y8pFXXRcSBJY6ePiQ9+v0HvQ3rU9ORf2UooVsSIDqcbDTvoZROXmGN0N4Wei/Wa
 kb4g==
X-Gm-Message-State: AOJu0Yy5TMg+TJ5UYQM2VpYbrF9bQ0YYNsx/CJ5opUaZD4mYg+hkTz1x
 IwKnVDiKr2qHqfoMm/zKRFz8vqgY92oUyzSrgJXVfufScII5NaXcRxa7rZDL1lR/XZSufq9DcBX
 VGM0=
X-Received: by 2002:a05:600c:3544:b0:41a:b54a:9ad8 with SMTP id
 5b1f17b1804b1-41fea52e620mr118768115e9.0.1715785143901; 
 Wed, 15 May 2024 07:59:03 -0700 (PDT)
Received: from stoup.. ([149.14.240.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f88111033sm272134645e9.34.2024.05.15.07.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 07:59:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 4/5] tcg/arm: Support TCG_TARGET_HAS_tst_vec
Date: Wed, 15 May 2024 16:58:59 +0200
Message-Id: <20240515145900.252870-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515145900.252870-1-richard.henderson@linaro.org>
References: <20240515145900.252870-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: JZiBWzVZb8EV

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h     |  2 +-
 tcg/arm/tcg-target.c.inc | 23 ++++++++++++++++++++---
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 434a892e07..fb7261499b 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -150,7 +150,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_minmax_vec       1
 #define TCG_TARGET_HAS_bitsel_vec       1
 #define TCG_TARGET_HAS_cmpsel_vec       0
-#define TCG_TARGET_HAS_tst_vec          0
+#define TCG_TARGET_HAS_tst_vec          1
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 6a04c73c76..3de5f50b62 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2740,17 +2740,33 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_cmp_vec:
         {
             TCGCond cond = args[3];
+            ARMInsn insn;
 
-            if (cond == TCG_COND_NE) {
+            switch (cond) {
+            case TCG_COND_NE:
                 if (const_args[2]) {
                     tcg_out_vreg3(s, INSN_VTST, q, vece, a0, a1, a1);
                 } else {
                     tcg_out_vreg3(s, INSN_VCEQ, q, vece, a0, a1, a2);
                     tcg_out_vreg2(s, INSN_VMVN, q, 0, a0, a0);
                 }
-            } else {
-                ARMInsn insn;
+                break;
 
+            case TCG_COND_TSTNE:
+            case TCG_COND_TSTEQ:
+                if (const_args[2]) {
+                    /* (x & 0) == 0 */
+                    tcg_out_dupi_vec(s, type, MO_8, a0,
+                                     -(cond == TCG_COND_TSTEQ));
+                    break;
+                }
+                tcg_out_vreg3(s, INSN_VTST, q, vece, a0, a1, a2);
+                if (cond == TCG_COND_TSTEQ) {
+                    tcg_out_vreg2(s, INSN_VMVN, q, 0, a0, a0);
+                }
+                break;
+
+            default:
                 if (const_args[2]) {
                     insn = vec_cmp0_insn[cond];
                     if (insn) {
@@ -2769,6 +2785,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                     tcg_debug_assert(insn != 0);
                 }
                 tcg_out_vreg3(s, insn, q, vece, a0, a1, a2);
+                break;
             }
         }
         return;
-- 
2.34.1

