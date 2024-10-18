Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp978435njb;
        Fri, 18 Oct 2024 10:57:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrRaG/lkD5bw/ThSdj8cWu3y/wQoCClJ3SC6Ipg635bDNkOqnT+zRwny7xEmIiKYkLjguO12DagbsLDw==@linaro.org
X-Received: by 2002:a05:6a21:4d81:b0:1d9:2614:386c with SMTP id adf61e73a8af0-1d92c576f87mr4294169637.33.1729274253009;
        Fri, 18 Oct 2024 10:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729274252; cv=none;
        d=google.com; s=arc-20240605;
        b=IY4CXx8xDGFb7wcJdrlG+4uAdJVdKosYxRrLHP0qbDYSCV4VxdVXaq8uPU9HV7NDJG
         XYM3MCc2UTUrf5g6TUqd96es3otc+BpOhx7RumJVIzpDxJjKzlWkhjlAQS5uDDzPcNql
         H8OK4oAFark4z3FkvSgJUBbEVdIDEhXgotGTunw5dYiEGFszZS2ivDWlb96jT+rGpqbG
         vk0rJy1KRrllmqDLHNhhm9EIAJU3uVTwznRJf3PNbspzIcQbU5oDmWIwxls5Vfk03gH/
         Zexb81tB0OP7XqmJniuq8nMO3fqEqPpDIdhxCZc0U0sU3IdDLIlfs+kUU8mQPXZslKKo
         uQPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=37YAwA6jmj5B2ksCnI6JguhoKlr/zVOd2wFRbZXqFR8=;
        fh=VzeLAnEPhwrKl0U0Xvd2hJoYdVHuEAiMYxN52i2F+HY=;
        b=KPFXeX7pIvPLITqX6ORupIbY03wDeGvdvH+LRG/uD8c1miWxqE46qgya4J7q0pPZSY
         Iqtv3r0m8y4r9E7DBhSdlJasa/zXWxcWbCv4CHuG4k2M7GQ/LxtX7HhhMJyK9rljt0vu
         7gVfaASoSkJiCVErA0WUdsgeq+sqzJjhEUB1grEarY4MtdYFzijuoYo/iMQZWZYJcZ2y
         j57pm0pczwXAR6hKKVbFoKLUoanKs9y53iZEuCG+EpV6ojaQcUU5hEk4CugQ7afOS2II
         2/cAnM561WqpJHHaZi0bcGuKwy0Gf7bnszu8aZjKwwWmrXwVxD3fOBaPUZOedPFN30MC
         fqEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uuX+4/0D";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7eacbf390absor874325a12.0.2024.10.18.10.57.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 18 Oct 2024 10:57:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uuX+4/0D";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729274252; x=1729879052; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=37YAwA6jmj5B2ksCnI6JguhoKlr/zVOd2wFRbZXqFR8=;
        b=uuX+4/0DfBcapDGPq3uGc4r/e/Qjf0PTd8t4O7954uPmK9wEkKjsSFITieNDA7fYsG
         ThHuB/IK3kj9M4BhLyxs6Oa6xOUlHjQp75U3LRBXN1/KhB7TI3t27gA540ycf4a9qQKV
         9i2fpqojZMqgXwz5cX8qMsxy2dEjSEW1IdtkEaetfV/hwLiZ9a6l6KhJulJP9b59Hq0K
         Q6sQlQhu+Q0UGsNPb6m8XpQwFrOJOdnDPKfNrNNTQaQ2Y/jr+S7Wx0P/lBgjpXuBZBB/
         mf7GUaEenIFYEEXzjsC+96hblY9t72E56Sz6fCSwJ3A0pZX68Uv/ESWECHOPHXaZUv03
         TwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729274252; x=1729879052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37YAwA6jmj5B2ksCnI6JguhoKlr/zVOd2wFRbZXqFR8=;
        b=XGMyunCSszm1UTvoR5nzFLmNiOyHlZbZbHsl56//MKdglM3WYNeskkSxpuPKko2dVK
         a7maipQVvwA6S1s6Ldb4yKycUcwzcm6q0zgbXyPH3brt3wjdqPu+HWonvXigfjYJrGPf
         3Qfd6SYWBRvI5LoNXE5qutgltc8wIO+vR444DWfqMg6dGtZ0ek2pHmztVDAPNikSjMmb
         /xblBKYyvK4Gr6vkS8dgK9vaGkZ1Cgz2rtImrJd6VUhWQOSMly9OB+bDHbGXfYGXmp2V
         aTDnCcyhjZWXo6Xlh94+lL9yCFAhguBUPfODKY1bFHSQ1/P4yhyr4DJybHJTC3lypVKf
         OTfg==
