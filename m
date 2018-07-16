Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1676386wru;
        Mon, 16 Jul 2018 09:16:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfsb5+v5bnTu10K0Oq0H3iABagaUtWKF9SWCN3nyHwiF3Cvs+eqayRW83CMNBdJYqinOi1g
X-Received: by 2002:aed:2d63:: with SMTP id h90-v6mr316106qtd.190.1531757777251;
        Mon, 16 Jul 2018 09:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531757777; cv=none;
        d=google.com; s=arc-20160816;
        b=dpunnpfw7dSQ6jv3o24xxbal67x89haTzFpN1RzZMghO/uBKxVmMCqSpx7krHIoDt3
         rlDlWq+k3hRYDNxDO3fXeQJCBhhJxpv1B/fewjC8pKKPDPoXJ+yMPdK11FsGxwcCefeu
         SPg19oA7795GJK1T2R+ixJ4ZSYHxJRRqzQpmTeVbQvHVSemoWi5Ci0BP1oE/NKLC53fo
         i4e/qkvAWIRnntqDeRVftNWUY/cxoT3DC7QU3PosDH6eA37yV27Xs7jRc2C/LBboufKU
         Hz4XwPtl9mK9WKFtXFt/PhFCSns5HDWgf399M/qYkJCBN1cW74BdG40yOEbQMVsgAob0
         h13A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=u6R3ASjewWrh9KCQillaXwmyiCNoPnDvpuB8giS24sM=;
        b=JtxGbU2hpYH8s5iY/Pj6l585Iinff1yt4nGrpchirlXvWk4g7x0KBf20awR/6i/coP
         lj4DW189aJOx5ha170QqQU7VyD5z4egbGTbA6LnV4lWUADV+m8nz4nX2sTer1xIUjOy7
         hAvzyH+vNV7P/Zu5cZPJtrftYg5hqWDEztbU1JlmY1QZUgpJ1lwG1FRYUIhMMhkoOtvx
         ihJ1uzeylA/vHHugeMnsWxUI1VbyRoDuC9RpzUPadYPOe+2HZ+XR3Es95K0kOcSZGxjB
         bCWu9pM9NPxeH3hd2aQafCju0gEpyHPxgb2AZjVvwo4M10feTQA/fMQk50oLhuUcKycG
         Gybw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XD+5CspP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d9-v6si5992687qtp.114.2018.07.16.09.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 09:16:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XD+5CspP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff6Aa-0001HU-PA
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 12:16:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1ff69M-0000jF-1m
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 12:15:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1ff69I-0002o7-Su
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 12:15:00 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:46418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1ff69I-0002nf-K8; Mon, 16 Jul 2018 12:14:56 -0400
Received: by mail-pf0-x244.google.com with SMTP id l123-v6so26502952pfl.13;
	Mon, 16 Jul 2018 09:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=u6R3ASjewWrh9KCQillaXwmyiCNoPnDvpuB8giS24sM=;
	b=XD+5CspP1cGIPTx/ynk8ho4cIvI3Ui+u5Szol51YSE+FCe4EWc8tKpqJdm1jx4rtuY
	PWt9tANdi3A3fv8vxJMkHKj7ZKhCxNa1IKut9kSdQ21nJhiWuXr8Mq3qcYwmJA9Fdadi
	/pRNATFcRDOPMi/tdEyie5C0uPderCTB57UiG1ybRepOHfI+SY6Pxu3Zara73pTvfkrQ
	X2vo/CM+9mjIHI7rzPktrBo73hCffP4yiWdfvJ7u4bN54Auh1SubKiLtEK13N5dSTI6y
	ax455heWv2oYJPWdBNutEuDVq65R6akyHrUgD9YO2FCD2eHrGoeGNrWuUPWlYQLsKo0J
	bx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=u6R3ASjewWrh9KCQillaXwmyiCNoPnDvpuB8giS24sM=;
	b=tkVZABfmaFbFn6KG6LrxpJswVXQ2CYdtSz5T1ZluyA/eS2RTjmDmBUB6yEwZHfaQO2
	W05KcZK+68h0OOCUYs3ABvqXaO2bq+QnWRvzxdGm6Ibzt5Fbei0UlkMDzpgqO7dd6Y1M
	8j4Bkyq0tUsiiu841rmOW3KiS415t42vaW1Cl3IAwjzvkLTqm/TMnVDunFNvSGs6VKHA
	F8hD8HV9M9fRXwA5GlX4A/6P/gVCxdmxqWF94lznB7zFPeJLrsBun7uycRjt0BRxKSB2
	QvrKMLwS9D/PiIT51qQWF2VjtIo+AAU+EX3bWLut+neyhe8GLPYBtV5NlqVxhhGBMWH3
	EbXw==
