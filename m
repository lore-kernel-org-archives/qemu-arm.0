Received: by 10.25.150.194 with SMTP id y185csp1331587lfd;
        Fri, 11 Nov 2016 05:13:37 -0800 (PST)
X-Received: by 10.200.51.171 with SMTP id c40mr3201494qtb.131.1478870017714;
        Fri, 11 Nov 2016 05:13:37 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 29si6727971qkq.54.2016.11.11.05.13.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Nov 2016 05:13:37 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx09.intmail.prod.int.phx2.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B56D24E4F6;
	Fri, 11 Nov 2016 13:13:36 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-166.brq.redhat.com [10.40.204.166])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uABDDVbj029068
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 11 Nov 2016 08:13:34 -0500
Date: Fri, 11 Nov 2016 14:13:31 +0100
From: Andrew Jones <drjones@redhat.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, peter.maydell@linaro.org, marc.zyngier@arm.com,
        eric.auger@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
        christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v5 07/11] arm/arm64: gicv2:
 add an IPI test
Message-ID: <20161111131331.hndvzivzej2mzxiq@hawk.localdomain>
References: <1478798481-25030-1-git-send-email-drjones@redhat.com>
 <1478798481-25030-8-git-send-email-drjones@redhat.com>
 <53d2bd86-61c6-5717-7bfd-1c6594e3dd43@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53d2bd86-61c6-5717-7bfd-1c6594e3dd43@arm.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Fri, 11 Nov 2016 13:13:36 +0000 (UTC)
X-TUID: 0ILgl/EAqCZs

On Fri, Nov 11, 2016 at 11:13:46AM +0000, Andre Przywara wrote:
> Hi,
> 
> more a comment loosely related to this patch ...
> 
> > diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> > index 3f6fa45c587e..68bf5cd6008f 100644
> > --- a/arm/unittests.cfg
> > +++ b/arm/unittests.cfg
> > @@ -54,3 +54,10 @@ file = selftest.flat
> >  smp = $MAX_SMP
> >  extra_params = -append 'smp'
> >  groups = selftest
> > +
> > +# Test GIC emulation
> > +[gicv2-ipi]
> > +file = gic.flat
> > +smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> 
> So here we always go with the maximum number of VCPUs in the guest.
> However (as you also noted in your cover-letter) running with a
> different number of CPUs might be interesting, for instance with less
> than 8 CPUs on a GICv2 (the ITARGETSR register must be masked) or in
> general with an odd number (both literally and in the broader sense). I
> have a test case with passes with 8 VCPUs but fails with less.
> 
> Is there any good way to run some tests multiple times with different
> numbers of VCPUS?
> Shall we add some "set" functionality to the smp parameter, so that we
> can specify a list of desired test points?
>

We can just add multiple entries, e.g.

[gicv2-ipi]
file = gic.flat
smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
[gicv2-ipi-3]
file = gic.flat
smp = $((($MAX_SMP > 3)?3:$MAX_SMP))

or whatever. But we need to always consider MAX_SMP, since some
machines may less than 8.

Thanks,
drew
