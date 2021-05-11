Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3941779lfg;
        Tue, 11 May 2021 05:42:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn8e6C2MTq3DJtzPmru7aigBJM6xWuf8U3TgtyIVYPA/BeRYpshslNorMfxZVaZmivZPra
X-Received: by 2002:a92:650d:: with SMTP id z13mr11915337ilb.193.1620736958713;
        Tue, 11 May 2021 05:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620736958; cv=none;
        d=google.com; s=arc-20160816;
        b=tZ8vvsb8i31rZTDK9xmPc/8KuVb83nVegiLMQHH/iP6R1vAHd4PVNzWsvDeDQRRF6X
         mbPH6CIHSV8ergCzGRXfoWdpWxCpBBBSF3pXl83F9z+mIcYEVbFk7vvrG9UqQ4aObHEO
         uKdUw+F/4XucKss1ZRPonXScjrADR7En/QCIRzRe7+QRj4EPxOCNNJKNGwfd64zUkrlW
         Xt2KeklvkFwfEBllFgoI0WmzV8VvA0GXxnZ3aNzn9bX2OWMuQV8epLAXIbD+B9AeuMzP
         Uhy0kRw8S/0Rg+/VWpzhPjjzGUX/t5I2JzMsXI1lyJK77MQ4iGHU3R4EWEiacNk0FAm5
         UBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jkVMGHM2OFM3PfvMFosGHx1y7xB7uCorpA1+ExyeYa0=;
        b=lT0cd9R/wYIB7wO8l1mTSJFpvt42jeldQhDRxENGELSvEuUcynRuO02cBcbt7Bl6O5
         Py6y3vMA70Ua2aASQiWO45wZBfCMxkciLby8vkQ7Qt0VY3Il7j3296NEwUOdP3fH9M32
         7T1ck532Zo5BdGL5Smc8xcml5VUo5vglLVgeHSNqqLFQVN72ZI2cYF3xpjd6winr8dlH
         pzNZl/oiW1oWKNRG5+ebEJbnggWvZVvUsockWoORuEspSQZ6Ek0ChZlvU0aFxNx9Fc9j
         6hRGD7baCTmSx2GQswoz0RwaOdCDpfzpPpK3X0/DPx4XSWzU0mg7nnM4a9VIA63KUgxc
         w8gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NGyFPW6O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si21742715iov.91.2021.05.11.05.42.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 05:42:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NGyFPW6O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgRig-0000oU-3J
	for alex.bennee@linaro.org; Tue, 11 May 2021 08:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgRi3-0008Oo-Sg
 for qemu-arm@nongnu.org; Tue, 11 May 2021 08:41:59 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:45944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgRi2-0005GU-3C
 for qemu-arm@nongnu.org; Tue, 11 May 2021 08:41:59 -0400
Received: by mail-ed1-x529.google.com with SMTP id j19so306169edr.12
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jkVMGHM2OFM3PfvMFosGHx1y7xB7uCorpA1+ExyeYa0=;
 b=NGyFPW6OQbxzVTXbk9LfbxugqDCwo+olqEhtPgNAUCZQGc+IBQtGV1jQkHsRfi+tgs
 YWVwjO3NdZuWtW2NDxsByzTuxpg7imng2HJJLeo/brhH7h+/UL0kypUy/RzGMy2N5Eq2
 67GO+orU9JpwenS3aH/jx1CDQDq9rJKCEHgljVgyaampR4+Q/axwZ9tD41ZP2mu7DR0b
 eu04KWMZ8dV2g4b4KLh3bFF9/9iW8sDxgw23eut8XO/BCel5fOgKRHHSGi2JzqYVNUuw
 8kX267XOimMQ8sDWn1R0RE7MnWme7Ie6BVzSRZ7RB/rZIQZ9M0/AgB3tGjH3Ct/K53Gj
 4gNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jkVMGHM2OFM3PfvMFosGHx1y7xB7uCorpA1+ExyeYa0=;
 b=lvFnabUTmeCKtygXDTrIgY+koEap6V50K17/qZlvdpSrD1c+pulWNAIi+osMYcNyTJ
 4l4GjjqGHIC32UHbbsfeamYukvigel0+M5sqo8cxdODGTZl7/vnL1ZuaPod0gZGnowZA
 N8lIZGpvuKfTMHn3ZVBZOfw1D7lx2jRiscwNqvZz95f2E5pHpzy0m6hSlu4cNUOLc7TL
 D2/XDWDkvT3zpJ4InXm8eEo08K+jSxXy9WHVYOkNucfsqF5vo/NNqwt8o+2dusPnwj1r
 NvIfnkPPU7OdAy/PDACFn62BfAB3zf5K1FTFk/Pjbt5ruC+ue/ufUTw7bPkMjivh4S/h
 kpqg==
