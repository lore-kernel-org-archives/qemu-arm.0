Received: by 10.25.208.194 with SMTP id h185csp740888lfg;
        Fri, 22 Apr 2016 05:34:54 -0700 (PDT)
X-Received: by 10.140.229.69 with SMTP id z66mr21946881qhb.48.1461328494065;
        Fri, 22 Apr 2016 05:34:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g67si3543017qgg.60.2016.04.22.05.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 05:34:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60673 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ataIP-0004Or-L7
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 08:34:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ataIN-0004Mi-6y
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 08:34:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ataIJ-0006qG-P0
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 08:34:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33501)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1ataIJ-0006q5-K0; Fri, 22 Apr 2016 08:34:47 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8FCEB62643;
	Fri, 22 Apr 2016 12:34:46 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-112.brq.redhat.com [10.34.1.112])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3MCYgbc023968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 22 Apr 2016 08:34:44 -0400
Date: Fri, 22 Apr 2016 14:34:42 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160422123442.3mohf2e5tl5pg24v@hawk.localdomain>
References: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
	<1461219834-10416-3-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461219834-10416-3-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 22 Apr 2016 12:34:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 2/5] ARM: Virt: Set
 numa-node-id for CPUs
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
Cc: peter.maydell@linaro.org, david.daney@cavium.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, qemu-arm@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zixrCEMDNAVN

On Thu, Apr 21, 2016 at 02:23:51PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Add a numa-node-id property to specify NUMA information for CPUs.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/arm/virt.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 814a1eb..d21e9a0 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -359,6 +359,7 @@ static void fdt_add_cpu_nodes(const VirtBoardInfo *vbi)
>  {
>      int cpu;
>      int addr_cells = 1;
> +    unsigned int i;
>  
>      /*
>       * From Documentation/devicetree/bindings/arm/cpus.txt
> @@ -408,6 +409,12 @@ static void fdt_add_cpu_nodes(const VirtBoardInfo *vbi)
>                                    armcpu->mp_affinity);
>          }
>  
> +        for (i = 0; i < nb_numa_nodes; i++) {
> +            if (test_bit(cpu, numa_info[i].node_cpu)) {
> +                qemu_fdt_setprop_cell(vbi->fdt, nodename, "numa-node-id", i);
> +            }
> +        }
> +
>          g_free(nodename);
>      }
>  }
> -- 
> 2.0.4
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