X-Gm-Message-State: AOUpUlECmlLhcqC4ZdDPnNbAaloBUPnhGRf2BaLlCLjDj4i0yTXfg55r
	V6kC/IIryA0opHixZwZd2is=
X-Received: by 2002:a62:678f:: with SMTP id
	t15-v6mr18274419pfj.85.1531757695598; 
	Mon, 16 Jul 2018 09:14:55 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
	[108.223.40.66]) by smtp.gmail.com with ESMTPSA id
	64-v6sm25732582pfe.151.2018.07.16.09.14.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 09:14:54 -0700 (PDT)
Date: Mon, 16 Jul 2018 09:14:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180716161452.GA22620@roeck-us.net>
References: <1531692369-1511-1-git-send-email-linux@roeck-us.net>
	<CAFEAcA_k7Pq8MCJ+hEMO-9q=A=GkmjMgE-S1o4oU9MG-KLdPOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_k7Pq8MCJ+hEMO-9q=A=GkmjMgE-S1o4oU9MG-KLdPOw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: Re: [Qemu-arm] [RFC PATCH] hw: arm: Add basic support for cprman
 (clock subsystem)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U74cZqRbZ4kS

On Mon, Jul 16, 2018 at 03:33:15PM +0100, Peter Maydell wrote:
> On 15 July 2018 at 23:06, Guenter Roeck <linux@roeck-us.net> wrote:
> > Add basic support for BCM283x CPRMAN. Provide support for reading and
> > writing CPRMAN registers and initialize registers with sensible default
> > values. During runtime retain any written values.
> >
> > Basic CPRMAN support is necessary and sufficient to boot Linux on raspi2
> > and raspi3 systems.
> >
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> > I don't seriously expect this patch to get accepted, but I thought
> > it might be valuable enough for others to use it when playing with
> > raspi2 and raspi3 emulations.
> 
> Looking around I guess that a stub version of this device is
> worth having. It's not like we'd be wiring up the clock control
> information to anything anyway, given that QEMU doesn't much
> care about clocks...
> 
> > +#define CM_GNRICCTL        (0x000 / 4)
> > +#define CM_VECCTL        (0x0f8 / 4)
> > +#define CM_DFTCTL        (0x168 / 4)
> > +#define CM_EMMCCTL        (0x1c0 / 4)
> > +#define A2W_PLLA_CTRL        (0x1100 / 4)
> > +#define A2W_PLLB_CTRL        (0x11e0 / 4)
> 
> The information at https://elinux.org/BCM2835_registers#CM
> and https://elinux.org/BCM2835_registers#A2W
> suggests that the A2W is a separate thing from the CPRMAN...
>

Both are used together to define individual clocks in the Linux clock
driver (each clock has a CM register and a matching A2W register), so
they must be associated to each other. It might or might not make sense
to treat them as separate devices in qemu. Hard to say without datasheet.

> > +static void bcm2835_cprman_reset(DeviceState *dev)
> > +{
> > +    BCM2835CprmanState *s = BCM2835_CPRMAN(dev);
> > +    int i;
> > +
> > +    /*
> > +     * Available information suggests that CPRMAN registers have default
> > +     * values which are not overwritten by ROMMON (u-boot). The hardware
> > +     * default values are unknown at this time.
> > +     * The default values selected here are necessary and sufficient
> > +     * to boot Linux directly (on raspi2 and raspi3). The selected
> > +     * values enable all clocks and set clock rates to match their
> > +     * parent rates.
> > +     */
> > +    for (i = CM_GNRICCTL; i <= CM_VECCTL; i += 2) {
> > +        s->regs[i] = 0x11;
> > +        s->regs[i + 1] = 0x1000;
> > +    }
> > +    for (i = CM_DFTCTL; i <= CM_EMMCCTL; i += 2) {
> > +        s->regs[i] = 0x11;
> > +        s->regs[i + 1] = 0x1000;
> > +    }
> 
> If you believe the register lists from the links above this
> loop will set CM_PLLB, which is an exception from the
> pairs of CM_FOOCTL/CM_FOODIV) registers in this range.
> There are also a few CTL/DIV register pairs in the gap
> between CM_VECCTL and CM_EMMCCTL.
> 
Good point. I'll fix that up.

Overall it would be great to get a register dump from someone
with real hardware. I don't really like my guesswork too much.

Thanks,
Guenter
