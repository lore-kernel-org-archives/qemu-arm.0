Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18388F4487A
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBD4z-0007CH-Da; Fri, 10 Apr 2026 10:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wBD4w-0007Ba-Tg
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 10:43:26 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wBD4t-0004II-8X
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 10:43:26 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-64937edbc9eso2035539d50.2
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 07:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775832201; cv=none;
 d=google.com; s=arc-20240605;
 b=eggxkHQVIppXKuPpb89gVy4fXEecrP+7/lORcHHw27iJQG11HEb0ZB/LfGa5BujG0/
 nfGdBprZzd/D4rA8PY8Gl4nHgZRy/LR7FwumSq9zA+BIAoJGYjSd2s258zqG1xHUAB4a
 KQCVV+iM0spTrlc9plbkFDrXZLLoeFktd/2KKYN9KVI8TATnAmH+oxEIUpQszdZfPLOW
 bj21Ocq/a5SwKQyaot0tzvMH8n3jvl3IBlXVozw4TSbbaKAdg7R/GdW6yIMLoVPVQENL
 z818+LRs1v0qZyW0yJiJ4b62IcZeIr+P0h1S5O10/PazpE7c25rKApX/gKsd4iUuN/jh
 Lvcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1lYn9/D8W00oC8+/a14SI6vwo6i/F1q7KTJzua+AgWo=;
 fh=FntNwxlMg8KaZ8wsa0P7S4DvqDaudfFvGddGgYfJ2bw=;
 b=GDbUfzwUfT23sUvKA8pr2AN9hNdvLlJCP6o6v8W1dH1jRTUDiYkmes0ezc9EGh0N/9
 1cEPJy28aQro+tqn4Iwl4693oAZRAD4DQNH2+BUmUjT/zfJ9nlDB4xBcoIBgr9tJCnSP
 o7xhRXmQlOCiFYWuuZwfrWOJDyWAktLiNK5chLpj8b+i4dP3YDtmbEHbXOvZVA3Zyn4M
 nDdUolGnCpm/3QrXJ/CoJH6Mm2bOx+QJvb9UbyxkIZoADn+mi1nBN/UPtbzvlOUr3sww
 wdfDDkN11ZPTdRpnHDQ3APXd+abhcta2jRK/SVEE4GGlPiAx8R2XXRwQWN0XUfz/6KS7
 J74g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775832201; x=1776437001; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1lYn9/D8W00oC8+/a14SI6vwo6i/F1q7KTJzua+AgWo=;
 b=MfWjKPiQnxRtOftWf9mDEnsWdhfHHhwlwszcsS7sztVjAh2vboualqQJXmUW5/DWGP
 UGTWsdh/tovC5LmbGATQlLJyhDqBLOKCac1F46OGJ73N0yqc/9hUCRmUPmvljrFrE0g+
 P1QWDgMUZJ5xAKQN6/cQTC1LqSCg+jE3aPFTwRIZOdDPkLQGEashJEES/q37OwoR+d+0
 3P3LLaWuik3JlJZurWFklnTC4EQNuKQBGGXsjopkSwV8clBMXB3xPQ+6CLBxASh++BsK
 4G8kI4LXSQRIZ3grqFRumcHEhid/XG6QNjt/6yC/70yOm9QJxoqk+C7TQA7GmBTDevcG
 jw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775832201; x=1776437001;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1lYn9/D8W00oC8+/a14SI6vwo6i/F1q7KTJzua+AgWo=;
 b=KDRaI3frTK41L1Atc+kjwaPGywiAmjKxQOlhLAql7RWAKif71Y0s0cvU+57JP/xauA
 i9HbiSZyn3s0XMMIf7BLJPXOfK+B4JkZh1qJcSM1B7V4lkQEWrGWtH/RoOJ3fJ28BUqY
 yVZBUYJGSSuS6dlVSibC8/6xyW96ttxnN0v8zRYA5tR2boFpNPxIgd4UIAi93vLksG+/
 WYsz4aPfzuIquYnksJtFs5MgXqVogjiHg08OJr4T9A/NyiIUqj0A5WDOqrMDRq+9dddz
 +FpFEgHgZgOFpjcRrVHCwqb1cGmGRzOcRuWmDxYmyZ4/LZJFOaOxH5fYaSkNINRCz6rM
 kgDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2UnDjdA/r+VPsSCLTTCGD6Pyssd0PLJJO9E5i9BHvZfEEum03K4tUwHChCnbwiB6siyVUX4c+kg==@nongnu.org
