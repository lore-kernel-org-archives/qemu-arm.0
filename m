Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2600886ejm;
        Sun, 23 Apr 2023 22:54:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350YMdl2rST/QX+3SUN8cDNBJ7sQA7gsBWipydLymPCrlp9hOuHQST0S7F74DU+q7s+c63d6K
X-Received: by 2002:ac8:7d94:0:b0:3e3:937b:2a64 with SMTP id c20-20020ac87d94000000b003e3937b2a64mr22458759qtd.18.1682315645522;
        Sun, 23 Apr 2023 22:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315645; cv=none;
        d=google.com; s=arc-20160816;
        b=w7/d/zCQJMg9AfDRrWfIYnaIHIZr+CJYPbvpSQE2Cz1wQzioQdp5w4fytJauZF80N1
         skdYuQIm7bCTNNELi1KhadLaB8aMq6fbuBq+mJdR64EE+mMOpnT/6dghUQtsXNRYsic7
         USuGe6HRn27qAGFS9CSDaDpN/+gHxZtlDXi48gvw4w/ECOVubi32Y6LYny071keB6Xps
         zHiWXduC33O+5ImMHKtTgQ+cYl7tqUJ6vo1zD7eq+uqD3HF5w/zESem+VObIA0A+vdp8
         8Lxc3jsHwFGJT7mnkQug4NDpwnNsgU5HzQDu//NplIwZw7TKLGJFgFKyf+9jgebJQG/u
         rSZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rivgwXGbdDw6Y7e7EyPZeewGUUT+LzpYCC2kVwog6co=;
        b=F/MyhycbLzbVc3zCHPDTjH2XsxYMvUnHUhqYDrJw1HccyTAAsMJdGtTIl+4P4fiw+F
         /a1LMNKX9031XVDdmvrbNASwJ5acEbLNJbZR3/H4os16kpWNTNhK0ZMXufHkEpAdZNOJ
         oCHvhwxmFPhXtfKy4o3sK6E66IJPJ0kQtp1bp1+0Of+pYaeOcR09PE7CF0P8v8qLMMMX
         cYqOk9mVmyf8zzJZ2SkUkb1CVeJuYUyOKFycZVmaxHiLNSlEcuKoXKxPcHjzcyVoAIn0
         aIOK4XcvtM2W5hPR9UjS8k7cGA/WhhtiIzTKlXdaYdfE8gqp1N8Cc8kywkdpE+Lrsa3D
         fpSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uOJKiDEv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12-20020a05622a004c00b003ef4e85e77asi7021902qtw.555.2023.04.23.22.54.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:54:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uOJKiDEv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqp28-0007Pt-DK; Mon, 24 Apr 2023 01:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxx-000646-Aq
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:42:33 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox9-0004Tj-EN
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:42:21 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f09b4a1584so25779095e9.2
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314886; x=1684906886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rivgwXGbdDw6Y7e7EyPZeewGUUT+LzpYCC2kVwog6co=;
 b=uOJKiDEvkBKEwih1nhZNMYX82dd8aDiK69SCv/lu7yB1yxDA0RhK3lvgDBElLsZ8/K
 zfclDNYH+117lcoUDbu+U4qvw6eYJ4QJvh5Sv5iHpITCsHewlrX8ziel/e2Am2ME6RhG
 qtwubLutUbOYEcFwZJoQEEfVXCZVkNSF3zMvM6HkwhrmbYaOVSCI3uEd3XQYyQ0SZbB4
 VD6GbOCvXUOIT+1XVGA3djmWkEUGGXWarKI0zeAkX8OvMTg4fAs9N26M0HqzyYk/tpPM
 lcPkFdQsQ95wye+BLBqEW5TtzLAD+9ufTV+oIX/0wcrTPCyBAnwxoJ7CKME2BzhQZzF5
 UNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314886; x=1684906886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rivgwXGbdDw6Y7e7EyPZeewGUUT+LzpYCC2kVwog6co=;
 b=LGfkrgPdpzPz97Ht1W5zZ+gE7FHIidqefjI/232H/SpwSeuHojpL9HCDSjMRWTOv9U
 qE4QbKQVkgA7fTGGTTKPRRBnKa9Jbc529luBg/AnJzizwX+6FVoJtjPIUFIxOs4XHezJ
 VX9ngZguxXiphfTG76xM2evFS0Y/vLkcgz4n7SQePAWETFJR9anOTzSh7tmLHwI042Mm
 Zwb9P+3uvKnKppB2BjRqebo8XJWx1jp1osn2JOUDbpZ6/m53U8Zhbli2R4O1jwYzBLhp
 Fu+26uXpnIE1ZY8HFOvRE5KmfBuHBjli8THY1up8ciYTgLcvFdtgnJ8LxtKu199XfSx9
 4SpQ==
X-Gm-Message-State: AAQBX9f4vImMMTW/34C+RIZGTfzvb+p0qvSN2UiOcZVFVJy3gDYrTm3z
 WMAFZVbukWZAQqxOfv8HqkwSYA==
X-Received: by 2002:a5d:5004:0:b0:2f8:7cac:101a with SMTP id
 e4-20020a5d5004000000b002f87cac101amr7426268wrt.41.1682314886712; 
 Sun, 23 Apr 2023 22:41:26 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 35/57] tcg: Replace REG_P with arg_loc_reg_p
Date: Mon, 24 Apr 2023 06:40:43 +0100
Message-Id: <20230424054105.1579315-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-TUID: gmYiDeye5yiu

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

