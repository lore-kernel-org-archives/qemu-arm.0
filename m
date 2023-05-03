Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2653613ejm;
        Wed, 3 May 2023 00:10:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Y3nmb9FGZ7El9CIBhywTxZz2TIpQ0b/23dzZgR9AoNKZ/BrbHvOxmmk1t44nKAcBn7mnJ
X-Received: by 2002:a05:622a:256:b0:3e4:edf4:d6e7 with SMTP id c22-20020a05622a025600b003e4edf4d6e7mr33045830qtx.11.1683097858300;
        Wed, 03 May 2023 00:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097858; cv=none;
        d=google.com; s=arc-20160816;
        b=SdeXYxRbAmPYteeA4JalgWLl5iFZm67J4qh+iQLxmqesbkgHMRi+K/0lZtY5ltCI7U
         jcxg4deqPG+WnaLK7H0Ei+Kaxd5xQC5S/RV6hkFB7LOSyeQzdppvXjob2MbzobFIOZmN
         KIxcvQkbQCdgMffQmr1PSUdfWkklw+3Nc93jqrpl0UuHm89SyMheuWCC7U/EWz8p4EG7
         KSFTBWrYYsE0A0o/xFxPxgHxs+tBYSxGBTQReXKU1a1jHrou8tlXtjrNolVK8CmIljsZ
         7RMkgFeF0DtLbfwrAFlaW1UqFFD6+bRvbEOf36nK4vzPrzm4gBjziuA9YZyLDTrmgKHt
         3M1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rivgwXGbdDw6Y7e7EyPZeewGUUT+LzpYCC2kVwog6co=;
        b=U3ZXSuMouICH0UJOsNEU8iLCGy/Oxz7brVYrwOHSYhHnhdME+40D8OqQWVqG9wjwWV
         1h5aJCzORRpscnwiru1rVcLkdMLQrjTvADWjDHrm95IxIUdFv4csTHQCn7/WlkHkkdeo
         /OmxJRp4iDjAVErco1Wy34Q5LS+RsdOzW5cqq+I3MnEVX07NsJJFL7XH6WSlHbsgydiT
         vl8VAv5es2H1tYVop042r4FBzPjOAf1W//+FFksOF5XWFvggUWdowUU23m/SHn9vmeAv
         m21Ax/nNnel6UsioY9OF9pIFdZtnnE93SOc31rlqGUhKD75IIklGBIqiJuMW8Ccp8581
         blvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtYdNU9s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24-20020a05620a137800b007513aaa86c7si6383161qkl.11.2023.05.03.00.10.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:10:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtYdNU9s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6SH-0000yR-1e; Wed, 03 May 2023 02:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Rk-00009q-FC
 for qemu-arm@nongnu.org; Wed, 03 May 2023 02:58:46 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6R1-0001iE-JY
 for qemu-arm@nongnu.org; Wed, 03 May 2023 02:58:34 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f193ca059bso28981625e9.3
 for <qemu-arm@nongnu.org>; Tue, 02 May 2023 23:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097074; x=1685689074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rivgwXGbdDw6Y7e7EyPZeewGUUT+LzpYCC2kVwog6co=;
 b=JtYdNU9sN5zax56+w/nOFwtjzYm9235USCd/ASxff05LCQz460gWS1GRAVI2/flN31
 m/TNJkfaxEnFeQYjDgLn6xHTIte+B+AsUCY5S4iEw/gYgYsaes3DwiOuis4UR+j797QF
 lE3ySWMRgnzADQUqpMBguWhJdMB0UjNlZgt8TeSFjN9YZwn6ZNqW5uYZBowmdWqtR9wm
 bjQVT7lbI6KZc0hvgHCUo4GXM33UoGTCY8WAFSb1plVD+TKTfcgCZFSPDJ+j8/5qtWSe
 Y2J4qAUmMiyScoOwehyBvl01EppLXS9u7tzLfkXgiaeGC8h/rWVJ2tQmgSDSCo1C02Ai
 /vSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097074; x=1685689074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rivgwXGbdDw6Y7e7EyPZeewGUUT+LzpYCC2kVwog6co=;
 b=BezohoGYh5FFP/H9dcuVJr9sq86qBnuJvLq/0XqpPFqOZRIRbypBJ96TO2LgnixywU
 W6FhQY8qxMdER9kPEKA4krkxnaT5DTGo2D09efKtVrrVNgCdJqQmU3Z9ukCtRppDn5RE
 qmu0JM1EvUeKWxLudfP/TM+I45ePBGi3IhZN0c9pIR/tcjwKNc83CIAVa+MgZS7dfNjh
 p0VCW1VlSC7Etbd6FYW/mu06WrWeFNtE+QpFwe64tCdLMoFIFIUUc91E+MPwkPJJm1qY
 Y/mJoZMgIsfZN0F5OAzCT69/YnkSWOp1qTWTaV1CvJHYib94AES4kxSnpcr5un3nkEDb
 OdSA==