X-Gm-Message-State: AOJu0Yxc8YfqMs9SJzhCcdcWvdhdCTfMClnPzanmgSqFHA6eytM6yC6e
 OK9zkWl/2AdJtWa7Xwf3iJ3XhIK7HZXFQQ7aSyroqFh2mGx93kaUt9SoQOcqNlR02N3TPvM/i+t
 dLIv67dL3GSOBOwGAN9QtrQ+sD9EjuYbfWzrjXYkgFw==
X-Gm-Gg: AeBDiet/IQwi8fIBba0wQYI+uUcElB6kUFyprjeVj66YnJjiB2nhsDgZBwleN1C2veT
 H0v2lT1iamqcAVbn2USiuOk3C7gD8SwKmdHcTQsLMv2Jh9mtzFWu3Wo3CxGKHUXcOdtvymX01o+
 dvU4ohpuPPx8c5ChGnLEdObGaaxy5//cq58S31+6mAg38H3Fx6QX0Qyk84hBpc7fGnetpE3R0Ji
 z3kYk0sOylDL0DqiI+ZYD873Afd6we5JGP3GBgueyP6tLuzFxuUruTZRE3wsJFt4AsllmuCT4q+
 JJG0hPJT++6cx01WNfZ1xyiTZ6EsqJevyEkbiM05I3PsKhPRUlpKjXb0nVsHV2sL0H8=
X-Received: by 2002:a53:c5c5:0:b0:64e:e084:fa84 with SMTP id
 956f58d0204a3-65198c02445mr2615577d50.68.1775832201078; Fri, 10 Apr 2026
 07:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260410142932.33089-1-philmd@linaro.org>
In-Reply-To: <20260410142932.33089-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Apr 2026 15:43:09 +0100
X-Gm-Features: AQROBzAiPlsnAS_uYhvsT6iLTPgXy9obanNPGOWoWt4jCoytRqKoX7q7ZmkiVXY
Message-ID: <CAFEAcA_=DjrPvYXyPJ-mBRtsSaKhdC6NYABcvz9R271V2cvznw@mail.gmail.com>
Subject: Re: [PATCH-for-11.1 v4] target/arm: Use vaddr type in
 handle_psci_call()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 10 Apr 2026 at 15:29, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Use 'vaddr' type for @entry, which is the start %pc for the
> on-lining vCPU. This allows to remove an unnecessary target_ulong
> in hvf_handle_psci_call().
>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/hvf/hvf.c  | 2 +-
>  target/arm/tcg/psci.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 5fc8f6bbbd9..124644918ef 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1418,7 +1418,7 @@ static bool hvf_handle_psci_call(CPUState *cpu, int=
 *excp_ret)
>      bool target_aarch64 =3D true;
>      CPUState *target_cpu_state;
>      ARMCPU *target_cpu;
> -    target_ulong entry;
> +    vaddr entry;
>      int target_el =3D 1;
>      int32_t ret =3D 0;
>
> diff --git a/target/arm/tcg/psci.c b/target/arm/tcg/psci.c
> index 56754bde951..5df17bd059d 100644
> --- a/target/arm/tcg/psci.c
> +++ b/target/arm/tcg/psci.c
> @@ -68,7 +68,7 @@ void arm_handle_psci_call(ARMCPU *cpu)
>      CPUARMState *env =3D &cpu->env;
>      uint64_t param[4];
>      uint64_t context_id, mpidr;
> -    uint64_t entry;
> +    vaddr entry;
>      int32_t ret =3D 0;
>      int i;

So we take our argument which is a uint64_t in param[], and we
put it into a vaddr entry, and then the only thing we do with that
is pass it to arm_set_cpu_on() which takes a uint64_t... I'm not
sure what the vaddr type is getting us here.

Should we just do in hvf.c the same thing we did already for
tcg/psci.c in 3580aa03547f92, and make 'entry' a uint64_t ?

-- PMM