X-Gm-Message-State: AOAM532XBM3xIcfEztuAiSAlPOD8mLD/onQ/vxmwpbGBD6e2DcgZoqAa
 eb/gNIx85RFMe9ukgby026t4ST7e/pnThRzwX55lxA==
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr35584491edd.251.1620736916320; 
 Tue, 11 May 2021 05:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-16-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 13:40:44 +0100
Message-ID: <CAFEAcA-K0Bk0t4r87a2w-8Mp_MtsFPpzw4AXPNju=h3mxZ6QOg@mail.gmail.com>
Subject: Re: [PATCH v6 15/82] target/arm: Implement SVE2 bitwise shift left
 long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8H68Wd1kV9hL

On Fri, 30 Apr 2021 at 21:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |   8 ++
>  target/arm/sve.decode      |   8 ++
>  target/arm/sve_helper.c    |  26 ++++++
>  target/arm/translate-sve.c | 159 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 201 insertions(+)

> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index f30f3722af..73aa670a77 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -625,6 +625,8 @@ DO_ZPZZ(sve2_sqrshl_zpzz_h, int16_t, H1_2, do_sqrshl_h)
>  DO_ZPZZ(sve2_sqrshl_zpzz_s, int32_t, H1_4, do_sqrshl_s)
>  DO_ZPZZ_D(sve2_sqrshl_zpzz_d, int64_t, do_sqrshl_d)
>
> +#undef do_sqrshl_d
> +
>  #define do_uqrshl_b(n, m) \
>     ({ uint32_t discard; do_uqrshl_bhs(n, (int8_t)m, 8, true, &discard); })
>  #define do_uqrshl_h(n, m) \
> @@ -639,6 +641,8 @@ DO_ZPZZ(sve2_uqrshl_zpzz_h, uint16_t, H1_2, do_uqrshl_h)
>  DO_ZPZZ(sve2_uqrshl_zpzz_s, uint32_t, H1_4, do_uqrshl_s)
>  DO_ZPZZ_D(sve2_uqrshl_zpzz_d, uint64_t, do_uqrshl_d)
>
> +#undef do_uqrshl_d
> +
>  #define DO_HADD_BHS(n, m)  (((int64_t)n + m) >> 1)
>  #define DO_HADD_D(n, m)    ((n >> 1) + (m >> 1) + (n & m & 1))

These undefs look like they should be in some other patch.

> +static void gen_ushll_i64(unsigned vece, TCGv_i64 d, TCGv_i64 n, int imm)
> +{
> +    int halfbits = 4 << vece;
> +    int top = imm & 1;
> +    int shl = (imm >> 1);
> +    int shift;
> +    uint64_t mask;
> +
> +    mask = MAKE_64BIT_MASK(0, halfbits);
> +    mask <<= shl;
> +    mask = dup_const(vece, mask);
> +
> +    shift = shl - top * halfbits;
> +    if (shift < 0) {
> +        tcg_gen_shri_i64(d, n, -shift);
> +    } else {
> +        tcg_gen_shri_i64(d, n, shift);

Should these really both be right-shifts ?

> +    }
> +    tcg_gen_andi_i64(d, d, mask);
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
