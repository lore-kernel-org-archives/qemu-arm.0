Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53BACD6E44
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 10:40:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSYA6-0008VQ-SG; Thu, 28 May 2026 06:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSYA3-0008Qp-6U
 for qemu-arm@nongnu.org; Thu, 28 May 2026 06:40:23 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSYA0-0000xF-VA
 for qemu-arm@nongnu.org; Thu, 28 May 2026 06:40:22 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-7dc78af7371so6779497b3.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 03:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779964818; cv=none;
 d=google.com; s=arc-20240605;
 b=QY1WyucTV9IEIWedcTL4wg2lqQs/0vn/leITbvALqM3WvXnJSlFc5vtWRaYT0+rTwx
 HELdC1EcurUB/F9RrMtUdqfCguI5dthfkec9/9S6k9yZ2zbWWaaPMakUOz8L4TTSXICA
 8VGe4ccGQt5u7SjPj96fUn8m0wjoZw1vkwqMkZVZxwM+z3WcchyS2yc0tV/874pMo+n9
 kmEp9z/c3iMMQTT0bzHwz/wXMYrF3ywg2Gg0nBKns93acTPPdcghZhQXPdAgl6X9UUtr
 hSbYXLEZo5NrUAzibEG9O7izSz8nd8FBkUghbV1wqM0qCRRsDM2bB9H+n+maEtywHOAy
 Z/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QhrKEQNZQJwZJj4PFhQODbUrn0jnDsRifxb+Tmoq+SU=;
 fh=vqp4YhocgafDhBM4fkwQQarApoS4MErnJ/RyESerbz8=;
 b=hdLl5J1F/lk0r6nKaBX2IiCCqGQxd4uC0jiT+UvtH6VWoSz1/u5y+iH0fSN3iZxKR+
 wDt279mVJlut/AMa2p8i2RyLyEfkY3AjFRKR6zT1T5mx9AMUKFYdQK++Fo0L/KkFG4mK
 ax2U8udjGsPgnj5qsRYbUcv/LKoQJ68Pspm+IwWiwiGXpnrxmOFwmOKkzPZDH+7rum+T
 wYlSFIUbNXy1EuD29lfyQL+dlPimxaL5aCUlsb+EumlXxpnuxA3AL7HjRvNp6fD86WDv
 aswa4gSok1B0zL+PzBFSaP6cJFJiZO7n2rwGG1mDkaPXu0UFOdEoj9gQY8LusFOuyyYl
 Yj7A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779964818; x=1780569618; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QhrKEQNZQJwZJj4PFhQODbUrn0jnDsRifxb+Tmoq+SU=;
 b=Y2GcHbFuJcuFuj8L26ifLQWi92lUgqWSME4m/Ziz464aMLcnEBs50IQIS9TvaIVLhI
 kPaiKukezoeC4WVHIEA33PFyuAsoTJV6Z5FnDfk4Y8nNMnsssWc8piu7b2OnOBmqchRc
 U1Lri8bDxSIDlKs16oye8o9Xpr7IxnqyURhKzA+4of1JMzUKAT0lju6yWfK2T5bqjhCZ
 gynG6Po0sYPbaf5wWmvbnTgzRIyn9xDcjwMY/ssm8guq2k+irb1K41iDX+/LzhHCGNGa
 E6Dro6BmkFCpkHZ1cpiooIhUIUtmfgP0eykOwRyMAKxzc5b78vfEuodJY5DIJ8UHaYnh
 Xwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779964818; x=1780569618;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QhrKEQNZQJwZJj4PFhQODbUrn0jnDsRifxb+Tmoq+SU=;
 b=snNpK+ucNiaNsHmmrAgSwW9+/e8XbLx1kJBSsH1wXiSJbZuM0eeRwe2CKq1b56tvaO
 AcOslKZfknvIlmDiNbM3TiKlH7sdsEdP25ZzIsQoRrJqoytiUBUogZoHNiEUs1r/2QAL
 pV6pUnw/J69jmO+mmWboXHUeHoWGFd+UAYsKXVqGvnwrXQnQxAdax0K6SU9eisAQXh9X
 fnRDpvanwVOVdrv0xjUPCHbxqpSw/RYRQms4n2DWz76c2F1MfwF0ecN9KUcaxMe6fu5q
 Fk9+p4aKgaNbG7aJi7aNBK3RbtEa2Ll3eiWgL6JPbQ4s7cLunZ4QJ/GIZNbxOGYYXE40
 wSvw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+OLHHQeIHhk8/SmXV+gHwQUoAbTCQdg8EUwrS21AyVPiibMmwi3foINf/LNiSTsVty0VZQs3UveQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy4ksBQnaHNAx6rgn45uG/JpUMsEIlkM7makveWtmqypoDADUL5
 saOWDCixd8fPdbM2hTN3gkO5wuudF85ASF2g7DD2R/QO1JAdiiThKmyjsSxE0f6VtgacTBO35K8
 KbSYY+RFxMYgIUBa9O35+l5lGFAluex/PKdWw1mz8sw==
