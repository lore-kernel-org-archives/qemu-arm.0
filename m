Received: by 10.25.0.198 with SMTP id 189csp676265lfa;
        Sat, 6 May 2017 09:09:23 -0700 (PDT)
X-Received: by 10.55.177.134 with SMTP id a128mr18011324qkf.7.1494086962978;
        Sat, 06 May 2017 09:09:22 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b35si7848571qte.271.2017.05.06.09.09.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 May 2017 09:09:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d72Gm-0007K5-8b
	for alex.bennee@linaro.org; Sat, 06 May 2017 12:09:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d72FP-0006cW-V2
	for qemu-devel@nongnu.org; Sat, 06 May 2017 12:07:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d72FL-0002nA-Uq
	for qemu-devel@nongnu.org; Sat, 06 May 2017 12:07:55 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33513)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d72FL-0002n1-N1; Sat, 06 May 2017 12:07:51 -0400
Received: by mail-qt0-x244.google.com with SMTP id a46so4558621qte.0;
	Sat, 06 May 2017 09:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=nK6cWufn05m8tVIkOTSXw010uqYMM/OHMFbG0dBKSOM=;
	b=Q/+WYo4EPDKohSGlTvHlgGiY8gny2bTA1v8jvyo9mrvZw5GA4Ivp285GmOTMy3c1Jt
	KyGuNpKR4XvaiFN6Myt5wSz5N9ngch5gQWrsqSznV5eYWYW5IBefw9ZShDD8LxqZ9/1O
	9S/VSXgekiVWchjsDPYqzeYpT8b94jUj3ty6qvo4UQVvXohfK/0h2O7RvjYP4vCBBrEc
	KpJDqp6vabcbgnEpwuxRJYKed81aPqDnCSA/9B6QDbX1AqBs82LLDnACgzS9YyrZrNlj
	Md8hVJhwIGS+zvoly5zhEpKrXLQXKYmPFrNOZS5ecRPLAdfXvmQD+xr2Op8ooFfhd2Ep
	pt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=nK6cWufn05m8tVIkOTSXw010uqYMM/OHMFbG0dBKSOM=;
	b=FWFuvPsUiD/yo6TT4xqNT9GsU6NUu8X3CzzB9+4HyqiMmKfFfiFufLCQLKN0lHlq7A
	NlJJz6tPyqwyqa5g/2A2RKZb2OergBcedSc/YugWbD8XZs/biZwq4w2Ho6PDRaIsId3O
	KIBfJBfE6iCuMbyTfzNf88pslOEZpuPpL4O3oV9z1xpAB4lGAocwtlNZWEVHbbAa1Q4q
	RuprhrcFTj6pRgQN4eCYmuWSvUQmy6U1o4vsCl6pCr5Q9FO2ngrBeqgDWJQD/KUudwzO
	YyW0hP4cWfOXyJunmKNKD9DBCvPRqM+DaVBiTlQdNQgiPfYxjm3lq/GbJKYJ9fjhfqVu
	ujAg==
X-Gm-Message-State: AN3rC/7tcQQm9tipKjvzCEnkFUS3biTWFHoAW9IB7IOwvgW68lJlU+Y/
	RMyeXNHdRXA/lQ==
X-Received: by 10.200.55.145 with SMTP id d17mr19545991qtc.57.1494086871190;
	Sat, 06 May 2017 09:07:51 -0700 (PDT)
Received: from [192.168.1.189] ([181.25.147.174])
	by smtp.gmail.com with ESMTPSA id
	j14sm6008086qtj.51.2017.05.06.09.07.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 May 2017 09:07:50 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20170506152414.8704-1-krzk@kernel.org>
	<20170506152414.8704-4-krzk@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1e9c6e59-b5c6-3618-5dc1-d1c07e1196d4@amsat.org>
Date: Sat, 6 May 2017 13:07:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170506152414.8704-4-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-devel] [PATCH 3/3] hw/arm/exynos: QOM-ify the SoC
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
X-TUID: 0ja5KlcB/X+u

