Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1251635dyc;
        Fri, 4 Jul 2025 07:25:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZbn0XScFqPFHk7Um09R4V1irrcIYR9VyzSC58sdPtuae2CiRHThwaJMdOH4XSR2teo5CaYe5TtmsRpA==@linaro.org
X-Google-Smtp-Source: AGHT+IEknGnlVWIXqMuRGRQ5Z0QfyVVc4BbB62HUdkk/0coJ7utIhyI+qK9VgrXIAzyuAOGy2aku
X-Received: by 2002:a05:6214:ca8:b0:701:923:8980 with SMTP id 6a1803df08f44-702c6d3f778mr34073136d6.4.1751639130928;
        Fri, 04 Jul 2025 07:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639130; cv=none;
        d=google.com; s=arc-20240605;
        b=cfC3oSBUUbVNLVPO1B9XkmtmkJ5JIiuxXHc1YqohyKU3iyoA0lDfyQXPazRyMkNeo8
         5dV6rxB2Za4/7balfUUD18FdSZLXrgs56XYY9MAt86b+FolMbgi3z+mPj/kRtrSeQ6pi
         UAbvuvdvr8OcdrQBsY5NIC3s8QqFrc2ZXBkatMQZcBCPscqY3YR0BzvtMVD0c7y7DH6C
         /R4geu7ASzxVTMHxQM/VvrurO9Laz4kRfCMkVf8bnFlqh4FG9k7CriaeAVWwFQ34qPCv
         mKE/yTda1/7An8WFlNloKcr85I9hNYn4gDiNMjEarZ7rX+BgCDJugfo+M2a9gC+1H4hj
         LVlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0C56pC53rSBiH1gXw8XOmTDoJ0Tu3GpRT/rtSHM5KQI=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=GmpkWCf+IA9iAr8MsJtKAAxaQbkM6MfSPG6nbv7g6OUUI4+WMmINcAdmqk4o+gwrzz
         OhS9j68bnxBmfBn9yy7ZAKfTNyrBvIllQFztPQQJ7Jy3IPgDxGytSry2ByKoNPKpnY3A
         t9saTXXNzNxcC8420aaR5Xv8MnX0/uA7/BlLEIsVVKLIcL1T5Zlq06snte6qJhLktt2H
         wwxKdDaqylpazEbuS5DPhBapnw72IwiHJEf1v/8OeErpxMs1/zjmyUSiib/+lqm19xs/
         gnKBcVYBAEN9cmoDmPHi7P1cNPWaL4n/3kMU30kIwISWgaKVTL1fYnjgBF3vh/SmBlFz
         nomg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j2qDHgHI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702c4ccc60bsi20790166d6.78.2025.07.04.07.25.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:25:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j2qDHgHI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXhKx-00015j-5k; Fri, 04 Jul 2025 10:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIJ-0005G6-DN
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:21:43 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIG-0005iG-4i
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:21:38 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-2efc0ed41efso403708fac.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jul 2025 07:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638894; x=1752243694; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0C56pC53rSBiH1gXw8XOmTDoJ0Tu3GpRT/rtSHM5KQI=;
 b=j2qDHgHIqX9qRoMRLoduWM9EoIuTMuySk+OrBIqC+1QtkB1iaKP7L/DgL8xgynadAf
 WYdkoBF2lQjdMvT1LjurWN7NrZz/uH5X+pSeVgTBg/0q7JTq+r+SLO4i03IykQp9zWJS
 4UzkIV8minP730+NSoPS9u5qoGqdHPyZHGOqi+FL11KAXaHO+VguRpedmNFWlyt1t06N
 CysiC86OSzJw+sOxo8Pt4wWYyzAySXgWyp5qxiaDsfq2UEoB1LipeWnm9aqLO9WhS5f1
 J8XbO414RAcUmCbpWvpHkU7qOLaBbhSSt7y2ecSSF8AFDVz/Ueeca42KjNlgAuzzmMsA
 ieaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638894; x=1752243694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0C56pC53rSBiH1gXw8XOmTDoJ0Tu3GpRT/rtSHM5KQI=;
 b=p3jyKlPnlcKINVhEdlpF2KRydJ8J8ZxmHi16ot+auhbXebvKZFJNOZxcWU4fKF0eHy
 8XWnm+mD0179h2OBYdx6lNwTCCTJ70UHYlRvR5sjdglb1tVF4UcW41On+unIaQIqKDHm
 CNIDQ7GC+pIjAS6KXJyBaCxgz7BJntAeyoo/PcsKWVY91yU0oTilFisNLnwLgb39J8vN
 7vFwmk1+NJ1i/XGVALOFLMTBbQ4JY6s9REOpkNpIHhw0yKVYUvEALgXSs0Z+blKe3knx
 eVr+RB2/M23LvuKWfQ5lmZEVIXWc2Itq3GgFpQ1hxiQ/UxuRtxbpyvzMyBb4n1gLnHcE
 ilKw==
