Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp821189wrt;
        Fri, 25 Jan 2019 14:44:18 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5he/4MUL+aGf2Ot/6wjm0fsQI03awED0z/xUuJJJrPKp5Fn5g4mfAOvq05RqsDb4j/4n7f
X-Received: by 2002:a1c:f518:: with SMTP id t24mr8488679wmh.26.1548456258567;
        Fri, 25 Jan 2019 14:44:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548456258; cv=none;
        d=google.com; s=arc-20160816;
        b=krcw3Xq92mZmVssk3bFRfHFzut2ECo1seHY8qh7yRvWwbDm2hcSvTX2LFwKC0yytWg
         sPDfgHXcnq5F0dOlZNbo4skPCXe7TMRmIOaGhQu9eoP37zSChlrxuavp+CQawvvXJ+HF
         97qbvnIzlHZV5VmQ0u+XtAEq6wmwiEAeJJztQnzKoYzRrh0TzcLzMmMWZSfyLQCR7jDC
         HRlcyPqU2OTd+gvALJ2Z50PdSQfjuvEO3qMNpqo9uz4AXa+nnxtHURWU6Tat62A10e5c
         E2apjfIvStp/IkqFugbIZdFR0HGg0pItWgPqYsjAJTLcIFj/mX4vx8X0fOlLnsh6zOry
         uadQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=W3FRNBMmLzQCz3mWAcnPDfK6ZStb5VhwMd+s+KLxhx0=;
        b=m8O+YnfQpfvHT7e4nzQfiLrIIKvW00elT0INSayti0cox+P/jufFTtZh+fPPSTNdlq
         ZM6lBx3AgG8LDyrtf8Tewq7xbkEBMYuxD5MpC+8XJYi/bX8mq19WrsUfjIcz6qg0fqyE
         3edfIa45DDPxbqu7NHajkYwo0Qi6DbAHN5WqBYJt4atweP5P3KhRCVnQaQ46XRwxBiY0
         HOQ7tI5BoRRdTceTqkvbw3P4EnGnUvf38qxtlw/IrxB3nhJd2Wvv9jhSh7TNGYBrU3G4
         E6MEw624NXcnoQTmof3/QHqHAFfDJBcvRqvVVUU6cw7jcjeUZ3NWMB9sbYNaSNv9kivA
         IWSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hcqll7jb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u141si41643005wmu.75.2019.01.25.14.44.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 14:44:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hcqll7jb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:51922 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnACv-0006HR-C5
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 17:44:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gnACR-0006HC-Gw
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 17:43:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gnACP-000245-ID
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 17:43:47 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:33326)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gnACN-0001vu-0I; Fri, 25 Jan 2019 17:43:45 -0500
Received: by mail-pl1-x642.google.com with SMTP id z23so5201004plo.0;
	Fri, 25 Jan 2019 14:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=W3FRNBMmLzQCz3mWAcnPDfK6ZStb5VhwMd+s+KLxhx0=;
	b=hcqll7jbUCL1xvZv42OykDMlQyqQhbgXDzHuRzlatKd3hY+pk2Vcyh2xw07tztx5iR
	uGbHgHuQWtHkGlqJSg9gR/pZskDKO6WjlC3fSnAD3GtUz1WWSXAfHMjfcsCJcjBIiYYF
	MVpGWk3VlmlxO5rOf1wg3sJrNOHmDmSap/mbeOWA8i1iswxeve5BPjc/tEpg6LOkh/aP
	DzwBComrtC3KhIwywemkHRQidewv98h8Gv71htsocGpgKg0S1zmU7U155KQVqdjJrhTW
	MmMUPxLdZRYEn+fyYu2V7J/QULwHPY3y5AEU5hVidpWPnmL4X5l/8pDUL7M+YYK0TErQ
	8x0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=W3FRNBMmLzQCz3mWAcnPDfK6ZStb5VhwMd+s+KLxhx0=;
	b=ML3WxOf2cDhsLgWCCbz9UEwXOZFFX5vb1O7V61NSKKe2rcI5cHmlis4CSt2QqpuyQA
	pe1G/ESS4OIAGoZH1i4f0BTUmi1BgVJQuzH8gDqQHLKQjgTaesxV/C76Uf1ITqraCbgB
	TnZUgR99/I2+MUqorzHN3CPEmd6lAQJKnMePY89wRDSTgxP9NOWkE0DD48pIpuEni6Fy
	OuXO1HMk0WW6Qi7IQo6ErQkGAUTGgal3Ir5LYVoasanccDjFKq6sftynNVHA6zc8vmrt
	IFpgo7zVguuLes6pM194ClwjiR7CLZ1bZcuHZM5z1QKy6kW72ZZe6NuzQfxNgbKzevhG
	ohEg==
