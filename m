Received: by 10.25.0.198 with SMTP id 189csp495468lfa;
        Thu, 4 May 2017 03:01:55 -0700 (PDT)
X-Received: by 10.237.41.199 with SMTP id o65mr39128557qtd.239.1493892115416;
        Thu, 04 May 2017 03:01:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i13si1468121qtc.331.2017.05.04.03.01.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 May 2017 03:01:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40821 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6Da4-0007CK-Qb
	for alex.bennee@linaro.org; Thu, 04 May 2017 06:01:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6DZy-0007C6-EW
	for qemu-arm@nongnu.org; Thu, 04 May 2017 06:01:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6DZt-0004tW-Fg
	for qemu-arm@nongnu.org; Thu, 04 May 2017 06:01:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56392)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1d6DZt-0004t5-6c; Thu, 04 May 2017 06:01:41 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 003473D956;
	Thu,  4 May 2017 10:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 003473D956
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 003473D956
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0712517974;
	Thu,  4 May 2017 10:01:37 +0000 (UTC)
Date: Thu, 4 May 2017 12:01:35 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170504100135.hdqovueuwiiq2s5r@kamzik.brq.redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-10-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493816238-33120-10-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 04 May 2017 10:01:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 09/24] numa: add check that board supports
 cpu_index to node mapping
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
X-TUID: NmZVgNEAARvB

On Wed, May 03, 2017 at 02:57:03PM +0200, Igor Mammedov wrote:
> Default node mapping initialization already checks that board
> supports cpu_index to node mapping and refuses to start if
> it's not supported. Do the same for explicitly provided
> mapping "-numa node,cpus=..."
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  numa.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/numa.c b/numa.c
> index ab1661d..b517870 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -140,10 +140,12 @@ uint32_t numa_get_node(ram_addr_t addr, Error **errp)
>      return -1;
>  }
>  
> -static void numa_node_parse(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
> +static void numa_node_parse(MachineState *ms, NumaNodeOptions *node,
> +                            QemuOpts *opts, Error **errp)
>  {
>      uint16_t nodenr;
>      uint16List *cpus = NULL;
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>  
>      if (node->has_nodeid) {
>          nodenr = node->nodeid;
> @@ -162,6 +164,10 @@ static void numa_node_parse(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
>          return;
>      }
>  
> +    if (!mc->cpu_index_to_instance_props) {
> +        error_report("CPUs to NUMA node mapping isn't supported");
> +        exit(1);
> +    }
>      for (cpus = node->cpus; cpus; cpus = cpus->next) {
>          if (cpus->value >= max_cpus) {
>              error_setg(errp,
> @@ -215,6 +221,7 @@ static void numa_node_parse(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
>  static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
>  {
>      NumaOptions *object = NULL;
> +    MachineState *ms = opaque;
>      Error *err = NULL;
>  
>      {
> @@ -229,7 +236,7 @@ static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
>  
>      switch (object->type) {
>      case NUMA_OPTIONS_TYPE_NODE:
> -        numa_node_parse(&object->u.node, opts, &err);
> +        numa_node_parse(ms, &object->u.node, opts, &err);
>          if (err) {
>              goto end;
>          }
> @@ -303,7 +310,7 @@ void parse_numa_opts(MachineState *ms)
>          numa_info[i].node_cpu = bitmap_new(max_cpus);
>      }
>  
> -    if (qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, NULL, NULL)) {
> +    if (qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, NULL)) {
>          exit(1);
>      }
>  
> -- 
> 2.7.4
>

With Eduardo's error message change

Reviewed-by: Andrew Jones <drjones@redhat.com>
