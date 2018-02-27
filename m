Received: by 10.28.71.27 with SMTP id u27csp5063872wma;
        Tue, 27 Feb 2018 09:22:36 -0800 (PST)
X-Google-Smtp-Source: AG47ELudNPg53DNUGctFH5cJUyHGbhVjhsS22wBdX5GCfLJ5sHyOKJuzF55YhKusUrfB6vXJFZQJ
X-Received: by 2002:a25:c89:: with SMTP id 131-v6mr10186835ybm.71.1519752156592;
        Tue, 27 Feb 2018 09:22:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519752156; cv=none;
        d=google.com; s=arc-20160816;
        b=pe3Fll1ClWbj2kx+vHxTQXbIfKt8/Af8WsH6CTOCzwRNxVk9SU7sqsruZ/eH3JEMrt
         XeUWqgk2z23KhAr22QZzjNaZj34pSdHAP0nHthjw1CNgmBODJ8I84PMQzlUQEG3rvqeO
         0jBJmAW547erunSGKDHWmq70MV5PuZaxJzxUTuHNIWBjrCYLQFt8O1VAsOP+aLFSRcIP
         oGB130M0yj+NMdXxiABSiZhsaLR47zz6aAqQESqK0VohlHq1dq5n+5yhug7OK2mkzMSu
         fN22fTwlDCl/YaePg5YeBw1IWDXlXrAPn0vwahVwHSzUYfaC5kmhLf7dTOICSCQ4DOLs
         DteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=tgNg5iDeWwupFqAFKDphzJwObW+ptQcU9gkB9BGsIYE=;
        b=VyOgZ4DZx/jR0t0acn/ryP4A6vcua3vUoe53ZyvOorZ46/73u1PdPOb5sXT6u2OUDD
         izu+7UD546eb4GFBeAMQBoKxtElGuX5IOTLvmG2AXqRkqDhAXJRuiQVNZl56UUEWMLD/
         e8Y4ZpltattMcnZGuQyjT3DLOCUadhTxjbpvYWi05t6KvbOteO3xZwmWKEYJNivwHmRd
         sbega7dK5ny+1TT3eQ4TOhBZxC/oBGpiRzFt0wm0DF95RhifMTL6TP8K0aG+tJCnYZ8G
         bMPVU/dXOT1MCL6Ncxxbp2JoaUm5kdkhjpRZSrKoOEEMfeiX9+3DSurjAXK4wesTdkIl
         MYSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iJBD7xGi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m191-v6si1882878ybf.344.2018.02.27.09.22.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 09:22:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iJBD7xGi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqixX-0003bt-VT
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 12:22:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqivH-0001tG-2M
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 12:20:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqivG-0003Nh-67
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 12:20:15 -0500
Received: from mail-ot0-x230.google.com ([2607:f8b0:4003:c0f::230]:36666)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqivG-0003NK-0m
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 12:20:14 -0500
Received: by mail-ot0-x230.google.com with SMTP id 108so4494008otv.3
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 09:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tgNg5iDeWwupFqAFKDphzJwObW+ptQcU9gkB9BGsIYE=;
	b=iJBD7xGiDeofyj9hK3WJAUdRmPdS1Um/m4Q1rtna2iZ4+zCdRdIkuYrG4KuhW2MqJZ
	qJwgk/TW1rXQ8sUpWnWpQn0jvfKOS0y1vZ0rbH+tIoMmyPlvkvcwIatpBrQ3oTCSsjNO
	sFGzmODY0FdFkGzWsLaN2WCP/hYBOYqQlMrm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tgNg5iDeWwupFqAFKDphzJwObW+ptQcU9gkB9BGsIYE=;
	b=gTAYytP4hFyeCU9zPHoy4YDlkMeQcxpO3wR9k0q9AZvMVSMwIuerpVzzX2rEmp56eE
	4GdFZi0wDzzlN3vXhJ1I7YD8cGyc+GII2WL0JCXE/HIlx7SmMnIno9p+Bwry+3ROfMJM
	vFWhjgDto4mpR0HlUwZX+tfi8BujoJBWh4xIwdduZafyqe20+0RoFgUjfZ4m3NMYZuxz
	XvBbY1jmJmi+UX5tnsxb3lHNj0T08LImAGGoxtLFlOUgKs75m9SIeWcLKBiruKXuSuWp
	pjQr1Mm+SSnUifeLnPHrO+57h3iRbVetnxl+3W5xlgv928SPrkwjZ0yyXVVJnQIwWJZw
	B68w==
X-Gm-Message-State: APf1xPAwXIRjXjy0L0R3aIUgIyrkv2lFBK1kMMCasBWYT5DhltQMECvi
	bgiRNew49j1oQozBcLOmIGYxXiZ/mbGlceGS6TWCHw==
X-Received: by 10.157.3.70 with SMTP id 64mr10441564otv.258.1519752013326;
	Tue, 27 Feb 2018 09:20:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 09:19:52 -0800 (PST)
In-Reply-To: <20180227104903.21353-5-linus.walleij@linaro.org>
References: <20180227104903.21353-1-linus.walleij@linaro.org>
	<20180227104903.21353-5-linus.walleij@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 17:19:52 +0000
Message-ID: <CAFEAcA9YnM9uKvdce8PrDLBYVaSiW07_9z0E0Moe0RZnxpeRrg@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::230
Subject: Re: [Qemu-arm] [PATCH 4/5] hw/sii9022: Add support for Silicon
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vDhKb3fpSdhg

On 27 February 2018 at 10:49, Linus Walleij <linus.walleij@linaro.org> wrote:
> This adds support for emulating the Silicon Image SII9022 DVI/HDMI
> bridge. It's not very clever right now, it just acknowledges
> the switch into DDC I2C mode and back. Combining this with the
> existing DDC I2C emulation gives the right behavior on the Versatile
> Express emulation passing through the QEMU EDID to the emulated
> platform.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

> +typedef struct sii9022_state {
> +    I2CSlave parent_obj;
> +    uint8_t ptr;
> +    bool addr_byte;
> +    bool ddc_req;
> +    bool ddc_skip_finish;
> +    bool ddc;
> +} sii9022_state;

> +static void sii9022_reset(DeviceState *dev)
> +{
> +    sii9022_state *s = SII9022(dev);
> +
> +    s->ptr = 0;
> +    s->addr_byte = false;

I asked about reset before -- can we just add
     s->ddc_req = false;
     s->ddc_skip_finish = false;
     s->ddc = false;

?

thanks
-- PMM