X-Forwarded-Encrypted: i=1; AJvYcCVrWbzVZqm1XU1M5NoQevH1t7gWWw5fCgWwHPvoumi6zXHiSHtlh8/APbRNVE0gRi4gGm/Im2SVS8wdRw==@linaro.org
X-Gm-Message-State: AOJu0YyKfCpDN/0aNcjwm+RZLU5qDBiYNAfMIkWgKiIjZzDN3pYrzJDt
	wH1Y/PjWjukhwkTYFsPqEouoHUSzuaiYWIfUYpUS5ODv39uByiQCm6H8kplSH7i1Wg==
X-Google-Smtp-Source: AGHT+IH33XdDRgvGEdS9BK/E1OP1krwEuFUk8/wehx7C7xji3uWrQJwxGpPxthGlv69cnw1F2MSPgQ==
X-Received: by 2002:a05:6a20:e605:b0:1d9:a94:8d90 with SMTP id adf61e73a8af0-1d92c51fb44mr3903646637.27.1729274251020;
        Fri, 18 Oct 2024 10:57:31 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([187.121.94.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eacc29c736sm1641743a12.88.2024.10.18.10.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 10:57:30 -0700 (PDT)
Message-ID: <b2593ab0-f5b2-46fe-8a8c-3725598a6ae1@linaro.org>
Date: Fri, 18 Oct 2024 14:57:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 0/4] Arch agnostic ACPI changes to support vCPU Hotplug
 (on Archs like ARM)
To: Miguel Luis <miguel.luis@oracle.com>, Salil Mehta <salil.mehta@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "david@redhat.com" <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
 <rafael@kernel.org>, "borntraeger@linux.ibm.com"
 <borntraeger@linux.ibm.com>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>, "npiggin@gmail.com" <npiggin@gmail.com>,
 "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 Karl Heubaum <karl.heubaum@oracle.com>,
 "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
 "zhukeqian1@huawei.com" <zhukeqian1@huawei.com>,
 "wangxiongfeng2@huawei.com" <wangxiongfeng2@huawei.com>,
 "wangyanan55@huawei.com" <wangyanan55@huawei.com>,
 "jiakernel2@gmail.com" <jiakernel2@gmail.com>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>,
 "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
 "shahuang@redhat.com" <shahuang@redhat.com>,
 "zhao1.liu@intel.com" <zhao1.liu@intel.com>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>
References: <20241014192205.253479-1-salil.mehta@huawei.com>
 <B1CFD37B-3422-4766-A5EE-64D000FDEC2B@oracle.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <B1CFD37B-3422-4766-A5EE-64D000FDEC2B@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tj9rYGcK17TY

Hi Miguel,

On 10/15/24 15:41, Miguel Luis wrote:
> Hi Salil,
> 
> I’ve ran the usual tests successfully of hotplug/unplug from the number of cold-booted cpus up to maxcpus and migration on ARM. Please feel free to add:

Do you mind sharing what cpus you used for your tests?

Did you use tcg or kvm for the tests?

Thanks!


Cheers,
Gustavo
  
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> 
> Thanks
> Miguel
> 
>> On 14 Oct 2024, at 19:22, Salil Mehta <salil.mehta@huawei.com> wrote:
>>
>> Certain CPU architecture specifications [1][2][3] prohibit changes to the CPUs
>> *presence* after the kernel has booted. This is because many system
>> initializations depend on the exact CPU count at boot time and do not expect it
>> to change afterward. For example, components like interrupt controllers that are
>> closely coupled with CPUs, or various per-CPU features, may not support
>> configuration changes once the kernel has been initialized.
>>
>> This requirement poses a challenge for virtualization features like vCPU
>> hotplug. To address this, changes to the ACPI AML are necessary to update the
>> `_STA.PRES` (presence) and `_STA.ENA` (enabled) bits accordingly during guest
>> initialization, as well as when vCPUs are hot-plugged or hot-unplugged. The
>> presence of unplugged vCPUs may need to be deliberately *simulated* at the ACPI
>> level to maintain a *persistent* view of vCPUs for the guest kernel.
>>
>> This patch set introduces the following features:
>>
>> 1. ACPI Interface with Explicit PRESENT and ENABLED CPU States: It allows the
>>    guest kernel to evaluate these states using the `_STA` ACPI method.
>>
>> 2. Initialization of ACPI CPU States: These states are initialized during
>>    `machvirt_init` and when vCPUs are hot-(un)plugged. This enables hotpluggable
>>    vCPUs to be exposed to the guest kernel via ACPI.
>>
>> 3. Support for Migrating ACPI CPU States: The patch set ensures the migration of
>>    the newly introduced `is_{present,enabled}` ACPI CPU states to the
>>    destination VM.
>>
>> The approach is flexible enough to accommodate ARM-like architectures that
>> intend to implement vCPU hotplug functionality. It is suitable for architectures
>> facing similar constraints to ARM or those that plan to implement vCPU
>> hotplugging independently of hardware support (if available).
>>
>> This patch set is derived from the ARM-specific vCPU hotplug implementation [4]
>> and includes migration components adaptable to other architectures, following
>> suggestions [5] made by Igor Mammedov <imammedo@redhat.com>.
>>
>> It can be applied independently, ensuring compatibility with existing hotplug
>> support in other architectures. I have tested this patch set in conjunction with
>> the ARM-specific vCPU hotplug changes (included in the upcoming RFC V5 [6]), and
>> everything worked as expected. I kindly request maintainers of other
>> architectures to provide a "Tested-by" after running their respective regression
>> tests.
>>
>> Many thanks!
>>
>>
>> References:
>> [1] KVMForum 2023 Presentation: Challenges Revisited in Supporting Virt CPU Hotplug on
>>     architectures that don’t Support CPU Hotplug (like ARM64)
>>     a. Kernel Link: https://kvm-forum.qemu.org/2023/KVM-forum-cpu-hotplug_7OJ1YyJ.pdf
>>     b. Qemu Link:  https://kvm-forum.qemu.org/2023/Challenges_Revisited_in_Supporting_Virt_CPU_Hotplug_-__ii0iNb3.pdf
>> [2] KVMForum 2020 Presentation: Challenges in Supporting Virtual CPU Hotplug on
>>     SoC Based Systems (like ARM64)
>>     Link: https://kvmforum2020.sched.com/event/eE4m
>> [3] Check comment 5 in the bugzilla entry
>>     Link: https://bugzilla.tianocore.org/show_bug.cgi?id=4481#c5
>> [4] [PATCH RFC V4 00/33] Support of Virtual CPU Hotplug for ARMv8 Arch
>>     Link: https://lore.kernel.org/qemu-devel/20241009031815.250096-1-salil.mehta@huawei.com/T/#mf32be203baa568a871dc625b732f666a4c4f1e68
>> [5] Architecture agnostic ACPI VMSD state migration (Discussion)
>>     Link: https://lore.kernel.org/qemu-devel/20240715155436.577d34c5@imammedo.users.ipa.redhat.com/
>> [6] Upcoming RFC V5, Support of Virtual CPU Hotplug for ARMv8 Arch
>>     Link: https://github.com/salil-mehta/qemu/commits/virt-cpuhp-armv8/rfc-v5
>>
>> Salil Mehta (4):
>>   hw/acpi: Initialize ACPI Hotplug CPU Status with Support for vCPU
>>     `Persistence`
>>   hw/acpi: Update ACPI CPU Status `is_{present, enabled}` during vCPU
>>     hot(un)plug
>>   hw/acpi: Reflect ACPI vCPU {present,enabled} states in ACPI
>>     _STA.{PRES,ENA} Bits
>>   hw/acpi: Populate vCPU Hotplug VMSD to migrate `is_{present,enabled}`
>>     states
>>
>> cpu-target.c         patches.vcpuhp.rfc-v5.arch.agnostic.acpi          |  1 +
>> hw/acpi/cpu.c                  | 70 +++++++++++++++++++++++++++++++---
>> hw/acpi/generic_event_device.c | 11 ++++++
>> include/hw/acpi/cpu.h          | 21 ++++++++++
>> include/hw/core/cpu.h          | 21 ++++++++++
>> 5 files changed, 119 insertions(+), 5 deletions(-)
>>
>> -- 
>> 2.34.1
>>
> 
