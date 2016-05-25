Received: by 10.25.30.65 with SMTP id e62csp47889lfe;
        Wed, 25 May 2016 10:33:48 -0700 (PDT)
X-Received: by 10.140.19.5 with SMTP id 5mr4582696qgg.98.1464197628216;
        Wed, 25 May 2016 10:33:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b72si1385144qga.85.2016.05.25.10.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 10:33:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34235 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5cgl-0000xt-FO
	for alex.bennee@linaro.org; Wed, 25 May 2016 13:33:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1b5cge-0000uY-Re
	for qemu-arm@nongnu.org; Wed, 25 May 2016 13:33:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1b5cgd-0002dE-L1
	for qemu-arm@nongnu.org; Wed, 25 May 2016 13:33:40 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:33612)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1b5cga-0002cB-Nm; Wed, 25 May 2016 13:33:36 -0400
Received: by mail-oi0-x244.google.com with SMTP id m198so13359235oig.0;
	Wed, 25 May 2016 10:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=TJVpb101c1fuJMaO9x3q1jXLHYVM+2sNRDBuske8+K8=;
	b=zFuITbA0Iu0Uphfv6ghi2JPyAlNBBBF99NXnvilXXiFsq7sKhf+VaJrlqCwOE6sGKM
	Vbpv9QnBQlJyoGVRZs/outiLyPL5MSYrxnIRXfetCO4KVU4M67V79T0dvI51BuTgwiBT
	ukikdDZZfnuJi3ZLAXLh/7JfACiFXeXWB9J8ytJp5T77IQ/p8T6IK0wnwVBFh1UjVAiO
	HR8ElXl3NdpUHF6Y1gCIIpKTOPNgNHbWA7yjHPT6H8jcOB0W8xZkvmRWURhb+XjztzUK
	KqrcOwt5f9+iTeW3suEosX9d3SURDDSiYRWJfXVKNfOrTdDZDPNJRobgy7cEaFcvchS5
	hARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=TJVpb101c1fuJMaO9x3q1jXLHYVM+2sNRDBuske8+K8=;
	b=mZGdGpuy3QCCHV0AkZMaUOC75k/PNBrKp332ZTt5mgaYujHkpr0mccLDau2IVVp4mI
	ot6EOm0bDm4UGg1FX80DkW14VRkgwgXZcI7OIEGnbosmNXFahcO3IOKc7nDFfsgWDubN
	MDAHdQsOtMK2fOQJhhtl4flG771acAPtAtjxjENJq3nwrJZi4L6K84tktfjwHrrT9SC9
	VUSkygkaUmU2vyqm9hQoW6hXBGRqGbPqHE4+zn3Tnsn06CULHON09bbFInRG2fakquJl
	MIqESfOvDv3mdUD9rpZbQgZBk0t+5ORfInI+egm6vD3kqPuEEMuLzwS0YJJJ4lkXZ5jD
	2vnw==
X-Gm-Message-State: ALyK8tJtgeWa6XSx3o+bOHz/iBUqtffm/pZf21kLIAG1UQk7izMGwdPO6UNZwdV5h+8S3sfjlofNgNZB8DrHyA==
X-Received: by 10.157.8.240 with SMTP id 103mr2814614otf.109.1464197616034;
	Wed, 25 May 2016 10:33:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.98.137 with HTTP; Wed, 25 May 2016 10:33:06 -0700 (PDT)
In-Reply-To: <1464173555-12800-3-git-send-email-edgar.iglesias@gmail.com>
References: <1464173555-12800-1-git-send-email-edgar.iglesias@gmail.com>
	<1464173555-12800-3-git-send-email-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 25 May 2016 10:33:06 -0700
X-Google-Sender-Auth: jZYvRCgBC4KaXPhFBSxSIp0OOXk
Message-ID: <CAKmqyKMGFDGy9fK7FSwK4Lz3E-VowPMrY6yKL_8Kinoo3Wfzgg@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/4] xlnx-zynqmp: Make the
 RPU subsystem optional
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lzkcczLfH2Gr

