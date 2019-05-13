Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3372402wrg;
        Mon, 13 May 2019 16:17:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZ909YRZe1fuL4+MGOGeygrYEMpPQumUDrSsJw/tLJbIaErXXyak7MYg+hSS3OdQKLYhUM
X-Received: by 2002:a50:b78b:: with SMTP id h11mr32023417ede.134.1557789457749;
        Mon, 13 May 2019 16:17:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557789457; cv=none;
        d=google.com; s=arc-20160816;
        b=ZjjiP1h7V1NRca8+qZx043vqiivCp4iZeC6OqPEfk5pieRhPMrB11PsLmXuDzXLuQi
         +uvBq+aNXxMxpNYVmLKV8teNIfgdcCadToGzrz2WB8BQ04594PdKj5arjpavfqYhZEbp
         dlif0+eQO+QiiNj0GiKmc150ElYywQUFrJdvNfUTsgj7jNpkpylH3nepvy6q1yfI8RQa
         CcQaOY7caRY5dw2fsdTMzsizM3Jld+M9MLCD06HFfOcd51zytSOx9cq3HY4l+EII8hxL
         n7KkJnjj9z2I3qeYJL+8trxvWufYbElD5WXzTSElBoUUTw+c5g0W0467k7yUiCKJDs3B
         LGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2vHz03zI+JINIBclxZbsNHslHVrte/25NIt2rGtgjnY=;
        b=TogPKct8YwkXIO/N2cvIXt5a/CrOYxSlPyU9keIy2UkX5D8xKjEfMNxOndA8c6oMsG
         Tc1X0hS0nGa6S+tb4t0+DNjunPP0n/K0Ly7wGvaLNu+RkzTGCsabz8h45FSrBDMUvl8i
         NoTQGwEQeY3ybLQQlCML0HtvWkEQSLHG9FulE95nv1Thqf37W1G6n2hs/NfD3i5hr5l0
         tJiMGp8Er3sCUmn0uLbzSGiTjqZ31vrd6d5ZJP/9lEWJr+CeWU6rvlu85SLfXPua+IIQ
         DEDbvgX5sfgqxFEUDFB8zfNQye/f1cmQfS3N1oNnOTemKID5BTZTs4Yi9ENCcKIJ0XWS
         nqcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=m02C9uQK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay4si2319471ejb.102.2019.05.13.16.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 May 2019 16:17:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=m02C9uQK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:36228 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQKCO-0002le-Ru
	for alex.bennee@linaro.org; Mon, 13 May 2019 19:17:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hQKBo-0002cX-Mn
	for qemu-arm@nongnu.org; Mon, 13 May 2019 19:17:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hQK2Y-0003R0-5q
	for qemu-arm@nongnu.org; Mon, 13 May 2019 19:08:17 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:45696)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hQK1s-0001o5-QM; Mon, 13 May 2019 19:06:45 -0400
Received: by mail-lf1-x143.google.com with SMTP id n22so10278305lfe.12;
	Mon, 13 May 2019 16:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2vHz03zI+JINIBclxZbsNHslHVrte/25NIt2rGtgjnY=;
	b=m02C9uQKsPUfSqGCArA4wK/5F6UU3CfAIGYxLypeEoOu+3okHBZJ8XtmJL6TPAewhb
	2K5ifoC/Joq40zaTdtMigjvmExlPrM24WDenpNQA0pOVR2+Q2tqfgEftzywYDtJqx6VX
	Q/qjjD+zl8MDtTd5zfZOQeYa6pOKe4mT1AkrUkEhzSLCIPE92DONAgdPsJCAF3CZ5uNv
	McVz1jZ7+rpVE6hw+nv24lBC2Eu77qfaC+P5Z8qrjkFFNbVtK3tnSI3A3ulua4ZPJFpr
	/HeMMw377ahsGkfxo6UdZK8UYmTQvSsXu3ykoa8qyvjn4KYF4hLCHpXUVVT++TTftrs9
	aGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2vHz03zI+JINIBclxZbsNHslHVrte/25NIt2rGtgjnY=;
	b=EMfkbFrEX2+sG6Vd4HnyOMPDqsQdoGE7DIXPJKtWlLPJlSW+yyUg0bSvr5XF0budk3
	KxP4a34xCLCL966mra5p8VQ7bBrUqADveiS9mXPRuhazovo2NM0g6qsasI/z1vhC/7g4
	OJx2dRccrokd1mo2ynrKixdBWRXl9WNKpQu2lCWwF+8xQfp+IA6WTrT06mHcsl5SMDFY
	iZiEIeNO7ufIYTW/5U+9Mndv1YLvP9KdamhWIrnqadmHKjyrDAdFspMS6wCCL78Cj6hW
	vOrRctybanysj7JbCZ5inehEjvEcN/S0GwCSOeAwFpaaktFk9UgQvyWQQQIbG8wDObMU
	WPOQ==
X-Gm-Message-State: APjAAAUMeiuhTQqgm6Ilj3V7x+931OFdD9ESgAa3nb90fMEZBCosOFIU
	vyjqbyycx8I7U/tz5HSgKDQHCAlGg3U2kzgzY6A=
X-Received: by 2002:a05:6512:309:: with SMTP id
	t9mr14617630lfp.103.1557788799792; 
	Mon, 13 May 2019 16:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190513194328.11045-1-jonathan@fintelia.io>
In-Reply-To: <20190513194328.11045-1-jonathan@fintelia.io>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 May 2019 16:04:26 -0700
Message-ID: <CAKmqyKNGXrvnJSuBN-BqtoyjE6FQ3niNMkWpwv1w2e1GN8ESHg@mail.gmail.com>
To: Jonathan Behrens <jonathan@fintelia.io>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] cadence_gem: Don't define
 GEM_INT_Q1_MASK twice
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Jonathan Behrens <fintelia@gmail.com>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WTnFmzPlR578

On Mon, May 13, 2019 at 12:57 PM Jonathan Behrens <jonathan@fintelia.io> wrote:
>
> Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>

Good find. Thanks for the patch!

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Can this go via your tree Jason?

Alistair

> ---
>  hw/net/cadence_gem.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 7f63411430..37cb8a4e5c 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -146,7 +146,6 @@
>  #define GEM_DESCONF7      (0x00000298/4)
>
>  #define GEM_INT_Q1_STATUS               (0x00000400 / 4)
> -#define GEM_INT_Q1_MASK                 (0x00000640 / 4)
>
>  #define GEM_TRANSMIT_Q1_PTR             (0x00000440 / 4)
>  #define GEM_TRANSMIT_Q7_PTR             (GEM_TRANSMIT_Q1_PTR + 6)
> --
> 2.20.1
>
