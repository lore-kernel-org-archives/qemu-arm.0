Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp709619ejj;
        Mon, 25 Mar 2024 06:48:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFQmBm43ZLteKOwNbImOj3VJmfw0h+u6EGGmXUR7/5oGq7SwXp2CeU3diWJ6hJa6R7j+1mxj4AMCAY3V+Fo+ssBST6+2IA
X-Google-Smtp-Source: AGHT+IFPUWQOxvurSj/5+bCu8wSPBYGRrwYjdSkjmNnhjfPOrS3RrBMpDD7riRyZnVOUDCVC00Nl
X-Received: by 2002:a05:620a:2483:b0:788:2a0d:6f90 with SMTP id i3-20020a05620a248300b007882a0d6f90mr9900580qkn.74.1711374490171;
        Mon, 25 Mar 2024 06:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711374490; cv=none;
        d=google.com; s=arc-20160816;
        b=MCZ3i+07ujqdTzZW3/8jAe0HWuE2TwemI1uG7U1h/8xMCHlFjxl95/Q0r39Qk5f3WB
         xYYR1THpiMNlxIer5P1ILpVuk3qFZ4d/59q0e87jLW2qhMa9qbvRSjJx9SXnm7UqU5Wc
         C/lsAAQi6cyAC034Mgv42bohvIzRhTsoSXDXffdAdOQ1b+H6qIb8JDgotgndHFWJiuO6
         GSm2PMBF1wgGidvPmgDHpk6Xe8Qnpgs/g+pFeRwJhl/IyDFIHMTckFJfKL179u88mC2x
         XGOd14r8B0B7HtFxDxEW9i4Cgli+BzUq0MSkA4owSaMTE5heo/TRX9c2psfEIz+UpYDr
         H2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Rt1vQHrPyRQSz/tnYXoveaVNPEz3zG79F4PYFBFIy9g=;
        fh=db3+IhlewuTu/D3xmCAVTPgZxq1OklOGPVdhl7/hNN4=;
        b=CiFTVIINinPtgNRTA5JmfC78UVLY8CvXm4xFVQgBQZ2y9QBD0lLGHA1ZeXwiTV4jgX
         haaUsL052JHVIM5FUYn+gOqpWqgNQ/Iisto3l1PaeOm8pE2Zq9UigqdsX+VcUeuxH1NG
         +wDm3MLMpud3iYp9D+OXUltHxVdQc92lYgmIDlZXVq4ZIJOldNvpJ5Pg0RxBXEfCr6LM
         z3Ep/FmoYiIIy2eULnEKCBl6z4+qH0egSpEYuzXODBZk9fU/7RowD47juL9Jl0QxUzxa
         aPNEfk6xFy7dwVm3vZCzcL1O//lyCbFB/x9M/2JgxXWIEFIB1j4l/c2t6NGByPNBix7y
         rBew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qKRGZm6S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l23-20020a05620a211700b00789f0d4acdesi5351995qkl.317.2024.03.25.06.48.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 06:48:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qKRGZm6S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rokgF-0001Qs-9Q; Mon, 25 Mar 2024 09:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rokfs-00013d-2M
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 09:47:40 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rokfo-0001Ya-0F
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 09:47:39 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56845954ffeso6002225a12.2
 for <qemu-arm@nongnu.org>; Mon, 25 Mar 2024 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711374454; x=1711979254; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rt1vQHrPyRQSz/tnYXoveaVNPEz3zG79F4PYFBFIy9g=;
 b=qKRGZm6SxXAJPhJkMQPB9K9bNiS/uCvOvthWi088wSBkEpg8ICmpeRCliA5rOxhvpV
 Fz/YSMgPPIaJYqcysr9jX51ZE4XMaS7Zd+vW6yuAu4A59Vb7z2UusjelwcB8vNaZe1cM
 /wrJ2LvtPF/8MlX+KdkYU0ZehMQlKV/Bq2TC7+5Mzm10x91D6npsGyij291/JNcu4w3/
 K7fPFCxv2T915vgxJYzN2Ny00Tc8sXOTn42FBSM1UfXtvStA7EDdN6tYOZrMStteTp3J
 FSicWjHMoIdSfcFjMOtOS8d1ZHPUv3uZliYQclIb6gUZ2GunQGNx8ZGq7fMrHJGX7Gmz
 E9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711374454; x=1711979254;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rt1vQHrPyRQSz/tnYXoveaVNPEz3zG79F4PYFBFIy9g=;
 b=obZIc7VYxJTWkFh0ybd9bVqlT9tFNOoKIkGqCY//pFvtDDqL5KFt5SyXto5u3tgv8I
 Cl06TgA8A5WEr0RIYsRx5sO9KrBykN6JOSnuPlYvag4duByObwttqjIpGKQsMaOhZo5/
 bRLBkCuUMNw3ettWolowJAmoxNVHOg/IlITDzKgCIrAB5Yw8YQXsPocqFW94uZ0b/jHK
 zdY2FrN75SqaglBdMcoaqNrwWIGd5YbWxLAmRycIE0rnuXhxu8Mi/VVghBYxKkjBuar3
 CsOpCxS4YT5WD60dN1DkcQMf5wotTHAH9v09pXQQcBDwJ/3D5ZhvGG/rc77Aqkk3Iq8d
 qnLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6eQdd9MbH/6XlnPm4ymLOnMPZG5kucE7M8ZwgfDNIjd2I1ZYyEWdSEGHFDzMuiVGyB5kW1qpoLLk4Gqa0Jh3t5eH4
