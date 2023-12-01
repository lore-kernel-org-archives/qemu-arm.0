Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp854955ejb;
        Fri, 1 Dec 2023 01:40:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEO07kznRBhFF91ipdGE2x3OOox6HEO+o/ciOPnFl18if5zhOczD5PiqM/7NgrX0RWsKQ1n
X-Received: by 2002:ac8:4e51:0:b0:41e:1a89:2534 with SMTP id e17-20020ac84e51000000b0041e1a892534mr29349079qtw.53.1701423626742;
        Fri, 01 Dec 2023 01:40:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701423626; cv=none;
        d=google.com; s=arc-20160816;
        b=Gom9FKOMPxmHPkWy3Lc9ELz9Z74RXAuBFWXkNxy6vL7ltj9cpEzx0QOV3c8FUCvM9I
         PojTxUwdgjShgyjBl+YVjeMcUMHbtwH2iXeWr3o2YDI32pRCNuLwEiv76FSE4GQpBhbn
         mlFbuQt1iDrgLCo7UpqcpO7ZLZlOiO2GikjvDJiNSoMaY1v3izT/Kj+F+S/J8Bqt6Kfy
         i5xef9PTZNj3Nr0mu1/my8dtD6nWq0xkpAfmkPRvlc9u5SPKja/PN6hcK7NhQr4yvr9N
         a6UJ7Mib2ImQtTpOzEaXuq6b0bA0+3sPi0sS434qUo0fVqmVZyd22Qkvx/BlBuMf6Fi9
         XIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=QR1GkLR1LdmLBEGjBxKJNk8usgI5Aqx7LU6sJpXPQ50=;
        fh=6LTpBlQFGsO2JFDrsYZqqe3IoxGRxGn4U3eyQr4hw/M=;
        b=JEgw4M3iJQMWE3Cm+L/dd62rqCDslzO8B0/yiz20Qq0ghwOQk844CoicjQ5eS1L+Nl
         M+3hhZlCEYp+GJpFcoZp+gqnmUSrlzXFl0ZYthClwy5ry65Aq7j7/FNGIToZROecbda7
         6tXTrLlivO99UdFZG+86sqy0I8FufFc8RfRMVVGzgtwa+SbuqVa6IaVq+VuBWhgV8wDd
         yZreDsLgl7B1ftQXPEYYKhD68QmjJgABBuYKedk13jOtZKlxduNbIOqhf0dOzEIE3bvw
         wwwbS+2ZqELwW/vmf+RbjrEtNYujwECKOIZL5aCAoc8r5qDeAxs2Zo8fkQE3VkLfWVvj
         x/dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bv16-20020a05622a0a1000b004238e50730dsi3030570qtb.73.2023.12.01.01.40.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Dec 2023 01:40:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r900U-0001IC-Iv; Fri, 01 Dec 2023 04:40:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1r900Q-0001HE-VQ; Fri, 01 Dec 2023 04:40:19 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1r900O-0004qr-RS; Fri, 01 Dec 2023 04:40:18 -0500
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id D6BD46080030;
 Fri,  1 Dec 2023 10:40:05 +0100 (CET)
Message-ID: <614c035f-8382-40c9-b2ab-d20a9dc5570e@csgraf.de>
Date: Fri, 1 Dec 2023 10:40:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 04/10] hvf: Add Apple Silicon support
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210916155404.86958-1-agraf@csgraf.de>
 <20210916155404.86958-5-agraf@csgraf.de>
 <0ae7ffb0-a0af-4afc-ad29-384daff52484@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <0ae7ffb0-a0af-4afc-ad29-384daff52484@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8B3uKwlA3X5e


