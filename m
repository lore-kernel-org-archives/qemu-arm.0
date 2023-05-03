Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2656518ejm;
        Wed, 3 May 2023 00:17:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6O6f3McQ/EFf5tzmbO0J9+iQHSSMY+30PyoNI+6FxNdohBzqYkM7hsrR/Ch4RJl/92QZDO
X-Received: by 2002:a05:622a:653:b0:3d2:7f3b:c691 with SMTP id a19-20020a05622a065300b003d27f3bc691mr29686983qtb.47.1683098244905;
        Wed, 03 May 2023 00:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683098244; cv=none;
        d=google.com; s=arc-20160816;
        b=AX3zN/MScV7HdIdRi0dyK0fNANoCicmEIP6tyJEdUKmmybSIUf1r+8DlNZ6zPDsYHk
         s17iPFZzvFfB5bgz11N81jb+gsHrdTDvLyuQCHY1R2R2q1JyAgChuiBvN8DX5Ot42Nfj
         g+kT4tqPfw4/nUinCQC8Eq0HowdWk+J5L86LMlsQO/rCONooi0+/DZ2KCKTwXnxwWJBk
         mc1e5eNAJ4xGR9t+4y/DABAxJXG3yPzwFksbjpwyHBzTkjlJNH8YbUVsTuokFp7YaozS
         ZzdRNK1Ndk9G23lMVH6eVsEqEXQFsQrO+BIv0EUWL5ocr4mVGUhL/aTdOyVj79amTpmQ
         Uesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RTRyUJJ//8McRlEJCpdcC3CCDoyJJ5ltYvB50/bCFGE=;
        b=coB6ZpIBlN6YvaWO9pHgE8grgBioHAYyS2tmCVei/hoFwnC0jKoFFfnrfe1JLtAC4S
         YBrZf0Wba2krP83Ca8FzUKEKGdiS6hdQQkoQYOjmIILUJJozp+vPU48xsxAiV+oZk69c
         1kat7pWKbFbEbml60AI+h4Bb41Z58r/2CFnkHzEJkUEE7YufcgIEKjIP/xCVmfOvzD9M
         OwLvNOvqJeT9fuasm42StpEplQJKJub9uIKEZ8kn7Cr3E8wiSKGHsn+u3QxRtUx22rCq
         MhTcQAMgzhx7EESi8c5smlyqrwYMwbKHI97FCSdaaBhfjTa1rX7f6su8QJDvznWeNWSF
         gLhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M0AVoLL9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020ac85c07000000b003ef6db3ab11si13780842qti.736.2023.05.03.00.17.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:17:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M0AVoLL9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6bU-0002j2-4s; Wed, 03 May 2023 03:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6af-0007tR-3I
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:53 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a7-0005cQ-Hs
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:52 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f315712406so11277235e9.0
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097639; x=1685689639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RTRyUJJ//8McRlEJCpdcC3CCDoyJJ5ltYvB50/bCFGE=;
 b=M0AVoLL90VsU6dUb5aND6Tr+2Yq0dKst3kcummph/xAeuXLqXlicMIsMuDgcgGwe1e
 4gVa2Ui1iVDVrt4pr8MwsD7DmFZE0WawVPciUSjaLKqDUAWrYPEqDV5d0STAYfGBHl8W
 nRwa9Xpl5snKuORBQZVjgzBB6+pYRc9w25n4bbw58TLJoP0g6T51iP+Iu7MgzRA2W6pi
 73RXlWR6wQCG3Zxzpwzvxkm2zr1G5Jl57G8e+5vN+10phEJwkjzorVO0M0uDSaE0JR2L
 UVPPoDESWL9rv6AYkXo4lTzyc5gU3cTMmQWQ3QrOXE+Zp1Z4cNPCbkIMGoYLycOnsV+5
 gVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097639; x=1685689639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RTRyUJJ//8McRlEJCpdcC3CCDoyJJ5ltYvB50/bCFGE=;
 b=lx3CBVVDm95Cq7fdA3uBPj8sMQnoX17d+aaipG2O6UguIJ8W/keytR6I8/uyYf0/fb
 arL8XI7mFRs+6ccaz/25C8N918NEGUsdv9egpVYLxoMsJ0OIENIVIvG7bmTb6gbQ+Lgd
 xVFaL08mCS/UK3c6x9akZJS8ARPkz/qtDBO7Gsj0PB+U6+h1iBu4gY0vO3jzaZjBggBS
 THE9jy4Gt3rIOrFwYOg8i7x0Dh4s6nk6pxgJpENsFqSCfaBoDOUuyNB5zDeG4jpfF/Su
 Arg/BBe4i/PL2BX8PYyzX9ilXtvUTdz7QaoQB0+WmJ8aS4z+Qac0efwaAphtg+aQaPRm
 ddZA==
