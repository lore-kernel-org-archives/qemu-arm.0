Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4196412njb;
        Wed, 11 Dec 2024 08:41:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXghEhXFMxRp1XcKSIm151GHsR03Xfao3ihenFRezmHY9EqnWiyIZFqx+yqZt2g4/zSZZo11ux05r1buA==@linaro.org
X-Google-Smtp-Source: AGHT+IHNHwSCn34e6iIIpdobN9K0CIKeTImCdD5qNaqQ6K6lCG1rQQXR6TwTULiuVxHDJ1KeLZac
X-Received: by 2002:a05:622a:1452:b0:461:5571:5cc6 with SMTP id d75a77b69052e-4678937e51bmr51607841cf.46.1733935312188;
        Wed, 11 Dec 2024 08:41:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935312; cv=none;
        d=google.com; s=arc-20240605;
        b=YIywL/+Kvqmpd1JoZ3MhJRwMqvbaMbfpU7S3ZByn1pQ6WJCzxo7sphEsOK7gP+37Wz
         K4u7Xqc7mhAyDWLVpo32Cmmn8N+to/yebPAAlQX+W4ySSSixt1Zu8mA1Do52CDaktYI9
         M+0nfZ0i2/P+8fWI8636RQw7frNwqyMqGcAluGj2j7JJ/wesSFm/1DINbfxKVSL25J8L
         Ywa+H2lJUzBbDxffph+q7yGJLfXeZJqywZ5aBoryaho/KEIh1SB+BA93FpQ3DFBlMoT4
         2Ve+77qc+R2tcozMPfFgP6G78HlDRmV57K9IYStuuzsqKcNDPeOOsobrzFz5pLx8HsBO
         qziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Vsh0HImK6qshuStlPGIutoWf36EbUwjPxmaEEmMfZGk=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=Q/4+QWofsGbjpYRo5fS+GbGd7dzP8+pgB9NH37YWJ6s1MlfvVaRWix+G+LZT6lh+ge
         ut3J4SAyalt5Gx3ll6Zt2latoDXENO7NnZURFGirQwvFmvONE250HreSyjgLBdKpF4Y4
         W5L7LlWbsahuxZ4hIGGfOL+pH1Rgoyef6uL/2qVSMfuktSQBVPS7M10PZgOswbsn7vIc
         o6x9PHEnHFyluWXppM0xZeR6R1i1z7IL6c9rcltW2x5vVELgoTpJWQ2TfzCjTS8gyUus
         mxUuB2Qw3uRlP5t4C0LL8fXd+PbJjKUXJtCJhybakjTnRXpwC+8KEKHsIC2+cBhpoZZB
         511Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZBs/2ZDz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4678b42cbdbsi18363121cf.518.2024.12.11.08.41.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:41:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZBs/2ZDz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPho-0001Pj-2B; Wed, 11 Dec 2024 11:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPha-0000qk-6O
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:36:43 -0500
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhY-0002GY-Kh
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:36:41 -0500
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-6d842280932so94378146d6.2
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934999; x=1734539799; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vsh0HImK6qshuStlPGIutoWf36EbUwjPxmaEEmMfZGk=;
 b=ZBs/2ZDzLBQMOCkSaOpM8cYq5D4xd+GrkbtanuDM8+OHXGJjGqlNxkMfLMeTcZCFeC
 g/uknhTQYyX+/w8MvgQ0d2tAE+qR39cKCOXHTmI4eQsDrP7wMcHj+nJ3MLCpx7iOQ/pb
 AQY1RxxS+0++SBoZ3nItf9qN6ciLFHmevw8Tru56A4trgsii2XHuiBSAMU8HyyrmuEsU
 UmWBfrOdMv70o8ZRu1s3izIwDMjOPEwvGmhzeu5PYVgDlL+Cm9SEd3iqGbHZqrJ/c8W7
 Vqw/ZXsBn8UjrItSQD2PLv1GpzRz1Qj5BbMdbX0FV7+FQRyQF19lp280BktZbsq9orZa
 UvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934999; x=1734539799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vsh0HImK6qshuStlPGIutoWf36EbUwjPxmaEEmMfZGk=;
 b=pMHHElTISJv4+pvwkVwq3tTqWN8lKsZ7s+RxIjeSTM0sRiT0xz4aP5SMc6WuGfHgRH
 FwsgxtUo7b/xb2Tc/7XQZYB2yMOqj6IS2GYhDUxQWXSAXXwkGQXV4/7Rwzp3fSLi9HoF
 kzPQ43s3EyghCMwV9UDoSiXkZGTK9in4JbJVE846sGtkggYyqyOfVcoPe2Ad7cNtCNW4
 VLXEb/RdobpBOd8MiQqJ32r+egkTNNMppRwNL6Cscui+zLQp6yF4OXiXpo5Y+hpKEjuI
 1IfPIM9DIYPXBFDms+GohtWG3ndlO757i7UzVBV3orbZMzafWZztD/3jQX02WbK4ZHkS
 pJXw==
