Received: by 10.25.0.6 with SMTP id 6csp341405lfa;
        Fri, 26 May 2017 07:58:33 -0700 (PDT)
X-Received: by 10.200.34.229 with SMTP id g34mr2884761qta.65.1495810712926;
        Fri, 26 May 2017 07:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495810712; cv=none;
        d=google.com; s=arc-20160816;
        b=VBnb+NvT19zjYnDqaRdwl1vrfHJgvK3B65io5AAGlWyITpHbhOWvkAbyy5rGlT0Fce
         cyw/Oa8D1i5OG0MBpAE5Mtm+GNfp363bBgMXvVcRTEo1h9GCt0BiEPYOKlMAWUD7rUoR
         gLPJz2yu1cDa/X9Pe1tk1xpeu5LbPRmhUHmWlsHDTkIdewGEEWiaGAc2/bsuhdW5uTO5
         vk4jIjQjUs2R57blqggRbYAVvzn/sGMNf/2AiSbPIctLdXJpbKUrh5/JQF3o7jaP4n9t
         T3S9KaofQgPsn41/EeWQ4O7Omm0p4srMuw+WoE54ykTvtQRYMi1bh/SItEkoptIM50LN
         F1lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=fCOPtnqZvw+655fPNzs6eoBxag+4ubBjYK3Dl1JJ+zc=;
        b=bUtAR7pkMQkFjzscW0fzw1D2tr6a6u4b7vs1ZiEoAgSlww1um9fvrT401HXYraW/nr
         4EBDcX5OO4i+JG9ODeGyVC2A0AEcyavZqU1ggUOdBHreYv5wG0tyd2bZNwfhLOgDANRz
         6NXVznX2uKIkz0ob6qfw1k8ub3s/XKUbb7vzFMV4DzFebd7Dw9KfbDOYIalCgIKABj3x
         uo+ClftQlAJ7R9Ds7EQtVbJaQqdDbHpv95C1TL77S7KjwB+H6iY3C/oyRQ8QWbm5EKzu
         4/08DU1oXQGettyhQPGq3fuT5yK05SwzrB83AbYUQ024sOs0ORai1I6dIh/WEqXidcH4
         7mbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s66si897549qke.334.2017.05.26.07.58.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 May 2017 07:58:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37170 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dEGhE-0005Kh-B3
	for alex.bennee@linaro.org; Fri, 26 May 2017 10:58:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dEGh5-0005Ii-40
	for qemu-arm@nongnu.org; Fri, 26 May 2017 10:58:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dEGh2-00065E-07
	for qemu-arm@nongnu.org; Fri, 26 May 2017 10:58:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:26804)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dEGh1-00060C-I6; Fri, 26 May 2017 10:58:19 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4E638E696;
	Fri, 26 May 2017 14:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C4E638E696
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C4E638E696
Received: from localhost (ovpn-116-57.gru2.redhat.com [10.97.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 94DD282791;
	Fri, 26 May 2017 14:58:15 +0000 (UTC)
Date: Fri, 26 May 2017 11:58:14 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170526145814.GE22043@thinpad.lan.raisama.net>
References: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
	<1495550330-34087-5-git-send-email-imammedo@redhat.com>
	<20170523144854.GF32274@thinpad.lan.raisama.net>
	<20170523174403.26a69d7c@Igors-MacBook-Pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170523174403.26a69d7c@Igors-MacBook-Pro.local>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 26 May 2017 14:58:18 +0000 (UTC)
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
X-TUID: 8BjqePuBadvX

On Tue, May 23, 2017 at 05:44:03PM +0200, Igor Mammedov wrote:
> On Tue, 23 May 2017 11:48:54 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > On Tue, May 23, 2017 at 04:38:49PM +0200, Igor Mammedov wrote:
> > > Do the same as we did in commit
> > >   (57924bcd8 numa: introduce machine callback for VCPU to node mapping)
> > > but only for incomplete mapping usecase, falling back to board
> > > provided default cpu to node mapping if user hasn't provided
> > > mapping for CPU explicitly.
> > > 
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > 
> > This breaks migration compatibility, doesn't it? I understand
> > this use case is not supported, but if are going to break stuff
> > for people using incomplete mappings (by rejecting the
> > configuration on a future release), I would prefer to break it
> > only once.
> it's firmware change and we generally don't care nor maintain firmware compat stuff
> the same as with above mentioned 
>  (57924bcd8 numa: introduce machine callback for VCPU to node mapping)


We normally keep resulting NUMA topology compatible, even if NUMA
information is implemented only by firmware.  See how we set
MachineClass::numa_auto_assign_ram and
MachineClass::numa_mem_align_shift in older machine-types, for
example.

Sometimes we didn't keep compatibility, though (e.g. on commit
fb43b73b92 "pc: fix default VCPU to NUMA node mapping").

I wouldn't disagree with this change if we planned to support
incomplete mappings forever.  But if we are going to remove
support for incomplete mappings soon, I would prefer to break
user expectations only once.

> 
> > 
> > > ---
> > >  hw/core/machine.c | 3 ---
> > >  1 file changed, 3 deletions(-)
> > > 
> > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index 964b75d..b8df15f 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -730,9 +730,6 @@ static void machine_numa_finish_init(MachineState *machine)
> > >                  g_string_append_printf(s, "%sCPU %d [%s]",
> > >                                         s->len ? ", " : "", i, cpu_str);
> > >                  g_free(cpu_str);
> > > -
> > > -                /* non mapped cpus used to fallback to node 0 */
> > > -                props.node_id = 0;
> > >              }
> > >  
> > >              props.has_node_id = true;
> > > -- 
> > > 2.7.4
> > > 
> > 
> 
> 

-- 
Eduardo
