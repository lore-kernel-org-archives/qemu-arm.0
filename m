Received: by 10.223.150.237 with SMTP id u100csp4112337wrb;
        Fri, 10 Nov 2017 11:23:16 -0800 (PST)
X-Google-Smtp-Source: AGs4zMb/anN+SPXHcQuRbjvx/57LngOZUFtVoP2uMzHv1lBfDexT/+hbSeyhHG3qEwc0knRvlQuj
X-Received: by 10.37.173.23 with SMTP id y23mr974525ybi.121.1510341796641;
        Fri, 10 Nov 2017 11:23:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510341796; cv=none;
        d=google.com; s=arc-20160816;
        b=p8NF2rf8dhpbrQop9rlFgmBk0sR8bKkEO429myIoJkCBRlsttJoCluYifpQhJ1JF68
         7ryYJ++YrNsaBjB7gau8EIXe/6ShuLG/PelSXPSTJXLY2ZIEI42fxApn5+BqxGjcEn1o
         wMCIooZPo4UQamJDk/oUT8OaE0P/I8xtQHbZdz98PiI935FO24/aDf/bPr3cloKGSBtK
         v/QC496gjvz3OMMYDhZ0/E3iFQQoUjkbwn6dDA9UXl1DTuHb1RXM+H52jSjhClpVB7/N
         IiuYdsGXTFq/krabeaVewgjQjX9yuz9PcPIJc41nQkSNY1eWVALpbKyDg8mN5H/VJEQx
         7kog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=iOXftXUNKvEBdmNwWl2tADASuv6UhLrzmXK56FCV5FI=;
        b=Pdu8rITUXr6/6Gc5tjy2N+gL1mknwWdNKXNSQstsSTF1S5+LJWhnP4jWbWqjk3WHhP
         93CjASOkBJgS9yObh7+hFLTdH1o1fcori5IXeoxwb8f5QVABRg8eJ0fFxGnJY/LWjtpC
         h6ZjGtEYu2+ZvDQxClYxxsILOU7cNv90n4r704SdMOddLM9pFVwpGZtIKDWkrUikpkUz
         qD3vmGf7OWwAhGRdlQiEK9W4yH4lzIw9zJGp5G36c+Yt6HiVgrlet9E6ibIN5FVy/2US
         DZQdFvGpD1lrLiyiV/RddbEFqNcBZlOJ9d7NF0GwR1QMWW/sWKCXY4nRwO8jIXIwzIXv
         iJdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=SX3tQX9R;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=d9CxW0S3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s83si2029731yba.706.2017.11.10.11.23.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Nov 2017 11:23:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=SX3tQX9R;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=d9CxW0S3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43164 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eDEtY-0000EO-3F
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 14:23:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eDEtN-0000EF-7G
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 14:23:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eDEtK-0008T0-2b
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 14:23:05 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:43661)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1eDEtJ-0008Sh-Rh; Fri, 10 Nov 2017 14:23:01 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 8D04D20AAB;
	Fri, 10 Nov 2017 14:23:00 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Fri, 10 Nov 2017 14:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=iOXftXUNKvEBdmNwWl2tADASuv6UhLrzmXK56FCV5FI=; b=SX3tQ
	X9RcNjO0gKUFfORdiT4CwKxoupT4xDCwi+y805cmOthRetoJySVc4t7kDyWizeGX
	tZsoTu14ZDts3A3LlEDbT1MENvqJZAEKm2y0BkUJ5Tnpn/kZCuYbOvFdzAmFor+B
	+I0BlSrFGZzaj3qehCeRJHzsXrEPEfWt2PLU0M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=iOXftXUNKvEBdmNwWl2tADASuv6Uh
	LrzmXK56FCV5FI=; b=d9CxW0S3xOb5poWIiMpZ7eWZ5YFjdsV8htzgT9FRRtMYQ
	KWPkSZPoLnB9JzKspEwBhMHhetjCtIUN5jfKF2Qy6/9Cio81fq7cQ1/hR7+orRWx
	4Ahui0g61SJsADihq2nbBXJ4mZSjbCp4YIjmDNWQaqYI+6eFm20RxVfiqAprKe0c
	Pc0eXuILi29kIhLTMgT2Dl1CajYOBFcTT9TbfKRkQ66wPG4NUX/ciI1hWU8L+FZD
	QMebsDFtK6HwKiyK6kX7y0mvxJsZuGJBEM6c9eJs944/477CzmuRuwJInQxLosDS
	YUr1Z3BBPbMd1MWt9G/NQ4gTBR6abGxoFPOLCO1kg==
X-ME-Sender: <xms:lPwFWtkbXqWW_0P5_Su18pOawJ3BuplzQd0JTMlsKaRfNZXrNe7VMw>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4FA6D244A1;
	Fri, 10 Nov 2017 14:23:00 -0500 (EST)
Date: Fri, 10 Nov 2017 14:23:00 -0500
From: "Emilio G. Cota" <cota@braap.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20171110192300.GC17844@flamenco>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
	<20171107201545.GA32606@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171107201545.GA32606@localhost.localdomain>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw: add .min_cpus and
 .default_cpus fields to machine_class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g50lBrojP6UH

On Tue, Nov 07, 2017 at 18:15:45 -0200, Eduardo Habkost wrote:
> On Fri, Nov 03, 2017 at 02:47:33PM -0400, Emilio G. Cota wrote:
> > @@ -4330,12 +4330,34 @@ int main(int argc, char **argv, char **envp)
> >      smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
> >  
> >      machine_class->max_cpus = machine_class->max_cpus ?: 1; /* Default to UP */
> > +    machine_class->min_cpus = machine_class->min_cpus ?: 1;
> > +    machine_class->default_cpus = machine_class->default_cpus ?: 1;
> > +
> > +    /* if -smp is not set, default to mc->default_cpus */
> > +    if (!smp_cpus) {
> > +        smp_cpus = machine_class->default_cpus;
> > +        max_cpus = machine_class->default_cpus;
> > +    }
> 
> I suggest doing this before smp_parse(), so any validation of
> smp_cpus inside smp_parse will apply to the value we're setting
> here (e.g. the replay_add_blocker() call in smp_parse() will
> work).
(snip)
> > +    if (max_cpus < machine_class->min_cpus) {
> 
> smp_parse() already ensures max_cpus >= smp_cpus, and you are
> already checking if smp_cpus < machine_class->min_cpus above.  Is
> it really possible to trigger this error message?
> 
> Except for that, the patch looks good to me.

Both very good points! I've modified the patch accordingly.

Thanks,

		Emilio
