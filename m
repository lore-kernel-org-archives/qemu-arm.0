Received: by 10.25.30.65 with SMTP id e62csp48972lfe;
        Wed, 25 May 2016 10:36:01 -0700 (PDT)
X-Received: by 10.55.99.87 with SMTP id x84mr4718790qkb.163.1464197759546;
        Wed, 25 May 2016 10:35:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o43si8992917qto.99.2016.05.25.10.35.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 10:35:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34250 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5cis-0002KN-Sr
	for alex.bennee@linaro.org; Wed, 25 May 2016 13:35:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1b5cin-0002IB-Lv
	for qemu-arm@nongnu.org; Wed, 25 May 2016 13:35:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1b5cim-00033k-Ku
	for qemu-arm@nongnu.org; Wed, 25 May 2016 13:35:53 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:36319)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1b5cij-00033J-Vv; Wed, 25 May 2016 13:35:50 -0400
Received: by mail-oi0-x243.google.com with SMTP id x130so13335663oia.3;
	Wed, 25 May 2016 10:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=GJBzWySj+OUR9iVt6nUVfpuUA1e3xxfn+8ewSXt1orw=;
	b=IjmVhNhNj7a3CJ/UcT0LhLuEAUy+jexOFbZggSzrRwHs33PdEkD6UKLu0R+J9x+CXK
	i4LqO08frdwpCunaJ9nrYetLv5uZQE8U9xe9y9sW9dV6fPKcLi+CBQzZ5IiU4Db+WVW5
	m9rSTcCBH53Sb4nA2oRYIFQc1hYJ6alVek3MTWKkeqjtWTZJc/7KUwAgq7w4UC2TQ/BI
	np2X/6Go7PvmqGFSZTHOmEuBDtr95S2DmrnLcEicv/BOsK56MVOSh05aVsiQmAEXAUnz
	3vA0r6ru1pqWsr05G4Yli0+ccVqPPy9RzNaq4ZGiDXgI0GxKW1nvnNgED1yj2xL7KUJo
	PfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=GJBzWySj+OUR9iVt6nUVfpuUA1e3xxfn+8ewSXt1orw=;
	b=RdAmwXjKi/zOuFbpxgG2p72q0jQ4L/15YfHiQyujkwksgxNbzZF1RwnrMS76JjATM9
	lZDTHG+V3DdEKCObnP/E/erxd5lycwyspLM3zfiNFNT08ZtreKUpc6UyQ8AdAtXN/LmA
	nKbuia1LMNTTGmPpvCdQnzmWCu3M9uKibTwS3VS+U3pkpiW23XNfc+FrnZ96MOR64xZj
	/9AwM2GDJQrEp0KCtl7w1qZMQNfUMGSTabZc+g3ggavooet1FsRwFoA20USnsAyUyzEe
	xHE0B54Gjw/FBhjH8Cy5lEPFIEX9Pg4rJLtRp1HWh6LRWBRz6Q8Alux7xOAaRtkyIh05
	p2UA==
X-Gm-Message-State: ALyK8tIstwJJ5Se4t4/pPWeNp+ho7Mi7Gm31Ju0Mp3Dsn9p2KQj11gOvmsh8eA+hudjWGOAAU7eTH+oJ9QHuSg==
X-Received: by 10.157.1.11 with SMTP id 11mr3281575otu.17.1464197749445; Wed,
	25 May 2016 10:35:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.98.137 with HTTP; Wed, 25 May 2016 10:35:20 -0700 (PDT)
In-Reply-To: <1464173555-12800-4-git-send-email-edgar.iglesias@gmail.com>
References: <1464173555-12800-1-git-send-email-edgar.iglesias@gmail.com>
	<1464173555-12800-4-git-send-email-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 25 May 2016 10:35:20 -0700
X-Google-Sender-Auth: RqC6rYwfXEJDTQ6YLOKN7RdataU
Message-ID: <CAKmqyKPgQ9qsWMegsS4fK+nNP5f+JXoj60ajQeR1tF9nWEC7Aw@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/4] xlnx-zynqmp: Delay
 realization of GIC until post CPU realization
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
X-TUID: 0NjdEQ/jEXE2

