Received: by 10.28.91.67 with SMTP id p64csp2082051wmb;
        Sat, 10 Mar 2018 08:55:36 -0800 (PST)
X-Google-Smtp-Source: AG47ELuD/Afi+5UBnCowHGqrvCMOpkkoU3NtOXfl0qjtJYUR3V9nDDMAa5/8F7rZCnbDnQOxtkUw
X-Received: by 10.129.68.4 with SMTP id r4mr1370751ywa.240.1520700936742;
        Sat, 10 Mar 2018 08:55:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520700936; cv=none;
        d=google.com; s=arc-20160816;
        b=EqZoBz0O/mYkHyOaC0yBYUCDOn94j3DnvolzXYm2toKuVEBgMTMu6UEnS8UyYbbmXR
         LrW1z7l1X/s94hYc4FoC2nPlk5t78z1TW6lt4c3LqXoyTsRKQ7H5gzVESrxdTXQpIksc
         HDeqUiSzK0He6UHHxS/jsfC4/zUm3TsrZkfah4X4y4qk+4TJPfOjHHlNsvVEAuoGFq1q
         HzPodVcUq9P8A5XHIPouED55ELhFDqx76gm5Bun35nSuMUVOgMdRvL2H/RmI7htqrW23
         AXHbP7Qh6udJfr1bnVbKCxU92NFdGKB2Q0Hm10v9OHOPc8Yy2z0iY85lLN8l7SNHVvXq
         mtoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=02/s6e+2Jp3AtqQspbvL0nTIQZaQZ+NDZyv5UmyLhuU=;
        b=C1vMIm64mt3nvXWfEwd/7kShRYd8h7N8/wRXQnyP4NyNgjW+4qYajX+DQ7xul9G6R/
         2x6OUvVHzCGHgrw1kyWfidAgbMjvX010/n4AG8lQL6dWwlxh0GYVI5YWYTXiaJa/5p0N
         mNZ4w25mLc+nl7W1/2iO02IkFZiGq/b1/eXv3Oi8ghtsJA8/usDeDGJCvGiWEnAycwA0
         IZEvRA3nJKW/6eT+kyK+elDhlWA62NhUZsuuUfUkyIghrKODdwdURzWdDm+Xcc3i/wim
         Qh+fUdycFLgmOybo0koWKVLECUfQvPKw8Q9yeVe8ucDM4rofrdgx8NlyEXWXuWv3Pu5p
         cqoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y4k8jDw5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u31si654228ywh.40.2018.03.10.08.55.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Mar 2018 08:55:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y4k8jDw5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1euhmS-000863-7P
	for alex.bennee@linaro.org; Sat, 10 Mar 2018 11:55:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1euhmK-00085h-JP
	for qemu-arm@nongnu.org; Sat, 10 Mar 2018 11:55:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1euhmJ-00067l-Fa
	for qemu-arm@nongnu.org; Sat, 10 Mar 2018 11:55:28 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:36731)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1euhmJ-00067M-A7
	for qemu-arm@nongnu.org; Sat, 10 Mar 2018 11:55:27 -0500
Received: by mail-oi0-x243.google.com with SMTP id u73so9276760oie.3
	for <qemu-arm@nongnu.org>; Sat, 10 Mar 2018 08:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=02/s6e+2Jp3AtqQspbvL0nTIQZaQZ+NDZyv5UmyLhuU=;
	b=Y4k8jDw5KmCqdi5m8XIjJ8fE5hrPQ+BUsaXBV/vtDxgPJve0kRUxh93tpbs1Tng72W
	xR2uLHbk7Bgde7fLOx7XXDSOGRKQlbXgzVA70VlEROFMrMJ/t/lF/u6bkdJjojQBrWB8
	6ND+z+HDDWJA+a5zC8PTfElfV7kanaz5gIqXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=02/s6e+2Jp3AtqQspbvL0nTIQZaQZ+NDZyv5UmyLhuU=;
	b=f9u9bE5BNY/E0h6Cxf9ntssvFV5zDEtgTfu3JE5FyD5YJ3rX4N47zfg2s7vGjqvblA
	g2F3RXlvBhOPgz0F9sxIhfM+gI11FmIBLhGCgGBtjZVuq7unWB+3a8EzMXcV5kJDn0WA
	BJ1oTCeTpEzhRrkMC1Quyq6j9jJaPsh6lOumFabdh/P0ToA2i5r2jdtfmH+GzeQXIMRD
	Y9fWmLQKPoVWEyvUz9aUyD/Yk2g9/W+YhmfxDsTCqRkEFxc9o5893SZ1aaWEVtgvXaSd
	kL24B/mnXrL9Rni/Au7cHbr2MmZWIvUrNXzIVqRqgnDp3+TtROQZMrfblce6mk+aLZmF
	f3gw==
