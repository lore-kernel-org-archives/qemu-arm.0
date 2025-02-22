Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp1100796njc;
        Sat, 22 Feb 2025 13:59:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVS6cn6yUmHivrggqYMJ6XvnzPd0RDeDlbCFHeLN+v4ec4E6I2DK7FasFDG7a14J0aOIWcIH5V3qZ2mhw==@linaro.org
X-Google-Smtp-Source: AGHT+IHAfb6gwd0Gx2bKsF0x5Bj1O2bo6MKAJyxE1cq7DMycL5zoJ+drWkJCVRyPMu5muQ7BgB0D
X-Received: by 2002:a05:620a:4087:b0:7c0:a3bd:a78a with SMTP id af79cd13be357-7c0cf95052amr1072898185a.41.1740261547961;
        Sat, 22 Feb 2025 13:59:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740261547; cv=none;
        d=google.com; s=arc-20240605;
        b=aKov2c+b93ey+sIEAINsA42fZoBKYiyjCVJvCuHqwUlRJnI4fckNjgV1+hiGLwu/49
         XI2243itdAT5LRvL4u/Z/oW8f97YEmphZT5EVAgqdCNb0wy7fPUu7MHnybDjcW/xJZyF
         sQR0N4wSxVc92gXI0SDyge/hhRrqvz41v6z5+37yE+Kmf70/y1PlTwa/O0lh6pf0IsLt
         CmYwq12hpN/OSJQTyuxHjiOp5Tl5NFhLTRlbmndcoAMr8AtQhqKTIFq3O85qar9Sfvvs
         tWOMWhE9kfBctmTpTxK4FgzJjZ8uPW150JnedSzWRlsmfFChnBpkYpE3j8H796E21k4/
         4qxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature:dkim-filter;
        bh=xS0NSTHQ66urKOGPUMLuLeWALosyvFwp3UCvlbyOrUU=;
        fh=bkbWI7u5UMiGWozkpt8jJiTeYHbaq8a7PWnecgHprQU=;
        b=N9E3LA+n1TAGWzSnGifErd0BNSdox3FTgfADIup4Dbv5CVFhRUHIfeZ54YL1TOPiSZ
         rzjFjYGDFhFn8MCzpRT4m2Ooy4gQG1T4xN0/fp/w2KJo7nFHD+WrlheI5v9fOUYYg+7k
         qnhHO+m6OyU9l3wnCZMjdODM8WRaZt9QELQ0983Mk2YlkwOyIiVJmQbSLMAG+rfH0bk/
         6dzCOvwJ7PqmklrZBoi+1AnuQME83fadGeGQ3yU47G7Ksoh5seyOD+CyUa9XYkPHWywS
         pSnvcYjazZ5NKZuhLpOO1JlkKqmAFcV3alIFANXD01VWRCTmX1pj+M4a+Qon8U5eNAfM
         biNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@puck.nether.net header.s=default header.b=deMe6Sog;
       spf=pass (google.com: domain of jared@puck.nether.net designates 204.42.254.5 as permitted sender) smtp.mailfrom=jared@puck.nether.net;
       dmarc=pass (p=NONE sp=REJECT dis=NONE) header.from=puck.nether.net
Return-Path: <jared@puck.nether.net>
Received: from puck.nether.net (puck.nether.net. [204.42.254.5])
        by mx.google.com with ESMTPS id af79cd13be357-7c0a6cebe73si1025991385a.168.2025.02.22.13.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 13:59:07 -0800 (PST)
Received-SPF: pass (google.com: domain of jared@puck.nether.net designates 204.42.254.5 as permitted sender) client-ip=204.42.254.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@puck.nether.net header.s=default header.b=deMe6Sog;
       spf=pass (google.com: domain of jared@puck.nether.net designates 204.42.254.5 as permitted sender) smtp.mailfrom=jared@puck.nether.net;
       dmarc=pass (p=NONE sp=REJECT dis=NONE) header.from=puck.nether.net
Received: by puck.nether.net (Postfix, from userid 1001)
	id 9F59D5400DF; Sat, 22 Feb 2025 21:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 puck.nether.net 9F59D5400DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puck.nether.net;
	s=default; t=1740261453;
	bh=+vH81h2+gcP1e4jqnnnOikYQLL4SWMws0tQgd5wZBQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=deMe6SogxScbIBtYG0nvccbTeBw+aOgdY8fgSNzGIBjAhy+rsIHudQj96gqX0vT/U
	 61zuj0f7HCjq+FcpRtKPtGmXFD5SMFwvQVxK+WQxZuQnAb1yCxu+/AvbThsMIITjHw
	 LT6BaKRc5rhkHFXxEJugjlvOz2I+yCro+LzzIzst+t5g9Dz73ou3SMwZByMTBtrgC0
	 cbmgUx1WHdoTRNJYjamm1LzkBKZtWc1NFs07LoWrsPoKILgXGQnMz309i5LoFpBvFY
	 IFffxAmEK1PJBdTty4BhH6o1Glu9DXaHz/CkD3V7fplOShqJeCmT0YtYM26KkXYn8R
	 KZA6D0ZSU8hLQ==
