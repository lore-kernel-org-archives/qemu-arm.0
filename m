Received: by 10.25.0.198 with SMTP id 189csp131219lfa;
        Fri, 5 May 2017 04:48:09 -0700 (PDT)
X-Received: by 10.55.155.143 with SMTP id d137mr6790298qke.310.1493984889612;
        Fri, 05 May 2017 04:48:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1493984889; cv=none;
        d=google.com; s=arc-20160816;
        b=OwRaJ5uSea5cgVU94VeXYIu6NmG2eL9gCfcIqbO5u7qXA1eOwRZyutGCkO8KcNkiWO
         GarnuR93o9U8MbhTPIbzJR5XCOB/BRCC1o3xsS/zJYqr921GQYkRcJ+e78pvnw6HJOxk
         piv2sT2bTMSfT2mTGVNFeGlkR1MuA1YH1r7dAtip8j6QpFjxzurgdASHT4/Hm+8XdaAy
         DHbITmA4DQBb2SJ+vDg3Ul1AtL3DHk0R48HMOkD/Kec8AA/oWiNs+zYm9Drhg24sQxYn
         vA6jHacTC1dEnZr+k7YcegZPdsE6Cbickv4bNwgJFVMwa0464WFOqalbNMFkECklsPKG
         z00Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=E+KORUneflrbNa0TB8hRg7/rwQOn4yVufYXb8U08L/8=;
        b=aTnkQL09uF/hQYJcc8AsnKrzXMiqLkUsAoY4cOLfBzRY1qryV0ASabGE8xLFeBQZ1d
         N7hoKrnps5uk92Qb82pTngXMIaS+IwicjUTCxgt9h25tdI0832CxnYMqTTNMjqUeo6W8
         o9+MnLUQq0w7ixrIkk/J7As/5UC2NjRRTHjPc5m7nJB/8p9RpNjpVBd1hKVYNGvnrgTP
         2csfWuh1lfa54adVW3faSXmFg/FNTWeg5H+C4PXjITTaPrrQBHeJ56FSTBZu+WwcyQOi
         lctAfaq+ihhKqj5DYIL3pXvIYyfDFroFSuS2c+F7jcxiAaxyjZtgahAlrNzsVbrnWIsv
         wWAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d20si4531025qtg.98.2017.05.05.04.48.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 May 2017 04:48:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46380 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6biQ-00010N-SD
	for alex.bennee@linaro.org; Fri, 05 May 2017 07:48:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6biJ-0000yh-F9
	for qemu-arm@nongnu.org; Fri, 05 May 2017 07:48:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6biG-00075c-Bt
	for qemu-arm@nongnu.org; Fri, 05 May 2017 07:47:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50344)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1d6biG-00074x-30; Fri, 05 May 2017 07:47:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06C633DBC0;
	Fri,  5 May 2017 11:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 06C633DBC0
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 06C633DBC0
Received: from hawk.localdomain (ovpn-204-129.brq.redhat.com [10.40.204.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29C6560A9C;
	Fri,  5 May 2017 11:47:49 +0000 (UTC)
Date: Fri, 5 May 2017 13:47:47 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170505114747.wkiip3vpm4tgu7yz@hawk.localdomain>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-11-git-send-email-imammedo@redhat.com>
	<20170504114018.zpqvohjxu23bhar7@kamzik.brq.redhat.com>
	<20170505132826.29aa8377@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170505132826.29aa8377@nial.brq.redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 05 May 2017 11:47:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 10/24] numa: mirror cpu to
 node mapping in MachineState::possible_cpus
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SFh8JNAENOHT

On Fri, May 05, 2017 at 01:28:26PM +0200, Igor Mammedov wrote:
> On Thu, 4 May 2017 13:40:18 +0200
> Andrew Jones <drjones@redhat.com> wrote:
> 
> [...]
> > > +void machine_set_cpu_numa_node(MachineState *machine,
> > > +                               CpuInstanceProperties *props, Error **errp)
> > > +{
> [...]
> 
> > > +        }
> > > +
> > > +        /* skip slots with explicit mismatch */
> > > +        if (props->has_thread_id && props->thread_id != slot->props.thread_id) {
> > > +                continue;
> > > +        }
> > > +
> > > +        if (props->has_core_id && props->core_id != slot->props.core_id) {
> > > +                continue;
> > > +        }
> > > +
> > > +        if (props->has_socket_id && props->socket_id != slot->props.socket_id) {
> > > +                continue;
> > > +        }  
> > 
> > nit: above 3 if-conditions could be condensed into 1 compound condition
> this reduces number of lines but result is a bit ugly due to 80chr/line limit:
> 
>         /* skip slots with explicit mismatch */                                  
>         if ((props->has_thread_id &&                                             
>              props->thread_id != slot->props.thread_id) ||                       
>             (props->has_core_id && props->core_id != slot->props.core_id) ||     
>             (props->has_socket_id && props->socket_id != slot->props.socket_id)  
>         ) {                                                                      
>                 continue;                                                        
>         }
> 
> do you still want the change?

If only we could kill the 80 char limit! I don't feel strongly about any
of this stuff, and you've already got my R-b either way.

Thanks,
drew

> 
> 
> 
> 
