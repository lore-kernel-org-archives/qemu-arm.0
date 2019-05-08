Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4702730wrh;
        Wed, 8 May 2019 04:16:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCvqw2zTE+zDWYRYqPk7ET7O7bqUpB4aACQdnXQKoZ1R3YZc2WimACH/Xy1vNovOohTV+H
X-Received: by 2002:a5d:4a87:: with SMTP id o7mr26377077wrq.207.1557314194377;
        Wed, 08 May 2019 04:16:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557314194; cv=none;
        d=google.com; s=arc-20160816;
        b=DYn5xNVPYA0dHq9JTFBfmB2ZkmGX0b5suruQ7Vqkqtjoq+xALC2ACX8Hd858l/0gES
         l1T1KXDZrHJyeNQa+G3HIsG17BG8DnEta5FHD+sgkCdVS2woIg2W699YOeGtLVFWkV8j
         GFrk5YImEwT5goWnADK9ULZRAFwxMRujKxs8WWR0LPMKniW9Hcbh81JQV0TtZg+ryF85
         l1YtEM8HiQD7VxbCvC4fkuJRgKZsDbLtv5T9GaU0HeVess7BNMSvsW4QNaBZPUpXXnz6
         pk0pzNr0xJFYneZM3cgal2lUbnIB/Pu5K2D5cJrbrNEdb/jxe3g8uFfS19IhGc3K0TUp
         bIbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=WcBPukSRlNYA5QzAfUbJkyk/58sz49Ga62vg2xigo04=;
        b=Yrm8vEBGLKuWy73cQp04G4lruIeGfciOlq8jWuiIf1iUXdsbsplfQln/Trd38XlIWo
         o0qMrLRm22YtulNQ4nVW2xFmYhDznLt+vhza0jf+NmMxWoMhOIDgzIpeeFRudBX8mdag
         yKVt/HPxrrUYG36ogQaJfKUy7JjqbHIbacHiZYpFW+dzZV++yUdcU0wv8R7GDaftH/TL
         zIZcRJtSCCLusl7dGcly9+CWZUQzkJnQmEYloRkwY0AbTAi3us6vKJIl5iMUdnYAGGv2
         1myN7SkVDcqqlfFN5Ja1MnfW7NuLKWCn5OEEhKvEmmePXJSfaoVC0DR24nO7R+q/WK6Y
         gerA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si11494367wrj.109.2019.05.08.04.16.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 04:16:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34993 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOKYr-0005fP-8k
	for alex.bennee@linaro.org; Wed, 08 May 2019 07:16:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKYO-0005L9-4r
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:16:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKYM-0002bo-PI
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:16:04 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36140)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hOKYM-0002bH-IJ
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:16:02 -0400
Received: by mail-wm1-f68.google.com with SMTP id j187so2756409wmj.1
	for <qemu-arm@nongnu.org>; Wed, 08 May 2019 04:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WcBPukSRlNYA5QzAfUbJkyk/58sz49Ga62vg2xigo04=;
	b=hcUkNfQGmlWmUncimwMn+/oggdXKckWWaNiOrFhF/UtfueL2ji4hT40o7ZBVYkU7AP
	7r+npVroHsjsdjd8qIFymJbnw0s7pwJkObH4bHdqXu5N+l++GJjsnMxO8O2kibDHDeYl
	5As5J8qM1C6gZqfltrSl6FXlkhTzbEobPI4XExTp6/O3dlmvEBawI0igh8CjCYwioKMZ
	U4fYt0uWzVunoAnV9Crbr7f45PCgTnlFHvvTw3yRvJqO8kKl+au03uXzxd/ZHBzhWRnr
	BtnREJOtcpdCDUlXpIweAv54JCa0jE4/51zYJg3YHL8lnjnn7gYsATjW9yVXg/wHwHkU
	hN+A==
X-Gm-Message-State: APjAAAUXGgges/MolB9DocaDcD/u9dc2QG6h/AFs4PEH225cFl4rYFSb
	UhqDbvmw3EAoAqH4YELbIVy7cg==
X-Received: by 2002:a1c:a406:: with SMTP id n6mr2604650wme.126.1557314161590; 
	Wed, 08 May 2019 04:16:01 -0700 (PDT)
Received: from [10.201.49.229] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
	by smtp.gmail.com with ESMTPSA id
	f128sm3082970wme.28.2019.05.08.04.15.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 04:16:01 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
	<20190507163416.24647-10-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f429133c-a991-2172-7170-53912f624689@redhat.com>
Date: Wed, 8 May 2019 13:15:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507163416.24647-10-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 09/16] hw/mips: Use
 object_initialize() on MIPSCPSState
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paul Burton <pburton@wavecomp.com>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pMldP0sbJlEW

