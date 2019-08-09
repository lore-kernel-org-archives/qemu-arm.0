Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9229794wrv;
        Fri, 9 Aug 2019 06:51:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyzUYIahCdD25JJmdTtxtbfKnSzEy7Q3wr61p+QkqmGcUQWnt8oy8QopGDkQIl2xa7ATd5b
X-Received: by 2002:a0c:e588:: with SMTP id t8mr17973486qvm.179.1565358682246;
        Fri, 09 Aug 2019 06:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565358682; cv=none;
        d=google.com; s=arc-20160816;
        b=bJQUucOBjKe2aeQX+UrHXvsOLR+9sy2SvBDxy5LY98rudYjIqRi5wh7o18IfWGIdqR
         RjxTtWzHMUW/d6RAgTnqCNPsNLUsDVVYwvWTe30gpJlOWbm6ci45J2Vk7wNiWXroOEWd
         unGWfgAK0OB7JfGvR1CfZNbVVkQAsiiXqIU405s73yNV2HXHKZFuxrABpcZZozGDE7NE
         wOQ8WG2/SXHyQhOHLlpRYGFuOZmi+E28pCalOTTiOTqEFsmzC94CY9VtnVABVQ4VOtW8
         lq9nbHMoDalYmtOc/d7oTvZElrToEw3yEtKeY17XUYNQI/L9VjrQb8fpjSstJDRlkvgV
         jSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=4NyZeoeVEUBjJ3JBUZqCndDZ7MkkZ0qRycH2ZWeND2E=;
        b=rpPUYkdJStjKUIO6n5EW/7MUAnaA4OztGofMkUwMBd4qc3h0gS13x6VM8gZSmSywXU
         YCXsSRkCDfy/mdV5Q+lKO8PNn0xlsRPs/n/+oRDPPUpEYRFOpsEIIZ6Me5X56Y9LzQOn
         CE2BXaoGIJjyrEWJT5Mjz/hf4cUDBALs8goehowSpAWDaejTxVY3IhAeDHs+Qa0eo88g
         WoeM60NNe6jyym+0nwfy9XcR0u3cH31UO+58n2hMevVixkmB0hf6JG1Aw4lYUW2de8IP
         BDBQnXtc/M4DQtkuomHWY6PwEgEYHkCF6/jb8GXW8SV335Wdg5lSmZomJLhVsHObU6h9
         NNAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si40713124qkn.31.2019.08.09.06.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 06:51:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hw5If-0001fN-Qi
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 09:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34520)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hw5Ia-0001cb-7T
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 09:51:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hw5IZ-0001OF-6u
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 09:51:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:5009)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>)
 id 1hw5IY-0001NE-VR; Fri, 09 Aug 2019 09:51:15 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D9E4E308A958;
 Fri,  9 Aug 2019 13:51:12 +0000 (UTC)
Received: from work-vm (ovpn-117-184.ams2.redhat.com [10.36.117.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6798B65EB4;
 Fri,  9 Aug 2019 13:50:49 +0000 (UTC)
Date: Fri, 9 Aug 2019 14:50:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190809135046.GE2840@work-vm>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-8-damien.hedde@greensocs.com>
 <CAFEAcA-W0SaaGbUnGZ0b61ngxKY8R9xjwGXeN+=MaUi4bMDgNg@mail.gmail.com>
 <20190808154219.GK2852@work-vm>
 <CAFEAcA8L2YVMCu3Gb+eQTDfCpgVwA_WwVPrqPLV2iQ9rZ4HuTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8L2YVMCu3Gb+eQTDfCpgVwA_WwVPrqPLV2iQ9rZ4HuTA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 09 Aug 2019 13:51:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fSqVI07LtKja

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 8 Aug 2019 at 16:42, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > On Mon, 29 Jul 2019 at 15:59, Damien Hedde <damien.hedde@greensocs.com> wrote:
> > > >
> > > > This add the reset related sections for every QOM
> > > > device.
> > >
> > > A bit more detail in the commit message would help, I think --
> > > this is adding extra machinery which has to copy and modify
> > > the VMStateDescription passed in by the device in order to
> > > add the subsection that handles reset.
> > >
> > > I've added Dave Gilbert to the already long cc list since this
> > > is migration related.
> >
> > I don't like dynamically modifying all the vmsds.
> 
> Yeah, I'm not a huge fan of it either, but it does mean that
> the state gets migrated and we don't have a pile of really
> easy to miss bugs where we forgot to say "this device needs to
> migrate the reset state" and it means we don't have every
> device we ever write in the future needing to say "this device
> needs to migrate reset state"...
> 
> > Aren't you going to have to understand each devices reset behaviour
> > and make sure it does something sane? e.g. it might have a postload
> > that registers a timer or something that you wouldn't want to do if it's
> > in reset.
> >
> > The easiest way is to write a macro that you can easily add to devices
> > you've checked subsection list (like the way we have a
> > VMSTATE_USB_DEVICE).
> 
> One problem is that as soon as somebody writes a USB controller
> or PCI controller model that can be held in reset, every
> device that could sat behind it automatically now could find
> that it's migrated while it's in reset.

I'm not convinced though that they'll all be fixed by adding this
subsection; I think some of those devices you're going to have to
look at and see what they do.

Dave

> thanks
> -- PMM
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
