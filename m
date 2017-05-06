Received: by 10.25.0.198 with SMTP id 189csp675379lfa;
        Sat, 6 May 2017 09:06:39 -0700 (PDT)
X-Received: by 10.237.55.98 with SMTP id i89mr2275482qtb.162.1494086799633;
        Sat, 06 May 2017 09:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494086799; cv=none;
        d=google.com; s=arc-20160816;
        b=ruDJ26V9nVCREtF/TcyRGF3ZaLgpOfQfW6QRVLeFv2TTuYZPU1yVX0Gvxvyft8beLn
         eQnCkZckc+vF448SznjdnVk9K0lUN/3IpvGdKOvR8zNQuNt1upwFCkyosNKSweCzDCAD
         QZL8TfvNZMLLnoXWACVijZtAXTmbhp6bqM3qrNW9R+uyiw/eUwyv30wqkfJjHEwcmLZe
         +VgJfZhjEFJVg0a4YEgcDU4u4kt07Oz6oM8sk3recVCeXb5CFUBNcEdGTPrrjupCbKGm
         bzzy3jlq4J3UqXIcmDigODsihN7PkJW6ffi3rcatn6DvpA7kHDDShw3iwdNpejtYtuJg
         ZXtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=YRZBpwaRsHgktdd0BOMgQqOR84ZYCXhSrWEplk+eQKg=;
        b=Ou9Bb1TvFtPMLfdgJojD2vnHQNniEEJbiHZ14A5iZNb8t19EuOnWFc6WPDLYHHDL2A
         ZZUojM5hfV+7eDrvBqwKS2LihS3QZqHS3VFyVkqtGfi5mBe1UZpY/SF2Jy1WqiCCEPIX
         FuaLcA2aZGXd+apy1hHJDituzKgMuBNKwbL1e/D8Iyz4lD9D1LDiDz1WNn/pKhX30NwX
         h6DpFAF2iw1EzCXioKDWu4df9R53w6kFOsVOroPH5FaEBgIvzp3S0ROtsfYNsBh/lbHd
         EWGqRHT3oHeupzP26DDYAmeCMkjnf7ydE7p0l5SWh7PV3wQLYBoXlfZ7bRR3KNxFm4ZT
         VFJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g6si7642787qtd.160.2017.05.06.09.06.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 May 2017 09:06:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d72E8-0005A5-Tk
	for alex.bennee@linaro.org; Sat, 06 May 2017 12:06:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d72D5-0004kt-8d
	for qemu-devel@nongnu.org; Sat, 06 May 2017 12:05:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d72D1-0002IE-6C
	for qemu-devel@nongnu.org; Sat, 06 May 2017 12:05:31 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35297)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d72D1-0002I0-1f; Sat, 06 May 2017 12:05:27 -0400
Received: by mail-qt0-x242.google.com with SMTP id r58so4544374qtb.2;
	Sat, 06 May 2017 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=YRZBpwaRsHgktdd0BOMgQqOR84ZYCXhSrWEplk+eQKg=;
	b=rPrkdtqFmb/HV7f3yUxIclBU7H+IfLNJzpvOvj1T8tZXKgX2tmdAD0obypjHOF7UrS
	KDxGUDvgXJsiGtkpykYoJ6fwWRts80azaRNhU2RUn3g7wCwykRu4BAxld0+iRM63a4Uh
	dnL9+Jm14H0w8VRCo2WzPIbq1LQaqgCgphs3VMqbI/+vI/nmNfhRBzoU1oIxwnaPa+HL
	wmr/GwBiAKZmqw2g6msAhsubhpjF/pd5PyDoWRPtZVFPtBZuLEbi/PcDkHxSmCzssiXe
	vpMpXOHdv/6gB4YiGIfLrkzPYPpFx/1ivsQ3VqMpJYoO2Atyv+eVmCCxd2YDDl+0529m
	D8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=YRZBpwaRsHgktdd0BOMgQqOR84ZYCXhSrWEplk+eQKg=;
	b=YKD0v2ET0Hqmu6M6CBO6vnuljdXLCITQWN8gyib8GjcrZVwYOrOaIJwrVIdAUj5BCs
	V1K/n8ROP1mq9+RLSjx4D+dfpkAJYzJ5rjsPHe+/DTuumEYgigHph6TU19wAwC1dPH5q
	57iZWs7XDzqV8pa8COnhRFppLUq+2MyJAd1Cq37y7YLwmkHQMzMBDYdJKAcK2sFwJ6Rd
	jHdlTi7vc2Kbra/Fm6iS6sy04FpllIVFuhwstV6sMZ2oS/J1UeTS65B467RFJq28JUkX
	rxCp4rXdUoP4aRIs0lMMbpU2pIHyTucZwuh+GfWuZLX0AZPDgh/Dtw0ImOikidhDtsF1
	B10w==
