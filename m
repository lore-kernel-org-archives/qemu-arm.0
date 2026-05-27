Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A67CD5BD0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 13:33:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSEOG-0005yj-3a; Wed, 27 May 2026 09:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSEOE-0005yV-LZ
 for qemu-arm@nongnu.org; Wed, 27 May 2026 09:33:42 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSEOC-0002aM-WB
 for qemu-arm@nongnu.org; Wed, 27 May 2026 09:33:42 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-44a5174670eso6548049f8f.1
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 06:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779888819; x=1780493619; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gB8BM9o205SK4nZQZ8Fne9PayL3l3YRAC9i9Pf8IgZ8=;
 b=fLMyTdzjs3FHQzPDNT3Iwm0O6e8wdioMCGhs9VdroRtRndUZKvC5pm1guGjS6DIZRx
 wFurN5a3/aJF0qq4+yc4e7QX9QVF3t2E5yfDzR7apoREVPqLGsCW4EVkNb3OzkMVPtwH
 pKrzjKFw2cU82/2YZR5bUZhbHCC1hAnxj6K+GY9HPFMv/qQU8zB6EtKi+oZF7c0+Dsgw
 /qMzhaA7QtfuDaxf7hze3pLIep/fR1oR/eyILJXHz5kz0mNz8R67RPFQNoQ9vScBTiPv
 wG7ijLFLUM16PmT9FDJJN1uZGlhMDuwMOv65SkDwpr8R7aRnS/brm/M315444PYl0a7a
 ReQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779888819; x=1780493619;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gB8BM9o205SK4nZQZ8Fne9PayL3l3YRAC9i9Pf8IgZ8=;
 b=jFr9KpFtfhIXZp/AXLGXHtN8eRhuaY+XJkZg4r3t7VHG8jN4jS96DMi+gatMWVPote
 935aujvNYu5eHXbrRUmmU8+HRzvZpU4bJAa9NXVaMsRrOb5GO90+VrmJywKou2zxhOH8
 xgsB7oj/57BpYQJpM9/SYZg0qJQQa2oWTWYQ9VmLA7xTOBR8NrbG0p9ydt7hYFkSWFRu
 tiDALjVInJS+WFCisBG26TuYfaD6f4aNFdurV90n391k3DI/AW4N/rE36vad4r/cHCzP
 dXjEggjFp/wTQLYWXpi1p/ghzczFVNGblPjeFvk4H6eFnh2Q4IALSye1h1fWY6XfQ47u
 Tayw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/XNEEp7uHDv2cmufl/UViTZ/q21juZ80sxdLpz+5wuAJfa9aRcELMoM8szZWu8wG+6Y6iRvp4WvA==@nongnu.org
X-Gm-Message-State: AOJu0Yzuch2rlkAsWJNqx84IXE8SfqC61aD0VKzXZ4qJ7Yoyk48PJJf4
 by6zaSGJ7EflnibJUjWpy2QV6lqVTmlxS638enMLP7Q8DRkYCALlIF3ejybSyw7s6ww=
X-Gm-Gg: Acq92OG852Rc6rkbjfYJZEiTlBF4QLaJ+YAlnP0kRx0l1yB+2iMduOL7WfYAkHpfya8
 ijcbQFOHa8DgTbPbR7hmEQP8Atf98uxJtNNY3DjwdwbeTKGX4CcDMtJK4Fno5V5kG2XfRTsHORV
 sUCg6IMZiLIKmDVXxk+bTayKtoUUMX3pNNMJpR3Lqni9OyYRjURq5TTYuMEbt9FFcW6LjswCIbq
 f6e+JxyqJlWnglrcGxLjIKB0Fq2xe04ork2bWP+OSWbqqgscWk+JrVXCZgJGfiwo+tfv+2rVy0d
 ifvUa/XhL8dmauN3/l5Y2Uwuaju9O9lc7kCxWl2J/VfVLcVj3cwasWEtucZOYeO2pJlY7mdwZYH
 4T2PHOsNCA0pJjKG9Eu6gVGE2mmf9LbSB77RnJ1IKdo//y1y++C6n1+FteR9FyuhFPbiuTf3mfe
 c+RjBT/Uv88wbLP4vV35Ff4nlRvjEpKezhWA==
X-Received: by 2002:a05:6000:2007:b0:44a:247e:67b4 with SMTP id
 ffacd0b85a97d-45eb3689031mr38653570f8f.18.1779888812608; 
 Wed, 27 May 2026 06:33:32 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb5c44e4sm5918860f8f.36.2026.05.27.06.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 06:33:31 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D64145F7F0;
 Wed, 27 May 2026 14:33:30 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Torbj=C3=B6rn?= SVENSSON <torbjorn.svensson@foss.st.com>
Cc: <qemu-devel@nongnu.org>,  Peter Maydell <peter.maydell@linaro.org>,
 <qemu-arm@nongnu.org>
