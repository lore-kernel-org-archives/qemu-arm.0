Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4417018wrv;
        Tue, 30 Jul 2019 06:56:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyqVC5+bIRZGly5nXBVRuIoQDQ+mAscpkcu+HO8mjEfYqp9Tz5SA/W5ineN+bmuET2+R20C
X-Received: by 2002:ac8:2e5d:: with SMTP id s29mr81897965qta.70.1564494974700;
        Tue, 30 Jul 2019 06:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564494974; cv=none;
        d=google.com; s=arc-20160816;
        b=vT4OI5ItqDaQamPd3qyAN4wy1zEbiM5Tk0UvhTUGGGZ7YAdtqzZ0JMCN+6v+jNVKiV
         iiNt6wJPb7pVFJxmF/JxV0Flsui6TvZlKj50BepUqJwLN2IHsoee6JQ5VeiMtbeDblA3
         jDUGKyprSxaznaJoxvyv9KaCCiilgTw6HdVq/3ic5yhZyQYQPY+shPxrRIJbYbsBpfvI
         mlBVmPxmPF27c1D7x+CF0FfX0jCqL2VMHoev8jwaLv9jqzz2+03CUfma/2OLiKBRjFUU
         ACBuf13NV3tP6oKln6lbBTQxSwkbV8mL9xX7SltDDlCi3es1jevucAMMMknig5/grhFq
         RIbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=Wmjh4niC4YbMkpFM0KSV4x3d85EeInMRvmcal8FAn2c=;
        b=SQ/0O4v2wzw/6rDMonpbQA5mlWzfPzI6vvs21nrbPewYw6nbVc+jakK+3iAsUvbZov
         dNiaAn95GmQ0gxPgLurYjYvH57PxINWf8Clv4gvQw9IP5kpkHLrQsbvHYzy57bUfI6wR
         mD9MS7G2kv5IJvpLaPnLaRQgfAjPmBD3P9SfknS4Eh5ZtjiQpVyiNN754Bm9lknonPEi
         z3N3Sy1SjYdXSjqqLbX5RxHXNXFqndSLFtOTzO713FkPFb6KD2yHfYAbm7m/P6CljfGg
         NJOETYgl4dq56jJjp5h3Y0anv5NWIcozZFAYhXIOj9wTuzoB/4pEPbB6YjLInbApApAO
         2EeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d48si38887023qta.166.2019.07.30.06.56.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2019 06:56:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsSbu-0005pL-AE
	for alex.bennee@linaro.org; Tue, 30 Jul 2019 09:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54066)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hsSbo-0005p0-Aw
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 09:56:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hsSbn-0006zy-Dc
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 09:56:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33494)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hsSbn-0006za-7U; Tue, 30 Jul 2019 09:56:07 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2084A86679;
 Tue, 30 Jul 2019 13:56:06 +0000 (UTC)
Received: from gondolin (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F932600F8;
 Tue, 30 Jul 2019 13:55:49 +0000 (UTC)
Date: Tue, 30 Jul 2019 15:55:47 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190730155547.7b201f5e.cohuck@redhat.com>
In-Reply-To: <CAFEAcA-rwBiXkDEDuT-=KQVJ2A2ob16=P0obbZBPUfZeYXy+dQ@mail.gmail.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-2-damien.hedde@greensocs.com>
 <20190730154209.2049f10a.cohuck@redhat.com>
 <CAFEAcA-rwBiXkDEDuT-=KQVJ2A2ob16=P0obbZBPUfZeYXy+dQ@mail.gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 30 Jul 2019 13:56:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 01/33] Create Resettable QOM interface
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
X-TUID: JTYbA1unTf7Y

On Tue, 30 Jul 2019 14:44:21 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 30 Jul 2019 at 14:42, Cornelia Huck <cohuck@redhat.com> wrote:
> >
> > On Mon, 29 Jul 2019 16:56:22 +0200
> > Damien Hedde <damien.hedde@greensocs.com> wrote:
> >
> > (...)
> >  
> > > +/*
> > > + * ResettableClass:
> > > + * Interface for resettable objects.
> > > + *
> > > + * The reset operation is divided in several phases each represented by a
> > > + * method.
> > > + *
> > > + * Each Ressetable must maintain a reset counter in its state, 3 methods allows
> > > + * to interact with it.
> > > + *
> > > + * @phases.init: should reset local state only. Takes a bool @cold argument
> > > + * specifying whether the reset is cold or warm. It must not do side-effect
> > > + * on others objects.  
> >
> > I'm having a hard time figuring out what a 'cold' or a 'warm' reset is
> > supposed to be... can you add a definition/guideline somewhere?  
> 
> Generally "cold" reset is "power on" and "warm" is "we were already
> powered-on, but somebody flipped a reset line somewhere".

Ok, that makes sense... my main concern is to distinguish that in a
generic way, as it is a generic interface. What about adding something
like:

"A 'cold' reset means that the object to be reset is initially reset; a 'warm'
reset means that the object to be reset has already been initialized."

Or is that again too generic?
