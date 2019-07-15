Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4348551wrv;
        Mon, 15 Jul 2019 09:12:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzkwcenGqq/3YvHySA4ocCYMZ7UI+QqLZZ+nHks6u/VugkzaTLqnDOrb/uHnwVm366Xu4uN
X-Received: by 2002:a50:8934:: with SMTP id e49mr24364188ede.156.1563207170366;
        Mon, 15 Jul 2019 09:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563207170; cv=none;
        d=google.com; s=arc-20160816;
        b=OsZ+JMM1QnVifGwrANJ2LG9s9poARPwCQm76xKpgVW65f1SkjEwRgHAoY3o01s+xS9
         xUYVO2MLHk8a/OwLq5JsqoPKjXHplQc/dJRT1I5MDZoJw6xc9Dhyfn8/zV8GJf+PHAVs
         5FWXYrSU7ZOHpkX6TxD83M0GJ219sEy/2P/VspowwBCwJtXMZn5do/6RZ2KrNQnbVhRN
         QCQx3q96LN+I93a9+51825FdzdHZO6D3hvM6Snb96EOPxNf5AxQB2TBl9M1jytPYO733
         Dvhew9X+7QR5t4wH6iiv2jOOGxrf/6CsXkch5jkKB+stLu1T2RqoWjIA3sM/SOfV+4X6
         +ggA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=bgmXpaYak38VQLnaC7jUvN3P9ox5CniQKwCBVEqI3T8=;
        b=EnqiP+EWQWhGPrnhirNpq47Hqbb6mUldpm5aU1dKFgmylWPG4ECbrftWOi2w6pDWyf
         tyiFV3SlX9vXzj8Jub75Wj/Bt7WemYKge8fP8hmej1XItS341gkt+3HS0qb/169zkp0q
         pGU9HU+9vfrBcZkNonAhO1MKjpStXNTGrnuTvBkCXum/UCH2w0I7pttkQ7ZfOSJflSJW
         +Uq2qg+9X8tMRX3PYU5WptX7vFSGUiek1SiDIMHImwWUATTRM3Sf4XByYB6JLbgvke4l
         LfqAvuVcJpaumUFLHkdNRH1xEVFLt/RE1piWG2oyt+SGEgFMIu6r0tTmJ96ASc6bJcZY
         lGBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17si9108688eju.326.2019.07.15.09.12.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jul 2019 09:12:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hn3ar-0002rv-5R
	for alex.bennee@linaro.org; Mon, 15 Jul 2019 12:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57569)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hn3am-0002hH-Hc
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 12:12:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hn3al-000282-4X
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 12:12:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7447)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hn3ak-00027d-Sv; Mon, 15 Jul 2019 12:12:43 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B106030C31B8;
 Mon, 15 Jul 2019 16:12:41 +0000 (UTC)
