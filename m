Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp361562ejq;
        Thu, 4 May 2023 07:52:27 -0700 (PDT)
X-Received: by 2002:aa7:cfc8:0:b0:506:bc29:2ce7 with SMTP id r8-20020aa7cfc8000000b00506bc292ce7mr1856415edy.29.1683211946923;
        Thu, 04 May 2023 07:52:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683211946; cv=none;
        d=google.com; s=arc-20160816;
        b=KEz3FNl/JwSOV8DC6cqs918exl1lJijPf41s60FYVi1BhXaOgT1VK9XfRrmBdL4jZc
         x3VHW826kpt0T2KJGtiw2iP3tcdoJN5osPvoOxEslWilVnHuNQgzo3x5BRUNOg5zG2n+
         6hiHOTz6Fyk9ovMx+ocXpMUKd2GhgQV+VMMo6+TKH0BrImOYRi3PXLBj4Z+vAPaPDow/
         kGYFDmUuU6CgiaYia302ZKAJNR0ktDVeMaI7pA5wnUyzcg62QWT90aEJ+B9nWoJ+nnFT
         743XEehoveO0txWYgDns0rEuNKMHzqw8hK2HMAltVDntgyFsIZprL2vELjobxDIMHbuq
         SMtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1B2FvgWAY8kZexn4DUNfwK8A+zUkKYUqoSQ25ES1gXQ=;
        b=mU/IrJQB3A8g6b77ezxgoVRwK5IT4jwQ3EDv8b0sVL2ldIOX1OijwtvmNXZnvLWhdK
         53on55bUZ1yUy7JqwGaT+GGCCMIVywQx8NCRL7cxW3vNu7DFogOXT6uCHNTO3Pjwii+E
         jh3oD7cv10A5hBB96qQjTk9CFk0ZuXpu/9Agn3rjBa0K6TfW/hJhVlmRl+BldaL/ah4F
         uPovn0KAwp5KwoEP73NQ9dOvBm9vhrQ+H5/sHZL27ua7S/1Ma2ygFUUyEqvyCbUji+Bp
         m/gJZ4JSSOGoexCBrOwyDw7r0W9bznGkqq3KvkcUSRUDvTBCslHhmMkjVjwJ5CV9gmym
         Yd1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EeyyITik;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i4-20020a508704000000b0050bfd284a66sor1436088edb.7.2023.05.04.07.52.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 May 2023 07:52:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EeyyITik;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683211946; x=1685803946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1B2FvgWAY8kZexn4DUNfwK8A+zUkKYUqoSQ25ES1gXQ=;
        b=EeyyITikCWVvyGsXCeHqpo6ZKAwjha76TE5ohfZGJT1wv8BmibvlhZUednv1B/Fb4s
         g2Y3830rB1c7b9xqAs3WKh/jfxhRXvsGPW1yWKlos7oeK8+u7w/JiiAO0NQVn5bDOktu
         XxNrnFbQr8j0wHWrTM4QbqtgR1bdak7xUhiY2LmVdd8l+rMMkbvXrrmz92N+ulvgr5oO
         TSNBnh93EEfQB5y8nkmRakD7Se5HgI5Bsp69Fx7dVANutlSHHNK+cRwhF02gC7GxKvBX
         Iv5aFXyuGYOt6unM5O7AhbxJmaiH5eKXMiF8Lo1VLjT0sRKsgieURqNNVCbtWXKhzJRH
         3y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683211946; x=1685803946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1B2FvgWAY8kZexn4DUNfwK8A+zUkKYUqoSQ25ES1gXQ=;
        b=GWAzRBa97k2COiVviT+CTww/kaGTsU43NtyHxgPHIl0+oQoNWQxo0Wbm70IDAkZdBo
         cMj0Z9hUgRrUqducHifVYxcPxKhBnEttkQSXgNBEiGPXfMxDXJ7pfutZrEyWQPjMk/8s
         /XbUevfzkqeXnELe+ZiELF7xTC0nKu98qclXcAwRMIEjvl43VCFpohTwexHlfXipT5P2
         ueaU1oFhXNLDRs3a8UhsI/xvyuSNEkwCtm554R0SdyPoyX29WInJe0er45WMF41mnfKd
         dW/8wkY77t49nGHNBVHVzpiql5tEq6ZEn6sDBm8UJFzR1K2ofo/aLTbJmg/tR4WKjHal
         wpPw==
X-Gm-Message-State: AC+VfDyYu6TsUUWtUSNwbU+z8Jc4ajdLxWK2uLJLrje4TKLO0v9UorGW
	FRfsxOrhTKBLqHcPu7w1f6tDOXMv2aGS3xujcgkjYSLU
X-Google-Smtp-Source: ACHHUZ4ctO8tcI2bcUG03yRTCTfOpKiGeoxdPptrjnNleozGXeclD/XYlWu4X2kNshXZAvMkh6fNhSZkQed89QTtdsw=
X-Received: by 2002:a50:ec82:0:b0:50c:1e2:4a42 with SMTP id
 e2-20020a50ec82000000b0050c01e24a42mr1720198edr.15.1683211946558; Thu, 04 May
 2023 07:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230425193146.2106111-1-richard.henderson@linaro.org> <20230425193146.2106111-3-richard.henderson@linaro.org>
In-Reply-To: <20230425193146.2106111-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 15:52:15 +0100
Message-ID: <CAFEAcA8YaS1HRypydW25tTtB5D0XdO-m9y1OHxVCDOcpWtWgQg@mail.gmail.com>
Subject: Re: [PATCH v3 02/57] accel/tcg: Add cpu_in_serial_context
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org, 
	qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, git@xen0n.name, 
	jiaxun.yang@flygoat.com, philmd@linaro.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: F34VuA5kZChY

On Tue, 25 Apr 2023 at 20:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Like cpu_in_exclusive_context, but also true if
> there is no other cpu against which we could race.
>
> Use it in tb_flush as a direct replacement.
> Use it in cpu_loop_exit_atomic to ensure that there
> is no loop against cpu_exec_step_atomic.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/internal.h        | 5 +++++
>  accel/tcg/cpu-exec-common.c | 3 +++
>  accel/tcg/tb-maint.c        | 2 +-
>  3 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
> index 96f198b28b..8250ecbf74 100644
> --- a/accel/tcg/internal.h
> +++ b/accel/tcg/internal.h
> @@ -64,6 +64,11 @@ static inline target_ulong log_pc(CPUState *cpu, const=
 TranslationBlock *tb)
>      }
>  }
>
> +static inline bool cpu_in_serial_context(CPUState *cs)
> +{
> +    return !(cs->tcg_cflags & CF_PARALLEL) || cpu_in_exclusive_context(c=
s);
> +}

Can we have a doc comment that defines the semantics, please?
Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
