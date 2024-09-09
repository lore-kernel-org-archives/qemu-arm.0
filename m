Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp984414njb;
        Mon, 9 Sep 2024 09:24:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXuMMBphHCtf56AVR50jT8MZxZWgvCivdbVOO/Y6gyH7FakgsTiLwFGEE2Hs0J9fIB2VOeuQQWZXyX36Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGY66cfnTpqjN5W+v1U5qhH33SPUhYu7g/FhvzIBMBjjoQ5JasI/+Hvbu8buNs4ysJoILOG
X-Received: by 2002:a05:6214:3903:b0:6b5:ab8:3c67 with SMTP id 6a1803df08f44-6c5282fdc8dmr113324436d6.12.1725899081721;
        Mon, 09 Sep 2024 09:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725899081; cv=none;
        d=google.com; s=arc-20240605;
        b=EdAibzHJfVxwPUkrB17OoBjE5kg88xoZxATP+tfr8zc1+vDJ/0lZpJd9sdRlXU2Ynx
         QxrC2T8589YCxFN61JrvcLiqASZyXso1Cg1KPL0sKr+m+giB76uqeLB8N4RaaxyiLDOQ
         DQ58MkbM/5r37wtzxxcM5rqJd0oW9wbQzH/n/qs3Ndd0XRvFeAdc9iUzYez1/+3LWz/r
         wIc6yrc1o1I7UILEaPM5L4Am5KT51Pu/DMHYoMWu5ibWH6Xey+KudT0j+zSD1T9i7wlk
         TyNXupv5f8lygj44peemjGw2i4JLRasPHfBhbH/5qV8S3l+996gpzcTFNoFxkYlykiQQ
         Wisg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yy21jKPf3BqO69GaSde9b1IniNH9kQ/Ki9NWW9VeFKU=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=INSYg8BUl3TmTPb/Cjs3NPt8LW2ptTW18uNq8KbC/Yjjr2RQV+jc3sV5y8ygOSbvbp
         5SB3PrQUG9+bThFKa2A/fbsS6Swr1bgWX4j8f0VVJeXbJREiSMkFggNLLqtPloxM8iR2
         R4TMfPT7P4nwJTrGkkjPb8FF1idUB4Fwk9JowKM5GY4JcD3trM1UqbWZNMRJPa1B3nRI
         MoZhQdL3ewXJ6hQnb0DVXmTw/uYhfUShNJ0MoX3L74cL4wjyvctVt7rqKpRcbXwlVSp+
         8g/tRLdR6XUQ7nzDkekXpivwk6tNYrfvmX+YgAKDAwSnWKAxGrobmgtbgK42tMirbnBU
         ApVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yxlJEW43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c5348ca10fsi59547396d6.581.2024.09.09.09.24.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 09:24:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yxlJEW43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snhAI-0002mn-7F; Mon, 09 Sep 2024 12:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhAG-0002fl-LX
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 12:22:56 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhAE-0007jR-Te
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 12:22:56 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-20688fbaeafso44526575ad.0
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 09:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725898973; x=1726503773; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yy21jKPf3BqO69GaSde9b1IniNH9kQ/Ki9NWW9VeFKU=;
 b=yxlJEW43qJCXPL8dK/jE7DZcOv12ItTM/1/lhKb5G+syDccBc7KNxBedXaIlhzPzUq
 OFiNl0x8h6FP6xnJRhTkz2FDFnIuQSGhRGisoJMTU8HlFrgpcMU6GmUbhinksYVa8inl
 aqPAWUO7sVF4b54u9eRAuWSsywz1EqMjTrozqf281kMnsjfeY7qk9VaY/a/TxNg9LB8V
 3W27kGK1meimD4SduGxGOhh+eH22cywUCIIUjgS7UtXw4ZMY6aSQzGEl3Gogu/6A2yfq
 R3DQDcRkue+qWn1/Zzf4NeWdncFRasUd8Yd+ztYbZQdukMzrsrM5rS99KkcGV/YnZG1/
 nACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725898973; x=1726503773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yy21jKPf3BqO69GaSde9b1IniNH9kQ/Ki9NWW9VeFKU=;
 b=IJPgVsLKyEu3/1e2ycROFWrDeYS/nVmzeUiwHzZ4CGhv9dYIPSaKCulXsJwhWywcZK
 Zx8A7llH+qkO4ASfxqpty9Mn1+DYSJ1P2sizdFcSdJNNmh/zW8yvmNzYf5aWr+qoWp96
 EA76XbhdzeeBs/FwoIls2/vmybjL22wgGnzHTzNejt03FSplrI2hzD0HMa45TcMyoVFw
 Xgn7LarI8yp941q89fzvuabcqhP0lVfwEOcONjDhkYfWwTmSPYLumcmnfQqBoiRH10XX
 2nnHzUacsNaIIE9wKM38v2GvMjlJXvp5GL+usGP324CPM0fSYYZpWBdr3L2pRtTq68m0
 nEaw==
X-Gm-Message-State: AOJu0Ywmmc7+YtZ879Ckqxxel5MYjVyAphCgUsGUHO8VB5VBuB1aoi7Q
 Gat0Zk7WR5wsiEKlIgaCaBT1KOHv+KRrR0hFrhY5MZvubiKdPhlVrzXSsueETgQjP7XdnySwKjB
 5
X-Received: by 2002:a17:903:41c6:b0:205:82d5:2368 with SMTP id
 d9443c01a7336-206f05f6136mr129970015ad.49.1725898973469; 
 Mon, 09 Sep 2024 09:22:53 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20710f35d79sm35753305ad.288.2024.09.09.09.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:22:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 12/29] target/arm: Convert FMOVI (scalar,
 immediate) to decodetree
Date: Mon,  9 Sep 2024 09:22:22 -0700
Message-ID: <20240909162240.647173-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162240.647173-1-richard.henderson@linaro.org>
References: <20240909162240.647173-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: 806yv8ivdBZG

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