X-Gm-Message-State: AC+VfDxP+zY3ZQ4b/fQwmu3zq+0Ce9zB3ygVWz/rv2yuYkwSFCC3U4+u
 4fWis22V2QfSUFsfkgLJng7xbA==
X-Received: by 2002:adf:f4c9:0:b0:306:27bc:f906 with SMTP id
 h9-20020adff4c9000000b0030627bcf906mr7861196wrp.67.1683097074610; 
 Tue, 02 May 2023 23:57:54 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 31/54] tcg: Replace REG_P with arg_loc_reg_p
Date: Wed,  3 May 2023 07:57:06 +0100
Message-Id: <20230503065729.1745843-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: oLJnch10285N

An inline function is safer than a macro, and REG_P
was rather too generic.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h |  4 ----
 tcg/tcg.c          | 16 +++++++++++++---
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index e542a4e9b7..0f1ba01a9a 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -58,10 +58,6 @@ typedef struct TCGCallArgumentLoc {
     unsigned tmp_subindex       : 2;
 } TCGCallArgumentLoc;
 
-/* Avoid "unsigned < 0 is always false" Werror, when iarg_regs is empty. */
-#define REG_P(L) \
-    ((int)(L)->arg_slot < (int)ARRAY_SIZE(tcg_target_call_iarg_regs))
-
 typedef struct TCGHelperInfo {
     void *func;
     const char *name;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 6f5daaee5f..fa28db0188 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -806,6 +806,16 @@ static void init_ffi_layouts(void)
 }
 #endif /* CONFIG_TCG_INTERPRETER */
 
+static inline bool arg_slot_reg_p(unsigned arg_slot)
+{
+    /*
+     * Split the sizeof away from the comparison to avoid Werror from
+     * "unsigned < 0 is always false", when iarg_regs is empty.
+     */
+    unsigned nreg = ARRAY_SIZE(tcg_target_call_iarg_regs);
+    return arg_slot < nreg;
+}
+
 typedef struct TCGCumulativeArgs {
     int arg_idx;                /* tcg_gen_callN args[] */
     int info_in_idx;            /* TCGHelperInfo in[] */
@@ -3231,7 +3241,7 @@ liveness_pass_1(TCGContext *s)
                         case TCG_CALL_ARG_NORMAL:
                         case TCG_CALL_ARG_EXTEND_U:
                         case TCG_CALL_ARG_EXTEND_S:
-                            if (REG_P(loc)) {
+                            if (arg_slot_reg_p(loc->arg_slot)) {
                                 *la_temp_pref(ts) = 0;
                                 break;
                             }
@@ -3258,7 +3268,7 @@ liveness_pass_1(TCGContext *s)
                     case TCG_CALL_ARG_NORMAL:
                     case TCG_CALL_ARG_EXTEND_U:
                     case TCG_CALL_ARG_EXTEND_S:
-                        if (REG_P(loc)) {
+                        if (arg_slot_reg_p(loc->arg_slot)) {
                             tcg_regset_set_reg(*la_temp_pref(ts),
                                 tcg_target_call_iarg_regs[loc->arg_slot]);
                         }
@@ -4833,7 +4843,7 @@ static void load_arg_stk(TCGContext *s, int stk_slot, TCGTemp *ts,
 static void load_arg_normal(TCGContext *s, const TCGCallArgumentLoc *l,
                             TCGTemp *ts, TCGRegSet *allocated_regs)
 {
-    if (REG_P(l)) {
+    if (arg_slot_reg_p(l->arg_slot)) {
         TCGReg reg = tcg_target_call_iarg_regs[l->arg_slot];
         load_arg_reg(s, reg, ts, *allocated_regs);
         tcg_regset_set_reg(*allocated_regs, reg);
-- 
2.34.1