X-Gm-Message-State: AC+VfDxzcBvVC/CUC9qfs+Hccvpk51M/wUCNKSZtzkyt6H+uCFgdOQ59
 qHwBf5qhX7g5DgCzc47RYlpiGg==
X-Received: by 2002:a1c:c916:0:b0:3f1:71d3:8ddf with SMTP id
 f22-20020a1cc916000000b003f171d38ddfmr601759wmb.14.1683097638761; 
 Wed, 03 May 2023 00:07:18 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 28/57] tcg/mips: Use full load/store helpers in user-only
 mode
Date: Wed,  3 May 2023 08:06:27 +0100
Message-Id: <20230503070656.1746170-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: 4phmKtBPY1SG

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 57 ++-------------------------------------
 1 file changed, 2 insertions(+), 55 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 7770ef46bd..fa0f334e8d 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1075,7 +1075,6 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg,
     tcg_out_nop(s);
 }
 
-#if defined(CONFIG_SOFTMMU)
 /* We have four temps, we might as well expose three of them. */
 static const TCGLdstHelperParam ldst_helper_param = {
     .ntmp = 3, .tmp = { TCG_TMP0, TCG_TMP1, TCG_TMP2 }
@@ -1088,8 +1087,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     /* resolve label address */
     if (!reloc_pc16(l->label_ptr[0], tgt_rx)
-        || (TCG_TARGET_REG_BITS < TARGET_LONG_BITS
-            && !reloc_pc16(l->label_ptr[1], tgt_rx))) {
+        || (l->label_ptr[1] && !reloc_pc16(l->label_ptr[1], tgt_rx))) {
         return false;
     }
 
@@ -1118,8 +1116,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     /* resolve label address */
     if (!reloc_pc16(l->label_ptr[0], tgt_rx)
-        || (TCG_TARGET_REG_BITS < TARGET_LONG_BITS
-            && !reloc_pc16(l->label_ptr[1], tgt_rx))) {
+        || (l->label_ptr[1] && !reloc_pc16(l->label_ptr[1], tgt_rx))) {
         return false;
     }
 
@@ -1139,56 +1136,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     return true;
 }
 
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    void *target;
-
-    if (!reloc_pc16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        /* A0 is env, A1 is skipped, A2:A3 is the uint64_t address. */
-        TCGReg a2 = MIPS_BE ? l->addrhi_reg : l->addrlo_reg;
-        TCGReg a3 = MIPS_BE ? l->addrlo_reg : l->addrhi_reg;
-
-        if (a3 != TCG_REG_A2) {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A2, a2);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A3, a3);
-        } else if (a2 != TCG_REG_A3) {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A3, a3);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A2, a2);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_TMP0, TCG_REG_A2);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A2, TCG_REG_A3);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A3, TCG_TMP0);
-        }
-    } else {
-        tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_A1, l->addrlo_reg);
-    }
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-
-    /*
-     * Tail call to the helper, with the return address back inline.
-     * We have arrived here via BNEL, so $31 is already set.
-     */
-    target = (l->is_ld ? helper_unaligned_ld : helper_unaligned_st);
-    tcg_out_call_int(s, target, true);
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-#endif /* SOFTMMU */
-
 typedef struct {
     TCGReg base;
     MemOp align;
-- 
2.34.1

