Received: by 10.25.0.198 with SMTP id 189csp184078lfa;
        Wed, 3 May 2017 09:35:56 -0700 (PDT)
X-Received: by 10.55.141.67 with SMTP id p64mr3640686qkd.195.1493829356527;
        Wed, 03 May 2017 09:35:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e123si2179257qkc.327.2017.05.03.09.35.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 09:35:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37813 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5xFp-00019e-U6
	for alex.bennee@linaro.org; Wed, 03 May 2017 12:35:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d5xFm-00019X-0N
	for qemu-arm@nongnu.org; Wed, 03 May 2017 12:35:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d5xFi-00007J-SR
	for qemu-arm@nongnu.org; Wed, 03 May 2017 12:35:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42108)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d5xFi-000064-HR; Wed, 03 May 2017 12:35:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63773C04B946;
	Wed,  3 May 2017 16:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 63773C04B946
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 63773C04B946
Received: from localhost (ovpn-116-4.gru2.redhat.com [10.97.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B68B674AA8;
	Wed,  3 May 2017 16:35:44 +0000 (UTC)
Date: Wed, 3 May 2017 13:35:43 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170503163543.GR3482@thinpad.lan.raisama.net>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-24-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493816238-33120-24-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 03 May 2017 16:35:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 23/24] numa: add '-numa cpu,
 ...' option for property based node mapping
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
	qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D5/Bt9onrMOY

On Wed, May 03, 2017 at 02:57:17PM +0200, Igor Mammedov wrote:
[...]
> diff --git a/numa.c b/numa.c
> index 40e9f44..61521f5 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -227,6 +227,7 @@ static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
>      NumaOptions *object = NULL;
>      MachineState *ms = opaque;
>      Error *err = NULL;
> +    CpuInstanceProperties cpu;
>  
>      {
>          Visitor *v = opts_visitor_new(opts);
> @@ -246,6 +247,30 @@ static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
>          }
>          nb_numa_nodes++;
>          break;
> +    case NUMA_OPTIONS_TYPE_CPU:
> +        if (!object->u.cpu.has_node_id) {
> +            error_setg(&err, "Missing mandatory node-id property");
> +            goto end;
> +        }
> +        if (!numa_info[object->u.cpu.node_id].present) {
> +            error_setg(&err, "Invalid node-id=%" PRId64 ", NUMA node must be "
> +                "defined with -numa node,nodeid=ID before it's used with "
> +                "-numa cpu,node-id=ID", object->u.cpu.node_id);
> +            goto end;
> +        }
> +
> +        memset(&cpu, 0, sizeof(cpu));
> +        cpu.has_node_id = object->u.cpu.has_node_id;
> +        cpu.node_id = object->u.cpu.node_id;
> +        cpu.has_socket_id = object->u.cpu.has_socket_id;
> +        cpu.socket_id = object->u.cpu.socket_id;
> +        cpu.has_core_id = object->u.cpu.has_core_id;
> +        cpu.core_id = object->u.cpu.core_id;
> +        cpu.has_thread_id = object->u.cpu.has_thread_id;
> +        cpu.thread_id = object->u.cpu.thread_id;

We don't have a way to avoid copying each field individually?
Some visitor trick, maybe?

Eric, Markus, Michael, do you have any suggestions?

> +
> +        machine_set_cpu_numa_node(ms, &cpu, &err);
> +        break;
>      default:
>          abort();
>      }
> diff --git a/qapi-schema.json b/qapi-schema.json
> index 76d137d..5baf3a4 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -5680,10 +5680,12 @@
>  ##
>  # @NumaOptionsType:
>  #
> +# @cpu: property based CPU(s) to node mapping (Since: 2.10)
> +#
>  # Since: 2.1
>  ##
>  { 'enum': 'NumaOptionsType',
> -  'data': [ 'node' ] }
> +  'data': [ 'node', 'cpu' ] }
>  
>  ##
>  # @NumaOptions:
> @@ -5696,7 +5698,8 @@
>    'base': { 'type': 'NumaOptionsType' },
>    'discriminator': 'type',
>    'data': {
> -    'node': 'NumaNodeOptions' }}
> +    'node': 'NumaNodeOptions',
> +    'cpu': 'NumaCpuOptions' }}
>  
>  ##
>  # @NumaNodeOptions:
> @@ -5725,6 +5728,20 @@
>     '*memdev': 'str' }}
>  
>  ##
> +# @NumaCpuOptions:
> +#
> +# Option "-numa cpu" overrides default cpu to node mapping.
> +# It accepts the same set of cpu properties as returned by
> +# query-hotpluggable-cpus[].props, where node-id could be used to
> +# override default node mapping.
> +#
> +# Since: 2.10
> +##
> +{ 'struct': 'NumaCpuOptions',
> +   'base': 'CpuInstanceProperties',
> +   'data' : {} }
> +
> +##
>  # @HostMemPolicy:
>  #
>  # Host memory policy types
[...]

-- 
Eduardo