On 30.11.23 15:17, Philippe Mathieu-Daudé wrote:
> Hi,
>
> On 16/9/21 17:53, Alexander Graf wrote:
>> With Apple Silicon available to the masses, it's a good time to add 
>> support
>> for driving its virtualization extensions from QEMU.
>>
>> This patch adds all necessary architecture specific code to get basic 
>> VMs
>> working, including save/restore.
>>
>> Known limitations:
>>
>>    - WFI handling is missing (follows in later patch)
>>    - No watchpoint/breakpoint support
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
>> Reviewed-by: Sergio Lopez <slp@redhat.com>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
>
>> ---
>>   MAINTAINERS                 |   5 +
>>   accel/hvf/hvf-accel-ops.c   |   9 +
>>   include/sysemu/hvf_int.h    |  10 +-
>>   meson.build                 |   1 +
>>   target/arm/hvf/hvf.c        | 794 ++++++++++++++++++++++++++++++++++++
>>   target/arm/hvf/trace-events |  10 +
>>   target/i386/hvf/hvf.c       |   5 +
>>   7 files changed, 833 insertions(+), 1 deletion(-)
>>   create mode 100644 target/arm/hvf/hvf.c
>>   create mode 100644 target/arm/hvf/trace-events
>
>
>> +int hvf_arch_init_vcpu(CPUState *cpu)
>> +{
>> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
>> +    CPUARMState *env = &arm_cpu->env;
>> +    uint32_t sregs_match_len = ARRAY_SIZE(hvf_sreg_match);
>> +    uint32_t sregs_cnt = 0;
>> +    uint64_t pfr;
>> +    hv_return_t ret;
>> +    int i;
>> +
>> +    env->aarch64 = 1;
>> +    asm volatile("mrs %0, cntfrq_el0" : "=r"(arm_cpu->gt_cntfrq_hz));
>> +
>> +    /* Allocate enough space for our sysreg sync */
>> +    arm_cpu->cpreg_indexes = g_renew(uint64_t, arm_cpu->cpreg_indexes,
>> +                                     sregs_match_len);
>> +    arm_cpu->cpreg_values = g_renew(uint64_t, arm_cpu->cpreg_values,
>> +                                    sregs_match_len);
>> +    arm_cpu->cpreg_vmstate_indexes = g_renew(uint64_t,
>> + arm_cpu->cpreg_vmstate_indexes,
>> +                                             sregs_match_len);
>> +    arm_cpu->cpreg_vmstate_values = g_renew(uint64_t,
>> + arm_cpu->cpreg_vmstate_values,
>> +                                            sregs_match_len);
>> +
>> +    memset(arm_cpu->cpreg_values, 0, sregs_match_len * 
>> sizeof(uint64_t));
>> +
>> +    /* Populate cp list for all known sysregs */
>> +    for (i = 0; i < sregs_match_len; i++) {
>> +        const ARMCPRegInfo *ri;
>> +        uint32_t key = hvf_sreg_match[i].key;
>> +
>> +        ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
>> +        if (ri) {
>> +            assert(!(ri->type & ARM_CP_NO_RAW));
>> +            hvf_sreg_match[i].cp_idx = sregs_cnt;
>> +            arm_cpu->cpreg_indexes[sregs_cnt++] = cpreg_to_kvm_id(key);
>
> So this hash ...:
>
>     /*
>      * Convert a truncated 32 bit hashtable key into the full
>      * 64 bit KVM register ID.
>      */
>     static uint64_t cpreg_to_kvm_id(uint32_t cpregid)
>     {
>         uint64_t kvmid;
>
>         if (cpregid & CP_REG_AA64_MASK) {
>             kvmid = cpregid & ~CP_REG_AA64_MASK;
>             kvmid |= CP_REG_SIZE_U64 | CP_REG_ARM64;
>         } else {
>             kvmid = cpregid & ~(1 << 15);
>             if (cpregid & (1 << 15)) {
>                 kvmid |= CP_REG_SIZE_U64 | CP_REG_ARM;
>             } else {
>                 kvmid |= CP_REG_SIZE_U32 | CP_REG_ARM;
>             }
>         }
>         return kvmid;
>     }
>
> ... just happens to work the same way for HVF?


It never feeds into HVF - we only use these values as unique identifiers 
inside QEMU, no? See write_cpustate_to_list() and 
write_list_to_cpustate() for reference.


Alex


