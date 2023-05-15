Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6558118ejq;
        Mon, 15 May 2023 07:36:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7aLU+rE2EZC0AsvxZ5M0AVbak0aAcgMw9pJyDc+1ppG1YIZR8PYg+ydbzkPxUq01m/JaYg
X-Received: by 2002:a05:6214:4102:b0:5e7:b5c5:5558 with SMTP id kc2-20020a056214410200b005e7b5c55558mr45507940qvb.44.1684161369359;
        Mon, 15 May 2023 07:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684161369; cv=none;
        d=google.com; s=arc-20160816;
        b=SHoH7LerndPRIQgFPgbrnfdZYYhIWTJeVZhSKjIgG/2LFYOo8fgBuDH3iGrIOi0P5J
         6fwrR2O15w3pAZmpkm7SryFvHqglYIdPje1euWq2N/iqte7XNFlOmXKTmWHqlZ7ZzBLW
         kvzHZIOP2WesBe63u5y9/WPYSVW0xyvAcW+282y6aJweTlRQGnUD1n1D5g0J88Th1HNB
         D8m/2YD/vjafik9OOOIQ74r/FDu8L7YXCkXy9dZQOqlgsRW67LgvG2dnL+cXpLCK/Z2p
         UfeGPFXF7fcgFsUR2jbrtw7PwT5Bg+zgolHM+dA+Fr8j9qAjuHTs/f2WnH1n3OaGD5dd
         bLNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=K2D+W3Frhm1HnR66jCW7Uv+/eEEehjSzUkt7BPDzA4s=;
        b=gYNxN43D+7uj9NxjnCT2JvS/VKFVXbEWf00DpWEhRQEAJj/sdaLyC5N9L1llyl9H5p
         f0+mkDZL9ilvfoTeTvLSgD0vkifruv33Cd+4zHNoh2D9/k5Q5rKVLUQBtHvBl2S5za8N
         rCwNZQxVBW9pBSshd0MiBQargfqK6cRnPKRv+7rqAV+XAPxl5onJMm1NJFKIraFoxUBy
         CXL6e/eWSvj+9gYUlesFuly/l37x0XNne8gTMy7Yo9VsiJ7k9wn17BdsGaTzXz+A1gMk
         r5WebBq0h6u/i72P7uNaE2SSkaUiwAZDgNFzYc+sPNBq9qhYKqv1mlUCGFwLVVQBjHT1
         ChUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J8qNx79y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jn3-20020ad45de3000000b005ef466174a2si1415442qvb.345.2023.05.15.07.36.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 07:36:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J8qNx79y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZIa-0000Al-SP; Mon, 15 May 2023 10:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHS-0006xv-P2
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:36 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGZ-0004z2-KK
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:33:47 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1aad6f2be8eso118634665ad.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161214; x=1686753214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K2D+W3Frhm1HnR66jCW7Uv+/eEEehjSzUkt7BPDzA4s=;
 b=J8qNx79yECQ4oVsJrZl9qNxLCQBJ6VMfU+liJyky9EZvbTY5GZVAq0zEKdCbSIvuWJ
 pGjpyuKUyrlh48BwFikkVR7+D9yQ7PZT44iplBI9nDzBcEom97HNRLipcwKtc1ytU3s/
 b+zjhXKbGyjdkVJXCGPgnYE0rUkp4bLVuQHNbiM4s52BH2dbKvDPnnkiiMJ8JX1CUnlz
 E57vxqUIX3KsevCA8vjihY9iJT3DrKXyUefzlQiQEna5ikvtAqCY177RbYLL/D7UfQSY
 RnNw0UFo0NxGb4vU7OsPpgeo5sfBJU3P9pRFDedmcyeDpAT0SHrgzS/rcDtBzLRR5s4S
 Mfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161214; x=1686753214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K2D+W3Frhm1HnR66jCW7Uv+/eEEehjSzUkt7BPDzA4s=;
 b=DQ6Xano+MHJibZGIEXfEkNLt8l1Ad+HxM3SUuS78erw6R6VQqcLoTo9yDWRjnkPXrK
 RZG/fEzpyMg35wpXDA2+aFtBu61Ex6p21WmkAnQXMzs/Wo0qY47iyjZFhvn+/U5UUaID
 k18Fh0wol8c1Lx/WJUqw8EkJoOtZ4aZ/8Elc4jVknDIJ/1zyWPWKH/IVCsg8k4Mksjbg
 MLB72i75l3HR0xzwUFpcE1lyZECV5stJyOTrbKuAgCkioEYOW53XfBW+dbV/GlkYlABd
 17RJN8HbN6+E2/hAubOSYsg/IwOyYWDQ1Z48bQD7n1oQXJCvuaRSIZauHOkhbH2DEpje
 GHdA==
X-Gm-Message-State: AC+VfDxq90ZCqHRaUAtmFfZkqcmEvHkQlaMzFyE83iwx7sgYLCzH03lv
 L8RXtXeicMQldL38GrbdT/xw//s8L+0QW4SmTkI=
X-Received: by 2002:a17:902:a402:b0:1a1:9020:f9c7 with SMTP id
 p2-20020a170902a40200b001a19020f9c7mr32295089plq.44.1684161213900; 
 Mon, 15 May 2023 07:33:33 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 22/54] tcg/mips: Use full load/store helpers in user-only
 mode
Date: Mon, 15 May 2023 07:32:41 -0700
Message-Id: <20230515143313.734053-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
X-TUID: /HmDm2NVGLc+

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