X-Gm-Message-State: AJcUukf8WyhS/wd7WeQQf/G/1sY0TyscQYZfm4XQ9szo/2req7BaRUWz
	Jw3E3VkWOsoM5/0d3Felojk=
X-Received: by 2002:a17:902:1101:: with SMTP id
	d1mr12735975pla.136.1548456208574; 
	Fri, 25 Jan 2019 14:43:28 -0800 (PST)
Received: from [10.196.159.136] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	a10sm32737965pfi.138.2019.01.25.14.43.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 14:43:27 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121152218.9592-1-peter.maydell@linaro.org>
	<20190121152218.9592-3-peter.maydell@linaro.org>
From: Alistair <alistair23@gmail.com>
Message-ID: <e8868b49-171e-5273-0bf4-45ef8a8a4cfe@gmail.com>
Date: Fri, 25 Jan 2019 14:43:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121152218.9592-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-devel] [PATCH v3 2/4] qom/cpu: Add cluster_index to
 CPUState
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5n+ep0lcFBzp

On 1/21/19 7:22 AM, Peter Maydell wrote:
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
> we can do is document it in a comment. We can at least put in a
> check that the cluster contains at least one CPU, which should
> catch the typical cases of "realized cluster too early" or
> "forgot to parent the CPUs into it".
> 
> The restriction on how many clusters can exist in the system
> is imposed by TCG code which will be added in a subsequent commit,
> but the check to enforce it in cluster.c fits better in this one.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes v2->v3:
>   * allow CPU objects to be indirect children of the cluster;
>     this is useful for ARMv7M, where the CPU object is a child
>     of the armv7m container and the board code that sets up
>     the cluster object only has the armv7m container object:
>     this is done by using object_child_foreach_recursive()
>     rather than an open-coded child iteration
>   * add an assertion that the cluster has at least one CPU,
>     which catches the easiest-to-make errors when creating
>     and populating the cluster
> ---
>   include/hw/cpu/cluster.h | 24 +++++++++++++++++++++
>   include/qom/cpu.h        |  7 ++++++
>   hw/cpu/cluster.c         | 46 ++++++++++++++++++++++++++++++++++++++++
>   qom/cpu.c                |  1 +
>   4 files changed, 78 insertions(+)
> 
> diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
> index 73818232437..549c2d31d43 100644
> --- a/include/hw/cpu/cluster.h
> +++ b/include/hw/cpu/cluster.h
> @@ -34,12 +34,36 @@
>    * Arm big.LITTLE system) they should be in different clusters. If the CPUs do
>    * not have the same view of memory (for example the main CPU and a management
>    * controller processor) they should be in different clusters.
> + *
> + * A cluster is created by creating an object of TYPE_CPU_CLUSTER, and then
> + * adding the CPUs to it as QOM child objects (e.g. using the
> + * object_initialize_child() or object_property_add_child() functions).
> + * The CPUs may be either direct children of the cluster object, or indirect
> + * children (e.g. children of children of the cluster object).
> + *
> + * All CPUs must be added as children before the cluster is realized.
> + * (Regrettably QOM provides no way to prevent adding children to a realized
> + * object and no way for the parent to be notified when a new child is added
> + * to it, so this restriction is not checked for, but the system will not
> + * behave correctly if it is not adhered to. The cluster will assert that
> + * it contains at least one CPU, which should catch most inadvertent
> + * violations of this constraint.)
> + *
> + * A CPU which is not put into any cluster will be considered implicitly
> + * to be in a cluster with all the other "loose" CPUs, so all CPUs that are
> + * not assigned to clusters must be identical.
>    */
>   
>   #define TYPE_CPU_CLUSTER "cpu-cluster"
>   #define CPU_CLUSTER(obj) \
>       OBJECT_CHECK(CPUClusterState, (obj), TYPE_CPU_CLUSTER)
>   
> +/*
> + * This limit is imposed by TCG, which puts the cluster ID into an
> + * 8 bit field (and uses all-1s for the default "not in any cluster").
> + */
> +#define MAX_CLUSTERS 255
> +
>   /**
>    * CPUClusterState:
>    * @cluster_id: The cluster ID. This value is for internal use only and should
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 16bbed1ae09..4c2feb9c17b 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -280,6 +280,11 @@ struct qemu_work_item;
>   /**
>    * CPUState:
>    * @cpu_index: CPU index (informative).
> + * @cluster_index: Identifies which cluster this CPU is in.
> + *   For boards which don't define clusters or for "loose" CPUs not assigned
> + *   to a cluster this will be UNASSIGNED_CLUSTER_INDEX; otherwise it will
> + *   be the same as the cluster-id property of the CPU object's TYPE_CPU_CLUSTER
> + *   QOM parent.
>    * @nr_cores: Number of cores within this CPU package.
>    * @nr_threads: Number of threads within this CPU.
>    * @running: #true if CPU is currently running (lockless).
> @@ -405,6 +410,7 @@ struct CPUState {
>   
>       /* TODO Move common fields from CPUArchState here. */
>       int cpu_index;
> +    int cluster_index;
>       uint32_t halted;
>       uint32_t can_do_io;
>       int32_t exception_index;
> @@ -1111,5 +1117,6 @@ extern const struct VMStateDescription vmstate_cpu_common;
>   #endif /* NEED_CPU_H */
>   
>   #define UNASSIGNED_CPU_INDEX -1
> +#define UNASSIGNED_CLUSTER_INDEX -1
>   
>   #endif
> diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
> index 9d50a235d5c..25f90702b16 100644
> --- a/hw/cpu/cluster.c
> +++ b/hw/cpu/cluster.c
> @@ -20,19 +20,65 @@
>   
>   #include "qemu/osdep.h"
>   #include "hw/cpu/cluster.h"
> +#include "qom/cpu.h"
>   #include "qapi/error.h"
>   #include "qemu/module.h"
> +#include "qemu/cutils.h"
>   
>   static Property cpu_cluster_properties[] = {
>       DEFINE_PROP_UINT32("cluster-id", CPUClusterState, cluster_id, 0),
>       DEFINE_PROP_END_OF_LIST()
>   };
>   
> +typedef struct CallbackData {
> +    CPUClusterState *cluster;
> +    int cpu_count;
> +} CallbackData;
> +
> +static int add_cpu_to_cluster(Object *obj, void *opaque)
> +{
> +    CallbackData *cbdata = opaque;
> +    CPUState *cpu = (CPUState *)object_dynamic_cast(obj, TYPE_CPU);
> +
> +    if (cpu) {
> +        cpu->cluster_index = cbdata->cluster->cluster_id;
> +        cbdata->cpu_count++;
> +    }
> +    return 0;
> +}
> +
> +static void cpu_cluster_realize(DeviceState *dev, Error **errp)
> +{
> +    /* Iterate through all our CPU children and set their cluster_index */
> +    CPUClusterState *cluster = CPU_CLUSTER(dev);
> +    Object *cluster_obj = OBJECT(dev);
> +    CallbackData cbdata = {
> +        .cluster = cluster,
> +        .cpu_count = 0,
> +    };
> +
> +    if (cluster->cluster_id >= MAX_CLUSTERS) {
> +        error_setg(errp, "cluster-id must be less than %d", MAX_CLUSTERS);
> +        return;
> +    }
> +
> +    object_child_foreach_recursive(cluster_obj, add_cpu_to_cluster, &cbdata);
> +
> +    /*
> +     * A cluster with no CPUs is a bug in the board/SoC code that created it;
> +     * if you hit this during development of new code, check that you have
> +     * created the CPUs and parented them into the cluster object before
> +     * realizing the cluster object.
> +     */
> +    assert(cbdata.cpu_count > 0);
> +}
> +
>   static void cpu_cluster_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
>   
>       dc->props = cpu_cluster_properties;
> +    dc->realize = cpu_cluster_realize;
>   }
>   
>   static const TypeInfo cpu_cluster_type_info = {
> diff --git a/qom/cpu.c b/qom/cpu.c
> index 5442a7323be..f5579b1cd50 100644
> --- a/qom/cpu.c
> +++ b/qom/cpu.c
> @@ -364,6 +364,7 @@ static void cpu_common_initfn(Object *obj)
>       CPUClass *cc = CPU_GET_CLASS(obj);
>   
>       cpu->cpu_index = UNASSIGNED_CPU_INDEX;
> +    cpu->cluster_index = UNASSIGNED_CLUSTER_INDEX;
>       cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
>       /* *-user doesn't have configurable SMP topology */
>       /* the default value is changed by qemu_init_vcpu() for softmmu */
> 
