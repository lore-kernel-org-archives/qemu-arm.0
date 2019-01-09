Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp822654wrt;
        Wed, 9 Jan 2019 08:31:29 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4uJNLKFN52EQ89ajO8pSju+BVqwyYFVub9UGOehJkRDMiMtxyc6iZOA/M52k1RVyXBkpzB
X-Received: by 2002:adf:9484:: with SMTP id 4mr5315193wrr.98.1547051489166;
        Wed, 09 Jan 2019 08:31:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547051489; cv=none;
        d=google.com; s=arc-20160816;
        b=WyiLYGB/tK4SGAwZ/k+fl7O6ZIepKYx0cp6CgIjhODoeKxxcFdU2C4O9buKLG8+VFZ
         4fpqZRpC7QeWsREarlB9ZPpyV1jcdFg1CY+38HMgFjMZ3hltWNw8VV7Sy0GFPUGCvUyA
         rw54VKVmWMkILZZFLvD5tUP42/8Fni/E7oHoGa0qWBi6EoHNe9aEbILQuoQngFFCEYmt
         UXmwxDLn6NH5rUGpGscNd5gOP/jFeNOxAkddJejPxA5X5HvVOTBJls6H3zoY278wvGDl
         uxI2kyZosyfiFn7pxJnb1SG0IE/LLJYJDQS6hYjeXsbArcoaqROOYtnzqqJSa4mFvgnU
         P2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=jXg3RV9rboq4joqRbbYJIcCPrGYBg3tnnPQlBKYsoi8=;
        b=lcnYbUoNG18hAFSy8j4Iy45/oIRlLWXHjhThCWUabH21M0sQpiX3m+a9t9Mwz7CKKW
         fAZSBOypSMgDH1jbYPgYIR30N2xv2NSLCpXCLjwEa9TAd0iRr92H8aPwVozYMIorETGf
         o+137CNqVX2w0ArSVGPKC3xHr/3yiIQofB7auxeAEwMGGLKH2TKzcNE/RBxH/6pHxWJK
         JuiYoXW4DoTI3qJKIu70FwhrnsWjGEsIMpGOofrGVQL7KQ/DGeboPF3tLCkpq7YGkIhP
         HczIFfniIu+tmr6NeZXyKf0Ye0Mx6LJes3BYNA63YYjszRdFnTInMHfF2rBL1wJfqPj2
         hbCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c189si9052499wma.70.2019.01.09.08.31.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Jan 2019 08:31:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:59546 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghGlM-0001jK-9K
	for alex.bennee@linaro.org; Wed, 09 Jan 2019 11:31:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert.uytterhoeven@gmail.com>) id 1ghGky-0001hG-Vy
	for qemu-devel@nongnu.org; Wed, 09 Jan 2019 11:31:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert.uytterhoeven@gmail.com>) id 1ghGkx-0000vO-II
	for qemu-devel@nongnu.org; Wed, 09 Jan 2019 11:31:04 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:38158)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert.uytterhoeven@gmail.com>)
	id 1ghGkr-0000gy-Od; Wed, 09 Jan 2019 11:30:58 -0500
Received: by mail-vs1-f67.google.com with SMTP id x64so5114184vsa.5;
	Wed, 09 Jan 2019 08:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jXg3RV9rboq4joqRbbYJIcCPrGYBg3tnnPQlBKYsoi8=;
	b=AbtZGtfmGvw+zA6R3ljzBHszH8kNK/aB7xrHKBGnnDEp7nWC/Mk1rKZY++x3d4UGQQ
	Ul8VfcFWVr0KX/U41S9Tcf2qx6+RjWLpSvwEc6j+V9mj2maWu0Qck8/gp/6Gj3h+sP/e
	v/cDJlkIJpAdDCVTmJDaTn0qnOHuv8GsFYJ0seEYNbxyaw8CfWOK/wn/4YIZT2Gjjuny
	71DxSRRc46gQTM/U9h6VPJrI2XcDz/t+eiMmIhukUZ6sMVHAVqW0drZfJpcvE+bbUMmL
	KnW6iBZUYo8eHdA0s20SljNKgvWXnY0JcumIDB6/sgBGC8TBpfTgo0Z+J4qUzwWjrGuB
	MhqA==
X-Gm-Message-State: AJcUukezD+1a+ZvgzA2MAX0RXWvacSb9xROEMxSqjLAlZRnECw7G5pYy
	QpvLIOEyo2EE4+yiPty8SQCrIUH6EnlMbS7ooyA=
X-Received: by 2002:a67:c202:: with SMTP id i2mr2533951vsj.11.1547051428903;
	Wed, 09 Jan 2019 08:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20190103094211.28473-1-geert+renesas@glider.be>
	<acd10959-a781-d3bf-dc67-bda878740ec9@redhat.com>
	<CAFEAcA9jk1ocW8h33-f9mRM52mT96o+bviaRe6MRErkyxBtqYQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9jk1ocW8h33-f9mRM52mT96o+bviaRe6MRErkyxBtqYQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Jan 2019 17:30:15 +0100
Message-ID: <CAMuHMdX6gwnw7RYQNik4QQmfWoTmemMgrUaPuW9Rgd56pW+4jQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.67
Subject: Re: [Qemu-devel] [PATCH QEMU v5] hw/arm/sysbus-fdt: Add support for
 instantiating generic devices
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <damm+renesas@opensource.se>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Auger Eric <eric.auger@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4HPyifFlous8

Hi Peter,

Thanks for your comments!

On Wed, Jan 9, 2019 at 5:03 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> On Wed, 9 Jan 2019 at 15:55, Auger Eric <eric.auger@redhat.com> wrote:
> > On 1/3/19 10:42 AM, Geert Uytterhoeven wrote:
> > > Add a fallback for instantiating generic devices without a type-specific
> > > or compatible-specific instantiation method.  This will be used when no
> > > other match is found.
> > >
> > > Generic device instantiation avoids having to write device-specific
> > > instantiation methods for each and every "simple" device using only a
> > > set of generic properties.  Devices that need more specialized handling
> > > can still provide their own instantiation methods.
>
> > > +    /* Ignoring the following may or may not work, hence the warning */
> > > +    { "gpio-ranges",     PROP_WARN },   /* no support for pinctrl yet */
> > > +    { "dmas",            PROP_WARN },   /* no support for external DMACs yet */
> > I would be tempted to simply reject things that may not work.
>
> More generally, this whole feature seems to be "allow things that
> might not work", isn't it? Otherwise we could just have explicit

I can remove the two PROP_WARN properties above from the list, if you prefer.
Exporting rcar-sata still works fine after that.

> whitelists for the devices we want to allow passthrough of and
> that we've tested to work.

In the end, this will become a loooooong list (SoC x devices)...

> I have to say I'm not really very enthusiastic about
> enhancing this to allow random device passthrough,
> because it encourages further use of this. If people
> want hardware that can be passed through they should
> put it behind a bus that can be probed and can go
> behind an IOMMU, ie pci or some equivalent. That
> is a supportable hardware mechanism. All this
> machinery feels very heath-robinson...

As no-iommu suppport is not upstream (in Qemu; it is upstream in Linux,
perhaps it should be removed?), all devices using DMA require being
behind an IOMMU.

Reality is that on embedded, on-SoC devices are usually not on a PCI bus.
But IOMMUs are present, and virtualization is wanted.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