On 05/06/2017 12:24 PM, Krzysztof Kozlowski wrote:
> Convert the Exynos4210 SoC code into a QOM model which is a preferred
> approach instead of directly initializing SoC-related devices from the
> board file.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/exynos4210.c         | 18 +++++++++++++++---
>  hw/arm/exynos4_boards.c     |  9 ++++++---
>  include/hw/arm/exynos4210.h |  8 ++++++--
>  3 files changed, 27 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index 27a7bf28a5a9..034fc8be9d76 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -160,9 +160,10 @@ static uint64_t exynos4210_calc_affinity(int cpu)
>      return mp_affinity;
>  }
>
> -Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
> +static void exynos4210_init(Object *obj)
>  {
> -    Exynos4210State *s = g_new(Exynos4210State, 1);
> +    MemoryRegion *system_mem = get_system_memory();
> +    Exynos4210State *s = EXYNOS4210(obj);
>      qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
>      SysBusDevice *busdev;
>      ObjectClass *cpu_oc;
> @@ -402,6 +403,17 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
>
>      sysbus_create_simple(TYPE_EXYNOS4210_EHCI, EXYNOS4210_EHCI_BASE_ADDR,
>              s->irq_table[exynos4210_get_irq(28, 3)]);
> +}
> +
> +static const TypeInfo exynos4210_type_info = {
> +    .name = TYPE_EXYNOS4210,
> +    .parent = TYPE_DEVICE,
> +    .instance_size = sizeof(Exynos4210State),
> +    .instance_init = exynos4210_init,
> +};
>
> -    return s;
> +static void exynos4210_register_types(void)
> +{
> +    type_register_static(&exynos4210_type_info);
>  }
> +type_init(exynos4210_register_types)
> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index 6240b26839cd..5e7c6b562ae2 100644
> --- a/hw/arm/exynos4_boards.c
> +++ b/hw/arm/exynos4_boards.c
> @@ -58,7 +58,7 @@ typedef enum Exynos4BoardType {
>  } Exynos4BoardType;
>
>  typedef struct Exynos4BoardState {
> -    Exynos4210State *soc;
> +    Exynos4210State soc;
>      MemoryRegion dram0_mem;
>      MemoryRegion dram1_mem;
>  } Exynos4BoardState;
> @@ -162,7 +162,10 @@ exynos4_boards_init_common(MachineState *machine,
>      exynos4_boards_init_ram(s, get_system_memory(),
>                              exynos4_board_ram_size[board_type]);
>
> -    s->soc = exynos4210_init(get_system_memory());
> +    object_initialize(&s->soc, sizeof(s->soc), TYPE_EXYNOS4210);
> +    object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
> +                              &error_abort);
> +    object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_fatal);
>
>      return s;
>  }
> @@ -180,7 +183,7 @@ static void smdkc210_init(MachineState *machine)
>                                                        EXYNOS4_BOARD_SMDKC210);
>
>      lan9215_init(SMDK_LAN9118_BASE_ADDR,
> -            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(37, 1)]));
> +            qemu_irq_invert(s->soc.irq_table[exynos4210_get_irq(37, 1)]));
>      arm_load_kernel(ARM_CPU(first_cpu), &exynos4_board_binfo);
>  }
>
> diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
> index 098a69ec73d3..116eae62756b 100644
> --- a/include/hw/arm/exynos4210.h
> +++ b/include/hw/arm/exynos4210.h
> @@ -29,6 +29,10 @@
>  #include "exec/memory.h"
>  #include "target/arm/cpu-qom.h"
>
> +#define TYPE_EXYNOS4210 "exynos4210"
> +#define EXYNOS4210(obj) \
> +    OBJECT_CHECK(Exynos4210State, (obj), TYPE_EXYNOS4210)
> +
>  #define EXYNOS4210_NCPUS                    2
>
>  #define EXYNOS4210_DRAM0_BASE_ADDR          0x40000000
> @@ -85,6 +89,8 @@ typedef struct Exynos4210Irq {
>  } Exynos4210Irq;
>
>  typedef struct Exynos4210State {
> +    DeviceState parent_obj;
> +
>      ARMCPU *cpu[EXYNOS4210_NCPUS];
>      Exynos4210Irq irqs;
>      qemu_irq *irq_table;
> @@ -101,8 +107,6 @@ typedef struct Exynos4210State {
>  void exynos4210_write_secondary(ARMCPU *cpu,
>          const struct arm_boot_info *info);
>
> -Exynos4210State *exynos4210_init(MemoryRegion *system_mem);
> -
>  /* Initialize exynos4210 IRQ subsystem stub */
>  qemu_irq *exynos4210_init_irq(Exynos4210Irq *env);
>
>
