Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp666851wrq;
        Sat, 14 Jul 2018 10:43:15 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf/Cc4ZsRWsT12KAZS2AshhfRR02o+dRcm833MbGzp83QwNcDmpPxEigKjQ5EYeMdNyKR8R
X-Received: by 2002:a37:7e04:: with SMTP id z4-v6mr8940156qkc.66.1531590195068;
        Sat, 14 Jul 2018 10:43:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531590195; cv=none;
        d=google.com; s=arc-20160816;
        b=PTeSOBmopd+kzNlcBUg86cOOJz/lqPdJgsQ+9Gz5yRaLaXwF6OAe3fNsd8E/gRqZHV
         IoF2t6SiflEAeaQwV2j6458SerZGikvjvRjEZdic5LtJE5sN1RszE8Zs9lhkLcTiS8DE
         C/aCzn4ixg2BBweN2OBEFnLnfdk88IZBFKudpb1CZGLFYWP2OlfHvor1WhKWBrpRVIOl
         sZkH3hcHAcCCFt20LIInTdalOlZzs+tHCj6SwBddu/KyUttwnk2BKtzfjb5kfGpb6UgK
         fzrxEJQTZRC3lobGUDcMGeyI+j9LDk8RWcr0iDllrpd0Q0Cb1o04NOhoV9gfMgMmv/jQ
         3qTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=wjzQ2cxXxeKXjINxnoydvMlAVo7hO4Hf3RXB8cvKkJg=;
        b=rYyjGmnbb+0y56buzRJ7DC+N/6Sz97hKWawEkKetIAc7ZNJUjpc6uJgnXOSq+SoEYn
         2sVNVLpC5kEufpaLlQouEw9SEclggO3pFbo1z/t9ZyJ1gnbdvFaAuvlprPvywP02OKwv
         CJ+H7ctbQupN4Q2E8GR6z6VTcVqu0ugjAOB0439yoSrCcxLNrZs8k0J58lD1zFfMn7hb
         pUfSsSIPgPt/VHJNYxNYGzdXTgDmebIBm+0jAq9fbt4uAnEhtnNr/weXVQYhZJ7BYtPD
         GWnuM59B4R2i8Q+DiEqcJxrs894Lzr6kDj4ohhIWlGWR/Nfl3/gjZGzgwkRP5Pz8Evbr
         izfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oWSFW7eA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e3-v6si10530582qkm.142.2018.07.14.10.43.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:43:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oWSFW7eA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOZe-0005LQ-Jd
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:43:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1feOZU-0005Jd-96
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:43:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1feOZS-0006oK-NI
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:43:04 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:46360)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1feOZL-0006R0-O2; Sat, 14 Jul 2018 13:42:56 -0400
Received: by mail-lj1-x244.google.com with SMTP id 203-v6so15721734ljj.13;
	Sat, 14 Jul 2018 10:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=wjzQ2cxXxeKXjINxnoydvMlAVo7hO4Hf3RXB8cvKkJg=;
	b=oWSFW7eAHiDopzJML8kE1MSjWASVbwdBIiKpFhERK0QzaZ+vo5Qc1HECsJ2WDvV59y
	+hgA/QOEAUkhlcACtlUahSqFoCUSAV5+SxNrkYbXpX7mmihQdCQywgU9ggh3/lbwaODd
	eCvlsU3WiRJ+IlN/vXkGsJyaFKoK3F+tHSrsRoYEOCwIvIt84IHwoAlSCIbGrFaf8Jzl
	tXS5PYZEjn9M01dToYZtB4JYjAUs0r6pHrhXONfqC11i9tABPmdQ1KptKGG+lae6sxwg
	9DtSt3W5x91/ClY26qQknreA39as8HHltifIBEd1N+6ExV0SgTrUJhVGtT8gp4DrW91L
	1xwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wjzQ2cxXxeKXjINxnoydvMlAVo7hO4Hf3RXB8cvKkJg=;
	b=uaFjqhEOzC8ZgdiZ/ptaR/mdiByxb+tUbPYxR8i573OqlDiP4zm1bx5rKiRfBkmLEx
	SEWk7o4WTVW1oSzd0qdgZvzhqBe+z7Sah8lPfE8hx+S4gSynj/H8j8digxJsTjJndm+s
	gg1zmWxAszNzLztCaEilwo6tghiqnEH6CHcnx7ntGJLu9N+vwLXFXPkPo9Gb0C2OBCh5
	K6Zfq3F0m6r8a+jwdVIQBdT+CXDP5fBCFSGA0k1NqaS6K2QeaS1q6qe/j1vXu5datj7T
	9haKrQ5UP5PDd4KvSNay/HRzyz379+N4m5vHOWEJYDR96jrJikuzEjJwtPzDPkfByCIk
	ZyGA==
X-Gm-Message-State: AOUpUlEHRGBq+17ly00HhmzQlUk1KbXCSrRSPcMBMS2HRrPIcEv7zDa0
	SdwdZkbpdErOlR2c+O8T/gY=
