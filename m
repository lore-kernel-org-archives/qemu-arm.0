Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1631709wrx;
        Fri, 29 Mar 2019 02:34:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyDadKRz1pKz7FwyTjd82Ft7yov3stGYEVNqTkDki/c12DajGEucSgaWcQuCV4shsCQODTi
X-Received: by 2002:a24:c2c1:: with SMTP id i184mr3686772itg.82.1553852058505;
        Fri, 29 Mar 2019 02:34:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553852058; cv=none;
        d=google.com; s=arc-20160816;
        b=sobHsp8YE7aVxXQU0QLZuHz0kvxJF/LU2lSM0ZTs18SNzqFKSdtzsrWw4imZY+yzvP
         wZzflcuO48INeiTD3aQvpgExvZQhOz3ggyZp6UC953hrthcvANEpPQbFebCOvT8kdQ9X
         IG/f7XvMvVodv4IUbNqUdGwecXR14TBoD5E0CTpFEJHemZEa830IW4htmNAE94IsduLf
         Uk4jijDZr2ZqGGQpsVpgPNFmc3Leny0bTtliBsFC1im+2kmSYcxb7gKQyhxq5Oh4chby
         ySQ1BZOr3AjT7fBodq9LzdZquZnwTIhvKc48yka5CluJEjffw1uQcVmwEZ46IQgki743
         cWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=2oXZ4Jlv7aUjrK8CSAFyI8QXjXQfOsCMSKQMvkjLfWM=;
        b=GOHenAaWvPt/0tn7Qwk3XhZc9yLgFgwW/MaO5mpFqt+XmxhqxfoyfA5934G6Lmi9O/
         JfCHwEWY19GGtqCTom7z+yB2FY3eQ6WDCCtm9XT5qQzCzR3HSe4MWHcBuUqX5rlCrZ6x
         Mizwep0DYQvkDC0iBk6ac8QzcsGGxQwwodSsOKw1Tk6yh0FJ8vRBukUEVzHMM/6WCF2E
         ehTjea54vKoSnMnJSKnN9eaBOS4I/AdO3neDo8SiT1hdLvcwM4ov5XTsZj+bJ9mjVYhd
         j+/h86nLQ52d+2UahSs5RrjYQ32yGzdSNh+I+JT9SkP4DradTT7I7oPawz4ywNfmr/JY
         4KcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si800213jan.121.2019.03.29.02.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 02:34:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:49477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9ntx-0007JE-P9
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 05:34:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9nsM-0006hY-UM
	for qemu-devel@nongnu.org; Fri, 29 Mar 2019 05:32:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9nsL-0000pD-Ff
	for qemu-devel@nongnu.org; Fri, 29 Mar 2019 05:32:38 -0400
Received: from mail-yb1-f171.google.com ([209.85.219.171]:35039)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9nsI-0000lk-5H; Fri, 29 Mar 2019 05:32:34 -0400
Received: by mail-yb1-f171.google.com with SMTP id x79so618983ybg.2;
	Fri, 29 Mar 2019 02:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i/7IJndFe8YB2+kIfhL+3kjDIvVArLdlbpiEFKcsWJ4=;
	b=fh3mS6xl71ExtZ7JILF7OJYQWNikP+FoEgK+NrNpJcIUIgMqILrDhITN4XcKpIxBxi
	VLPSs2niY3iFAbA/a5lgz0cRJfHEweIdCdFklgtNZW90ooga0v3WBYq37YZkyr29+W3W
	ZcSoYocrGSKVwchciu7Z1vnVD1UkJrURnKFEbHJVmAH91aM/nhynjsSC7XmAzgoQgoW5
	ZQrAJ753+Z+L1/lSHUJ4vFZjXK2Qlvf7BHSKRw4KBoGMD/Rl0ntJh8MfVyeAQawNZ89i
	N28ggPYJmn0w/XJv+j9DTTT4S1rE8BTgWesEI1JfENMOeBjLa9qEaBXb8HRLW95wSSib
	4WFw==
X-Gm-Message-State: APjAAAWkO+PuDCc4H8dTg34hyp9eeT4gYkHYSBHWAiYSNiNwPl90pSHt
	qdJNou+SsM0hllW7TwzJwN9VU6J3Bnp++TXiKjM=
