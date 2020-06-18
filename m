Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1292977lfm;
        Wed, 17 Jun 2020 22:23:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoYi9sszYcnetfI47m88RVwUN+W/kF/GDsw4Zz8HPkLrI4PW1SKMVqcthpEk3tE+nS/Z+D
X-Received: by 2002:a25:8b12:: with SMTP id i18mr3475639ybl.377.1592457816677;
        Wed, 17 Jun 2020 22:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592457816; cv=none;
        d=google.com; s=arc-20160816;
        b=oK2exJi70Vz8S+IRgpr+BYaNiuR1CldEsFcSLum7SFf5enWOg1O8PA4wiceCk3y22H
         dMnRiyl0IsESFkNyIuME7RlFfYHQBNtplBg6MHw3CMwQOCT5h3CBs0YkF/nX9WDaUpCO
         /CnuOtSoWp/fkUvcSPCjh+PgE8UCuvwdmvp5GUTS460fzzWFeYVHTPYdLRqsw1h+xnHL
         pTgfFQLH3Dgcl4g0GAH2Mi73x6Z10w7RZyjjcCh9Pbf42VDdEGnBOw7H9LjMtPgrVq3P
         Qho4xKejmx9X84VG3zwqFeTf6KgW9ykNDI/5KFkcM+o0IwfvJbggcN1aZpf4En7RVaxi
         Om4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xBh5uP+VsyRG2eGl2r1/scWIQoivVaaYepquCqsvaWY=;
        b=bxaoPbTo6HqG9UzxDhjD9uo4MMtV4xJ+OyJ8ySeGBq0iMse0OjCOnjKMS8QK1x/6Jk
         6XRvm2OL6MSiEiOJPAY5PF/o9/nC3rLhyh0o4m3xdWIsiHFrvred0/0Vxv9CI3yv2iF2
         KJDrlieu6jitNuhTzobaIp5PIsPLkR9epUveH3UdWmq9xIvLhBevumpn/5O1WUJQox+Y
         BZpXQnykWqPCqXqU1Kwtr2f3zrzzxfteF35dOGYWp5Z5Q8FxExKoOKppzS53Z+Z+xYSG
         /bmHRBVYKKEGD5eLp27hprZ52482MjXfIcZtLbokVVwoHnYez0tGXatKqpkJmqBuiszY
         DsXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yLEh0+RC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si1730285ybk.397.2020.06.17.22.23.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:23:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yLEh0+RC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jln1U-0001Pw-2d
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmF5-0007Kn-E1
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:33:36 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmF2-0003gc-3i
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:33:35 -0400
Received: by mail-pf1-x441.google.com with SMTP id 23so2181110pfw.10
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xBh5uP+VsyRG2eGl2r1/scWIQoivVaaYepquCqsvaWY=;
 b=yLEh0+RCFOiEIeahemHD1DRUg6jARgCjpKs+yxEYXAuEYP7NbLBdsA8T/RDRkGX576
 cQpulVuiqEv9/I0rxqaDIo5bfPDfl4HDwkAwKJ6HgRdRu+kKHhUJ23t026trpBJpc1R4
 pD1xyQSiV0z4j9jfResay07aEmhSzRVQDFFjXZf+Vmf2Ax7ri84v4bHO2jmY3R8nwlIf
 G6bIxIMOtUPjZGYx9V2pm0nhwfjzmRZ6wvfSBzsU/HLqlQYJ9QnZ6v31wRHEpGQZnCuf
 J+65l9e9Fn9HJSpuopED1TXZHyQdMqR/KGvWviWaSehfesqVEfApbZoB2LHEvQaJNYro
 0cRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xBh5uP+VsyRG2eGl2r1/scWIQoivVaaYepquCqsvaWY=;
 b=rFyD96WfSRBHcM6KjbeWjwUWk+PMRgt/Qgut6gYjDuArjaE5FFI6TzMEG2al/i9LqE
 YE2R/jiXzjlAgWfxy9IJmP300LyLFXggIoz4E4euz0kBqj9KOAyaN20ou4aYuunAgRdC
 2BtwKGDV+ciyWaTGx1yqRgUaUWDZh+AyXUoFGv+Qhl0E28Q8z3+Np80OWV0eKWVsu4Fk
 zt10yr9omrvYwy7DLnceP57I2qXPEPqRVgILktZbPjLd3fuywdmgSt+2+rrLC/XSx0ai
 O3lR9KKsbCP1gevAV9hEaHIFblj+uxc8B/7N8znU7kh1KY8Zo3spLIWdA6MJMlNzLr3O
 8A7Q==
