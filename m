Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp336572lfy;
        Tue, 11 Aug 2020 04:04:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGdrYLTCfjxVzKZeByUmeMP5Gro2ze31YeO13naq+5Vj9UsH30oULM19I6YUp9lp39yyEa
X-Received: by 2002:a50:9fc9:: with SMTP id c67mr25970724edf.69.1597143893231;
        Tue, 11 Aug 2020 04:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597143893; cv=none;
        d=google.com; s=arc-20160816;
        b=GVDybX2QTa3HUvq80HZWGVB3l7HiFjhG65IB57ZyJ16sQek/8t5LxLl/i0bHv7dSU1
         SyzqdGP6Ic1yfskZTuuSGbPE/ds3Uv5DRTCrTbFBXTVheY/+1uQYYj+E2BuhsWucMvVA
         3R0ZxmdmuRT3l6MckxLq5E+nlEehUO8ana+HhylU+o0pSjen3PdOnkz97IajtBcvGccy
         dyDV3+F8chvJzTh9q/mU00I2V8+yG9HCK125yR5Bi2AOa8R6dwxrW2BuOUYXnQ/9nNYf
         Wivmwh9vuaFmefMFnwbPh66ntJQLpQovx1zM/Wr8jtTxJm0OvjRoEdW1cUa5PmzPmHjD
         Cycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=LB0f2MRmQoQo40Yq2DAO9ZoMYhBNsLZuIU/pXNlvtX4=;
        b=eNDaWwXo/0Q2dYoJJiy1l3r0q+Sa8w93Cv7l3yzWFTU+p8D/ru5DRKqrzS7fxE6lgE
         eP37ggvnVCyLBf/To9cbZPdBJTk+GlUEJqjNZ8bVt/2CmoicO0x/CPcq41Funxv7eaHQ
         zb/HujAzHbNH6NGkddHJ0H0PYbcm+AiwOggzMJjTMrxGkkpJgJB/G/VOcKiuCvoyXXck
         WGSmpRHO4lQ+td92toqKVOkLaNSCgaZQIRLG3gotSUoVV/Rw51VfAMUcDDdTQKQMLmz4
         DgzOd9dov3aSbTLSuISUAuV5eSQ1WtcDY5H9kxTLgpbc4kqI/TKpHOQ94slloWc1dfP2
         GqHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Yg3bVzDI;
       spf=pass (google.com: domain of cohuck@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id v13si12105642edr.516.2020.08.11.04.04.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2020 04:04:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Yg3bVzDI;
       spf=pass (google.com: domain of cohuck@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597143892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LB0f2MRmQoQo40Yq2DAO9ZoMYhBNsLZuIU/pXNlvtX4=;
	b=Yg3bVzDIgTF+ZJEQGl7RAji6neBHp8pQZeyYEn8wyQYrd31+xGn3jGzLjvgDyXZuTXOih7
	PvACUeGUxK5QSyfs8oPdiZoO06RiBdEhX7LCfaF5sp9AgmLvcWppTT/43tOdsxPn2cEXvD
	cZ/YKuNyNYi+4ntyMc695IKeOSyiK7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-i4__DAIrM7uPuV6zPkm9Yw-1; Tue, 11 Aug 2020 07:04:50 -0400
X-MC-Unique: i4__DAIrM7uPuV6zPkm9Yw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62654107ACCA;
	Tue, 11 Aug 2020 11:04:48 +0000 (UTC)
Received: from gondolin (ovpn-113-33.ams2.redhat.com [10.36.113.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C40E5F1E9;
	Tue, 11 Aug 2020 11:04:37 +0000 (UTC)
Date: Tue, 11 Aug 2020 13:04:34 +0200
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
Message-ID: <20200811130434.7388cfa2.cohuck@redhat.com>
In-Reply-To: <20200730114541.4dbdd15e.cohuck@redhat.com>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
	<20200723025657.644724-9-bauerman@linux.ibm.com>
	<20200727144350.47abd7e7.cohuck@redhat.com>
	<87a6zjuoru.fsf@morokweng.localdomain>
	<20200730114541.4dbdd15e.cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: C9aGi+CY5TNi

On Thu, 30 Jul 2020 11:45:41 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Tue, 28 Jul 2020 21:51:33 -0300
> Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:
> 
> > Hi,
> > 
> > Cornelia Huck <cohuck@redhat.com> writes:
> >   
> > > On Wed, 22 Jul 2020 23:56:57 -0300
> > > Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:
> > >    
> > >> Instead of setting CPUState::halted to 1 in s390_cpu_initfn(), use the
> > >> start-powered-off property which makes cpu_common_reset() initialize it
> > >> to 1 in common code.
> > >> 
> > >> Note that this changes behavior by setting cs->halted to 1 on reset, which
> > >> didn't happen before.    
> > >
> > > I think that should be fine, as we change the cpu state to STOPPED in
> > > the reset function, which sets halted to 1.    
> > 
> > Nice, thanks for checking.
> >   
> > >> 
> > >> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> > >> ---
> > >>  target/s390x/cpu.c | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >> 
> > >> NB: I was only able to test that this patch builds. I wasn't able to
> > >> run it.    
> > >
> > > No noticeable difference under kvm, but running under tcg seems a bit
> > > more sluggish than usual, and I saw some pausing on reboot (after the
> > > bios handover to the kernel). Not sure if it were just flukes on my
> > > laptop, would appreciate if someone else could give it a go.    
> 
> Experimented a bit with it again. There's a pause when switching from
> the bios to the kernel (after the load reset normal has been done, I
> guess), which is always there, but seems to get more noticeable with
> this patch (varying wildly, but seems longer on average.) Hard to pin
> down, and I don't really see a reason why that should happen, as we
> should end up with halted == 1 in any case. Might still be a fluke,
> even though I see it both on my laptop and on an LPAR (when running
> under tcg; not seen under kvm, which is much faster anyway.)

Tried again, the pause now seems comparable to the pause prior to this
series. Might depend on the phase of the moon.

I ran kvm unit tests on it, and it looks good. So, I'm reasonable
confident that this is fine, really just seems to be a fluke.

Acked-by: Cornelia Huck <cohuck@redhat.com>
