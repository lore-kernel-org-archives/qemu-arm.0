Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6432347wrt;
        Mon, 21 Jan 2019 12:03:18 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7H1WIqN+8ryddR48e1JvJKyNm5yR/XhuplSyiZ9b/8KVyYj5EFDS2QAW+vEP8Ph5LOtLY1
X-Received: by 2002:a1c:8484:: with SMTP id g126mr749294wmd.117.1548100998687;
        Mon, 21 Jan 2019 12:03:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548100998; cv=none;
        d=google.com; s=arc-20160816;
        b=oG8hago+e4dTRoC6btyX8ehcaKhlYbxUydDBqWKw29Lj1hijIfHmjijGeMTxhlYagQ
         p89GMN2H1RaKYYak/6C4pqIROtRKVyFn0zlmKk/1ZlTb6VIz1FXrQtepgnDK75s4vEkQ
         mMxOmMEPtp1xdTcw5JngmhNTyaZvRtcdcGgxAD7YcybKopbVzHEiYDokbb2RnuDFs5Oe
         fkdZcJ28ju3Mq3XbUwQsVOitNgn0tRR+T71XKlN+tyLMYdU8DfME3PwlOY8HZ2sGO98l
         61Uxj+E7T0pD7GlLEfYo4Hp875PWCbYwlkslb4Mr4ibEr+VXTXTltshs7ioMFK4fZyWO
         zfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=ylsHgwSPL+xxXQ6N8MYsHyxQTrRgM7pZQDAlioDFnXY=;
        b=WaeLPdz/X4PP7hFTwRMbBG/QWtn6ayNPv1BtfSyVZAhf3+rsmwxWNCuyAxY0irZNWJ
         CkcVFZGXFGcNiebc+670IuXLWOLETtT49+KURrlLqd23llQPlf/bMg/WCD8S5UXSrBqi
         uU6sRXroUbZ+RnuOnUbhb5uCa9b+MEvwdb8hryxUjts3evpFlQDdJmipswgaPy6/LACa
         8U9Cn0R3AuIE57gQISZma7sGVe6Ja1KppgkC/O9hLxkQ9ZogeHW5t/YaFqNNeCNLiDxW
         Oh5piR4ReOtpLKOWA+R8ZwxfQd7L9WADmZnzPSnm5cJXldBgrr1LwTvV4XQxWuk+dfih
         UsGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iTYAiOku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si68940411wru.306.2019.01.21.12.03.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 12:03:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iTYAiOku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:59174 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glfmv-0003Xl-Om
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 15:03:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1glfmG-0002yF-2g
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 15:02:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1glfmE-0001Gq-Je
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 15:02:35 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:39781)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1glfmD-0001Er-TA; Mon, 21 Jan 2019 15:02:34 -0500
Received: by mail-ed1-x542.google.com with SMTP id b14so17503731edt.6;
	Mon, 21 Jan 2019 12:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ylsHgwSPL+xxXQ6N8MYsHyxQTrRgM7pZQDAlioDFnXY=;
	b=iTYAiOkubq/cZbXxi164U9qY0xIBT8fL1scCnFISWV3UPcLU/G8FMsH1MGg8OMwelM
	on7fVjC5DCBoloJox/JH2l94Sd42IxAQkVFNmE7E7c9gFaZaIIFQHDavLyG/Et6R1Lgs
	Au/oj6VrKW1Tsbrd9b414WkIufwRMqeVqKaywF/A/ZwbdBVnVp/d+3QvsNEw53/HEO/8
	6Faw4NcWoKDctKo1MRBsouZEYXtzRvF4PoaI3ySpUUOa31lzZgVkmUgNVz1K16aZ5xco
	D7LuLsPDRf1UesJbSgrV+rFHNIZtK7dP1sncaxNxcBMm3gap5jtTHbM5bJYJNqHD7sCp
	g12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ylsHgwSPL+xxXQ6N8MYsHyxQTrRgM7pZQDAlioDFnXY=;
	b=NgjyTztkrxrCosaM1kK0XkOn67aCgXZaC6pF+Mbi5DX/3PD36Le2yr5PzA6dZ0KY5h
	rQa4wGy+w22X8IwjyoY8QP7gMsOQOhJeLs6FU1qsBWSxZFavZX0KANQ12d5GjebgjTaG
	AvE1AZFlzFh0/ZatZ+C4WwxEtWVr+kHo5Ews5hPnZ8awA4gus3cG7H/1irH+LRdN6ziE
	PR0qEfQ2CwxiswMemu4y/EfcpHz45e4V9bZC5A4geBg86SJbl+gw6gXdlm1MM5S/pOjg
	KsTygs3hxNTvpkA4Ns4KLpv9TeLaNbGpNH/LQCw4YZqCpX3BZvH9k6Dmn+8LehycyzGL
	Dyqw==
