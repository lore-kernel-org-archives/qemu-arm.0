Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6457D2D0E3
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Jan 2026 12:02:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfd2e-0006xS-BO; Tue, 13 Jan 2026 06:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfd2a-0006wu-2D
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 06:58:30 -0500
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfd2W-0006q8-LB
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 06:58:27 -0500
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-6446c2bbfe3so6453154d50.1
 for <qemu-arm@nongnu.org>; Tue, 13 Jan 2026 03:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768305503; x=1768910303; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kh/9G2A2vbjrgibG+mQpLE/oAdLwICaYy7XTwVszBkM=;
 b=UI9QJaFohZlDt7ooP/FFHZvfYOJkumm6CVaTwwc1gGC9nZYCod9GvifVpOCB+0LaRv
 8y7pedlvh8jqVuBdrb+i9Femv4etC48YmEAhDDuLmiXal8AGyjDvbX3to2+6Pl8AstjE
 KSAk9usynd8pm25hZu2qKQkdKwrkx5w48XPH01AamKyuSiJ2lklWVz4F2lEyEcL6Gw/T
 N5sqNebL7s1w0nzubeBAyKTm1LbO7lt/CJmYp5ZwQ1wGRa/x10c0DweYn3oDDYGefUEd
 ArnatP+LC/0sFwApB3FZl1rsTZEl7bu1WhaH1az2aa9fYlwTqKBeAGK3ooXOqtNU5Hnv
 +9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768305503; x=1768910303;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Kh/9G2A2vbjrgibG+mQpLE/oAdLwICaYy7XTwVszBkM=;
 b=teGcXiRCJYjOMqjEqVYduUgcPXA74N++ObLpK/fzAaFObtjtsqCt+T3ZyI3UIRZ/CN
 yQnILOlL7Y9dtspcOgGd3K3pDTWnk5Sb166kuDcb8ZNDt+cnTlVxU5SykW+KOnVbjj3H
 9K66Yymd4l+T5USjBMRptJrTkbRmOyQp+oC/5zhAgqcd9QzujBmOgtRXFI5x908ZEoYU
 qoGzdJ2D9gveLNYnOKRuNHfmghJwxgxSZmJcrQksuZrXgCB+Y8Jge6s8plI6ytu2bDlT
 lVUe6fRBuPdyrN2FRkLu0VZaqdPyvB+1OBNwlEaaL/f63XaiMVHPuJ6EGTadukWsSW/t
 09lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVox1N5oD2zzv2vAFnAAKFtJuMvcynI+OutikwCA1KlTbYLz8FH3IAWLG+Hl8YWbACxCio26N3CiQ==@nongnu.org
X-Gm-Message-State: AOJu0YxVaU1bO7AFE9UhaHx10eGtABWwz4AbqOqRRI6/mtK+qdzYkuPI
 WIzZdNDq4aLlvN1dPJSd76igEFdhXKgM92SskNxN9XbLp+yYB7dvRNS6XHsKo4a1rnckiiEVIfc
 ADrsUobJJeqhHZiGMLHvSaq509sqpuvLVIEc7H4KFiw==
X-Gm-Gg: AY/fxX5p+ZqYPHqkqLbbDKZtp1XabIbEn4NWC535T1Mim01aDyLU8TFz8zg4/3mHypz
 Uuq3TLcyzPGd41jdXTN0EsZN8gw8fXzDmYCJkNiBcqYRxSNijuyFaWUQ3rZlqBT7F+Q8ikQU95e
 bx4rddqg1ijQfIec5eVJP5fidkWrZqq12MuLjA+JvIBBdGinJTOEcjPxlxHjEFJ9eDihqsxVRj1
 ZcpLoBFSq1ynuQhWrcHAhqUZhmPDHKXhZzHcgcM1VwECSp3kJgl6Kcmw3w/UBEjItiq6mkgg+V1
 3Nfauh31wgyArrSpcN2obK0=
X-Google-Smtp-Source: AGHT+IFOuQtMvXSMQxIaewq76FcvljNQ1lLFbrE0FLwvdBha78nJYY/RWV7IryERXhSihr8nW96CtxBiF6at+gfFEtg=
X-Received: by 2002:a05:690e:4008:b0:644:7901:5e54 with SMTP id
 956f58d0204a3-64716bb9cc1mr16268263d50.6.1768305503254; Tue, 13 Jan 2026
 03:58:23 -0800 (PST)
MIME-Version: 1.0
References: <20260113115138.3171479-1-alex.bennee@linaro.org>
In-Reply-To: <20260113115138.3171479-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jan 2026 11:58:11 +0000
X-Gm-Features: AZwV_QiHwWrdj29HTjtykG9EX2qjD-fOWhQPu1L1Sekk7uDNM_9dMGGswiSYkk4
Message-ID: <CAFEAcA8Ot9Zsse+F8NUA3=qnaMoBKHDwT4nRSzzmaAx3Fgz1bA@mail.gmail.com>
Subject: Re: [PATCH] tests/functional: migrate aspeed_rainier image
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Tue, 13 Jan 2026 at 11:51, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> fileserver.linaro.org is going away, migrate to the new share server.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/functional/arm/test_aspeed_rainier.py | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/tests/functional/arm/test_aspeed_rainier.py b/tests/function=
al/arm/test_aspeed_rainier.py
> index 602d6194ac8..025e5751dc7 100755
> --- a/tests/functional/arm/test_aspeed_rainier.py
> +++ b/tests/functional/arm/test_aspeed_rainier.py
> @@ -9,10 +9,8 @@
>
>  class RainierMachine(AspeedTest):
>
> -    ASSET_RAINIER_EMMC =3D Asset(
> -        ('https://fileserver.linaro.org/s/B6pJTwWEkzSDi36/download/'
> -         'mmc-p10bmc-20240617.qcow2'),
> -        'd523fb478d2b84d5adc5658d08502bc64b1486955683814f89c6137518acd90=
b')
> +    ASSET_RAINIER_EMMC =3D Asset('https://share.linaro.org/downloadFile?=
id=3DPaCHfyerwpSr0CV',
> +                               'd523fb478d2b84d5adc5658d08502bc64b148695=
5683814f89c6137518acd90b')

Is there no way to keep the filename ? For the human reader,
"mmc-p10bmc-20240617.qcow2" is a lot more descriptive of what
you're going to get than a long hex string...

thanks
-- PMM

