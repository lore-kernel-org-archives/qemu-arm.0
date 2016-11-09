Received: by 10.25.150.194 with SMTP id y185csp211410lfd;
        Wed, 9 Nov 2016 03:57:38 -0800 (PST)
X-Received: by 10.55.3.2 with SMTP id 2mr20224906qkd.65.1478692658197;
        Wed, 09 Nov 2016 03:57:38 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l18si23376976qta.85.2016.11.09.03.57.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Nov 2016 03:57:38 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx14.intmail.prod.int.phx2.redhat.com (int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 11AD280F63;
	Wed,  9 Nov 2016 11:57:37 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uA9BvWZ6003829
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 9 Nov 2016 06:57:34 -0500
Date: Wed, 9 Nov 2016 12:57:32 +0100
From: Andrew Jones <drjones@redhat.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
        alex.bennee@linaro.org, marc.zyngier@arm.com, eric.auger@redhat.com,
        christoffer.dall@linaro.org
Subject: Re: [kvm-unit-tests PATCH v4 03/11] arm/arm64: smp: support more
 than 8 cpus
Message-ID: <20161109115732.hpiaiigtgfgnrybt@kamzik.brq.redhat.com>
References: <1478636499-14339-1-git-send-email-drjones@redhat.com>
 <1478636499-14339-4-git-send-email-drjones@redhat.com>
 <f5509dd7-594b-04c8-20b0-2986fe1bcc41@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5509dd7-594b-04c8-20b0-2986fe1bcc41@arm.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 09 Nov 2016 11:57:37 +0000 (UTC)
X-TUID: oFXjQI3B1Z/J

On Wed, Nov 09, 2016 at 11:12:03AM +0000, Andre Przywara wrote:
[...]
> > diff --git a/lib/arm/setup.c b/lib/arm/setup.c
> > index 7e7b39f11dde..b6e2d5815e72 100644
> > --- a/lib/arm/setup.c
> > +++ b/lib/arm/setup.c
> > @@ -24,12 +24,22 @@ extern unsigned long stacktop;
> >  extern void io_init(void);
> >  extern void setup_args_progname(const char *args);
> >  
> > -u32 cpus[NR_CPUS] = { [0 ... NR_CPUS-1] = (~0U) };
> > +u64 cpus[NR_CPUS] = { [0 ... NR_CPUS-1] = (~0U) };
> 
> This should be ~0UL.

Indeed. Thanks.

> Also I think the type should be unsigned long to match the types used
> everywhere else.

I'll change mpidr_to_cpu to return u64 instead of unsigned long.
Actually I think Alex suggested that. I'm not sure why I haven't
done it...

> 
> >  int nr_cpus;
> >  
> >  struct mem_region mem_regions[NR_MEM_REGIONS];
> >  phys_addr_t __phys_offset, __phys_end;
> >  
> > +int mpidr_to_cpu(unsigned long mpidr)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < nr_cpus; ++i)
> > +		if (cpus[i] == (mpidr & MPIDR_HWID_BITMASK))
> > +			return i;
> > +	return -1;
> > +}
> > +
> >  static void cpu_set(int fdtnode __unused, u32 regval, void *info __unused)
> 
> I guess this needs to be extended as well, including
> dt_for_each_cpu_node() to cope with 64-bit reg properties in the CPU
> node (where the upper word is not 0).
> But this is not really crucial atm, so can be fixed in a follow-up patch.

Yeah, I'll do it as a followup series, because it'll affect powerpc too.

drew
