Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp718015wrp;
        Fri, 13 Sep 2019 06:03:47 -0700 (PDT)
X-Received: by 2002:aca:dd05:: with SMTP id u5mr2167860oig.103.1568379826941;
        Fri, 13 Sep 2019 06:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568379826; cv=none;
        d=google.com; s=arc-20160816;
        b=vyVQiUMqkhm40BefQnwLyjlEyxhZq0QTkQ5gH/ZK9iR+6bm8x61bhENEIzO/1kl+v1
         ZKDDKuWI4cx52A32l24xgHWKese6+DxaSJGDP3JvaEQsDTDW+7+63dhvVYiAYgFj3CoJ
         Rui1SqCT0QGvCN7rYgHcwoXiAY7CrfsZ7Fzt4khK/lEdmBmvBiiRvesBOF3z6hnmWN7V
         z07im0O7SB4H4Iuq6CY2Q1/7lI7p9m4yQ5bnxbhH38SeazuXBPPeanEGzLXgM5ENuPyF
         kwLC14nOak4dTdMNxFbQSet4nQNd9sCjDD6VkL0pYq7wJMuPsGOL2jg8Mfv52C4Y0FP7
         twHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y1PYvy0144WUIYCXJJMTyvF8+rozDqGNJlGXaeIisEc=;
        b=b/9BUwi+Y/yunIhwgfhIAo/0bluukiZvkohBaUShLL4xEf+uv2+gDGmVsv5RiNhXTv
         x+jcN1VsPHs4w3ORfkMOAkFuaRRyGxRoJRm/h7ayoOVtZ8+0naeFbKplO+k4b4/JdoPi
         UpJOU1f/vFTFNKAdAe0bvEAw/hHvPlUTdL75RRDqs6HjKsz7tVPUVRaWa8AMJM8RVcRu
         oQrcDzfv5Jb2XMbVbDFWqZP8CaLXWq6YYNMzPIM/gorZ1w9rAxDM8qOOxqPIXnd9AWSe
         jlUfRoI0fffik9mtmlGMqoIdhYt0nN0nrKA9x4v0RPfkLWNC95XST1EVXr+0oRMDogVj
         T+Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fb6p11NP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 61sor6923259oth.102.2019.09.13.06.03.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Sep 2019 06:03:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fb6p11NP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=y1PYvy0144WUIYCXJJMTyvF8+rozDqGNJlGXaeIisEc=;
        b=fb6p11NPh5mWtzjQs2vBqmSP6KX9Hy1N/HimzQSQafwvfOUpkn7kCt8Gk7sC569B4P
         w6xZKaNq/4anuQCf0EbX0kZU++vFskl1HHjIfeiPEyV08KqV55edbXGJpl0L0EhfBQZG
         c7iBtQXJVe+U86HIPCZUtoOMtFxVu8xvcrrv0H1/VHEIaoX+5dxKaJPD6dNAh4ZbKYAv
         sWQZo7/3YopDVPWh6IjSyMgCPunBT8wwKAw69tfnmLvwmf8c47E6/LoTDN5efsqGvyI8
         SdYq3Ypgw7gUTnDenwePAPMrFKuWyP0yX2h53yu9Kx50YQ39cBBfcP21Q8Fot9zs1sT9
         yx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=y1PYvy0144WUIYCXJJMTyvF8+rozDqGNJlGXaeIisEc=;
        b=RlJkwvjV5plFKrppOgRn4uvhXsv5FI6SwTZV7RR+igG1W5YcDPxbKI6Ppc2po/okwl
         EU/Rk/j2QEEj5tT3sb6B39PfNbYghMy9okpH8FycUXwILzBt7myqcGWz2IR5xnvY1czX
         aI0Ie9ORNIWdz+UDCxOLMNy0rXQmyhnWWkM/ojx0D7iMsTfQ1RekzRBhK7RB55BXQrN6
         0lMpcWDGwHJlRqblXaiRCtooYFuVVO7nu+bqylIe0B2KeYTdwZUrOb3Zt3Mr4EKvGbGp
         +gS9FUNyhbLAIT8IoqzbEq2y1KaoxpCbgjTg0/Y4JU+oSfNYXoZo5wVRPBtFaPXSqvsH
         McBw==
X-Gm-Message-State: APjAAAXkHwrhBcpz0a2ZUQBNxqJfDJvF8fnKlFHqwMK3FQ1Pg5zQMwtu
	paYjz7xCOoDxqCJKg/8DM6mLTHCJq+AUUMUGLChIRqMjQ2hzhA==
X-Google-Smtp-Source: APXvYqwdQgTeKuiN+BXAJk2rNn49tfppI+2ONnyrFknvlwcSSxH+WxyzSnu3aDsaKU8+JhX6yognRJjEGPsqMkcZHB8=
X-Received: by 2002:a9d:68d6:: with SMTP id i22mr31993177oto.232.1568379826481;
 Fri, 13 Sep 2019 06:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190911164959.11003-1-alex.bennee@linaro.org> <20190911164959.11003-3-alex.bennee@linaro.org>
In-Reply-To: <20190911164959.11003-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Sep 2019 14:03:35 +0100
Message-ID: <CAFEAcA8NsdpEMOH1MFDta0LUswyqSDHCgtOh6g5k3+EU0FVuHA@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] target/arm: handle M-profile semihosting at
 translate time
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 4Sdk0jSh6OXz

On Wed, 11 Sep 2019 at 17:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> We do this for other semihosting calls so we might as well do it for
> M-profile as well.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> ---
> v2
>   - update for change to gen_exception_internal_insn API
> v3
>   - update for decode tree
> v4
>   - use !IS_USER
> ---

> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 34bb280e3da..6689acc911e 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -8424,7 +8424,13 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *=
a)
>      if (!ENABLE_ARCH_5) {
>          return false;
>      }
> -    gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, false));
> +    if (arm_dc_feature(s, ARM_FEATURE_M) &&
> +        semihosting_enabled() && !IS_USER(s) &&
> +        (a->imm =3D=3D 0xab)) {
> +        gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
> +    } else {
> +        gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, false));
> +    }
>      return true;
>  }

This is still disabling semihosting for the linux-user-mode
build for M-profile, isn't it ?

thanks
-- PMM
