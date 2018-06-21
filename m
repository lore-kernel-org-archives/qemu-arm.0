Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1900430wrq;
        Thu, 21 Jun 2018 05:00:46 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLwT5qSGbbW/PqrBbgRTIffF1o47kFxwYXOXRyXMACwVKh2FfZcLzxnFXVRtETQI3VUl13+
X-Received: by 2002:a37:32cb:: with SMTP id y194-v6mr768713qky.11.1529582446905;
        Thu, 21 Jun 2018 05:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529582446; cv=none;
        d=google.com; s=arc-20160816;
        b=jHwbf+H2LUEQKYxopU0JnfT73DiBSDka1yYq58F8Y4o4rTV7ielJWdZfoiKYL1ytKk
         VlugnGhjw7i6vO+S0mJuIT3N5b6KIgRzYaZnzMAr+KjAlzy1DvraJdbjA+0z3LsQOhPR
         hQisI5Sw8PuMP9xUY9E0PG7Z4kKN/7CHYf5B2sKV5jXVQqVRBuskDigqXuXnFtLTdlRg
         zJA9b4OZCiJBdZAWp8Q1jYvY/q/S8WK7aIzRyIbvoUjaCFsg9VyZRzVlNjGLiiWB9TGx
         1kmfm+BKQT+FgGDxtRaVnpOujUxYiFsQKsTL0Fv5WELnpoh6q03Es8sZJQNK6zCj1Hny
         wq1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=16GNX0iixUOJ1yqE03H11lA1CT9oG7Hu3WwZqk8jIUo=;
        b=uQQhUuDNM5DXHH85bDFRPkX6YulaPtk+ncalGU1vw8JPOn7Xjz261eHXLCZl7v7G0f
         SYeC57t3xjrwmEh7HQ/TmHUDlnlZ2Z3jb0XX928ro7ICAzgpTwLWAbtXdWTMESZdbHWl
         VuZP+JIJU+WxxPhGPv1vOZP4jb/u/i5UR0kW7SgDWIVj6gCdIvGv2V6UL90ro9f44UVl
         AhrGFQ06rm6+03becpHpz+3FXFGQmk7eYQVsbHXBv2G2DUov8LWZti/B3pgAsL6S6zzu
         /bITVmY5YkgFpPY7fg6GRahuL+Z3wQ2HInOqy9RBggw3LiMqElTIeajhJGnSGtc9zvyY
         usyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y34-v6si2734523qty.119.2018.06.21.05.00.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 05:00:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54828 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVyGc-0005VU-EH
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 08:00:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fVyG7-0005Ss-EA
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 08:00:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fVyG1-0005fE-28
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 08:00:15 -0400
Received: from [45.249.212.32] (port=47465 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fVyFr-0005Vj-5Y; Thu, 21 Jun 2018 07:59:59 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id D75BB46CD4E71;
	Thu, 21 Jun 2018 19:59:50 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.382.0; Thu, 21 Jun 2018
	19:59:44 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <1528403460-30526-1-git-send-email-gengdongjiu@huawei.com>
	<1528403460-30526-3-git-send-email-gengdongjiu@huawei.com>
	<CAFEAcA_k_-6LuMw_Av9sAvkBeb7OvvZnsppd=1aF6RYydOH=YQ@mail.gmail.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <0af82400-4131-d236-4929-8514d899ca9f@huawei.com>
Date: Thu, 21 Jun 2018 19:59:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_k_-6LuMw_Av9sAvkBeb7OvvZnsppd=1aF6RYydOH=YQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: Re: [Qemu-devel] [PATCH v3 RFC 2/2] target: arm: Add support for
 VCPU event states
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
Cc: qemu-arm <qemu-arm@nongnu.org>, James Morse <james.morse@arm.com>, QEMU
	Developers <qemu-devel@nongnu.org>, Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GJjWmTXhy30W

Hi peter,
   Thanks for the review.

On 2018/6/21 0:56, Peter Maydell wrote:
> On 7 June 2018 at 21:31, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>> This patch extends the qemu-kvm state sync logic with support for
>> KVM_GET/SET_VCPU_EVENTS, giving access to yet missing SError exception.
>> And also it can support the exception state migration.
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> ---
>>  target/arm/cpu.h     |  5 ++++
>>  target/arm/kvm64.c   | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  target/arm/machine.c |  3 +++
>>  3 files changed, 72 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 8488273..b3d6682 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -645,6 +645,11 @@ typedef struct CPUARMState {
>>      const struct arm_boot_info *boot_info;
>>      /* Store GICv3CPUState to access from this struct */
>>      void *gicv3state;
>> +    struct {
>> +        uint32_t pending;
>> +        uint32_t has_esr;
>> +        uint64_t esr;
>> +    } serror;
> 
> What is this state? That is, what guest CPU architectural state
> is it supposed to correspond to?
The guest CPU architectural can be arm64 CPU with RAS extension. so before
kvm_put_vcpu_events() sets the vcpu events, it firstly checks whether  CPU architectural support
RAS extension through kvm_can_set_vcpu_esr().

---------------------------------------------------------------------
static int kvm_put_vcpu_events(ARMCPU *cpu)
{
    ........................................
    if (kvm_can_set_vcpu_esr(cpu)) {
        events.exception.serror_has_esr = env->serror.has_esr;
        events.exception.serror_esr = env->serror.esr;
    }

    ...............................................
}
------------------------------------------------------------------

> 
>> diff --git a/target/arm/machine.c b/target/arm/machine.c
>> index 2e28d08..5a359f4 100644
>> --- a/target/arm/machine.c
>> +++ b/target/arm/machine.c
>> @@ -695,6 +695,9 @@ const VMStateDescription vmstate_arm_cpu = {
>>          VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
>>          VMSTATE_UINT32(env.exception.fsr, ARMCPU),
>>          VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
>> +        VMSTATE_UINT32(env.serror.pending, ARMCPU),
>> +        VMSTATE_UINT32(env.serror.has_esr, ARMCPU),
>> +        VMSTATE_UINT64(env.serror.esr, ARMCPU),
>>          VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
>>          VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
>>          {
> 
> You can't just add fields like this, as it breaks migration
> compatibility. If these need to be migrated then you need a
> new subsection with a suitable 'needed' function controlling
> whether it is present. But we should determine first
> whether this really is new guest CPU state...

I know your means. I will modify it according to the patch[1], which is used to do SVE migration.
Now I use this API kvm_can_set_vcpu_esr() to check the new guest CPU state. The kvm_can_set_vcpu_esr()
will check whether CPU architectural supports RAS extension.

-------------------------------------------------------------
static bool kvm_can_set_vcpu_esr(ARMCPU *cpu)
{
    CPUState *cs = CPU(cpu);

    int ret = kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_INJECT_SERROR_ESR);
    return (ret) ? true : false;
}
-----------------------------------------------------------------

[1]: https://git.qemu.org/?p=qemu.git;a=commitdiff;h=ef401601d5561f9805102695d5e65d72594f7020

> 
> thanks
> -- PMM
> 
> .
> 

