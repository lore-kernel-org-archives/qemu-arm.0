Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4727975wrt;
        Sun, 25 Nov 2018 13:18:14 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XquXSgu7vYifHk8hSQehBROd+Rx9FqnXtA8GK+DJRegJ5Ti1fS6125Q4XKsugNo0O2wyVI
X-Received: by 2002:a25:8681:: with SMTP id z1-v6mr20442503ybk.214.1543180694593;
        Sun, 25 Nov 2018 13:18:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543180694; cv=none;
        d=google.com; s=arc-20160816;
        b=VBj4e/fK4c4rxz6i1iE2N4zf3EYfAPniZ0UYQ8IVNVL0Wt6yDVrNuL5v+AnT1CNhS0
         4ymJDYb7+KCZ2RVnOrbS8fsmOpLTDxpc0ltm7RUJEFOtKOZlU2qZr+fsxGOBcaa9eIA+
         m4IP/40zfXnTRs0NRjSMDlYTSTG/N0DiE50/lRMXBNZIEzLSOKdkN54lq0EDCwP9mOH8
         SkUJtMZmtZZMylYLcUfUid4o11KL7eCs8skR1AKg9ZgCVa74QMXsdfLf6ROzsTaboZ/9
         j8s+gZUabYeSSF2xiNpBQ5R++BMsBcvk11WctN70IiaGYBicy62yrTR3lbzmF3tKuxar
         xswQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=81UhkEUsHxXA8Gp6R36zGcO4/lOqA9ZthfMI4yfTNO0=;
        b=InstjKhhLzgyxic3ZTS0H2rfEhPXqLL5/Mic7HqfKBSIj31OGPoslR20H5rzFADTM0
         7q1C8VraNtMegzF0j1yEypnExsy1ceCWawgdVCVUcIPIDEve7euevILTjiSQDASBe3gU
         svhJCF7Ek0CEbwmTyeAphb3nEnm2IeYfGopG0+h5Y7WbsYvto4/WY2teK2u+ROeemASy
         /WaCtdyOzi3QI6BA+VySnguCtUWjjDMCHbtgc1Xa+mJ+c/OPacrHSIDziO1U0g+dCmV6
         6TRs8JuuVyGc1wokwndeBHihN5Wd/npjKc1PYR3A/ex36hILS1hYxlbFphqbPA+8nmlM
         obTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n5-v6si5839404ywf.226.2018.11.25.13.18.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 25 Nov 2018 13:18:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gR1nB-00081K-Vz
	for alex.bennee@linaro.org; Sun, 25 Nov 2018 16:18:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1fq-0001iR-NP
	for qemu-devel@nongnu.org; Sun, 25 Nov 2018 16:10:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1fm-0008GX-Lc
	for qemu-devel@nongnu.org; Sun, 25 Nov 2018 16:10:38 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:32974)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gR1fm-0008GD-Fe
	for qemu-devel@nongnu.org; Sun, 25 Nov 2018 16:10:34 -0500
Received: by mail-wr1-f67.google.com with SMTP id c14so11241086wrr.0
	for <qemu-devel@nongnu.org>; Sun, 25 Nov 2018 13:10:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=81UhkEUsHxXA8Gp6R36zGcO4/lOqA9ZthfMI4yfTNO0=;
	b=edIHV+BrvogqPuqjYLtn6stbJo9tb/YQ1ZEFD2bDvG7+IQtVDjO9cUdE6YeLJ2rB0H
	LjwT5TUQ2UDGAkPtHPaAUCRgPsJwU8DCZyy7HlKXFNkaBhIh+3zC8qU8C8G0u5ZFc0iS
	gP6qlz1uO3WZbrQReYK65txb6vEnaezVSavdFvcRv/XD20XJRWZXmWL4JIVbQ95jjkz4
	j/R5eTihQIQErLaVHYvDAoeTbFNClddImgMoApQjquHjk93CSRNfKr9s/CsbKM+ATDgL
	jGYgnIyIybr5FaJyxaJu7+KwffOpmpJeI9v1T0b727Ar4uGQjGS4RylHgqnL+k2TdF9x
	iklg==
X-Gm-Message-State: AA+aEWaDlyPPwR9OTPmg3fA0ghO8z8889/MZWTUr1nShcnuejBHpyaPy
	PalTMJBGtpy57xojXwzNZb+bfA==
X-Received: by 2002:adf:f401:: with SMTP id g1mr21990878wro.103.1543180233477; 
	Sun, 25 Nov 2018 13:10:33 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	194sm15863490wmn.18.2018.11.25.13.10.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Nov 2018 13:10:32 -0800 (PST)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-17-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <6c666049-bb54-bf0a-1709-40f4c7903a26@redhat.com>
