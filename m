Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4196676njb;
        Wed, 11 Dec 2024 08:42:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUhwyFh3RhbA8Hs4zLk9fQnDGAzhQjt8JtEbKoB+2jrBj+Ux0gU9l58u4rPAobABm3suEuvpZmjNwpiag==@linaro.org
X-Google-Smtp-Source: AGHT+IGS7FGysEzwgukoJaxUdwAY9+X1w2yjcmJh2xiihHU7FCvcfdF7yrlrwrRNb2xeFNdgxrtA
X-Received: by 2002:a05:6214:20ee:b0:6d8:9660:8877 with SMTP id 6a1803df08f44-6d934b0e2bemr70955586d6.18.1733935331816;
        Wed, 11 Dec 2024 08:42:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935331; cv=none;
        d=google.com; s=arc-20240605;
        b=O0nJ/ZPQgKyOdJ0fZFpAF1Ni54zJXvI7Cl3kiR5B5fBFMsL2WOMupf0p8dgqPfWk7o
         b6X2ifFfUpImkMug2o7MZhbVLDhZ/x25BJDzDM7HhEwSbNvXrwpZAf5KSTWKiusQMOMr
         K7lqzInR22U5yjdgg3/hIKHHA5MgUKH7ZDhTDS0CJVdJH2ZRGCB4OND985fCPVx54dPR
         SvOhS3duBgwNdDdkyJv8FbC3mzeQsbNEwKlm0FKDQ6rNh9gGF4LIvF2nAhRZtbyt9IPE
         xZ8BzE49YCMz/P6U2ifztmUSwKqX468EIGwwbgRTi6DwGbjBJxU7y8ErMqI1sNAdlTNm
         rPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SjNCXqWLXBfOyQBfYtoOK+ENmcPrhXIDdj2qnDqUAHQ=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=Cx5WGUvqOLZAG7eM5iSuxc9jZ+0m8ygo9YI697j44PVHrPyX0uUjJ1wXR6Q5kHhCJ2
         omL4F6Jmru9bzEIVAb/NYdWVzITZa9YCRa5jetcpIUhsx4bR/adgW/4RhD4F/Xa66ks6
         EmxPd9zLbC6OyiOmMby2xjDZynwcOmsezVNfZEhHsl1qXE7VQTH/51i+NRsSch8+ONqj
         04nVTStX+byOf/TMVNaDcV7QqzdzTldBqjoDkISLJfYBc45T2eNClDz6/IgU+eXP4MsF
         vioC3qE4E1fxTIXDmmxWvuFa7UMvgf3dL8lUB77KTJAMPrTPpw12b/k2E4GizhsGpWun
         Vang==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=usl+ykL0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dac453ddsi142312686d6.537.2024.12.11.08.42.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:42:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=usl+ykL0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPiB-0003ER-Ha; Wed, 11 Dec 2024 11:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhe-00010v-TZ
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:36:47 -0500
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhc-0002He-Ot
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:36:46 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6d922db2457so16500356d6.3
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733935004; x=1734539804; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjNCXqWLXBfOyQBfYtoOK+ENmcPrhXIDdj2qnDqUAHQ=;
 b=usl+ykL0b0H3gXNpRaFT+o0+A682ynd/vguw8UhkwTuCSbJqENI+5Fme+8A7OfwVcq
 u1WipdWn/tIdZz7KruuQPWsZU91ELHEKcV/Dvp/8OgV7x9ihFokOMnX7OTCNw9r44zHM
 PANRdxogfESSJAUjhfpFYKsppsfoWV8x8/ItVGt5KVHW4/GJvYCMFel+JjDg8gMvkdqZ
 xdtkndZ/+fbniJvAleYcWEvXT59TDWOpiXguW+6Xo5dLV5UsTvMetIZhTi0+RMR3CSIP
 Nw7kICSflSKt3j3uVwfhYKNX+OV4yjVH5208rj9sz+BIxqjq3TdyDDA+7jia7dhU0yBC
 lyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733935004; x=1734539804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SjNCXqWLXBfOyQBfYtoOK+ENmcPrhXIDdj2qnDqUAHQ=;
 b=pDTz4zF6ujB6mpyK/7WIc/S45SUsvf8vsoM0W4QQYajUqVcPCGwlGFc/cMeSTzcM9q
 rtv2p1Qev7ZpHTna9BYJ+66C/1wXvWDmLKZ1EdMX6bRJ4DOXBLRQ0nRnH5PGp0h5Ot2v
 2VV4QdTUSHMcUvLpsAq2wPinQ43XQ9aQa8eTLw2yjRQ9icqSBoS248fAgnd5Wx6CmESX
 vtMfLbKY/IWy1e/KbT865h4Y6QT2VLmvYCgSJKxjmrTQsd0K+kLOOxqHb9G+xgG5s5uA
 E8VCACEyLU0//QJjIScnH4JD4o8xzR61o84u0QyxoHfq2NgyDtafoDWqqCeRW05GeWcD
 iXLw==
