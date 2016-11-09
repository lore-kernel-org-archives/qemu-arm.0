Received: by 10.25.150.194 with SMTP id y185csp219071lfd;
        Wed, 9 Nov 2016 04:13:06 -0800 (PST)
X-Received: by 10.200.39.90 with SMTP id h26mr19356293qth.88.1478693586688;
        Wed, 09 Nov 2016 04:13:06 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id p11si23399725qkh.230.2016.11.09.04.13.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Nov 2016 04:13:06 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx09.intmail.prod.int.phx2.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79B5E445CD;
	Wed,  9 Nov 2016 12:13:05 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uA9CD0bu016632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 9 Nov 2016 07:13:03 -0500
Date: Wed, 9 Nov 2016 13:13:00 +0100
From: Andrew Jones <drjones@redhat.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: peter.maydell@linaro.org, kvm@vger.kernel.org, marc.zyngier@arm.com,
        qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
        pbonzini@redhat.com, alex.bennee@linaro.org,
        kvmarm@lists.cs.columbia.edu, christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v4 03/11] arm/arm64: smp:
 support more than 8 cpus
Message-ID: <20161109121300.u3pnyblrcni57pzy@kamzik.brq.redhat.com>
References: <1478636499-14339-1-git-send-email-drjones@redhat.com>
 <1478636499-14339-4-git-send-email-drjones@redhat.com>
 <f5509dd7-594b-04c8-20b0-2986fe1bcc41@arm.com>
 <20161109115732.hpiaiigtgfgnrybt@kamzik.brq.redhat.com>
 <33e2c904-cea1-6d21-4be9-b3fbd037c563@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33e2c904-cea1-6d21-4be9-b3fbd037c563@arm.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Wed, 09 Nov 2016 12:13:05 +0000 (UTC)
X-TUID: BqhP1CpkhpQp

On Wed, Nov 09, 2016 at 12:01:42PM +0000, Andre Przywara wrote:
> Hi,
> 
> On 09/11/16 11:57, Andrew Jones wrote:
> > On Wed, Nov 09, 2016 at 11:12:03AM +0000, Andre Przywara wrote:
> > [...]
> >>> diff --git a/lib/arm/setup.c b/lib/arm/setup.c
> >>> index 7e7b39f11dde..b6e2d5815e72 100644
> >>> --- a/lib/arm/setup.c
> >>> +++ b/lib/arm/setup.c
> >>> @@ -24,12 +24,22 @@ extern unsigned long stacktop;
> >>>  extern void io_init(void);
> >>>  extern void setup_args_progname(const char *args);
> >>>  
> >>> -u32 cpus[NR_CPUS] = { [0 ... NR_CPUS-1] = (~0U) };
> >>> +u64 cpus[NR_CPUS] = { [0 ... NR_CPUS-1] = (~0U) };
> >>
> >> This should be ~0UL.
> > 
> > Indeed. Thanks.
> > 
> >> Also I think the type should be unsigned long to match the types used
> >> everywhere else.
> > 
> > I'll change mpidr_to_cpu to return u64 instead of unsigned long.
> 
> I am not sure this is the right direction. unsigned long is really the
> natural type for MPIDR, since this is a system register with exactly the
> native register size.
> I think we use it this way in the kernel.

OK, actually, considering arm32 and arm64 should both implement
mpidr_to_cpu, and the interface should be consistent, then unsigned
long is the only way.

Thanks,
drew
