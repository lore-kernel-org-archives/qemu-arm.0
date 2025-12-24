Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2B0E77361
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Dec 2025 14:26:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYPp2-0003hN-Va; Wed, 24 Dec 2025 09:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vYPoI-0003TZ-SK
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 09:26:01 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vYPoD-0006J0-GR
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 09:25:53 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b736ffc531fso1080340466b.1
 for <qemu-arm@nongnu.org>; Wed, 24 Dec 2025 06:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766586347; x=1767191147; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+p61ZJTEpWEtFw1xTacv9g1rqNFEZG18s4o5mFFKLsc=;
 b=PGJIkX5pN3nQllQkQoIzMVcB02gI0os4yYC50cdOIOAeX0k9nJ1VOGRjMDQTwF7xVG
 joXRHFATubhCo6HoocONxyadm1AzHfIyxUfzaiAeP/Kudseq9obiskdRUDWOt5G6iqwG
 TnfHQ8Ep7NnLAVQYULcEV3uiyIeDV9ycFonGyOiE7hwYc7aBuot7WFWuXgLwwcjmeNmU
 YT2BpcHRqq2gfJTBZ19q7Cy21nQo8mqKE9kJaPR9P+cAs5V62G8b6JzATXmlrIcz5eMJ
 mgON1/b2+4T0REJI4IFnSG31lt0buvc26ITqpnA9+h0XCuO+HPnZrbDiximCdm/fdxQU
 lLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766586347; x=1767191147;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+p61ZJTEpWEtFw1xTacv9g1rqNFEZG18s4o5mFFKLsc=;
 b=E01xBb1zDz8f7BgeaHIrq9TC8XA/jmCvDSjc3tOK9yBM8/DERSYAky7NkaS38C2Paf
 SacTBPSGnq14efgJgtzzPgafHt6mMJuMnSI38fPTSxD+J+U7MAoScRP+ZQ/oAqIWXCLY
 eAURPd2+R9kj3NAWZhKNtMIFfyEg4dLYC8NyqU+JMOetg4Y8zVxYOraiYMAHhM2gw9TY
 0LAjUFO+Zcko42g+pF9Yb2ictUxG3fbyh6rfWSu+8B6AMeMFMCAA7+SFTllHxBPo7AZA
 920sPiO/+QJGNpECVMrNHijFu61xvgU4bvCZNdW7GRMVngI7wjOLekVbYzcXFBkH5JDu
 6/Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXELBHVtAgdVP7/Nyt/quNIOy3CztCPpdOUTb7uB4/hygIBkzxWBxKPDOuw5CWnG/MZHD7WcD+f9Q==@nongnu.org
X-Gm-Message-State: AOJu0Yy59rGQEXXObXgEVbvh9Qo6ap2/BpeHRcretrY0PoCTJOmkDYXv
 rwJEiiwZtFOkSYgKvfyCAGqiiqGV9odBSkIWjUL8tDRpwnABnDhlTsaA1w01AvKa770jBQKTSla
 sYPlGUQRDnqPdf/69W1xTIgpiHh1wKw9LS6A8sjqE1g==
X-Gm-Gg: AY/fxX4z5jpD0zYmS49gDhuABN4ogy6Lz4dFazfZkiEP6QB7Cl9Jqi0NFB32bi9oU+c
 6jRC0cYKeauwZ2YHrXk+0KLmnULeKaqe4RwFCJcUbOdylTj1k/nkALp9mV1H8jtn99lw3zbi3Xl
 HaLF4ib2K9QWtKb1o49QntucTKqxaev1WuuoIcuzl07iRF/knRNlZt1J8I73wYv7WvGOtvIos4W
 e8NDhPAqqED26JIODOt2+niuI/Qr2omFa5ps8v3vTr6vXXTZoO38IoH6hQzX8wQWL9wvmM=
X-Google-Smtp-Source: AGHT+IFcbymrjsLO8CryqpgQ4SSzsT+ScTYUq2i2xSJdECtbCdUJYQ4j7Uo8f5agTgcG238o8czbrgKsYAmVuKrutM8=
X-Received: by 2002:a17:907:7f1c:b0:b83:976:50f9 with SMTP id
 a640c23a62f3a-b83097652a7mr246330966b.61.1766586347121; Wed, 24 Dec 2025
 06:25:47 -0800 (PST)
MIME-Version: 1.0
References: <20251224134644.85582-1-philmd@linaro.org>
 <20251224134644.85582-7-philmd@linaro.org>
In-Reply-To: <20251224134644.85582-7-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 24 Dec 2025 16:25:21 +0200
X-Gm-Features: AQt7F2qSewb8AHj-_6egGrk9J0eIkFxytZwrSHAZnM1GKT8lnuvpPseS6gzLd1s
Message-ID: <CAAjaMXbheBrj7cqUrFa7ja7WSZxZYMZpbu5KdGuHYMNui4Z_Dw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] hw/char/pl011: Mark implementation as being
 little-endian
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 qemu-rust@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>, 
 Max Filippov <jcmvbkbc@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x636.google.com
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

On Wed, Dec 24, 2025 at 3:47=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> The PL011 component is only built / used by ARM targets, which
> are only built in little endianness. Thus we only ever built
> as little endian, never testing the big-endian possibility of
> the DEVICE_NATIVE_ENDIAN definition. Simplify by only keeping
> the little endian variant.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

FWIW

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  hw/char/pl011.c                  | 2 +-
>  rust/hw/char/pl011/src/device.rs | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 01335d9437d..97cd9bd4c54 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -538,7 +538,7 @@ static void pl011_clock_update(void *opaque, ClockEve=
nt event)
>  static const MemoryRegionOps pl011_ops =3D {
>      .read =3D pl011_read,
>      .write =3D pl011_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
>  };
> diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/de=
vice.rs
> index 04155dabe1a..a6227a99f30 100644
> --- a/rust/hw/char/pl011/src/device.rs
> +++ b/rust/hw/char/pl011/src/device.rs
> @@ -495,7 +495,7 @@ unsafe fn init(mut this: ParentInit<Self>) {
>          static PL011_OPS: MemoryRegionOps<PL011State> =3D MemoryRegionOp=
sBuilder::<PL011State>::new()
>              .read(&PL011State::read)
>              .write(&PL011State::write)
> -            .native_endian()
> +            .little_endian()
>              .impl_sizes(4, 4)
>              .build();
>
> --
> 2.52.0
>

