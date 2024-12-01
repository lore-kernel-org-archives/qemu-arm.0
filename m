Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2151249njk;
        Sun, 1 Dec 2024 07:13:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU7xXild3m9tZ3Q9D0TFPDuwnYx9qvFzfFwfymYUwjQAKYW610fUkkX2i5KlXoxxeFYH/O6/zZEWqo72w==@linaro.org
X-Google-Smtp-Source: AGHT+IE/tAZhozKtwg4yMQ6A+PQzwFAGaLIMFiDiTSqHJXR76UcQ2Iz3NHGaKC6yWVH4j/kMcf0B
X-Received: by 2002:a05:6214:2307:b0:6d4:1c27:e9b1 with SMTP id 6a1803df08f44-6d8729cd974mr232135806d6.23.1733065985235;
        Sun, 01 Dec 2024 07:13:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065985; cv=none;
        d=google.com; s=arc-20240605;
        b=Dcu4UMKz5YHdoTd3xlqTeLnN99iegIar+Nv0R9I4CpA+j3WFOEMoSvpIakCZI2PCuU
         /TuwoJQx7GYKGwOtfMyVu0HQ5ETQgpBZXcMVtshsk3/fcvyVkcjFPwjFqDfC+qHxTZkg
         Hm5k49w87nifOz6xs6bHtlpqrVoyISGJqKypMHsRqqTjbx9xzZbgeaHrLPv782MSqJzl
         /0TBVt7S+6HZoyEfuWpgXN1nBMTSibFbNq9dnzKb2mxtfE7bBbyIg7Qf6mRFeRZAUADS
         B+j1M6HMmNznilhLLInScphW48qf7P/y8YYJybWBvn55/VxSUsm5d85zf1UJVWL+AaNj
         fUrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VEDqEqk94vzn4bViKXoAxj0y4sF9hh+x/V/JUQRicrc=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=ShRwRSAHxZ4bozCp0p5T4KjXjJny3vphq+y6IlIBodrBrXe84o5eWYbPFF1O3k5zfK
         FPGS24Q4gwQ52Y1SfgD2nxLj4DJlUyGxO4MoADHiv5wLlGJn1muvnO9HdHFiHXwKWCZy
         EdTUvJsceW5BmkrS07RdSZ/KUNLOA75tQtzNrwmxB+WlgBoGtbJuSI6lZ4xgOA8fHpN6
         3MyLPHP9Yx8ixW1rZK8MtcsOCn5FrbU+IHo77Kbfy8+4SKeKO8ZualUjZBOaVlzSRoxp
         vf0SH7kyoEcsdTChuhNouoRfI2lEhy8MIv4gcg8xOzd0xRVoIdtQqgaOUQGbAAhVYVc1
         Ij0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DxxmLifE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d885b2e1a9si64235416d6.257.2024.12.01.07.13.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:13:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DxxmLifE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlbS-0003pC-8P; Sun, 01 Dec 2024 10:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaT-00087Q-Qy
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:18 -0500
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaS-0005Fv-6P
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:17 -0500
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5ee9db85af0so1879393eaf.0
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065814; x=1733670614; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VEDqEqk94vzn4bViKXoAxj0y4sF9hh+x/V/JUQRicrc=;
 b=DxxmLifEoZTo9DXP4WVWMwuB5zL8b3P99pRltRC0b2VJBV2cm4haJ1LGE8HDxb5fOs
 Kz2ZwEpiuwV728NxgpdU4/ANYezWyiqirZ9t7h/4/o5f7h7+wuF6+JSjJxW1t1VtBFTs
 Xg1aCHk3erkVNkdFThul1tbzprJwCsm3hJr6Z7rpLp3LmtHStrwIoK3apeiihhWJmSIH
 j7+pAicdcxYWYvChm9F558UTem7JE4abPqedAT3hRxq0IQ4evU6RaRMQGbpRPRov/vs4
 CKTOB4v5pvhr9RUdjGiP6aNBsahoCj0np5bnaQLuQiVrnCA+k0RIPGjaTZf4BZ6gHXZt
 GI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065814; x=1733670614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VEDqEqk94vzn4bViKXoAxj0y4sF9hh+x/V/JUQRicrc=;
 b=OS6quJmAJctP4Aw1WuGYgdUWFZ8qSdys1h+vb85vp00jzdL4HSrIlkNJXl6mLqXcJb
 Jj6f8Inr6ZF/e0BumSbkTvvL22ywHmMqP7VNGhFO1uzQqaG9fKRXs7nB73xGnjsua+LP
 Ym7xy+GxGkk4sZccrDDjd7zw2jd6Hx37p2Gx6MqeaHnvXb6oIyJkIuBjmj78/6QwoJZm
 mpI7fbXOT2d4WqKx1BaVZdLDeN4PMVWK2nDYUbjbOeY0OdsWJmd0ZChOcDtLgNbae1s1
 EgxnwmYQhjBsFXF+oUqZHu8wbdJszfn23GM5YmRK6NOv6R4pfUetEeWL81CXZWgWFEd0
 X38A==
X-Gm-Message-State: AOJu0YzEZtzR9OoLz62b7CxYNres1lLf5mIMikNH4453+LZ8h5CMzR7Z
 DtiQKXqSCY2tz6pLf11WkCuA7WYizg+QstGJbQjEUd1GK5WyEZm9TIWyDEo178E=
X-Gm-Gg: ASbGncuaS6jF9ZGg+0ua0A6zlJ2OfJzp6RElHTVJiKXqXePqcUCciU6jXyvu0fVP0MN
 H9UKmz0FOHEQPOGBgh/nPgZM4jr0AwXqYoGagkW5qJkzhVWCEXDQXGXzWAqnEyFDU7SZDIfs4I9
 J72Q8qk8zc7eLw5jRgLdzaP+Tl0ica4UphVbs/Lg2p/iG5ZjWnzcCWVgSqRRMvj4PnT/CtLtOQw
 2zZBWhFJgx2VvqJ2FLsXiOGQcp4dRubQTKXKfab18WKywNTI0a8RDAwq3Qmm56P6LNF6gVTcnqc
 zb5i+eyzGkbw8XftpBqcm7gtPgCb+GKsq0BE
X-Received: by 2002:a05:6830:3142:b0:71d:4dbb:7232 with SMTP id
 46e09a7af769-71d70ba8e87mr8285675a34.3.1733065813791; 
 Sun, 01 Dec 2024 07:10:13 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f21a4cd78fsm1807008eaf.32.2024.12.01.07.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:10:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 57/67] target/arm: Convert [US]CVTF (vector,
 integer) scalar to decodetree
Date: Sun,  1 Dec 2024 09:05:56 -0600
Message-ID: <20241201150607.12812-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2f.google.com
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
X-TUID: 13ZuSR7veaJF

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 35 ++++++++++++++++++++++++----------
 target/arm/tcg/a64.decode      |  6 ++++++
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index bdeb0288fd..9808b976fd 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8603,6 +8603,29 @@ static bool do_cvtf_g(DisasContext *s, arg_fcvt *a, bool is_signed)
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
@@ -9850,16 +9873,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
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
@@ -9879,6 +9892,8 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x1c: /* FCVTAS */
         case 0x5c: /* FCVTAU */
         case 0x56: /* FCVTXN, FCVTXN2 */
+        case 0x1d: /* SCVTF */
+        case 0x5d: /* UCVTF */
         default:
             unallocated_encoding(s);
             return;
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 4cb5b20826..707715f433 100644
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