On Wed, May 25, 2016 at 3:52 AM, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> The way we currently model the RPU subsystem is of quite
> limited use. In addition to that, it causes problems for
> KVM and for GDB debugging.
>
> Make the RPU optional by adding a has_rpu property and
> default to having it disabled.
>
> This changes the default setup from having the RPU to not
> longer having it.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  hw/arm/xlnx-zynqmp.c         | 62 +++++++++++++++++++++++++++-----------------
>  include/hw/arm/xlnx-zynqmp.h |  2 ++
>  2 files changed, 40 insertions(+), 24 deletions(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 965a250..3a8af6a 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -83,6 +83,41 @@ static inline int arm_gic_ppi_index(int cpu_nr, int ppi_index)
>      return GIC_NUM_SPI_INTR + cpu_nr * GIC_INTERNAL + ppi_index;
>  }
>
> +static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
> +                                   Error **errp)
> +{
> +    Error *err = NULL;
> +    int i;
> +
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_RPU_CPUS; i++) {
> +        char *name;
> +
> +        object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
> +                          "cortex-r5-" TYPE_ARM_CPU);
> +        object_property_add_child(OBJECT(s), "rpu-cpu[*]",
> +                                  OBJECT(&s->rpu_cpu[i]), &error_abort);
> +
> +        name = object_get_canonical_path_component(OBJECT(&s->rpu_cpu[i]));
> +        if (strcmp(name, boot_cpu)) {
> +            /* Secondary CPUs start in PSCI powered-down state */
> +            object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true,
> +                                     "start-powered-off", &error_abort);
> +        } else {
> +            s->boot_cpu_ptr = &s->rpu_cpu[i];
> +        }
> +        g_free(name);
> +
> +        object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true, "reset-hivecs",
> +                                 &error_abort);
> +        object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true, "realized",
> +                                 &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +    }
> +}
> +
>  static void xlnx_zynqmp_init(Object *obj)
>  {
>      XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
> @@ -95,13 +130,6 @@ static void xlnx_zynqmp_init(Object *obj)
>                                    &error_abort);
>      }
>
> -    for (i = 0; i < XLNX_ZYNQMP_NUM_RPU_CPUS; i++) {
> -        object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
> -                          "cortex-r5-" TYPE_ARM_CPU);
> -        object_property_add_child(obj, "rpu-cpu[*]", OBJECT(&s->rpu_cpu[i]),
> -                                  &error_abort);
> -    }
> -
>      object_property_add_link(obj, "ddr-ram", TYPE_MEMORY_REGION,
>                               (Object **)&s->ddr_ram,
>                               qdev_prop_allow_set_link_before_realize,
> @@ -260,23 +288,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), 1, irq);
>      }
>
> -    for (i = 0; i < XLNX_ZYNQMP_NUM_RPU_CPUS; i++) {
> -        char *name;
> -
> -        name = object_get_canonical_path_component(OBJECT(&s->rpu_cpu[i]));
> -        if (strcmp(name, boot_cpu)) {
> -            /* Secondary CPUs start in PSCI powered-down state */
> -            object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true,
> -                                     "start-powered-off", &error_abort);
> -        } else {
> -            s->boot_cpu_ptr = &s->rpu_cpu[i];
> -        }
> -        g_free(name);
> -
> -        object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true, "reset-hivecs",
> -                                 &error_abort);
> -        object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true, "realized",
> -                                 &err);
> +    if (s->has_rpu) {
> +        xlnx_zynqmp_create_rpu(s, boot_cpu, &err);
>          if (err) {
>              error_propagate(errp, err);
>              return;
> @@ -373,6 +386,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>  static Property xlnx_zynqmp_props[] = {
>      DEFINE_PROP_STRING("boot-cpu", XlnxZynqMPState, boot_cpu),
>      DEFINE_PROP_BOOL("secure", XlnxZynqMPState, secure, false),
> +    DEFINE_PROP_BOOL("has_rpu", XlnxZynqMPState, has_rpu, false),
>      DEFINE_PROP_END_OF_LIST()
>  };
>
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 38d4c8c..68f6eb0 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -87,6 +87,8 @@ typedef struct XlnxZynqMPState {
>
>      /* Has the ARM Security extensions?  */
>      bool secure;
> +    /* Has the RPU subsystem?  */
> +    bool has_rpu;
>  }  XlnxZynqMPState;
>
>  #define XLNX_ZYNQMP_H
> --
> 2.5.0
>
>
