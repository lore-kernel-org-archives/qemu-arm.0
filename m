Received: by 10.28.71.27 with SMTP id u27csp2050976wma;
        Thu, 8 Feb 2018 05:27:16 -0800 (PST)
X-Google-Smtp-Source: AH8x227qFhKL7jtVwmpT9Oznphxx+umyITDK1oaYNjSmSiir6KQtC5y2kn2j0gTSzJ9kFW2yTmKX
X-Received: by 10.37.135.4 with SMTP id a4mr439950ybl.109.1518096436387;
        Thu, 08 Feb 2018 05:27:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518096436; cv=none;
        d=google.com; s=arc-20160816;
        b=HZqsT2f6IDUFY8q/0OhoUEDuS87x+VWwgVcDvdsp9NoL5/CcyjBT7il701B2qkh1ra
         LHT6yBKFaT/3X6RNOQpWOgKLiPA9ntJXDArUqNnR6BAPVZ8V9LCckNnlRdqa67mMxEUz
         YXXwboPi3xJLVylhMd3Fgq++FMedG3Ttcr/UzmvwD81/A1TUBdjXx9esf6PJXG0/v7+k
         n4PBWjqyN/efQsT98rrOy551gnGnfs1aqQadGrYtGIsEMdZ15NAhNewK6zyCb1hRyijw
         uHOb52Qj2kEAplzrsa82HCYTDTICo8XZATdv04dAt1yniMNLPedtpcJLGT7tVlv3jXJD
         XKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=KcEkVWAYlUznN2Jj6AckTq1+S+8oDWoXZHQl4AxWtcA=;
        b=T96vVutluGy8PV0olURkNPh3XtGdfCFnmbgwTOO7iI4d3EodzSG+2KSuQHtdrTKXGR
         FoAKMH7SumGk2FaCuhq2hRZ8BP/O5a3CfL1Ws1XLBWste8H2e0XEEoW/qsNLSiPiPLfj
         qtkUFoYR951r5wvptZYkZgYHJhBlfITzulIbiXbzDvej1RKGmn4Cw+qpzZMRhTlYEgY8
         xfjudoDVUABBvI6CQR1vygIzc1au2yGzNLLa8glK9WX+/dyvhyLswxSLfxqJHDrs5Fyv
         dTuMVYD6bvh1U7wMyz7v0jVNoVDTo3kbZG94lIbe196dC8MwKssGD9U9RKJGmqe2ExVD
         RCdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VK/3ifZG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id b189si664848ywf.150.2018.02.08.05.27.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 05:27:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VK/3ifZG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejmEN-0004Ul-Pl
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 08:27:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ejmDa-0003xv-LD
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 08:26:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ejmDW-0004Mq-OI
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 08:26:26 -0500
Received: from mail-ot0-x22c.google.com ([2607:f8b0:4003:c0f::22c]:35299)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ejmDW-0004MI-Jt
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 08:26:22 -0500
Received: by mail-ot0-x22c.google.com with SMTP id a2so4307558otf.2
	for <qemu-arm@nongnu.org>; Thu, 08 Feb 2018 05:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KcEkVWAYlUznN2Jj6AckTq1+S+8oDWoXZHQl4AxWtcA=;
	b=VK/3ifZG588Y0m5I2qyEr4rSEYOfASIBLccCyhZYcqtWMuv86RxrsBfpUXGMBCgEgZ
	QjqFxJgDTgBxuDqJ1FJNU5bPqHLmY6n6aKQj8DxhN6Pq/os91XolSOcyCZREKzM0qJyy
	HP2VIVXgQgLY1HHby3DOSKMaAtbHAOO3Hj1aU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KcEkVWAYlUznN2Jj6AckTq1+S+8oDWoXZHQl4AxWtcA=;
	b=JmJ8Hd4XlUIUs9Q+lmVJTt7d54MRxuDtHXMXebcOL41n6qzQN8kd+ywljs5MaGcnRt
	s0cE5BaHyl2H9C8siYyRU038ujqNl/2mcEQURUAH7K+07bMJc2PkDyxZWdoudtY6ZnVn
	o/Sl6G289W5qEmXjJ92py25yJFI4rP7UFU+kqzs1GMrq/wpiBGuX3mCC+UgkSCJHgDmO
	XDD/mjMmioUmXGPztT7H+e49D6XvlP/tNCE1hwlnXi2ykyO7rUPxFTE39Of2g5o62CSF
	9ZpY435chDsBIhZophNp7rgp3k7jERst/YB7qAom7bVsNEAn5TQsoKcOB3WsO5vJ6n68
	Zd3w==
X-Gm-Message-State: APf1xPAjf/bXSmlW6Spswik6FqL8ZWZCr2LhzMD+DyLhxFtA785mmJac
	Rh0b30YcZ2S6GQ+//X1G4I4vLhxVVazoEXukY5m6NQ==
X-Received: by 10.157.13.72 with SMTP id 66mr508890oti.116.1518096381839; Thu,
	08 Feb 2018 05:26:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Thu, 8 Feb 2018 05:26:01 -0800 (PST)
In-Reply-To: <20180207042438.15422-13-andrew.smirnov@gmail.com>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
	<20180207042438.15422-13-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Feb 2018 13:26:01 +0000
Message-ID: <CAFEAcA8Hjsb+KW4A0ks696+zXOeDErndeQDFvOqshyONpyaSSg@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22c
Subject: Re: [Qemu-arm] [PATCH v5 12/14] i.MX: Add i.MX7 SOC implementation.
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D3wfC2lPvfA7

On 7 February 2018 at 04:24, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> The following interfaces are partially or fully emulated:

Hi Andrey. I was just going through this series to apply to
target-arm.next, and I noticed that fsl-imx7.c is GPL-2-or-later,
but fsl-imx7.h is GPL-2-only. Is that intentional?

If this is just an accidental error, and you send an email to
say you meant 2-or-later, then I can fix this in my target-arm
tree by copying the license paragraphs from fsl-imx7.c to fsl-imx7.h.

> --- /dev/null
> +++ b/hw/arm/fsl-imx7.c
> @@ -0,0 +1,580 @@
> +/*
> + * Copyright (c) 2018, Impinj, Inc.
> + *
> + * i.MX7 SoC definitions
> + *
> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
> + *
> + * Based on hw/arm/fsl-imx6.c
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */
> +

> --- /dev/null
> +++ b/include/hw/arm/fsl-imx7.h
> @@ -0,0 +1,221 @@
> +/*
> + * Copyright (c) 2017, Impinj, Inc.
> + *
> + * i.MX7 SoC definitions
> + *
> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */
> +

thanks
-- PMM
