Received: by 10.28.71.155 with SMTP id m27csp4688040wmi;
        Wed, 4 Apr 2018 03:19:42 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48j/qm8nnwejThh+DMKl2b3zZqqBczIRauxZyxfZxx31nWetn3DiorZBIRoG7nzgyM28wA3
X-Received: by 10.55.148.1 with SMTP id w1mr22882667qkd.354.1522837182604;
        Wed, 04 Apr 2018 03:19:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522837182; cv=none;
        d=google.com; s=arc-20160816;
        b=Hx2rtFWI57YBQQRYaZUVAAEV/5u4BOvGzezl75GFZUVThGrCp5vi8bzqXY+7nJFXJU
         Xnb5ANyEZGx7Cp7/XV3XlARsWLaGSlIYlixJZRAOUa+eo+Ntt0/qzyY13dINSrO+YInk
         ghc+QI2o5sk6IzITp9lxEZxgqnZsMQ2SJS2E7nTndmNQT9zdgSolVZxrqgCwdGP+lkPF
         N5UK67bqUNhOSjSyT4eIII4+lC7Fioc+FlyX+0id+eNBUqSZeNkHHXi93MV0viLvRE9S
         rgFuXQl1tRaVRRmVa62vr2x73C1u2WiP48ICeLHS3o53eQMxMuSn5AQmY84izCeQYB/a
         tgLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=1IzgDdKemNWE5FTskxpbShLfkBzCfJhsP7NkFf3h1B0=;
        b=AKsfHxjYyz8UBpPtF4lInB1e42ubjZSgupVMvbpDPgHeHa2GC8Nom+uUGjjpVjelV+
         EJa5t6B4XRngPqv88U0SgK70jqiJs3I6Zo/oB17rv3XLh8d/1zZy81wjIBhfTF9QMT3T
         2/ZjprKLQ8oKJpWQK+lUFlgXsd9YpAxu6NjaMD0F57rPfdBrI3k5i9y4P3w0Z1ngpJao
         dKGpksuCLsTCkQny/eyq3vfdWRy6FtFNwPP4pi/zlaKs732Iyj6jL929MQ1+NBK+xqFa
         eQWY+GhZ3Gsv4qj4ugMNHKsSILSjUOSzLvpoxC0dMGICMM5B97K2tdewTivU194lmDWe
         lcuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YdNHxa/n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v46si5776980qtc.228.2018.04.04.03.19.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Apr 2018 03:19:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YdNHxa/n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f3fW2-0007ja-4i
	for alex.bennee@linaro.org; Wed, 04 Apr 2018 06:19:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f3fV7-0007Ca-0x
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 06:18:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f3fV6-0007MU-6e
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 06:18:44 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:41139)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f3fV6-0007MN-18
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 06:18:44 -0400
Received: by mail-ot0-x244.google.com with SMTP id i28-v6so22729895otf.8
	for <qemu-arm@nongnu.org>; Wed, 04 Apr 2018 03:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1IzgDdKemNWE5FTskxpbShLfkBzCfJhsP7NkFf3h1B0=;
	b=YdNHxa/njrU/Ybutq64leVinuXZF6ne0WTt9AJTtdPwC98wZgzzBT2R4gnpZqiggvb
	+qHgHax5xutsb+KdpE2qi6b+8NL+Qfhjjj234hx1aixi/RWTU/ZCd4ExVvd9P0/DPsD1
	6Du3S2IQwnrku98bUXYis+s851uj+J5w92XOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1IzgDdKemNWE5FTskxpbShLfkBzCfJhsP7NkFf3h1B0=;
	b=Quipsf87x/KLcA0AUimiqqGly+r5iDOdjo1Q5YFNL2DJi8enhqk7iQddfy858U1KHL
	YZk4mcI/Y3xrV6k4MwtvP+YCdPuRNZjzi0d17Izgcw2Q1fWLr+uUwaDRa3Q1O2sacVjC
	tWaHGmbB11C83MUGv60SvS8XhHlyAyL+yX3VsFjy2CwiaQm+UAIAsw/EnEsZICtY2MOH
	/kDI/AXu4gMRcGTJlpntirINQ3JG6t7kUxeSkFgUTiLETUulx3JmEUaR6t3r5vAhjFBV
	sf7O8ifk19NOfATA4yYFp0y74IWNH0btlEqTtkQqXQp/uLkAzAUJdA7a4ev9uxLj8qTv
	cyBA==
