Received: by 10.25.15.230 with SMTP id 99csp15335lfp;
        Fri, 24 Mar 2017 05:20:40 -0700 (PDT)
X-Received: by 10.55.168.11 with SMTP id r11mr7657551qke.239.1490358040642;
        Fri, 24 Mar 2017 05:20:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 65si1704054qte.303.2017.03.24.05.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Mar 2017 05:20:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32959 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1crOCu-0005z1-3c
	for alex.bennee@linaro.org; Fri, 24 Mar 2017 08:20:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1crOCh-0005xe-Vf
	for qemu-arm@nongnu.org; Fri, 24 Mar 2017 08:20:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1crOCc-0006dF-Vf
	for qemu-arm@nongnu.org; Fri, 24 Mar 2017 08:20:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48170)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1crOCc-0006d0-O2; Fri, 24 Mar 2017 08:20:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E18CC7AEA1;
	Fri, 24 Mar 2017 12:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E18CC7AEA1
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E18CC7AEA1
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF38484401;
	Fri, 24 Mar 2017 12:20:19 +0000 (UTC)
Date: Fri, 24 Mar 2017 13:20:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20170324132017.385a3a12@nial.brq.redhat.com>
In-Reply-To: <59448b66-430d-48a1-cf98-541873c87cb7@redhat.com>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-16-git-send-email-imammedo@redhat.com>
	<59448b66-430d-48a1-cf98-541873c87cb7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 24 Mar 2017 12:20:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.10 15/23] QMP: include
 CpuInstanceProperties into query_cpus output output
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cJSfvYmWkSyH

On Thu, 23 Mar 2017 08:19:24 -0500
Eric Blake <eblake@redhat.com> wrote:

> On 03/22/2017 08:32 AM, Igor Mammedov wrote:
> > if board supports CpuInstanceProperties, report them for
> > each CPU thread listed. Main motivation for this is to
> > provide these properties introspection via QMP interface
> > for using in test cases to verify numa node to cpu mapping,
> > which includes not only boards that support cpu hotplug
> > and have this info in query-hotpluggable-cpus (pc/spapr)
> > but also for boards that don't not support hotpluggable-cpus
> > but support numa mapping (virt-arm).
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---  
> 
> > @@ -1860,6 +1863,12 @@ CpuInfoList *qmp_query_cpus(Error **errp)
> >  #else
> >          info->value->arch = CPU_INFO_ARCH_OTHER;
> >  #endif
> > +        if ((info->value->has_props = !!mc->cpu_index_to_instance_props)) {  
> 
> checkpatch.pl doesn't flag that? We generally try to avoid side-effects
> inside conditionals.
it does, fixed in v2 branch
(lazy me skipped checkpatch since QMP test case been added,
I've also fixed another checkpatch error in the next patch)
 
> > +            CpuInstanceProperties *props;
> > +            props = g_malloc0(sizeof(*props));
> > +            *props = mc->cpu_index_to_instance_props(ms, cpu->cpu_index);
> > +            info->value->props =  props;  
> 
> Why two spaces after =?
fixed

> 
> With those cleaned up,
> Reviewed-by: Eric Blake <eblake@redhat.com>
Thanks! 

