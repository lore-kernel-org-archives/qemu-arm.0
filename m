Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1817965lfb;
        Tue, 22 Mar 2022 13:09:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwC0MvXa9rGRH+geH9T0+RXaZjiRbsLuHc/GfToWaPFskM6MZHDBMV29I9G65oryGlduEaH
X-Received: by 2002:a25:24d0:0:b0:633:806d:143b with SMTP id k199-20020a2524d0000000b00633806d143bmr29257417ybk.416.1647979750035;
        Tue, 22 Mar 2022 13:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647979750; cv=none;
        d=google.com; s=arc-20160816;
        b=YTKIS+qTwMT/LmH3sVSaL6qp8gziEyFa3aRP6m7+XhkBOfpb5zNSsn6WeoCe91CJZ9
         GL0QRjx3vOLS+8r5DmQ8F9BMjmXujn9v5Qk1QY1rR0onSRWLH25RDvmNwrE0H5RCXnei
         ly3A0M2WwDq/dy23m+zW+jCDf/ewLADFvgvOEjjP1Tied8WSSd93aqukh1vrH7zRcuiN
         PSH5/aYQD+yMphg4AL5YtKNwlHdrZ6VdidrnpMTOUNJN5yz2au4KIr1faXcysl52UMz3
         8FNgF7GbllTS6nYD0t4PLdd95PEsuamkS/Wlv6TwpE9pIjco+V6v/Sky6frXGlYnZXli
         UaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:to:from:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=YVFQMNkyFfxnAsJ6B7gM9Edp8bGzz/oM2x1q8BQwGEY=;
        b=E8K7ny/Jon8RbPovEYssGq4QMBNuA6UbWxpwQ6Cd1FccJ/852qfdo2fsdr0w0u+OUO
         GxQh7ROr+m1fGwYLjDuzijDKLihNiraLx9SXJ3Q/WW31Onb35XExFb/0dHejfXk3DT/s
         MKIBgY/ESr53auCQO9YrlWzbhV6fs2pJI6e5KOnyChT4wtMlRCNSr88rybaQ2jrotQI5
         5h6Gl0VSYKn91TFjfiOGA9i4TOmLjha/71E6G6O37LNa8NzsS+WUB1OXOnvOiWGyFwzZ
         1XWJqKCtbtmFCohyUOqEXccHGyr+bJHIpKW1PX2hlnNDJB2F3xCHsO1B61pJdgKWRzxB
         Ofsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7-20020a812607000000b002e5bb9dca62si10769406ywm.235.2022.03.22.13.09.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Mar 2022 13:09:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWkoX-0003Lv-B7
	for alex.bennee@linaro.org; Tue, 22 Mar 2022 16:09:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nWkoM-0003L9-4K; Tue, 22 Mar 2022 16:08:58 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:47953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nWkoK-0008QB-8f; Tue, 22 Mar 2022 16:08:57 -0400
Received: from [192.168.100.1] ([82.142.12.150]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MDQqe-1nOT5O3ISk-00AXnI; Tue, 22 Mar 2022 21:08:52 +0100
Message-ID: <6089ef2d-49e3-04c1-1e0a-e108d7fbd3c3@vivier.eu>
Date: Tue, 22 Mar 2022 21:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] linux-user/arm: Implement __kernel_cmpxchg with host
 atomics
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220314044305.138794-1-richard.henderson@linaro.org>
 <20220314044305.138794-3-richard.henderson@linaro.org>
 <b93a6c01-6153-b9c4-7a7f-db1daed88d9c@vivier.eu>
In-Reply-To: <b93a6c01-6153-b9c4-7a7f-db1daed88d9c@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:o09Mqx13gnT9rS3HEotxsPQTTzqY2Rvy+JyZ9ihpb7sdfsP8/v3
 SW2AVdJ4J6/c+wja++p1nXXzDLJIfTC8VX5JDZztXpxXVgmXV6/jz2JwQ3/irYTWyMzm9A3
 Oc4X2aA1aSrbMSPtq+RyOWY9OP1thX7XvW9gaG9GvB+wJPS/rHk4UuBqMBwTJJmpsc9z2Jx
 mokI5pIdhpKvvwOeFHTSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VwSUEDdbqqM=:abJWq5pU2RbGqzSqf5mro2
 rOk07a4tZFmKsiRi5jieCx2Ey49yVCiKeywCaMWYM5atm/ThjRNKkiuxGruf5uRM+TABBLUE3
 7oA6nVFOX8cl/WF48diYqli4pl46Yssf2bsPC4+wGhz4eLvQU2lnRaZF/Fr3/ztFZweaNtVhW
 HNOOgFVCU3zSOpNzSfgbl7OzQ9a9TBbK5vhVJP5oLzsj0cU3tKLTDVn+vz3CAZ45BcnZj2xUA
 hSrXDUam7wd4RKzihO0B/BkExApVHzdDT6BX6LkQuYNVmrQWJEXWhHqdq53+BTvOUynuP8QSn
 VfrW3Mnhry8gmydjuawxiWsLyR960TssP3WiPVfmsN9LlyrpsF6yAFBYfm2YGHIZZgKTL+EqE
 ge59cKrIvKDGJUodl8HakHaYlikArZLBmGmZUnWFovnvmMB8RBc04uBb7qhJT5JRQbdbAieA6
 DYanlcjrFVx/KgYcGZuKC2qvBTiSr7fYGIzP1Yj92V3dRKqZJsEDazYtIIFIFx2KIgbS30UsB
 RBEHqm3IfV9qO0/ceIoIkSSw38YanHInmeX1p3bEFcDu9TGhK7AABq9GbMMoVxrhY33NwPLlj
 eqj/LutSlVisrPeg8j2KN/wqcedZp7UJiNZ2Z3YwDmgCm2CWkzBNe/J8EWe9e3O5Y7J9hXC6P
 Ppb8ILtC6w5P+CHGjtbbSnBkp+UUioPx6JX2Ys2pekfGylRYDnoAzeXPkc6Fq3me7Oso=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hIuQxUr/S5M8

