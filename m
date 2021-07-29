Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5888484lfc;
        Thu, 29 Jul 2021 11:52:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT/sTYiHzznDDr/gmaNq2A1SZWlvg6voIax/CVFSu+IOAQe3OU2c+Rho9ckS8PA4aLfQVV
X-Received: by 2002:a02:380c:: with SMTP id b12mr5664491jaa.68.1627584737663;
        Thu, 29 Jul 2021 11:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627584737; cv=none;
        d=google.com; s=arc-20160816;
        b=A4r8sUrPuH96WB1nbeDqL3lqS2jedg0s7vqN4o1+hboLPPaMdUH7azFy1kq1LuBrsM
         L0c8ymQSTZHI77GynzjASoXe9i4V1/3sbb6TR24+ZJhe99I7COA71p8JXx/FOROBxg/W
         Ro5cSttfAleiS1hp2xXPhhK9MfYl+ZiLBv6ITZAMHfwE7JXB7TS2TLD0bAuNmziz6abx
         stIiAFNQ+GA9QZE+E4n1tCPz0X4xKZZeOD9dUYTs+V2SfRwgq0UcLaQY+4M1oHfvknc8
         anW3P4fDPN2Lb69vnYzKg5Zp71PKI1KuEBS4Vgy/cQsRTmWle2JOib7drS/vnAmymxb9
         pbBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+DxOKe3/E6gEKl5nvpUDjx9yDlNFjtyvBIpuMhRbKbI=;
        b=Z4XsP9hxfTiz1AB7y4hCjj5LQF1wAnK+DiAZ2sklblO4/FFjEH9kPpC/xYJYLBFBT1
         mYRGLKv3i0Cq201hAO3ya3lXonEX8sem1C8GHrBPaj2UjaQoucqCFhuGJrqzNn3k4Hq5
         rEaQkSABiTJ0OmqaFv3O20MSdsIZFek2wT1lFTNKqxrfA4FZFQN3fzOT/DxEN6gpAu0q
         TZmVuSeBw4zzzun1umgeT39m+aeWLbtwEA+4kS7Ah/ZNzOkdlzuLFFBrY0s+Fen9SdGB
         52WlX0vtI/jAJ5dLMZNZbAV5biLKQ1ma33AIQIymLG0h2/coxjh2gxENnPVMGmmlj1oA
         SgHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=p2NcOG6H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13si4434997ioq.14.2021.07.29.11.52.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 11:52:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=p2NcOG6H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9B8i-0005RO-VA
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 14:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9B8Z-0005R5-0B
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 14:52:07 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9B8W-00042m-RC
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 14:52:06 -0400
Received: by mail-pl1-x634.google.com with SMTP id t3so5946392plg.9
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 11:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+DxOKe3/E6gEKl5nvpUDjx9yDlNFjtyvBIpuMhRbKbI=;
 b=p2NcOG6H8/k4RGFtygz1iz1S9fMtsyw0AP5A86EXBos+ghppia7I1yQP5O+xu7wLNA
 k7KkpN6VJ13O+QhhOyxDYyU5p/vFVOYhmKehmJdRReqy3gQPY2MxwcXWBDPTJXHRIrWC
 lo27UwtxFnsutiEfHGuDYCgUN/iJ0m67F/ceAzNAC+tbbWgATFxtewlP6BwjHGZafeL4
 Kw6+86wpOSEvBWrLQ1hO3rbgj8A4EzrRW1AEhCfgpk8Su09uxu0xk5KPB9KZBq7xluTQ
 rpqvmcx31723NoXCyyJFUumtCZmR3wQJNBqWTxxx3JS14rYnMnxEsmIp9xWoQMEUxPyp
 BHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+DxOKe3/E6gEKl5nvpUDjx9yDlNFjtyvBIpuMhRbKbI=;
 b=glbugVaKNrmDBLPB/O5utDZfe1Fc8W/MOJZJM+Uyz7+efp7VR2Q+MSAb2rsF81pGdW
 tLzRmChoRGMTSUVIOxx+lR1lpOZEe1ye/RgNz5vh1LkYTkC9hUDFdjb2JzrDcUavjqX1
 nL2yEWc2xEMSs6pW+lFVuB4poZYT/KTjRGNSKtsU3WERo8I62pV+smPQirPZ3AbuwIo3
 D92Pdi4jWzobPMG9BejqrV0X1tS5LabNzyVFbJc8bFnvB4BgT5FDZRlkFNUM+KgzStof
 YNwLw8tTymXU+ow88ZR3FgSteZmWvLhwqRrS2yxaikpqSWH+QNp6VP9PlYKhNkFKnDBb
 lwRQ==
X-Gm-Message-State: AOAM533h4ZzL+Bv5EkiYZerTQohRRclf50AIrCvOAHkoMngCk0qG80JU
 jtm1zClVEn8CqYHiwTuHVck1zapLgotPSQ==
X-Received: by 2002:aa7:8185:0:b029:3aa:29a2:39d3 with SMTP id
 g5-20020aa781850000b02903aa29a239d3mr2702483pfi.28.1627584722967; 
 Thu, 29 Jul 2021 11:52:02 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id d2sm401952pjs.28.2021.07.29.11.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 11:52:02 -0700 (PDT)
