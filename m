Received: by 10.28.71.27 with SMTP id u27csp2034730wma;
        Thu, 22 Feb 2018 06:43:17 -0800 (PST)
X-Google-Smtp-Source: AH8x224f7yKYCE6Qc8ZsAcjqiJHCdyOXo9c8fdlQ6hGm+Evp3klilItIQPbQuN97oSMep1WQ0pMq
X-Received: by 10.129.128.67 with SMTP id q64mr4875480ywf.376.1519310597187;
        Thu, 22 Feb 2018 06:43:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519310597; cv=none;
        d=google.com; s=arc-20160816;
        b=aOHmWvorDz5jckxboOn+VzBd6WyliHyZpUo8/qSEEjHcodqcrNFTwAnoUKxYPRKdtt
         O1uKXalvJo/Pntzk8PcEkWKzWsT4jpXaQ9KFMuJ0n5jle+OXQljYNJTVUe4OPzTqv6MV
         MASW7jsveoW9+HvyQERPUrQjkOY4c4i9b36iB4IKl9hq4bt3NjyHmOZ6z7fOm8VGXNO3
         In38EoITyW2y0+yLru2TyT8Ho9usxB1ewWhTEhHkhiWgJgp9RpK1zImFrpvCrb4xbLIO
         hUkB9ztGon8gMxb9gVDn2JXDRpJ7gjTAkRcAm+1dyMqdslatvfBL/kpvzEIIV7Yj+Aex
         rJEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dIAQ+KVgnCfILv436VN/G+D6KTo8h3hZw1NkZTPAV1U=;
        b=VG+/3oVFonpuu5tf9HK4ecLrjIfVoPJDsWdLco181ofUzCEJfXqDtdL8rlot8eM+Gr
         zY/m9kc27OrdmYZmyxPc+B8HZOdq4OxIHquLWbg6nybfctCp9RK2jFzQFr48WF8px72N
         eUpq9jidFKdq/dux+kl182COYTiJ/qFiKJ0P/oQcyNSPwHKbgefHP7e1/n6RZ3yBPcH3
         fpdCeaK8SMiXtLDG63XNGEXWgEJRRD04WnbIOq6TO2DrPICxZbobbLMCBwIX9ZxnWSNP
         anlKmxXpLz+C0CrMaemehVbqP7PmukBIS4oZr89DGJCLX9U9gSO/emu52akDIHJ/MgQG
         nilQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VhmXy4K3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6si34736ywc.412.2018.02.22.06.43.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 06:43:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VhmXy4K3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eos5c-0007E5-KI
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 09:43:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eos5U-0007D6-Gr
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 09:43:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eos5T-0004uR-Ge
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 09:43:08 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:36466)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eos5T-0004tF-BE
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 09:43:07 -0500
Received: by mail-oi0-x242.google.com with SMTP id 24so3837343oij.3
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 06:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dIAQ+KVgnCfILv436VN/G+D6KTo8h3hZw1NkZTPAV1U=;
	b=VhmXy4K31/fuiuzmnMpDkPY4Pzvkt6WzGOQKeN5vIw3tkMGHbgDyeXmTAf96MMIp4n
	+In3TpQjNldRiA6GvnhCqkixuMTbYxmamflu5ydDZbHoP4yv/QafKvnuAGx9FqqgWCkw
	bm7uKa7e2sdti83vfqTnToHBrmiXekL7ZTgY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dIAQ+KVgnCfILv436VN/G+D6KTo8h3hZw1NkZTPAV1U=;
	b=IqkjcxsV217PeneacLveK9sxNRiFyaP1I3C4HjM7/XTcVeSmUYQAL3um7cg58+x2pd
	UQGxDhOm+xwwdEpQ2TWN96trZi72glrEkbMaRezoMpfTafHJgWn1vuYwrK0R0bbNYuFJ
	k7ew618vbsvIt9mj4F7uHaEeNMbIi5ST4LBvY1n8v1xSxRKklxt+jLmcigb4TuztZbcK
	6fOO0bVgPslPHZ8aESME5ND7p273ilQ3Nm+vn7YT44dK5Rnhj/vTbOsOwgoPtoje+utR
	fd3rTTgEVhJgtUPdtQz9nTUm+UMxbsdHzu76sCWS2TZH93dDiigF+UQM9ulwF0YUBpmk
	LDUw==
