Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11337595wrx;
        Tue, 26 Feb 2019 09:55:34 -0800 (PST)
X-Google-Smtp-Source: AHgI3Iax4DlDMNP+lHiV9Bn1crjW904FlTzHXBYFo+AYLalqYBBup+FfjsyA8F4qqx1DoNMF0Pep
X-Received: by 2002:a81:1a03:: with SMTP id a3mr18607251ywa.429.1551203734412;
        Tue, 26 Feb 2019 09:55:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551203734; cv=none;
        d=google.com; s=arc-20160816;
        b=T80t8n7YoGWvH7DvRK5gCpKHtRNQJyf1N9rmOSjuKNE9TvnPQyTHrNc2QAPLDnuk3Q
         ZFh3yY+chpt08fDVguj4B0BYpsoLLYlLLcgN6YRkQxnCKydEu75dMvIrCr+8bfEUObcJ
         1M0Ee+NslYhAKGkiWJwNcuKp+O9t+gU1SSyOMQ3IMkeDxENyhVzdSG/mJacPxM/8RYy4
         IjYhRaRNQkqUTWywOKSzZFZsuQKCea1Ar6M0EL4mDSg2odINNZzVPAChlY7LNTufaDyf
         abUukfL7/RPg80hPbkjQOyqGCixEXgl7kfOTjm3Cq/vBcFlgi9mM53tk45Kaj/RTuIdw
         qCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XIJSGsX1nIgjg+XjE8alWkFME6oQK89rU0oo+s1U630=;
        b=oboBKc/o3M3SPHNsjhCTnSHyc6qji6eiIq2GJCaMsa0eOWGSra6ibbWyNagugLlJLd
         +9s0CWY4HZkLmkiUbxxGUd+BQILg2SeDiJSrPssuMGlASzbSy8iZygR1GNYI4qlDqZgx
         YulINDwQYYrcIO9AHrg6wBT3tl6zP18tNzSmI98RlVNJpqXRcaFndWeSTMzXIal9zrbp
         aph6+4MzQltHEDHbpgsnfF/UpxAzdW0uRlxNuQMw4vZ4acE9RIng+Z9NM7H/pynkgP+p
         txjM5s5RArBKkzgTVw5JuKx2i/SeHByb3IbquefsuA3TZN+mjaprL+r/jkUGkCINpwDl
         iY3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sQVma21e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si7397780ybp.433.2019.02.26.09.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 09:55:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sQVma21e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:59151 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gygx3-0007ZU-VA
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 12:55:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gygws-0007YL-HQ
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 12:55:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gygwq-0004UH-Oe
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 12:55:21 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34348)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gygwm-0004Eh-Lo
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 12:55:18 -0500
Received: by mail-oi1-x244.google.com with SMTP id g16so11102132oib.1
	for <qemu-arm@nongnu.org>; Tue, 26 Feb 2019 09:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XIJSGsX1nIgjg+XjE8alWkFME6oQK89rU0oo+s1U630=;
	b=sQVma21e6UF8Bsu1PCJOFvQ724zubvEMo1RFqj3KG7tIYK/hhqWZJOqIJQ0BSYJ9sX
	4qPxyU5uf6mc9LDA5WbapMJE36drwdgviU0H/pxboKPSpx5Jai/9CE04giNwebT+0vdl
	lOPWmmDa3xwk+UWP+A3pNbetX7NY/mIFKhwf+FgqhlvIBbZxRhOLAoHuxsBkt//UcTs7
	xxAVAMsf1GBK+mRJ/izVpzbR3tW5fkfd5C+vg9jtXJvtklfcDF77QP29J4hNdqpTMEk8
	nBFp5jCL0avWs6ksZ7zodrTdm5Fkl93lUf1kwmrvlKaWCf3PcNHhN3CZDAdPx48yB5b2
	ZhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XIJSGsX1nIgjg+XjE8alWkFME6oQK89rU0oo+s1U630=;
	b=QzRBvS4ihYteTP+E/4t0A2Q5o6MWWZVGCXs5OoeM0taY1900F1WFBOe92aHNTmGiXX
	bIQcFxHrluTqwIE4wDMIMNr+Fma6jnjZCU5Br0LCUL+dWxgeOizmxeef6WG8RMUSF7yJ
	RImO1qXgfma21tFB4A1TBKjZd8Yl29gxj+JlceAyrRmFTgZtEnjZ9syeFuWpj2b2bJOE
	Pmja7JXvxxT/FXrq7oFKYNT1pYQfB5Pmo6fQOHOaLhMLSSwlBLGnf5YkswuDr6Y/RyWM
	bwLgLiUqdBgM/T6wOrQii5Rf7sA8uACCFIJjLBEoi3LRICo19YXZZd9Le7q05fYEEHvh
	CfvA==
X-Gm-Message-State: AHQUAuZ7v2Rbhqwjm5a12c/yt+m6jFmqId1ocu3pKIeq37+MmjVAomRn
	o/PZD7pWs2iMhtON3ZTTYz2BYgc+qLcOnX4jzVdrGA==
X-Received: by 2002:aca:be02:: with SMTP id o2mr2953245oif.48.1551203701315;
	Tue, 26 Feb 2019 09:55:01 -0800 (PST)
MIME-Version: 1.0
References: <1550878686-23934-1-git-send-email-michelheily@gmail.com>
In-Reply-To: <1550878686-23934-1-git-send-email-michelheily@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Feb 2019 17:54:49 +0000
Message-ID: <CAFEAcA9=rswhCNXE6zgzN_S5QDTy_4sfHnsy+buyOzdRSKVFcg@mail.gmail.com>
To: michelheily@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH] hw/arm/stellaris: Implement watchdog timer
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
Cc: "open list:Stellaris" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WC4rzuSObQ3f

On Fri, 22 Feb 2019 at 23:45, <michelheily@gmail.com> wrote:
>
> From: Michel Heily <michelheily@gmail.com>
>
> Signed-off-by: Michel Heily <michelheily@gmail.com>

Hi; thanks for this patch; it looks pretty good (though
it does have a few issues). However, it turns out that we
already have a model of something that's practically the
same hardware...

I would suggest that you look at the code we have for
the CMSDK APB watchdog in hw/watchdog/cmsdk-apb-watchdog.c:
I think the semantics of that device are almost identical
to this one, so rather than writing an entire new device
model we can just parameterize that one to behave as the
Stellaris SoC requires. I think the differences are just:
 * ID register values are different
 * the control register doesn't allow the RESEN or INTEN bits
   to be written from 1 to 0, only 0 to 1
 * the WDOGITCR register doesn't exist
 * new WDTTEST register at 0x418

So we can just implement the Stellaris watchdog device
as a subclass of the CMSDK APB watchdog -- you can look
at hw/char/pl011.c as an example of how to do this
(in that case we're modifying the standard Arm PL011
UART to make it look like the one in the Stellaris board) --
and then make the CMSDK watchdog's code conditionally
do the Stellaris-specific things in that case.

thanks
-- PMM
