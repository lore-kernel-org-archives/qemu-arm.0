Received: by 10.25.0.198 with SMTP id 189csp550688lfa;
        Thu, 4 May 2017 05:30:43 -0700 (PDT)
X-Received: by 10.159.48.81 with SMTP id i17mr5514826uab.144.1493901043581;
        Thu, 04 May 2017 05:30:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u69si831434uau.50.2017.05.04.05.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 May 2017 05:30:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41705 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6Fu7-0000na-24
	for alex.bennee@linaro.org; Thu, 04 May 2017 08:30:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6Ftz-0000mq-1i
	for qemu-arm@nongnu.org; Thu, 04 May 2017 08:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6Ftv-0004eo-UE
	for qemu-arm@nongnu.org; Thu, 04 May 2017 08:30:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52856)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1d6Ftv-0004ed-Ns; Thu, 04 May 2017 08:30:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10DF34E4CA;
	Thu,  4 May 2017 12:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 10DF34E4CA
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 10DF34E4CA
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41B8F1838C;
	Thu,  4 May 2017 12:30:24 +0000 (UTC)
Date: Thu, 4 May 2017 14:30:21 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170504123021.hnvrteifvt7jk6en@kamzik.brq.redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-13-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493816238-33120-13-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 04 May 2017 12:30:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 12/24] numa: add
 numa_[has_]node_id() wrappers
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
X-TUID: Hvp7GUC9O6RV

On Wed, May 03, 2017 at 02:57:06PM +0200, Igor Mammedov wrote:
> wrappers should make access to [has]node_id fields more readable
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  follow up patches will use this wrappers
>  v2:
>     - add wrappers (Drew)
> ---
>  include/sysemu/numa.h | 10 ++++++++++
>  numa.c                |  2 +-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> index 46ea6c7..98d01e6 100644
> --- a/include/sysemu/numa.h
> +++ b/include/sysemu/numa.h
> @@ -35,4 +35,14 @@ uint32_t numa_get_node(ram_addr_t addr, Error **errp);
>  /* on success returns node index in numa_info,
>   * on failure returns nb_numa_nodes */
>  int numa_get_node_for_cpu(int idx);
> +
> +static inline bool numa_has_node_id(const CPUArchIdList *possible_cpus, int idx)
> +{
> +    return possible_cpus->cpus[idx].props.has_node_id;
> +}
> +
> +static inline int numa_node_id(const CPUArchIdList *possible_cpus, int idx)
> +{
> +    return possible_cpus->cpus[idx].props.node_id;
> +}
>  #endif
> diff --git a/numa.c b/numa.c
> index c7e3e0a..872ee0d 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -394,7 +394,7 @@ void parse_numa_opts(MachineState *ms)
>  
>          possible_cpus = mc->possible_cpu_arch_ids(ms);
>          for (i = 0; i < possible_cpus->len; i++) {
> -            if (possible_cpus->cpus[i].props.has_node_id) {
> +            if (numa_has_node_id(possible_cpus, i)) {
>                  break;
>              }
>          }
> -- 
> 2.7.4
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
