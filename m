Received: by 10.25.159.19 with SMTP id i19csp196258lfe;
        Wed, 3 Feb 2016 17:58:33 -0800 (PST)
X-Received: by 10.140.18.167 with SMTP id 36mr5977622qgf.38.1454551113556;
        Wed, 03 Feb 2016 17:58:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v13si8234138qka.57.2016.02.03.17.58.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Feb 2016 17:58:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aR9Bp-0005mw-6f
	for alex.bennee@linaro.org; Wed, 03 Feb 2016 20:58:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aR9Bm-0005mF-Iu
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 20:58:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aR9Bi-0002Me-In
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 20:58:30 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:37002)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aR9Bh-0002LK-SA; Wed, 03 Feb 2016 20:58:26 -0500
Received: from 172.24.1.49 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DED02681; Thu, 04 Feb 2016 09:54:55 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml426-hub.china.huawei.com
	(10.82.67.181) with Microsoft SMTP Server id 14.3.235.1; Thu, 4 Feb 2016
	09:54:48 +0800
Message-ID: <56B2AF65.3080402@huawei.com>
Date: Thu, 4 Feb 2016 09:54:45 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>
References: <1454511578-24863-1-git-send-email-drjones@redhat.com>
In-Reply-To: <1454511578-24863-1-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.56B2AF70.0131, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c1be0db086c307a8f86c0dc4120be645
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: peter.maydell@linaro.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: fix max-cpus check
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tY7zoGbhC/Y0



On 2016/2/3 22:59, Andrew Jones wrote:
> mach-virt doesn't yet support hotplug, but command lines specifying
> -smp <num>,maxcpus=<bigger-num> don't fail. Of course specifying
> bigger-num as something bigger than the machine supports, e.g. > 8
> on a gicv2 machine, should fail though. This fix also makes mach-
> virt's max-cpus check truly consistent with the one in vl.c:main,
> as the one there was already correctly checking max-cpus instead
> of smp-cpus.
> 
> Reported-by: Shannon Zhao <shannon.zhao@linaro.org>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 15658f49c4e06..44bbbea92b1cf 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1013,7 +1013,7 @@ static void machvirt_init(MachineState *machine)
>      MemoryRegion *sysmem = get_system_memory();
>      MemoryRegion *secure_sysmem = NULL;
>      int gic_version = vms->gic_version;
> -    int n, max_cpus;
> +    int n, virt_max_cpus;
>      MemoryRegion *ram = g_new(MemoryRegion, 1);
>      const char *cpu_model = machine->cpu_model;
>      VirtBoardInfo *vbi;
> @@ -1051,15 +1051,15 @@ static void machvirt_init(MachineState *machine)
>       * many redistributors we can fit into the memory map.
>       */
>      if (gic_version == 3) {
> -        max_cpus = vbi->memmap[VIRT_GIC_REDIST].size / 0x20000;
> +        virt_max_cpus = vbi->memmap[VIRT_GIC_REDIST].size / 0x20000;
>      } else {
> -        max_cpus = GIC_NCPU;
> +        virt_max_cpus = GIC_NCPU;
>      }
>  
> -    if (smp_cpus > max_cpus) {
> +    if (max_cpus > virt_max_cpus) {
>          error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
Does it need to change the SMP?    ^~~~

>                       "supported by machine 'mach-virt' (%d)",
> -                     smp_cpus, max_cpus);
> +                     max_cpus, virt_max_cpus);
>          exit(1);
>      }

-- 
Shannon

