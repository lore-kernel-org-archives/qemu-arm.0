Received: by 10.25.0.198 with SMTP id 189csp553570lfa;
        Thu, 4 May 2017 05:37:27 -0700 (PDT)
X-Received: by 10.31.200.65 with SMTP id y62mr19881541vkf.142.1493901447330;
        Thu, 04 May 2017 05:37:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 15si853067uag.46.2017.05.04.05.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 May 2017 05:37:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41743 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6G0c-00070h-P9
	for alex.bennee@linaro.org; Thu, 04 May 2017 08:37:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60714)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6Fyo-0004wK-EU
	for qemu-arm@nongnu.org; Thu, 04 May 2017 08:35:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6Fyn-0006dI-HF
	for qemu-arm@nongnu.org; Thu, 04 May 2017 08:35:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54346)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1d6Fyn-0006cN-82; Thu, 04 May 2017 08:35:33 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15F5C3DBC5;
	Thu,  4 May 2017 12:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 15F5C3DBC5
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 15F5C3DBC5
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD0C2777EB;
	Thu,  4 May 2017 12:35:29 +0000 (UTC)
Date: Thu, 4 May 2017 14:35:27 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170504123527.nu5hwlxjarifboni@kamzik.brq.redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-20-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493816238-33120-20-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 04 May 2017 12:35:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 19/24] numa: remove no longer need
 numa_post_machine_init()
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
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PMNEqmmvc96D

On Wed, May 03, 2017 at 02:57:13PM +0200, Igor Mammedov wrote:
> CPUState::numa_node is still in use but now it's set by
> board when it creates CPU objects. So there isn't any
> need to set it again after all CPU's are created,
> since it's been already set.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  include/sysemu/numa.h |  1 -
>  numa.c                | 15 ---------------
>  vl.c                  |  2 --
>  3 files changed, 18 deletions(-)
> 
> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> index 9077bb2..0b0a044 100644
> --- a/include/sysemu/numa.h
> +++ b/include/sysemu/numa.h
> @@ -25,7 +25,6 @@ typedef struct node_info {
>  
>  extern NodeInfo numa_info[MAX_NODES];
>  void parse_numa_opts(MachineState *ms);
> -void numa_post_machine_init(void);
>  void query_numa_node_mem(uint64_t node_mem[]);
>  extern QemuOptsList qemu_numa_opts;
>  void numa_set_mem_node_id(ram_addr_t addr, uint64_t size, uint32_t node);
> diff --git a/numa.c b/numa.c
> index 06c42e9..f8c849d 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -418,21 +418,6 @@ void parse_numa_opts(MachineState *ms)
>      }
>  }
>  
> -void numa_post_machine_init(void)
> -{
> -    CPUState *cpu;
> -    int i;
> -
> -    CPU_FOREACH(cpu) {
> -        for (i = 0; i < nb_numa_nodes; i++) {
> -            assert(cpu->cpu_index < max_cpus);
> -            if (test_bit(cpu->cpu_index, numa_info[i].node_cpu)) {
> -                cpu->numa_node = i;
> -            }
> -        }
> -    }
> -}
> -
>  static void allocate_system_memory_nonnuma(MemoryRegion *mr, Object *owner,
>                                             const char *name,
>                                             uint64_t ram_size)
> diff --git a/vl.c b/vl.c
> index c63f4d5..fe4741d 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4595,8 +4595,6 @@ int main(int argc, char **argv, char **envp)
>  
>      cpu_synchronize_all_post_init();
>  
> -    numa_post_machine_init();
> -
>      rom_reset_order_override();
>  
>      /*
> -- 
> 2.7.4
>

Reviewed-by: Andrew Jones <drjones@redhat.com> 