X-Gm-Message-State: AOJu0YyOD6svbIC5YFBpG21cCscI6iOEc3cxj76yOT7A2zrdgtFgrXNj
 wfBrtl1n9rrQgo4/jUOxaiJmvhR5leOBiiQAtX2lhTgHPh79uoftyUoRccH3WtdNF35TSsvw+cx
 c03xpKPcn
X-Gm-Gg: ASbGnctIyprcH2EgR4YNBsXDWCPAgkp64NEeVg2AmZTcpOC7b1R7i3O8q5hr8p+6c9u
 8lUL0/OIFv49Z+5DBbKV7Nr6HDVDp7GuEkCXTXHgBR8tcNPi4Vu6MVs80hGZjFBHyh3Whw7afZD
 Qn5VMfetFiHLkKTuZ7ui511EtWBKswD1WDfeeYFs9cXK6iiTH8DCD8BzrjyxD7e3cUaO7ox29t1
 VxhIq2KckQizjpWQVUhA9rZCdqflJjPl/fliMQSOjwGjKK8E6D2ggPi20X8cw==
X-Received: by 2002:a05:6214:21a2:b0:6d4:20fa:83f4 with SMTP id
 6a1803df08f44-6d934be9199mr49018926d6.48.1733935003822; 
 Wed, 11 Dec 2024 08:36:43 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8da675214sm71856276d6.11.2024.12.11.08.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:36:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 59/69] target/arm: Convert [US]CVTF (vector,
 integer) scalar to decodetree
Date: Wed, 11 Dec 2024 10:30:26 -0600
Message-ID: <20241211163036.2297116-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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
X-TUID: zjHwbYLgktd3

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 35 ++++++++++++++++++++++++----------
 target/arm/tcg/a64.decode      |  6 ++++++
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 894befef4d..6e9d040ebf 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8599,6 +8599,29 @@ static bool do_cvtf_g(DisasContext *s, arg_fcvt *a, bool is_signed)
 TRANS(SCVTF_g, do_cvtf_g, a, true)
 TRANS(UCVTF_g, do_cvtf_g, a, false)
 
+/*
+ * [US]CVTF (vector), scalar version.
+ * Which sounds weird, but really just means input from fp register
+ * instead of input from general register.  Input and output element
+ * size are always equal.
+ */
+static bool do_cvtf_f(DisasContext *s, arg_fcvt *a, bool is_signed)
+{
+    TCGv_i64 tcg_int;
+    int check = fp_access_check_scalar_hsd(s, a->esz);
+
+    if (check <= 0) {
+        return check == 0;
+    }
+
+    tcg_int = tcg_temp_new_i64();
+    read_vec_element(s, tcg_int, a->rn, 0, a->esz | (is_signed ? MO_SIGN : 0));
+    return do_cvtf_scalar(s, a->esz, a->rd, a->shift, tcg_int, is_signed);
+}
+
+TRANS(SCVTF_f, do_cvtf_f, a, true)
+TRANS(UCVTF_f, do_cvtf_f, a, false)
+
 static void do_fcvt_scalar(DisasContext *s, MemOp out, MemOp esz,
                            TCGv_i64 tcg_out, int shift, int rn,
                            ARMFPRounding rmode)
@@ -9838,16 +9861,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x6d: /* FCMLE (zero) */
             handle_2misc_fcmp_zero(s, opcode, true, u, true, size, rn, rd);
             return;
-        case 0x1d: /* SCVTF */
-        case 0x5d: /* UCVTF */
-        {
-            bool is_signed = (opcode == 0x1d);
-            if (!fp_access_check(s)) {
-                return;
-            }
-            handle_simd_intfp_conv(s, rd, rn, 1, is_signed, 0, size);
-            return;
-        }
         case 0x3d: /* FRECPE */
         case 0x3f: /* FRECPX */
         case 0x7d: /* FRSQRTE */
@@ -9867,6 +9880,8 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x1c: /* FCVTAS */
         case 0x5c: /* FCVTAU */
         case 0x56: /* FCVTXN, FCVTXN2 */
+        case 0x1d: /* SCVTF */
+        case 0x5d: /* UCVTF */
         default:
             unallocated_encoding(s);
             return;
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index f66f62da4f..146500d9c4 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1657,6 +1657,12 @@ FCVTXN_s        0111 1110 011 00001 01101 0 ..... .....     @rr_s
 @icvt_sd        . ....... .. ...... ...... rn:5 rd:5 \
                 &fcvt sf=0 esz=%esz_sd shift=0
 
+SCVTF_f         0101 1110 011 11001 11011 0 ..... .....     @icvt_h
+SCVTF_f         0101 1110 0.1 00001 11011 0 ..... .....     @icvt_sd
+
+UCVTF_f         0111 1110 011 11001 11011 0 ..... .....     @icvt_h
+UCVTF_f         0111 1110 0.1 00001 11011 0 ..... .....     @icvt_sd
+
 FCVTNS_f        0101 1110 011 11001 10101 0 ..... .....     @icvt_h
 FCVTNS_f        0101 1110 0.1 00001 10101 0 ..... .....     @icvt_sd
 FCVTNU_f        0111 1110 011 11001 10101 0 ..... .....     @icvt_h
-- 
2.43.0