X-Gm-Message-State: AJcUukdIEM07kcuoqGiguAlChrRh7kwXmTfV/poIOXItNZktbH2C/wxw
	OUtAX8Q+L/+nvA4DFqiq/ik=
X-Received: by 2002:a50:e3cb:: with SMTP id c11mr28556178edm.80.1548100951808; 
	Mon, 21 Jan 2019 12:02:31 -0800 (PST)
Received: from localhost ([149.199.80.131]) by smtp.gmail.com with ESMTPSA id
	w10sm9236452eda.77.2019.01.21.12.02.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Jan 2019 12:02:30 -0800 (PST)
Date: Mon, 21 Jan 2019 12:01:59 -0800
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190121200159.GA21062@toto>
References: <20190121152218.9592-1-peter.maydell@linaro.org>
	<20190121152218.9592-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190121152218.9592-3-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::542
Subject: Re: [Qemu-arm] [PATCH v3 2/4] qom/cpu: Add cluster_index to CPUState
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	"Emilio G . Cota" <cota@braap.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EmCPECQ+5o82

On Mon, Jan 21, 2019 at 03:22:16PM +0000, Peter Maydell wrote:
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

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> ---
> Changes v2->v3:
>  * allow CPU objects to be indirect children of the cluster;
>    this is useful for ARMv7M, where the CPU object is a child
>    of the armv7m container and the board code that sets up
>    the cluster object only has the armv7m container object:
>    this is done by using object_child_foreach_recursive()
>    rather than an open-coded child iteration
>  * add an assertion that the cluster has at least one CPU,
>    which catches the easiest-to-make errors when creating
>    and populating the cluster
> ---
>  include/hw/cpu/cluster.h | 24 +++++++++++++++++++++
>  include/qom/cpu.h        |  7 ++++++
>  hw/cpu/cluster.c         | 46 ++++++++++++++++++++++++++++++++++++++++
>  qom/cpu.c                |  1 +
>  4 files changed, 78 insertions(+)
> 
> diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
> index 73818232437..549c2d31d43 100644
> --- a/include/hw/cpu/cluster.h
> +++ b/include/hw/cpu/cluster.h
> @@ -34,12 +34,36 @@
>   * Arm big.LITTLE system) they should be in different clusters. If the CPUs do
>   * not have the same view of memory (for example the main CPU and a management
>   * controller processor) they should be in different clusters.
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
> index 16bbed1ae09..4c2feb9c17b 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -280,6 +280,11 @@ struct qemu_work_item;
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
> @@ -405,6 +410,7 @@ struct CPUState {
>  
>      /* TODO Move common fields from CPUArchState here. */
>      int cpu_index;
> +    int cluster_index;
>      uint32_t halted;
>      uint32_t can_do_io;
>      int32_t exception_index;
> @@ -1111,5 +1117,6 @@ extern const struct VMStateDescription vmstate_cpu_common;
>  #endif /* NEED_CPU_H */
>  
>  #define UNASSIGNED_CPU_INDEX -1
> +#define UNASSIGNED_CLUSTER_INDEX -1
>  
>  #endif
> diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
> index 9d50a235d5c..25f90702b16 100644
> --- a/hw/cpu/cluster.c
> +++ b/hw/cpu/cluster.c
> @@ -20,19 +20,65 @@
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
> -- 
> 2.20.1
> 
