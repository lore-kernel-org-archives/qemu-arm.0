Received: by 10.25.21.156 with SMTP id 28csp449076lfv;
        Fri, 19 Aug 2016 10:15:00 -0700 (PDT)
X-Received: by 10.55.109.198 with SMTP id i189mr10516268qkc.73.1471626900128;
        Fri, 19 Aug 2016 10:15:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v127si5210432qkb.250.2016.08.19.10.14.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Aug 2016 10:15:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1banNj-00065n-6X
	for alex.bennee@linaro.org; Fri, 19 Aug 2016 13:14:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1banF3-0007XE-JX
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 13:06:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1banEx-0001Je-IG
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 13:05:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39138)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1banEx-0001JX-0q; Fri, 19 Aug 2016 13:05:55 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A289C056819;
	Fri, 19 Aug 2016 17:05:52 +0000 (UTC)
Received: from [10.10.58.241] (vpn-58-241.rdu2.redhat.com [10.10.58.241])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7JH5okx013131
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 19 Aug 2016 13:05:51 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <1471067570-7503-1-git-send-email-wei@redhat.com>
	<CAFEAcA-_hc71ScfUs8WOjJcM2SN+uR3ukjVt+BXUD9tMoRKKjw@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <f71d30b0-6ec9-2b40-468d-1e9904b02f79@redhat.com>
Date: Fri, 19 Aug 2016 12:05:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-_hc71ScfUs8WOjJcM2SN+uR3ukjVt+BXUD9tMoRKKjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 19 Aug 2016 17:05:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V1 1/1] arm64: Add an option to
 turn on/off host-backed vPMU support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FBc3I7S0QSIk



On 08/15/2016 11:13 AM, Peter Maydell wrote:
<snip>
>>  static inline int arm_feature(CPUARMState *env, int feature)
>> diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
>> index 1635deb..19e8127 100644
>> --- a/target-arm/cpu64.c
>> +++ b/target-arm/cpu64.c
>> @@ -111,6 +111,9 @@ static void aarch64_a57_initfn(Object *obj)
>>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>>      set_feature(&cpu->env, ARM_FEATURE_CRC);
>>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>> +    if (kvm_enabled()) {
>> +        set_feature(&cpu->env, ARM_FEATURE_HOST_PMU);
>> +    }
>>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
>>      cpu->midr = 0x411fd070;
>>      cpu->revidr = 0x00000000;
>> @@ -166,6 +169,9 @@ static void aarch64_a53_initfn(Object *obj)
>>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>>      set_feature(&cpu->env, ARM_FEATURE_CRC);
>>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>> +    if (kvm_enabled()) {
>> +        set_feature(&cpu->env, ARM_FEATURE_HOST_PMU);
>> +    }
> 
> This definitely looks like the wrong place to be checking
> kvm_enabled().

If we don't want to check kvm_enabled() in aarch64_a5x_initfn(), one
viable place is to move it up to cpu.c file, like in
arm_cpu_realizefn(). Do you have any other suggestions?

> 
>>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
>>      cpu->midr = 0x410fd034;
>>      cpu->revidr = 0x00000000;
