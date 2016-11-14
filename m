Received: by 10.25.150.194 with SMTP id y185csp1017637lfd;
        Mon, 14 Nov 2016 06:12:06 -0800 (PST)
X-Received: by 10.55.163.138 with SMTP id m132mr16215080qke.88.1479132726865;
        Mon, 14 Nov 2016 06:12:06 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c36si10882145qtd.119.2016.11.14.06.12.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Nov 2016 06:12:06 -0800 (PST)
Received-SPF: permerror (google.com: permanent error in processing during lookup of drjones@redhat.com: _spf1.redhat.com not found) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=permerror (google.com: permanent error in processing during lookup of drjones@redhat.com: _spf1.redhat.com not found) smtp.mailfrom=drjones@redhat.com
Received: from int-mx09.intmail.prod.int.phx2.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0E96C00F1F7;
	Mon, 14 Nov 2016 14:12:05 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uAEEC1WX011832
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 14 Nov 2016 09:12:03 -0500
Date: Mon, 14 Nov 2016 15:12:00 +0100
From: Andrew Jones <drjones@redhat.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: peter.maydell@linaro.org, kvm@vger.kernel.org, marc.zyngier@arm.com,
        qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
        pbonzini@redhat.com, alex.bennee@linaro.org,
        kvmarm@lists.cs.columbia.edu, christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v5 07/11] arm/arm64: gicv2:
 add an IPI test
Message-ID: <20161114141200.26dgydd6xwsr3p7z@kamzik.brq.redhat.com>
References: <1478798481-25030-1-git-send-email-drjones@redhat.com>
 <1478798481-25030-8-git-send-email-drjones@redhat.com>
 <53d2bd86-61c6-5717-7bfd-1c6594e3dd43@arm.com>
 <20161111131331.hndvzivzej2mzxiq@hawk.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161111131331.hndvzivzej2mzxiq@hawk.localdomain>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Mon, 14 Nov 2016 14:12:06 +0000 (UTC)
X-TUID: LMIbDygmjVEv

On Fri, Nov 11, 2016 at 02:13:31PM +0100, Andrew Jones wrote:
> On Fri, Nov 11, 2016 at 11:13:46AM +0000, Andre Przywara wrote:
> > Hi,
> > 
> > more a comment loosely related to this patch ...
> > 
> > > diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> > > index 3f6fa45c587e..68bf5cd6008f 100644
> > > --- a/arm/unittests.cfg
> > > +++ b/arm/unittests.cfg
> > > @@ -54,3 +54,10 @@ file = selftest.flat
> > >  smp = $MAX_SMP
> > >  extra_params = -append 'smp'
> > >  groups = selftest
> > > +
> > > +# Test GIC emulation
> > > +[gicv2-ipi]
> > > +file = gic.flat
> > > +smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> > 
> > So here we always go with the maximum number of VCPUs in the guest.
> > However (as you also noted in your cover-letter) running with a
> > different number of CPUs might be interesting, for instance with less
> > than 8 CPUs on a GICv2 (the ITARGETSR register must be masked) or in
> > general with an odd number (both literally and in the broader sense). I
> > have a test case with passes with 8 VCPUs but fails with less.
> > 
> > Is there any good way to run some tests multiple times with different
> > numbers of VCPUS?
> > Shall we add some "set" functionality to the smp parameter, so that we
> > can specify a list of desired test points?
> >
> 
> We can just add multiple entries, e.g.
> 
> [gicv2-ipi]
> file = gic.flat
> smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> [gicv2-ipi-3]
> file = gic.flat
> smp = $((($MAX_SMP > 3)?3:$MAX_SMP))
> 
> or whatever. But we need to always consider MAX_SMP, since some
> machines may less than 8.
>

Hmm, thinking about this some more, the unit test needs to know how
many processors the test wants, in order to ensure it's testing
correctly. We should provide the number to both -smp and -append,
like we do for selftest-setup.

So, we can have one test that doesn't care, just uses MAX_SMP or 8,
like this patch introduces, but then for each test that does care we
need, e.g.

 smp = 3
 extra_params = '... smp=3 ...'

Then the unit test will start exactly 2 secondaries (or abort if
they're not available)

Anyway, I don't think this is something we should extend the framework
for, but rather address it with unittests.cfg and unit test input
validation.

Thanks,
drew
