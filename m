Received: by 10.25.0.6 with SMTP id 6csp1314558lfa;
        Mon, 29 May 2017 02:13:30 -0700 (PDT)
X-Received: by 10.55.43.93 with SMTP id r90mr14658467qkh.196.1496049210613;
        Mon, 29 May 2017 02:13:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496049210; cv=none;
        d=google.com; s=arc-20160816;
        b=uI5Qn/V7ITO+kyrBqpjU6h/iJTQyEytHFWyBO+JWS+6V9b8huimdwZ3oWiS4DdbpdK
         2kq66+6ImggpARto0lCaUEdEryb7mg7a+MFSK+PTu9ptQXVOhV2yAGsGI9iOzMEEiCsg
         L+tHU11k1Bsb8eNtcYlxd29d+bBTTP6Y9O3VSgLcgyl21RqGXi59GegLW7NXxwSCA7Xn
         0k6jMwNiaAOnLOkZcKwnUtypxBM35v0MbKLwOW0H+CGFaaxurc1UKWuGBHeOOn0YR4Xf
         KevSXgsk5wRcSivEqZjRcx/pHXHgsHhppT/pO99A9+8ZeS7PjfwfaISZTO4hlL7kySG0
         NyiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=GlTt0C832iQcqE87bIsv1AR0DekwD5laNZ/khC9za1o=;
        b=BhKf2I93Mly9i58vUAC2g0zeWFxf0iUs3PdUkjx8oZ90Umoz3qyhD2MxhtNCINmYPw
         clPNlZ7fk21lhc+zKD7k32K/1Q0dDeVlDqp8bc3FcUvJ9Q6MsAzvxWtab/NuTY8ajvYq
         YUqRsKIc43d6fMYWmSMflwfYrAaJkbj+RCKZNWG+0dKQOTK7zlbmvm4c2YPdP5s5hZs0
         1jBMROrPITYuuKDfo/naX3gG8K5npXnaChOR18bthwG+CEYOvsVZl+zbpDyMZIJbz9z7
         CoaFubeg0Xb2X9J1Wrk9CNzHZp5smJRg5ll+yD1DekJ4doU7NXwiE3XRdFX2KqhNTKdE
         S/rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h47si8980801qta.167.2017.05.29.02.13.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 May 2017 02:13:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47665 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFGjy-0007ve-1o
	for alex.bennee@linaro.org; Mon, 29 May 2017 05:13:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFGj1-00074b-Pr
	for qemu-arm@nongnu.org; Mon, 29 May 2017 05:12:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFGix-0008Iy-Q4
	for qemu-arm@nongnu.org; Mon, 29 May 2017 05:12:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43352)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dFGix-0008Ie-FM; Mon, 29 May 2017 05:12:27 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63039C049D57;
	Mon, 29 May 2017 09:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 63039C049D57
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 63039C049D57
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F34C85C31B;
	Mon, 29 May 2017 09:12:23 +0000 (UTC)
Date: Mon, 29 May 2017 11:12:21 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170529111221.499ed4f5@nial.brq.redhat.com>
In-Reply-To: <20170526145814.GE22043@thinpad.lan.raisama.net>
References: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
	<1495550330-34087-5-git-send-email-imammedo@redhat.com>
	<20170523144854.GF32274@thinpad.lan.raisama.net>
	<20170523174403.26a69d7c@Igors-MacBook-Pro.local>
	<20170526145814.GE22043@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 29 May 2017 09:12:25 +0000 (UTC)
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
X-TUID: 80olHxTFLxNV

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
> 
> Sometimes we didn't keep compatibility, though (e.g. on commit
> fb43b73b92 "pc: fix default VCPU to NUMA node mapping").
> 
> I wouldn't disagree with this change if we planned to support
> incomplete mappings forever.  But if we are going to remove
> support for incomplete mappings soon, I would prefer to break
> user expectations only once.
ok, I'll keep fix up to 0 and drop this patch.

> >   
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

