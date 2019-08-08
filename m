Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7676882wrv;
        Thu, 8 Aug 2019 03:26:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4qG5/vGm9KKNLPJOjQO4PNsRnE7mI68tDA8zK3NZiCAturyjbDy9wRrsUzrseScH3SaDC
X-Received: by 2002:ac8:234a:: with SMTP id b10mr12601016qtb.261.1565260005115;
        Thu, 08 Aug 2019 03:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565260005; cv=none;
        d=google.com; s=arc-20160816;
        b=V1MEHCJPNQ+t/sXJjfCYC9sEhAQVEx8qtrefSOm27bt6xgGZz6cWbYbDT8W2H/CqL8
         0sRTn0vEyb8puGF6gPpOqxp36vZ4aAw5B8fM0+nG+g43bXT2CjcI/yYPV4iKbnZ9GT1E
         E2DrQEp3IdeYk+Eex48yZx5XhyCW7UMgX+ImUkTuyh/S6uEZjGc3C4OD9SbHseHnH2j9
         yktYlj15DCyk/iNV9OAuZxbMeH7vyEhnuBQrWkaqFA6jWGibMQ23LOMCGN4y72hntA8Z
         PLnjchcGZ86CF63OSj8Xmc96evgQMNAyPoLNRz6sCOsIOidPnrV/oUsKRgDyZzEkpbBJ
         76hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=I4fNdlplklGAwwpbVqOr/rPExZHq+YfTal0VvvQCokE=;
        b=LM8Kmci0SxJvDFud60snOnC00+qLdf+jwLfl/Oj5G75EH5Uv5pdOVOZ1NeFaCv+guL
         /B77vSWJfagKwOLGv7V5pCki96MdgyP8XcPED2AsxT/ecvGQZB7sgW1P8ZDKq+T8e2Wg
         fBYl2iS1VVYg/Y66fLGcrHCP3zobbSDhWVm+4o4vuQ9SHK4+YvYB3htBUgzepOB7Ma0b
         j7PVoVVcIIFv2M2HGRXs4/qcSCkDmCXs38EyN7s5ufShR0Nn2Pk+y5F3749HoofoK4m7
         PpkUWE3RyXC2tviF+1vzA0nDQcn5jM8+b4xZDuzizPS0inNUETKxDgsh8lHEOyxTCgRH
         sldA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18si257022qkn.6.2019.08.08.03.26.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 03:26:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvfd6-0008EV-Jx
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 06:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32837)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hvfcj-0008CF-GL
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 06:26:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hvfci-00010o-Bd
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 06:26:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53948)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hvfci-0000uO-29; Thu, 08 Aug 2019 06:26:20 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 613C2C0467C3;
 Thu,  8 Aug 2019 10:26:17 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06A6960600;
 Thu,  8 Aug 2019 10:25:59 +0000 (UTC)
Date: Thu, 8 Aug 2019 12:25:57 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190808122557.45e8d455.cohuck@redhat.com>
In-Reply-To: <CAFEAcA-WPX153SSC-M6y8LLzO86GaPvxATo1hu4e-UzkH8MXRg@mail.gmail.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-12-damien.hedde@greensocs.com>
 <CAFEAcA-WPX153SSC-M6y8LLzO86GaPvxATo1hu4e-UzkH8MXRg@mail.gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 08 Aug 2019 10:26:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 11/33] hw/s390x/ipl.c: remove
 qbus_reset_all registration
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
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lrlYuvo0J6T0

On Wed, 7 Aug 2019 16:24:30 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 29 Jul 2019 at 15:59, Damien Hedde <damien.hedde@greensocs.com> wrote:
> >
> > Replace deprecated qbus_reset_all by resettable_reset_cold_fn for
> > the ipl registration in the main reset handlers.
> >
> > This does not impact the behavior.
> >
> > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> > ---
> >  hw/s390x/ipl.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
> > index 60bd081d3e..402770a2c9 100644
> > --- a/hw/s390x/ipl.c
> > +++ b/hw/s390x/ipl.c
> > @@ -234,7 +234,11 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
> >       */
> >      ipl->compat_start_addr = ipl->start_addr;
> >      ipl->compat_bios_start_addr = ipl->bios_start_addr;
> > -    qemu_register_reset(qdev_reset_all_fn, dev);
> > +    /*
> > +     * TODO: when we add some kind of main reset container / domain
> > +     * switch to it to really benefit from multi-phase.
> > +     */  
> 
> I think this comment misses the mark a bit. Here's my suggestion:
> 
> /*
>  * Because this Device is not on any bus in the qbus tree (it is
>  * not a sysbus device and it's not on some other bus like a PCI
>  * bus) it will not be automatically reset by the 'reset the
>  * sysbus' hook registered by vl.c like most devices. So we must
>  * manually register a reset hook for it.
>  * TODO: there should be a better way to do this.
>  */

Agreed, that explains much better why we're doing this.

> 
> > +    qemu_register_reset(resettable_reset_cold_fn, dev);

This is fine for the conversion done within this series; but resetting
the ipl device is one case where the cold vs. warm distinction falls a
bit short (there's a s390_reset enum which covers more cases). Not sure
if we want some custom reset types?

> >  error:
> >      error_propagate(errp, err);
> >  }
> > --
> > 2.22.0
> >  
> 
> thanks
> -- PMM

