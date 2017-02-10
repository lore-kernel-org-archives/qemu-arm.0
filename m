Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e71sm2022340wma.8.2017.02.10.07.19.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Feb 2017 07:19:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 9D8973E014D;
	Fri, 10 Feb 2017 15:19:17 +0000 (GMT)
References: <20170209170904.5713-1-alex.bennee@linaro.org> <20170209170904.5713-24-alex.bennee@linaro.org> <CAFEAcA8_UNip6QooREop-T5RBpdo1me0piEAscJRC+G7tGcNrA@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.2.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, MTTCG Devel
 <mttcg@listserver.greensocs.com>, QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD =?utf-8?B?RnLDqWTDqXJpYw==?= <fred.konrad@greensocs.com>, Alvise
 Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>,
 Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania
 <nikunj@linux.vnet.ibm.com>, Mark Burton <mark.burton@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Fedorov Sergey <serge.fdrv@gmail.com>, Bamvor Zhang Jian
 <bamvor.zhangjian@linaro.org>, Peter Chubb <peter.chubb@nicta.com.au>,
 "open list\:i.MX31" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v11 23/24] hw/misc/imx6_src: defer clearing of SRC_SCR reset bits
In-reply-to: <CAFEAcA8_UNip6QooREop-T5RBpdo1me0piEAscJRC+G7tGcNrA@mail.gmail.com>
Date: Fri, 10 Feb 2017 15:19:17 +0000
Message-ID: <87tw82vzt6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: WLfmyyCXABMQ


Peter Maydell <peter.maydell@linaro.org> writes:

> On 9 February 2017 at 17:09, Alex Bennée <alex.bennee@linaro.org> wrote:
>> The arm_reset_cpu/set_cpu_on/set_cpu_off() functions do their work
>> asynchronously in the target vCPUs context. As a result we need to
>> ensure the SRC_SCR reset bits correctly report the reset status at the
>> right time. To do this we defer the clearing of the bit with an async
>> job which will run after the work queued by ARM powerctl functions.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  hw/misc/imx6_src.c | 58 +++++++++++++++++++++++++++++++++++++++++++++---------
>>  1 file changed, 49 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
>> index 55b817b8d7..f7c1d94a3e 100644
>> --- a/hw/misc/imx6_src.c
>> +++ b/hw/misc/imx6_src.c
>> @@ -14,6 +14,7 @@
>>  #include "qemu/bitops.h"
>>  #include "qemu/log.h"
>>  #include "arm-powerctl.h"
>> +#include "qom/cpu.h"
>>
>>  #ifndef DEBUG_IMX6_SRC
>>  #define DEBUG_IMX6_SRC 0
>> @@ -113,6 +114,45 @@ static uint64_t imx6_src_read(void *opaque, hwaddr offset, unsigned size)
>>      return value;
>>  }
>>
>> +
>> +/* The reset is asynchronous so we need to defer clearing the reset
>> + * bit until the work is completed.
>> + */
>> +
>> +struct src_scr_reset_info {
>
> Struct names should be CamelCase.
>
>> +    IMX6SRCState *s;
>> +    unsigned long reset_bit;
>
> Unsigned long ? That's always a bit of a red flag because it's
> variable in size from host to host. I think you want "int".

Yeah that's a hangover from the original code that was using unsigned
long for holding bitfields. I'll drop it down to int.

>
>> +};
>> +
>> +static void imx6_clear_reset_bit(CPUState *cpu, run_on_cpu_data data)
>> +{
>> +    struct src_scr_reset_info *ri = data.host_ptr;
>> +    IMX6SRCState *s = ri->s;
>> +
>> +    assert(qemu_mutex_iothread_locked());
>> +
>> +    s->regs[SRC_SCR] = deposit32(s->regs[SRC_SCR], ri->reset_bit, 1, 0);
>> +    DPRINTF("reg[%s] <= 0x%" PRIx32 "\n",
>> +            imx6_src_reg_name(SRC_SCR), s->regs[SRC_SCR]);
>> +
>> +    g_free(ri);
>> +}
>> +
>> +static void imx6_defer_clear_reset_bit(int cpuid,
>> +                                       IMX6SRCState *s,
>> +                                       unsigned long reset_shift)
>> +{
>> +    struct src_scr_reset_info *ri;
>> +
>> +    ri = g_malloc(sizeof(struct src_scr_reset_info));
>> +    ri->s = s;
>> +    ri->reset_bit = reset_shift;
>> +
>> +    async_run_on_cpu(arm_get_cpu_by_id(cpuid), imx6_clear_reset_bit,
>> +                     RUN_ON_CPU_HOST_PTR(ri));
>> +}
>
> What happens if we do a system reset between calling this
> and the async hook running? Do all the outstanding async
> run hooks guarantee to run first?

Yes they run in the order they are queued.

>
> I guess a malloc-and-free is OK since the guest isn't going to be
> bouncing CPUs through reset very often, though it's a bit ugly to
> see in device code.

Previous patches had expanded the run_on_cpu code to have things like
CPUState and a single field to avoid malloc where we can. However I need
the IMX6SRCState and I don't know if I can get that in the work
function. Will there only ever be one on the system?

>
> Otherwise this looks OK.
>
> thanks
> -- PMM


--
Alex Bennée
