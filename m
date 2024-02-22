Received: by 2002:a17:906:2b0e:b0:a3f:52bd:c6f4 with SMTP id a14csp8737ejg;
        Thu, 22 Feb 2024 07:09:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWX6w319xhwmpzB9lRUEG238PA3xAK+87vkB2GymuHkTL5446KpkG1SwmFkSGJJqEG9ATz3l/LsoHafwGjC5dwxcX3KEDag
X-Google-Smtp-Source: AGHT+IEXN4QXTqUpaAgcLbYTggmdTkLY/NyUGVLRPWqTwnzNbH4p/w65nkxPlZ+PhwrnD/9fGum2
X-Received: by 2002:a05:620a:1924:b0:787:a5fe:9d82 with SMTP id bj36-20020a05620a192400b00787a5fe9d82mr1573142qkb.17.1708614591748;
        Thu, 22 Feb 2024 07:09:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708614591; cv=none;
        d=google.com; s=arc-20160816;
        b=OEjX8J3NvI3eB517fRI6bvYF9VvWWB/hWRgcehK90DubPEOhAWEvJEb2vi7l6Icpse
         4ob2zeu8EmUQELR8NB4cOtWOAL8sjhv037n+VJ0vqPH6nOQgE74A+EvmkM24ZS7/H6TJ
         j7PePJNX0/AEkSvF+6YV1lj1fINC/dXYJw8Jmj2mHZEUYa3AXiCX+jKDiQDmvXY5ViaJ
         ngroJu9GkQOrpWjru1212xEHRiQU4UFNuJKNcy0Qc37t84gkasZyM0rA6g5bAhACzYnJ
         sUz4+lkWSXvGCeMepnWJj8ai7Yz0GbkHRCRbGKshPhL4cxAPKz/axJdig/Gvma5eZLID
         6nZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1f7PihdvzC749X3ukZxJaCxCkQyD49sC6eocxx1JwJ0=;
        fh=+9Xp0FTLcllKhas2i7XX4QxXtOlM+QfhEineAq5tBs0=;
        b=FHaaOfU/FyoLEzBQZiCncN11YPUqOFZk/i69axcjz7m/ZZABOlONzzu9e/5ZzNUO6s
         gWPZ6Pz3DkIRmhGzLon3xUtSAjS5EAoo1LqSI6+4iYkeCtx4ZJI2y6U7tt9Se38QJcAW
         ck1TQvWCyB9amvSxPcng8K3QnqWpUlGX+Dw8Xyt9+7XAVOne1TJFnuoAzxgXXkN2ED/+
         HEZfZT2srXq2mkB5/FRUCLt069SfbSTR5JxZwLaGlv9U9pRKAawtTpXUBB20ISGbgx2Y
         OukNpXBthYiL4b0z1hDi+ZcxKzjlsdOUR5UlODRFYPM4LJlCONlzTe6FJDttm7MnhKuv
         ZBHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yldMRkQD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17-20020a05620a103100b007876a589548si8291050qkk.321.2024.02.22.07.09.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 07:09:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yldMRkQD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdAhV-0003cK-Ga; Thu, 22 Feb 2024 10:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdAhU-0003bl-0Y
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 10:09:28 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdAhS-00053U-1N
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 10:09:27 -0500
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5129e5b8cecso7427241e87.3
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 07:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708614563; x=1709219363; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1f7PihdvzC749X3ukZxJaCxCkQyD49sC6eocxx1JwJ0=;
 b=yldMRkQDjnFfImGiRTkRK/YSrNmRRaLSh+B3yzUy9Cqgdz4bJY2X30RqcLkYFh/HCd
 1jNj6+x7d5BrOZjTRBvCriExs5TJhCWAY5ktzl9P8CggW2WiwcwXm+IxTcJ0R2fZYYiG
 wyUoKZxSmMiHrwkTPEJyNeOiHo6w4bmhQRnmiL+7zxKyAzwTvohD2/RxD29rtU92nmox
 TXDjRbhi9hfw3d/06nLgcaVOkuNuQzmVu/8Y0GmGEXDFQGi5cj+iSN9wyfwoJqGcWou0
 cKlLrJ+gMHRUJoMw3YeqV6ivsTCIAC04Z6VrxriWZFTcl8sCb8CSfBn1DFfD+xzh34sC
 lz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708614563; x=1709219363;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1f7PihdvzC749X3ukZxJaCxCkQyD49sC6eocxx1JwJ0=;
 b=Cb8ht40KQ4F1TW9eipi8YRE8mwIhTlyMJN7nPUrcZWoImWzywQ0oZakSy+XsRgJm+T
 TWJNq4NUqHfasWC9qyyv33QxGZIN23MIIkptP0uyQDYVGiKQXBrsDpXV57P8trR2941y
 btUOBk1dIMiH6lJcoDnIxw5TmmAYPB0Tz1HyS5QAqM+vEbXJF0EAQ5vBK9qnxNP7RNtE
 alf4yOz+Cv1b9ZvqNXRS5WBrZy8+kcfpNQTwibX2AkZiotabCoeIuecOZS081MKfViJ7
 cZuRncQzkOhRH1w5fYUHQfnWLL8D1ORhNkoDkytb0SczWVLeKxjV7Hpag+osz5KPTMq4
 U/ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOkhpRhFc2icF9/rebfesAuXyU4AmvBdNbfXhdScmslizD5HHJdVYayzW6URwYPQIHcD5mJV4l4xVfgCX6RgQ/FWPh
