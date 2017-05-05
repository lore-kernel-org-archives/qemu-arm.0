Received: by 10.25.0.198 with SMTP id 189csp289578lfa;
        Fri, 5 May 2017 10:12:40 -0700 (PDT)
X-Received: by 10.200.53.202 with SMTP id l10mr46407139qtb.133.1494004360746;
        Fri, 05 May 2017 10:12:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o68si5106444qkc.218.2017.05.05.10.12.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 May 2017 10:12:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48242 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6gmU-00021m-0C
	for alex.bennee@linaro.org; Fri, 05 May 2017 13:12:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d6gmM-00021f-V5
	for qemu-arm@nongnu.org; Fri, 05 May 2017 13:12:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d6gmM-0003CG-1Y
	for qemu-arm@nongnu.org; Fri, 05 May 2017 13:12:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52196)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d6gmL-0003Bi-RX; Fri, 05 May 2017 13:12:29 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B498715567;
	Fri,  5 May 2017 17:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B498715567
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B498715567
Received: from localhost (ovpn-116-28.gru2.redhat.com [10.97.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2A85480705;
	Fri,  5 May 2017 17:12:27 +0000 (UTC)
Date: Fri, 5 May 2017 14:12:26 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20170505171226.GI3482@thinpad.lan.raisama.net>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-13-git-send-email-imammedo@redhat.com>
	<20170505014522.GK14413@umbus.fritz.box>
	<20170505100918.181acc8b@nial.brq.redhat.com>
	<20170505090602.c2u7ugdh65rdjrs6@hawk.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170505090602.c2u7ugdh65rdjrs6@hawk.localdomain>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 05 May 2017 17:12:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 12/24] numa: add
 numa_[has_]node_id() wrappers
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
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +SCwn+6yk6OC

On Fri, May 05, 2017 at 11:06:02AM +0200, Andrew Jones wrote:
> On Fri, May 05, 2017 at 10:09:18AM +0200, Igor Mammedov wrote:
> > On Fri, 5 May 2017 11:45:22 +1000
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> > 
> > > On Wed, May 03, 2017 at 02:57:06PM +0200, Igor Mammedov wrote:
> > > > wrappers should make access to [has]node_id fields more readable
> > > > 
> > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> > > 
> > > Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> > > 
> > > Correct, though I'm not sure it actually simplifies things that much.
> > > Maybe more in future patches, though.
> > that's what Drew insisted on, and even though I prefer other way around
> > I won't stall series arguing about styling issues,
> > so here this patch goes.
> 
> My argument in the last review of this series was that references like
> 
>  machine->possible_cpus->cpus[cs->cpu_index].props.has_node_id
> and
>  machine->possible_cpus->cpus[cs->cpu_index].props.node_id
> 
> are quite long, and only differ by 'has_', making it tough to
> easily recognize.

If expression length is a problem, we can just use an extra
variable:

 CPUArchId *slot = &machine->possible_cpus->cpus[cs->cpu_index];
 if (slot->props.has_node_id && slot->props.node_id == FOO) ...


>                   But, if nobody, but me, sees value in changing
> them to
> 
>  numa_has_node_id(machine->possible_cpus, cs->cpu_index)
> and
>  numa_node_id(machine->possible_cpus, cs->cpu_index)
> 
> then I won't insist.

I don't mind that much, but I still prefer the version without
the wrappers.

-- 
Eduardo