X-Gm-Message-State: AOAM5303Mg4evFqPh+TArXM7EHwyNbpyjd1DhhEaMthrrLv1w7/720Qf
 zIaajjkgaswMRb9NutJ9IWZIZw==
X-Received: by 2002:a62:6404:: with SMTP id y4mr1943853pfb.92.1592454810834;
 Wed, 17 Jun 2020 21:33:30 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id q22sm1288212pfg.192.2020.06.17.21.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:33:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 096/100] target/arm: Share table of sve load functions
Date: Wed, 17 Jun 2020 21:26:40 -0700
Message-Id: <20200618042644.1685561-97-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3sC0fTuNudz9

The table used by do_ldrq is a subset of the table used
by do_ld_zpa; we can share them by passing dtype instead
of msz to do_ldrq.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 120 ++++++++++++++++++-------------------
 1 file changed, 58 insertions(+), 62 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f3b2463b7c..6bdff5ceca 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5190,61 +5190,63 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
     tcg_temp_free_i32(t_desc);
 }
 
+/* Indexed by [be][dtype][nreg] */
+static gen_helper_gvec_mem * const ldr_fns[2][16][4] = {
+    /* Little-endian */
+    { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
+        gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
+      { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
+
+      { gen_helper_sve_ld1sds_le_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1hh_le_r, gen_helper_sve_ld2hh_le_r,
+        gen_helper_sve_ld3hh_le_r, gen_helper_sve_ld4hh_le_r },
+      { gen_helper_sve_ld1hsu_le_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1hdu_le_r, NULL, NULL, NULL },
+
+      { gen_helper_sve_ld1hds_le_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1hss_le_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1ss_le_r, gen_helper_sve_ld2ss_le_r,
+        gen_helper_sve_ld3ss_le_r, gen_helper_sve_ld4ss_le_r },
+      { gen_helper_sve_ld1sdu_le_r, NULL, NULL, NULL },
+
+      { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1dd_le_r, gen_helper_sve_ld2dd_le_r,
+        gen_helper_sve_ld3dd_le_r, gen_helper_sve_ld4dd_le_r } },
+
+    /* Big-endian */
+    { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
+        gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
+      { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
+
+      { gen_helper_sve_ld1sds_be_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1hh_be_r, gen_helper_sve_ld2hh_be_r,
+        gen_helper_sve_ld3hh_be_r, gen_helper_sve_ld4hh_be_r },
+      { gen_helper_sve_ld1hsu_be_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1hdu_be_r, NULL, NULL, NULL },
+
+      { gen_helper_sve_ld1hds_be_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1hss_be_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1ss_be_r, gen_helper_sve_ld2ss_be_r,
+        gen_helper_sve_ld3ss_be_r, gen_helper_sve_ld4ss_be_r },
+      { gen_helper_sve_ld1sdu_be_r, NULL, NULL, NULL },
+
+      { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
+      { gen_helper_sve_ld1dd_be_r, gen_helper_sve_ld2dd_be_r,
+        gen_helper_sve_ld3dd_be_r, gen_helper_sve_ld4dd_be_r } }
+};
+
 static void do_ld_zpa(DisasContext *s, int zt, int pg,
                       TCGv_i64 addr, int dtype, int nreg)
 {
-    static gen_helper_gvec_mem * const fns[2][16][4] = {
-        /* Little-endian */
-        { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
-            gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
-          { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
-
-          { gen_helper_sve_ld1sds_le_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hh_le_r, gen_helper_sve_ld2hh_le_r,
-            gen_helper_sve_ld3hh_le_r, gen_helper_sve_ld4hh_le_r },
-          { gen_helper_sve_ld1hsu_le_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hdu_le_r, NULL, NULL, NULL },
-
-          { gen_helper_sve_ld1hds_le_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hss_le_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1ss_le_r, gen_helper_sve_ld2ss_le_r,
-            gen_helper_sve_ld3ss_le_r, gen_helper_sve_ld4ss_le_r },
-          { gen_helper_sve_ld1sdu_le_r, NULL, NULL, NULL },
-
-          { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1dd_le_r, gen_helper_sve_ld2dd_le_r,
-            gen_helper_sve_ld3dd_le_r, gen_helper_sve_ld4dd_le_r } },
-
-        /* Big-endian */
-        { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
-            gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
-          { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
-
-          { gen_helper_sve_ld1sds_be_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hh_be_r, gen_helper_sve_ld2hh_be_r,
-            gen_helper_sve_ld3hh_be_r, gen_helper_sve_ld4hh_be_r },
-          { gen_helper_sve_ld1hsu_be_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hdu_be_r, NULL, NULL, NULL },
-
-          { gen_helper_sve_ld1hds_be_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hss_be_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1ss_be_r, gen_helper_sve_ld2ss_be_r,
-            gen_helper_sve_ld3ss_be_r, gen_helper_sve_ld4ss_be_r },
-          { gen_helper_sve_ld1sdu_be_r, NULL, NULL, NULL },
-
-          { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1dd_be_r, gen_helper_sve_ld2dd_be_r,
-            gen_helper_sve_ld3dd_be_r, gen_helper_sve_ld4dd_be_r } }
-    };
-    gen_helper_gvec_mem *fn = fns[s->be_data == MO_BE][dtype][nreg];
+    gen_helper_gvec_mem *fn = ldr_fns[s->be_data == MO_BE][dtype][nreg];
 
     /* While there are holes in the table, they are not
      * accessible via the instruction encoding.
@@ -5397,14 +5399,8 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a)
     return true;
 }
 
-static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int msz)
+static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
 {
-    static gen_helper_gvec_mem * const fns[2][4] = {
-        { gen_helper_sve_ld1bb_r,    gen_helper_sve_ld1hh_le_r,
-          gen_helper_sve_ld1ss_le_r, gen_helper_sve_ld1dd_le_r },
-        { gen_helper_sve_ld1bb_r,    gen_helper_sve_ld1hh_be_r,
-          gen_helper_sve_ld1ss_be_r, gen_helper_sve_ld1dd_be_r },
-    };
     unsigned vsz = vec_full_reg_size(s);
     TCGv_ptr t_pg;
     TCGv_i32 t_desc;
@@ -5436,7 +5432,7 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int msz)
     t_pg = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(t_pg, cpu_env, poff);
 
-    fns[s->be_data == MO_BE][msz](cpu_env, t_pg, addr, t_desc);
+    ldr_fns[s->be_data == MO_BE][dtype][0](cpu_env, t_pg, addr, t_desc);
 
     tcg_temp_free_ptr(t_pg);
     tcg_temp_free_i32(t_desc);
@@ -5458,7 +5454,7 @@ static bool trans_LD1RQ_zprr(DisasContext *s, arg_rprr_load *a)
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), msz);
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
-        do_ldrq(s, a->rd, a->pg, addr, msz);
+        do_ldrq(s, a->rd, a->pg, addr, a->dtype);
     }
     return true;
 }
@@ -5468,7 +5464,7 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 16);
-        do_ldrq(s, a->rd, a->pg, addr, dtype_msz(a->dtype));
+        do_ldrq(s, a->rd, a->pg, addr, a->dtype);
     }
     return true;
 }
-- 
2.25.1

