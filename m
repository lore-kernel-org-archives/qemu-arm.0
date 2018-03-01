Received: by 10.28.91.67 with SMTP id p64csp2097608wmb;
        Thu, 1 Mar 2018 09:35:50 -0800 (PST)
X-Google-Smtp-Source: AG47ELub1NYDJKjoaW6nCpQKQKl+J7wqmUHvu9WjD7DhOfGjaAsKUdsOOXfuOtc1RLCgtc+C3ayv
X-Received: by 10.129.169.9 with SMTP id g9mr1786402ywh.379.1519925750242;
        Thu, 01 Mar 2018 09:35:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519925750; cv=none;
        d=google.com; s=arc-20160816;
        b=BLrTcbLu5S71iUVSzZNGOdjX1LIgnNbQnbMs3CSQReiOWjJHZTqD11rG23Z0o0BF3k
         QaBodAAyh/NTTZgFHIuwuoyTaOzt6DgO2LdajARkR1y5NI4AsftEk6A6TrpMzFInlKLg
         dXdDHXQdVUZ2eu0sMdcu1AB2kuQShXRty+JIqs0mKI0Rh7nmZLBz1SPnAs/mN9RVY4f1
         EHoEZ6xal6XLY6NTge4X284CcgRrxNPif+HUIgnQvZNI7YIvCqyL6yO8LpJC07LcCcxg
         6MPlA9h8aEHvGEEOh8dHojTAJtVhJiQV51OgNnO0k03dUT7WBfnYfeiDuvrWwH1lu90Z
         eqOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=gVHRzux2/AENUpeEJ0I872sI4D5DPNGNNvtLCSWGXZE=;
        b=kkT2ERcWaAHBGf+OZD2HCcnAPSOI2HZ80uAbJVmeTsJKfq3plvbY5bDrK5K2WjUU/z
         YTC62DQ8rnI+ZpdQlCfmaQdjiKikYCs8QI0q047wKomClj2nW+RtyX8ZUwH6T3X1DZHO
         0bdg1eGrbLxXsr9BPWkzoZkefSc8bMDCZ3kzIXQlKOnXwWcidkH1P4AuxZG02CT9r2S/
         7L23u25vY0DvwZf8L/MVXi13xmIUp1+n333Q5dt37OEuR4p4beGrxOx9MwovPVbMhEl7
         YDRDiJCJktlNJbB6bsD6hYEaEICMi2OI8Hj81XoiShdV2vIMok9UxeAew5ZYqqTq0u/g
         2tqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Z54RcU+J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g191-v6si726739yba.40.2018.03.01.09.35.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 09:35:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Z54RcU+J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erS7R-0006vM-Mn
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 12:35:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1erS7L-0006v7-O3
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 12:35:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1erS7H-0002HL-IZ
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 12:35:43 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:44686)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1erS7H-0002Gz-1I; Thu, 01 Mar 2018 12:35:39 -0500
Received: by mail-wr0-x242.google.com with SMTP id v65so7410168wrc.11;
	Thu, 01 Mar 2018 09:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gVHRzux2/AENUpeEJ0I872sI4D5DPNGNNvtLCSWGXZE=;
	b=Z54RcU+JmPA95Q9rgf1kJ2f06mfnlgSflj4JICxGdn/L77r+VRwo+59JvLEIDHp/jb
	5M+f21Mt4MawLG4ia39KcOE5msyL2MDrS7S657yJ1NgFYLRh52vFSn7MYDFkmqxQqhFl
	90/x/K0CUo4NLjCxyqgwWNtvTwOEYEoZe543WYtjM5pm4YUvjPBYlNXA7MV2A7hyMxCM
	ckgTcY6DPoNtrvZHdqWtTpPro6Mgw8vc1xpHnvMwV9yOuttigSUgfE0gdQtQUHxmoymu
	RMnzE8fFrlNDMDuReA3MIqBOY8o1ax6y5Qub/r3TgPZsOmEJ2XmmKduxj7dSLVZ8mPtt
	1bfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=gVHRzux2/AENUpeEJ0I872sI4D5DPNGNNvtLCSWGXZE=;
	b=fyjmigIm851OozpjLD8KA2N65uHu6uUzUCfiP5RJ3ju/7MHGMtSwTSGU+hr3YPu+CL
	50TMV5zoQYlj0iIJ+3/8m9cpxmk7+9GkU+dsLNqat1mE1fju+VFUmTCz7ioEDOlN6AiV
	f3puSvSjdsxrhm/XOdB3tLSUSyjkiYnU+W+ZdA1Wa6bB5In8McMz9VdD098pqbQfPeOZ
	NQ7oeMhPE8Ctke1PSj01NAgsH5OYckpn/rut6nCruEUmGIt/c9MYo/ti1dwDHHdahqJo
	OnRzounnc9bPs/HkWq6mlorL6UtHSL4tlZ9qvur0/NBDTQG4JAnfDskHNPPeG58j2TtC
	26vQ==
