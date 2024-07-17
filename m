Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp614854njk;
        Tue, 16 Jul 2024 23:09:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXI9UqSWR719DppKD/ne6JdRmrJLpvFZAVl10HqwhiAvBMzDlPsJi584goHrBkR6237JHzSrNZREwIMcMBk+uCUTWNoKj5n
X-Google-Smtp-Source: AGHT+IEWLn3GBwpyXN+BJlF2O6a7ReDuQ9Nw9SVSb2DrqXRjfuAmmiygPzJo2sXmt5ITsSbJ+f6L
X-Received: by 2002:a05:620a:2450:b0:79f:1eb:d76c with SMTP id af79cd13be357-7a18749d793mr60571685a.43.1721196589359;
        Tue, 16 Jul 2024 23:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721196589; cv=none;
        d=google.com; s=arc-20160816;
        b=HNmQMyZkvoqAFDJhYBwiLWLVKSdXC1MWyxeSNdKc0vPxdHjls4psJ1QZ2gRMAgU03/
         mZknP4YdqJy2WxbHtZioxeEQi/CP3vh0CWbeUU05OvALISJTizJaBK8QxA+0JvAE+rty
         uBjYGuwPiTI+7hUcYKQnsOaWkIjrLa/bgJlM9cGsOcC3v5hnU4qIBricBtVuh2zeeOYm
         aeFKZVFL079sQYq1NqXsiQ38uD6Qj/uzC49JvIoJGC2as8fAWcaKrip331c/YIdH3l7c
         jGOGsn+gXfNnant3AaVqk7p1CUg11kDLkr5s9L9guvxAh9jI0DlT/YjL11QRSJRugHro
         /ANw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AQvo1o7d9A2n1k+IrItgyP1l57+YBBMV11r5JjrVtfk=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=r4qtpKRI50tFas/V5bM74aWznPt4ZZAKvodrLnWEW+Ucx2C6wDyWDXYb6B/eys1u+k
         I90bIcmIXWoekO4S3qfqCY9q6LmBQfhe7BPwbL83GC7OhieQwYGX3NVzhxqVK6DcH3Fb
         +NqdIyrg7HU/n3zm4e7vDWxR+yOmyK58DM8cjm76OKtwAnCTgOPamJWwBWU+CUQfXFg3
         RepzKiojoNYIlTFduVRKxmWVO757jlF6/gtFErXuuzxda9bWcHe2FDN6pp+CFbSV5Mw4
         BER6EskIyYb5CtshT0+uJHkh3DUAJxqmsT+z++du9H5g8GeC5fL30K9x37XeJkjtNXL6
         nnnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bTHSlWY9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c692f6si916736685a.442.2024.07.16.23.09.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bTHSlWY9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTxrD-0004xP-VU; Wed, 17 Jul 2024 02:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxqy-00042c-Jv
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:09:33 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxqv-000324-Gm
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:09:28 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-70b702be5e4so3403285b3a.0
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 23:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721196564; x=1721801364; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQvo1o7d9A2n1k+IrItgyP1l57+YBBMV11r5JjrVtfk=;
 b=bTHSlWY972Yo8enAQG7koeGtzCj302e3F8lh8IUwI8UWWgShhZ1NXd8vIYdUcQqUi9
 VNBkIHxNPpFKbqpd4zfbsYBGulqB89NH7miKTIiJ5Y0hQ7dMta7d4I3OjBYFf5K0crVz
 rMWAl35BYxlEUDYx3DoY9qtg7hvZUYrKn1lymNHap0uUM3j4dR2vUlH6x+JBikzSt17S
 EjKWZjo8vXwhlxrs20PWVpe96QWM7Z2YYTtUZrpkDQWBo33MG3kNNDcU5kmHMzfY9CNq
 /y8xUZkNGEtxux3GoRga5lUtaiU+Ig28Lza54bsF8fO/ofBNHP8lso0codgYpTNLUOuF
 9goA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721196564; x=1721801364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AQvo1o7d9A2n1k+IrItgyP1l57+YBBMV11r5JjrVtfk=;
 b=ZrOR5QCU2o95khXqR09i6n0wOkyI1NbxUH8VRhN8ni8JwlmHn3AoCgCDYrHP5br3We
 TUN5UZWCLV9f8Oexx+BQC8l/xJjvPlVjdvQVKx2iqfCUv2Zb3cdGyoPTrCZ3JXyO96oL
 GS8tFdCzbDCmd7VmH0+xMt6ITkMvGs2/GYi+BasxwuVYTRxdIcwDPrvpugfx84/T9mw2
 fXn1d61LqDL0RfkfKYAvZ4sIpVS+tlzC0jcL2x8mr8dGDdKlCnco17VeERPP5NJC/WvP
 hZTdGIEH0g6oQkD+CMFlr4v+6kTbX1O+xUkYwFrmeB9n1a44+2LdVnezQiGQjAzL0UI5
 nFPg==
