Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp39989lfo;
        Tue, 2 Feb 2021 03:41:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2xQp2p8wmdpfrOidU9Kyft8Ien7eOV/Ny00ZXOUVvZhtvXWMulK+RKDWyHuPyAaKq6YM9
X-Received: by 2002:a5b:34e:: with SMTP id q14mr31541213ybp.291.1612266063882;
        Tue, 02 Feb 2021 03:41:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612266063; cv=none;
        d=google.com; s=arc-20160816;
        b=R8qhTBCfPwtjKngVMyFRXD46KtYJkEv2AbTqp9R0PAfADky3b5wNrpUyPU5fajedzT
         6aqWQyFisNx3g4xVxGRlOyV14S5AW31rKLX6itPSfeoicAbdHXdQI0zcRvL52E/b+V83
         xaoW4WMEJAFyGpL3YUIkmPmtIVcP4zCcGGoCyJjF4R7nUMGbAjvWgzOLjcfHkzjoiwiQ
         LxyDyzkYRsCG1krSN0MUWC07n/44ARyMIf9o8/W5bh3SZk0XjWBQoWJ8ApxvaChwYWB9
         c4+gAUSjbHS7QW1HwVRZHj99OV/FsUNM28DUIH2KKjKjKlEd6+X6E3tsL7g4iphKIdWQ
         sESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J1gMHfjh9hU54RASq2J68fBTn/Px5+qIYgit7RlS7xQ=;
        b=jkgostsP+04Ar2m6Pt1RboNEp5sL/bDE6Qikwdx83SIgctwoqwRzSMP27RsyWzKOaP
         sx173ZadzKNMvHIAAQXuEzQsF4xCWnFUDQw8EiAllKFo84L+uRoWrd63YoTuCs25ESPa
         GponmPoz/OfEBZudVNrAe0Q5q+TSr4UcMVe0MeSmSTHD6wYbeHw5gHGMpNhXtn8U36L2
         U+cosSL2sIaO+0z8dHxaKQ5RpadATUXjI4OINkTjMK+Bt5LgC+VE2qGRz0iFFUI2nw6e
         rnj+4WAdomITogdCrR3ToI0XY0Ey9+SSLdmkKjBavO0PzR7czpXUlblX4iSodZ+PdpWE
         3S9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hYmDg6TM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m74si2512631ybm.439.2021.02.02.03.41.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 03:41:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hYmDg6TM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6u3K-0004Pr-Tc
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 06:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6u2J-0004PT-CW
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 06:39:59 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:35409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6u2H-0003FC-FO
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 06:39:59 -0500
Received: by mail-ej1-x630.google.com with SMTP id a9so11064851ejr.2
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 03:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J1gMHfjh9hU54RASq2J68fBTn/Px5+qIYgit7RlS7xQ=;
 b=hYmDg6TMVzJOPj43EPSDdCv7fg7tXmkikPqj0g4vz+dLOmu+3tEwI1Qyk8hyXvJhU3
 735FAltTISSRRN9sZBfsL+c7GSWunEo22aKxIex0ccOZxOUK5jik8M4Mvctpp49bb/jf
 NzMxQhmONOmPbkNVS1lflHdpslCEceSsQRnf8bD4Ux74IGZP41O2TpugZTLWsP9BbRgT
 GdhIoB5f8g4sd/QMxBYUSHK4S+ZHLqgwFwyBrkaaxi2tUMuNMJsIIK62zqpPSLiXSBMH
 a1ZAXDP19sgGSu3yqUxSHd1xX4s6a7dJ7rb7vXdBNIHS5FkT2oPFe5qA1fD3Igv04Euy
 jKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J1gMHfjh9hU54RASq2J68fBTn/Px5+qIYgit7RlS7xQ=;
 b=brxAhZH5LG0lIuJT3aBe4RRZXF0RtDN+PkFlzp6wJooeyHU+suQlSc8/mdeWrEG4iD
 T5W6r6x4NgnrYOUtgOoaMbDP2FEx5YX5OZzXf1ycLXndpgV277UzCZeObjDJaSYwl7cN
 CDG1QVm/uBW7VynVKVpQ+373a87lW99PLaDej0oXrggOQbi9/ETvqQGLkG3d/ADTUz4d
 tJK5L/nEbPR6MEJDlpoNfMOcDsD7fe3xhPtdsLhBoUXnjmSzRtFA6s9Icsi0kpFGxa17
 wsKorEYpkAdC6zGI7s0aLNePaY3uPWRDfr6aB4tQipI6BmrbZBsSBPjrIpcy+0aijhHI
 60rQ==
X-Gm-Message-State: AOAM533lCymc28GblIafrzPXfGd98YoDd7YrlVfisK42Tb1x0odH8vVc
 /KexEDjslddHzsJjiGTK9oI9jQE1hoRVYj9WBKQzAA==
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr1417364ejh.85.1612265995655; 
 Tue, 02 Feb 2021 03:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20210129132323.30946-1-bmeng.cn@gmail.com>
In-Reply-To: <20210129132323.30946-1-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 11:39:43 +0000
Message-ID: <CAFEAcA9sDSre3k7YGgwzFBCc22sg2FOuBqVwekQx=fLiFvcevg@mail.gmail.com>
Subject: Re: [PATCH v9 00/10] hw/ssi: imx_spi: Fix various bugs in the imx_spi
 model
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dyce98GWArqj

On Fri, 29 Jan 2021 at 13:23, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Starting from v8, the series is based on the following 2 versions:
>
> - v5 series sent from Bin
>   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=223919
> - v7 series sent from Philippe
>   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=224612
>
> This series fixes a bunch of bugs in current implementation of the imx
> spi controller, including the following issues:
>
> - remove imx_spi_update_irq() in imx_spi_reset()
> - chip select signal was not lower down when spi controller is disabled
> - round up the tx burst length to be multiple of 8
> - transfer incorrect data when the burst length is larger than 32 bit
> - spi controller tx and rx fifo endianness is incorrect
> - remove pointless variable (s->burst_length) initialization (Philippe)
> - rework imx_spi_reset() to keep CONREG register value (Philippe)
> - rework imx_spi_read() to handle block disabled (Philippe)
> - rework imx_spi_write() to handle block disabled (Philippe)
>
> Tested with upstream U-Boot v2020.10 (polling mode) and VxWorks 7
> (interrupt mode).

Applied to target-arm.next, thanks.

-- PMM
