Received: by 10.28.91.67 with SMTP id p64csp844864wmb;
        Fri, 9 Mar 2018 06:19:38 -0800 (PST)
X-Google-Smtp-Source: AG47ELs41v+S60hlJ76JmjhK0JodQ9CCY9wmOim0QR0A8YNcR0EtGzlycIeMTjXW1zLGRAs+5UZy
X-Received: by 10.129.92.134 with SMTP id q128mr4058467ywb.138.1520605178090;
        Fri, 09 Mar 2018 06:19:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520605178; cv=none;
        d=google.com; s=arc-20160816;
        b=Kb+KRyNBGGAe3LsuFSyDvfkikA/0VREprFvSD4JtDx2WCMqrng6+eLTeZXE9D53v1s
         /bYl2kAVxL9vfZUsngMp6jW7Xsw+6xn6nc9cRej9GANiMtOgkPDfivlsWDDxHKBoDVXr
         JFwwX7ikMak7wZcBBJFdnDOvtIECuPII1l8PDRjeBg+aVChn5qyFZXTEok6JYnDPbnVD
         6Qah1OpjR/Xvda/G+xd3wM7NK5W7x/5X+uC1WVjNK6RX7p+u45kH36xyraQSV2C3bD1q
         mrv2txzHPWL1QVa821hplaqVhn9hcr0uzrYTijkRNRp0YmXv5qknfIchgojQcYzxGPpI
         TBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=A/HpASE8f5OHaoBUpmgRouzkb1d1eKsK7P8RgF6WziI=;
        b=YZL8aYH1JHJirtbUfA7z4N1F6469ewqlrgccLQyV+T/mZSWypxHgeJ3SmhABZJPBsi
         cVRe/0bXaJwj84Mk0VNEJjPiFhaYLUDQt2bVSPqLmqqrhcO3q6wedRDAmaXkVJmro3L3
         uaQ+T9fnfLXNjVw6CF7OmdGX4CUT05LCLUlbLCTJvtlKxmXqyt32JVwW4oMbzAOAcEDv
         wlqBtqvhUVX+ExTu7QrnvT+bwPPnh1jA18sHREgCg3patqBHzabyxDo/8XQ845KB1NrI
         tYfrGs/gE14JSrpFP9sHXE73itoFUGemwIbMDgPC5QTGZx5dsuvZsJgrBCK5x0kYwwxS
         Ehvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gxASBIye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y189-v6si182056ybf.596.2018.03.09.06.19.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Mar 2018 06:19:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gxASBIye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1euIrx-0006Cg-IL
	for alex.bennee@linaro.org; Fri, 09 Mar 2018 09:19:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1euIrh-0006AN-8I
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 09:19:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1euIrc-0004YO-CO
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 09:19:21 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:34599)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1euIrc-0004YB-6n
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 09:19:16 -0500
Received: by mail-ot0-x242.google.com with SMTP id n74so8808081ota.1
	for <qemu-arm@nongnu.org>; Fri, 09 Mar 2018 06:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A/HpASE8f5OHaoBUpmgRouzkb1d1eKsK7P8RgF6WziI=;
	b=gxASBIyevEQ+rLuXx8IApizFHvisuRAjarGzt3h/W434528B6pGaJ/Z/2L38tBzce9
	e5P77XJWD8mvV3GfXv8oGWE9i1OOtI3OCUmnGAsgzhpPLLOIUTwqCrbblu9zfkBCZinE
	QFbxQ3t4N67PsE03NmYJvfZvsO+1scqSV/BgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A/HpASE8f5OHaoBUpmgRouzkb1d1eKsK7P8RgF6WziI=;
	b=L0SSsgB9rJ2xwqdLLFUvLxuwrTyK+8BOvl5+aTVCjRFS2Xf/+w3Qt2GW1sbQVNKERT
	3qQ9nyqbfB0PeZgGOOEiI2QlMJoMpX11hhXZBFFRJU9JJsX8d0W+V1sq5Xyj5xOIA5Pj
	Wnx2rc8BvQV/ooAz0d8kwqCAmQnjUKX1ITX4vdUlPPBML0/MExXihW7bXrg675B18+wf
	DJd9yZEDI/+rr27LH1d9ucP+Ns5sMUNo2QnAGzeRKXYBqCAjTPw76FG6niCDzZTUpOxl
	urtw5qoAOtGyU04JX4fv5CPC+ldRH8LdO88IGyiXwP7ZnpLpOh4g64FLLsbXY1t46Z+V
	5/rg==
X-Gm-Message-State: AElRT7GTGmjXM9LzXuvAxJMEb3uAPtRcJ8efxW2ZQbUOpB6uEO6CFArF
	pKVgHJuE7xUIv/hIkkrE+Zyf95lugUM04YyIiE20XA==
X-Received: by 10.157.3.70 with SMTP id 64mr20435407otv.258.1520605155369;
	Fri, 09 Mar 2018 06:19:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Fri, 9 Mar 2018 06:18:54 -0800 (PST)
In-Reply-To: <2d530201-d5f3-1b02-17a9-1c2ed9e2d5e2@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-6-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_4ANVq-Rd63R7BOhd2axy7_Jn-BchzAksKR6g7JbjnTA@mail.gmail.com>
	<2d530201-d5f3-1b02-17a9-1c2ed9e2d5e2@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Mar 2018 14:18:54 +0000
Message-ID: <CAFEAcA8or88+BG48VbWyVf3jg6xkw1+3AXvg49pg6dn5SRRF0Q@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v9 05/14] hw/arm/smmuv3: Wired IRQ and GERROR
 helpers
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lBrYio5DqkE8

On 9 March 2018 at 14:03, Auger Eric <eric.auger@redhat.com> wrote:
> On 08/03/18 18:49, Peter Maydell wrote:
>>> +#define smmuv3_eventq_irq_enabled(s)                   \
>>> +    (FIELD_EX32(s->irq_ctrl, IRQ_CTRL, EVENTQ_IRQEN))
>>> +#define smmuv3_gerror_irq_enabled(s)                  \
>>> +    (FIELD_EX32(s->irq_ctrl, IRQ_CTRL, GERROR_IRQEN))
>>
>> These are only ever used in smmuv3.c, so you can just move them
>> to there (and make them inline functions, ideally).
> smmuv3-internal.h contains helpers, macros which are only used by
> smmuv3.c . I though this could avoid putting too much code in smmuv3.c
> and would help in the readability.
>
> what is the exact benefit of transforming those into inline functions
> instead of macros. Not meaning I don't want to take this into account
> but to improve my coding style ;-)

You get the benefit of type checking (and it self-documents that
the macros want to be passed an SMMUv3State*). You don't have to
worry about trying to write your macro to not evaluate arguments multiple
times. These are one-liners so they're fairly easy to read,
but when you get to 3 or 4 lines you end up with a lot of '\'
lines and the inline function is I think more clearly better.
I prefer to save macros for cases where you really need a macro
and can't get the same effect with a function.

thanks
-- PMM