Subject: Re: [PATCH for-6.2 03/43] target/arm: Implement do_unaligned_access
 for user-only
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-4-richard.henderson@linaro.org>
 <CAFEAcA9ZZK2FhCptvypviDOoC-SQkP1rfANrPWZJH1F99GV87Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38180886-99b6-af82-1b95-ba0d250d06f5@linaro.org>
Date: Thu, 29 Jul 2021 08:51:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9ZZK2FhCptvypviDOoC-SQkP1rfANrPWZJH1F99GV87Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9UaFVFPUo9Br

On 7/29/21 3:14 AM, Peter Maydell wrote:
> On Thu, 29 Jul 2021 at 01:47, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/aarch64/cpu_loop.c |  4 ++++
>>   linux-user/arm/cpu_loop.c     | 43 +++++++++++++++++++++++++++--------
>>   target/arm/cpu.c              |  2 +-
>>   target/arm/cpu_tcg.c          |  2 +-
>>   4 files changed, 40 insertions(+), 11 deletions(-)
>>
>> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
>> index ee72a1c20f..998831f87f 100644
>> --- a/linux-user/aarch64/cpu_loop.c
>> +++ b/linux-user/aarch64/cpu_loop.c
>> @@ -137,6 +137,10 @@ void cpu_loop(CPUARMState *env)
>>               case 0x11: /* Synchronous Tag Check Fault */
>>                   info.si_code = TARGET_SEGV_MTESERR;
>>                   break;
>> +            case 0x21: /* Alignment fault */
>> +                info.si_signo = TARGET_SIGBUS;
>> +                info.si_code = TARGET_BUS_ADRALN;
>> +                break;
>>               default:
>>                   g_assert_not_reached();
>>               }
>> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
>> index 69632d15be..da7da6a0c1 100644
>> --- a/linux-user/arm/cpu_loop.c
>> +++ b/linux-user/arm/cpu_loop.c
>> @@ -23,6 +23,7 @@
>>   #include "elf.h"
>>   #include "cpu_loop-common.h"
>>   #include "semihosting/common-semi.h"
>> +#include "target/arm/syndrome.h"
> 
> Not a huge fan of linux-user files pulling in target/arm headers, but
> I guess we do it already in aarch64/cpu_loop.c. (Though that is afaict
> the only other place ATM...)
> 
>>
>>   #define get_user_code_u32(x, gaddr, env)                \
>>       ({ abi_long __r = get_user_u32((x), (gaddr));       \
>> @@ -286,9 +287,8 @@ void cpu_loop(CPUARMState *env)
>>   {
>>       CPUState *cs = env_cpu(env);
>>       int trapnr;
>> -    unsigned int n, insn;
>> +    unsigned int n, insn, ec, fsc;
>>       target_siginfo_t info;
>> -    uint32_t addr;
>>       abi_ulong ret;
>>
>>       for(;;) {
>> @@ -437,15 +437,40 @@ void cpu_loop(CPUARMState *env)
>>               break;
>>           case EXCP_PREFETCH_ABORT:
>>           case EXCP_DATA_ABORT:
>> -            addr = env->exception.vaddress;
>> -            {
>> -                info.si_signo = TARGET_SIGSEGV;
>> -                info.si_errno = 0;
>> -                /* XXX: check env->error_code */
>> +            info.si_signo = TARGET_SIGSEGV;
>> +            info.si_errno = 0;
>> +            info._sifields._sigfault._addr = env->exception.vaddress;
>> +            /*
>> +             * We should only arrive here with EC in {DATAABORT, INSNABORT},
>> +             * and short-form FSC, which then tells us to look at the FSR.
>> +             * ??? arm_cpu_reset never sets TTBCR_EAE, so we always get
>> +             * short-form FSC.
>> +             */
>> +            ec = syn_get_ec(env->exception.syndrome);
>> +            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
>> +            fsc = extract32(env->exception.syndrome, 0, 6);
>> +            assert(fsc == 0x3f);
>> +            switch (env->exception.fsr & 0x1f) {
>> +            case 0x1: /* Alignment */
>> +                info.si_signo = TARGET_SIGBUS;
>> +                info.si_code = TARGET_BUS_ADRALN;
>> +                break;
>> +            case 0x3: /* Access flag fault, level 1 */
>> +            case 0x6: /* Access flag fault, level 2 */
>> +            case 0x9: /* Domain fault, level 1 */
>> +            case 0xb: /* Domain fault, level 2 */
>> +            case 0xd: /* Permision fault, level 1 */
>> +            case 0xf: /* Permision fault, level 2 */
>> +                info.si_code = TARGET_SEGV_ACCERR;
>> +                break;
>> +            case 0x5: /* Translation fault, level 1 */
>> +            case 0x7: /* Translation fault, level 2 */
>>                   info.si_code = TARGET_SEGV_MAPERR;
>> -                info._sifields._sigfault._addr = addr;
>> -                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>> +                break;
>> +            default:
>> +                g_assert_not_reached();
>>               }
>> +            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>>               break;
> 
> It's slightly sad that we start off with a nicely symbolic
> ArmMMUFaultInfo type enum value, carefully encode it into a
> numeric value and then have to switch on the numeric value here,
> but I can see why we end up this way...

We don't have to leave it that way.

We could move the ARMMMUFaultInfo out of internals.h, create special user-only copies of 
arm_cpu_tlb_fill and arm_cpu_do_unaligned_access, create a new function to raise the MTE 
exception, and place the proper enumeraor into env->error_code instead of the hw syndrome.

What we have seemed cleaner on the target/arm/ side at the time.


r~
