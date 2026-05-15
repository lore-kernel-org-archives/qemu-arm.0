Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A497CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:26:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtUm-0006kz-UN; Fri, 15 May 2026 10:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtUO-00063F-Qb
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:26:13 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtUM-00017T-W8
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:26:08 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-444826c16ffso7714687f8f.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778855165; cv=none;
 d=google.com; s=arc-20240605;
 b=ALL9wGHWZZgwVgvMxeXXp1spWquSwnn4oJH/wQCzStjirYvUXEYpUm6OSx1RVkz7V3
 N4RYV7SpLcjy7C9TQCVbNfhlHbESmGZhEn/utTgLQVnbDakip3MffmtMBbAWbuNWkm0P
 eMpuJmStMXQjZJpbCVoT+P7R6lZ428MyRQ+Ysmg7YqMsGYToMHi240uLExWOuSrxwihz
 SDC1dkUo5GFh9iU1mq/gQshbuSz4DifVdvsBudvUiQimAz+ywm5R8Dr7Seb/vNk3Fm+v
 Hy0lbqe//J1w55bJTDWGcECF7qK89JS8n966YcMS04Y1qvqNQ7W0eGyHEY3HvNVlJEAN
 6g8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=nXV6Znl7157zGgNN0CYzCLlN/eTh/tytW7d8DvhGN5I=;
 fh=sU/XrXMd6lJxqe4zuT4uPZjhStmhYcWOJCKsc07cpIw=;
 b=GjMSLrjvBIz+xL9BvWx0e4pojnPS4ddTHY/4WJJ/Cfde59JgTLuAtXIvy7qo9G9bco
 Oep6X9S1k64ol1Q5LyfcWbIanNkI+QoeRmlab9LixW9MM4mI45rI9O/Tun+vY0942s2r
 W1YlJ1AbBF6+NJ3UAWgGUpDeRLN/cmZHucuafgYDvemCDW7ZM3Q7W/aw6ZvM25rpqfw+
 iCshvZmwY4CONMxeJdyWsjsKntZ+n6D7J3Zy/CVh3eA0eEHpbtCfcu1ygKKLDDOP4ApB
 P/ixkUIOqqZfr3oexdzjAyI8I3QUFGdmrjzlgYuNk8OrZkRjEVzJpKkXJrisaE+/pjuw
 T0mA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855165; x=1779459965; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nXV6Znl7157zGgNN0CYzCLlN/eTh/tytW7d8DvhGN5I=;
 b=UcAozl520OfolxlX0eZ7Yjj6DSpzyezEIbbFab341Q/A2Wll9puNf8xQzL5bxc5F6w
 HlRlawVmzxhtJ26s4WBTVXXuG7ghXibFvZoW8zUj4yZ2HjHy7Uc0iGhuRPQUORLjv5w8
 8kN9UmugUW9WE9E4O1s6w8yTH5o2uQwBwr7rwWcRiNfoWweTALSCs0iaoElGKVPc4oSX
 992GntvDRD6COHPxjbCzDhNwwmOKebQgQ98h7hawDopWDW7B/AS4FkL8E5HrbluoMWqr
 EjqozqoqGzKbWf8ChWOFCje/8VlsNVIwWHEAHIenHxV70sZQNne0xqRfIXLz9ny2YGy4
 mM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855165; x=1779459965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nXV6Znl7157zGgNN0CYzCLlN/eTh/tytW7d8DvhGN5I=;
 b=QsXAaaPMGyjCz9nlshuTjnXiI/5wWPA0RrIj9qjLjlnAsVIdczK2Wr2rytgcK80hVC
 9UU+e+4dsFu4ZaG6iq4nI7/1s21dmlgFfdayOH19xrGZgY/L8warrUe6ALEiXXC3yojw
 dI6QrzIVf6VU7o1zWDY1bT/3UWxGn/QygFvT0yqdlEtuGbkm1BFcrKCvCKGdYERruhsg
 H1A1m5MybV6kLeq03A0uAeOsgLycBxAdu1nTtUQH8tYpmhSsZRZPCEcIGaUdpI3cgnyB
 5OPbfDDu3H2re391JxN01jjxnHw8/eWzaPsbF93NtwsAN5JvqfPqBCfo7p9+/YuWScqA
 r14w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Rj9QjLIKo34iPkOFAvqN+HFsoZWCd+LBRKWq4ZrCK/mr25niaViyXkBsoOvX5I8MbG32dv74R/A==@nongnu.org