X-Received: by 2002:a2e:8147:: with SMTP id t7-v6mr5806979ljg.32.1531590174042;
	Sat, 14 Jul 2018 10:42:54 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	h191-v6sm935194lfg.9.2018.07.14.10.42.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 14 Jul 2018 10:42:52 -0700 (PDT)
Date: Sat, 14 Jul 2018 19:42:51 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20180714174251.4tzpqrtdioemp3vx@toto>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
	<20180714171601.5734-20-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180714171601.5734-20-luc.michel@greensocs.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-arm] [PATCH v4 19/20] xlnx-zynqmp: Improve GIC wiring and
 MMIO mapping
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	qemu-devel@nongnu.org, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E/9tkg4Uy70o

On Sat, Jul 14, 2018 at 07:16:00PM +0200, Luc Michel wrote:
> This commit improve the way the GIC is realized and connected in the
> ZynqMP SoC. The security extensions are enabled only if requested in the
> machine state. The same goes for the virtualization extensions.
> 
> All the GIC to APU CPU(s) IRQ lines are now connected, including FIQ,
> vIRQ and vFIQ. The missing CPU to GIC timers IRQ connections are also
> added (HYP and SEC timers).
> 
> The GIC maintenance IRQs are back-wired to the correct GIC PPIs.
> 
> Finally, the MMIO mappings are reworked to take into account the ZynqMP
> specifics. The GIC (v)CPU interface is aliased 16 times:
>   * for the first 0x1000 bytes from 0xf9010000 to 0xf901f000
>   * for the second 0x1000 bytes from 0xf9020000 to 0xf902f000
> Mappings of the virtual interface and virtual CPU interface are mapped
> only when virtualization extensions are requested. The
> XlnxZynqMPGICRegion struct has been enhanced to be able to catch all
> this information.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>

