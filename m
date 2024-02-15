Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp562648ejb;
        Thu, 15 Feb 2024 05:24:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXodWQ1xs9KQUNaeFA7wfWKCprvU0DnJulRPDbRQN7y/K54J+ktknvA7eaSX5bm3+NkfymrL/lG4n3p7lkgXaa2vA2QSRxO
X-Google-Smtp-Source: AGHT+IGW8tCLnwN0ck81jLjOGLVbhD/MYff2CE8XW75kBmsce4X61O7WafHrNdk7WK3d9qjiaqbc
X-Received: by 2002:ac8:58c2:0:b0:42d:d6fd:2098 with SMTP id u2-20020ac858c2000000b0042dd6fd2098mr552682qta.29.1708003497199;
        Thu, 15 Feb 2024 05:24:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708003497; cv=none;
        d=google.com; s=arc-20160816;
        b=tiG8+qKZVdpwLciToZfrq9VJKJwxZTpasag5f6uALnISg84ll1K9pMc5i7oq58sfto
         0cwCBsLxSYT4V5PLhn/Jo+cN0D0TFAmC8GKs6LdMoUKGtyT7x6R9NOdF+GuKfxNs9ye0
         srkLDROqG/jfla5lp6OSK71+rupe6d/lMw1iSsfXZM7zZ3XfFOhO03ELfEyFJYT+iY0B
         Jc629EyBN8GmJC5jupEx7fx2uextO8By30sZqJ07rQ975fiTniC7yeBYOm6Z+o7yPNpu
         Qs+t5hAd+BGaPEhezDObm8CwaCZL3IPNL+pTVpl1NuAJAXyIK7+toGxurpqhjuyILt6X
         ZDpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=eo15mQOCWxw3FDPEMrCix6nFWDGHzbcg9XZ5sByHmO0=;
        fh=bXKvTF3q/TCAvUl0jDO/KUPqGToxUZKFXyB2s07Zgpw=;
        b=GRNUOMnhPewhSZDIzjPyxrDIq2Ao1YlH+kB3VttBdBw/vfR+qkkciH/LN9WcYv+4Lu
         7Z9T0wrXagwLm7GQVCBdVrhIHY8KILYN823rFwbA+wDCmk6QabbdRJoXfEHBKcyIXbDB
         WT+mOx9q1R4smnoIbnmfmPUXBaOcI4I8O9xL2MlNT5g+oomSTBZ4Kd1cDbvux4vqPq0k
         hjQmwH8Y+aqvws2/IB3l4FL4owSK4BSFhP9Ch4Y2zCi4yjSMszlhmvR60YRKrjg8TKpP
         1Rp8RTZwMsRlXLyjsQfBLxHvRb2tRVPwciatSklvU9yly9RH1hii19B/WpssNCG5nJHt
         8eeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o1CcusUj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10-20020ac85cca000000b0042da7c297b9si1416802qta.663.2024.02.15.05.24.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 05:24:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o1CcusUj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rabjJ-0001CP-9z; Thu, 15 Feb 2024 08:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rabjG-0001Bu-ST
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 08:24:42 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rabjF-0003w1-7T
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 08:24:42 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-55ad2a47b7aso1202492a12.3
 for <qemu-devel@nongnu.org>; Thu, 15 Feb 2024 05:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708003478; x=1708608278; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eo15mQOCWxw3FDPEMrCix6nFWDGHzbcg9XZ5sByHmO0=;
 b=o1CcusUjmpAoJ3BF/8/FNWC10zyZuUpEtgMKiRCgnLNooMS8W+VPVu2RyIkLOvCEQz
 vTjtBaiUQFTQ0WGIr4ajN12vxQWfk7PdxhN78av6YtIdDVydnMGglfT3Cj/m+15q2Wo+
 cK2WHFbeqkMQiHg2OsTEiRHxg9gSxh4WiCAlpD3lhxQp7FGgK9EgiLdvv7MypcEi17gF
 17XdmWIEBpTpDld979NT07GKhikuwqZ+9eXBFuS2q1KPtZBbUWgKbizkY7E1IYrebaSO
 BFgUsXOJjCDWXX0xQE0m8PfFmbuA5cgUn5pvFTnGwqZS2q/hk0mw2zD+tHpuPheafXBt
 mIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708003478; x=1708608278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eo15mQOCWxw3FDPEMrCix6nFWDGHzbcg9XZ5sByHmO0=;
 b=iUQkXxOWphV37s3aOycRA20Do+8kxZYVV8gzdfGalBqU29vtt8ZIyr9G6imVsSLkKk
 jOADgBsuWNCxej4EFnOokApBmqszM3DYCW1vwp4dFfu/n/14EdypX2LKyguCNayi9B44
 75Y5M17dNe3Ci7BFi1BnsX/oiG78VT8aSLcCX0XsAx11euE+INQRqjX1PHaEn2aBXFta
 uGNXbTzSoNmCRz/kRotSahqkrB69YGWx09idP/OHdeUu2K3cJYhmNNb6Y60ieFCfU0Is
 LNZPb8JQxbw1zjLsrF4SXNjN+FJg8pDOYmyWCUyArweTlUbuaN0gTg7hSfP+VIgL0X3i
 uD/w==
