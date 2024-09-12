Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp368576nji;
        Wed, 11 Sep 2024 19:44:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXpKaReE425GJLN83N+g3VHBQeaYhKBNJcl2/tLPuz6YqTrXfR3CY5pbzYxfMQc4JGOCVpk5e9Tq44/Cw==@linaro.org
X-Google-Smtp-Source: AGHT+IGAZmuX2JyDOYQtJfUzjE4yvYLSapS79Hoiyh2oQIeuttQ/lexGl5kprvAuKgqmMtuhBmGM
X-Received: by 2002:a05:6214:398f:b0:6c5:1f29:828b with SMTP id 6a1803df08f44-6c5735822d0mr20671076d6.44.1726109070573;
        Wed, 11 Sep 2024 19:44:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726109070; cv=none;
        d=google.com; s=arc-20240605;
        b=BJ6/OwK+MEY6rIlt70SXiKLzfFP/BHsP02C0G1J26onbfeORWtAiwPAAOH3xEvsEnu
         ruagyXnLXrrVPgvaQMXm9EEIzlmgiQzhKRJyhlrXcZsczMG5IgaZK38Ay3gCTAZaYe4X
         1cZSUHH9le7Oc8JK+IMJEl1ROaJokxwQ9lyN3ycmuONbKeiy36UB+1mAOKelReZljPKV
         ImyETG1pIhFLzxYwlwTYHg951cdo8dCg/pH1Mie8VrXV5E6MHBRclG/zAFV9cI0wtyey
         OTBljhXTBKtEhA2z1+Vk0HjDjUB7nuUVLgM6AGCZPkHdnoCTsPQS638SYG5v54y3UMWc
         qY/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yy21jKPf3BqO69GaSde9b1IniNH9kQ/Ki9NWW9VeFKU=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=a2cqo3FR2Z8xAwsR6dWtcBaFz+kFW2OmYKSh48yBPDQS+03cjrVwftE3UUH5XBF6n6
         S0g7gzzR7wevO7ZlkDd0k9dN0URRzwjtd0vv6tE45H8nOV9/b+ll/VDrBGzcfOjXw5QA
         +Vo7Xr1U+75LpIA0zolXO0qBkml5pPMXsK+f5qFb/LHlj3Iw2ZIqgDx4vrasNJ0i9/a6
         ophry5DWupHZbIuU+gD+abQZaLuSdGVmBFluzUdcW85Hys1jZe1sW4gDrIozqd12N+dQ
         8nf1Ho9RMqdWNUQtTPUt7fLkqHNlrZNsLo6CjMZtBW8Xejbpd8ktb4LFpm12uwdsSxTU
         V10w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sPQBhYyX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c5347c2fa2si119357926d6.545.2024.09.11.19.44.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2024 19:44:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sPQBhYyX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1soZmC-0003wo-Jd; Wed, 11 Sep 2024 22:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZlz-0002wJ-5C
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:31 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZlw-0004As-OU
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:30 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-206f9b872b2so5508325ad.3
 for <qemu-arm@nongnu.org>; Wed, 11 Sep 2024 19:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726108887; x=1726713687; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yy21jKPf3BqO69GaSde9b1IniNH9kQ/Ki9NWW9VeFKU=;
 b=sPQBhYyXGGtBdZrvwuincdjwGKs2tc5ovwAOKGBzPLipNZqhuR5Hh4sUSScKj4xFMR
 y5msrV8s1MCsC1z4BzekSuC4nQtW4j88DKci578c1J8EupNpS8W5X0s4uJCb1YIIZ8Uy
 nomMaCw/Xg0KBkJBR39m/TA+gSsvoKvGMbXsELzuqu5J8KuNwOIlA07kIENCorETc2d9
 DbCiZqjS3wU1Q/3K8djo4ZvMcMBXve9tuaCeDq8mlUXgF5eq5Zur7geCjEimb6iG9r6M
 h3hVhoHPQvSL9Ww/zZTFkoKp0rZLVAkxybeASdbhzE5eA6E2oMnmJaRtANb/dFnJP7q2
 INJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726108887; x=1726713687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yy21jKPf3BqO69GaSde9b1IniNH9kQ/Ki9NWW9VeFKU=;
 b=pgK7Q9/sUmh/emeR4qxZW+tEvYjZCjLJGxQxb07yM1OVtWE9Wn+bvHSBZEVQj/Si4D
 d8E8kJwMobP0jJNQV+b+m+3jplPXo1I2yFaZ+PD8Fp90CmikLN+gvZCMrNh25JnTGZEn
 plprQsKwulHo9JSJR8e1Ia76h35pYUC5bpnK0VJIRXumQFpXbH4aOZYtv9vDZastZta9
 R3dHlBP42gpClJJ3BLbyfbPl7kDmn2mjF5rdHi2bDQuhL7+H6n/RKZYdphuNo03PtzRj
 7RKEEPslmX8yZXJEprB4HLNkW+dl1JH63YDBYFk7MPgJZ6pS4oPq+GnMYu+H0F+Y7tDy
 a78A==
