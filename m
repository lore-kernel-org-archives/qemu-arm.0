Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1252265dyc;
        Fri, 4 Jul 2025 07:26:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYctW2JONrDNC8+9h7ANaaN7q4kdIdX8W4ZnCDWlfSZCcfYTtS4pmNelxCK5unLPFYAh1ssXAy03XWYQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEvKolpbJpX44pegsLRlOwRsNeu1GHzPlRWyVUGQjgrDH2I6gKeU57reIy/b4Z3n/3+sLiz
X-Received: by 2002:a05:622a:355:b0:4a7:817e:c345 with SMTP id d75a77b69052e-4a9957f4213mr46705031cf.24.1751639189912;
        Fri, 04 Jul 2025 07:26:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639189; cv=none;
        d=google.com; s=arc-20240605;
        b=J1GslzKZURJ//0p0HtiE504UhCx85QOVBUSA6tPFXrwKraOEPTxkhIUwqT3Dlnx6A1
         dE006s3jpLCj9wmxHBzHiiSQNh3sntO5eYYzILkkPQioSaIMVyLpsqJoA4C2Kzt1UFbm
         hLRzt0ARxuOwkey36Bj8lIATnuAb59mI4480GLPxe1i7cBjvu4Dxy7H73KALpGHpSwnf
         QkClXbNYtanIIhlz6UrB9IN7u7rGO8H5gC2Rqcf4Av2zz9AxmyCDphmAIn9ImXZTxAHf
         RvnqBE5ThCoMDgUKc8+kLeaiiYE/B0kjuoYqTyZ4r2o4ZthfLwtNTF6mAAnW0ww4oaCR
         TCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BGYgwCm9XTJh3Jv7tUzNjmQDxtUUB3eW8c2+NqQ6fB4=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=g5+YyIp49tHrpeAXVGwGuMMz3OVzfhNGyG4Vggon6nNBUNo3yxugYA7d18/Dbfwbac
         04gQAeQajY/uqh1rr5m//RliJqpsCY29CiCCi8MeFVSBgl1oU/04Hp0ujdwbQfb1aANq
         A8dE8bLA0JCnscbWZZ3OJQJlwnP/JbDKNNY4OOnWlKuPesEYgq2AWcq7A7KeogVRQKHd
         qDUInq8md2TwVzehZ2yzMdM1te3RphJpaQfX1r2PsVbgZpBUeu8apklbeiMQFOUI746O
         lmsMcLtoOAxXTrvlJdbNYfCz5D4VD5uEXRABcN8fOyvKiLNNZ5xw/ytOellOdPSLSwRJ
         pyJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C4shi1AC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a9949f384asi21434341cf.22.2025.07.04.07.26.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:26:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C4shi1AC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhLd-0003cU-Nr; Fri, 04 Jul 2025 10:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIL-0005Hd-3y
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:43 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIJ-0005qG-1I
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:40 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2cc89c59cc0so1315488fac.0
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638897; x=1752243697; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BGYgwCm9XTJh3Jv7tUzNjmQDxtUUB3eW8c2+NqQ6fB4=;
 b=C4shi1ACYr3AZDxvxj1gB7KJuxxB055i98/W/47IhEtP9yCv4qgyDr88m7zqUBWrhY
 dFHBlykGderhVVzzYsd2CsT4owv7fXYYsxDBOgrQjsF6TY1UolAQCZBJT1qYVCSoHMMa
 B6mDMp4kqnZhLrKdC7y5kFWz3elKBxhwM95IIcMthiCQDiticJXs3gMV1uHlTWG3rym7
 bL4nfSbzjQYTscQW2hQYfB/b43zTxhdS7ZTQ/thtYFPgL6yHWWDqjW5FM+s+YHURzZLB
 X+h8bnrWOZEmKXFSTmeKdRccDp/hCoUgopdSAMsYmepWUCXjHS/aVNehHcd9h+KXfl/J
 5ZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638897; x=1752243697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BGYgwCm9XTJh3Jv7tUzNjmQDxtUUB3eW8c2+NqQ6fB4=;
 b=oGdf9AYPJwxjrKAT2WEH7yHvgUIYJ4wq1boYmZM3VvIvnqCHUdNG0+myYcptE6gJLk
 Nblrhfey+pvERr8KzJ3SivYS+Iz9ZmLArcTuAVYugWg7lHSK7hypEKm8gAgfOU6hxDHU
 q3XAJVo0h3vSacmxQrW9L9rjRWr+U+W5RGH5mxP6jGHmoIiZ+PqJP0I3yDvayi31fWEf
 25+ndLF4wU3gAnpr6rFVdrXs34b0ieEEVIwZAj4voNT1Q204OPvuAzEgN6dfEBQSYJOB
 kJ2vCMXtokoGdgDI3gXoTKltMJoo5uX+7R9w2pOi/BlXnYuY+pbM5NfsNRPB7eYP5Zk5
 tGjQ==
