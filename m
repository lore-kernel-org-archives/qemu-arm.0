Received: by 10.25.0.198 with SMTP id 189csp556543lfa;
        Thu, 4 May 2017 05:45:32 -0700 (PDT)
X-Received: by 10.176.74.129 with SMTP id s1mr22531406uae.100.1493901932049;
        Thu, 04 May 2017 05:45:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e50si1125598uaa.126.2017.05.04.05.45.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 May 2017 05:45:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6G8R-0003qN-JE
	for alex.bennee@linaro.org; Thu, 04 May 2017 08:45:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6G8M-0003q2-5u
	for qemu-arm@nongnu.org; Thu, 04 May 2017 08:45:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6G8L-00029j-5L
	for qemu-arm@nongnu.org; Thu, 04 May 2017 08:45:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51678)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1d6G8K-00029e-SI; Thu, 04 May 2017 08:45:25 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A877880C21;
	Thu,  4 May 2017 12:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A877880C21
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A877880C21
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 616A37E2C0;
	Thu,  4 May 2017 12:45:21 +0000 (UTC)
Date: Thu, 4 May 2017 14:45:18 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170504124518.5qui4pcvamfmbsuw@kamzik.brq.redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-23-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493816238-33120-23-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 04 May 2017 12:45:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 22/24] numa: remove node_cpu bitmaps as
 they are no longer used
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
X-TUID: sfJR18cwjb/N

On Wed, May 03, 2017 at 02:57:16PM +0200, Igor Mammedov wrote:
> Postfactum "CPU(s) present in multiple NUMA nodes" check
> was the last user of node_cpu bitmaps, but it's not need
> as machine_set_cpu_numa_node() does the similar check at
> the time mapping is set for cpus (i.e. when -numa cpus=
> is parsed) and ensures that cpu can be mapped only to
> one node.
> 
> Remove duplicate check based on node_cpu bitmaps and
> since the last user is gone remove node_cpu as well,
> which completes internal transition from legacy bitmap
> based mapping storage to possible_cpus storage.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  include/sysemu/numa.h |  1 -
>  numa.c                | 42 ------------------------------------------
>  2 files changed, 43 deletions(-)
> 
> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> index 0b0a044..7f2d397 100644
> --- a/include/sysemu/numa.h
> +++ b/include/sysemu/numa.h
> @@ -17,7 +17,6 @@ struct numa_addr_range {
>  
>  typedef struct node_info {
>      uint64_t node_mem;
> -    unsigned long *node_cpu;
>      struct HostMemoryBackend *node_memdev;
>      bool present;
>      QLIST_HEAD(, numa_addr_range) addr; /* List to store address ranges */
> diff --git a/numa.c b/numa.c
> index d7aa662..40e9f44 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -177,7 +177,6 @@ static void numa_node_parse(MachineState *ms, NumaNodeOptions *node,
>                         cpus->value, max_cpus);
>              return;
>          }
> -        bitmap_set(numa_info[nodenr].node_cpu, cpus->value, 1);
>          props = mc->cpu_index_to_instance_props(ms, cpus->value);
>          props.node_id = nodenr;
>          props.has_node_id = true;
> @@ -261,51 +260,12 @@ end:
>      return 0;
>  }
>  
> -static char *enumerate_cpus(unsigned long *cpus, int max_cpus)
> -{
> -    int cpu;
> -    bool first = true;
> -    GString *s = g_string_new(NULL);
> -
> -    for (cpu = find_first_bit(cpus, max_cpus);
> -        cpu < max_cpus;
> -        cpu = find_next_bit(cpus, max_cpus, cpu + 1)) {
> -        g_string_append_printf(s, "%s%d", first ? "" : " ", cpu);
> -        first = false;
> -    }
> -    return g_string_free(s, FALSE);
> -}
> -
> -static void validate_numa_cpus(void)
> -{
> -    int i;
> -    unsigned long *seen_cpus = bitmap_new(max_cpus);
> -
> -    for (i = 0; i < nb_numa_nodes; i++) {
> -        if (bitmap_intersects(seen_cpus, numa_info[i].node_cpu, max_cpus)) {
> -            bitmap_and(seen_cpus, seen_cpus,
> -                       numa_info[i].node_cpu, max_cpus);
> -            error_report("CPU(s) present in multiple NUMA nodes: %s",
> -                         enumerate_cpus(seen_cpus, max_cpus));
> -            g_free(seen_cpus);
> -            exit(EXIT_FAILURE);
> -        }
> -        bitmap_or(seen_cpus, seen_cpus,
> -                  numa_info[i].node_cpu, max_cpus);
> -    }
> -    g_free(seen_cpus);
> -}
> -
>  void parse_numa_opts(MachineState *ms)
>  {
>      int i;
>      const CPUArchIdList *possible_cpus;
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
>  
> -    for (i = 0; i < MAX_NODES; i++) {
> -        numa_info[i].node_cpu = bitmap_new(max_cpus);
> -    }
> -
>      if (qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, NULL)) {
>          exit(1);
>      }
> @@ -397,12 +357,10 @@ void parse_numa_opts(MachineState *ms)
>                  props = mc->cpu_index_to_instance_props(ms, i);
>                  props.has_node_id = true;
>  
> -                set_bit(i, numa_info[props.node_id].node_cpu);
>                  machine_set_cpu_numa_node(ms, &props, &error_fatal);
>              }
>          }
>  
> -        validate_numa_cpus();
>      } else {
>          numa_set_mem_node_id(0, ram_size, 0);
>      }
> -- 
> 2.7.4
>

Reviewed-by: Andrew Jones <drjones@redhat.com> 
