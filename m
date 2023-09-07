Received: by 2002:a17:906:cf8c:b0:9a1:fa4e:495e with SMTP id um12csp434697ejb;
        Thu, 7 Sep 2023 09:04:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+iawN2jkgekDZgYiExx2xqHqU6oyTYAXOjSSZtYsI4RNbTWWCD9vCKXzrlMm9G3LeE8hV
X-Received: by 2002:a05:622a:20f:b0:407:9170:5818 with SMTP id b15-20020a05622a020f00b0040791705818mr22764196qtx.46.1694102650175;
        Thu, 07 Sep 2023 09:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694102650; cv=none;
        d=google.com; s=arc-20160816;
        b=iED+rOOvMr2yj4BnzCjIAa6QXs3Z1uhXbMhJSGQwzrYokvXiOdAGU/RZIdaDEfACY5
         2MbgHKeieLaoNeKaZIT0ayLLVWkgpIg+HEhhdbaE1HJXpvM/dsq0KYKbgTmGUWHQD9rh
         PxHwtsbnF8UwSQkwHeAWeTfcOzINdcNU6UiLaLDZFwioZ7Rc1TgRJfvHpti966W/Dqd4
         WN6ksiPihRtDxZqZuAOyEjYrXD+Cbbv76FUXd46olwnpmTYGVb4t3N9P2HuIyPtB2nCm
         rAwwv3JZN+BvT3mp8iPbwp7AJr2wQp1iBZyJh3G/CVETlU77flNJ+vPGpF8uZDY47Qgl
         SOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wXwOIXEXDGtPrl1zrOtaqtfc6E7wogzH7eCLgLNl9rE=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=u0us83A4CJOwk20XjJ6Rxg/QtiRhMMw7AwagN1x0IPCTdNHGSwZpfRcv/nDrjxXtHj
         HmItmwhda6f2xmilM2jDvyw5eYGVDaJ2uE7Gt6wYGd9Y1GVUXbR3ZhY7YEk2kj1jpmD0
         nb9rbkU9/M22uPB5BLWQzqUIZ+Los0qnI62eZfTH2+MkisX8p6bmroybC7vxWH69jN+c
         SttDr7Y/S9P6jRQ2U1qiOn17QSnrVEEPOOkYsabbXAoCTbREyUHZ1OeT3/IwUJ7z7VZ0
         rIyYT3mZFk9Daeg9ofJxNl57F5efDG9WPQH7t1xixBbFZwe8gOTASQ29AhquDz/a1KIr
         bD/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lJhfifKH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8-20020a05622a014800b004036456ade9si11494523qtw.598.2023.09.07.09.04.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Sep 2023 09:04:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lJhfifKH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeHU3-0000uU-Hl; Thu, 07 Sep 2023 12:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeHU1-0000rn-90
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 12:03:53 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeHTv-000205-Ab
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 12:03:52 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-402cc6b8bedso12822645e9.1
 for <qemu-arm@nongnu.org>; Thu, 07 Sep 2023 09:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694102625; x=1694707425; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wXwOIXEXDGtPrl1zrOtaqtfc6E7wogzH7eCLgLNl9rE=;
 b=lJhfifKHKkK91MuIX7VUcp81QlXT9qslc0iP06dyJhojoaIRltrrykU7g4tZvwaQ6r
 V4B3iH5Iu6CxNZDXzpKVtUaGvDMtzvCxoDakUspn2QJGfRPQD+4IVZeQZLpBH9KyPt4p
 WW6VH3KHveSqQTwvO0kpSQ1cykIwwW6MqYlxndyXuiHU/yjh4yM6K+gPgE1fHnCdLts5
 3eAUz/fHs3jnOm/kLzb483Zu0rRebaN2Z/0EAoU5Ab0B8jqI48rTmb0WeAW0LvV1cQyZ
 AF+fE0d8gu3Ev9PCUMpkT3vb8U8fmrqlawQg8yuousHMzhLp9GRgvnG0G7sQ7l/OzJfk
 MVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694102625; x=1694707425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wXwOIXEXDGtPrl1zrOtaqtfc6E7wogzH7eCLgLNl9rE=;
 b=VzCSlFf3ycBW8UMS99zc+iAVCWI0+QHVSBnF+1aCGf1hanEZ9twqw4kGxOoHiNlU9n
 7W8m8swF5fmH++bzt1eK1QpdMqrks7GOBiLiwU5DdwyJAvsxodEbwfPvURWewldD3du/
 pKAFNDQ8BTF9Z2Ufq22GAtUFoCh6YrBqccVQVAz/blGJVM87qC8eRCwBhDkIVGtMDDV2
 wrNOowmrOuPYw5bW1z+i0RuS/fBUV/5CH9JLxIcOX44djV7+3qaMKjLSoFD+E/IPxRA8
 Gpn/SerfDdS6qSd0UNvss2ckT5McFRIEy97eIL0DU/5qn1fDY41jUv1//ITi7gKw+a5E
 bmHw==
