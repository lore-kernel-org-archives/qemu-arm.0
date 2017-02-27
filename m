Received: by 10.25.0.147 with SMTP id 141csp899169lfa;
        Mon, 27 Feb 2017 04:04:17 -0800 (PST)
X-Received: by 10.55.19.10 with SMTP id d10mr14019125qkh.312.1488197057061;
        Mon, 27 Feb 2017 04:04:17 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75si3930473qkp.134.2017.02.27.04.04.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Feb 2017 04:04:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52060 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ciK2I-0002Bg-D3
	for alex.bennee@linaro.org; Mon, 27 Feb 2017 07:04:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ciJxB-000702-6M
	for qemu-devel@nongnu.org; Mon, 27 Feb 2017 06:58:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ciJxA-0003sr-F5
	for qemu-devel@nongnu.org; Mon, 27 Feb 2017 06:58:57 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:38784)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ciJxA-0003sg-85
	for qemu-devel@nongnu.org; Mon, 27 Feb 2017 06:58:56 -0500
Received: by mail-wm0-x235.google.com with SMTP id u199so16756449wmd.1
	for <qemu-devel@nongnu.org>; Mon, 27 Feb 2017 03:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UrE6+Ga6YKd5D/oM4eYOBsaCaAFND2EypjI3sh1jNVw=;
	b=WkCFpLH1UlBngrCWPpN/nlOuCn54UpzYrpYgcul6aaZ5/nBeQMVf2yuL4ICNgRwZ1h
	1tJl7JQo2Ldl2Sf4tifU8OXjZscNfAe0Os1PtxnAVEV1Y8I24Jhrl97RJv5I/L8wCIld
	QYrOLBnW3wiYoArwCfHLJSYyinMV0TpP+lwWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UrE6+Ga6YKd5D/oM4eYOBsaCaAFND2EypjI3sh1jNVw=;
	b=jFMz1fg6gf0791BMHsETzfsAbUtcTR1Q2y5mN6Wed3qEWHCfCNoDOTrIAH1StkuYrN
	f8CkQlxMHAnFfm3fC7trQcSQc3hWhfExH4CRzDomgACkLonKT1s1fdMDW3VSgTwNX0/4
	RIr6NZi1yq+8RX0Ov7Shi6yh2U1VTKJVpfg6LGvmuQvRPyVmA100dxe/CZDN6Ll7CcD1
	WTijA+F9rxLmqpAEbDo93MqY7DqhOETKsaQnCUapHWNVA5Qy4FddhBWC+sRNCMNN3gsZ
	uuhBCHc7QxcySVpCxv8gRG2kJ+nvxBOfdnwriXCBwIxwYfVuYiI8gXRtA83/qcialYGm
	nDZA==
X-Gm-Message-State: AMke39khOLBRS0G/HgCIqc1vD3kJdo3YidKRnW3UNJQ6LdUByTcSgbH1gMwuZa9A1rFd+iOwl6Haj9cwl414/LiV
X-Received: by 10.28.55.199 with SMTP id e190mr12563127wma.92.1488196735071;
	Mon, 27 Feb 2017 03:58:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Mon, 27 Feb 2017 03:58:34 -0800 (PST)
In-Reply-To: <20170224164021.9066-1-clement.deschamps@antfield.fr>
References: <20170224164021.9066-1-clement.deschamps@antfield.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Feb 2017 11:58:34 +0000
Message-ID: <CAFEAcA9RSPFQJ2EE0jcTbkymj=CSWt1NajXu8ojX0rhkw5QyWg@mail.gmail.com>
To: Clement Deschamps <clement.deschamps@antfield.fr>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-devel] [PATCH v3 0/4] bcm2835: add sdhost and gpio
 controllers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <andrew.baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rJhHJWuNNb3+

On 24 February 2017 at 16:40, Clement Deschamps
<clement.deschamps@antfield.fr> wrote:
> This patches add the Arasan SDHost controller and the GPIO controller to the BCM2835/36 platforms.
>
> This patches have been tested with raspbian 2015-09-24 (which uses the SDHCI controller),
> and raspbian 2017-01-11 (which dynamically switches to the SDHost controller).

Thanks; applied to target-arm.next; I'll put out a pullreq either today
or tomorrow with these in.

> I spotted an issue with the raspi2 platform, but it is not related to this patch.
> The CP15 timer frequency is set to 19.20MHz in the raspbian kernel DTB.
> There is a constant (GTIMER_SCALE) in target/arm/internals.h which seems to tell that the timer is at 62.5MHz.
> This causes problems:
> - The sleep command entered in guest lasts around 1/3 of the time it is supposed to last.
> - The cursor is blinking faster that it should
> - The systemd timeouts expire too early.
> - ...
>
> Did you already have this issue on another platform ?
> Should the frequency in the DTB be dynamically replaced depending on the GTIMER_SCALE value ?
> Or should the constant GTIMER_SCALE be platform dependent ?

We haven't noticed that on other platforms -- I think typically the kernel
trusts the value in the cp15 "what frequency are the timers" register,
at least on the "virt" board which gets the most usage.

We probably should have a mechanism for allowing the SoC or
board to set the clock frequency for the timer registers, though.
Ideally this would be done with the clocktree patchset that
Fred Konrad has been working on, which provides a generic
mechanism for wiring up "clocks" to devices which tell them how
fast things should tick.

thanks
-- PMM