X-Gm-Message-State: AOJu0Yw1hbU0G9RHZvrbnTWtKq2T3aUi3tREW10pMxsJ8c/VLFxRfOV7
 v1sH25DZTAwwMhVXX6FzXdMztEwtNoe9qOgcAERKDYpugTaTxpJEE/ISq5ZO3oF/TBosX+Au7ji
 dcdM=
X-Received: by 2002:a05:6a00:1250:b0:704:2696:d08e with SMTP id
 d2e1a72fcca58-70ce4f8e96bmr752191b3a.13.1721196563795; 
 Tue, 16 Jul 2024 23:09:23 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ecd603bsm7330404b3a.219.2024.07.16.23.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 23:09:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 05/17] target/arm: Simplify do_reduction_op
Date: Wed, 17 Jul 2024 16:08:51 +1000
Message-ID: <20240717060903.205098-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717060903.205098-1-richard.henderson@linaro.org>
References: <20240717060903.205098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: Ve8T/Pld6Guw

Use simple shift and add instead of ctpop, ctz, shift and mask.
Unlike SVE, there is no predicate to disable elements.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 40 +++++++++++-----------------------
 1 file changed, 13 insertions(+), 27 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index e0314a1253..6d2e1a2d80 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8986,34 +8986,23 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
  * important for correct NaN propagation that we do these
  * operations in exactly the order specified by the pseudocode.
  *
- * This is a recursive function, TCG temps should be freed by the
- * calling function once it is done with the values.
+ * This is a recursive function.
  */
 static TCGv_i32 do_reduction_op(DisasContext *s, int fpopcode, int rn,
-                                int esize, int size, int vmap, TCGv_ptr fpst)
+                                MemOp esz, int ebase, int ecount, TCGv_ptr fpst)
 {
-    if (esize == size) {
-        int element;
-        MemOp msize = esize == 16 ? MO_16 : MO_32;
-        TCGv_i32 tcg_elem;
-
-        /* We should have one register left here */
-        assert(ctpop8(vmap) == 1);
-        element = ctz32(vmap);
-        assert(element < 8);
-
-        tcg_elem = tcg_temp_new_i32();
-        read_vec_element_i32(s, tcg_elem, rn, element, msize);
+    if (ecount == 1) {
+        TCGv_i32 tcg_elem = tcg_temp_new_i32();
+        read_vec_element_i32(s, tcg_elem, rn, ebase, esz);
         return tcg_elem;
     } else {
-        int bits = size / 2;
-        int shift = ctpop8(vmap) / 2;
-        int vmap_lo = (vmap >> shift) & vmap;
-        int vmap_hi = (vmap & ~vmap_lo);
+        int half = ecount >> 1;
         TCGv_i32 tcg_hi, tcg_lo, tcg_res;
 
-        tcg_hi = do_reduction_op(s, fpopcode, rn, esize, bits, vmap_hi, fpst);
-        tcg_lo = do_reduction_op(s, fpopcode, rn, esize, bits, vmap_lo, fpst);
+        tcg_hi = do_reduction_op(s, fpopcode, rn, esz,
+                                 ebase + half, half, fpst);
+        tcg_lo = do_reduction_op(s, fpopcode, rn, esz,
+                                 ebase, half, fpst);
         tcg_res = tcg_temp_new_i32();
 
         switch (fpopcode) {
@@ -9064,7 +9053,6 @@ static void disas_simd_across_lanes(DisasContext *s, uint32_t insn)
     bool is_u = extract32(insn, 29, 1);
     bool is_fp = false;
     bool is_min = false;
-    int esize;
     int elements;
     int i;
     TCGv_i64 tcg_res, tcg_elt;
@@ -9111,8 +9099,7 @@ static void disas_simd_across_lanes(DisasContext *s, uint32_t insn)
         return;
     }
 
-    esize = 8 << size;
-    elements = (is_q ? 128 : 64) / esize;
+    elements = (is_q ? 16 : 8) >> size;
 
     tcg_res = tcg_temp_new_i64();
     tcg_elt = tcg_temp_new_i64();
@@ -9167,9 +9154,8 @@ static void disas_simd_across_lanes(DisasContext *s, uint32_t insn)
          */
         TCGv_ptr fpst = fpstatus_ptr(size == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
         int fpopcode = opcode | is_min << 4 | is_u << 5;
-        int vmap = (1 << elements) - 1;
-        TCGv_i32 tcg_res32 = do_reduction_op(s, fpopcode, rn, esize,
-                                             (is_q ? 128 : 64), vmap, fpst);
+        TCGv_i32 tcg_res32 = do_reduction_op(s, fpopcode, rn, size,
+                                             0, elements, fpst);
         tcg_gen_extu_i32_i64(tcg_res, tcg_res32);
     }
 
-- 
2.43.0

