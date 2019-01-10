Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1930723wrt;
        Thu, 10 Jan 2019 07:21:11 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5xsB0rj583qievuAUkwgyAGJEPTjZEIzEjJ0nQBfe3Cm+Ek73aXTNQhRNr24MbnW/CC0Ix
X-Received: by 2002:adf:a4d9:: with SMTP id h25mr9136027wrb.167.1547133671101;
        Thu, 10 Jan 2019 07:21:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547133671; cv=none;
        d=google.com; s=arc-20160816;
        b=D1icOykuxdDzponOQAGGcVeHQhczPNOYM8wezmVSRZ7qLGeCxcae+qf8KeN8YnRs8G
         JcOU4sSwEBqGZl9GW//Vu9foaTjQ6IKEvcE+6uhwr7NViJhkBK6aLQSpiOU+j5QbPo29
         w7RU85tYnkaQDVxWdJ/XMFvW8DPCgRbsh4E1+O7SoVbUEVRt4LXDh6oexXBm8X1Y/8uX
         7gIoXv+JQzTGfLQ4O6fy/m8BASykxhxVU2MwEPO0d48ynaAIbYhOmj80uJ/ur0+DJIQm
         Xt6USutivpI/ilJrgsfpQI/cHx6+7TEi54KQazgZPvlTG/fHQTBX0XR6cAeWd6Ilto7D
         NYLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=Kz7jtmcFmWLrLgJyylxWNl7sCdOWqGY4uSUDc0aqKQc=;
        b=JtGppdynhjf9WUOBQtXwzbtLvNeIEejdik8/B5oFLCqD8IBalBZ0gbgqUwVd5UuTx2
         cux0Kz6/ItAO6j4nrOHzx6z7qWidYTbCzv2e7b6GyXxViMxErT7cNkppD0zX5f7u4jeJ
         6lLLKu9TAGdg2y2wV5RA+zlIOExoHxJuGRv6Hj8F8EW8ib9/5r4e7IsHJ4E8vt5N2ToF
         ASKlNa+Qj1Kp+KNQ8Kn5jSbZ/GJA2FuYJPFIctf25ArdSfogVZf6YmLNnmsAxAwvSAfs
         Xx7WzXWpbwNtdRJMp2JH/a431fKjWHpT+gfRKQbt/0S5gt3TY9peItFL4oTuVdh+6Pqm
         PBcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YLeVl7+r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si23091289wrh.231.2019.01.10.07.21.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Jan 2019 07:21:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YLeVl7+r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:48853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghc8s-0005HN-4Y
	for alex.bennee@linaro.org; Thu, 10 Jan 2019 10:21:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ghc8e-0005Ex-0J
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 10:20:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ghc8X-000174-JD
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 10:20:55 -0500
Received: from ip135.ip-5-135-226.eu ([5.135.226.135]:53360
	helo=beetle.greensocs.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1ghc8X-00015W-8v; Thu, 10 Jan 2019 10:20:49 -0500
Received: from [172.16.11.100] (tiramisu.bar.greensocs.com [172.16.11.100])
	by beetle.greensocs.com (Postfix) with ESMTPS id 2CA0597035;
	Thu, 10 Jan 2019 15:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=greensocs.com; s=mail;
	t=1547133224; bh=V7Q3xXmoRM0mfzuYPQTSBWy2sV7sAOMosfZ7g9adu9U=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=YLeVl7+rUR7FNCiknkGmeGzZDKIE2c19CvcYe7wNapnmhFvrjIvH+eVSZAlIhnxtU
	l0uDVlSwvsGXgtxyH1zrL2Bcw18wIHFOtXZqreUpsccRkwuJe1iDXFqr3FaaayjSW3
	2BDkv9vEktYRbGIZp4b0T9CooiGlzq5L3KiQEuNo=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190108163008.7006-1-peter.maydell@linaro.org>
	<20190108163008.7006-3-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <67a24fdd-8f62-32c4-4623-f53cdb994938@greensocs.com>
Date: Thu, 10 Jan 2019 16:13:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <20190108163008.7006-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/4] qom/cpu: Add cluster_index
 to CPUState
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, patches@linaro.org,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SdBqhNJdhCYO

