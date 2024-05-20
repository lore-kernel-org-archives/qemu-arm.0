Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1482578ejb;
        Mon, 20 May 2024 07:31:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVUkiZa42Qktuntl1wBtueD+HkbwASlrrgTXlHryP4eisJp32V5/jinpl4JUxGFcNfA+KWzJXl6pSKLBVm90KzXmeDoAhw
X-Google-Smtp-Source: AGHT+IG6gXfbChtiataYzM8ZBOTq1fQLwXhyRm0cbh//ldaKKSGUHlcGrsY/voE+zKLVJs6VnicI
X-Received: by 2002:a05:6214:4186:b0:6a9:106a:1197 with SMTP id 6a1803df08f44-6a9106a13b3mr54520786d6.64.1716215511559;
        Mon, 20 May 2024 07:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716215511; cv=none;
        d=google.com; s=arc-20160816;
        b=sRsPz+HJz6GKG27doK/IlLVCf20YhnqijT3VzbifyJFVIO+YAI4+V1g047nGp3xBO9
         jYtpWmTPuyEvcZ+RCK15bpK1bzk0rrUQLSLkDlmubnYWGgjx05bN+l50NGy8+zuPzhgv
         Dq5vxBmkOO+VgYNOcqZdmdD1PPz0wIf1Bk3tQKO+VgSrBKpNe/fzaFPEICmPPIzFz50D
         PJfFIXGRGupqvN2EVsvKMQz2tWQdytHhTMd8MtIylpTljGyR0YahlWNpMUUqfGOS9DY/
         NM5EJVS3akCqn6wZKcIB+Fs638ysKo2M8Dfa7sFjQe4fv4m2vPXV7Q8Ux7myrCwVcDcy
         oWiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=uNkndTB/EfiXIMFigE3HW7JUkwKzX31GL4b5ChXEUvA=;
        fh=YUcw/NuUUZQRc9nRtT/UpqQfSfRFm0cLtwc7zOFqXGI=;
        b=GtPtXod7n3WzzUCgDMmb6V5XjfHe3q93iA814cociMmzpjN/SQUMIw9ES/wVMkNraH
         Tcj3sWZ9m2TVH7xU9TENQN44rWKM+V3DvbuP5Alyp73xhlaSnUVE/jqLmUEf73a+CjWb
         OPF+/U4uZEk8KyJ0rO+0BNAlogZ5+fLDJf5UjyIKFl3fAXPLoCqK/jSLcWTBANoJbS8E
         mkxQoNGtBqvlFDK3bEHfGlZ9caTV0xKoCCFV2DNGRwWgvVNSV1mB1oyckcJvZSOXjsoy
         k08VV++0KM164Bwg3waozvM8iRnrtrCu9Wi3BO7Xc3U58K97DCciXBd+/6S46FTFKHaO
         UHZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZfCjfX0Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ab656f6defsi12051206d6.186.2024.05.20.07.31.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2024 07:31:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZfCjfX0Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s942W-0006uc-6p; Mon, 20 May 2024 10:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s942D-0006r3-Nn
 for qemu-arm@nongnu.org; Mon, 20 May 2024 10:30:53 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s942A-0006Nr-7i
 for qemu-arm@nongnu.org; Mon, 20 May 2024 10:30:40 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a59a352bbd9so1035460166b.1
 for <qemu-arm@nongnu.org>; Mon, 20 May 2024 07:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716215434; x=1716820234; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uNkndTB/EfiXIMFigE3HW7JUkwKzX31GL4b5ChXEUvA=;
 b=ZfCjfX0ZaA1qC96S8HbwulkKnFLZH0a4Iej3/2EkmSBLsda8uzW2Gcc+WXLRv3ptKR
 bN8fcICM/9+2pY0GbuTLWapzybr72PFoYPxr8nFh+TkcRJeIabcND9lax50lMpO12OYT
 PkS0I1p2apKZgM+T4tVZ7lnHLEOH+ieH5XhD6aGEcWaYQGtIuIqXXV95HYID2wyNdLuq
 hTyVWl0WpRUyTSCL2ZYvLukSnn0XM3sLm6KOnTZZTVtBv0QNKXZ4nhJ54K8X5FVrqb/7
 HAywSBmRSelA6wHIHi4q1yeb00DZOz31mvR643JwO18WPY4wmo1U2jA1ji1PViR6wPF5
 gUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716215434; x=1716820234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uNkndTB/EfiXIMFigE3HW7JUkwKzX31GL4b5ChXEUvA=;
 b=TCdnFSVVnEZa8mA+g3lPyGLQqbz0ss++6Ga29OCxGQFH59pAqCS5RHWfp3d7eCjqcU
 DGtWPY9Wp0zL6546lsu9A3f3sykaZzXPYgEfCWmLL7RAJi/lbBqoSdSW4Hh9tnmbWSiB
 Nq8efmjwP8KhCnQeqdpBJp/jPlK572aeZx6i4MSXYGhbnRGHALeARcRghHCbaxud0TBr
 s4GxQUynxES2i5HX3H8/28jYLsHkhPIV7/iFAUidPGvTvip9USf3aohmZyfRLtUQ2JJO
 PG0bvkhQ4GiLwTP536mDcrWvkZAcnzx1REGsgNhnYhQxqkR9xkU+z6yDw1bRWbCnHA1A
 kZPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPntNwE6lHJyj1mq8pyYLJYg6OEznf3QbcZ9DhN3gCY7ozlwTnL6zerhsbXRGrXkPGOnXJY3/fwOoleJ/AP90gRyZv