X-Gm-Message-State: AOJu0YwAcP/u2Kbg9YXZ8VHGphhJNH05bJEWLxgxPnbcSL06b2Kx6lkb
 y7uCDBi8A8sNLDokAvlvPCF9SOHAnggjNjzSXbrCQb8uDbpZqSVqgQud4NXnOn8=
X-Gm-Gg: ASbGncvdtMLZnmr4GmzbP49PgHFissaOuQie2rI3CTtv18oDlJ1PwBCRL+rp8vx+fOy
 8dK9inhCnLOKzQjaIWTpuDpmrLz1PH3m0y15Gbk+QtaM2Cb4ItoqT0gLxV4QK+F1W7/oNTfkAHy
 XcafZzyZTcvxsxUG+4nRZhuzHgE23qjJ8O4iT5ZxFNs4VnzaoHCAyEiR7SOwLAPEgBqqCOg+4h4
 cdTkqEbrkoZC4shypwoq5iNSkNaZeKtyqDNWEHE88nAtroFbaOuLfssaEgfcg==
X-Received: by 2002:ad4:5f8f:0:b0:6d8:9dad:e14b with SMTP id
 6a1803df08f44-6d934aec1e4mr63335726d6.13.1733934999742; 
 Wed, 11 Dec 2024 08:36:39 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8da675214sm71856276d6.11.2024.12.11.08.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:36:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 58/69] target/arm: Convert FCVT* (vector,
 fixed-point) scalar to decodetree
Date: Wed, 11 Dec 2024 10:30:25 -0600
Message-ID: <20241211163036.2297116-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2d.google.com
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
X-TUID: gcrp52ve31Ow

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c |  4 +---
 target/arm/tcg/a64.decode      | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 71f1d6f778..894befef4d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -9535,9 +9535,6 @@ static void disas_simd_scalar_shift_imm(DisasContext *s, uint32_t insn)
         handle_simd_shift_intfp_conv(s, true, false, is_u, immh, immb,
                                      opcode, rn, rd);
         break;
-    case 0x1f: /* FCVTZS, FCVTZU */
-        handle_simd_shift_fpint_conv(s, true, false, is_u, immh, immb, rn, rd);
-        break;
     default:
     case 0x00: /* SSHR / USHR */
     case 0x02: /* SSRA / USRA */
@@ -9551,6 +9548,7 @@ static void disas_simd_scalar_shift_imm(DisasContext *s, uint32_t insn)
     case 0x11: /* SQRSHRUN */
     case 0x12: /* SQSHRN, UQSHRN */
     case 0x13: /* SQRSHRN, UQRSHRN */
+    case 0x1f: /* FCVTZS, FCVTZU */
         unallocated_encoding(s);
         break;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index f7fcc32adc..f66f62da4f 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1682,6 +1682,25 @@ FCVTAS_f        0101 1110 0.1 00001 11001 0 ..... .....     @icvt_sd
 FCVTAU_f        0111 1110 011 11001 11001 0 ..... .....     @icvt_h
 FCVTAU_f        0111 1110 0.1 00001 11001 0 ..... .....     @icvt_sd
 
+%fcvt_f_sh_h    16:4 !function=rsub_16
+%fcvt_f_sh_s    16:5 !function=rsub_32
+%fcvt_f_sh_d    16:6 !function=rsub_64
+
+@fcvt_fixed_h   .... .... . 001 .... ...... rn:5 rd:5       \
+                &fcvt sf=0 esz=1 shift=%fcvt_f_sh_h
+@fcvt_fixed_s   .... .... . 01 ..... ...... rn:5 rd:5       \
+                &fcvt sf=0 esz=2 shift=%fcvt_f_sh_s
+@fcvt_fixed_d   .... .... . 1 ...... ...... rn:5 rd:5       \
+                &fcvt sf=0 esz=3 shift=%fcvt_f_sh_d
+
+FCVTZS_f        0101 1111 0 ....... 111111 ..... .....      @fcvt_fixed_h
+FCVTZS_f        0101 1111 0 ....... 111111 ..... .....      @fcvt_fixed_s
+FCVTZS_f        0101 1111 0 ....... 111111 ..... .....      @fcvt_fixed_d
+
+FCVTZU_f        0111 1111 0 ....... 111111 ..... .....      @fcvt_fixed_h
+FCVTZU_f        0111 1111 0 ....... 111111 ..... .....      @fcvt_fixed_s
+FCVTZU_f        0111 1111 0 ....... 111111 ..... .....      @fcvt_fixed_d
+
 # Advanced SIMD two-register miscellaneous
 
 SQABS_v         0.00 1110 ..1 00000 01111 0 ..... .....     @qrr_e
-- 
2.43.0