Date: Sun, 25 Nov 2018 22:10:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181123091729.29921-17-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [PATCH v7 16/16] arm/xlnx-zynqmp: put APUs and
 RPUs in separate CPU clusters
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
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Iw269CXsOOSv

On 23/11/18 10:17, Luc Michel wrote:
> Create two separate CPU clusters for APUs and RPUs.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  include/hw/arm/xlnx-zynqmp.h |  3 +++
>  hw/arm/xlnx-zynqmp.c         | 21 +++++++++++++++++----
>  2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 98f925ab84..591515c760 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -29,10 +29,11 @@
>  #include "hw/dma/xlnx_dpdma.h"
>  #include "hw/dma/xlnx-zdma.h"
>  #include "hw/display/xlnx_dp.h"
>  #include "hw/intc/xlnx-zynqmp-ipi.h"
>  #include "hw/timer/xlnx-zynqmp-rtc.h"
> +#include "hw/cpu/cluster.h"
>  
>  #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
>  #define XLNX_ZYNQMP(obj) OBJECT_CHECK(XlnxZynqMPState, (obj), \
>                                         TYPE_XLNX_ZYNQMP)
>  
> @@ -75,10 +76,12 @@
>  typedef struct XlnxZynqMPState {
>      /*< private >*/
>      DeviceState parent_obj;
>  
>      /*< public >*/
> +    CPUClusterState apu_cluster;
> +    CPUClusterState rpu_cluster;
>      ARMCPU apu_cpu[XLNX_ZYNQMP_NUM_APU_CPUS];
>      ARMCPU rpu_cpu[XLNX_ZYNQMP_NUM_RPU_CPUS];
>      GICState gic;
>      MemoryRegion gic_mr[XLNX_ZYNQMP_GIC_REGIONS][XLNX_ZYNQMP_GIC_ALIASES];
>  
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index c195040350..42a138074c 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -176,16 +176,22 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
>  {
>      Error *err = NULL;
>      int i;
>      int num_rpus = MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYNQMP_NUM_RPU_CPUS);
>  
> +    object_initialize_child(OBJECT(s), "rpu-cluster", &s->rpu_cluster,
> +                            sizeof(s->rpu_cluster), TYPE_CPU_CLUSTER,
> +                            &error_abort, NULL);
> +
> +    qdev_init_nofail(DEVICE(&s->rpu_cluster));
> +
>      for (i = 0; i < num_rpus; i++) {
>          char *name;
>  
>          object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
>                            "cortex-r5f-" TYPE_ARM_CPU);
> -        object_property_add_child(OBJECT(s), "rpu-cpu[*]",
> +        object_property_add_child(OBJECT(&s->rpu_cluster), "rpu-cpu[*]",
>                                    OBJECT(&s->rpu_cpu[i]), &error_abort);
>  
>          name = object_get_canonical_path_component(OBJECT(&s->rpu_cpu[i]));
>          if (strcmp(name, boot_cpu)) {
>              /* Secondary CPUs start in PSCI powered-down state */
> @@ -211,14 +217,19 @@ static void xlnx_zynqmp_init(Object *obj)
>  {
>      XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
>      int i;
>      int num_apus = MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
>  
> +    object_initialize_child(obj, "apu-cluster", &s->apu_cluster,
> +                            sizeof(s->apu_cluster), TYPE_CPU_CLUSTER,
> +                            &error_abort, NULL);

This is now very clean :) Thanks for the various efforts/versions
improving this series.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +
>      for (i = 0; i < num_apus; i++) {
> -        object_initialize_child(obj, "apu-cpu[*]", &s->apu_cpu[i],
> -                                sizeof(s->apu_cpu[i]),
> -                                "cortex-a53-" TYPE_ARM_CPU, &error_abort, NULL);
> +        object_initialize_child(OBJECT(&s->apu_cluster), "apu-cpu[*]",
> +                                &s->apu_cpu[i], sizeof(s->apu_cpu[i]),
> +                                "cortex-a53-" TYPE_ARM_CPU, &error_abort,
> +                                NULL);
>      }
>  
>      sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic),
>                            gic_class_name());
>  
> @@ -331,10 +342,12 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>      qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", num_apus);
>      qdev_prop_set_bit(DEVICE(&s->gic), "has-security-extensions", s->secure);
>      qdev_prop_set_bit(DEVICE(&s->gic),
>                        "has-virtualization-extensions", s->virt);
>  
> +    qdev_init_nofail(DEVICE(&s->apu_cluster));
> +
>      /* Realize APUs before realizing the GIC. KVM requires this.  */
>      for (i = 0; i < num_apus; i++) {
>          char *name;
>  
>          object_property_set_int(OBJECT(&s->apu_cpu[i]), QEMU_PSCI_CONDUIT_SMC,
> 