X-Gm-Message-State: AOJu0Yy4Zh5jyPpGNYzwNH/cZruC4dpwj3KJecKh8o96KSFTiy6ydPvS
 W8EswUlX97i1Gn/3XsNRGVG4r9RlhCPvKqokOq0YQRPuJ/zEhYN5seE80OjYPKiMGzvuqZM/akN
 Kz+ysAfqZMphVEQFO0uB/LHyV1PV5damjKOsJPA==
X-Received: by 2002:a17:906:3791:b0:a5c:dce0:9f4e with SMTP id
 a640c23a62f3a-a5d5ecdc434mr601716266b.28.1716215433700; Mon, 20 May 2024
 07:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240512102013.211127-1-ines.varhol@telecom-paris.fr>
 <20240512102013.211127-3-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240512102013.211127-3-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2024 15:30:23 +0100
Message-ID: <CAFEAcA_tPLe7_rzmzOds7wAEFaP7Npk_4WqoBACC6nUTWTBfGw@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/misc: In STM32L4x5 EXTI,
 handle direct line interrupts
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
X-TUID: mbTCv6ML8f+g

On Sun, 12 May 2024 at 11:20, In=C3=A8s Varhol <ines.varhol@telecom-paris.f=
r> wrote:
>
> The previous implementation for EXTI interrupts only handled
> "configurable" interrupts, like those originating from STM32L4x5 SYSCFG
> (the only device currently connected to the EXTI up until now).
> In order to connect STM32L4x5 USART to the EXTI, this commit adds
> handling for direct interrupts (interrupts without configurable edge),
> as well as a comment that will be useful to connect other devices to the
> EXTI.
>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> ---
>  hw/misc/stm32l4x5_exti.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/hw/misc/stm32l4x5_exti.c b/hw/misc/stm32l4x5_exti.c
> index eebefc6cd3..1817bbdad2 100644
> --- a/hw/misc/stm32l4x5_exti.c
> +++ b/hw/misc/stm32l4x5_exti.c
> @@ -106,6 +106,27 @@ static void stm32l4x5_exti_set_irq(void *opaque, int=
 irq, int level)
>          return;
>      }
>
> +    /* In case of a direct line interrupt */
> +    if (extract32(exti_romask[bank], irq, 1)) {
> +        if (level) {
> +            qemu_irq_raise(s->irq[oirq]);
> +        } else {
> +            qemu_irq_lower(s->irq[oirq]);
> +        }

You can say this more concisely as
           qemu_set_irq(s->irq[oirq], level);

> +        return;
> +    }
> +
> +    /*
> +     * In case of a configurable interrupt
> +     *
> +     * Note that while the real EXTI uses edge detection to tell
> +     * apart a line rising (the level changes from 0 to 1) and a line
> +     * staying high (the level was 1 and is set to 1), the current
> +     * implementation relies on the fact that this handler will only
> +     * be called when there's a level change. That means that the
> +     * devices creating a configurable interrupt (like STM32L4x5 GPIO)
> +     * have to set their IRQs only on a change.
> +     */

You cannot rely on this in QEMU's qemu_irq API. The set
function may be called multiple times with the same input
level value. If you need to detect rising edges then this
device needs to have a state field that records the current
value so it can compare the 'level' argument here against
what it was previously.

>      if (((1 << irq) & s->rtsr[bank]) && level) {
>          /* Rising Edge */
>          s->pr[bank] |=3D 1 << irq;
> @@ -116,7 +137,7 @@ static void stm32l4x5_exti_set_irq(void *opaque, int =
irq, int level)
>          qemu_irq_pulse(s->irq[oirq]);
>      }
>      /*
> -     * In the following situations :
> +     * In the following situations (for configurable interrupts) :
>       * - falling edge but rising trigger selected
>       * - rising edge but falling trigger selected
>       * - no trigger selected

thanks
-- PMM
