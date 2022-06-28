Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2891539lft;
        Mon, 27 Jun 2022 21:42:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uyxlXMcp4swQ3TOYYej46vUPE81qcuyBSKNXadAfL7w7kFyO9IeJipMhhmwx9hsQqEwWOl
X-Received: by 2002:a05:620a:2910:b0:6a6:baed:e7f0 with SMTP id m16-20020a05620a291000b006a6baede7f0mr9896405qkp.368.1656391363251;
        Mon, 27 Jun 2022 21:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656391363; cv=none;
        d=google.com; s=arc-20160816;
        b=BVqixK0lJMbDSCtbEcFLET2AdOKttj7nbYuT/SRLRGU1nR2e+g5q4WBMGjnHoRd1Ro
         0WW2rMkmKlRhv2XAr5e0/Xquz4gXKlcJ6H2o91zgg8uqhMAAYDA9XVc/kDv75R3Pq7bh
         ODm8ynS+nCJZl4EK++p5A70o//CXmW7ssR22DCrByzzTOAkBF4uvPzIlgcIvp54ZfVRG
         yn7z3UIfXBZe8m7BrBe346rIvZs28JZPkRzH5eXJ7SRjEaYuN7nUqcckaCQqmaO58NjM
         BKqnqirAQwsGFRixGqW08mxkFAP8j+OIGdIhEloiXzH4gLyfSl6bw07wCrx3dcRPTAE1
         b0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ez0Fk7Hr9AjzIaIFm6v2h/vIMvDr735Y3UJNyri/gRQ=;
        b=CiusrfppgeQytuJM96nH1dsu7u4Pwt6qd8XjMuOR1/H3W/SyJ5UXCmuyxrRBavUu7j
         9DaYxuEfeZX2fFl3fpDq6g2iUCDxY5nQq1DrRfMpMxrte8jpMxew/IxPq/cX6w0EqEOw
         rbZapsJTo/4oHhmQ+7bpU4Gz4NZSlNInJ7MFdy8o31bYBxgcAIexmlYCQbHVfHBte+8S
         bg/NJZpPvUuGQSTUyObohEspIj9p36G2IrJeyzjf3eslWOL//PW8g3Hzej95LKByUGln
         Vb/zo2UCA4e/j79SWKyAEpDC5bbe0FdJfcwicY5HZ4RMOtOd9bZ7/0SoNNKE7xoyDJZU
         uhkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RJ709bJI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8-20020ad45ca8000000b004704fe5bac5si7187569qvh.263.2022.06.27.21.42.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:42:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RJ709bJI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o633i-0006u9-MR
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kC-0002V1-GJ
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:32 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kA-0003qj-L4
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:32 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 b12-20020a17090a6acc00b001ec2b181c98so14579453pjm.4
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ez0Fk7Hr9AjzIaIFm6v2h/vIMvDr735Y3UJNyri/gRQ=;
 b=RJ709bJIs5pr81ybVBoxZT/foZ+BocgHKt9H8pmIc+jZutM+g8rmaGuH+gbbGchlPY
 JM5K+kN2owAwNIJ4AnTf1goJzLJCG5Qwe/KrtRcKxGsdRHWVdse6cHby9LPmAQIHe/0J
 H3T2r8WnRZyIiRu59pGC0JXd4lBMwhRXTKS3VerGflxK0ovALOfiKGvVAaqHjnvNwaSt
 D5jenUA7Bx+XbnmAbVFCrmqyijj+QEibOrgn5trwBJriAKi8y3Ky6X5cMb9mBfGN4Ctk
 uRaFbj+DfCt3R/IYtYZoQRktzHAUKXHshzDoDdkeD5E1F+/MrNemr03Do0KBnCO4t2KY
 fhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ez0Fk7Hr9AjzIaIFm6v2h/vIMvDr735Y3UJNyri/gRQ=;
 b=A1lXnYS4WgWDxVKQPQHxYY666UdHD0SRht+uVi6FXdpf8YxcGzOImezStCebEd/p2I
 MXztTe9sxDt+QJ6wUHtECrKy6Mbea0g9uC7C5bhbCv03x+l8oJxx1kGcBvUL3/ixuBKb
 /SBX94kDY6G/ylEOjhSzF0fPceIhP1X/HT4/C7YijVnW24RHpfFerLEUINGKFCpaMSei
 jzkPfxMsQ4t7YwFCOxAy5rvp2Gys5Qq6XiTCOavgtA587B2+vJWWi8ONeK5VqMdYLli5
 11nrcVKUt0WslzFJrimYG0m4mn0a1yhnbdCjC8O4JgwvVlcDAaqCpy2qIZJHwyofs6IY
 CDwA==