X-Gm-Message-State: AOJu0YxxBMLb51dAMW6F+ic0eOgin8kpbVj20l6iS+a160LWpYqv/ffu
 XHDU4MFfiCfy/IBw3zT/xxU5wCJzh4kJOtEfIHaHX5BkjMUsFNByGL+6AwBr0TJzVZ2X7ZspYT7
 CYpb3V1Q=
X-Gm-Gg: ASbGncsJA2H505ubK9IkPfpsVOhfC30Aeo0OP9K+7wtPotQ3OBC7tyXImygrMI+41qW
 HKFKYoYOlUP2+y6oNBvMP15qXZyksW7/VasGc3kVtUYDifxeZqBV8KaDWp0i+uLZrLlGxxoz6ri
 OpRNItsQlkFiSHWJWEJVnBMrzc9q/BvGVu68Xf/MJkt8kQucxHjarro2vsdIX9hx+1dJmfc+Duz
 kf9Ig8f5UKb1zPIaza0CMCOeCtwrmcUslsyjhjY3/ElKnbMPIuEKvrxgwCfdrQMlliGPzla1JrK
 KLvZ0kaEE4L4sKZZaDZbMAqfmnoW7V4cIZQ0P/PmiKtiy5ebzomibGNT4miZSUwFD7jkmU5bH6q
 B4SWLdl514Cvd7P9anxv0EZkzIKQyNRWEMEftqVeJ/mpUhtEVwlby2juGLUM=
X-Received: by 2002:a05:6870:2103:b0:2eb:a2ec:dc02 with SMTP id
 586e51a60fabf-2f7903f154emr2599345fac.11.1751638897229; 
 Fri, 04 Jul 2025 07:21:37 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 021/108] target/arm: Split get_tile_rowcol argument
 tile_index
Date: Fri,  4 Jul 2025 08:19:44 -0600
Message-ID: <20250704142112.1018902-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
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
X-TUID: D695JAUR4GJh

Decode tile number and index offset beforehand and separately.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 17 +++++--------
 target/arm/tcg/sme.decode      | 46 +++++++++++++++++++++++-----------
 2 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 797035e289..e22ec393fd 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -41,15 +41,10 @@ static bool sme2_zt0_enabled_check(DisasContext *s)
     return true;
 }
 
-/*
- * Resolve tile.size[index] to a host pointer, where tile and index
- * are always decoded together, dependent on the element size.
- */
+/* Resolve tile.size[rs+imm] to a host pointer. */
 static TCGv_ptr get_tile_rowcol(DisasContext *s, int esz, int rs,
-                                int tile_index, bool vertical)
+                                int tile, int imm, bool vertical)
 {
-    int tile = tile_index >> (4 - esz);
-    int index = esz == MO_128 ? 0 : extract32(tile_index, 0, 4 - esz);
     int pos, len, offset;
     TCGv_i32 tmp;
     TCGv_ptr addr;
@@ -57,7 +52,7 @@ static TCGv_ptr get_tile_rowcol(DisasContext *s, int esz, int rs,
     /* Compute the final index, which is Rs+imm. */
     tmp = tcg_temp_new_i32();
     tcg_gen_trunc_tl_i32(tmp, cpu_reg(s, rs));
-    tcg_gen_addi_i32(tmp, tmp, index);
+    tcg_gen_addi_i32(tmp, tmp, imm);
 
     /* Prepare a power-of-two modulo via extraction of @len bits. */
     len = ctz32(streaming_vec_reg_size(s)) - esz;
@@ -185,7 +180,7 @@ static bool trans_MOVA(DisasContext *s, arg_MOVA *a)
         return true;
     }
 
-    t_za = get_tile_rowcol(s, a->esz, a->rs, a->za_imm, a->v);
+    t_za = get_tile_rowcol(s, a->esz, a->rs, a->za, a->off, a->v);
     t_zr = vec_full_reg_ptr(s, a->zr);
     t_pg = pred_full_reg_ptr(s, a->pg);
 
@@ -264,7 +259,7 @@ static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
         return true;
     }
 
-    t_za = get_tile_rowcol(s, a->esz, a->rs, a->za_imm, a->v);
+    t_za = get_tile_rowcol(s, a->esz, a->rs, a->za, a->off, a->v);
     t_pg = pred_full_reg_ptr(s, a->pg);
     addr = tcg_temp_new_i64();
 
@@ -295,7 +290,7 @@ static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
     }
 
     /* ZA[n] equates to ZA0H.B[n]. */
