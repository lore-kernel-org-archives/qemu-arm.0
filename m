Received: by 10.223.172.38 with SMTP id v35csp1002334wrc;
        Wed, 13 Sep 2017 05:45:17 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA+2P7g2gyvaQgrekFQ4YyeluMWhyZii68Zdju71IWMinsc8GUIG2O+ZP3F23DFvcnhWaZO
X-Received: by 10.55.33.216 with SMTP id f85mr25574989qki.176.1505306717322;
        Wed, 13 Sep 2017 05:45:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505306717; cv=none;
        d=google.com; s=arc-20160816;
        b=zCf6rLsSSzCCSs0NpVIE5DMnSheve/jOD26ha8qg+sXazCsBV2diJ/QFYdDvxqWzq5
         lFsDqC/40sQwhrRJmR9XK4isIXKzrr3Mi7aOIPHmsUd8eRNJyfIsIWyv+F1sUwNo6fTs
         Wl97+sY8YvcL6XspXCuPY54RM1QZzdTPO6/cUCuE6YLVaKfFk9JNOPaxCAnawko23L0c
         qd3c7r3n1hdBUj3P12qgzYXoHLHtjSoHyoUyosJBnmEDbySGoRXyhk/2c6YlVQasMUQk
         EqkyhURD75v08TjvYX4Km0yCXb5Ik809U6fvVI+TOTZd+yN9WCYUTtMYZjPqtvlKdDUI
         sN9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=iuXdvMVGrw2VrG0uAIe2ung3NMtbL54sGtFvcH9PyaA=;
        b=Rcq9jFa3/r76mIMeaLq1FRETcNrvLHR6/fiSF7jw3b53C1Tbx6+c8O6ej4y0LmKuQG
         5Q04hmpL0e6IFIwIEHH0iWaWLRZfZY/QTUj2Y/MLx4IC1kAdq+iCoqXDhMORw/PVkIjW
         ookktd2ZSnY0ncSAV4Ivk8cGJVgXonlNfV1pwfRzHAvNJTxl7Cp62ro9D67aV0sAJQ8I
         Zb2TF0JOsJKUBUpOOmwSj5zS3GG33vVnGqToLdpzXdkis41S3uuWu90MznuoPgkV+mc1
         6+uKisUpKTqhBOOFdbdoNotAfbyNLUsJa1C+UZRcPJPoRCldhFPfdvJ1bnDRTbuFVRfk
         rXcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x3si13857178qkc.344.2017.09.13.05.45.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 05:45:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds72Z-0005gf-3m
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 08:45:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1ds72S-0005dt-FF
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 08:45:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1ds72O-0000Ij-G3
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 08:45:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47072)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1ds72O-0000Hv-A1; Wed, 13 Sep 2017 08:45:04 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 471BE81DE4;
	Wed, 13 Sep 2017 12:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 471BE81DE4
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=dgilbert@redhat.com
Received: from work-vm (ovpn-117-158.ams2.redhat.com [10.36.117.158])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06BE55C6D2;
	Wed, 13 Sep 2017 12:44:59 +0000 (UTC)
Date: Wed, 13 Sep 2017 13:44:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20170913124456.GB2096@work-vm>
References: <20170912140149.7692-1-lvivier@redhat.com>
	<20170912140149.7692-2-lvivier@redhat.com>
	<20170913053533.GF7550@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170913053533.GF7550@umbus.fritz.box>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 13 Sep 2017 12:45:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 1/3] hmp: fix "dump-quest-memory" segfault
 (ppc)
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L6siaiA15aax

* David Gibson (david@gibson.dropbear.id.au) wrote:
> On Tue, Sep 12, 2017 at 04:01:47PM +0200, Laurent Vivier wrote:
> > Running QEMU with
> >     qemu-system-ppc64 -M none -nographic -m 256
> > and executing
> >     dump-guest-memory /dev/null 0 8192
> > results in segfault
> > 
> > Fix by checking if we have CPU, and exit with
> > error if there is no CPU:
> > 
> >     (qemu) dump-guest-memory /dev/null
> >     this feature or command is not currently supported
> > 
> > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> Applied to ppc-for-2.11.  I'm not really sure what to do with the rest
> of the series though.

I can take the whole set through HMP.

Dave

> > ---
> >  target/ppc/arch_dump.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
> > index 8e9397aa58..95b9ab6f29 100644
> > --- a/target/ppc/arch_dump.c
> > +++ b/target/ppc/arch_dump.c
> > @@ -224,8 +224,15 @@ typedef struct NoteFuncDescStruct NoteFuncDesc;
> >  int cpu_get_dump_info(ArchDumpInfo *info,
> >                        const struct GuestPhysBlockList *guest_phys_blocks)
> >  {
> > -    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
> > -    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
> > +    PowerPCCPU *cpu;
> > +    PowerPCCPUClass *pcc;
> > +
> > +    if (first_cpu == NULL) {
> > +        return -1;
> > +    }
> > +
> > +    cpu = POWERPC_CPU(first_cpu);
> > +    pcc = POWERPC_CPU_GET_CLASS(cpu);
> >  
> >      info->d_machine = PPC_ELF_MACHINE;
> >      info->d_class = ELFCLASS;
> 
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson


--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