X-Gm-Message-State: AOJu0Yx6t58tom1Q2cXTWyfVsUHcnNUrMm3p+eusrMUtMN4oRyXppZqc
 4mVzyWJYhBByS157d9RIRc6jySjuGKC/923qGkUY5dlA++Z7cUch4VFekkwqTnbK1liUymz0SSV
 cKDfzj/IyQjvB6FvyosUysm17m9671M06rRrG9g==
X-Received: by 2002:aa7:c49a:0:b0:561:ec1a:95d1 with SMTP id
 m26-20020aa7c49a000000b00561ec1a95d1mr1357166edq.37.1708003478514; Thu, 15
 Feb 2024 05:24:38 -0800 (PST)
MIME-Version: 1.0
References: <20240212163446.227802-1-ines.varhol@telecom-paris.fr>
 <20240212163446.227802-3-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240212163446.227802-3-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Feb 2024 13:24:27 +0000
Message-ID: <CAFEAcA_A0cYRTTP2N6Q=jddNN7JvA4NgTtvh0eMFxA92NFiBKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests/qtest: Check that EXTI fan-in irqs are
 correctly connected
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kpBTBEL26SGF

On Mon, 12 Feb 2024 at 16:34, In=C3=A8s Varhol <ines.varhol@telecom-paris.f=
r> wrote:
>
> This commit adds a QTest that verifies each input line of a specific
> EXTI OR gate can influence the output line.
>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> ---
>  tests/qtest/stm32l4x5_exti-test.c | 97 +++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>
> diff --git a/tests/qtest/stm32l4x5_exti-test.c b/tests/qtest/stm32l4x5_ex=
ti-test.c
> index c390077713..276b7adc7a 100644
> --- a/tests/qtest/stm32l4x5_exti-test.c
> +++ b/tests/qtest/stm32l4x5_exti-test.c
> @@ -31,6 +31,11 @@
>
>  #define EXTI0_IRQ 6
>  #define EXTI1_IRQ 7
> +#define EXTI5_IRQ 23
> +#define EXTI6_IRQ 23
> +#define EXTI7_IRQ 23
> +#define EXTI8_IRQ 23
> +#define EXTI9_IRQ 23
>  #define EXTI35_IRQ 1
>
>  static void enable_nvic_irq(unsigned int n)
> @@ -499,6 +504,96 @@ static void test_interrupt(void)
>      g_assert_false(check_nvic_pending(EXTI1_IRQ));
>  }
>
> +static void test_orred_interrupts(void)
> +{
> +    /*
> +     * For lines EXTI5..9 (fanned-in to NVIC irq 23),
> +     * test that rising the line pends interrupt

"raising"

> +     * 23 in NVIC.
> +     */

I feel like you could probably write this code to use a loop
to avoid some of the repetition, but this is only test code,
so it's fine as-is.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