X-Gm-Message-State: APf1xPASOZPBQaZtLKp4Dmh2LewaZwd+oPS2pHkapHWMATYdKR4llfEm
	OfWhYFIi5F+AdmxY8y7J6/oAEKrG
X-Received: by 10.223.176.33 with SMTP id f30mr2630418wra.75.1519925737633;
	Thu, 01 Mar 2018 09:35:37 -0800 (PST)
Received: from [192.168.1.19] (LFbn-MON-1-648-178.w2-4.abo.wanadoo.fr.
	[2.4.22.178]) by smtp.gmail.com with ESMTPSA id
	l73sm8322506wma.15.2018.03.01.09.35.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 09:35:36 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
References: <cover.1516650109.git.alistair.francis@xilinx.com>
	<3a974495bbab40c66cf3f1edc9fbfcee31f3a178.1516650109.git.alistair.francis@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <44924025-264f-c7a4-c1ce-7c6f0cdd9bb0@amsat.org>
Date: Thu, 1 Mar 2018 14:35:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <3a974495bbab40c66cf3f1edc9fbfcee31f3a178.1516650109.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 3/9] xlnx-zynqmp-pmu: Add the
 CPU and memory
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tgh4uPg0qLZc

Hi Alistair, Edgar,

On 01/22/2018 04:43 PM, Alistair Francis wrote:
> Connect the MicroBlaze CPU and the ROM and RAM memory regions.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
> 
> V6:
>  - Pass initrd instead of kernel to microblaze_load_kernel()
> V4:
>  - Remove the ZCU102 name
> V2:
>  - Fix the pmu-cpu name
>  - Use err and errp for CPU realise instead of error_fatal
> 
>  hw/microblaze/xlnx-zynqmp-pmu.c | 70 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 68 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
> index ac0f78928a..145837b372 100644
> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
> @@ -18,8 +18,11 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
> +#include "exec/address-spaces.h"
>  #include "hw/boards.h"
> +#include "hw/qdev-properties.h"
>  #include "cpu.h"
> +#include "boot.h"
>  
>  /* Define the PMU device */
>  
> @@ -27,21 +30,56 @@
>  #define XLNX_ZYNQMP_PMU_SOC(obj) OBJECT_CHECK(XlnxZynqMPPMUSoCState, (obj), \
>                                                TYPE_XLNX_ZYNQMP_PMU_SOC)
>  
> +#define XLNX_ZYNQMP_PMU_ROM_SIZE    0x8000
> +#define XLNX_ZYNQMP_PMU_ROM_ADDR    0xFFD00000
> +#define XLNX_ZYNQMP_PMU_RAM_ADDR    0xFFDC0000
> +
>  typedef struct XlnxZynqMPPMUSoCState {
>      /*< private >*/
>      DeviceState parent_obj;
>  
>      /*< public >*/
> +    MicroBlazeCPU cpu;
>  }  XlnxZynqMPPMUSoCState;
>  
>  static void xlnx_zynqmp_pmu_soc_init(Object *obj)
>  {
> +    XlnxZynqMPPMUSoCState *s = XLNX_ZYNQMP_PMU_SOC(obj);
>  
> +    object_initialize(&s->cpu, sizeof(s->cpu),
> +                      TYPE_MICROBLAZE_CPU);
> +    object_property_add_child(obj, "pmu-cpu", OBJECT(&s->cpu),
> +                              &error_abort);
>  }
>  
>  static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
>  {
> -
> +    XlnxZynqMPPMUSoCState *s = XLNX_ZYNQMP_PMU_SOC(dev);
> +    Error *err = NULL;
> +
> +    object_property_set_uint(OBJECT(&s->cpu), XLNX_ZYNQMP_PMU_ROM_ADDR,
> +                             "base-vectors", &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "use-stack-protection",
> +                             &error_abort);
> +    object_property_set_uint(OBJECT(&s->cpu), 0, "use-fpu", &error_abort);
> +    object_property_set_uint(OBJECT(&s->cpu), 0, "use-hw-mul", &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "use-barrel",
> +                             &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "use-msr-instr",
> +                             &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "use-pcmp-instr",
> +                             &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), false, "use-mmu", &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "endianness",
> +                             &error_abort);
> +    object_property_set_str(OBJECT(&s->cpu), "8.40.b", "version",
> +                            &error_abort);
> +    object_property_set_uint(OBJECT(&s->cpu), 0, "pvr", &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>  }
>  
>  static void xlnx_zynqmp_pmu_soc_class_init(ObjectClass *oc, void *data)
> @@ -70,7 +108,35 @@ type_init(xlnx_zynqmp_pmu_soc_register_types)
>  
>  static void xlnx_zynqmp_pmu_init(MachineState *machine)
>  {
> -
> +    XlnxZynqMPPMUSoCState *pmu = g_new0(XlnxZynqMPPMUSoCState, 1);
> +    MemoryRegion *address_space_mem = get_system_memory();
> +    MemoryRegion *pmu_rom = g_new(MemoryRegion, 1);
> +    MemoryRegion *pmu_ram = g_new(MemoryRegion, 1);
> +
> +    /* Create the ROM */
> +    memory_region_init_rom(pmu_rom, NULL, "xlnx-zynqmp-pmu.rom",
> +                           XLNX_ZYNQMP_PMU_ROM_SIZE, &error_fatal);
> +    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_ROM_ADDR,
> +                                pmu_rom);
> +
> +    /* Create the RAM */

A bit late, but we maybe want a check such:

       if (machine->ram_size > 128 * K_BYTE) {
           warn_report("shrinking RAM to 128kB");
           machine->ram_size = 128 * K_BYTE;
       }

> +    memory_region_init_ram(pmu_ram, NULL, "xlnx-zynqmp-pmu.ram",
> +                           machine->ram_size, &error_fatal);
> +    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_RAM_ADDR,
> +                                pmu_ram);
> +
> +    /* Create the PMU device */
> +    object_initialize(pmu, sizeof(XlnxZynqMPPMUSoCState), TYPE_XLNX_ZYNQMP_PMU_SOC);
> +    object_property_add_child(OBJECT(machine), "pmu", OBJECT(pmu),
> +                              &error_abort);
> +    object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal);
> +
> +    /* Load the kernel */
> +    microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
> +                           machine->ram_size,
> +                           machine->initrd_filename,
> +                           machine->dtb,
> +                           NULL);
>  }
>  
>  static void xlnx_zynqmp_pmu_machine_init(MachineClass *mc)
> 

and here:

       mc->default_ram_size = 128 * K_BYTE,

Regards,

Phil.