X-Gm-Message-State: AOJu0YzQ6Bjq4SvvNpymQKbhe6RMNVw90YYEnoLlEclv0VSuwNCysRiZ
 hUig+i6n8rxtJxHy/S46RRoLfnauYVurwVEOpoOvi6rLmVSZ/tWf0CHd1QiLpLmOIpEv0wrOzi1
 iKeDYLO4=
X-Gm-Gg: ASbGnctYhx2Zx7OKpcorbgeDTQXKzqLmCjXqOk+PQ8dp+Se/qPaiP3Otw8bHoT6kjw3
 1tEHeu8+jyicoNDylJwMjaLtzUBnAqtrgiixkySOHPCv4eg5eIHz8EQghNIKt4U2wVbJxju7zdP
 NCwXy5uk3Sa3WgsFkAvZt6ZZNxto1W+FkX3QrYqSCAFgsJ8IyMcSLSwIiBiqFeffbmFJUox+Jkz
 6NJN89hnzPBanxZZTpDBEL/ZKgh/iOvC5BEvX4IwzqugMJnDW80+iQdUidm/wOJc/g8h8hZfm4B
 8zaYGgAMC/TUIYY0PvMUfpVFdBcV3gj+GDjTU3rfS6jspEj30/lVik5IPGEi8XxMJJDgd0/PpxO
 3fMy8zkwI/9mHds7fBv86qgyCef5Nlry1r57BBYJASuEsnkYn86ReAivjbhQ=
X-Received: by 2002:a05:6870:391e:b0:2ef:de7e:544d with SMTP id
 586e51a60fabf-2f796c848f8mr1783872fac.27.1751638894363; 
 Fri, 04 Jul 2025 07:21:34 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 018/108] target/arm: Add alignment argument to gen_sve_{ldr, str}
Date: Fri,  4 Jul 2025 08:19:41 -0600
Message-ID: <20250704142112.1018902-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: MdGmIaDuDqSE

Honor AlignmentEnforced() for LDR/STR (vector),
(predicate), and (array vector).

Within the expansion functions, clear @align when we're
done emitting loads at the largest size.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.h |  6 ++--
 target/arm/tcg/translate-sme.c |  5 ++--
 target/arm/tcg/translate-sve.c | 50 ++++++++++++++++++++++++----------
 3 files changed, 42 insertions(+), 19 deletions(-)

diff --git a/target/arm/tcg/translate-a64.h b/target/arm/tcg/translate-a64.h
index b2420f59eb..8a9f4b2053 100644
--- a/target/arm/tcg/translate-a64.h
+++ b/target/arm/tcg/translate-a64.h
@@ -225,7 +225,9 @@ void gen_gvec_usqadd_qc(unsigned vece, uint32_t rd_ofs,
                         uint32_t rn_ofs, uint32_t rm_ofs,
                         uint32_t opr_sz, uint32_t max_sz);
 
-void gen_sve_ldr(DisasContext *s, TCGv_ptr, int vofs, int len, int rn, int imm);
-void gen_sve_str(DisasContext *s, TCGv_ptr, int vofs, int len, int rn, int imm);
+void gen_sve_ldr(DisasContext *s, TCGv_ptr, int vofs,
+                 int len, int rn, int imm, MemOp align);
+void gen_sve_str(DisasContext *s, TCGv_ptr, int vofs,
+                 int len, int rn, int imm, MemOp align);
 
 #endif /* TARGET_ARM_TRANSLATE_A64_H */
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 246f191eca..1dbd0199af 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -269,7 +269,7 @@ static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
     return true;
 }
 
