Received: by 10.25.0.198 with SMTP id 189csp534398lfa;
        Thu, 4 May 2017 04:52:45 -0700 (PDT)
X-Received: by 10.176.2.178 with SMTP id 47mr12933970uah.36.1493898765540;
        Thu, 04 May 2017 04:52:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h63si796224vkf.9.2017.05.04.04.52.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 May 2017 04:52:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41224 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6FJM-00041v-PR
	for alex.bennee@linaro.org; Thu, 04 May 2017 07:52:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6FCW-0005Mb-0p
	for qemu-arm@nongnu.org; Thu, 04 May 2017 07:45:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6FCT-0005Nf-MQ
	for qemu-arm@nongnu.org; Thu, 04 May 2017 07:45:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41096)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1d6FCT-0005M0-DL; Thu, 04 May 2017 07:45:37 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49CB13E9;
	Thu,  4 May 2017 11:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 49CB13E9
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 49CB13E9
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7F6317DB7;
	Thu,  4 May 2017 11:45:30 +0000 (UTC)
Date: Thu, 4 May 2017 13:45:28 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170504114528.hegmpv62s3iteq7y@kamzik.brq.redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-12-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493816238-33120-12-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 04 May 2017 11:45:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 11/24] numa: do default mapping based on
 possible_cpus instead of node_cpu bitmaps
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
X-TUID: vRNGgWWkDbLo

On Wed, May 03, 2017 at 02:57:05PM +0200, Igor Mammedov wrote:
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  numa.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/numa.c b/numa.c
> index 5ff1212..c7e3e0a 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -309,6 +309,7 @@ static void validate_numa_cpus(void)
>  void parse_numa_opts(MachineState *ms)
>  {
>      int i;
> +    const CPUArchIdList *possible_cpus;
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
>  
>      for (i = 0; i < MAX_NODES; i++) {
> @@ -379,11 +380,6 @@ void parse_numa_opts(MachineState *ms)
>  
>          numa_set_mem_ranges();
>  
> -        for (i = 0; i < nb_numa_nodes; i++) {
> -            if (!bitmap_empty(numa_info[i].node_cpu, max_cpus)) {
> -                break;
> -            }
> -        }
>          /* Historically VCPUs were assigned in round-robin order to NUMA
>           * nodes. However it causes issues with guest not handling it nice
>           * in case where cores/threads from a multicore CPU appear on
> @@ -391,11 +387,20 @@ void parse_numa_opts(MachineState *ms)
>           * rule grouping VCPUs by socket so that VCPUs from the same socket
>           * would be on the same node.
>           */
> -        if (!mc->cpu_index_to_instance_props) {
> +        if (!mc->cpu_index_to_instance_props || !mc->possible_cpu_arch_ids) {
>              error_report("default CPUs to NUMA node mapping isn't supported");
>              exit(1);
>          }
> -        if (i == nb_numa_nodes) {
> +
> +        possible_cpus = mc->possible_cpu_arch_ids(ms);
> +        for (i = 0; i < possible_cpus->len; i++) {
> +            if (possible_cpus->cpus[i].props.has_node_id) {
> +                break;
> +            }
> +        }
> +
> +        /* no CPUs are assigned to NUMA nodes */
> +        if (i == possible_cpus->len) {
>              for (i = 0; i < max_cpus; i++) {
>                  CpuInstanceProperties props;
>                  /* fetch default mapping from board and enable it */
> -- 
> 2.7.4
>

Reviewed-by: Andrew Jones <drjones@redhat.com> 
