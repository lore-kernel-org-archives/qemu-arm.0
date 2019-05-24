Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3082442wrg;
        Fri, 24 May 2019 07:13:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2rpIPyZ8VWd49yk3H8oPdgcfuPP+G5x2JMh/kV7kfftylxbkpLERN9GXCS9H6FOkjgGiB
X-Received: by 2002:a50:aef6:: with SMTP id f51mr104429258edd.225.1558707197839;
        Fri, 24 May 2019 07:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558707197; cv=none;
        d=google.com; s=arc-20160816;
        b=XnaSht5armnuXYJBbQgHPnNtZ9X9c7U2Fxiph7ABP6Z7Y7M8s2F2WkED9JUaNWoq+2
         YPBrtnH1nAlJRf+Bja/m4iXG1mOuTM+r+ZIeuloVIEyrIm1Ma0exzRwIBcDMhA0JfDU4
         PVtitsoQATz8E93mFleNsSSzzb6V3MT26gRbayPQUWbfvldVKlYBaAbBDFM3rS3BlsS8
         fbvCPt3iqc0OIteTbFq82JG81NCh35+A57bxrFelZUi/Bvndu8Cu9yqFTlBJiN6pYgcF
         QEXn6xFVxDHgB8UIQyqC3HnDtAxlgEtc7KkcZiIFzpzq1iBKAcTo7xn0hbICzQ4/3A7l
         OsWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=hpvx75eeFBTT00AJncSp5+EsoGXjlDNA1fBYlDoG/Ow=;
        b=C3TliMqpmB9oeO4/P+TWDXBHJIt1Es0RM9RpNNVHwnMCnU7BCGc5REiHzMx52ojcla
         wwJgmJ5UcBZqpb2jg+rkTL8KcfPhiXTeAZb4DAXhvcU3vWKt31lcZO0IXmxlDFEMB8K4
         DPkFcjdyKl9ErhcF3SeD0UnidAQTfDdk6CEmY219FDie24zlNklCDlxVLyCgVebvg55H
         V8sRK9FkG/oMQ9GWLJ3IHaT77qP7qXuNhXnoZ3jh0GGxUZDOFgr3klK1/D+OWSD4TdfJ
         sC0pnNUplcdqUUSd4oSRwRnQt15+qmVr0zLM0OfAKcRvClUqHBQN1nrf+YtwOv5ONddS
         MeKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g23si1750334ejj.210.2019.05.24.07.13.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 May 2019 07:13:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55259 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUAwe-00024T-Ns
	for alex.bennee@linaro.org; Fri, 24 May 2019 10:13:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hUAuS-000072-Lv
	for qemu-devel@nongnu.org; Fri, 24 May 2019 10:11:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hUAuR-0008V6-Jh
	for qemu-devel@nongnu.org; Fri, 24 May 2019 10:11:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33066)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hUAuO-0008Qb-Lg; Fri, 24 May 2019 10:10:56 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7A3330C0DC5;
	Fri, 24 May 2019 14:10:50 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3FDE12CFD6;
	Fri, 24 May 2019 14:10:49 +0000 (UTC)
Date: Fri, 24 May 2019 16:10:45 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20190524161045.314fa2de@redhat.com>
In-Reply-To: <20190524103521.13847-1-lvivier@redhat.com>
References: <20190524103521.13847-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 24 May 2019 14:10:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3] numa: improve cpu hotplug error message
 with a wrong node-id
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rcrpVsPexY+b

On Fri, 24 May 2019 12:35:21 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> On pseries, core-ids are strongly binded to a node-id by the command
> line option. If an user tries to add a CPU to the wrong node, he has
> an error but it is not really helpful:
> 
>   qemu-system-ppc64 ... -smp 1,maxcpus=64,cores=1,threads=1,sockets=1 \
>                         -numa node,nodeid=0 -numa node,nodeid=1 ...
> 
>   (qemu) device_add power9_v2.0-spapr-cpu-core,core-id=30,node-id=1
>   Error: node-id=1 must match numa node specified with -numa option
> 
> This patch improves this error message by giving to the user the good
> topology information (node-id, socket-id and thread-id if they are
> available) to use with the core-id he's providing:
> 
>   Error: node-id=1 must match numa node specified with -numa option 'node-id 0'
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
> 
> Notes:
>     v3: only add the topology to the existing message
>         As suggested by Igor replace
>           Error: core-id 30 can only be plugged into node-id 0
>         by
>           Error: node-id=1 must match numa node specified with -numa option 'node-id 0'
>     
>     v2: display full topology in the error message
> 
>  numa.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/numa.c b/numa.c
> index 3875e1efda3a..7882ec294be4 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -458,6 +458,27 @@ void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
>      set_numa_options(MACHINE(qdev_get_machine()), cmd, errp);
>  }
>  
> +static char *cpu_topology_to_string(const CPUArchId *cpu)
> +{
> +    GString *s = g_string_new(NULL);
> +    if (cpu->props.has_socket_id) {
> +        g_string_append_printf(s, "socket-id %"PRId64, cpu->props.socket_id);
> +    }
> +    if (cpu->props.has_node_id) {
> +        if (s->len) {
> +            g_string_append_printf(s, ", ");
> +        }
> +        g_string_append_printf(s, "node-id %"PRId64, cpu->props.node_id);
> +    }
> +    if (cpu->props.has_thread_id) {
> +        if (s->len) {
> +            g_string_append_printf(s, ", ");
> +        }
> +        g_string_append_printf(s, "thread-id %"PRId64, cpu->props.thread_id);
> +    }
> +    return g_string_free(s, false);
> +}

turns out we already have such helper: cpu_slot_to_string()

> +
>  void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp)
>  {
>      int node_id = object_property_get_int(OBJECT(dev), "node-id", &error_abort);
> @@ -470,8 +491,10 @@ void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp)
>                                      "node-id", errp);
>          }
>      } else if (node_id != slot->props.node_id) {
> +        char *topology = cpu_topology_to_string(slot);
>          error_setg(errp, "node-id=%d must match numa node specified "
> -                   "with -numa option", node_id);
> +                   "with -numa option '%s'", node_id, topology);
> +        g_free(topology);
>      }
>  }
>  