X-Gm-Message-State: AJIora9uuKdyVSd7l1GFdvIvTmzM9D4tONQAxc7S4z4mcDojxNABG4n9
 Kh3a6XCapOtK0xtfRHprR/0/ug==
X-Received: by 2002:a17:90b:35c7:b0:1ee:f8a7:2b03 with SMTP id
 nb7-20020a17090b35c700b001eef8a72b03mr3530096pjb.50.1656390149020; 
 Mon, 27 Jun 2022 21:22:29 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 28/45] target/arm: Implement PSEL
Date: Tue, 28 Jun 2022 09:51:00 +0530
Message-Id: <20220628042117.368549-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r8fC4LzDzEDM

This is an SVE instruction that operates using the SVE vector
length but that it is present only if SME is implemented.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 20 +++++++++++++
 target/arm/translate-sve.c | 57 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 95af08c139..966803cbb7 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1674,3 +1674,23 @@ BFMLALT_zzxw    01100100 11 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
 
 ### SVE2 floating-point bfloat16 dot-product (indexed)
 BFDOT_zzxz      01100100 01 1 ..... 010000 ..... .....     @rrxr_2 esz=2
+
+### SVE broadcast predicate element
+
+&psel           esz pd pn pm rv imm
+%psel_rv        16:2 !function=plus_12
+%psel_imm_b     22:2 19:2
+%psel_imm_h     22:2 20:1
+%psel_imm_s     22:2
+%psel_imm_d     23:1
+@psel           ........ .. . ... .. .. pn:4 . pm:4 . pd:4  \
+                &psel rv=%psel_rv
+
+PSEL            00100101 .. 1 ..1 .. 01 .... 0 .... 0 ....  \
+                @psel esz=0 imm=%psel_imm_b
+PSEL            00100101 .. 1 .10 .. 01 .... 0 .... 0 ....  \
+                @psel esz=1 imm=%psel_imm_h
+PSEL            00100101 .. 1 100 .. 01 .... 0 .... 0 ....  \
+                @psel esz=2 imm=%psel_imm_s
+PSEL            00100101 .1 1 000 .. 01 .... 0 .... 0 ....  \
+                @psel esz=3 imm=%psel_imm_d
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 374a0a87f2..23b051746c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7415,3 +7415,60 @@ static bool do_BFMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sel)
 
 TRANS_FEAT(BFMLALB_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, false)
 TRANS_FEAT(BFMLALT_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, true)
+
+static bool trans_PSEL(DisasContext *s, arg_psel *a)
+{
+    int vl = vec_full_reg_size(s);
+    int pl = pred_gvec_reg_size(s);
+    int elements = vl >> a->esz;
+    TCGv_i64 tmp, didx, dbit;
+    TCGv_ptr ptr;
+
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    tmp = tcg_temp_new_i64();
+    dbit = tcg_temp_new_i64();
+    didx = tcg_temp_new_i64();
+    ptr = tcg_temp_new_ptr();
+
+    /* Compute the predicate element. */
+    tcg_gen_addi_i64(tmp, cpu_reg(s, a->rv), a->imm);
+    if (is_power_of_2(elements)) {
+        tcg_gen_andi_i64(tmp, tmp, elements - 1);
+    } else {
+        tcg_gen_remu_i64(tmp, tmp, tcg_constant_i64(elements));
+    }
+
+    /* Extract the predicate byte and bit indices. */
+    tcg_gen_shli_i64(tmp, tmp, a->esz);
+    tcg_gen_andi_i64(dbit, tmp, 7);
+    tcg_gen_shri_i64(didx, tmp, 3);
+    if (HOST_BIG_ENDIAN) {
+        tcg_gen_xori_i64(didx, didx, 7);
+    }
+
+    /* Load the predicate word. */
+    tcg_gen_trunc_i64_ptr(ptr, didx);
+    tcg_gen_add_ptr(ptr, ptr, cpu_env);
+    tcg_gen_ld8u_i64(tmp, ptr, pred_full_reg_offset(s, a->pm));
+
+    /* Extract the predicate bit and replicate to MO_64. */
+    tcg_gen_shr_i64(tmp, tmp, dbit);
+    tcg_gen_andi_i64(tmp, tmp, 1);
+    tcg_gen_neg_i64(tmp, tmp);
+
+    /* Apply to either copy the source, or write zeros. */
+    tcg_gen_gvec_ands(MO_64, pred_full_reg_offset(s, a->pd),
+                      pred_full_reg_offset(s, a->pn), tmp, pl, pl);
+
+    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(dbit);
+    tcg_temp_free_i64(didx);
+    tcg_temp_free_ptr(ptr);
+    return true;
+}
-- 
2.34.1

