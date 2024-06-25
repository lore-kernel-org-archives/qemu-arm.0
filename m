Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp659657njc;
        Tue, 25 Jun 2024 05:35:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLT4hiXJpJ5n3z5MUf++i/6iMVZQ36mj2iTVrJF2c7ocpR+cv9ASGRZlITDtnnzemuV02YLVTSvN/3rXgBnmJcvNnnNCDe
X-Google-Smtp-Source: AGHT+IEyi9Gh60jZhYm17P/eFOWwQAahlJLYnQpCUOEwp8XOy1/e4GyUXiTxcnpLIFy3YZre+uJv
X-Received: by 2002:a0c:f345:0:b0:6b5:97:1796 with SMTP id 6a1803df08f44-6b54099f899mr72341066d6.12.1719318944943;
        Tue, 25 Jun 2024 05:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719318944; cv=none;
        d=google.com; s=arc-20160816;
        b=QQbwSD8C8PYMtEvSZoaLEyXnF6+83GRo35zJTSCSGmLWWl5z0DK7y0iWMT/vnM4zpD
         lV/6hI1iHeFDaolm9CNylDi5X8t2T+fcS0YA62dsWyOgCE/78xFrWpsKa7eLhB1HQ5h+
         cJkIH+pk5aC9NPggeVuj7IpovW2QcokN1GDQSy9ieRysJaA583njndFriTZkhWCeuemD
         0JGxl0w4TKdfgGRrekr3UJTovXDCrelBpWvMRSjbg79UofdUp2ZoHhKg6au1i4yDpVwE
         oRNpe4p5iLOVtVen/XlpFAWFOolQeMS2q9ANfC2tBR5dhzq8xdk0Jhm+aOpuWyudb4F7
         effQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OP7qdRr9fOGTjqqXtWqvdacBUoynHCXIv9tgNouajnQ=;
        fh=/yUokvTdM2uXZulxdA9dfZWbBe/5hnABvQlilcO/QbY=;
        b=AgTYmzMwrd/MRRXpqmeb3tLYtJgFBdH3LwgOGnhV0lYypqBGBAR3NeR0606Y7o790f
         pXrQrTvRkKtRLlhJ+9qVMr/Rm+MkODW6DwdKZpgwtJiTDE/nIX4FvnBo9ko0VAXWO0+W
         HVwJzHyhuxQfOJPpTFdp0+w34ovO1qI1Ih23kwyeMbvQ6nsPvrrGJRZnUo4+ZDqO8nOV
         YZAqyMrvnpB+uYBFbFpDCDSaJYsuslgX/Ja7tydj7BMIfh710trOl/x1ccmDI8Fgdz9d
         oOYIE1vzqnzMkGtEYUvCf95GRuhcA4phzdR/Auz8eOIokmtZ9FiveC3yF9AwUC67yVw5
         mfdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WMyEdvzE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51ef3f616si101770786d6.503.2024.06.25.05.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 05:35:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WMyEdvzE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM5Oe-0001c5-AT; Tue, 25 Jun 2024 08:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5Od-0001bU-59
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:35:39 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5Ob-0001P6-3R
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:35:38 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57d07f07a27so6151976a12.3
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 05:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719318935; x=1719923735; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OP7qdRr9fOGTjqqXtWqvdacBUoynHCXIv9tgNouajnQ=;
 b=WMyEdvzEUoaCFW6V0NhOUmEncP4Yu9IEGPrOZaq5755xhtbJrciLLkUIL1g8+3GENf
 uZfqshpoU1xXhf71TDG0uYHRrIAuWmglaEKly94l6ZDHhOG4LNrJhkJiu28p/M9Q5Dm+
 nGKwvXH/LhNGLfxh3TsmrLd4n/2o/XwrUAx+Z2bCBiH4P22pum+b9U7+4sRJ5hzp1DHy
 6MCaSkizrRHf+f1+EwEhS5A2Pdw0pzD4yXW6E63iWfgqRr9/NdUtWQu7UWSKVMbZnxwk
 0alBIs/M4iwMHCaZvut2gVM0G8Che5Iu3MHe1Rnz//NCSzCGSNmi/q0bMeSZekOq0jN6
 nH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719318935; x=1719923735;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OP7qdRr9fOGTjqqXtWqvdacBUoynHCXIv9tgNouajnQ=;
 b=sLpwvjidJVBIa2/Qjl83LDPL/v3sPhFzT3AlhqAO433V+Zr2rR7shn1oXCSLb8kd/X
 ZaZsDtYfpJDM0ukHSm3iUgOWBBDKP4I/mGhNLE8bk1CNsY15F9AvAmkYnFle2dpZV4lz
 5qg3xC4FTrDlfhg9mtusFLK0tH0EyvYutLixMaTYxXeVwVd/kbXBM+6gJUhsZD5QJKi2
 5GhDHOEIUoOy7eENxaMZ1056b+zRThmk5pj0XwEcJKMKlnmZRay0kK1nDWhtlR2sHBP5
 vG5d8GsCfrmNUVQW4JKDGjMJzx99kerDXHGUOIwGfhQD2DGWnB/T+9fa6GgyUXYWDj8S
 AHkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSlSzzXAWD+xpqQQrjsN+Oa7NWFrlIrsVkOAcBVWIG1/J4VYJ0PUh5ANekHsQEL4FUxiXJLd61Xz3FyFUPKgEoF3gT
X-Gm-Message-State: AOJu0Yxa3PAW6ZS90O9ZQbZ+Vk01QjvaJ+Af3QR+btqnhKZDNvpVWH8t
 h1PyD330F0aOCpgvYr/ulqJknxd7m5IP2ode8pWlRqw75mfMjaop/qPa6bd4/oTgLlAY0CNe0uc
 2MULNH5/8y3vrMBYOoAo+hf1GaAjKX+OKuwRjzQ==
