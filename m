Received: by 10.25.77.65 with SMTP id a62csp2568358lfb;
        Thu, 16 Feb 2017 09:10:49 -0800 (PST)
X-Received: by 10.55.80.136 with SMTP id e130mr3547142qkb.52.1487265049614;
        Thu, 16 Feb 2017 09:10:49 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s68si5642293qkf.118.2017.02.16.09.10.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Feb 2017 09:10:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48021 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cePZw-0002wH-VQ
	for alex.bennee@linaro.org; Thu, 16 Feb 2017 12:10:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceP7C-000576-IB
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 11:41:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceP7B-00010T-JS
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 11:41:06 -0500
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:37918)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ceP7B-0000zo-AH
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 11:41:05 -0500
Received: by mail-wm0-x229.google.com with SMTP id r141so19657024wmg.1
	for <qemu-arm@nongnu.org>; Thu, 16 Feb 2017 08:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3FjgmndUxdq9OeXtnGsGPTQmGDeHsImP/Ib3haZNQOg=;
	b=i1HtOmpNv9OVXlJapoQe7pkvfISlsdOKx1QUav8Nc9/WVDXfnAD1ozkMAw7Rb/bmOI
	iwf59DYynZ6x6LnACV5Rr5ZYuFefEuVUk5aw3+LXTGrCxdI9UzDJKBmFlevxbLJAslMk
	zfhxeKVqonbll2yHVw8iCRl7TA0gPa5gfQWEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3FjgmndUxdq9OeXtnGsGPTQmGDeHsImP/Ib3haZNQOg=;
	b=rul/i9stqvTEiSfKp/VAMhgDI20cQbgut5PvMYg+JYOznoR2YbaWrIfIvaEjKBai39
	HAk+2JNABxHPxUUsyKSoEsstMTHMCqk+2ho5TzQRoII3VxIaTxvw22cKnDnlwboVxZVg
	GnqJENx6JWRbDVXCC7ajCpvFa9fQti49c55ahjd2IiuDyR/4msgHNODRclP1Y3UiCI0S
	WN9ca/Qs46tbR+RaHXtDS0eWUAukyTmcn6aUwr+I75LCAij9ZIRZ5Y96Cu78fZCpG4Bo
	4k9lo9Y2VPKcHC3WXmRRfBubzgIBJsmMQEZQGLlCj2FrJTSOSfU9XCEB/3JwTYoYojIh
	BD6A==
X-Gm-Message-State: AMke39liv/Vl4QP9U2xLCw43s3S1UYynuChPf203lKHZulMww+GedoOqOvN303edmZMp95+0dwBzfEVOV8Va7H93
X-Received: by 10.28.16.70 with SMTP id 67mr3408002wmq.142.1487263263589; Thu,
	16 Feb 2017 08:41:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 16 Feb 2017 08:40:43 -0800 (PST)
In-Reply-To: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
References: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2017 16:40:43 +0000
Message-ID: <CAFEAcA98V-3EMDS+o9HnAdY14JDoY4i8yYyFP=OiK8QXMSWvmA@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::229
Subject: Re: [Qemu-arm] [PATCH 0/4] cpu: Implement cpu_generic_new()
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3DTqk4H+G4Md

On 13 February 2017 at 14:28, Peter Maydell <peter.maydell@linaro.org> wrote:
> This patchset adds a new function cpu_generic_new()
> which is similar to cpu_generic_init() except that it
> does not realize the created CPU object. This means that
> board code can do a "new cpu; set QOM properties; realize"
> sequence without having to do all the work of splitting
> the CPU model string and calling parse_features by hand.
>
> Patch 2 clarifies a TODO comment, hopefully correctly,
> based on an email conversation I had with Eduardo a
> little while back.
>
> Patches 3 and 4 change the ARM boards which currently
> call parse_features by hand to use the new function.
>
>
> If there's consensus that this is the right general
> direction to go in, then I think that some other
> architectures could also make cleanups to use this:
>  * cpu_s390x_create() is almost exactly this function,
>    give or take some fine detail of error handling
>  * ppc_cpu_parse_features is almost the same thing,
>    except that it doesn't actually create the CPU object,
>    it only calls parse_features
>  * hw/i386/pc.c does a manual parse_features
>
> I'm not strongly attached to this particular approach
> (though it seems like a reasonable one, especially given
> the proliferation of different arch-specific helpers
> listed above and the bugs in boards which don't call
> parse_features when they should), but I would like us to
> figure out and document what the right way for a board
> to create and configure its CPU objects is...

I know it's only been a few days, but I just wanted to
say that I'd appreciate it if we could manage relatively
quick review on this one, since I have a set of patches
pending that depend on this and which it would be nice
to get into 2.9 (softfreeze approaching rapidly).

thanks
-- PMM
