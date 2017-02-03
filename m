Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x25sm44828714wrx.27.2017.02.03.03.33.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Feb 2017 03:33:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D0A463E0126;
	Fri,  3 Feb 2017 11:33:23 +0000 (GMT)
References: <20170201150553.9381-1-alex.bennee@linaro.org> <20170201150553.9381-24-alex.bennee@linaro.org> <CAFEAcA9J4KgFLD5QiEjarw6HZY-T5WX4eSeSdGY6G2Y9ZAMOqQ@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.1.91.7
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: MTTCG Devel <mttcg@listserver.greensocs.com>, QEMU Developers
 <qemu-devel@nongnu.org>, KONRAD =?utf-8?B?RnLDqWTDqXJpYw==?=
 <fred.konrad@greensocs.com>, Alvise Rigo <a.rigo@virtualopensystems.com>,
 "Emilio G. Cota" <cota@braap.org>, Pranith Kumar <bobby.prani@gmail.com>,
 Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, Mark Burton
 <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, Jan
 Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Bamvor Zhang Jian
 <bamvor.zhangjian@linaro.org>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v9 23/25] target-arm: introduce ARM_CP_EXIT_PC
In-reply-to: <CAFEAcA9J4KgFLD5QiEjarw6HZY-T5WX4eSeSdGY6G2Y9ZAMOqQ@mail.gmail.com>
Date: Fri, 03 Feb 2017 11:33:23 +0000
Message-ID: <87shnvfr0c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: mSVFiXTQRE7L


Peter Maydell <peter.maydell@linaro.org> writes:

> On 1 February 2017 at 15:05, Alex Bennée <alex.bennee@linaro.org> wrote:
>> Some helpers may trigger an immediate exit of the cpu_loop. If this
>> happens the PC need to be rectified to ensure the restart will begin
>> on the next instruction.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  target/arm/cpu.h           | 3 ++-
>>  target/arm/translate-a64.c | 4 ++++
>>  target/arm/translate.c     | 4 ++++
>>  3 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index d61793ca06..a3c4d07817 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -1465,7 +1465,8 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
>>  #define ARM_CP_NZCV            (ARM_CP_SPECIAL | (3 << 8))
>>  #define ARM_CP_CURRENTEL       (ARM_CP_SPECIAL | (4 << 8))
>>  #define ARM_CP_DC_ZVA          (ARM_CP_SPECIAL | (5 << 8))
>> -#define ARM_LAST_SPECIAL       ARM_CP_DC_ZVA
>> +#define ARM_CP_EXIT_PC         (ARM_CP_SPECIAL | (6 << 8))
>> +#define ARM_LAST_SPECIAL       ARM_CP_EXIT_PC
>
> This shouldn't be a "special", because those are for
> "this is a special case that is handled entirely in the translate
> code", not "I need some extra behaviour on the code generated
> for calling the helper functions" (which is what the
> plain non-special ARM_CP flags do). Notice that all the other
> "special" cases completely define the behaviour of the cp that
> uses them, and the code implementing them ends the case
> statement with "return", not "break".
>
> Missing documentation comment change.

I posted this before you commented on the last version. Anyway see
bellow.

>
> That said, I'm definitely becoming more strongly of the
> opinion that longjumping out of this helper is not the
> best way to implement this, so these remarks are a bit moot.

Yep the tree:

  https://github.com/stsquad/qemu/commits/mttcg/base-patches-v10

Reverts the this change and changes the cputlb flush code to return and
let the guest translation code exit the normal way. I was hoping to get
some feedback from Paolo and Richard before I roll the fixes together
and post v10 which will be later today.

>
>>  /* Used only as a terminator for ARMCPRegInfo lists */
>>  #define ARM_CP_SENTINEL 0xffff
>>  /* Mask of only the flag bits in a type field */
>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> index 7e7131fe2f..98d4fac070 100644
>> --- a/target/arm/translate-a64.c
>> +++ b/target/arm/translate-a64.c
>> @@ -1561,6 +1561,10 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
>>          tcg_rt = cpu_reg(s, rt);
>>          gen_helper_dc_zva(cpu_env, tcg_rt);
>>          return;
>> +    case ARM_CP_EXIT_PC:
>> +        /* The helper may exit the cpu_loop so ensure PC is correct */
>> +        gen_a64_set_pc_im(s->pc);
>> +        break;
>>      default:
>>          break;
>>      }
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index 24faa7c60c..e1f4a48720 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -7510,6 +7510,10 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
>>              gen_set_pc_im(s, s->pc);
>>              s->is_jmp = DISAS_WFI;
>>              return 0;
>> +        case ARM_CP_EXIT_PC:
>> +            /* The helper may exit the cpu_loop so ensure PC is correct */
>> +            gen_set_pc_im(s, s->pc);
>> +            break;
>>          default:
>>              break;
>>          }
>
> thanks
> -- PMM


--
Alex Bennée