Le 22/03/2022 à 12:46, Laurent Vivier a écrit :
> Le 14/03/2022 à 05:43, Richard Henderson a écrit :
>> The existing implementation using start/end_exclusive
>> does not provide atomicity across processes.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/arm/cpu_loop.c | 85 +++++++++++++++++++++++++++------------
>>   1 file changed, 60 insertions(+), 25 deletions(-)
>>
>> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
>> index a0e43b261c..0122bb34f7 100644
>> --- a/linux-user/arm/cpu_loop.c
>> +++ b/linux-user/arm/cpu_loop.c
>> @@ -75,7 +75,65 @@
>>           put_user_u16(__x, (gaddr));                     \
>>       })
>> -/* Commpage handling -- there is no commpage for AArch64 */
>> +/*
>> + * Similar to code in accel/tcg/user-exec.c, but outside the execution loop.
>> + * Must be called with mmap_lock.
>> + */
>> +static void *atomic_mmu_lookup(CPUArchState *env, uint32_t addr, int size)
>> +{
>> +    int need_flags = PAGE_READ | PAGE_WRITE_ORG | PAGE_VALID;
>> +    int page_flags;
>> +
>> +    /* Enforce guest required alignment.  */
>> +    if (unlikely(addr & (size - 1))) {
>> +        force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, addr);
>> +        return NULL;
>> +    }
>> +
>> +    page_flags = page_get_flags(addr);
>> +    if (unlikely((page_flags & need_flags) != need_flags)) {
>> +        force_sig_fault(TARGET_SIGSEGV,
>> +                        page_flags & PAGE_VALID ?
>> +                        TARGET_SEGV_ACCERR : TARGET_SEGV_MAPERR, addr);
>> +        return NULL;
>> +    }
>> +
>> +    return g2h(env_cpu(env), addr);
>> +}
>> +
>> +/*
>> + * See the Linux kernel's Documentation/arm/kernel_user_helpers.rst
>> + * Input:
>> + * r0 = oldval
>> + * r1 = newval
>> + * r2 = pointer to target value
>> + *
>> + * Output:
>> + * r0 = 0 if *ptr was changed, non-0 if no exchange happened
>> + * C set if *ptr was changed, clear if no exchange happened
>> + */
>> +static void arm_kernel_cmpxchg32_helper(CPUARMState *env)
>> +{
>> +    uint32_t oldval, newval, val, addr, cpsr, *host_addr;
>> +
>> +    oldval = env->regs[0];
>> +    newval = env->regs[1];
>> +    addr = env->regs[2];
>> +
>> +    mmap_lock();
>> +    host_addr = atomic_mmu_lookup(env, addr, 8);
>> +    if (!host_addr) {
>> +        mmap_unlock();
>> +        return;
>> +    }
>> +
>> +    val = qatomic_cmpxchg__nocheck(host_addr, oldval, newval);
>> +    mmap_unlock();
>> +
>> +    cpsr = (val == oldval) * CPSR_C;
>> +    cpsr_write(env, cpsr, CPSR_C, CPSRWriteByInstr);
>> +    env->regs[0] = cpsr ? 0 : -1;
>> +}
>>   /*
>>    * See the Linux kernel's Documentation/arm/kernel_user_helpers.txt
>> @@ -153,36 +211,13 @@ static int
>>   do_kernel_trap(CPUARMState *env)
>>   {
>>       uint32_t addr;
>> -    uint32_t cpsr;
>> -    uint32_t val;
>>       switch (env->regs[15]) {
>>       case 0xffff0fa0: /* __kernel_memory_barrier */
>>           smp_mb();
>>           break;
>>       case 0xffff0fc0: /* __kernel_cmpxchg */
>> -         /* XXX: This only works between threads, not between processes.
>> -            It's probably possible to implement this with native host
>> -            operations. However things like ldrex/strex are much harder so
>> -            there's not much point trying.  */
>> -        start_exclusive();
>> -        cpsr = cpsr_read(env);
>> -        addr = env->regs[2];
>> -        /* FIXME: This should SEGV if the access fails.  */
>> -        if (get_user_u32(val, addr))
>> -            val = ~env->regs[0];
>> -        if (val == env->regs[0]) {
>> -            val = env->regs[1];
>> -            /* FIXME: Check for segfaults.  */
>> -            put_user_u32(val, addr);
>> -            env->regs[0] = 0;
>> -            cpsr |= CPSR_C;
>> -        } else {
>> -            env->regs[0] = -1;
>> -            cpsr &= ~CPSR_C;
>> -        }
>> -        cpsr_write(env, cpsr, CPSR_C, CPSRWriteByInstr);
>> -        end_exclusive();
>> +        arm_kernel_cmpxchg32_helper(env);
>>           break;
>>       case 0xffff0fe0: /* __kernel_get_tls */
>>           env->regs[0] = cpu_get_tls(env);
> 
> Applied to my linux-user-for-7.0 branch.
> 
>

I have removed this patch and the following one from the branch because it hangs when executed in an 
armhf/bionic chroot the following example:

cat > /tmp/hello.go <<EOF
package main

import "fmt"

func main() {
         fmt.Println("Hello Google!")
}
EOF

go run /tmp/hello.go

Thanks,
Laurent
