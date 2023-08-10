Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp790560ejc;
        Thu, 10 Aug 2023 09:20:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR0Sob/1jWeYK6/TMVkVGBene3odxhGJfqwQJv48K+oB66DzvDrIHpOCgjEi6iFAD7lfbm
X-Received: by 2002:a05:622a:cd:b0:406:9d38:50ee with SMTP id p13-20020a05622a00cd00b004069d3850eemr4117131qtw.14.1691684423873;
        Thu, 10 Aug 2023 09:20:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691684423; cv=none;
        d=google.com; s=arc-20160816;
        b=zMRTg0ZZcvMKdBoJpaEz9YcR1AScWCTqY17adL2UeKjBS2P3zvi4gc8o/aSJoPjm+f
         zZc8fxbX/hv8Vf2T8aNYYdYkPPvP6PHBgKgFPqOCckX0pc481dchFsq6FP4sxXxSV3Ef
         u7s4ZHStr8y1XfGcRW3FgWSn27oVuuWk4MlE7kM7C3TDJ6t8alWwEFfaHpqADCP4geMK
         0LrWuTOGnxHecIwoY3Ybx5uTJ8qsL7us2lyBbXtMVBUCEWKx/TQz0yu8HnAX3T+9u0Fb
         Lg+vlc7qsgiJbY9yqPxAV5PKv/g7epQKlZPhvvkNkCsTP174zmiI8ispYCx/Tx0ccFCC
         neXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lT9l+Y1Pj57uejfgb7m00birXyIxfDmUf0wpond+swA=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=Q+VqeaDdnG6H+gjk7LoneebztnVEDKVz+MeB4++LPhIK9Fg20xeiTycZKxb/V/n8rs
         PpRAeJBOVCN5ueHAch8mLht38tFblrMY64/oAHXyvB1J7dr4a4c/hME6OWCD48R5bTug
         n/OYjdqZ89+InejQUBjlKPY4BQDEOMGucKL3JG9kE4U901vyG/A1q49b77X106rGoeCC
         CpQ6zGEhiOpmCxoMFmxuE2yXH+sbJRfgHAhjGuveW8XdvrPEqVWAhb6ryR3d+HXOSppi
         biPMaSgGfmpL121t8YqVrixcP1ElFUfngp/3mkAjBsd/R6WosH3XhUmL8ej0bLYESRV6
         3XYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CM2nZnBR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17-20020ac85a11000000b004031ae3ae02si1179714qta.21.2023.08.10.09.20.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 09:20:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CM2nZnBR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU8Nk-00045I-B6; Thu, 10 Aug 2023 12:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8Nj-00044H-7X
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:19:27 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8Ng-0003pi-SV
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:19:26 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe463420fbso1622905e87.3
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 09:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691684363; x=1692289163;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lT9l+Y1Pj57uejfgb7m00birXyIxfDmUf0wpond+swA=;
 b=CM2nZnBRj45WCgnDZ+lAFCQPTrjr6rI4zLu2EQipbFyAQqHvN3l5fZgvpRBsKff33l
 vpB4V3ZUN/r1xaMVeKtUe42VYcefIyfomwZGt1ytANNoGytJIIpv0K1j6IlcOcGeiSKg
 r7xmTd+KBHOeGwDYqXqu0OgHbnqsQKroHhQCNwEyWxqDi8REAsVLvIO00t3XbngO+SIB
 lJBrHP7Dyd8/5bD4fSYS77Ko8Ye/BJv/h4rZWiX7tqvCkTWlGKG1SgbFhVAzyHfb7SQG
 ub8EYK2AjCLcrh2/DseJOyuU9qf8NT0yo77fAtmzZhIjenFsWsWQIBe9VDyn5eG1Z0RV
 X46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691684363; x=1692289163;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lT9l+Y1Pj57uejfgb7m00birXyIxfDmUf0wpond+swA=;
 b=jwu7Q+clfxOjYAjZzsQ1lEKqEx4qNNh7dRyP7asPGG5FCte6+htVUzR0GfXGd0Ud4I
 IlOHLPVBSWfJ44V4F8gPugKsjsYgQji7Gvuv0EUTaiYK2LtAhr4ErOm+BXIuGjo6TBJV
 m4hdwIP+fg9VQ2CyuZjCdW3CCh95TxSX5Jmr0PXK1xK93r1nrLOsTSa1Vf6sO3QiZRDu
 I6px65kNV8LyVO5TY6GoI23ZVoY2Q6s1mK1blaRmgaYQR6YV7c3F8ttHRZzsv4VMesdS
 O7p5S0kH1H68srwxXi6InwpfjuyZpi+/d5L7+88WolT/aQ5X8hVXwjnaeNGB9CP+k32C
 7U+w==
X-Gm-Message-State: AOJu0YxYNbS3nYLY6GUawvh01au/1w6K9nvinj4TvjgAoUmKBSY4xj/E
 DqpoQsGyKaEK0vsi5y5m/E1oJG6qJHiwVurHSYw6JQ==
X-Received: by 2002:a05:6512:3054:b0:4f8:714e:27a8 with SMTP id
 b20-20020a056512305400b004f8714e27a8mr3028001lfb.0.1691684362727; Thu, 10 Aug
 2023 09:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-4-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 17:19:11 +0100
Message-ID: <CAFEAcA-D-P8Mj8_KcNyFQLuwpxPZOW0pptDDoGswCSaTfVmiew@mail.gmail.com>
Subject: Re: [PATCH 03/24] target/alpha: Use tcg_gen_movcond_i64 in
 gen_fold_mzero
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: iDopnuSZ+Sdv

On Tue, 8 Aug 2023 at 04:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The setcond + neg + and sequence is a complex method of
> performing a conditional move.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/alpha/translate.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/target/alpha/translate.c b/target/alpha/translate.c
> index 846f3d8091..0839182a1f 100644
> --- a/target/alpha/translate.c
> +++ b/target/alpha/translate.c
> @@ -517,10 +517,9 @@ static void gen_fold_mzero(TCGCond cond, TCGv dest, TCGv src)
>
>      case TCG_COND_GE:
>      case TCG_COND_LT:
> -        /* For >= or <, map -0.0 to +0.0 via comparison and mask.  */
> -        tcg_gen_setcondi_i64(TCG_COND_NE, dest, src, mzero);
> -        tcg_gen_neg_i64(dest, dest);
> -        tcg_gen_and_i64(dest, dest, src);
> +        /* For >= or <, map -0.0 to +0.0. */
> +        tcg_gen_movcond_i64(TCG_COND_NE, dest, src, tcg_constant_i64(mzero),
> +                            src, tcg_constant_i64(0));
>          break;
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
