Received: by 10.28.71.27 with SMTP id u27csp981623wma;
        Fri, 26 Jan 2018 09:54:38 -0800 (PST)
X-Google-Smtp-Source: AH8x224cLyvBaesI65DeBnlGPlxmBYeWIcAsPnNtPWi9InagQqRobUidvnVa3VVmOv8Dx7UXzFDe
X-Received: by 10.129.118.70 with SMTP id j6mr12009352ywk.434.1516989278154;
        Fri, 26 Jan 2018 09:54:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516989278; cv=none;
        d=google.com; s=arc-20160816;
        b=ABW5gt8Eipfe5B9cVPReMZrdNZlhx7Yipl2mJ/9+oEgmeB5PBATEIT9CQt0PNl+GC0
         /W/MHPQ0WMdm0Pgxo+iIi/zL99+H/mkEYR3hMAHIRirxaH9+uAOK8BWAMlb1bvLTWCk6
         zItL0GEYe8LvIUYAPucLeEr8RbGygdiU7YAAQK1H/UbRftD5hTxh8KD87IwFjVdgvJzu
         uYjPscDCHu4Gk/BS1Xn8PX9LHj0y8NnFAxTBdDkinttQ8JpKMKxYyl9djTeR8QyDVGNV
         FVnnOft7UaQmSArvs/pRP1EXyoC+ZsaCqPDzOzSGD/qVQyBaXw3VqSh9TqovM5aqvu9Q
         QloQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=QhJUOQSNeFc0xVYIjoGnidtcQnRydPtw9x7TBCOluXg=;
        b=oDLlWRjRM8kgmAWHn8uCdtNZ+PxIYZIkK+p53g+da4w0y8dGuGJfjJbKCCA+S9fvEM
         ZN8uaPiy92V9MiJ61QLuiCCnAar8C+aLbsfMH6fKeGJbr5cQSCe2YOoJpxT2mX+RoCdu
         WPig8Uz/C5mP3fyaoOtG0TpWY//cYVzpdESizARfJx6Ac2bL2SFN+uKLQIY9pPKOf5qJ
         /3xaWGok5sZwDea38S4awBY7XxxkkNQcH8j9OfBsofLWf9Yl+TX3PSmmUyuTwp6xM1ly
         xEjlAb+8W8pnCNS6+H8K1wA3TCYKpoyXL+vEtrJ6+2aOrS+a/MccexeCsTBjmdS6Akh0
         RhAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x124si982319ywe.482.2018.01.26.09.54.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 09:54:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42248 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef8Cz-0003YF-KE
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 12:54:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ef8Cn-0003Wk-5D
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 12:54:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ef8Ck-0007Xg-Jn
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 12:54:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52872)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ef8Ck-0007Wz-BP; Fri, 26 Jan 2018 12:54:22 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50888C05FFE2;
	Fri, 26 Jan 2018 17:54:21 +0000 (UTC)
Received: from localhost (ovpn-116-57.gru2.redhat.com [10.97.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 76CFC6313F;
	Fri, 26 Jan 2018 17:54:20 +0000 (UTC)
Date: Fri, 26 Jan 2018 15:54:18 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180126175418.GH25150@localhost.localdomain>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA-UO5Y_ACSZ2EEQEzgy30wdfEm3u8wUrBrXWaQaE_v+Kw@mail.gmail.com>
	<20171209010811.GJ3037@localhost.localdomain>
	<CAFEAcA9oG=+mJ+jSGTM_z54S09gjHoFowDkOvofdkhJd+g3=Cw@mail.gmail.com>
	<20180122183301.GA31237@localhost.localdomain>
	<CAFEAcA8pGXMs3hMxSs-t7qGfeR__H-CQ1roRVe5NFMCP8R2vjw@mail.gmail.com>
	<20180126104247.GF25150@localhost.localdomain>
	<CAFEAcA_zU+tAMvcqNHQAaVOEaJrrGOEWPS8RpUi+eZQ3tf1yiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_zU+tAMvcqNHQAaVOEaJrrGOEWPS8RpUi+eZQ3tf1yiQ@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 26 Jan 2018 17:54:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 0/6] arm: support -cpu max (and
 gic-version=max)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o+ra3Lt1imDf

On Fri, Jan 26, 2018 at 11:02:24AM +0000, Peter Maydell wrote:
> On 26 January 2018 at 10:42, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > On Thu, Jan 25, 2018 at 02:41:50PM +0000, Peter Maydell wrote:
> >> I'm not sure if we actually support command line setting/unsetting
> >> of features for Arm CPUs -- is there a command line option to
> >> get QEMU to print the features it thinks can be set this way?
> >
> > Unfortunately -cpu command-line parsing is still a mess (we
> > currently have lots of arch-specific parsing hooks).  Once we
> > make this uniform across targets, we could make "-cpu ?" print
> > all known properties.
> >
> > But you can look at the list of QOM properties for your CPU
> > classes (-cpu options are simply translated to QOM properties).
> > e.g.:
> >
> >   (QEMU) device-list-properties typename=pxa270-a0-arm-cpu
> >   {"return": [{"type": "uint32", "name": "midr"}, {"type": "uint64", "name": "mp-affinity"}, {"type": "child<irq>", "name": "unnamed-gpio-in[0]"}, {"type": "uint32", "name": "psci-conduit"}, {"type": "bool", "name": "reset-hivecs"}, {"type": "link<qemu:memory-region>", "name": "memory"}, {"type": "link<irq>", "name": "unnamed-gpio-out[2]"}, {"type": "link<irq>", "name": "unnamed-gpio-out[3]"}, {"type": "int32", "name": "node-id"}, {"type": "bool", "name": "start-powered-off"}, {"type": "link<irq>", "name": "unnamed-gpio-out[1]"}, {"type": "link<irq>", "name": "unnamed-gpio-out[0]"}, {"type": "link<irq>", "name": "gicv3-maintenance-interrupt[0]"}, {"type": "bool", "name": "cfgend"}, {"type": "child<irq>", "name": "unnamed-gpio-in[2]"}, {"type": "child<irq>", "name": "unnamed-gpio-in[3]"}, {"type": "child<irq>", "name": "unnamed-gpio-in[1]"}]}
> 
> None of those are things we'd want to expose to the user, really
> (except maybe 'cfgend'): they're all intended for the QEMU board
> or SoC code that needs to configure and wire the CPU up. Ideally
> there'd be a mechanism for screening them out of the -cpu option
> list.
> 

Yeah, it's becoming clearer to me that we need to address this
better than with a simple "x-" prefix convention.

If we remove the link and child properties, we have:

midr (uint32)
mp-affinity (uint64)
psci-conduit (uint32)
reset-hivecs (bool)
node-id (int32)
start-powered-off (bool)
cfgend (bool)

I wonder how many of them aren't useful with -cpu but might be
useful with -device in the future.


> There are some things that we could in theory have as user
> settable properties (like "does this CPU have an FPU"), but
> we don't currently have QOM properties for them (each CPU
> just hardcodes which ARM_FEATURE_* flags it has).
> 
> In your other email you write:
> > I wrote:
> >> Given that the type names don't appear to the user, I think
> >> we can go ahead with implementing "-cpu max" for Arm without
> >> having to first disentangle this? "max" isn't in any worse
> >> a position than the existing "host" and "any" types.
> >
> >Sounds reasonable to me.
> 
> Cool. I think that means that patches 2-6 here don't need
> any changes, but I'll rebase, retest and resend just to
> avoid confusion.
> 
> thanks
> -- PMM

-- 
Eduardo