X-Received: by 2002:a25:bb85:: with SMTP id y5mr38039808ybg.406.1553851953273; 
	Fri, 29 Mar 2019 02:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190328152944.3199-1-peter.maydell@linaro.org>
	<4eb279f0-be5a-6250-678d-bec430d8473b@redhat.com>
	<CAFEAcA8S+fo--kRVyDe=rO21Md8ypxCfcVaq5w4iosgM=H7nNg@mail.gmail.com>
In-Reply-To: <CAFEAcA8S+fo--kRVyDe=rO21Md8ypxCfcVaq5w4iosgM=H7nNg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 29 Mar 2019 10:32:19 +0100
Message-ID: <CAAdtpL6g6L463JDLJdFwtOwLAd9V5WZL4=4izqHWm_u9iyxR-A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.219.171
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v2 for-4.1] hw/arm/raspi: Diagnose requests
 for too much RAM
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 46BOdmWN9Xcr

Le ven. 29 mars 2019 10:20, Peter Maydell <peter.maydell@linaro.org> a
=C3=A9crit :

> On Thu, 28 Mar 2019 at 21:29, Wainer dos Santos Moschetta
> <wainersm@redhat.com> wrote:
> >
> >
> > On 03/28/2019 12:29 PM, Peter Maydell wrote:
> > > The Raspberry Pi boards have a physical memory map which does
> > > not allow for more than 1GB of RAM. Currently if the user tries
> > > to ask for more then we fail in a confusing way:
> > >
> > > $ qemu-system-aarch64 --machine raspi3 -m 8G
> > > Unexpected error in visit_type_uintN() at qapi/qapi-visit-core.c:164:
> > > qemu-system-aarch64: Parameter 'vcram-base' expects uint32_t
> > > Aborted (core dumped)
> > >
> > > Catch this earlier and diagnose it with a more friendly message:
> > > $ qemu-system-aarch64 --machine raspi3 -m 8G
> > > qemu-system-aarch64: Requested ram size is too large for this machine=
:
> maximum is 1GB
> > >
> > > Fixes: https://bugs.launchpad.net/qemu/+bug/1794187
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > ---
> > > Changes v1->v2: use '>', not '>=3D'...
> > >
> > >   hw/arm/raspi.c | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > >
> > > diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> > > index 66899c28dc1..fe2bb511b98 100644
> > > --- a/hw/arm/raspi.c
> > > +++ b/hw/arm/raspi.c
> > > @@ -12,6 +12,7 @@
> > >    */
> > >
> > >   #include "qemu/osdep.h"
> > > +#include "qemu/units.h"
> > >   #include "qapi/error.h"
> > >   #include "qemu-common.h"
> > >   #include "cpu.h"
> > > @@ -175,6 +176,12 @@ static void raspi_init(MachineState *machine, in=
t
> version)
> > >       BusState *bus;
> > >       DeviceState *carddev;
> > >
> > > +    if (machine->ram_size > 1 * GiB) {
> > > +        error_report("Requested ram size is too large for this
> machine: "
> > > +                     "maximum is 1GB");
> >
> > 1GB vs 1GiB... maybe the message should display "GiB" to avoid any
> > confusion?
>
> I don't know why we call our #defined constant GiB -- to me
> the unit is GB and I think printing anything else in user
> messages is weird.
>

There was a discussion with Stefan and few other in 2017 the outcome was to
use the explicit IEC standard (and avoid confusion with 1kHz i.e.).

https://en.m.wikipedia.org/wiki/Kibibyte
"The *kibibyte* is a multiple of the unit byte
<https://en.m.wikipedia.org/wiki/Byte> for quantities of digital informatio=
n
<https://en.m.wikipedia.org/wiki/Information>. The binary prefix
<https://en.m.wikipedia.org/wiki/Binary_prefix> *kibi
<https://en.m.wikipedia.org/wiki/Kibi->* means 210, or 1024; therefore,
1 kibibyte is 1024 bytes. The unit symbol for the kibibyte is *KiB*."


> thanks
> -- PMM
>
