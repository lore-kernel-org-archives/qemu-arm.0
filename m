Received: by 10.25.205.13 with SMTP id d13csp331168lfg;
        Wed, 14 Dec 2016 09:48:10 -0800 (PST)
X-Received: by 10.237.61.130 with SMTP id i2mr99643948qtf.293.1481737690014;
        Wed, 14 Dec 2016 09:48:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id f21si756778qkh.167.2016.12.14.09.48.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Dec 2016 09:48:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHDex-0000l8-3M
	for alex.bennee@linaro.org; Wed, 14 Dec 2016 12:48:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHDZp-0002VV-QL
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 12:42:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHDZm-0002ZJ-OO
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 12:42:49 -0500
Received: from mail-vk0-f41.google.com ([209.85.213.41]:36080)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cHDZm-0002Z0-B6
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 12:42:46 -0500
Received: by mail-vk0-f41.google.com with SMTP id p9so38802637vkd.3
	for <qemu-arm@nongnu.org>; Wed, 14 Dec 2016 09:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F3gUxemJ8OWSzW/1EWHwpOFynCpA0R5HFAFg6iGe6oE=;
	b=dSnXwV3ccgD0fSSEZuZg3UYtv6QfJqaJPzqk2TdCm8kxfWuCYUirgdLUdyRpxtpna3
	AkxZaskCxDoXrg5G8pYb3yaU4fme2UUKpXfPqInfnLM6YHwIlQgOIsuPUg4966JgjnJM
	qAunNys+nwKWQ/s2RAMQvf67EBIU1yqcKrCVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F3gUxemJ8OWSzW/1EWHwpOFynCpA0R5HFAFg6iGe6oE=;
	b=lxA1mFBGu+NnU/JiqXJSOOAERtWWXF5RJHxaZGWWTtonM5fUauhoWkhb5Slz+XKqn1
	79errUc9o1jZ0T41WgaG3g6UEucGtYqTsWUpL0L5e3Ibu3K59be5SoxDHPtztb5oKfQB
	028Uo2OScUF2D4bExMeUoO8SvV0/rnuwlH8NquA4gVsxnOj9jjZdpqD0tNxowro2ZoS5
	KiRDwoQXz/YBF2P2oZqMhlLHv1GBhVgyizK6MAWK+Gp1RucKhlQQUCP8TT6+YNDiusk/
	BKNyty6juk+3BR9VWflwdx8ZrfaGabL3sQr5Db3ljbGBOuWYCEwxe67UBmqsNltIUJwZ
	338g==
X-Gm-Message-State: AKaTC03cVljv9Ek8WaGBkjUzlaRM9l37vu7U8XU2Ls+YjvvaQR/uAtuRhVH1DNZ4BCTSZNV4TRNZ3bl67U+btyow
X-Received: by 10.31.65.3 with SMTP id o3mr39476186vka.3.1481737305470; Wed,
	14 Dec 2016 09:41:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Wed, 14 Dec 2016 09:41:25 -0800 (PST)
In-Reply-To: <20161202054617.6749-2-alastair@au1.ibm.com>
References: <20161202054617.6749-1-alastair@au1.ibm.com>
	<20161202054617.6749-2-alastair@au1.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Dec 2016 17:41:25 +0000
Message-ID: <CAFEAcA8nge_DCESG-4XLzKQG_K0AGjh8RBBMbekSOj7O8KB0ng@mail.gmail.com>
To: "Alastair D'Silva" <alastair@au1.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.41
Subject: Re: [Qemu-arm] [PATCH v3 1/7] arm: Uniquely name imx25 I2C buses.
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FvxjG7wN8ep8

On 2 December 2016 at 05:46, Alastair D'Silva <alastair@au1.ibm.com> wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
>
> The imx25 chip provides 3 i2c buses, but they have all been named
> "i2c", which makes it difficult to predict which bus a device will
> be connected to when specified on the command line.
>
> This patch addresses the issue by naming the buses uniquely:
>   i2c-bus.0 i2c-bus.1 i2c-bus.2
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  hw/arm/imx25_pdk.c | 4 +---
>  hw/i2c/imx_i2c.c   | 2 +-
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
> index 025b608..c6f04d3 100644
> --- a/hw/arm/imx25_pdk.c
> +++ b/hw/arm/imx25_pdk.c
> @@ -138,9 +138,7 @@ static void imx25_pdk_init(MachineState *machine)
>           * We add it here (only on qtest usage) to be able to do a bit
>           * of simple qtest. See "make check" for details.
>           */
> -        i2c_create_slave((I2CBus *)qdev_get_child_bus(DEVICE(&s->soc.i2c[0]),
> -                                                      "i2c"),
> -                         "ds1338", 0x68);
> +        i2c_create_slave(s->soc.i2c[0].bus, "ds1338", 0x68);

This bit doesn't look right. The board level code shouldn't be
poking around inside the IMXI2CState struct, as that is private
to the device implementation. That's why we're calling
qdev_get_child_bus().

>      }
>  }

thanks
-- PMM
