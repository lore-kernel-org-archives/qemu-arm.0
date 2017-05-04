Received: by 10.25.0.198 with SMTP id 189csp552812lfa;
        Thu, 4 May 2017 05:35:33 -0700 (PDT)
X-Received: by 10.176.86.28 with SMTP id y28mr5919387uaa.145.1493901333390;
        Thu, 04 May 2017 05:35:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c23si882625uah.10.2017.05.04.05.35.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 May 2017 05:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41732 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6Fym-0004p7-Rq
	for alex.bennee@linaro.org; Thu, 04 May 2017 08:35:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6Fye-0004nd-KG
	for qemu-arm@nongnu.org; Thu, 04 May 2017 08:35:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6FyY-0006UP-QY
	for qemu-arm@nongnu.org; Thu, 04 May 2017 08:35:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42186)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1d6FyY-0006U7-Kf; Thu, 04 May 2017 08:35:18 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B17C7F7AD;
	Thu,  4 May 2017 12:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4B17C7F7AD
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4B17C7F7AD
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B1495DD67;
	Thu,  4 May 2017 12:35:01 +0000 (UTC)
Date: Thu, 4 May 2017 14:34:58 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170504123458.sehggkxpci3w2emq@kamzik.brq.redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-19-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493816238-33120-19-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 04 May 2017 12:35:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 18/24] numa: remove no longer used
 numa_get_node_for_cpu()
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
X-TUID: TjBY3QbemM20

On Wed, May 03, 2017 at 02:57:12PM +0200, Igor Mammedov wrote:
> it's been replaced by fetching mapping info from possible_cpus
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  include/sysemu/numa.h |  4 ----
>  numa.c                | 14 --------------
>  2 files changed, 18 deletions(-)
> 
> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> index 98d01e6..9077bb2 100644
> --- a/include/sysemu/numa.h
> +++ b/include/sysemu/numa.h
> @@ -32,10 +32,6 @@ void numa_set_mem_node_id(ram_addr_t addr, uint64_t size, uint32_t node);
>  void numa_unset_mem_node_id(ram_addr_t addr, uint64_t size, uint32_t node);
>  uint32_t numa_get_node(ram_addr_t addr, Error **errp);
>  
> -/* on success returns node index in numa_info,
> - * on failure returns nb_numa_nodes */
> -int numa_get_node_for_cpu(int idx);
> -
>  static inline bool numa_has_node_id(const CPUArchIdList *possible_cpus, int idx)
>  {
>      return possible_cpus->cpus[idx].props.has_node_id;
> diff --git a/numa.c b/numa.c
> index 872ee0d..06c42e9 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -583,20 +583,6 @@ MemdevList *qmp_query_memdev(Error **errp)
>      return list;
>  }
>  
> -int numa_get_node_for_cpu(int idx)
> -{
> -    int i;
> -
> -    assert(idx < max_cpus);
> -
> -    for (i = 0; i < nb_numa_nodes; i++) {
> -        if (test_bit(idx, numa_info[i].node_cpu)) {
> -            break;
> -        }
> -    }
> -    return i;
> -}
> -
>  void ram_block_notifier_add(RAMBlockNotifier *n)
>  {
>      QLIST_INSERT_HEAD(&ram_list.ramblock_notifiers, n, next);
> -- 
> 2.7.4
>

Reviewed-by: Andrew Jones <drjones@redhat.com> 