X-Gm-Message-State: AOJu0YzwG9HN2/FBniD5GP1Ox+U+xBIjb/evAW0jp0VoYtMVQIq8iuqY
 6IHCml1T5xgNZUgiKjMZNJkNQTavamClbCHjIKPdV7bZykz4oT/fd7xdR1OR4lJJsl/hfw0YNLy
 wW695ZfnDvuJF6Dx+A1kKiK+FAhj0PyW/j3yNPJAb6A==
X-Gm-Gg: Acq92OFB6AhOR1NyXyhf+8XkiGztUruP7GLT1isg6XgEm2S7nl5vDUxJRjmuX8f6Y1v
 lpKney9PjgjfkZsmpaXu9J8ppfqdVNBiTXt9jQ76keS7VYfK6udvaqzpkqTiH6E5C4XIQeFf186
 O0tu8BJ8jvCT782vYaMD8iCZ/AkV9uK8Z1uO9p0EEwpIOmjijbvCK7hw3nLSThTDEgTjCyaL1oG
 PFcmKCidjd2PBG/4WR1aTuy2/tO/RdI9jOvIab7adYIBAd3flGSf39Ir9broXbkj2HYR2SiR342
 nYxEZIgw5ODMkSjcn6FQGUcO0nk+1au7ygKv7gJtOkp2cKuZ7w==
X-Received: by 2002:a05:6000:230d:b0:45d:b14b:2412 with SMTP id
 ffacd0b85a97d-45e5c362c56mr5896041f8f.6.1778855164656; Fri, 15 May 2026
 07:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-14-philmd@linaro.org>
In-Reply-To: <20260515141032.3271-14-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 17:25:37 +0300
X-Gm-Features: AVHnY4KmzFZ-weH9aeaGQUbDrNBtYyPZF1yBawjKpQhoOchSooiy1O8k0quz3xM
Message-ID: <CAAjaMXY3DDaLk591=7bWy5sMobokr00nbGCkYDxaazu=om96gw@mail.gmail.com>
Subject: Re: [PATCH v6 13/20] target/arm: Use make_ccsidr(LEGACY) in 32 bit
 'max' CPU type
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, May 15, 2026 at 5:12=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Commit 676624d757a ("target/arm/tcg: refine cache descriptions
> with a wrapper") added the make_ccsidr() helper. Use it. Besides
> being simpler to review, it also makes arm_max_initfn() more in
> line which aarch64_a57_initfn(), which it almost duplicates.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  target/arm/tcg/cpu32.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
> index 919ed8a6cf8..cf643ce43b1 100644
> --- a/target/arm/tcg/cpu32.c
> +++ b/target/arm/tcg/cpu32.c
> @@ -9,6 +9,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "cpu.h"
>  #include "accel/tcg/cpu-ops.h"
>  #include "internals.h"
> @@ -756,9 +757,12 @@ static void arm_max_initfn(Object *obj)
>      SET_IDREG(isar, ID_ISAR6, 0);
>      cpu->isar.reset_pmcr_el0 =3D 0x41013000;
>      SET_IDREG(isar, CLIDR, 0x0a200023);
> -    cpu->ccsidr[0] =3D 0x701fe00a; /* 32KB L1 dcache */
> -    cpu->ccsidr[1] =3D 0x201fe012; /* 48KB L1 icache */
> -    cpu->ccsidr[2] =3D 0x70ffe07a; /* 2048KB L2 cache */
> +    /* 32KB L1 dcache */
> +    cpu->ccsidr[0] =3D make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB=
, 7);
> +    /* 48KB L1 icache */
> +    cpu->ccsidr[1] =3D make_ccsidr(CCSIDR_FORMAT_LEGACY, 3, 64, 48 * KiB=
, 2);
> +    /* 2048KB L2 cache */
> +    cpu->ccsidr[2] =3D make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 2 * MiB=
, 7);
>      define_cortex_a72_a57_a53_cp_reginfo(cpu);
>
>      aa32_max_features(cpu);
> --
> 2.53.0
>

