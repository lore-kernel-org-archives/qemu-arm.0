Received: by 10.25.0.144 with SMTP id 138csp1902550lfa;
        Tue, 25 Apr 2017 07:34:11 -0700 (PDT)
X-Received: by 10.55.23.132 with SMTP id 4mr25544555qkx.85.1493130851113;
        Tue, 25 Apr 2017 07:34:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t64si22137694qkc.61.2017.04.25.07.34.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Apr 2017 07:34:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d31Xe-0001aw-IC
	for alex.bennee@linaro.org; Tue, 25 Apr 2017 10:34:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d31Xb-0001ap-AG
	for qemu-arm@nongnu.org; Tue, 25 Apr 2017 10:34:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d31XV-0006Ht-4q
	for qemu-arm@nongnu.org; Tue, 25 Apr 2017 10:34:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41444)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1d31XU-0006HE-VS; Tue, 25 Apr 2017 10:34:01 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7F5F7F40B;
	Tue, 25 Apr 2017 14:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D7F5F7F40B
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D7F5F7F40B
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95EDB7F590;
	Tue, 25 Apr 2017 14:33:56 +0000 (UTC)
Date: Tue, 25 Apr 2017 16:33:54 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170425143354.6ckotexdnik3deeo@kamzik.brq.redhat.com>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-5-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1490189568-167621-5-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 25 Apr 2017 14:33:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.10 04/23] hw/arm/virt:
 explicitly allocate cpu_index for cpus
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
X-TUID: S/8canZQBk1C

On Wed, Mar 22, 2017 at 02:32:29PM +0100, Igor Mammedov wrote:
> Currently cpu_index is implicitly auto assigned during
> cpu.realize() time cpu_exec_realizefn()->cpu_list_add().
> 
> It happens to match index in possible_cpus so take
> control over it and make board initialize cpu_index
> to possible_cpus index explicitly. It will at least
> document that board is in control of it and when
> '-device cpu' support comes it will keep cpu_index
> stable regardless of order cpus are created so it won't
> break migration.
> Within this series it will be used for internal
> conversion from storing cpu_index based NUMA node
> bitmaps to property based mapping with possible_cpus,
> And will allow map cpu_index to a CPU entry in
> possible_cpus array.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/arm/virt.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 4de46b1..0cbcbc1 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1364,6 +1364,7 @@ static void machvirt_init(MachineState *machine)
>      mc->possible_cpu_arch_ids(machine);
>      for (n = 0; n < machine->possible_cpus->len; n++) {
>          Object *cpuobj;
> +        CPUState *cs;
>  
>          if (n >= smp_cpus) {
>              break;
> @@ -1373,6 +1374,9 @@ static void machvirt_init(MachineState *machine)
>          object_property_set_int(cpuobj, machine->possible_cpus->cpus[n].arch_id,
>                                  "mp-affinity", NULL);
>  
> +        cs = CPU(cpuobj);
> +        cs->cpu_index = n;
> +
>          if (!vms->secure) {
>              object_property_set_bool(cpuobj, false, "has_el3", NULL);
>          }
> -- 
> 2.7.4
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