Date: Sat, 22 Feb 2025 21:57:33 +0000
From: Jared Mauch <jared@puck.nether.net>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>,
	Jared Mauch <jared+home@puck.nether.net>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	devel@lists.libvirt.org
Subject: Re: [PATCH v2 11/12] hw/arm/raspi: Deprecate old raspiX machine names
Message-ID: <Z7pITScHfXSk-Liy@puck.nether.net>
References: <20250204002240.97830-1-philmd@linaro.org>
 <20250204002240.97830-12-philmd@linaro.org>
 <CAFEAcA-3JJ1tZAXsik5hAonuSO9sCqDF1xqPQVhAeN-XwAAhDw@mail.gmail.com>
 <e32a54f2-ef46-4964-89d4-a8969b6d1b05@linaro.org>
 <1ec3cd49-7fe8-9c80-212d-68939580b8ce@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ec3cd49-7fe8-9c80-212d-68939580b8ce@eik.bme.hu>
X-TUID: tstIAmS9mlDU

On Tue, Feb 04, 2025 at 10:58:39AM +0100, BALATON Zoltan wrote:
> On Tue, 4 Feb 2025, Philippe Mathieu-Daudé wrote:
> > On 4/2/25 10:22, Peter Maydell wrote:
> > > On Tue, 4 Feb 2025 at 00:23, Philippe Mathieu-Daudé
> > > <philmd@linaro.org> wrote:
> > > > 
> > > > All previous raspi machines can be created using the
> > > > generic machine. Deprecate the old names to maintain
> > > > a single one. Update the tests.
> > > > 
> > > > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > > 
> > > > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > > > index 4a3c302962a..c9a11a52f78 100644
> > > > --- a/docs/about/deprecated.rst
> > > > +++ b/docs/about/deprecated.rst
> > > > @@ -257,6 +257,19 @@ Big-Endian variants of MicroBlaze
> > > > ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` ma
> > > >   Both ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` were added
> > > > for little endian
> > > >   CPUs. Big endian support is not tested.
> > > > 
> > > > +ARM ``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``,
> > > > ``raspi3b`` and ``raspi4b`` machines (since 10.0)
> > > > +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> > > > +
> > > > +The Raspberry Pi machines have been unified under the generic
> > > > ``raspi`` machine,
> > > > +which takes the model as argument.
> > > > +
> > > > +    - `raspi0`` is now an alias for ``raspi,model=Zero``
> > > > +    - `raspi1ap`` is now an alias for ``raspi,model=1A+``
> > > > +    - `raspi2b`` is now an alias for ``raspi,model=2B``
> > > > +    - `raspi3ap`` is now an alias for ``raspi,model=3A+``
> > > > +    - `raspi3b`` is now an alias for ``raspi,model=3B``
> > > > +    - `raspi4b`` is now an alias for ``raspi,model=4B``
> > > 
> > > This is not how we typically handle "we have a bunch
> > > of different devboards in one family". What's wrong with the
> > > existing set of machine names?
> > 
> > Zoltan and you don't want to add more machine names, then you
> > don't want a generic machine. This is very confusing.
> 
> I said either rastpi4b,revision=1.4 or -machine raspi4b -memory 4g would be
> better IMHO. Peter perefers -memory which is also fine with me. I just don't
> think adding more machine names where only RAM size is different would be
> better than using -memory for that as usual.

	I'm the annoying root cause of this as I had filed this:
https://gitlab.com/qemu-project/qemu/-/issues/2797#note_2326724893

Which was really a question around providing more memory options, I'm
happy seeing a lot of thought has gone into my simple question/request,
but it's unclear reading this thread where things concluded.

	Is there a chance these are in a branch that one could build
against to get consensus on some of this style vs substance stuff?  I
get it that it's tricky and do generally think that one could restrict
armhf vs arm64 to having 64-bit support in the (hypervisor) OS.

	I was wanting to tweak some disk images before imaging a bunch
of nvme for use and saw using kvm/qemu as a straightforward path to
doing that on my laptop (x86_64) before firing up a bunch of compute
modules etc.

	- Jared
[i'm not subscribed to the qemu-dev list, so I expect mailman will
hold/bounce me]

-- 
Jared Mauch  | pgp key available via finger from jared@puck.nether.net
clue++;      | http://puck.nether.net/~jared/  My statements are only mine.