On 1/8/19 5:30 PM, Peter Maydell wrote:
> For TCG we want to distinguish which cluster a CPU is in, and
> we need to do it quickly. Cache the cluster index in the CPUState
> struct, by having the cluster object set cpu->cluster_index for
> each CPU child when it is realized.
> 
> This means that board/SoC code must add all CPUs to the cluster
> before realizing the cluster object. Regrettably QOM provides no
> way to prevent adding children to a realized object and no way for
> the parent to be notified when a new child is added to it, so
> we don't have any way to enforce/assert this constraint; all
> we can do is document it in a comment.
> 
> The restriction on how many clusters can exist in the system
> is imposed by TCG code which will be added in a subsequent commit,
> but the check to enforce it in cluster.c fits better in this one.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  include/hw/cpu/cluster.h | 19 +++++++++++++++++++
>  include/qom/cpu.h        |  7 +++++++
>  hw/cpu/cluster.c         | 33 +++++++++++++++++++++++++++++++++
>  qom/cpu.c                |  1 +
>  4 files changed, 60 insertions(+)
> 
> diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
> index 73818232437..d1bef315d10 100644
> --- a/include/hw/cpu/cluster.h
> +++ b/include/hw/cpu/cluster.h
> @@ -34,12 +34,31 @@
>   * Arm big.LITTLE system) they should be in different clusters. If the CPUs do
>   * not have the same view of memory (for example the main CPU and a management
>   * controller processor) they should be in different clusters.
> + *
> + * A cluster is created by creating an object of TYPE_CPU_CLUSTER, and then
> + * adding the CPUs to it as QOM child objects (e.g. using the
> + * object_initialize_child() or object_property_add_child() functions).
> + * All CPUs must be added as children before the cluster is realized.
> + * (Regrettably QOM provides no way to prevent adding children to a realized
> + * object and no way for the parent to be notified when a new child is added
> + * to it, so this restriction is not checked for, but the system will not
> + * behave correctly if it is not adhered to.)
> + *
> + * A CPU which is not put into any cluster will be considered implicitly
> + * to be in a cluster with all the other "loose" CPUs, so all CPUs that are
> + * not assigned to clusters must be identical.
>   */
>  
>  #define TYPE_CPU_CLUSTER "cpu-cluster"
>  #define CPU_CLUSTER(obj) \
>      OBJECT_CHECK(CPUClusterState, (obj), TYPE_CPU_CLUSTER)
>  
> +/*
> + * This limit is imposed by TCG, which puts the cluster ID into an
> + * 8 bit field (and uses all-1s for the default "not in any cluster").
> + */
> +#define MAX_CLUSTERS 255
> +
>  /**
>   * CPUClusterState:
>   * @cluster_id: The cluster ID. This value is for internal use only and should
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 1396f53e5b5..844becbcedc 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -279,6 +279,11 @@ struct qemu_work_item;
>  /**
>   * CPUState:
>   * @cpu_index: CPU index (informative).
> + * @cluster_index: Identifies which cluster this CPU is in.
> + *   For boards which don't define clusters or for "loose" CPUs not assigned
> + *   to a cluster this will be UNASSIGNED_CLUSTER_INDEX; otherwise it will
> + *   be the same as the cluster-id property of the CPU object's TYPE_CPU_CLUSTER
> + *   QOM parent.
>   * @nr_cores: Number of cores within this CPU package.
>   * @nr_threads: Number of threads within this CPU.
>   * @running: #true if CPU is currently running (lockless).
> @@ -404,6 +409,7 @@ struct CPUState {
>  
>      /* TODO Move common fields from CPUArchState here. */
>      int cpu_index;
> +    int cluster_index;
>      uint32_t halted;
>      uint32_t can_do_io;
>      int32_t exception_index;
> @@ -1109,5 +1115,6 @@ extern const struct VMStateDescription vmstate_cpu_common;
>  #endif /* NEED_CPU_H */
>  
>  #define UNASSIGNED_CPU_INDEX -1
> +#define UNASSIGNED_CLUSTER_INDEX -1
>  
>  #endif
> diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
> index 9d50a235d5c..d672f54a620 100644
> --- a/hw/cpu/cluster.c
> +++ b/hw/cpu/cluster.c
> @@ -20,19 +20,52 @@
>  
>  #include "qemu/osdep.h"
>  #include "hw/cpu/cluster.h"
> +#include "qom/cpu.h"
>  #include "qapi/error.h"
>  #include "qemu/module.h"
> +#include "qemu/cutils.h"
>  
>  static Property cpu_cluster_properties[] = {
>      DEFINE_PROP_UINT32("cluster-id", CPUClusterState, cluster_id, 0),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> +static void cpu_cluster_realize(DeviceState *dev, Error **errp)
> +{
> +    /* Iterate through all our CPU children and set their cluster_index */
> +    CPUClusterState *cluster = CPU_CLUSTER(dev);
> +    ObjectPropertyIterator iter;
> +    ObjectProperty *prop;
> +    Object *cluster_obj = OBJECT(dev);
> +
> +    if (cluster->cluster_id >= MAX_CLUSTERS) {
> +        error_setg(errp, "cluster-id must be less than %d", MAX_CLUSTERS);
> +        return;
> +    }
> +
> +    object_property_iter_init(&iter, cluster_obj);
> +    while ((prop = object_property_iter_next(&iter))) {
> +        Object *cpu_obj;
> +        CPUState *cpu;
> +
> +        if (!strstart(prop->type, "child<", NULL)) {
> +            continue;
> +        }
> +        cpu_obj = object_property_get_link(cluster_obj, prop->name, NULL);
> +        cpu = (CPUState *)object_dynamic_cast(cpu_obj, TYPE_CPU);
> +        if (!cpu) {
> +            continue;
> +        }
> +        cpu->cluster_index = cluster->cluster_id;
> +    }
> +}
> +
>  static void cpu_cluster_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      dc->props = cpu_cluster_properties;
> +    dc->realize = cpu_cluster_realize;
>  }
>  
>  static const TypeInfo cpu_cluster_type_info = {
> diff --git a/qom/cpu.c b/qom/cpu.c
> index 5442a7323be..f5579b1cd50 100644
> --- a/qom/cpu.c
> +++ b/qom/cpu.c
> @@ -364,6 +364,7 @@ static void cpu_common_initfn(Object *obj)
>      CPUClass *cc = CPU_GET_CLASS(obj);
>  
>      cpu->cpu_index = UNASSIGNED_CPU_INDEX;
> +    cpu->cluster_index = UNASSIGNED_CLUSTER_INDEX;
>      cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
>      /* *-user doesn't have configurable SMP topology */
>      /* the default value is changed by qemu_init_vcpu() for softmmu */
> 