X-Gm-Gg: Acq92OF4M/R6bqT8b5uyxF+EAnXPDf6lGj2XihSYnPT9xAuv2kjaql7cW0vaKB13G9N
 8/uDdlJ0dU5o3LL14wpTv+5xX6XvxoXhPibZ7mkGuA5sBH0gUmr0+PURXvpXUlwx58eXRWrRq8J
 YkF8GJ6BBHD843u/2yxg8okPoMXH+zkAt9pqSfQgIwEsuI6chRhlEJjxCVz73JiSiOCwui2kvsF
 Lk+0/LXN6kwhpgbjyZJdbAFWYDt67JpP9bbNIPlT4ReJ15cbN2T9nmJdAdve7WQtu611wvw/Q2q
 cbdwPrTEUBoViQmJJwDCVqzIkB27uLEnDMe6bfBhEpxTIAIv+Bd/i45S27Uq9I3mnMuJ7JGJq29
 wGA==
X-Received: by 2002:a05:690e:12c7:b0:660:3a2b:73c with SMTP id
 956f58d0204a3-6603a2b0c9fmr2878519d50.25.1779964818523; Thu, 28 May 2026
 03:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260518-pr-pacbti-v1-0-8932a885b03d@foss.st.com>
 <20260518-pr-pacbti-v1-2-8932a885b03d@foss.st.com>
In-Reply-To: <20260518-pr-pacbti-v1-2-8932a885b03d@foss.st.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 11:40:07 +0100
X-Gm-Features: AVHnY4IS_4fEMPfoGyXrbvJy8U5Zh_40Ncd9TnhaHGM26G05DGm83BsAM_1QPQU
Message-ID: <CAFEAcA-n3CLVsdze_tQSLVDrs9+AcOKga70g_0Tc=QrWSsxhYg@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/arm/tcg: add PAC related instructions
To: =?UTF-8?Q?Torbj=C3=B6rn_SVENSSON?= <torbjorn.svensson@foss.st.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Mon, 18 May 2026 at 17:16, Torbj=C3=B6rn SVENSSON
<torbjorn.svensson@foss.st.com> wrote:
>
> This commit adds the pointer authentication instructions from the Arm
> v8.1-m PACBTI extension.
> While the instructions are properly recognized, they are all NOPs.
>
> Signed-off-by: Torbj=C3=B6rn SVENSSON <torbjorn.svensson@foss.st.com>

I think it's worth mentioning in the commit message that we previously
decoded these as SMMLA, and that changing what we do is OK because
for v7A and v8A these SMMLA etc encodings say that Rd =3D=3D 0b1111 is
UNPREDICTABLE.

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
>
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
>
>  SDIV             1111 1011 1001 .... 1111 .... 1111 ....      @rndm
> @@ -375,6 +385,11 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 =
....      @rdm
>          # SEVL   1111 0011 1010 1111 1000 0000 0000 0101
>
>          ESB      1111 0011 1010 1111 1000 0000 0001 0000
> +
> +        # v8.1-m PACBTI extention
> +        AUT      1111 0011 1010 1111 1000 0000 0010 1101
> +        PAC      1111 0011 1010 1111 1000 0000 0001 1101
> +        PACBTI   1111 0011 1010 1111 1000 0000 0000 1101
>        ]
>
>        # The canonical nop ends in 0000 0000, but the whole rest
> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> index c744b16345..ae1351ef03 100644
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -5012,6 +5012,68 @@ static bool trans_SMMLSR(DisasContext *s, arg_rrrr=
 *a)
>      return op_smmla(s, a, true, true);
>  }
>
> +static bool trans_PAC(DisasContext *s, arg_empty *a)
> +{
> +    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
> +        return false;
> +    }
> +
> +    /* Handle as if PACBTI is disabled. */
> +    return true;
> +}

I think the patchset would be clearer if we implemented
the insns (in whatever combinations make sense) in the same
patches as we add their decode, rather than adding decode
only in one patch and then implementation later.

thanks
-- PMM