X-Gm-Message-State: AOJu0YxMaMW+s5AZAfungILDr080/RsEFm4w3emfJA85eZ2u4fJbsfI0
 gZ7Nu+wR1asl1hzkVMgeXX7VZKA4+psvBCxp3VKwm/b4oL2f71YdtEURiktYBl+zdFjB2GgG/w7
 +VBQZm8xJ9ZlWJhes/SmTZ2wdXAfBTeYqEputEkvwa7nz174i
X-Received: by 2002:ac2:46c3:0:b0:512:c363:fda1 with SMTP id
 p3-20020ac246c3000000b00512c363fda1mr5376105lfo.12.1708614563184; Thu, 22 Feb
 2024 07:09:23 -0800 (PST)
MIME-Version: 1.0
References: <20240220184145.106107-1-ines.varhol@telecom-paris.fr>
 <20240220184145.106107-3-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240220184145.106107-3-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2024 15:09:11 +0000
Message-ID: <CAFEAcA-Vq+r2ivjttHMhZyyFBcPpNst2CQNQN9TRbCZ9WfiSAQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] tests/qtest: Check that EXTI fan-in irqs are
 correctly connected
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MiZjv0kN7k/Y

On Tue, 20 Feb 2024 at 18:41, In=C3=A8s Varhol <ines.varhol@telecom-paris.f=
r> wrote:
>
> This commit adds a QTest that verifies each input line of a specific
> EXTI OR gate can influence the output line.
>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>
> Hello,
>
> I expected this test to fail after switching the two patch commits,
> but it didn't.
> I'm mentionning it in case it reveals a problem with the test I didn't no=
tice.

The specific thing that goes wrong if you don't have the OR
gate handling is that the NVIC input will see every up
and down transition from each input separately. (This happens
because a GPIO/irq 'input' in QEMU is basically a function,
and wiring up an 'output' to an 'input' is setting "this
is the function pointer you should call when the output
changes". Nothing syntactically stops you passing the
same function pointer to multiple outputs.)

So if you have for instance
 raise A; raise B; drop B; drop A
where A and B are ORed together into an NVIC input,
the NVIC input is supposed to see the line go high
at "raise A" and only drop at the last "drop B". Without
the OR gate, it will see it go high at "raise A", and then
drop at "drop B". (Well, it sees "level is 1", "level is 1",
"level is 0", "level is 0", but inputs expect to sometimes see
calls for "level happens to be the same thing it was
previously", so it doesn't cause the NVIC to change state.)

Your test case doesn't as far as I can see check this situation,
because it's (a) testing every input in order, not checking
what happens when multiple inputs are raised and lowered
in overlapping ways and (b) using rising-edge interrupts.
So that's why it doesn't fail even without the bug fix in
the previous patch.

>  #define EXTI0_IRQ 6
>  #define EXTI1_IRQ 7
> +#define EXTI5_9_IRQ 23
>  #define EXTI35_IRQ 1
>
>  static void enable_nvic_irq(unsigned int n)
> @@ -499,6 +500,40 @@ static void test_interrupt(void)
>      g_assert_false(check_nvic_pending(EXTI1_IRQ));
>  }
>
> +static void test_orred_interrupts(void)
> +{
> +    /*
> +     * For lines EXTI5..9 (fanned-in to NVIC irq 23),
> +     * test that raising the line pends interrupt
> +     * 23 in NVIC.
> +     */
> +    enable_nvic_irq(EXTI5_9_IRQ);
> +    /* Check that there are no interrupts already pending in PR */
> +    g_assert_cmpuint(exti_readl(EXTI_PR1), =3D=3D, 0x00000000);
> +    /* Check that this specific interrupt isn't pending in NVIC */
> +    g_assert_false(check_nvic_pending(EXTI5_9_IRQ));
> +
> +    /* Enable interrupt lines EXTI[5..9] */
> +    exti_writel(EXTI_IMR1, (0x1F << 5));
> +
> +    /* Configure interrupt on rising edge */
> +    exti_writel(EXTI_RTSR1, (0x1F << 5));
> +
> +    /* Raise GPIO line i, check that the interrupt is pending */
> +    for (unsigned i =3D 5; i < 10; i++) {
> +        exti_set_irq(i, 1);
> +        g_assert_cmpuint(exti_readl(EXTI_PR1), =3D=3D, 1 << i);
> +        g_assert_true(check_nvic_pending(EXTI5_9_IRQ));
> +
> +        exti_writel(EXTI_PR1, 1 << i);
> +        g_assert_cmpuint(exti_readl(EXTI_PR1), =3D=3D, 0x00000000);
> +        g_assert_true(check_nvic_pending(EXTI5_9_IRQ));
> +
> +        unpend_nvic_irq(EXTI5_9_IRQ);
> +        g_assert_false(check_nvic_pending(EXTI5_9_IRQ));
> +    }
> +}
> +
>  int main(int argc, char **argv)
>  {
>      int ret;
> @@ -515,6 +550,8 @@ int main(int argc, char **argv)
>      qtest_add_func("stm32l4x5/exti/masked_interrupt", test_masked_interr=
upt);
>      qtest_add_func("stm32l4x5/exti/interrupt", test_interrupt);
>      qtest_add_func("stm32l4x5/exti/test_edge_selector", test_edge_select=
or);
> +    qtest_add_func("stm32l4x5/exti/test_orred_interrupts",
> +                   test_orred_interrupts);
>
>      qtest_start("-machine b-l475e-iot01a");
>      ret =3D g_test_run();
> --
> 2.43.2

thanks
-- PMM
