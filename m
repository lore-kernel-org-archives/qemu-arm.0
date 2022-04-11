Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1749112lfq;
        Mon, 11 Apr 2022 09:35:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNy4e7JKvQsHoZgxzivDSAwmViRlc1nAjTGscl6t9Aghp9FHRLO6rulz5v5DoULQYJxKRP
X-Received: by 2002:a25:d796:0:b0:641:37a8:c681 with SMTP id o144-20020a25d796000000b0064137a8c681mr6358112ybg.120.1649694917208;
        Mon, 11 Apr 2022 09:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649694917; cv=none;
        d=google.com; s=arc-20160816;
        b=yafQk6HMAJkmdnUvkYEmpX4y/87KKYF/Ws6je5n0BFexO18mI5VkXAJYDvFzcTgubl
         HMqZyArxxkmC0Msy26e3SiOsqjASMLCXRWr0aWK5T/Q++INLeZtcxkxJgIzPWgwXoYhv
         hIzU7/iBNjkD3hZEmNFlHqX9N8rGuIgbLko9+JloWUiycuyVmhKRm6BEkPERs+wGkqdb
         +fOiHm3F79XJE9yR3ZfGHq85VI/hLhc6aSTK4eIe2hUJTB0pcx3x9Y+GF6tnCATk1dvf
         BIft/Iko0rH8ma830k/hbMFeT9SnlId3HpRv0dA1WKxXRAvC7dDniOBT7jhjipxGPiGK
         rfcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HmM7RYJUuoF+aH+ErziRWCH/z/cehlNtCXMjRSt+j/A=;
        b=sGLlADzRYe+F8UEgkAZ56QgZlEwjI9I7ii5mdYRdBsVqZszAd7PKCNI/aL47iIYFIv
         wSIc/31rt1INtSdQ5uE+Z+y2zZvdf9m8KzwCFDmZYYNu9ZT/cX7b69vnms2QuAHp2huA
         UjlVAkl+hd9qtWzWsAZYHAX5gyb5SSiBJ80ZwRXrnRtEcce0q4HK905m3pA03xWBo3YN
         C6ZfexhTYwOq6npO4tTYW0MXyshO9dv4InCllqHmJxcNzShqYL2c359MFDEfFBj6pugA
         iA6kerHZbQzUeyyt+0ipij/xVaXvIPycZxX2BY3lw++ijBn7KcpQEw0DzI5T3lCyEOxa
         uOew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MAkBpn1g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a203-20020a254dd4000000b0063399404407si4401847ybb.113.2022.04.11.09.35.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 09:35:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MAkBpn1g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndx0V-0002jF-Js
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 12:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwyc-0007lj-4T
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 12:33:20 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:35430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwya-0000Sn-Mu
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 12:33:17 -0400
Received: by mail-yb1-xb31.google.com with SMTP id t67so11660644ybi.2
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 09:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HmM7RYJUuoF+aH+ErziRWCH/z/cehlNtCXMjRSt+j/A=;
 b=MAkBpn1g4rydyuEWV2d9gfFd2zxPdQ7wqTMwvubZtLsxjnYT+M9jOsDd3gNlUzd5JS
 P33nuFhuy1nK5K4eOYjjFkOQYHFhG/0zXpTA9s2XDGBg55jhUj9+uciUoBmjJ++nqy99
 oEkNxXobr6uZwBg4AofL8DO4GwotWptm4A1AeYCIug3SG0212+cR43dHNrotHlIrHc6c
 MVTWkm4hE0RgnDWttik7aUA3ABHnduX3rFEWeTRZ2a0wAgglu9hdWU4DFijk202vrj1W
 GCQhkBOlUtLVYgEeOV7ztUawLo99s4h1Hqa5uOC7GEhJJ3nBj7Um2ZnnqatzTt1vECZN
 ZmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HmM7RYJUuoF+aH+ErziRWCH/z/cehlNtCXMjRSt+j/A=;
 b=H7ttkUqF4MPXFCwRZWG1szHI6dpEBdUjAl2wjuGjuShwCyqUSOLoJUy5bVwT/tjrtk
 bb3YPZjkxtWBZU3hYcitrMWwX9avKbmRZC+EeMZ3mdsyqvZltpxDJNkmEBFBk51LU+9j
 sKXAfpEGcHYiW2wcq0w565XXhrHFdgQiUwq6AlTbTTBoJ95uDPaTDmRIbitqp9mLetnH
 A2wY7QFnCYQPoJFFuJLBpS5nho4Og+PDXuUJSqaT9R62i4e9j+Q4LdFWW6uQU4cxfmMZ
 fGTC9nrZz4IYJar+vhlnQNGyDjPYHc6kz4RsX4xJsoyPQu10InEAvrZSx1gscnlZbvIw
 qH/A==
X-Gm-Message-State: AOAM532t2kLHwrjKF+AmyvNGhpCLS3rIyNdiGrZkNCI59w/R/j0s35mS
 6poc0v7ZhcZxkFZ4mIHmuOPXxKEsa8+ha55B4qskdbrkhfw=
X-Received: by 2002:a25:ae54:0:b0:641:1aaf:c89 with SMTP id
 g20-20020a25ae54000000b006411aaf0c89mr8930094ybe.479.1649694795377; Mon, 11
 Apr 2022 09:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-17-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 17:33:04 +0100
Message-ID: <CAFEAcA897adk1A_2x8Tq1CjCmLy0kGEi85WnYnqF6WiB=6dBuQ@mail.gmail.com>
Subject: Re: [PATCH 16/16] target/arm: Enable FEAT_IESB for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tV7yKXT16Vsg

On Sat, 9 Apr 2022 at 01:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This feature is AArch64 only, and applies to physical SErrors,
> which QEMU does not implement, thus the feature is a nop.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 03c6707111..def0f1fdcb 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -838,6 +838,7 @@ static void aarch64_max_initfn(Object *obj)
>      t = cpu->isar.id_aa64mmfr2;
>      t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
>      t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
> +    t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
>      t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
>      t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
>      cpu->isar.id_aa64mmfr2 = t;
> --
> 2.25.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
