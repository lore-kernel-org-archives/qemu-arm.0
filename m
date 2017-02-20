Received: by 10.25.0.147 with SMTP id 141csp151694lfa;
        Mon, 20 Feb 2017 11:11:45 -0800 (PST)
X-Received: by 10.200.41.13 with SMTP id y13mr19993509qty.154.1487617905601;
        Mon, 20 Feb 2017 11:11:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o62si4575593qkb.122.2017.02.20.11.11.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Feb 2017 11:11:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cftNB-0008WK-0d
	for alex.bennee@linaro.org; Mon, 20 Feb 2017 14:11:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cftM6-0007oc-6H
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 14:10:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cftM1-0007fW-Cq
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 14:10:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50312)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cftM1-0007f6-3H; Mon, 20 Feb 2017 14:10:33 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 12C777FB8F;
	Mon, 20 Feb 2017 19:10:33 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1KJAVMw025104; Mon, 20 Feb 2017 14:10:31 -0500
Date: Mon, 20 Feb 2017 20:10:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170220201029.441d825b@nial.brq.redhat.com>
In-Reply-To: <1486996099-15820-5-git-send-email-peter.maydell@linaro.org>
References: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
	<1486996099-15820-5-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 20 Feb 2017 19:10:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/4] hw/arm/virt: Use new
 cpu_generic_new()
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sanF6qZyyRmN

On Mon, 13 Feb 2017 14:28:19 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> Use the new cpu_generic_new() rather than calling
> parse_features by hand.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/virt.c | 24 ++----------------------
>  1 file changed, 2 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f3440f2..bcb9a6d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -172,7 +172,6 @@ static const char *valid_cpus[] = {
>  static bool cpuname_valid(const char *cpu)
>  {
>      int i;
> -
>      for (i = 0; i < ARRAY_SIZE(valid_cpus); i++) {
>          if (strcmp(cpu, valid_cpus[i]) == 0) {
>              return true;
> @@ -1206,10 +1205,6 @@ static void machvirt_init(MachineState *machine)
>      MemoryRegion *ram = g_new(MemoryRegion, 1);
>      const char *cpu_model = machine->cpu_model;
>      char **cpustr;
> -    ObjectClass *oc;
> -    const char *typename;
> -    CPUClass *cc;
> -    Error *err = NULL;
>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>      uint8_t clustersz;
>  
> @@ -1240,6 +1235,7 @@ static void machvirt_init(MachineState *machine)
>          error_report("mach-virt: CPU %s not supported", cpustr[0]);
>          exit(1);
>      }
> +    g_strfreev(cpustr);
>  
>      /* If we have an EL3 boot ROM then the assumption is that it will
>       * implement PSCI itself, so disable QEMU's internal implementation
> @@ -1309,24 +1305,8 @@ static void machvirt_init(MachineState *machine)
>  
>      create_fdt(vms);
>  
> -    oc = cpu_class_by_name(TYPE_ARM_CPU, cpustr[0]);
> -    if (!oc) {
> -        error_report("Unable to find CPU definition");
> -        exit(1);
> -    }
> -    typename = object_class_get_name(oc);
> -
> -    /* convert -smp CPU options specified by the user into global props */
> -    cc = CPU_CLASS(oc);
> -    cc->parse_features(typename, cpustr[1], &err);
> -    g_strfreev(cpustr);
> -    if (err) {
> -        error_report_err(err);
> -        exit(1);
> -    }
> -
>      for (n = 0; n < smp_cpus; n++) {
> -        Object *cpuobj = object_new(typename);
> +        Object *cpuobj = OBJECT(cpu_generic_new(TYPE_ARM_CPU, cpu_model));
It unnecessarily pushes cpu_model parsing farther down the call stack
when all we need for CPU creation is type name.

Since I'm looking at adding '-device cpu' support to virt-arm,
I would prefer to leave object_new() here so that creation logic
would be similar to device_add and not mix '-cpu' parsing to typename
+ global properties that could be moved to generic machine code
with actual CPU creation.


>          if (!vmc->disallow_affinity_adjustment) {
>              /* Adjust MPIDR like 64-bit KVM hosts, which incorporate the
>               * GIC's target-list limitations. 32-bit KVM hosts currently

