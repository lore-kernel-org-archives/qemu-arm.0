Received: by 10.25.27.66 with SMTP id b63csp1504753lfb;
        Mon, 6 Jun 2016 07:02:48 -0700 (PDT)
X-Received: by 10.200.40.71 with SMTP id 7mr1962059qtr.20.1465221767966;
        Mon, 06 Jun 2016 07:02:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 43si11063133qgf.74.2016.06.06.07.02.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 07:02:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42666 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9v79-0003zk-CH
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 10:02:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9v6d-0003ee-LR
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 10:02:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9v6b-0005uT-LC
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 10:02:14 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:32883)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9v6b-0005uL-GE
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 10:02:13 -0400
Received: by mail-vk0-x229.google.com with SMTP id d64so76629832vkb.0
	for <qemu-arm@nongnu.org>; Mon, 06 Jun 2016 07:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o8d1y1GG8MYhT6s17YfcL7Bhj1vCE6bjppYlUrtTNXs=;
	b=gEb8l6qxfqUdPX4VcQZ9FRCiMe0kqv/vJPFDMxdT8ZF1x0HOoM8rHYmPOuxtLvEo9z
	T0+gi+SLpH9/KGmCb3gDeRso4IzbraSATIpE9zrUBSxMnHvyjex710Chcm6saKN7BLNL
	IyGK1K2vB5mFmgK6oZlfCnCOLeS9hBcpTsXFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o8d1y1GG8MYhT6s17YfcL7Bhj1vCE6bjppYlUrtTNXs=;
	b=XvlZJ2u4LA4x5d4kGTf89t7YQZribbcFMd1B4RejrmY8gSUpWp5HqIQezNWC4oiKbF
	QE6du0U2wrJAIE13R5ioYkqzeGjJGIrvLCEa8YgnmesGMZ3dGZDEhWoSiCgTfEzMjY3U
	IK7kH4mjKmsc62GXIpU4VibdBqKiHblgQpiDLOqYyAXmj9KzlYY8f4q4sZSE/UAG7tsL
	yblhDjJRrW0Ctvx7hkuzIU4kNfa/XjM45zbP/poRk7qHhSieMcedxv/DzNN4a/g/Yyc8
	Rv7k7w7D93atZHdzW+bs54WN4iiJ1IuNtAJlZpa4W3/PrnNnEx/j2HkT4se5XcW13+Ke
	cj0g==
X-Gm-Message-State: ALyK8tLR1+DGrRrvpsVxJvms+wao0AAFoqWoBJX0GKmALNXeQK3TMyR5WC8pZ5V7vbHUJ1KI99nER3tcpN/giK6G
X-Received: by 10.176.0.146 with SMTP id 18mr4206186uaj.17.1465221733020; Mon,
	06 Jun 2016 07:02:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.67.65 with HTTP; Mon, 6 Jun 2016 07:01:53 -0700 (PDT)
In-Reply-To: <1464325706-11221-1-git-send-email-andrew@aj.id.au>
References: <1464325706-11221-1-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2016 15:01:53 +0100
Message-ID: <CAFEAcA_Pseb+W6q-TjyZxsf+OuET=FpzNwck+72QpnY0iqxS6g@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-arm] [PATCH] hw/timer: Add value matching support to
 aspeed_timer
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
X-TUID: FmvKeUDB8Mi1

On 27 May 2016 at 06:08, Andrew Jeffery <andrew@aj.id.au> wrote:
> Value matching allows Linux to boot with CONFIG_NO_HZ_IDLE=y on the
> palmetto-bmc machine. Two match registers are provided for each timer.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>
> The change pulls out ptimer in favour of the regular timer infrastructure. As a
> consequence it implements the conversions between ticks and time which feels a
> little tedious. Any comments there would be appreciated.

So what would you need from ptimer to be able to implement value
matching with it; or is ptimer just too far away from what this
timer device needs to make that worthwhile ?

thanks
-- PMM
