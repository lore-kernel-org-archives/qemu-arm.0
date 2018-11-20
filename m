Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp383850wrt;
        Tue, 20 Nov 2018 02:20:48 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XQ/QrgjVbpleZZH1iBSOjDLnks1gU7TIl3eA5bDJnC9znQ5BdMW20dYj8znm8jGETIJ9WZ
X-Received: by 2002:a25:be4a:: with SMTP id d10-v6mr653792ybm.310.1542709248585;
        Tue, 20 Nov 2018 02:20:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542709248; cv=none;
        d=google.com; s=arc-20160816;
        b=yrYRhOJx3pZo0HUT87QpjsXCHSSnDCLytLhvfTZkWhjJr82zO4n7XBnX4T3qwdY4p9
         UJsf5S+4BeTn5wf97T48j8KtamLW6ytxiMBGFLsxMi11iGJEpNOEzlzEgzYPSj8cVtKK
         ckO7fbWM7gDFCzcBx32Zd89LUJegj6g268wD+fGJwgsuzMJ974zY0m7V3EMDhw1ZhGyu
         NDu1RYRZvwId1KhIqb6N5jvCmY6mdhXl0/wnqWzde9kf4lG5WBuoESJcZJlw6TKAlkw5
         Am1nqI+umL9a5BoBFwycbZZ42Y+h9hZLxkLiNUeRgSbXlsDbq6m3dVCd/+NHLH0pp7qT
         LfUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=IyhcQSe79IaHhtMacJI3OmwCZuu5Lo0fRVxQBY8calY=;
        b=lT9uKlMHs5ThU3xj2w1bN+ZFUPaw2rOihVXoWifnQ9QFZzk8dc4F1tII01NgUDyI2I
         ml/YnUrJEMLN67Oukqw+Ag0LBNZraz4SYtjNiOq1YM42kRO880rWVPg9MiSdjKpsuq8b
         +f7l0fvrYq4srdnnpzdciwv2YcQ8XHlo2dEL1ToVmoh6fQeV/Dajjm7hbWXpEUuGwYWO
         gxk8j1tqAz4zWil13sieh1jXFLx6ZHz9qwnhUL8iCLOp8iGmQpLHwomOHJeRUqqxVQCJ
         zrecFyDar4NiercbPN7Ym7uyo/PCbwQMtQYWPgUygvGhZj4WUo/jw+OKsZdVVvTu9u7a
         APGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MNCcgI9j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c85si16997443ywb.423.2018.11.20.02.20.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 02:20:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MNCcgI9j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32886 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP39D-00045J-WA
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 05:20:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP38o-000453-1p
	for qemu-devel@nongnu.org; Tue, 20 Nov 2018 05:20:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP38h-0005BI-2c
	for qemu-devel@nongnu.org; Tue, 20 Nov 2018 05:20:22 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gP38g-0005Ay-Sv
	for qemu-devel@nongnu.org; Tue, 20 Nov 2018 05:20:14 -0500
Received: by mail-oi1-x243.google.com with SMTP id t204so1054891oie.7
	for <qemu-devel@nongnu.org>; Tue, 20 Nov 2018 02:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IyhcQSe79IaHhtMacJI3OmwCZuu5Lo0fRVxQBY8calY=;
	b=MNCcgI9jqN0JXwMdRljxVUHyby4j/jQCmkWP+c5pRHK5oIB24vIwJExQvxz1OedmA5
	Yukw39SFP04Wy0QRnUJ1nKqEKjp6v0nch3drXDaiKVYTY9XtVwH59yejJ6yBvjXPUypr
	YssQLKw2vcwztOeTNzbONy0dXEK6RqWz3pNlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IyhcQSe79IaHhtMacJI3OmwCZuu5Lo0fRVxQBY8calY=;
	b=MsxBHNhT3rGZWRrFRvZvmNgnVeBxTAntvJMGVG6xp6Yt8gU9tfv58E5yN8KWRceo7Z
	iGb0eDEsdUcyZ44+YTwovHtl/JXea/RoC/uxchxa4OMp3fh4kTFDXnkvDW9r9VQrHh3i
	hyHy+UgGed4rbGT3lRsroKfG8cGmJxrYiO8ixQ2Tx15l2FhYf9eYq8oEDH7nvQtdKj6T
	qWKkEeV0dyy1bwFPpRbz2sXAT+xds8VbxEy1bhJMuur4O8k8dXHgfjSjUL8+PmHG8HGG
	od1ea/KUWVc8E9f1XSVwtH2EzMYDzJ6inwAzpGSw7q2U8CLZSTBp52B4jqerv3y6/Hcy
	H8EQ==
