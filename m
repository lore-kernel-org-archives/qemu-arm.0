Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 142sm2726082wmi.1.2017.07.14.07.12.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jul 2017 07:12:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id E85483E00CD;
	Fri, 14 Jul 2017 15:12:33 +0100 (BST)
References: <20170713141928.25419-1-alex.bennee@linaro.org> <20170713141928.25419-6-alex.bennee@linaro.org> <CAFEAcA8o4rU7BXR_+VEQhAXBSzJ7usAnkYXDb=CEqQ=duuirqA@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH v4 5/6] target/arm: use gen_goto_tb for ISB handling
In-reply-to: <CAFEAcA8o4rU7BXR_+VEQhAXBSzJ7usAnkYXDb=CEqQ=duuirqA@mail.gmail.com>
Date: Fri, 14 Jul 2017 15:12:33 +0100
Message-ID: <87pod3umy6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: zokFiRWpJj6g


Peter Maydell <peter.maydell@linaro.org> writes:

> On 13 July 2017 at 15:19, Alex Bennée <alex.bennee@linaro.org> wrote:
>> While an ISB will ensure any raised IRQs happen on the next
>> instruction it doesn't cause any to get raised by itself. We can
>> therefor use a simple tb exit for ISB instructions and rely on the
>> exit_request check at the top of each TB to deal with exiting if
>> needed.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>> ---
>>  target/arm/translate-a64.c | 2 +-
>>  target/arm/translate.c     | 4 ++--
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> index 66139b6046..2ac565eb10 100644
>> --- a/target/arm/translate-a64.c
>> +++ b/target/arm/translate-a64.c
>> @@ -1393,7 +1393,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
>>           * a self-modified code correctly and also to take
>>           * any pending interrupts immediately.
>>           */
>> -        s->is_jmp = DISAS_UPDATE;
>> +        gen_goto_tb(s, 0, s->pc);
>>          return;
>>      default:
>>          unallocated_encoding(s);
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index 493a7b424a..d8892d9ba5 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -8168,7 +8168,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>>                   * self-modifying code correctly and also to take
>>                   * any pending interrupts immediately.
>>                   */
>> -                gen_lookup_tb(s);
>> +                gen_goto_tb(s, 0, s->pc & ~1);
>>                  return;
>>              default:
>>                  goto illegal_op;
>> @@ -10561,7 +10561,7 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
>>                               * and also to take any pending interrupts
>>                               * immediately.
>>                               */
>> -                            gen_lookup_tb(s);
>> +                            gen_goto_tb(s, 0, s->pc & ~1);
>>                              break;
>>                          default:
>>                              goto illegal_op;
>
> Why do we need to clear the low bit of s->pc for ISB?
> s->pc is the actual PC, not the "PC and low bit indicates
> Thumb mode" form that jump addresses have.

It's what gen_lookup_tb does to it's PC before the calculated jump. If
it can never happen I can get rid of it.

--
Alex Bennée