X-Gm-Message-State: AElRT7EmaLlU0d3U4SGtJGR/wk5ak8PL7YiYMX5G/G8BHCxwuUXB4NEB
	S5Diorsd4QeV5prYuC/SwHU1i7d48dPk+13te1jMYw==
X-Received: by 10.202.61.198 with SMTP id k189mr1492730oia.252.1520700926368; 
	Sat, 10 Mar 2018 08:55:26 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:2164:0:0:0:0:0 with HTTP; Sat, 10 Mar 2018 08:55:06
	-0800 (PST)
In-Reply-To: <1520632024-31535-1-git-send-email-linux@roeck-us.net>
References: <1520632024-31535-1-git-send-email-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 10 Mar 2018 16:55:06 +0000
Message-ID: <CAFEAcA8_2GLg83JR4NFd6dgF0C4mgy7PTEiLRj35JisCdEA=yQ@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v2] fsl-imx6: Swap Ethernet interrupt defines
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
Cc: Bill Paul <wpaul@windriver.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>,
	Chris Healy <cphealy@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kkAXEM9LGvpj

On 9 March 2018 at 21:47, Guenter Roeck <linux@roeck-us.net> wrote:
> The sabrelite machine model used by qemu-system-arm is based on the
> Freescale/NXP i.MX6Q processor. This SoC has an on-board ethernet
> controller which is supported in QEMU using the imx_fec.c module
> (actually called imx.enet for this model.)
>
> The include/hw/arm/fsm-imx6.h file defines the interrupt vectors for the
> imx.enet device like this:
>
>  #define FSL_IMX6_ENET_MAC_1588_IRQ 118
>  #define FSL_IMX6_ENET_MAC_IRQ 119
>
> According to https://www.nxp.com/docs/en/reference-manual/IMX6DQRM.pdf,
> page 225, in Table 3-1. ARM Cortex A9 domain interrupt summary,
> interrupts are as follows.
>
> 150 ENET MAC 0 IRQ
> 151 ENET MAC 0 1588 Timer interrupt
>
> where
>
> 150 - 32 == 118
> 151 - 32 == 119
>
> In other words, the vector definitions in the fsl-imx6.h file are reversed.
>
> Fixing the interrupts alone causes problems with older Linux kernels:
> The Ethernet interface will fail to probe with Linux v4.9 and earlier.
> Linux v4.1 and earlier will crash due to a bug in Ethernet driver probe
> error handling. This is a Linux kernel problem, not a qemu problem:
> the Linux kernel only worked by accident since it requested both interrupts.
>
> For backward compatibility, generate the Ethernet interrupt on both interrupt
> lines. This was shown to work from all Linux kernel releases starting with
> v3.16.
>
> Link: https://bugs.launchpad.net/qemu/+bug/1753309
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Generate Ethernet interrupts on both interrupt lines
>
>  hw/net/imx_fec.c          | 7 ++++++-
>  include/hw/arm/fsl-imx6.h | 4 ++--
>  2 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 9506f9b..d3ae7db 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -417,7 +417,12 @@ static void imx_enet_write_bd(IMXENETBufDesc *bd, dma_addr_t addr)
>
>  static void imx_eth_update(IMXFECState *s)
>  {
> -    if (s->regs[ENET_EIR] & s->regs[ENET_EIMR] & ENET_INT_TS_TIMER) {
> +    /*
> +     * Generate ENET_INT_MAC interrrupts on both interrupt lines for
> +     * backward compatibility with Linux kernel versions 4.9 and older.
> +     */
> +    if (s->regs[ENET_EIR] & s->regs[ENET_EIMR] &
> +        (ENET_INT_MAC | ENET_INT_TS_TIMER)) {

So if I'm understanding correctly, this is not correct-to-the-hardware
behaviour, right? Can we have a detailed comment explaining
(a) what the hardware does (b) why we're doing it differently
(c) what we would need to fix elsewhere in QEMU to be able to change
this code to match the hardware?

I think most of that information has come out in this email thread,
but it's easy for that kind of thing to get forgotten six months
or a year down the line when somebody's looking at the code and
the h/w spec and wondering why they don't match up...

thanks
-- PMM