Received: from gondolin (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C05801001DD9;
 Mon, 15 Jul 2019 16:12:09 +0000 (UTC)
Date: Mon, 15 Jul 2019 18:12:06 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190715181206.3cb1db93.cohuck@redhat.com>
In-Reply-To: <87a7dfth4i.fsf@dusky.pond.sub.org>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-2-philmd@redhat.com>
 <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
 <CAFEAcA-wgTVfj0TUJ=piP0wEgLGiNpOYia5DK2GQAO4Q7gNaWg@mail.gmail.com>
 <6d69e8ad-d720-ce04-20f2-a03193903078@redhat.com>
 <20190715125653.6e65d575.cohuck@redhat.com>
 <c1c68faf-0424-6c7c-e39f-42159457c3ee@redhat.com>
 <20190715130955.4a117388.cohuck@redhat.com>
 <13fce62f-234c-1b13-595f-5910c066bc4f@redhat.com>
 <6c39a198-e951-c0bd-1ddc-5d227afe72ff@redhat.com>
 <87a7dfth4i.fsf@dusky.pond.sub.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 15 Jul 2019 16:12:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [qemu-s390x] [RFC PATCH 1/3]
 hw/Kconfig: PCI bus implies PCI_DEVICES
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Collin Walling <walling@linux.ibm.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Richard Henderson <rth@twiddle.net>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:S390" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eM8oEzJ6nkTO

On Mon, 15 Jul 2019 18:08:45 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>=20
> > On 7/15/19 3:19 PM, Thomas Huth wrote: =20
> >> On 15/07/2019 13.09, Cornelia Huck wrote: =20
> >>> On Mon, 15 Jul 2019 13:04:28 +0200
> >>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> >>> =20
> >>>> On 7/15/19 12:56 PM, Cornelia Huck wrote: =20
> >>>>> On Mon, 15 Jul 2019 12:48:55 +0200
> >>>>> Thomas Huth <thuth@redhat.com> wrote:
> >>>>>    =20
> >>>>>> On 15/07/2019 12.19, Peter Maydell wrote:   =20
> >>>>>>> On Mon, 15 Jul 2019 at 11:15, Thomas Huth <thuth@redhat.com> wrot=
e:     =20
> >>>>>>>>
> >>>>>>>> On 15/07/2019 11.55, Philippe Mathieu-Daud=C3=A9 wrote:     =20
> >>>>>>>>> If a controller device provides a PCI bus, we can plug any PCI
> >>>>>>>>> daughter card on it.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >>>>>>>>> ---     =20
> >>>>>>>      =20
> >>>>>>>>> diff --git a/hw/pci/Kconfig b/hw/pci/Kconfig
> >>>>>>>>> index 77f8b005ff..0f7267db35 100644
> >>>>>>>>> --- a/hw/pci/Kconfig
> >>>>>>>>> +++ b/hw/pci/Kconfig
> >>>>>>>>> @@ -1,5 +1,6 @@
> >>>>>>>>>  config PCI
> >>>>>>>>>      bool
> >>>>>>>>> +    imply PCI_DEVICES     =20
> >>>>>>>>
> >>>>>>>> No, please don't change this. This was done on purpose, since al=
most all
> >>>>>>>> PCI_DEVICES do not work on s390x (so s390x does *not* imply PCI_=
DEVICES).     =20
> >>>>>>>
> >>>>>>> But that means that every board that provides PCI has to have an
> >>>>>>> "imply PCI_DEVICES" line, which is pretty clunky just to work
> >>>>>>> around an s390x limitation.
> >>>>>>>
> >>>>>>> Is there some way in the Kconfig syntax for s390x to say
> >>>>>>> "no PCI_DEVICES" so we can have the corner-case be handled
> >>>>>>> by the s390x Kconfig in one place rather than in 20 places
> >>>>>>> affecting everywhere except s390x?     =20
> >>>>>>
> >>>>>> IIRC the problem on s390x are the legacy IRQs. s390x has only MSIs=
. So I
> >>>>>> guess the correct way to fix this would be to introduce some
> >>>>>> PCI_LEGACY_IRQ switch and let all old devices that do not work wit=
h MSI
> >>>>>> depend on it.   =20
> >>>>>
> >>>>> s/MSI/MSI-X/, IIRC. Not sure how far 'legacy' would stretch.   =20
> >>>>
> >>>> Maybe we can have something like PCI_LEGACY_DEVICES and PCI_MSI_DEVI=
CES?
> >>>>
> >>>> So if s390x only selects PCI_LEGACY (not PCI_MSI) bus, then it only =
get
> >>>> legacy devices? =20
> >>>
> >>> Wrong way around? We need MSI-X for s390x, not plain MSI or
> >>> 'legacy' (whatever that is). =20
> >>=20
> >> With "legacy" I meant the old level-triggered interrupts from the early
> >> PCI (non-express) days. Sorry for being imprecise here.
> >>=20
> >> So maybe we need two new switches, PCI_CLASSIC (or so) and PCI_MSIX, a=
nd
> >> then the PCI devices should be marked with "default y if PCI_CLASSIC" =
if
> >> they do not have MSIX support, and with "default y if PCI_MSIX" if they
> >> have MSI-X support? =20
> >
> > Something like that :)
> >
> > Per Wikipedia:
> >
> >   Conventional PCI and PCI-X are sometimes called Parallel PCI
> >   in order to distinguish them technologically from their more
> >   recent successor PCI Express, which adopted a serial,
> >   lane-based architecture.
> >
> >   The PCI-SIG introduced the serial PCI Express in c.=E2=80=892004. At
> >   the same time, they renamed PCI as Conventional PCI.
> >
> >   PCI Express does not have physical interrupt lines at all.
> >   It uses message-signaled interrupts exclusively.
> >
> > What about PCI_CONVENTIONAL then? =20
>=20
> What kinds of PCI devices are we trying to name?
>=20
> Is it INTx vs. MSI vs. MSI-X?

I think for s390x we need (INTx || MSI) vs MSI-X...

>=20
> Is it Conventional PCI vs. PCI Express?

...while this is probably more INTx vs (MSI || MSI-X)?