-typedef void GenLdStR(DisasContext *, TCGv_ptr, int, int, int, int);
+typedef void GenLdStR(DisasContext *, TCGv_ptr, int, int, int, int, MemOp);
 
 static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
 {
@@ -284,7 +284,8 @@ static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
     /* ZA[n] equates to ZA0H.B[n]. */
     base = get_tile_rowcol(s, MO_8, a->rv, imm, false);
 
-    fn(s, base, 0, svl, a->rn, imm * svl);
+    fn(s, base, 0, svl, a->rn, imm * svl,
+       s->align_mem ? MO_ALIGN_16 : MO_UNALN);
     return true;
 }
 
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 8403034a0e..d2cd298b5b 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4160,7 +4160,7 @@ TRANS_FEAT(UCVTF_dd, aa64_sve, gen_gvec_fpst_arg_zpz,
  */
 
 void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
-                 int len, int rn, int imm)
+                 int len, int rn, int imm, MemOp align)
 {
     int len_align = QEMU_ALIGN_DOWN(len, 16);
     int len_remain = len % 16;
@@ -4189,12 +4189,15 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
 
         for (i = 0; i < len_align; i += 16) {
             tcg_gen_qemu_ld_i128(t16, clean_addr, midx,
-                                 MO_LE | MO_128 | MO_ATOM_NONE);
+                                 MO_LE | MO_128 | MO_ATOM_NONE | align);
             tcg_gen_extr_i128_i64(t0, t1, t16);
             tcg_gen_st_i64(t0, base, vofs + i);
             tcg_gen_st_i64(t1, base, vofs + i + 8);
             tcg_gen_addi_i64(clean_addr, clean_addr, 16);
         }
+        if (len_align) {
+            align = MO_UNALN;
+        }
     } else {
         TCGLabel *loop = gen_new_label();
         TCGv_ptr tp, i = tcg_temp_new_ptr();
@@ -4204,7 +4207,7 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
 
         t16 = tcg_temp_new_i128();
         tcg_gen_qemu_ld_i128(t16, clean_addr, midx,
-                             MO_LE | MO_128 | MO_ATOM_NONE);
+                             MO_LE | MO_128 | MO_ATOM_NONE | align);
         tcg_gen_addi_i64(clean_addr, clean_addr, 16);
 
         tp = tcg_temp_new_ptr();
@@ -4219,6 +4222,7 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
         tcg_gen_st_i64(t1, tp, vofs + 8);
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
+        align = MO_UNALN;
     }
 
     /*
@@ -4227,7 +4231,9 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
      */
     if (len_remain >= 8) {
         t0 = tcg_temp_new_i64();
-        tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUQ | MO_ATOM_NONE);
+        tcg_gen_qemu_ld_i64(t0, clean_addr, midx,
+                            MO_LEUQ | MO_ATOM_NONE | align);
+        align = MO_UNALN;
         tcg_gen_st_i64(t0, base, vofs + len_align);
         len_remain -= 8;
         len_align += 8;
@@ -4242,12 +4248,14 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
         case 4:
         case 8:
             tcg_gen_qemu_ld_i64(t0, clean_addr, midx,
-                                MO_LE | ctz32(len_remain) | MO_ATOM_NONE);
+                                MO_LE | ctz32(len_remain)
+                                | MO_ATOM_NONE | align);
             break;
 
         case 6:
             t1 = tcg_temp_new_i64();
-            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUL | MO_ATOM_NONE);
+            tcg_gen_qemu_ld_i64(t0, clean_addr, midx,
+                                MO_LEUL | MO_ATOM_NONE | align);
             tcg_gen_addi_i64(clean_addr, clean_addr, 4);
             tcg_gen_qemu_ld_i64(t1, clean_addr, midx, MO_LEUW | MO_ATOM_NONE);
             tcg_gen_deposit_i64(t0, t0, t1, 32, 32);
@@ -4262,7 +4270,7 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
 
 /* Similarly for stores.  */
 void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
