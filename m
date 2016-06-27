Received: by 10.25.21.96 with SMTP id l93csp1125938lfi;
        Mon, 27 Jun 2016 06:47:41 -0700 (PDT)
X-Received: by 10.55.209.207 with SMTP id o76mr3519889qkl.144.1467035261647;
        Mon, 27 Jun 2016 06:47:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c2si17187148qtb.120.2016.06.27.06.47.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jun 2016 06:47:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58818 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHWt3-00058j-3r
	for alex.bennee@linaro.org; Mon, 27 Jun 2016 09:47:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHWsw-00056Z-8V
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 09:47:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHWsq-0001S8-0k
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 09:47:33 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:36325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHWsp-0001Rx-SH
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 09:47:27 -0400
Received: by mail-vk0-x234.google.com with SMTP id u64so232519140vkf.3
	for <qemu-arm@nongnu.org>; Mon, 27 Jun 2016 06:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JKGEeeP3oOGsNbyRfbUchFBXLZaDE+LR/nbsAQoZ83s=;
	b=fUpQI8+9U9Z4xQj35ivve0z3MraSULxJ5Our0+91h2sinAe7Yf67r+cCXmbbh7Zb77
	hIk92a2ohMP9/ucVtIlZKcFshBHzZstM3uvLpnn8keZ98pzb0R50GwuobRP5jWrwhagx
	zEG8bqbzIYDHvkAQG70FaIWNPp+oVL7aGAVGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JKGEeeP3oOGsNbyRfbUchFBXLZaDE+LR/nbsAQoZ83s=;
	b=lrjJ4WCXRIN6b2D8R1YFyWaOPJwG4/0ZbJbMKKrpU7u/hWBZweRr1dbdkD/FQlWAw8
	jkrfBpIc46VETE06X0VhgNa3mnA8neZWJyxpQvE7uToCZc7eTqGLHNNChMG3I1k+0e4T
	G0dHgaLJXgEEa5uke/S5d4B6ZYZpivuR3CaFYOgnzuugiqj1FVLse6GdTcxp9P2FsIJx
	tcJDdijYFo0ulU0sAAczCCt1992IpyCqGxijHMnBrZnnIFDHYlY9rrMlyDyaWJRkHS3Q
	5UnjKmoIBAOoovdll2A159HPacuwFbH2JIFlaHLpZHpDG6+pKXiwKFAkUNlmG/c/EEsF
	tSBg==
X-Gm-Message-State: ALyK8tLh5cxf1iXXXvR34Hh+REi4HBuBEmpU3bSzNIMnsFffOgT4N/5Gu8qJBxoseNowZm5/dKq/ivgkdpo4WNWg
X-Received: by 10.176.6.41 with SMTP id f38mr8203290uaf.82.1467035247282; Mon,
	27 Jun 2016 06:47:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Mon, 27 Jun 2016 06:47:07 -0700 (PDT)
In-Reply-To: <1466744305-23163-1-git-send-email-andrew@aj.id.au>
References: <1466744305-23163-1-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jun 2016 14:47:07 +0100
Message-ID: <CAFEAcA_O_vPM=97KYWDcmsT8SeHBrcoi6JsEnp2J0mjEptZJ2A@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-arm] [PATCH v3 0/3] Add ASPEED SCU device
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k8Z2sq0USSD3

On 24 June 2016 at 05:58, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi all,
>
> These are three patches implementing minimal functionality for the ASPEED System
> Control Unit device and integrating it into the AST2400 SoC model/palmetto-bmc
> machine. The device is critical for initialisation of u-boot and the kernel as
> it provides chip level control registers, influencing the configuration of the
> software and the software's configuration of the SoC.
>
> Since v2:
>
> * Fix mixing of offsets and register indexes
> * Sanity check device property values
> * SoC actually initialises the silicon revision
>
> Since v1:
>
> * Select reset values based on silicon revision
> * Expose hardware strapping values via properties
>
> Andrew Jeffery (3):
>   hw/misc: Add a model for the ASPEED System Control Unit
>   ast2400: Integrate the SCU model and set silicon revision
>   palmetto-bmc: Configure the SCU's hardware strapping register



Applied to target-arm.next, thanks.

-- PMM
