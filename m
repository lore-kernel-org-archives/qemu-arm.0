Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp792782wrt;
        Wed, 9 Jan 2019 08:04:06 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6u8c5Ntqgez5I9pqePAhFPGIiIyXeWz5nQcJLek6nWb+7TLEP/JJXo+51aSv0M+zTdw19z
X-Received: by 2002:a1c:4807:: with SMTP id v7mr6405499wma.53.1547049846241;
        Wed, 09 Jan 2019 08:04:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547049846; cv=none;
        d=google.com; s=arc-20160816;
        b=J5QZ+FNFIRiX7mzswfl1NNgt18xYUKF0XPDM+LajdTSFTOrgfvh4OzMf7vcabs5k4/
         cj4rbxJNqUQftJZ1yHLkNB6Jq3l6doAlbbq7D9V0j3vzO6GwbUCg4CEkUchUB2flcNFL
         hh7y2IIJ2oUiYqgBGcGZx23kcTskwyoka2tWnGOSFoOKUhhSYfTz8yOOJvcXezczgGPf
         uqwDaa0Vy8l/7AjnOPhXxrhQ1GTdX6jBi3mQe/5E3yTfMvF6dACzgC3h+eERibZlr3Fp
         jImwQ5cyIGsc+Y6PcjRUHy2ow+cEmpCPY/2Jgnfc7yBwt4YjGFOAe1A68dAiv+dSEZF7
         SowA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qvSihNUV/cz6DfLXn2x2D84aOhJ3bruEHah1YZHAPeE=;
        b=Pxt8S7V8usCyYrVZpR0ct/YUqgg06llDRTW2281J0diOLhu5NY6DwIjBwcl1Brba7f
         wgdq8ciwuwlpQMhNKXQyvZp05gxiL+deRtkgT0E7BoasmcGWArlCVJdFwygfFmpixvPG
         iaDUs3C1uaARZ/BamACb1xLPDCTD/p8NkYh3KhhAgGxlWCeFBoQQlMDH7iZosUXo0Up6
         8FZbVfv1M1odEFpWzPiiux3Z1DGjBTyVO73tiQnd/BMZTXOQvNRX3VLDVQ3UX/CQ43Bn
         hhHqYc4mDYPAfllWlM0a7VeaHCR0udEu7Kv0mFLX0hcClGohAnKLNV5C5oMN0S6A9DW6
         M+nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hoyV3r8D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h25si9027409wmb.160.2019.01.09.08.04.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Jan 2019 08:04:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hoyV3r8D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghGKr-0002xo-Ak
	for alex.bennee@linaro.org; Wed, 09 Jan 2019 11:04:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ghGKT-0002oA-UP
	for qemu-arm@nongnu.org; Wed, 09 Jan 2019 11:03:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ghGKR-00055O-Sj
	for qemu-arm@nongnu.org; Wed, 09 Jan 2019 11:03:41 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:35875)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ghGKR-0004z6-He
	for qemu-arm@nongnu.org; Wed, 09 Jan 2019 11:03:39 -0500
Received: by mail-ot1-x344.google.com with SMTP id k98so7122641otk.3
	for <qemu-arm@nongnu.org>; Wed, 09 Jan 2019 08:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qvSihNUV/cz6DfLXn2x2D84aOhJ3bruEHah1YZHAPeE=;
	b=hoyV3r8DvfN7LoZJesdAwRfOTiMxGW9EnzzzLF+ZC6uFc2GaeKU9pqIFMK9UDUoHSY
	8+AB8gyN7SQ4uWhZAry/aWywaBLd9gxsgzoQ8KWSZzhUDgNf4+D5w5Wux1OjUyKufK+f
	gfht1C7EepUZNeWbckBN/eI9mMGG93lDLBJfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qvSihNUV/cz6DfLXn2x2D84aOhJ3bruEHah1YZHAPeE=;
	b=ocpD5rBhv8sIml8bFzFGk3272QW7vN6HyYVORBDyiPvmcmDW29cALyKSozvNJtyIVB
	5Uzs1eeAeBvPp2czDOxUmCGDP2EWVCLN7YZKWLMbrMa8mq5RwoCyV1jkk4TgF+FNiRLP
	myAWjAWuEl/Bfy5h3FA4YZNPcJwONEhb+jp1zm7HSrlkjxfN2Vvq61bdSSu4Yw/HE9t5
	c2IH/Ll+4xfR4tW0Jou7bbB91SAvYpLkmiw6LQLWKRV48UATG7WGs6BzmU17sFduwP0s
	LADEInJdJW51rQjN9bVqIsaPEqyz1Ze4tXcKNbIpxblkOEEzAyx0jzwaKHybzrtkqeDc
	uG5w==
X-Gm-Message-State: AJcUukf0N3GfbnkRfucnnQUVkGHxB8oKyLTT8PGIcpB/JPhXQ9RjDjzZ
	Ezt/GBhVaMsw+R0J/jGSt9vzwZMTVyq19IEshETIDw==
X-Received: by 2002:a9d:5617:: with SMTP id e23mr4077758oti.151.1547049804048; 
	Wed, 09 Jan 2019 08:03:24 -0800 (PST)
MIME-Version: 1.0
References: <20190103094211.28473-1-geert+renesas@glider.be>
	<acd10959-a781-d3bf-dc67-bda878740ec9@redhat.com>
In-Reply-To: <acd10959-a781-d3bf-dc67-bda878740ec9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Jan 2019 16:03:12 +0000
Message-ID: <CAFEAcA9jk1ocW8h33-f9mRM52mT96o+bviaRe6MRErkyxBtqYQ@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH QEMU v5] hw/arm/sysbus-fdt: Add support for
 instantiating generic devices
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <damm+renesas@opensource.se>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AS7qn2VvvMol

On Wed, 9 Jan 2019 at 15:55, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Geert,
>
> On 1/3/19 10:42 AM, Geert Uytterhoeven wrote:
> > Add a fallback for instantiating generic devices without a type-specific
> > or compatible-specific instantiation method.  This will be used when no
> > other match is found.
> >
> > Generic device instantiation avoids having to write device-specific
> > instantiation methods for each and every "simple" device using only a
> > set of generic properties.  Devices that need more specialized handling
> > can still provide their own instantiation methods.

> > +    /* Ignoring the following may or may not work, hence the warning */
> > +    { "gpio-ranges",     PROP_WARN },   /* no support for pinctrl yet */
> > +    { "dmas",            PROP_WARN },   /* no support for external DMACs yet */
> I would be tempted to simply reject things that may not work.

More generally, this whole feature seems to be "allow things that
might not work", isn't it? Otherwise we could just have explicit
whitelists for the devices we want to allow passthrough of and
that we've tested to work.

I have to say I'm not really very enthusiastic about
enhancing this to allow random device passthrough,
because it encourages further use of this. If people
want hardware that can be passed through they should
put it behind a bus that can be probed and can go
behind an IOMMU, ie pci or some equivalent. That
is a supportable hardware mechanism. All this
machinery feels very heath-robinson...

thanks
-- PMM