X-Gm-Message-State: APf1xPDMEoXMutLU05MdGalXIxY0p8GKfFCgVQyIqIePMn4bwCq7s1y3
	iinykHbIuqWhGLyPnaHpekrDH1esem5tHL6AVEH38w==
X-Received: by 10.202.55.139 with SMTP id e133mr4406501oia.11.1519310586429;
	Thu, 22 Feb 2018 06:43:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 22 Feb 2018 06:42:46 -0800 (PST)
In-Reply-To: <20180217140051.22731-2-linus.walleij@linaro.org>
References: <20180217140051.22731-1-linus.walleij@linaro.org>
	<20180217140051.22731-2-linus.walleij@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2018 14:42:46 +0000
Message-ID: <CAFEAcA8QVBRLs1ZfgMP1nTUG4xQJRH9WrwxdXzrwAR8pZJJ4ew@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH 2/3] hw/sii9022: Add support for Silicon
 Image SII9022
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9fmqZebRRp73

On 17 February 2018 at 14:00, Linus Walleij <linus.walleij@linaro.org> wrote:
> This adds support for emulating the Silicon Image SII9022 DVI/HDMI
> bridge. It's not very clever right now, it just acknowledges
> the switch into DDC I2C mode and back. Combining this with the
> existing DDC I2C emulation gives the right behavior on the Versatile
> Express emulation passing through the QEMU EDID to the emulated
> platform.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  hw/display/Makefile.objs |   1 +
>  hw/display/sii9022.c     | 185 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 186 insertions(+)
>  create mode 100644 hw/display/sii9022.c
>
> diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
> index d3a4cb396eb9..3c7c75b94da5 100644
> --- a/hw/display/Makefile.objs
> +++ b/hw/display/Makefile.objs
> @@ -3,6 +3,7 @@ common-obj-$(CONFIG_VGA_CIRRUS) += cirrus_vga.o
>  common-obj-$(CONFIG_G364FB) += g364fb.o
>  common-obj-$(CONFIG_JAZZ_LED) += jazz_led.o
>  common-obj-$(CONFIG_PL110) += pl110.o
> +common-obj-$(CONFIG_SII9022) += sii9022.o
>  common-obj-$(CONFIG_SSD0303) += ssd0303.o
>  common-obj-$(CONFIG_SSD0323) += ssd0323.o
>  common-obj-$(CONFIG_XEN) += xenfb.o
> diff --git a/hw/display/sii9022.c b/hw/display/sii9022.c
> new file mode 100644
> index 000000000000..d6f3cdc04293
> --- /dev/null
> +++ b/hw/display/sii9022.c
> @@ -0,0 +1,185 @@
> +/*
> + * Silicon Image SiI9022
> + *
> + * This is a pretty hollow emulation: all we do is acknowledge that we
> + * exist (chip ID) and confirm that we get switched over into DDC mode
> + * so the emulated host can proceed to read out EDID data. All subsequent
> + * set-up of connectors etc will be acknowledged and ignored.
> + *
> + * Copyright (c) 2018 Linus Walleij

Sanity check: really copyright you and not Linaro ?

> + *
> + * This code is licensed under the GNU GPL v2.
> + *
> + * Contributions after 2012-01-13 are licensed under the terms of the
> + * GNU GPL, version 2 or (at your option) any later version.

If this is copyright 2018 then what parts of it are not covered by
the "contributions after 2012-01-13" condition? Could we just have
this be GPL-v2-or-later, which is what most new code is ?


> +static void sii9022_reset(DeviceState *dev)
> +{
> +    sii9022_state *s = SII9022(dev);
> +
> +    s->ptr = 0;
> +    s->addr_byte = false;

I think we should reset ddc/ddc_skip_finish/ddc_req
here too. I suspect the state machine logic means we
can't get to a place where their values are used once
we reset ptr and addr_byte, but it's easier to reason
about if we just reset all the device's state.

I agree with Philippe that we should use trace events here rather
than the DPRINTF macro. Otherwise the code looks fine.

thanks
-- PMM