X-Gm-Message-State: AODbwcAy54bYt7yo4382c9/5nsHsLAD4Re1uQ1c8zwm0oKQHOPCP7quC
	xA2r9H0cW4Znug==
X-Received: by 10.200.35.240 with SMTP id r45mr7470676qtr.233.1494086724795;
	Sat, 06 May 2017 09:05:24 -0700 (PDT)
Received: from [192.168.1.189] ([181.25.147.174])
	by smtp.gmail.com with ESMTPSA id
	p20sm1119067qtf.31.2017.05.06.09.05.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 May 2017 09:05:24 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20170506152414.8704-1-krzk@kernel.org>
	<20170506152414.8704-2-krzk@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <05f9ba66-784d-0dee-fd0b-48f0f8f15d1d@amsat.org>
Date: Sat, 6 May 2017 13:05:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170506152414.8704-2-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 1/3] hw/arm/exynos: Move RAM
 initialization next boards
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5cEligZpafl6

Hi Krzysztof,

Please modify RAM -> DRAM in subject/description so there is no 
confusion about also moving the IRAM (which is SoC specific).

With this:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

On 05/06/2017 12:24 PM, Krzysztof Kozlowski wrote:
> Before QOM-ifying the Exynos4 SoC model, move the RAM initialization
> from exynos4210.c to exynos4_boards.c because RAM is board specific,
> not SoC.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  hw/arm/exynos4210.c         | 20 +-----------------
>  hw/arm/exynos4_boards.c     | 50 ++++++++++++++++++++++++++++++++++++++-------
>  include/hw/arm/exynos4210.h |  5 +----
>  3 files changed, 45 insertions(+), 30 deletions(-)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index 960f27e45a36..0da877f8db0a 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -160,13 +160,11 @@ static uint64_t exynos4210_calc_affinity(int cpu)
>      return mp_affinity;
>  }
>
> -Exynos4210State *exynos4210_init(MemoryRegion *system_mem,
> -        unsigned long ram_size)
> +Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
>  {
>      int i, n;
>      Exynos4210State *s = g_new(Exynos4210State, 1);
>      qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
> -    unsigned long mem_size;
>      DeviceState *dev;
>      SysBusDevice *busdev;
>      ObjectClass *cpu_oc;
> @@ -299,22 +297,6 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem,
>      memory_region_add_subregion(system_mem, EXYNOS4210_IRAM_BASE_ADDR,
>                                  &s->iram_mem);
>
> -    /* DRAM */
> -    mem_size = ram_size;
> -    if (mem_size > EXYNOS4210_DRAM_MAX_SIZE) {
> -        memory_region_init_ram(&s->dram1_mem, NULL, "exynos4210.dram1",
> -                mem_size - EXYNOS4210_DRAM_MAX_SIZE, &error_fatal);
> -        vmstate_register_ram_global(&s->dram1_mem);
> -        memory_region_add_subregion(system_mem, EXYNOS4210_DRAM1_BASE_ADDR,
> -                &s->dram1_mem);
> -        mem_size = EXYNOS4210_DRAM_MAX_SIZE;
> -    }
> -    memory_region_init_ram(&s->dram0_mem, NULL, "exynos4210.dram0", mem_size,
> -                           &error_fatal);
> -    vmstate_register_ram_global(&s->dram0_mem);
> -    memory_region_add_subregion(system_mem, EXYNOS4210_DRAM0_BASE_ADDR,
> -            &s->dram0_mem);
> -
>     /* PMU.
>      * The only reason of existence at the moment is that secondary CPU boot
>      * loader uses PMU INFORM5 register as a holding pen.
> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index 4853c318023c..6240b26839cd 100644
> --- a/hw/arm/exynos4_boards.c
> +++ b/hw/arm/exynos4_boards.c
> @@ -22,6 +22,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
> @@ -56,6 +57,12 @@ typedef enum Exynos4BoardType {
>      EXYNOS4_NUM_OF_BOARDS
>  } Exynos4BoardType;
>
> +typedef struct Exynos4BoardState {
> +    Exynos4210State *soc;
> +    MemoryRegion dram0_mem;
> +    MemoryRegion dram1_mem;
> +} Exynos4BoardState;
> +
>  static int exynos4_board_id[EXYNOS4_NUM_OF_BOARDS] = {
>      [EXYNOS4_BOARD_NURI]     = 0xD33,
>      [EXYNOS4_BOARD_SMDKC210] = 0xB16,
> @@ -96,9 +103,34 @@ static void lan9215_init(uint32_t base, qemu_irq irq)
>      }
>  }
>
> -static Exynos4210State *exynos4_boards_init_common(MachineState *machine,
> -                                                   Exynos4BoardType board_type)
> +static void exynos4_boards_init_ram(Exynos4BoardState *s,
> +                                    MemoryRegion *system_mem,
> +                                    unsigned long ram_size)
> +{
> +    unsigned long mem_size = ram_size;
> +
> +    if (mem_size > EXYNOS4210_DRAM_MAX_SIZE) {
> +        memory_region_init_ram(&s->dram1_mem, NULL, "exynos4210.dram1",
> +                               mem_size - EXYNOS4210_DRAM_MAX_SIZE,
> +                               &error_fatal);
> +        vmstate_register_ram_global(&s->dram1_mem);
> +        memory_region_add_subregion(system_mem, EXYNOS4210_DRAM1_BASE_ADDR,
> +                                    &s->dram1_mem);
> +        mem_size = EXYNOS4210_DRAM_MAX_SIZE;
> +    }
> +
> +    memory_region_init_ram(&s->dram0_mem, NULL, "exynos4210.dram0", mem_size,
> +                           &error_fatal);
> +    vmstate_register_ram_global(&s->dram0_mem);
> +    memory_region_add_subregion(system_mem, EXYNOS4210_DRAM0_BASE_ADDR,
> +                                &s->dram0_mem);
> +}
> +
> +static Exynos4BoardState *
> +exynos4_boards_init_common(MachineState *machine,
> +                           Exynos4BoardType board_type)
>  {
> +    Exynos4BoardState *s = g_new(Exynos4BoardState, 1);
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>
>      if (smp_cpus != EXYNOS4210_NCPUS && !qtest_enabled()) {
> @@ -127,8 +159,12 @@ static Exynos4210State *exynos4_boards_init_common(MachineState *machine,
>              machine->kernel_cmdline,
>              machine->initrd_filename);
>
> -    return exynos4210_init(get_system_memory(),
> -            exynos4_board_ram_size[board_type]);
> +    exynos4_boards_init_ram(s, get_system_memory(),
> +                            exynos4_board_ram_size[board_type]);
> +
> +    s->soc = exynos4210_init(get_system_memory());
> +
> +    return s;
>  }
>
>  static void nuri_init(MachineState *machine)
> @@ -140,11 +176,11 @@ static void nuri_init(MachineState *machine)
>
>  static void smdkc210_init(MachineState *machine)
>  {
> -    Exynos4210State *s = exynos4_boards_init_common(machine,
> -                                                    EXYNOS4_BOARD_SMDKC210);
> +    Exynos4BoardState *s = exynos4_boards_init_common(machine,
> +                                                      EXYNOS4_BOARD_SMDKC210);
>
>      lan9215_init(SMDK_LAN9118_BASE_ADDR,
> -            qemu_irq_invert(s->irq_table[exynos4210_get_irq(37, 1)]));
> +            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(37, 1)]));
>      arm_load_kernel(ARM_CPU(first_cpu), &exynos4_board_binfo);
>  }
>
> diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
> index d9e08014d6ff..098a69ec73d3 100644
> --- a/include/hw/arm/exynos4210.h
> +++ b/include/hw/arm/exynos4210.h
> @@ -93,8 +93,6 @@ typedef struct Exynos4210State {
>      MemoryRegion iram_mem;
>      MemoryRegion irom_mem;
>      MemoryRegion irom_alias_mem;
> -    MemoryRegion dram0_mem;
> -    MemoryRegion dram1_mem;
>      MemoryRegion boot_secondary;
>      MemoryRegion bootreg_mem;
>      I2CBus *i2c_if[EXYNOS4210_I2C_NUMBER];
> @@ -103,8 +101,7 @@ typedef struct Exynos4210State {
>  void exynos4210_write_secondary(ARMCPU *cpu,
>          const struct arm_boot_info *info);
>
> -Exynos4210State *exynos4210_init(MemoryRegion *system_mem,
> -        unsigned long ram_size);
> +Exynos4210State *exynos4210_init(MemoryRegion *system_mem);
>
>  /* Initialize exynos4210 IRQ subsystem stub */
>  qemu_irq *exynos4210_init_irq(Exynos4210Irq *env);
>