X-Gm-Message-State: AElRT7E4RsQp9E9CJmil3u9LvQwh551yEtp+Rswo4PDaVNHr5NxZQzpe
	0fS66QOKjgTyOK0i3N1/SxDMtRgCjO9MKZ9zDNoxBIh7
X-Received: by 2002:a9d:56f0:: with SMTP id
	b45-v6mr10970422otj.294.1522837123353; 
	Wed, 04 Apr 2018 03:18:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP;
	Wed, 4 Apr 2018 03:18:23 -0700 (PDT)
In-Reply-To: <20180319161556.16446-1-peter.maydell@linaro.org>
References: <20180319161556.16446-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Apr 2018 11:18:23 +0100
Message-ID: <CAFEAcA8trs8tMKBqbOLaNx4OR9H9+xO4jJQjY2+yeCNdsdCBCA@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH for-2.12 0/2] bcm2835_sdhost: fix interrupt
 handling
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qz8LYy0NI6Yd

Ping for code review, please? It would be nice if our 'raspi3'
model for 2.12 was one we could say actually booted a known
Linux image...

thanks
-- PMM

On 19 March 2018 at 16:15, Peter Maydell <peter.maydell@linaro.org> wrote:
> This patchset fixes the code in the bcm2835_sdhost device
> so that it raises interrupts in more plausible places.
>
> The Linux bcm2835_sdhost driver doesn't work on QEMU at the moment,
> because our model raises spurious data interrupts.  Our function
> bcm2835_sdhost_fifo_run() will flag an interrupt any time it is
> called with s->datacnt == 0, even if the host hasn't actually issued
> a data read or write command yet.  This means that the driver gets a
> spurious data interrupt as soon as it enables IRQs and then does
> something else that causes us to call the fifo_run routine, like
> writing to SDHCFG, and before it does the write to SDCMD to issue the
> read.  The driver's IRQ handler then spins forever complaining that
> there's no data and the SD controller isn't in a state where there's
> going to be any data:
>
> [   41.040738] sdhost-bcm2835 3f202000.mmc: fsm 1, hsts 00000000
> [   41.042059] sdhost-bcm2835 3f202000.mmc: fsm 1, hsts 00000000
> (continues forever).
>
> Move the interrupt flag setting to more plausible places:
>  * for BUSY, raise this as soon as a BUSYWAIT command has executed
>  * for DATA, raise this when the FIFO has any space free (for a write)
>    or any data in it (for a read)
>  * for BLOCK, raise this when the data count is 0 and we've
>    actually done some reading or writing
>
> This is pure guesswork since the documentation for this hardware is
> not public, but it is sufficient to get the Linux bcm2835_sdhost
> driver to work.
>
> If anybody has other OSes than Linux that use the sdhost SD
> controller (not the 'Arasan' one, which is a different bit of
> the SoC) testing with those would be appreciated. If anybody
> has documentation for this hardware that would be even better.
>
> With these patches plus the previous set, I can get the Debian
> raspi3 image to boot (though there are a lot of warnings relating
> to the pl011 UART for some reason).
>
> thanks
> -- PMM
>
> Peter Maydell (2):
>   hw/sd/bcm2835_sdhost: Add tracepoints
>   hw/sd/bcm2835_sdhost: Don't raise spurious interrupts
>
>  hw/sd/bcm2835_sdhost.c | 51 +++++++++++++++++++++++++++++++-------------------
>  hw/sd/trace-events     |  6 ++++++
>  2 files changed, 38 insertions(+), 19 deletions(-)
>
> --
> 2.16.2