X-Gm-Message-State: AGRZ1gLIgF19CIvZjz6+IBY91xBjYrvvG8w24aGzkQfBfH4bkVBv2eQv
	40SWNDoz2+gx2W/HKmH/iKAEqHlsfWB3pNyIegQr1A==
X-Received: by 2002:aca:2dc9:: with SMTP id t192mr786716oit.325.1542709214211; 
	Tue, 20 Nov 2018 02:20:14 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 20 Nov 2018 02:19:53
	-0800 (PST)
In-Reply-To: <1542657473-9196-1-git-send-email-thuth@redhat.com>
References: <1542657473-9196-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Nov 2018 10:19:53 +0000
Message-ID: <CAFEAcA_xhYf0VNaq1gM1OWWCkms5sTpn3kdqSHN0AZ3cH1f8Dw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: Assign some more files in the
 hw/arm/ directory
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dc27jzYjyT7h

On 19 November 2018 at 19:57, Thomas Huth <thuth@redhat.com> wrote:
> I apparently missed some more files and even a complete machine (the
> "imx25-pdk") in my previous patch... but now we should hopefully have
> a completely coverage for all available ARM boards.

Hi; looks like you forgot to cc qemu-devel.

> Fixes: 95a5db3ae5698b49c63144610ad02913e780c828
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1032406..ac20dc8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -533,6 +533,18 @@ L: qemu-arm@nongnu.org
>  S: Odd Fixes
>  F: hw/arm/gumstix.c
>
> +i.MX25 PDK
> +M: Peter Maydell <peter.maydell@linaro.org>
> +R: Jean-Christophe Dubois <jcd@tribudubois.net>
> +L: qemu-arm@nongnu.org
> +S: Odd Fixes
> +F: hw/arm/fsl-imx25.c
> +F: hw/arm/imx25_pdk.c
> +F: hw/misc/imx25_ccm.c
> +F: include/hw/arm/fsl-imx25.h
> +F: include/hw/misc/imx25_ccm.h
> +F: tests/ds1338-test.c
> +
>  i.MX31 (kzm)
>  M: Peter Chubb <peter.chubb@nicta.com.au>
>  M: Peter Maydell <peter.maydell@linaro.org>
> @@ -615,6 +627,7 @@ R: Andrew Baumann <Andrew.Baumann@microsoft.com>
>  R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>  L: qemu-arm@nongnu.org
>  S: Odd Fixes
> +F: hw/arm/raspi.c
>  F: hw/arm/raspi_platform.h
>  F: hw/*/bcm283*
>  F: include/hw/arm/raspi*
> @@ -641,6 +654,7 @@ F: hw/arm/z2.c
>  F: hw/*/pxa2xx*
>  F: hw/misc/mst_fpga.c
>  F: include/hw/arm/pxa.h
> +F: include/hw/arm/sharpsl.h
>
>  SABRELITE / i.MX6
>  M: Peter Maydell <peter.maydell@linaro.org>
> @@ -686,7 +700,9 @@ M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/virt*
> +F: hw/arm/smmu*
>  F: include/hw/arm/virt.h
> +F: include/hw/arm/smmu*

The SMMU files aren't part of the virt board, they're
the SMMUv3 device model. They should go in a section
that lets us mark Eric Auger as their maintainer.

>
>  Xilinx Zynq
>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> --
> 1.8.3.1

thanks
-- PMM
