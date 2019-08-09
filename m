Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8991996wrv;
        Fri, 9 Aug 2019 03:07:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyq1+4759B0KSZ0xr6CsmZgd9FyYQbZZLNE+ati2Frj/ucls0o9wT8LbNqUi1NldXSt32RL
X-Received: by 2002:a37:454:: with SMTP id 81mr16983310qke.153.1565345247109;
        Fri, 09 Aug 2019 03:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565345247; cv=none;
        d=google.com; s=arc-20160816;
        b=uhBymbQKdn6EigHloKizpEYAHwmo1sHcw7MrC9m0lkobEbnA8Dh/1PVGEBxYpnuj/F
         aQxRKMMldhBNHJrT44uiDt3vplEYPDxkkAXtTL3pyATcVewg5unvvqynmZNWB7vlfaWX
         YP24HQiZW+R0BDLkYypoR6/JlzE7jGnzz8EeyMdpOgvW0kW1o1Q2Iscyj6uvQKBlLcJT
         BMnMsWVvmDIc04mqe49BMsxwpRHt2ukGyKkOebTMf0P4m7JiVZKK9Qv1zVG4TFiBPVPj
         NWWhO76fQINPtzgdKrC7IVsXzIULJHZkRlcFGxBlGzHVtmYKstTYDDYp1rJVBFfNg+if
         zSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XeT7BvhxEgRJwO5+e9hL4zRtiLYu90rq+weQWvvrFTM=;
        b=pXHztESRsonnQbR05hH4/BwcvAw/zCU8wEDkH1mTdtXD4G38NIu2Pcx7z114ltDYbz
         0ul9UCiRgtx0D1DdBHnDZmGAJejhDSuX11/4oQO1NV4gTPirHPr6xapf1CJ1osAJFG/d
         uBAvUYTMjkxNQtj6lMxdnPd3FZEPQHxz5MjXchb1/VaGTEmz9vCGXcIKq8JqxcWMGhlR
         V5IXvNkUIySbm19mlK0/bBvX7ZVa6DIMbTQMjYGd99QYnQPIxO+qm/ralEjy5kWRhmNP
         chwL8tQWCBiBEX2qhj1uhcbAEfAf++TvqC1I54Uy0mbB8I0yLDwDS5YXDplqXFW0gfd5
         F52A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dZjcvFz5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18si391412qvc.47.2019.08.09.03.07.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 03:07:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dZjcvFz5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hw1ny-0006Zg-Jw
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 06:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55191)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hw1ns-0006ZI-IT
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 06:07:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hw1nr-0004F9-EG
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 06:07:20 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41190)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hw1nr-0004Da-7u
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 06:07:19 -0400
Received: by mail-ot1-x344.google.com with SMTP id o101so130513505ota.8
 for <qemu-arm@nongnu.org>; Fri, 09 Aug 2019 03:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XeT7BvhxEgRJwO5+e9hL4zRtiLYu90rq+weQWvvrFTM=;
 b=dZjcvFz5cR3gXeRQdOTh0lHELhVxEw3ACeou/ShwKsOWbKgpC/HV4YxPp0shkMP2wj
 Hbng+/t8i9YMf+vNxzyjV2rv+kE+1s3OyRjnrRAj9Q/pvICTeVK94pu9BpDveJiQuu63
 e3YJzZTX32v8fm7sv5T92amzxHIu7UEcvFYHMAB3jNxW4PIG5R5+Wt0/GTWaUl2r1LgR
 cAfdYGTzpb+9tJOHx6Ax0jwPIILXLG8CHLzqdV1F/ofN2AymH2Oqgvnn2e2Wi2flCTBN
 QGVUJX/o0ii8klk+yIhsiAMVm970C2kgsxI+ixpsrBTsj8ro0ZxU5zGvB0KirUoqDT2d
 KWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XeT7BvhxEgRJwO5+e9hL4zRtiLYu90rq+weQWvvrFTM=;
 b=haSqphtLProJjb7/9iP66KtTE6uVjtY3nNZlj81wec6UcAFdwlAI3f+45oCMaWo9n7
 heiISv89ZDNh4pY1TOmGblAHyhBwSogOZepWnKFGbAJyasGBCKemecxfSBVOmQ0pnt3o
 7NAL9jPVX1Wfc6+Edya3ILuMXv8YI3OmFepgAr/QPu2NTaeJLR6yILpefEIKeBIPfVUG
 mpfnOL5bRTksmk68/RNmI/kw2g/ygbGypU+EVVmzzayZXL7petbum4p6IWiCKZ7cpjq2
 1xxZGI+LZmUzLyO+oumef939XweWESAldJGEzIy1VDhGEs+X1b0opXiy1eqQY++/uJPn
 6UoA==
X-Gm-Message-State: APjAAAXNGKIMpaQ3b0b0m83463yXc1CDrOoY9zokHiQBV32HoK9ej7Q9
 HgvSJr+n0t6gPBUmf+3xKf0HTU7X6mNSHoq0ch+uBQ==
X-Received: by 2002:a9d:711e:: with SMTP id n30mr15665202otj.97.1565345238414; 
 Fri, 09 Aug 2019 03:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-8-damien.hedde@greensocs.com>
 <CAFEAcA-W0SaaGbUnGZ0b61ngxKY8R9xjwGXeN+=MaUi4bMDgNg@mail.gmail.com>
 <20190808154219.GK2852@work-vm>
In-Reply-To: <20190808154219.GK2852@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Aug 2019 11:07:07 +0100
Message-ID: <CAFEAcA8L2YVMCu3Gb+eQTDfCpgVwA_WwVPrqPLV2iQ9rZ4HuTA@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v3 07/33] automatically add vmstate for reset
 support in devices
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
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k3rq96c8YJj2

On Thu, 8 Aug 2019 at 16:42, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Mon, 29 Jul 2019 at 15:59, Damien Hedde <damien.hedde@greensocs.com> wrote:
> > >
> > > This add the reset related sections for every QOM
> > > device.
> >
> > A bit more detail in the commit message would help, I think --
> > this is adding extra machinery which has to copy and modify
> > the VMStateDescription passed in by the device in order to
> > add the subsection that handles reset.
> >
> > I've added Dave Gilbert to the already long cc list since this
> > is migration related.
>
> I don't like dynamically modifying all the vmsds.

Yeah, I'm not a huge fan of it either, but it does mean that
the state gets migrated and we don't have a pile of really
easy to miss bugs where we forgot to say "this device needs to
migrate the reset state" and it means we don't have every
device we ever write in the future needing to say "this device
needs to migrate reset state"...

> Aren't you going to have to understand each devices reset behaviour
> and make sure it does something sane? e.g. it might have a postload
> that registers a timer or something that you wouldn't want to do if it's
> in reset.
>
> The easiest way is to write a macro that you can easily add to devices
> you've checked subsection list (like the way we have a
> VMSTATE_USB_DEVICE).

One problem is that as soon as somebody writes a USB controller
or PCI controller model that can be held in reset, every
device that could sat behind it automatically now could find
that it's migrated while it's in reset.

thanks
-- PMM