X-Gm-Message-State: AOJu0Yzs/EbB7fFHcnpTdW3tcH2DXlJ8PnRe6in1XhmZVEyEskYVAJ15
 p2HizrzFKvwNCNNEqJVDSQQzmaCD9fpivDQ2KwpMb9eOrDHXM+DzlrA+gT0rVpncw8l3Xqb8JR6
 KZ5kro+4v/Y856TmbSmJHT4DG4aVoATFi9NBABQ==
X-Received: by 2002:a50:d5d5:0:b0:567:504e:e779 with SMTP id
 g21-20020a50d5d5000000b00567504ee779mr4409669edj.25.1711374453738; Mon, 25
 Mar 2024 06:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240325133259.57235-1-philmd@linaro.org>
 <20240325133259.57235-3-philmd@linaro.org>
In-Reply-To: <20240325133259.57235-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Mar 2024 13:47:22 +0000
Message-ID: <CAFEAcA9aM8J+0RjYnvr8Xr8Q2j3w_TgxHO-gPDn8MaAcAUDynw@mail.gmail.com>
Subject: Re: [PATCH-for-9.0? v2 2/8] hw/clock: Pass optional &bool argument to
 clock_set()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Damien Hedde <damien.hedde@dahe.fr>, 
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Luc Michel <luc@lmichel.fr>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BNKtoKN20Ga8

On Mon, 25 Mar 2024 at 13:33, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Currently clock_set() returns whether the clock has
> been changed or not. In order to combine this information
> with other clock calls, pass an optional boolean and do
> not return anything.  The single caller ignores the return
> value, have it use NULL.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/hw/clock.h       | 22 ++++++++++++++++------
>  hw/core/clock.c          |  8 +++++---
>  hw/misc/bcm2835_cprman.c |  2 +-
>  hw/misc/zynq_slcr.c      |  4 ++--
>  4 files changed, 24 insertions(+), 12 deletions(-)
>
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index bb12117f67..474bbc07fe 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -180,21 +180,28 @@ static inline bool clock_has_source(const Clock *cl=
k)
>   * clock_set:
>   * @clk: the clock to initialize.
>   * @value: the clock's value, 0 means unclocked
> + * @changed: set to true if the clock is changed, ignored if set to NULL=
.
>   *
>   * Set the local cached period value of @clk to @value.
> - *
> - * @return: true if the clock is changed.
>   */
> -bool clock_set(Clock *clk, uint64_t value);
> +void clock_set(Clock *clk, uint64_t period, bool *changed);

What's wrong with using the return value? Generally
returning a value via passing in a pointer is much
clunkier in C than using the return value, so we only
do it if we have to (e.g. the return value is already
being used for something else, or we need to return
more than one thing at once).

thanks
-- PMM
