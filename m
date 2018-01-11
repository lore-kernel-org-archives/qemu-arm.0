Received: by 10.28.173.206 with SMTP id w197csp883699wme;
        Thu, 11 Jan 2018 10:59:02 -0800 (PST)
X-Google-Smtp-Source: ACJfBovkB1c3Vt4kHCqbae9nWIMDKjv6QFF4NEPIBQGETDCPVVPlkM18RStalRLfsgOqQnUE0zfe
X-Received: by 10.37.22.86 with SMTP id 83mr7241475ybw.269.1515697142357;
        Thu, 11 Jan 2018 10:59:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515697142; cv=none;
        d=google.com; s=arc-20160816;
        b=CUYvFPyaDWnHjMxCfmk77xRKRu4DEcYtCwISxXETo+W6kbnr5+UgpoO3izt+xbYhzJ
         iJp5QoumvJ3LB5sJMK1qcR99B+uESgyeOxpNrEgVBSCMB9cNNx4QbU3fsGM5yIOmxLR3
         I//v0LVsgT+w/gvLgG6nAD5/nMhCLZSuO4GE497CYunDNfe8YBv4s+qqeUWQ+AG0UOIx
         vqyQi6QOdZANaiQKJV+SnEr+ina54AewxSCzxxIpfRif28i1AsY1N0Knew2ZL86lS6im
         l1ycYY7qVGp1YEMpJAgv2HX9do0s0pu1j7jvdgIgHxE+pRVSGGYRJIhtHq7lJ7O+pAgf
         CpoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=3TgUitBhYtmc0xfIPs0wrxDO9f3mqyry5hVnnxelYFk=;
        b=Qr91fa4uTfDwiuulaVfuKemmzXmxY5JVYDbtG4Z4XHM8bMRjavXRtb4Y6moNwiaVov
         TCHR2xvoAinQuPUZwge8G8MFGvh74oMqQXX1IjQVWMOc/teBXrYxSZyG3sTWJ+aWa99T
         6Mazsiv5UxM+fcKWH/QpWpwQK0iy8jvtwdWXq8hO6xzt9aHPME5snm4nva45Zzs0dhPd
         xcpt7b4WCeKCXJqWBv/CppYE8f2O9PncwDItMAFjZyY0MZxncFdBC5xM9FjUTKXOL5Db
         D7h4Q1ppvsZb/zvdxJaXXj5nSQpIB5MvWfb6JzQbCzt1MUvDb7XnyXh1bfmeZ8HABSU0
         VrMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i6si4119865ybl.53.2018.01.11.10.59.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 10:59:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34748 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZi45-00067w-TO
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 13:59:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1eZi3z-00067O-86
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:58:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1eZi3w-0001wi-4t
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:58:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53194)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1eZi3v-0001v9-VA; Thu, 11 Jan 2018 13:58:52 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C03CD8B104;
	Thu, 11 Jan 2018 18:58:45 +0000 (UTC)
Received: from work-vm (ovpn-116-109.ams2.redhat.com [10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91DFC798C0;
	Thu, 11 Jan 2018 18:58:43 +0000 (UTC)
Date: Thu, 11 Jan 2018 18:58:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180111185840.GE13384@work-vm>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-8-richard.henderson@linaro.org>
	<CAFEAcA9EZ0jY6tR2E7ZzfWnAfSJ3hjGNT7za+RZC-SGuBY6Hfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9EZ0jY6tR2E7ZzfWnAfSJ3hjGNT7za+RZC-SGuBY6Hfg@mail.gmail.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 11 Jan 2018 18:58:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 7/9] target/arm: Expand vector registers for
 SVE
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gouz0h12cVKK

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On 18 December 2017 at 17:30, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> > Change vfp.regs as a uint64_t to vfp.zregs as an ARMVectorReg.
> > The previous patches have made the change in representation
> > relatively painless.
> >
> > Add vfp.pregs as an ARMPredicateReg.  Let FFR be P16 to make
> > it easier to treat it as for any other predicate.
> 
> > diff --git a/target/arm/machine.c b/target/arm/machine.c
> > index a85c2430d3..39f3123b10 100644
> > --- a/target/arm/machine.c
> > +++ b/target/arm/machine.c
> > @@ -50,7 +50,42 @@ static const VMStateDescription vmstate_vfp = {
> >      .minimum_version_id = 3,
> >      .needed = vfp_needed,
> >      .fields = (VMStateField[]) {
> > -        VMSTATE_UINT64_ARRAY(env.vfp.regs, ARMCPU, 64),
> > +        /* For compatibility, store Qn out of Zn here.  */
> > +        /* TODO: store the other quadwords in another subsection,
> > +           along with predicate registers and ZCR_EL[1-3].  */
> 
> I think we should get the migration state stuff right at the point
> where we change the data structure in cpu.h.
> 
> 
> > +        VMSTATE_UINT64_SUB_ARRAY(env.vfp.zregs[0].d, ARMCPU, 0, 2),
> > +        VMSTATE_UINT64_SUB_ARRAY(env.vfp.zregs[1].d, ARMCPU, 0, 2),
> > +        VMSTATE_UINT64_SUB_ARRAY(env.vfp.zregs[2].d, ARMCPU, 0, 2),
> 
> David: does the migration code guarantee that we can split an
> old VMSTATE_UINT64_ARRAY into being a sequence of SUB_ARRAYs
> like this and retain the same on-the-wire format (ie and
> keep migration compat) ?

There's no on-the-wire protocol for this - it's just the array elements,
so as long as the total adds up the same and it's still uint64's
it should work.

Dave

> I suspect we've used this clever trick before elsewhere, but thought
> it better to check...
> 
> thanks
> -- PMM
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
