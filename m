Received: by 10.25.0.6 with SMTP id 6csp1370883lfa;
        Mon, 29 May 2017 05:11:23 -0700 (PDT)
X-Received: by 10.237.61.35 with SMTP id g32mr16790015qtf.60.1496059883553;
        Mon, 29 May 2017 05:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496059883; cv=none;
        d=google.com; s=arc-20160816;
        b=NWHipW8USEBKp9UWF1y1Ga43rNiLZXKNX3DA7LGDsam0yFfmXoI4dYtd9fBQyByuSs
         aSk6gAUlZQpwOKOHvRYDtWFqhhZ8bQab2s5rUVMBdYTGDjPGRLZPKHAK4oggi6IvWG9m
         G9DlJZ72X9Ep/b4lPxiZJxdAD60FHEZdMTB7KtrH8j08sQk1e7dWX/MWCUukLpbhlkE2
         vZpFQfo86G9yeZ7gc1cfyu0qS4QuNSWxdcRv4SRzjlsc1Lb5sCdIBj0nvxgZPN6P4ynf
         wz2RLGydHbk/L1i277dZ4Mz7db2u2PNKkpll9hEU82Aj/jDu/dUobgbnsrNt+Qie+MxW
         Mh9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=vIpvGoi4NqXkYyON3ZSCgtP5L5/WV9GHsdcPRXxoqe8=;
        b=NqPjJtTRdxRPzHR6v93rJnBnKMQ/ReFYxLQgLLf8H9/AcAH7yKVqfqZIAyYeT+0sQy
         bQQgtnW5bDoaxsrHxO6p+N8ACsrJheqoRjR0C6kZQgY1KGmVB8dz95GEjaEzFTWUKxib
         +DT+/4ntIJFBE6bPsesHqALclawCCAfPJItWbFiu6Lov9omKqcsQSrQ1jlgR2CyzZPsL
         cT77jnjgc2N89CP9//Th1qXYDgi+fMP0aZVKgjYd4CUiDvUWIXCZzzl7G8NmoPLXY2Zg
         y93HwxpRtWsUKQ4AGdmpUJI7ith6ybYll+RErhdvLQt3XFwu7B8hQB3LaFpf4PBqLlGU
         l1rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q141si4194125qke.50.2017.05.29.05.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 May 2017 05:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48545 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFJW6-0000Pe-UW
	for alex.bennee@linaro.org; Mon, 29 May 2017 08:11:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFJW0-0000PM-M9
	for qemu-arm@nongnu.org; Mon, 29 May 2017 08:11:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFJVx-0001Xi-HD
	for qemu-arm@nongnu.org; Mon, 29 May 2017 08:11:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49058)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dFJVx-0001XG-7L; Mon, 29 May 2017 08:11:13 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A53C85540;
	Mon, 29 May 2017 12:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1A53C85540
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1A53C85540
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 61D705C542;
	Mon, 29 May 2017 12:11:10 +0000 (UTC)
Date: Mon, 29 May 2017 14:11:08 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170529141108.37bb0cd8@nial.brq.redhat.com>
In-Reply-To: <20170526145814.GE22043@thinpad.lan.raisama.net>
References: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
	<1495550330-34087-5-git-send-email-imammedo@redhat.com>
	<20170523144854.GF32274@thinpad.lan.raisama.net>
	<20170523174403.26a69d7c@Igors-MacBook-Pro.local>
	<20170526145814.GE22043@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 29 May 2017 12:11:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 4/5] numa: fallback to
 default NUMA node instead of node 0
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: siVPBLzdjdRq

On Fri, 26 May 2017 11:58:14 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Tue, May 23, 2017 at 05:44:03PM +0200, Igor Mammedov wrote:
> > On Tue, 23 May 2017 11:48:54 -0300
> > Eduardo Habkost <ehabkost@redhat.com> wrote:
> >   
> > > On Tue, May 23, 2017 at 04:38:49PM +0200, Igor Mammedov wrote:  
> > > > Do the same as we did in commit
> > > >   (57924bcd8 numa: introduce machine callback for VCPU to node mapping)
> > > > but only for incomplete mapping usecase, falling back to board
> > > > provided default cpu to node mapping if user hasn't provided
> > > > mapping for CPU explicitly.
> > > > 
> > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> > > 
> > > This breaks migration compatibility, doesn't it? I understand
> > > this use case is not supported, but if are going to break stuff
> > > for people using incomplete mappings (by rejecting the
> > > configuration on a future release), I would prefer to break it
> > > only once.  
> > it's firmware change and we generally don't care nor maintain firmware compat stuff
> > the same as with above mentioned 
> >  (57924bcd8 numa: introduce machine callback for VCPU to node mapping)  
> 
> 
> We normally keep resulting NUMA topology compatible, even if NUMA
> information is implemented only by firmware.  See how we set
> MachineClass::numa_auto_assign_ram and
> MachineClass::numa_mem_align_shift in older machine-types, for
> example.
it's relative new and pure firmaware change wrt arm/i386,
but it might influence ABI for spapr, my guess is that's why
it was compat flags were introduced
(otherwise they shouldn't have been added).
So I wouldn't consider this precedent as policy change
wrt firmware changes.

 
> Sometimes we didn't keep compatibility, though (e.g. on commit
> fb43b73b92 "pc: fix default VCPU to NUMA node mapping").
and more
(27111931 acpi: provide _PXM method for CPU devices if QEMU is started numa enabled)
and this sometimes is more consistent with other firmware
changes that are not versioned and the general approach
(I don't see why numa is any more special that any other
subsystem).

> I wouldn't disagree with this change if we planned to support
> incomplete mappings forever.  But if we are going to remove
> support for incomplete mappings soon, I would prefer to break
> user expectations only once.
My take on why we can't remove incomplete mappings without
obsoleting them first is not because of firmware changes but
that it breaks wrong CLI (i.e. scripts with incomplete mapping
will fail to start guest). So it's not the same vs firmware
behavior change.

I'm agreeing to drop this patch just because I don't care much
about this particular fixup as it's small isolated part in one place
and doesn't affect the rest of the code.


> > >   
> > > > ---
> > > >  hw/core/machine.c | 3 ---
> > > >  1 file changed, 3 deletions(-)
> > > > 
> > > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > > index 964b75d..b8df15f 100644
> > > > --- a/hw/core/machine.c
> > > > +++ b/hw/core/machine.c
> > > > @@ -730,9 +730,6 @@ static void machine_numa_finish_init(MachineState *machine)
> > > >                  g_string_append_printf(s, "%sCPU %d [%s]",
> > > >                                         s->len ? ", " : "", i, cpu_str);
> > > >                  g_free(cpu_str);
> > > > -
> > > > -                /* non mapped cpus used to fallback to node 0 */
> > > > -                props.node_id = 0;
> > > >              }
> > > >  
> > > >              props.has_node_id = true;
> > > > -- 
> > > > 2.7.4
> > > >   
> > >   
> > 
> >   
> 