X-Received: by 2002:a50:a41d:0:b0:57a:2ccb:b3e5 with SMTP id
 4fb4d7f45d1cf-57d4bde2510mr3760704a12.42.1719318935309; Tue, 25 Jun 2024
 05:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240625050810.1475643-1-richard.henderson@linaro.org>
 <20240625050810.1475643-13-richard.henderson@linaro.org>
In-Reply-To: <20240625050810.1475643-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jun 2024 13:35:23 +0100
Message-ID: <CAFEAcA8AQ_nH0N4D+WUakP9qRLf05AeZktyYVQbkfQkreJVhgg@mail.gmail.com>
Subject: Re: [PATCH 12/13] target/arm: Convert FCMLA to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: oU/JOboLg5id

On Tue, 25 Jun 2024 at 06:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |   5 +
>  target/arm/tcg/translate-a64.c | 241 ++++++++++-----------------------
>  2 files changed, 76 insertions(+), 170 deletions(-)
>
> diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
> index f330919851..4b2a6ba302 100644
> --- a/target/arm/tcg/a64.decode
> +++ b/target/arm/tcg/a64.decode
> @@ -960,6 +960,8 @@ USMMLA          0100 1110 100 ..... 10101 1 ..... ..... @rrr_q1e0
>  FCADD_90        0.10 1110 ..0 ..... 11100 1 ..... ..... @qrrr_e
>  FCADD_270       0.10 1110 ..0 ..... 11110 1 ..... ..... @qrrr_e
>
> +FCMLA_v         0 q:1 10 1110 esz:2 0 rm:5 110 rot:2 1 rn:5 rd:5
> +
>  ### Advanced SIMD scalar x indexed element
>
>  FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
> @@ -1041,6 +1043,9 @@ USDOT_vi        0.00 1111 10 .. .... 1111 . 0 ..... .....   @qrrx_s
>  BFDOT_vi        0.00 1111 01 .. .... 1111 . 0 ..... .....   @qrrx_s
>  BFMLAL_vi       0.00 1111 11 .. .... 1111 . 0 ..... .....   @qrrx_h
>
> +FCMLA_vi        0 q:1 10 1111 10 . rm:5 0 rot:2 1 . 0 rn:5 rd:5 esz=1 idx=%hl
> +FCMLA_vi        0 q:1 10 1111 01 0 rm:5 0 rot:2 1 idx:1 0 rn:5 rd:5 esz=2

This doesn't look right. Bits [23:22] are the size field, but
here you have 10 and esz=1, and 01 and esz=2. I think the 01
and 10 should be the other way around.

In the size 10 case (MO_32), we should UNDEF for L=1 or Q=0,
which is to say that L must be 0 and Q must be 1. We hard-wire
the L bit (bit 21) to 0 in the decode, but we leave q:1 as it
is; I think it would be better for the second line here to have
a forced 1 in the q bit and set q=1 at the end of the line.

We also don't have the check for H==1 && Q==0 for the size 01 case.
I think we can do that in the decode file by splitting the 01
case into two lines, one for Q=0 and one for Q=1.

> +static bool trans_FCMLA_vi(DisasContext *s, arg_FCMLA_vi *a)
> +{
> +    gen_helper_gvec_4_ptr *fn;
> +
> +    if (!dc_isar_feature(aa64_fcma, s)) {
> +        return false;
> +    }
> +    switch (a->esz) {
> +    case MO_16:
> +        if (!dc_isar_feature(aa64_fp16, s)) {
> +            return false;
> +        }
> +        fn = gen_helper_gvec_fcmlah_idx;
> +        break;
> +    case MO_32:
> +        if (!a->q && a->idx) {
> +            return false;
> +        }

I suspect this was supposed to be the size 01 H==1 && Q==0
check, but it's in the wrong case.

So my suggested fixup for this patch is:

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 4b2a6ba302d..223eac3cac2 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1043,8 +1043,9 @@ USDOT_vi        0.00 1111 10 .. .... 1111 . 0
..... .....   @qrrx_s
 BFDOT_vi        0.00 1111 01 .. .... 1111 . 0 ..... .....   @qrrx_s
 BFMLAL_vi       0.00 1111 11 .. .... 1111 . 0 ..... .....   @qrrx_h

-FCMLA_vi        0 q:1 10 1111 10 . rm:5 0 rot:2 1 . 0 rn:5 rd:5 esz=1 idx=%hl
-FCMLA_vi        0 q:1 10 1111 01 0 rm:5 0 rot:2 1 idx:1 0 rn:5 rd:5 esz=2
+FCMLA_vi        0 0 10 1111 01 idx:1 rm:5 0 rot:2 1 0 0 rn:5 rd:5 esz=1 q=0
+FCMLA_vi        0 1 10 1111 01 . rm:5 0 rot:2 1 . 0 rn:5 rd:5 esz=1 idx=%hl q=1
+FCMLA_vi        0 1 10 1111 10 0 rm:5 0 rot:2 1 idx:1 0 rn:5 rd:5 esz=2 q=1

 # Floating-point conditional select

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0a54a9ef8f7..161fa2659c4 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6033,9 +6033,6 @@ static bool trans_FCMLA_vi(DisasContext *s,
arg_FCMLA_vi *a)
         fn = gen_helper_gvec_fcmlah_idx;
         break;
     case MO_32:
-        if (!a->q && a->idx) {
-            return false;
-        }
         fn = gen_helper_gvec_fcmlas_idx;
         break;
     default:

thanks
-- PMM