Looks good to me!

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> ---
>  hw/arm/xlnx-zynqmp.c         | 92 ++++++++++++++++++++++++++++++++----
>  include/hw/arm/xlnx-zynqmp.h |  4 +-
>  2 files changed, 86 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 29df35fb75..42c29b8d06 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -29,12 +29,17 @@
>  
>  #define ARM_PHYS_TIMER_PPI  30
>  #define ARM_VIRT_TIMER_PPI  27
> +#define ARM_HYP_TIMER_PPI   26
> +#define ARM_SEC_TIMER_PPI   29
> +#define GIC_MAINTENANCE_PPI 25
>  
>  #define GEM_REVISION        0x40070106
>  
>  #define GIC_BASE_ADDR       0xf9000000
>  #define GIC_DIST_ADDR       0xf9010000
>  #define GIC_CPU_ADDR        0xf9020000
> +#define GIC_VIFACE_ADDR     0xf9040000
> +#define GIC_VCPU_ADDR       0xf9060000
>  
>  #define SATA_INTR           133
>  #define SATA_ADDR           0xFD0C0000
> @@ -111,11 +116,54 @@ static const int adma_ch_intr[XLNX_ZYNQMP_NUM_ADMA_CH] = {
>  typedef struct XlnxZynqMPGICRegion {
>      int region_index;
>      uint32_t address;
> +    uint32_t offset;
> +    bool virt;
>  } XlnxZynqMPGICRegion;
>  
>  static const XlnxZynqMPGICRegion xlnx_zynqmp_gic_regions[] = {
> -    { .region_index = 0, .address = GIC_DIST_ADDR, },
> -    { .region_index = 1, .address = GIC_CPU_ADDR,  },
> +    /* Distributor */
> +    {
> +        .region_index = 0,
> +        .address = GIC_DIST_ADDR,
> +        .offset = 0,
> +        .virt = false
> +    },
> +
> +    /* CPU interface */
> +    {
> +        .region_index = 1,
> +        .address = GIC_CPU_ADDR,
> +        .offset = 0,
> +        .virt = false
> +    },
> +    {
> +        .region_index = 1,
> +        .address = GIC_CPU_ADDR + 0x10000,
> +        .offset = 0x1000,
> +        .virt = false
> +    },
> +
> +    /* Virtual interface */
> +    {
> +        .region_index = 2,
> +        .address = GIC_VIFACE_ADDR,
> +        .offset = 0,
> +        .virt = true
> +    },
> +
> +    /* Virtual CPU interface */
> +    {
> +        .region_index = 3,
> +        .address = GIC_VCPU_ADDR,
> +        .offset = 0,
> +        .virt = true
> +    },
> +    {
> +        .region_index = 3,
> +        .address = GIC_VCPU_ADDR + 0x10000,
> +        .offset = 0x1000,
> +        .virt = true
> +    },
>  };
>  
>  static inline int arm_gic_ppi_index(int cpu_nr, int ppi_index)
> @@ -286,6 +334,9 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>      qdev_prop_set_uint32(DEVICE(&s->gic), "num-irq", GIC_NUM_SPI_INTR + 32);
>      qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);
>      qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", num_apus);
> +    qdev_prop_set_bit(DEVICE(&s->gic), "has-security-extensions", s->secure);
> +    qdev_prop_set_bit(DEVICE(&s->gic),
> +                      "has-virtualization-extensions", s->virt);
>  
>      /* Realize APUs before realizing the GIC. KVM requires this.  */
>      for (i = 0; i < num_apus; i++) {
> @@ -330,19 +381,23 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>      for (i = 0; i < XLNX_ZYNQMP_GIC_REGIONS; i++) {
>          SysBusDevice *gic = SYS_BUS_DEVICE(&s->gic);
>          const XlnxZynqMPGICRegion *r = &xlnx_zynqmp_gic_regions[i];
> -        MemoryRegion *mr = sysbus_mmio_get_region(gic, r->region_index);
> +        MemoryRegion *mr;
>          uint32_t addr = r->address;
>          int j;
>  
> -        sysbus_mmio_map(gic, r->region_index, addr);
> +        if (r->virt && !s->virt) {
> +            continue;
> +        }
>  
> +        mr = sysbus_mmio_get_region(gic, r->region_index);
>          for (j = 0; j < XLNX_ZYNQMP_GIC_ALIASES; j++) {
>              MemoryRegion *alias = &s->gic_mr[i][j];
>  
> -            addr += XLNX_ZYNQMP_GIC_REGION_SIZE;
>              memory_region_init_alias(alias, OBJECT(s), "zynqmp-gic-alias", mr,
> -                                     0, XLNX_ZYNQMP_GIC_REGION_SIZE);
> +                                     r->offset, XLNX_ZYNQMP_GIC_REGION_SIZE);
>              memory_region_add_subregion(system_memory, addr, alias);
> +
> +            addr += XLNX_ZYNQMP_GIC_REGION_SIZE;
>          }
>      }
>  
> @@ -352,12 +407,33 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i,
>                             qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
>                                              ARM_CPU_IRQ));
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + num_apus,
> +                           qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
> +                                            ARM_CPU_FIQ));
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + num_apus * 2,
> +                           qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
> +                                            ARM_CPU_VIRQ));
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + num_apus * 3,
> +                           qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
> +                                            ARM_CPU_VFIQ));
>          irq = qdev_get_gpio_in(DEVICE(&s->gic),
>                                 arm_gic_ppi_index(i, ARM_PHYS_TIMER_PPI));
> -        qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), 0, irq);
> +        qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), GTIMER_PHYS, irq);
>          irq = qdev_get_gpio_in(DEVICE(&s->gic),
>                                 arm_gic_ppi_index(i, ARM_VIRT_TIMER_PPI));
> -        qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), 1, irq);
> +        qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), GTIMER_VIRT, irq);
> +        irq = qdev_get_gpio_in(DEVICE(&s->gic),
> +                               arm_gic_ppi_index(i, ARM_HYP_TIMER_PPI));
> +        qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), GTIMER_HYP, irq);
> +        irq = qdev_get_gpio_in(DEVICE(&s->gic),
> +                               arm_gic_ppi_index(i, ARM_SEC_TIMER_PPI));
> +        qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), GTIMER_SEC, irq);
> +
> +        if (s->virt) {
> +            irq = qdev_get_gpio_in(DEVICE(&s->gic),
> +                                   arm_gic_ppi_index(i, GIC_MAINTENANCE_PPI));
> +            sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + num_apus * 4, irq);
> +        }
>      }
>  
>      if (s->has_rpu) {
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 82b6ec2486..98f925ab84 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -53,7 +53,7 @@
>  #define XLNX_ZYNQMP_OCM_RAM_0_ADDRESS 0xFFFC0000
>  #define XLNX_ZYNQMP_OCM_RAM_SIZE 0x10000
>  
> -#define XLNX_ZYNQMP_GIC_REGIONS 2
> +#define XLNX_ZYNQMP_GIC_REGIONS 6
>  
>  /* ZynqMP maps the ARM GIC regions (GICC, GICD ...) at consecutive 64k offsets
>   * and under-decodes the 64k region. This mirrors the 4k regions to every 4k
> @@ -62,7 +62,7 @@
>   */
>  
>  #define XLNX_ZYNQMP_GIC_REGION_SIZE 0x1000
> -#define XLNX_ZYNQMP_GIC_ALIASES     (0x10000 / XLNX_ZYNQMP_GIC_REGION_SIZE - 1)
> +#define XLNX_ZYNQMP_GIC_ALIASES     (0x10000 / XLNX_ZYNQMP_GIC_REGION_SIZE)
>  
>  #define XLNX_ZYNQMP_MAX_LOW_RAM_SIZE    0x80000000ull
>  
> -- 
> 2.18.0
> 
> 
