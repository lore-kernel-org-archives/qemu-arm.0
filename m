Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6307199wrv;
        Wed, 7 Aug 2019 02:33:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzAvpPP6KboRthmxQKtqi8NuuPqu7VKQLr/2vAnTO09btb0UVlanZMbEHc0c/zKgqJ4aCnp
X-Received: by 2002:a0c:9214:: with SMTP id a20mr7247465qva.195.1565170414928;
        Wed, 07 Aug 2019 02:33:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565170414; cv=none;
        d=google.com; s=arc-20160816;
        b=gnxN6HJ/iHEJifaBLfbpqzQm8IqLKdAFs4aW5kTlFcwL/T9yhHu0WDXaVJS9rcixue
         ad3Od/PAPiLguqZayNqd8kAZeCRTmib+uMyWBqIyjMrN1U8AjRmy2jbf4KkhlVBCIkgd
         oxDRJWWpZympbVPyhn+VDXie29tw7ucJwlq2A6HgKRWMAkd42n6OTM1wtoJ2wK6AywUA
         gWddEZjhiqg7HMJu5FbBqu9J9OErB9MhFv5Q+4QTS8V02wc+uHKCCyxeG60eDstkRHWY
         szv+Rs8SLS7RrNQafEJ9d04fZGimA2RNqIHjAkXbJbXVakJc6nWqgGvFqKktl8n133/q
         /GcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6j1brw/JDjSUv3md8bS30d2/5N/78wTkxYE/O/zj6cI=;
        b=zTYc2tMt0uCCNdBXRaS6UkelAPKJzfdJmyLfNHZmOGFnaFuDN9DeMKIwo2VO7eNMUn
         I0rkAhcCr5tHIsNxwFPlrym2/VyyIh52KpqD5nqRp6wmDxJA6wkSOlzFn+J3aW/8K47r
         BNppMiyI3JYGS8QMNItf4zC9+HXTgvqvOG6NQ9XyA0zLGRFdCtLi2HsihIJnA/ynzTYy
         2h/P2yCe5484eSk7zpdyAnm3tnB3jqxUghJavYnuC+YPU6erRcgQJtEhWQ0iQPXSkrcR
         P+b9pNIIdHu50s5kg5tmaxwCNZGOt1jaJ89TjN8Ym74kzE7guqrpIhn0dSrA952OtyGD
         MSlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J43tOgj3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si4004526qkg.67.2019.08.07.02.33.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 02:33:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J43tOgj3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvIK6-0002eN-Gv
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 05:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57825)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvIJp-0002Fk-K8
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 05:33:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvIJo-0001Gp-L1
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 05:33:17 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45498)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvIJo-0001GB-Cu
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 05:33:16 -0400
Received: by mail-ot1-x343.google.com with SMTP id x21so8386565otq.12
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 02:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6j1brw/JDjSUv3md8bS30d2/5N/78wTkxYE/O/zj6cI=;
 b=J43tOgj3BghWr49bCyQuuyrIhHNByOqaOUWUzm8dUVwzcMpeGJAaniUHeeeKqCNRGt
 +ZtdFW/+qa3ZDtWcT0h/7NBoIZqpX/ZxXoPnA5c02HowEsIIvC5KBYHVNNg/UplOztu6
 68D0fdYP7KHc8zim4xObBzgo58/prFqkFkZgY/P7lW0sBuAw4wS64vz/sQnDL8oPRSKx
 G+yHnq3EZUgBjvv4y3cHs3wI++o0NC3gWng/ntpQNzI9oQt5CzoQePba2i+5lZQT8Ey8
 advKEfRk/LONuNjUsmxR2B6kmFWpEgSckMp1ejifPWMvBivDOiHSMnNUyLIRxmhJP3CP
 ShgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6j1brw/JDjSUv3md8bS30d2/5N/78wTkxYE/O/zj6cI=;
 b=QHVf9wFh4CxnrA7/jVaJw6SRa8lZCYBVqhfb5KQC7kEKNbm2Xy2CyiP41UBXrcAUAL
 Gxg5Oa43FccCv9DEf5J+IALx2NHCXKKlES2y+6H+lFjDMzWdFpjgB/7QP5wfZ+83p9Uq
 HUdZM709ea8XDZiRmat1nAnQ73GE+Yt4ReTVBdGPjz5OYcT3ZZ7XM6iFNo/to4vmnjA0
 Q8c7qPhE5Z8OH4sgfFxNRaV8IRdTPMBWD9HnbIq5XkjMIqc5eW3I+Ox0+g2olj+QgFKq
 631ppE+GfdFr0anhXYxxXmLkzahxiGja6Xa1IkXNGt+n0fyT6NRk9NZEsDTz0cBSurIT
 IjtQ==
X-Gm-Message-State: APjAAAWezM86xladcl0mD9M17xQuh+SiBmUEPZ9L5LBKCAL6xWQ9jB6a
 VnCFJXUf6qvwR2XuQeynRtU41Eoo5dB7cdUO1ifqtA==
X-Received: by 2002:a05:6808:8c2:: with SMTP id
 k2mr5457633oij.98.1565170395357; 
 Wed, 07 Aug 2019 02:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <1561574604-1204-1-git-send-email-eajames@linux.ibm.com>
 <CAFEAcA8W44gYFgU7qP9wOUSwZ7xFqqZ+2eWr=0hjKps=qvQMnw@mail.gmail.com>
 <057e55ed-c8f1-8c69-f7f0-c95df5955525@linux.ibm.com>
In-Reply-To: <057e55ed-c8f1-8c69-f7f0-c95df5955525@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 10:33:04 +0100
Message-ID: <CAFEAcA_W_9bn3RRLTorrE6uK4WUMwyu5F0Eg2sk6U6P7D3JrUg@mail.gmail.com>
To: Eddie James <eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH] hw/sd/aspeed_sdhci: New device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BqNIu9iID1GR

On Tue, 6 Aug 2019 at 23:12, Eddie James <eajames@linux.ibm.com> wrote:
>
>
> On 8/5/19 9:31 AM, Peter Maydell wrote:
> > On Wed, 26 Jun 2019 at 19:43, Eddie James <eajames@linux.ibm.com> wrote:

> >> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> >> index 7b80b1d..51a733b 100644
> >> --- a/hw/sd/sdhci.c
> >> +++ b/hw/sd/sdhci.c
> >> @@ -213,7 +213,13 @@ static uint8_t sdhci_slotint(SDHCIState *s)
> >>
> >>   static inline void sdhci_update_irq(SDHCIState *s)
> >>   {
> >> -    qemu_set_irq(s->irq, sdhci_slotint(s));
> >> +    int level = sdhci_slotint(s);
> >> +
> >> +    qemu_set_irq(s->irq, level);
> >> +
> >> +    if (s->irq_notify) {
> >> +        s->irq_notify(s, level);
> >> +    }
> > Rather than doing this, just wire the irq lines from
> > the SDHCIState device up to your AspeedSDHCIState device,
> > and then have that update the register state and assert
> > its own irq lines outbound.
>
>
> Sorry I don't follow you at all. Isn't that what I'm doing here? Surely
> I need to take action when sdhci_update_irq is called. I don't see any
> way other way to have my code called at this time.

The way to 'take action when sdhci_update_irq is called'
is to be the function on the other end of the qemu_set_irq()
call, ie be the device at the other end of the qemu_irq line.
You don't need to modify this code in sdhci.c at all.

thanks
-- PMM
