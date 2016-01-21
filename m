Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e9sm1357332wja.25.2016.01.21.04.52.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jan 2016 04:52:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 10F8E3E0346;
	Thu, 21 Jan 2016 12:52:55 +0000 (GMT)
References: <1453297780-12514-1-git-send-email-edgar.iglesias@gmail.com> <1453297780-12514-4-git-send-email-edgar.iglesias@gmail.com> <20160120172355.GW29396@toto>
User-agent: mu4e 0.9.15; emacs 25.0.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org, edgar.iglesias@xilinx.com
Subject: Re: [PATCH v1 3/3] target-arm: Implement the S2 MMU inputsize < pamax check
In-reply-to: <20160120172355.GW29396@toto>
Date: Thu, 21 Jan 2016 12:52:54 +0000
Message-ID: <877fj3ccwp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: NoxuSBsOMslI


Edgar E. Iglesias <edgar.iglesias@gmail.com> writes:

> On Wed, Jan 20, 2016 at 02:49:40PM +0100, Edgar E. Iglesias wrote:
>> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>>
>> Implement the inputsize < pamax check for Stage 2 translations.
>> We have multiple choices for how to respond to errors and
>> choose to fault.
>>
>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>> ---
>>  target-arm/helper.c | 15 +++++++++++----
>>  1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/target-arm/helper.c b/target-arm/helper.c
>> index 4abeb4d..e1fa209 100644
>> --- a/target-arm/helper.c
>> +++ b/target-arm/helper.c
>> @@ -6808,7 +6808,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>>           */
>>          int startlevel = extract32(tcr->raw_tcr, 6, 2);
>>          unsigned int pamax = arm_pamax(cpu);
>> -        bool ok;
>> +        bool ok = true;
>>
>>          if (va_size == 32 || stride == 9) {
>>              /* AArch32 or 4KB pages */
>> @@ -6818,9 +6818,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>>              level = 3 - startlevel;
>>          }
>>
>> -        /* Check that the starting level is valid. */
>> -        ok = check_s2_startlevel(cpu, va_size == 64, level,
>> -                                 inputsize, stride, pamax);
>> +        if (inputsize > pamax &&
>> +            (arm_el_is_aa64(env, 1) || inputsize > 40)) {
>
> I realized that this check should only be done for AArch64...
> Will fix that for v2.
>
> Something like the following:
>
>         if (arm_el_is_aa64(env, el) &&
>             inputsize > pamax &&
>             (arm_el_is_aa64(env, 1) || inputsize > 40)) {
>             /* We have multiple choices but choose to fault.  */
>             ok = false;
>         }
>

OK, I'll await the next revision.

>
> Cheers,
> Edgar
>
>
>> +            /* We have multiple choices but choose to fault.  */
>> +            ok = false;
>> +        }
>> +        if (ok) {
>> +            /* Check that the starting level is valid. */
>> +            ok = check_s2_startlevel(cpu, va_size == 64, level,
>> +                                     inputsize, stride, pamax);
>> +        }
>>          if (!ok) {
>>              /* AArch64 reports these as level 0 faults.
>>               * AArch32 reports these as level 1 faults.
>> --
>> 1.9.1
>>


--
Alex Bennée