On Wed, May 25, 2016 at 3:52 AM, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Delay the realization of the GIC until after CPUs are
> realized. This is needed for KVM as the in-kernel GIC
> model will fail if it is realized with no available CPUs.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  hw/arm/xlnx-zynqmp.c | 56 +++++++++++++++++++++++++++++-----------------------
>  1 file changed, 31 insertions(+), 25 deletions(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 3a8af6a..db5b82b 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -224,33 +224,9 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>      qdev_prop_set_uint32(DEVICE(&s->gic), "num-irq", GIC_NUM_SPI_INTR + 32);
>      qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);
>      qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", XLNX_ZYNQMP_NUM_APU_CPUS);
> -    object_property_set_bool(OBJECT(&s->gic), true, "realized", &err);
> -    if (err) {
> -        error_propagate(errp, err);
> -        return;
> -    }
> -    assert(ARRAY_SIZE(xlnx_zynqmp_gic_regions) == XLNX_ZYNQMP_GIC_REGIONS);
> -    for (i = 0; i < XLNX_ZYNQMP_GIC_REGIONS; i++) {
> -        SysBusDevice *gic = SYS_BUS_DEVICE(&s->gic);
> -        const XlnxZynqMPGICRegion *r = &xlnx_zynqmp_gic_regions[i];
> -        MemoryRegion *mr = sysbus_mmio_get_region(gic, r->region_index);
> -        uint32_t addr = r->address;
> -        int j;
> -
> -        sysbus_mmio_map(gic, r->region_index, addr);
> -
> -        for (j = 0; j < XLNX_ZYNQMP_GIC_ALIASES; j++) {
> -            MemoryRegion *alias = &s->gic_mr[i][j];
> -
> -            addr += XLNX_ZYNQMP_GIC_REGION_SIZE;
> -            memory_region_init_alias(alias, OBJECT(s), "zynqmp-gic-alias", mr,
> -                                     0, XLNX_ZYNQMP_GIC_REGION_SIZE);
> -            memory_region_add_subregion(system_memory, addr, alias);
> -        }
> -    }
>
> +    /* Realize APUs before realizing the GIC. KVM requires this.  */
>      for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
> -        qemu_irq irq;
>          char *name;
>
>          object_property_set_int(OBJECT(&s->apu_cpu[i]), QEMU_PSCI_CONDUIT_SMC,
> @@ -276,6 +252,36 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>              error_propagate(errp, err);
>              return;
>          }
> +    }
> +
> +    object_property_set_bool(OBJECT(&s->gic), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    assert(ARRAY_SIZE(xlnx_zynqmp_gic_regions) == XLNX_ZYNQMP_GIC_REGIONS);
> +    for (i = 0; i < XLNX_ZYNQMP_GIC_REGIONS; i++) {
> +        SysBusDevice *gic = SYS_BUS_DEVICE(&s->gic);
> +        const XlnxZynqMPGICRegion *r = &xlnx_zynqmp_gic_regions[i];
> +        MemoryRegion *mr = sysbus_mmio_get_region(gic, r->region_index);
> +        uint32_t addr = r->address;
> +        int j;
> +
> +        sysbus_mmio_map(gic, r->region_index, addr);
> +
> +        for (j = 0; j < XLNX_ZYNQMP_GIC_ALIASES; j++) {
> +            MemoryRegion *alias = &s->gic_mr[i][j];
> +
> +            addr += XLNX_ZYNQMP_GIC_REGION_SIZE;
> +            memory_region_init_alias(alias, OBJECT(s), "zynqmp-gic-alias", mr,
> +                                     0, XLNX_ZYNQMP_GIC_REGION_SIZE);
> +            memory_region_add_subregion(system_memory, addr, alias);
> +        }
> +    }
> +
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
> +        qemu_irq irq;
>
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i,
>                             qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
> --
> 2.5.0
>
>
