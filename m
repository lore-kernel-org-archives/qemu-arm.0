Received: by 10.25.0.198 with SMTP id 189csp144344lfa;
        Wed, 3 May 2017 08:05:00 -0700 (PDT)
X-Received: by 10.237.37.142 with SMTP id x14mr31924284qtc.160.1493823900190;
        Wed, 03 May 2017 08:05:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d27si2421793qkh.240.2017.05.03.08.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 08:05:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37262 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5vpp-00034t-P8
	for alex.bennee@linaro.org; Wed, 03 May 2017 11:04:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d5vpX-0002yZ-P2
	for qemu-arm@nongnu.org; Wed, 03 May 2017 11:04:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d5vpT-0004aB-R5
	for qemu-arm@nongnu.org; Wed, 03 May 2017 11:04:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36614)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d5vpT-0004Zg-LY; Wed, 03 May 2017 11:04:35 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 427424E4C8;
	Wed,  3 May 2017 15:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 427424E4C8
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 427424E4C8
Received: from localhost (ovpn-116-4.gru2.redhat.com [10.97.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B15AE19CB7;
	Wed,  3 May 2017 15:04:33 +0000 (UTC)
Date: Wed, 3 May 2017 12:04:29 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170503150429.GO3482@thinpad.lan.raisama.net>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-10-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493816238-33120-10-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 03 May 2017 15:04:34 +0000 (UTC)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WLnICg10tfjz

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

The error message sounds very confusing me. Maybe this could
become just: "NUMA is not supported by the %s machine-type"?

-- 
Eduardo