Subject: Re: [PATCH 2/3] target/arm/tcg: add PAC related instructions
In-Reply-To: <20260518-pr-pacbti-v1-2-8932a885b03d@foss.st.com>
 (=?utf-8?Q?=22Torbj=C3=B6rn?=
 SVENSSON"'s message of "Mon, 18 May 2026 18:14:00 +0200")
References: <20260518-pr-pacbti-v1-0-8932a885b03d@foss.st.com>
 <20260518-pr-pacbti-v1-2-8932a885b03d@foss.st.com>
User-Agent: mu4e 1.14.1; emacs 30.1
Date: Wed, 27 May 2026 14:33:30 +0100
Message-ID: <87bje1x9hx.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

Torbj=C3=B6rn SVENSSON <torbjorn.svensson@foss.st.com> writes:

> This commit adds the pointer authentication instructions from the Arm
> v8.1-m PACBTI extension.
> While the instructions are properly recognized, they are all NOPs.
>
> Signed-off-by: Torbj=C3=B6rn SVENSSON <torbjorn.svensson@foss.st.com>
> ---
>  target/arm/tcg/t32.decode  | 21 +++++++++++++---
>  target/arm/tcg/translate.c | 62 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 80 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/tcg/t32.decode b/target/arm/tcg/t32.decode
> index 49b8d0037e..a885eed101 100644
> --- a/target/arm/tcg/t32.decode
> +++ b/target/arm/tcg/t32.decode
> @@ -263,6 +263,7 @@ BFCI             1111 0011 011 0 .... 0 ... .... ..0.=
....     @bfi
>  @s0_rnadm        .... .... .... rn:4 ra:4 rd:4 .... rm:4      &s_rrrr s=
=3D0
>  @s0_rn0dm        .... .... .... rn:4 .... rd:4 .... rm:4      &s_rrrr ra=
=3D0 s=3D0
>  @rnadm           .... .... .... rn:4 ra:4 rd:4 .... rm:4      &rrrr
> +@rna0m           .... .... .... rn:4 ra:4 .... .... rm:4      &rrrr rd=
=3D0
>  @rn0dm           .... .... .... rn:4 .... rd:4 .... rm:4      &rrrr ra=
=3D0
>  @rndm            .... .... .... rn:4 .... rd:4 .... rm:4      &rrr
>  @rdm             .... .... .... .... .... rd:4 .... rm:4      &rr
> @@ -319,9 +320,18 @@ SMLALDX          1111 1011 1100 .... .... .... 1101 =
....      @rnadm
>  SMLSLD           1111 1011 1101 .... .... .... 1100 ....      @rnadm
>  SMLSLDX          1111 1011 1101 .... .... .... 1101 ....      @rnadm
>=20=20
> -SMMLA            1111 1011 0101 .... .... .... 0000 ....      @rnadm
> -SMMLAR           1111 1011 0101 .... .... .... 0001 ....      @rnadm
> -SMMLS            1111 1011 0110 .... .... .... 0000 ....      @rnadm
> +{
> +  AUTG           1111 1011 0101 .... .... 1111 0000 ....      @rna0m
> +  SMMLA          1111 1011 0101 .... .... .... 0000 ....      @rnadm
> +}
> +{
> +  BXAUT          1111 1011 0101 .... .... 1111 0001 ....      @rna0m
> +  SMMLAR         1111 1011 0101 .... .... .... 0001 ....      @rnadm
> +}
> +{
> +  PACG           1111 1011 0110 .... 1111 .... 0000 ....      @rndm
> +  SMMLS          1111 1011 0110 .... .... .... 0000 ....      @rnadm
> +}
>  SMMLSR           1111 1011 0110 .... .... .... 0001 ....      @rnadm
>=20=20
>  SDIV             1111 1011 1001 .... 1111 .... 1111 ....      @rndm
> @@ -375,6 +385,11 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 =
....      @rdm
>          # SEVL   1111 0011 1010 1111 1000 0000 0000 0101
>=20=20
>          ESB      1111 0011 1010 1111 1000 0000 0001 0000
> +
> +        # v8.1-m PACBTI extention
> +        AUT      1111 0011 1010 1111 1000 0000 0010 1101
> +        PAC      1111 0011 1010 1111 1000 0000 0001 1101
> +        PACBTI   1111 0011 1010 1111 1000 0000 0000 1101
>        ]
>=20=20
>        # The canonical nop ends in 0000 0000, but the whole rest
> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> index c744b16345..ae1351ef03 100644
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -5012,6 +5012,68 @@ static bool trans_SMMLSR(DisasContext *s, arg_rrrr=
 *a)
>      return op_smmla(s, a, true, true);
>  }
>=20=20
> +static bool trans_PAC(DisasContext *s, arg_empty *a)
> +{
> +    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
> +        return false;
> +    }

These are the wrong feature tests. I would bring the
isar_feature_aa32_m_pacbti from 3/3 into this patch and invert the logic
in the same way the a64 does:

    if (dc_isar_feature(aa32_m_pacbti, s)) {
        /* treat as NOP for now */
        return true;
    }
    return false;

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