-                 int len, int rn, int imm)
+                 int len, int rn, int imm, MemOp align)
 {
     int len_align = QEMU_ALIGN_DOWN(len, 16);
     int len_remain = len % 16;
@@ -4294,9 +4302,12 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
             tcg_gen_ld_i64(t1, base, vofs + i + 8);
             tcg_gen_concat_i64_i128(t16, t0, t1);
             tcg_gen_qemu_st_i128(t16, clean_addr, midx,
-                                 MO_LE | MO_128 | MO_ATOM_NONE);
+                                 MO_LE | MO_128 | MO_ATOM_NONE | align);
             tcg_gen_addi_i64(clean_addr, clean_addr, 16);
         }
+        if (len_align) {
+            align = MO_UNALN;
+        }
     } else {
         TCGLabel *loop = gen_new_label();
         TCGv_ptr tp, i = tcg_temp_new_ptr();
@@ -4320,13 +4331,16 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         tcg_gen_addi_i64(clean_addr, clean_addr, 16);
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
+        align = MO_UNALN;
     }
 
     /* Predicate register stores can be any multiple of 2.  */
     if (len_remain >= 8) {
         t0 = tcg_temp_new_i64();
         tcg_gen_ld_i64(t0, base, vofs + len_align);
-        tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUQ | MO_ATOM_NONE);
+        tcg_gen_qemu_st_i64(t0, clean_addr, midx,
+                            MO_LEUQ | MO_ATOM_NONE | align);
+        align = MO_UNALN;
         len_remain -= 8;
         len_align += 8;
         if (len_remain) {
@@ -4342,11 +4356,13 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         case 4:
         case 8:
             tcg_gen_qemu_st_i64(t0, clean_addr, midx,
-                                MO_LE | ctz32(len_remain) | MO_ATOM_NONE);
+                                MO_LE | ctz32(len_remain)
+                                | MO_ATOM_NONE | align);
             break;
 
         case 6:
-            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUL | MO_ATOM_NONE);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx,
+                                MO_LEUL | MO_ATOM_NONE | align);
             tcg_gen_addi_i64(clean_addr, clean_addr, 4);
             tcg_gen_shri_i64(t0, t0, 32);
             tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUW | MO_ATOM_NONE);
@@ -4366,7 +4382,8 @@ static bool trans_LDR_zri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = vec_full_reg_size(s);
         int off = vec_full_reg_offset(s, a->rd);
-        gen_sve_ldr(s, tcg_env, off, size, a->rn, a->imm * size);
+        gen_sve_ldr(s, tcg_env, off, size, a->rn, a->imm * size,
+                    s->align_mem ? MO_ALIGN_16 : MO_UNALN);
     }
     return true;
 }
@@ -4379,7 +4396,8 @@ static bool trans_LDR_pri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = pred_full_reg_size(s);
         int off = pred_full_reg_offset(s, a->rd);
-        gen_sve_ldr(s, tcg_env, off, size, a->rn, a->imm * size);
+        gen_sve_ldr(s, tcg_env, off, size, a->rn, a->imm * size,
+                    s->align_mem ? MO_ALIGN_2 : MO_UNALN);
     }
     return true;
 }
@@ -4392,7 +4410,8 @@ static bool trans_STR_zri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = vec_full_reg_size(s);
         int off = vec_full_reg_offset(s, a->rd);
-        gen_sve_str(s, tcg_env, off, size, a->rn, a->imm * size);
+        gen_sve_str(s, tcg_env, off, size, a->rn, a->imm * size,
+                    s->align_mem ? MO_ALIGN_16 : MO_UNALN);
     }
     return true;
 }
@@ -4405,7 +4424,8 @@ static bool trans_STR_pri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = pred_full_reg_size(s);
         int off = pred_full_reg_offset(s, a->rd);
-        gen_sve_str(s, tcg_env, off, size, a->rn, a->imm * size);
+        gen_sve_str(s, tcg_env, off, size, a->rn, a->imm * size,
+                    s->align_mem ? MO_ALIGN_2 : MO_UNALN);
     }
     return true;
 }
-- 
2.43.0