On 07/05/19 11:34, Philippe Mathieu-Daudé wrote:
> Initialize the MIPSCPSState with object_initialize() instead of
> object_new(). This will allow us to add it as children of the
> machine container.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/mips/boston.c     | 25 ++++++++++++-------------
>  hw/mips/mips_malta.c | 17 ++++++++---------
>  2 files changed, 20 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index a8b29f62f5b..cb3ea85fdc1 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -49,7 +49,7 @@ typedef struct {
>      SysBusDevice parent_obj;
>  
>      MachineState *mach;
> -    MIPSCPSState *cps;
> +    MIPSCPSState cps;
>      SerialState *uart;
>  
>      CharBackend lcd_display;
> @@ -188,7 +188,7 @@ static uint64_t boston_platreg_read(void *opaque, hwaddr addr,
>      case PLAT_DDR3_STATUS:
>          return PLAT_DDR3_STATUS_LOCKED | PLAT_DDR3_STATUS_CALIBRATED;
>      case PLAT_MMCM_DIV:
> -        gic_freq = mips_gictimer_get_freq(s->cps->gic.gic_timer) / 1000000;
> +        gic_freq = mips_gictimer_get_freq(s->cps.gic.gic_timer) / 1000000;
>          val = gic_freq << PLAT_MMCM_DIV_INPUT_SHIFT;
>          val |= 1 << PLAT_MMCM_DIV_MUL_SHIFT;
>          val |= 1 << PLAT_MMCM_DIV_CLK0DIV_SHIFT;
> @@ -455,20 +455,19 @@ static void boston_mach_init(MachineState *machine)
>  
>      is_64b = cpu_supports_isa(machine->cpu_type, ISA_MIPS64);
>  
> -    s->cps = MIPS_CPS(object_new(TYPE_MIPS_CPS));
> -    qdev_set_parent_bus(DEVICE(s->cps), sysbus_get_default());
> -
> -    object_property_set_str(OBJECT(s->cps), machine->cpu_type, "cpu-type",
> +    object_initialize(&s->cps, sizeof(s->cps), TYPE_MIPS_CPS);
> +    qdev_set_parent_bus(DEVICE(&s->cps), sysbus_get_default());
> +    object_property_set_str(OBJECT(&s->cps), machine->cpu_type, "cpu-type",
>                              &err);
> -    object_property_set_int(OBJECT(s->cps), smp_cpus, "num-vp", &err);
> -    object_property_set_bool(OBJECT(s->cps), true, "realized", &err);
> +    object_property_set_int(OBJECT(&s->cps), smp_cpus, "num-vp", &err);
> +    object_property_set_bool(OBJECT(&s->cps), true, "realized", &err);
>  
>      if (err != NULL) {
>          error_report("%s", error_get_pretty(err));
>          exit(1);
>      }
>  
> -    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(s->cps), 0, 0, 1);
> +    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->cps), 0, 0, 1);
>  
>      flash =  g_new(MemoryRegion, 1);
>      memory_region_init_rom(flash, NULL, "boston.flash", 128 * MiB, &err);
> @@ -487,17 +486,17 @@ static void boston_mach_init(MachineState *machine)
>      xilinx_pcie_init(sys_mem, 0,
>                       0x10000000, 32 * MiB,
>                       0x40000000, 1 * GiB,
> -                     get_cps_irq(s->cps, 2), false);
> +                     get_cps_irq(&s->cps, 2), false);
>  
>      xilinx_pcie_init(sys_mem, 1,
>                       0x12000000, 32 * MiB,
>                       0x20000000, 512 * MiB,
> -                     get_cps_irq(s->cps, 1), false);
> +                     get_cps_irq(&s->cps, 1), false);
>  
>      pcie2 = xilinx_pcie_init(sys_mem, 2,
>                               0x14000000, 32 * MiB,
>                               0x16000000, 1 * MiB,
> -                             get_cps_irq(s->cps, 0), true);
> +                             get_cps_irq(&s->cps, 0), true);
>  
>      platreg = g_new(MemoryRegion, 1);
>      memory_region_init_io(platreg, NULL, &boston_platreg_ops, s,
> @@ -505,7 +504,7 @@ static void boston_mach_init(MachineState *machine)
>      memory_region_add_subregion_overlap(sys_mem, 0x17ffd000, platreg, 0);
>  
>      s->uart = serial_mm_init(sys_mem, 0x17ffe000, 2,
> -                             get_cps_irq(s->cps, 3), 10000000,
> +                             get_cps_irq(&s->cps, 3), 10000000,
>                               serial_hd(0), DEVICE_NATIVE_ENDIAN);
>  
>      lcd = g_new(MemoryRegion, 1);
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index 439665ab45e..04f2117d71e 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -94,7 +94,7 @@ typedef struct {
>  typedef struct {
>      SysBusDevice parent_obj;
>  
> -    MIPSCPSState *cps;
> +    MIPSCPSState cps;
>      qemu_irq *i8259;
>  } MaltaState;
>  
> @@ -1151,20 +1151,19 @@ static void create_cps(MaltaState *s, const char *cpu_type,
>  {
>      Error *err = NULL;
>  
> -    s->cps = MIPS_CPS(object_new(TYPE_MIPS_CPS));
> -    qdev_set_parent_bus(DEVICE(s->cps), sysbus_get_default());
> -
> -    object_property_set_str(OBJECT(s->cps), cpu_type, "cpu-type", &err);
> -    object_property_set_int(OBJECT(s->cps), smp_cpus, "num-vp", &err);
> -    object_property_set_bool(OBJECT(s->cps), true, "realized", &err);
> +    object_initialize(&s->cps, sizeof(s->cps), TYPE_MIPS_CPS);
> +    qdev_set_parent_bus(DEVICE(&s->cps), sysbus_get_default());
> +    object_property_set_str(OBJECT(&s->cps), cpu_type, "cpu-type", &err);
> +    object_property_set_int(OBJECT(&s->cps), smp_cpus, "num-vp", &err);
> +    object_property_set_bool(OBJECT(&s->cps), true, "realized", &err);
>      if (err != NULL) {
>          error_report("%s", error_get_pretty(err));
>          exit(1);
>      }
>  
> -    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(s->cps), 0, 0, 1);
> +    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->cps), 0, 0, 1);
>  
> -    *i8259_irq = get_cps_irq(s->cps, 3);
> +    *i8259_irq = get_cps_irq(&s->cps, 3);
>      *cbus_irq = NULL;
>  }
>  
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
