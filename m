Received: by 10.25.0.144 with SMTP id 138csp1981009lfa;
        Tue, 25 Apr 2017 10:16:35 -0700 (PDT)
X-Received: by 10.237.53.37 with SMTP id a34mr34288967qte.274.1493140595511;
        Tue, 25 Apr 2017 10:16:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q123si22712021qkb.95.2017.04.25.10.16.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Apr 2017 10:16:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d344o-00014F-Qy
	for alex.bennee@linaro.org; Tue, 25 Apr 2017 13:16:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d344d-00012z-R4
	for qemu-arm@nongnu.org; Tue, 25 Apr 2017 13:16:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d344Y-00031S-Q3
	for qemu-arm@nongnu.org; Tue, 25 Apr 2017 13:16:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48082)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1d344Y-000316-JJ; Tue, 25 Apr 2017 13:16:18 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 830ED80052;
	Tue, 25 Apr 2017 17:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 830ED80052
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 830ED80052
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8758E86D2C;
	Tue, 25 Apr 2017 17:16:15 +0000 (UTC)
Date: Tue, 25 Apr 2017 19:16:13 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170425171613.sfsjxu6jjuelq54f@kamzik.brq.redhat.com>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-9-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1490189568-167621-9-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 25 Apr 2017 17:16:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.10 08/23] virt-arm: add
 node-id property to CPU
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
X-TUID: VdqOwFUJr5/A

On Wed, Mar 22, 2017 at 02:32:33PM +0100, Igor Mammedov wrote:
> it will allow switching from cpu_index to property based
> numa mapping in follow up patches.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/arm/virt.c    | 15 +++++++++++++++
>  target/arm/cpu.c |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 8748d25..68d44f3 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1365,6 +1365,7 @@ static void machvirt_init(MachineState *machine)
>      for (n = 0; n < machine->possible_cpus->len; n++) {
>          Object *cpuobj;
>          CPUState *cs;
> +        int node_id;
>  
>          if (n >= smp_cpus) {
>              break;
> @@ -1377,6 +1378,20 @@ static void machvirt_init(MachineState *machine)
>          cs = CPU(cpuobj);
>          cs->cpu_index = n;
>  
> +        node_id = numa_get_node_for_cpu(cs->cpu_index);
> +        if (node_id == nb_numa_nodes) {
> +            /* by default CPUState::numa_node was 0 if it's not set via CLI
> +             * keep it this way for now but in future we probably should
> +             * refuse to start up with incomplete numa mapping */
> +             node_id = 0;

Do other architectures already abort on incomplete numa? If so, it'd be
nice to do that for mach-virt sooner than later. I guess we just need
another compat variable for 2.9 and older machine types.  I think libvirt
always supplies all cpu-node mappings, if any, so there shouldn't be an
issue with it.

Thanks,
drew
