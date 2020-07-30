Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2396688lfy;
        Thu, 30 Jul 2020 02:45:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpUhG9C9Vop8QoSh/d6KzYHn/qVk+9F/aaRW0+TziUBMA9afoy+fMoAFRPgV9H2I3F0TFN
X-Received: by 2002:a25:ab34:: with SMTP id u49mr57073727ybi.203.1596102359733;
        Thu, 30 Jul 2020 02:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596102359; cv=none;
        d=google.com; s=arc-20160816;
        b=A4ZrtMAPoxg19MZH9Jz5I1Ka9X54My+DTR/+DxFVakn4LzX26HWNQw0J4Of1jn7p9T
         fT+pfmpJXG2X3TqcbYNy4fIxUOU3kC9WZ6GlQ2bmZnyepLSlRYycNFUJd60oHz71gKG1
         rwJn5qvHT+i39H1s9qUxvmSBeWcXe61Tfb2PZeEAtq/m2VUbjSM1234AhOJvGAtxVZYn
         P2qt5v59RlaGJAcRdSczLQLdWBm4v2CYk1oBo0SClpi/pQiPg90htnfi75IG/2LsIahK
         QFaRSDVoHp8EsQXpK6Aa331JrQEyf5ZpSJGuL7O3KdtDpWwcPDHMUmTJNs7hlF1F2GIw
         ltlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=xynJH410Zp5n/uQ+6+57XOtSHVdM21IMUCM7yAo3biE=;
        b=GOFJa7GF3daGjb5qIlDf8edQzEWQ76aNCE8nHHODkckKFJnQX+RsYk3urf2u+sMoGA
         Xb/t+RvKeR3B5FyGvYV3IK+v+6Q19VYkzlI9eX2iXf3DK+xtTNatxHHARAVFasPHFJEF
         R9jepM0g7206hQ0iorHmA+eBfOF6a4rnc6qj0v7nV/15PGn4V1KhjGjbxQkG7OAPjj77
         uq6s0Mi4vq/9Bc6GiVIqOghDz8ATgQgovvCkSHbVAq4wEvZIm2N+N6i+LhijzYSBm5vo
         fmXCnmiTq+GOJq0GyL51cK94JU9l4j+AnY1LmIMgv+FFBq2DKXEgIHCnvp5tYdt7JznV
         8LcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JfSnLCKn;
       spf=pass (google.com: domain of cohuck@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id z13si4618387ybr.271.2020.07.30.02.45.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jul 2020 02:45:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JfSnLCKn;
       spf=pass (google.com: domain of cohuck@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596102359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xynJH410Zp5n/uQ+6+57XOtSHVdM21IMUCM7yAo3biE=;
	b=JfSnLCKn2gQY5KvDPXi4I9sr5gUw4AhXRgPxFZRdKc78tCppC1Bh8274KYD+2fzhHsX+AF
	TnTrFVVnk84NZP72nvMDN10l3Z2tBu4tC8SLvyCBuxSUCxrWrBBpOU+fyFzRqkdWYJc5MS
	iiOXIPX6dkSLHP4k05Av8bQkpB9xvRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-DvLsdWkUOn-DTSX3n1AG1A-1; Thu, 30 Jul 2020 05:45:55 -0400
X-MC-Unique: DvLsdWkUOn-DTSX3n1AG1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3802C1B2C980;
	Thu, 30 Jul 2020 09:45:52 +0000 (UTC)
Received: from gondolin (ovpn-112-203.ams2.redhat.com [10.36.112.203])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC8785DA76;
	Thu, 30 Jul 2020 09:45:43 +0000 (UTC)
Date: Thu, 30 Jul 2020 11:45:41 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Greg Kurz
 <groug@kaod.org>
Subject: Re: [RFC PATCH v3 8/8] target/s390x: Use start-powered-off CPUState
 property
Message-ID: <20200730114541.4dbdd15e.cohuck@redhat.com>
In-Reply-To: <87a6zjuoru.fsf@morokweng.localdomain>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
	<20200723025657.644724-9-bauerman@linux.ibm.com>
	<20200727144350.47abd7e7.cohuck@redhat.com>
	<87a6zjuoru.fsf@morokweng.localdomain>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: kvQ4oQ+6hN3g

On Tue, 28 Jul 2020 21:51:33 -0300
Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:

> Hi,
> 
> Cornelia Huck <cohuck@redhat.com> writes:
> 
> > On Wed, 22 Jul 2020 23:56:57 -0300
> > Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:
> >  
> >> Instead of setting CPUState::halted to 1 in s390_cpu_initfn(), use the
> >> start-powered-off property which makes cpu_common_reset() initialize it
> >> to 1 in common code.
> >> 
> >> Note that this changes behavior by setting cs->halted to 1 on reset, which
> >> didn't happen before.  
> >
> > I think that should be fine, as we change the cpu state to STOPPED in
> > the reset function, which sets halted to 1.  
> 
> Nice, thanks for checking.
> 
> >> 
> >> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> >> ---
> >>  target/s390x/cpu.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> NB: I was only able to test that this patch builds. I wasn't able to
> >> run it.  
> >
> > No noticeable difference under kvm, but running under tcg seems a bit
> > more sluggish than usual, and I saw some pausing on reboot (after the
> > bios handover to the kernel). Not sure if it were just flukes on my
> > laptop, would appreciate if someone else could give it a go.  

Experimented a bit with it again. There's a pause when switching from
the bios to the kernel (after the load reset normal has been done, I
guess), which is always there, but seems to get more noticeable with
this patch (varying wildly, but seems longer on average.) Hard to pin
down, and I don't really see a reason why that should happen, as we
should end up with halted == 1 in any case. Might still be a fluke,
even though I see it both on my laptop and on an LPAR (when running
under tcg; not seen under kvm, which is much faster anyway.)

> 
> I tried today setting up a TCG guest, but didn't have success yet.
> Will try some more tomorrow.
> 

I'm also looking a bit at the other s390 folks :)