X-Gm-Message-State: AOJu0YwC0aiH1CONWa4y59IfoJQrAN3wq62G9+rSzCcIcNXsLg/oqf5A
 gFfcHnh5q5dfIlN1fQjzc8X2T24yJBNUu8aN7D6DB8sX07rP0F9+mKJg2YGK9pg=
X-Received: by 2002:a17:902:f78d:b0:205:968b:31cf with SMTP id
 d9443c01a7336-2076e3f6207mr18840995ad.33.1726108887158; 
 Wed, 11 Sep 2024 19:41:27 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076afe9c61sm5635915ad.231.2024.09.11.19.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 19:41:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 12/29] target/arm: Convert FMOVI (scalar,
 immediate) to decodetree
Date: Wed, 11 Sep 2024 19:40:57 -0700
Message-ID: <20240912024114.1097832-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912024114.1097832-1-richard.henderson@linaro.org>
References: <20240912024114.1097832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: J4inaBz669kw

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 74 ++++++++++++----------------------
 target/arm/tcg/a64.decode      |  4 ++
 2 files changed, 30 insertions(+), 48 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index aec2f6a542..0e290062ef 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6888,6 +6888,31 @@ TRANS(FMINNMV_s, do_fp_reduction, a, gen_helper_vfp_minnums)
 TRANS(FMAXV_s, do_fp_reduction, a, gen_helper_vfp_maxs)
 TRANS(FMINV_s, do_fp_reduction, a, gen_helper_vfp_mins)
 
+/*
+ * Floating-point Immediate
+ */
+
+static bool trans_FMOVI_s(DisasContext *s, arg_FMOVI_s *a)
+{
+    switch (a->esz) {
+    case MO_32:
+    case MO_64:
+        break;
+    case MO_16:
+        if (!dc_isar_feature(aa64_fp16, s)) {
+            return false;
+        }
+        break;
+    default:
+        return false;
+    }
+    if (fp_access_check(s)) {
+        uint64_t imm = vfp_expand_imm(a->esz, a->imm);
+        write_fp_dreg(s, a->rd, tcg_constant_i64(imm));
+    }
+    return true;
+}
+
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
  * shift amount is in range (ie 0..31 or 0..63) and provide the ARM
@@ -8625,53 +8650,6 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
     }
 }
 
-/* Floating point immediate
- *   31  30  29 28       24 23  22  21 20        13 12   10 9    5 4    0
- * +---+---+---+-----------+------+---+------------+-------+------+------+
- * | M | 0 | S | 1 1 1 1 0 | type | 1 |    imm8    | 1 0 0 | imm5 |  Rd  |
- * +---+---+---+-----------+------+---+------------+-------+------+------+
- */
-static void disas_fp_imm(DisasContext *s, uint32_t insn)
-{
-    int rd = extract32(insn, 0, 5);
-    int imm5 = extract32(insn, 5, 5);
-    int imm8 = extract32(insn, 13, 8);
-    int type = extract32(insn, 22, 2);
-    int mos = extract32(insn, 29, 3);
-    uint64_t imm;
-    MemOp sz;
-
-    if (mos || imm5) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    switch (type) {
-    case 0:
-        sz = MO_32;
-        break;
-    case 1:
-        sz = MO_64;
-        break;
-    case 3:
-        sz = MO_16;
-        if (dc_isar_feature(aa64_fp16, s)) {
-            break;
-        }
-        /* fallthru */
-    default:
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    imm = vfp_expand_imm(sz, imm8);
-    write_fp_dreg(s, rd, tcg_constant_i64(imm));
-}
-
 /* Handle floating point <=> fixed point conversions. Note that we can
  * also deal with fp <=> integer conversions as a special case (scale == 64)
  * OPTME: consider handling that special case specially or at least skipping
@@ -9091,7 +9069,7 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
             switch (ctz32(extract32(insn, 12, 4))) {
             case 0: /* [15:12] == xxx1 */
                 /* Floating point immediate */
-                disas_fp_imm(s, insn);
+                unallocated_encoding(s); /* in decodetree */
                 break;
             case 1: /* [15:12] == xx10 */
                 /* Floating point compare */
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index c77f9fc987..e11e293631 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1180,3 +1180,7 @@ FMAXV_s         0110 1110 00 11000 01111 10 ..... .....     @rr_q1e2
 
 FMINV_h         0.00 1110 10 11000 01111 10 ..... .....     @qrr_h
 FMINV_s         0110 1110 10 11000 01111 10 ..... .....     @rr_q1e2
+
+# Floating-point Immediate
+
+FMOVI_s         0001 1110 .. 1 imm:8 100 00000 rd:5         esz=%esz_hsd
-- 
2.43.0