X-Gm-Message-State: AOJu0YyCvYQDYCPH/y9XQFr/9N41vB21WyCkS+gaTofjHFwguAR+vNuB
 fDhSDozqg829oiR2n7FNlKBCUxBadgtEkw0dT3A=
X-Received: by 2002:a5d:58da:0:b0:31d:8fed:c527 with SMTP id
 o26-20020a5d58da000000b0031d8fedc527mr4552554wrf.42.1694102625673; 
 Thu, 07 Sep 2023 09:03:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adfa401000000b0031980294e9fsm20256241wra.116.2023.09.07.09.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 09:03:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/14] target/arm: Pass unpriv bool to get_a64_user_mem_index()
Date: Thu,  7 Sep 2023 17:03:31 +0100
Message-Id: <20230907160340.260094-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230907160340.260094-1-peter.maydell@linaro.org>
References: <20230907160340.260094-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: I3Hkt5DCU1ac

In every place that we call the get_a64_user_mem_index() function
we do it like this:
 memidx = a->unpriv ? get_a64_user_mem_index(s) : get_mem_index(s);
Refactor so the caller passes in the bool that says whether they
want the 'unpriv' or 'normal' mem_index rather than having to
do the ?: themselves.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I'm about to add another use of this function which would
otherwise also end up doing this same ?: expression...
---
 target/arm/tcg/translate-a64.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0b77c92437f..ea1954d4a2a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -105,9 +105,17 @@ void a64_translate_init(void)
 }
 
 /*
- * Return the core mmu_idx to use for A64 "unprivileged load/store" insns
+ * Return the core mmu_idx to use for A64 load/store insns which
+ * have a "unprivileged load/store" variant. Those insns access
+ * EL0 if executed from an EL which has control over EL0 (usually
+ * EL1) but behave like normal loads and stores if executed from
+ * elsewhere (eg EL3).
+ *
+ * @unpriv : true for the unprivileged encoding; false for the
+ *           normal encoding (in which case we will return the same
+ *           thing as get_mem_index().
  */
-static int get_a64_user_mem_index(DisasContext *s)
+static int get_a64_user_mem_index(DisasContext *s, bool unpriv)
 {
     /*
      * If AccType_UNPRIV is not used, the insn uses AccType_NORMAL,
@@ -115,7 +123,7 @@ static int get_a64_user_mem_index(DisasContext *s)
      */
     ARMMMUIdx useridx = s->mmu_idx;
 
-    if (s->unpriv) {
+    if (unpriv && s->unpriv) {
         /*
          * We have pre-computed the condition for AccType_UNPRIV.
          * Therefore we should never get here with a mmu_idx for
@@ -3078,7 +3086,7 @@ static void op_addr_ldst_imm_pre(DisasContext *s, arg_ldst_imm *a,
     if (!a->p) {
         tcg_gen_addi_i64(*dirty_addr, *dirty_addr, offset);
     }
-    memidx = a->unpriv ? get_a64_user_mem_index(s) : get_mem_index(s);
+    memidx = get_a64_user_mem_index(s, a->unpriv);
     *clean_addr = gen_mte_check1_mmuidx(s, *dirty_addr, is_store,
                                         a->w || a->rn != 31,
                                         mop, a->unpriv, memidx);
@@ -3099,7 +3107,7 @@ static bool trans_STR_i(DisasContext *s, arg_ldst_imm *a)
 {
     bool iss_sf, iss_valid = !a->w;
     TCGv_i64 clean_addr, dirty_addr, tcg_rt;
-    int memidx = a->unpriv ? get_a64_user_mem_index(s) : get_mem_index(s);
+    int memidx = get_a64_user_mem_index(s, a->unpriv);
     MemOp mop = finalize_memop(s, a->sz + a->sign * MO_SIGN);
 
     op_addr_ldst_imm_pre(s, a, &clean_addr, &dirty_addr, a->imm, true, mop);
@@ -3117,7 +3125,7 @@ static bool trans_LDR_i(DisasContext *s, arg_ldst_imm *a)
 {
     bool iss_sf, iss_valid = !a->w;
     TCGv_i64 clean_addr, dirty_addr, tcg_rt;
-    int memidx = a->unpriv ? get_a64_user_mem_index(s) : get_mem_index(s);
+    int memidx = get_a64_user_mem_index(s, a->unpriv);
     MemOp mop = finalize_memop(s, a->sz + a->sign * MO_SIGN);
 
     op_addr_ldst_imm_pre(s, a, &clean_addr, &dirty_addr, a->imm, false, mop);
-- 
2.34.1