-    base = get_tile_rowcol(s, MO_8, a->rv, imm, false);
+    base = get_tile_rowcol(s, MO_8, a->rv, 0, imm, false);
 
     fn(s, base, 0, svl, a->rn, imm * svl,
        s->align_mem ? MO_ALIGN_16 : MO_UNALN);
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 83ca6a9104..efe369e079 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -27,17 +27,29 @@ ZERO_zt0        11000000 01 001 00000000000 00000001
 ### SME Move into/from Array
 
 %mova_rs        13:2 !function=plus_12
-&mova           esz rs pg zr za_imm v:bool to_vec:bool
+&mova           esz rs pg zr za off v:bool to_vec:bool
 
-MOVA            11000000 esz:2 00000 0 v:1 .. pg:3 zr:5 0 za_imm:4  \
-                &mova to_vec=0 rs=%mova_rs
-MOVA            11000000 11    00000 1 v:1 .. pg:3 zr:5 0 za_imm:4  \
-                &mova to_vec=0 rs=%mova_rs esz=4
+MOVA            11000000 00 00000 0 v:1 .. pg:3 zr:5 0 off:4  \
+                &mova to_vec=0 rs=%mova_rs esz=0 za=0
+MOVA            11000000 01 00000 0 v:1 .. pg:3 zr:5 0 za:1 off:3  \
+                &mova to_vec=0 rs=%mova_rs esz=1
+MOVA            11000000 10 00000 0 v:1 .. pg:3 zr:5 0 za:2 off:2  \
+                &mova to_vec=0 rs=%mova_rs esz=2
+MOVA            11000000 11 00000 0 v:1 .. pg:3 zr:5 0 za:3 off:1  \
+                &mova to_vec=0 rs=%mova_rs esz=3
+MOVA            11000000 11 00000 1 v:1 .. pg:3 zr:5 0 za:4  \
+                &mova to_vec=0 rs=%mova_rs esz=4 off=0
 
-MOVA            11000000 esz:2 00001 0 v:1 .. pg:3 0 za_imm:4 zr:5  \
-                &mova to_vec=1 rs=%mova_rs
-MOVA            11000000 11    00001 1 v:1 .. pg:3 0 za_imm:4 zr:5  \
-                &mova to_vec=1 rs=%mova_rs esz=4
+MOVA            11000000 00 00001 0 v:1 .. pg:3 0 off:4      zr:5  \
+                &mova to_vec=1 rs=%mova_rs esz=0 za=0
+MOVA            11000000 01 00001 0 v:1 .. pg:3 0 za:1 off:3 zr:5  \
+                &mova to_vec=1 rs=%mova_rs esz=1
+MOVA            11000000 10 00001 0 v:1 .. pg:3 0 za:2 off:2 zr:5  \
+                &mova to_vec=1 rs=%mova_rs esz=2
+MOVA            11000000 11 00001 0 v:1 .. pg:3 0 za:3 off:1 zr:5  \
+                &mova to_vec=1 rs=%mova_rs esz=3
+MOVA            11000000 11 00001 1 v:1 .. pg:3 0 za:4       zr:5  \
+                &mova to_vec=1 rs=%mova_rs esz=4 off=0
 
 ### SME Move into/from ZT0
 
@@ -46,12 +58,18 @@ MOVT_ztr        1100 0000 0100 1110 0 off:3 00 11111 rt:5
 
 ### SME Memory
 
-&ldst           esz rs pg rn rm za_imm v:bool st:bool
+&ldst           esz rs pg rn rm za off v:bool st:bool
 
-LDST1           1110000 0 esz:2 st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
-                &ldst rs=%mova_rs
-LDST1           1110000 111     st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
-                &ldst esz=4 rs=%mova_rs
+LDST1           1110000 0 00 st:1 rm:5 v:1 .. pg:3 rn:5 0 off:4  \
+                &ldst rs=%mova_rs esz=0 za=0
+LDST1           1110000 0 01 st:1 rm:5 v:1 .. pg:3 rn:5 0 za:1 off:3  \
+                &ldst rs=%mova_rs esz=1
+LDST1           1110000 0 10 st:1 rm:5 v:1 .. pg:3 rn:5 0 za:2 off:2  \
+                &ldst rs=%mova_rs esz=2
+LDST1           1110000 0 11 st:1 rm:5 v:1 .. pg:3 rn:5 0 za:3 off:1  \
+                &ldst rs=%mova_rs esz=3
+LDST1           1110000 1 11 st:1 rm:5 v:1 .. pg:3 rn:5 0 za:4  \
+                &ldst rs=%mova_rs esz=4 off=0
 
 &ldstr          rv rn imm
 @ldstr          ....... ... . ...... .. ... rn:5 . imm:4 \
-- 
2.43.0

