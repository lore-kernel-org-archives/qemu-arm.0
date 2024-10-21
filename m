Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2119658njb;
        Sun, 20 Oct 2024 19:34:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXh21CUebSmFs+NmkrhNYehlK4Is+EoGKir6waUitYnOqQfzNgRwV9TMnyPjWm0vV5PBvKy67LwQSrOQ==@linaro.org
X-Received: by 2002:a17:903:1c2:b0:20c:cd14:a7f3 with SMTP id d9443c01a7336-20e5a79f985mr135945475ad.22.1729478051782;
        Sun, 20 Oct 2024 19:34:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729478051; cv=none;
        d=google.com; s=arc-20240605;
        b=OzfI8i5AUfZJJanQV+PmC9y1QLTmBDJGVe+pUZ+qAxkgQ4M+G6uJ3kDHMJGjWv53eh
         da/jzBpkMWOjVu53QlHHZdxxeQ7KW9AXD6H5E6wz6pFs7ocuQG2Q5gy6rAPwWoYiyxiT
         Qa7ey6kVkPmCYwj2gw1TPhAETSb7fshkL+lHV9zl7/6aQgYw5MJIB9EbbrDP2Pw0DKCD
         ytPNVUmC/ss0gClA/iUyCNz9fvYRna8j+fG/J52lgy2MSqDgx2fpkPblmwsxrUXhPMex
         4or8jCu1enpJ3SuXlHp0NQqprUFl0kRiMSUvyI9V7wnJdEqFo0yWnVEoq8A6dalop9tg
         lLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4491m1flSoPK/UGzXgUFXmWFDkLb02T71tws0DrSeUQ=;
        fh=HvW9nig9ZLLbjMgOzFj6CFJAtMAC4fbFuIeFQ8enBQ0=;
        b=MKxefJkpyYzO3jHFXZiNijfDOMf42I3tJ3lpNKq556s2WW6/prhgugXJCRRrII94+j
         i70oi39oDsf2n1uHfAq2XsqMS5grJwfO2R91Yqkf+q0VdIWs+ZghLOsf71ikCIkog28Z
         BwcWXyGaXrD0Qp8Tx6crfKECxUINPZ2VF3V8/u8Ik/p6V4RD8jE/8VNnzPvjwhEoSgdd
         8rx4kAbQ8h7LnbJ3cV3oW+RQiYF2BOvCpSCFyZ6oDU3+lWbv0CAAfxauDBrcx7NlF8r/
         QA0Fc7aUFSVut9aqHRA31rQQ+B14tDE37L+MNrJZC+mflAtFEtjFDp0Zgjm9IommpLl1
         kjpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U8q2lbo2;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20e7f0f1049sor11117735ad.11.2024.10.20.19.34.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 20 Oct 2024 19:34:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U8q2lbo2;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729478051; x=1730082851; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4491m1flSoPK/UGzXgUFXmWFDkLb02T71tws0DrSeUQ=;
        b=U8q2lbo2uB6y2PnVfU2WcABg7SALG6/VaUgrsZ59Qv0XLtZ0+4LQE4b1ZK1LREdqlW
         LACQN6WoFAKIvGY2fVO4SCyBbMDYH5GqNo4kGdu2R1GIKNqh6FIZIT+Jm3q4M4xaf/Cf
         J8yV8bimP/lyVGrOLWKKkAw1oQDjyChHOHJH2qBXAWHZ9k9pTunkn66y0Du8wesimAB0
         WGDm8kSbFHss+r+XTxSyZk2+2Sz470dAZT4eRTi62gWHe/TIFvEbUSkTl8/FBpGtu4EO
         uDTiN9Ck7SNKlC9MZHzg9yvYlRxFEGwg0E8ldrYsdWwl3KeMDkiZAgqMavzcKEOMjWbQ
         CIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729478051; x=1730082851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4491m1flSoPK/UGzXgUFXmWFDkLb02T71tws0DrSeUQ=;
        b=JdAXFIptfWuIOND8oG6EbeyjbklWNv43Tghb3bn1sAvV1UrPzmtDap9bfIFZNsWcOj
         z7FYzOId6uUi941rqx2fn5xVJgmwmFpgWMX5gYpj8vR6JBK31mU+LA70FeCTb5v/H6lY
         e4sFhq5uGA7tt78wZErQxzzorN5nNLzHmwYeb4aAQzDM7kWTyYNC0yBmqC/Gn955g1km
         lhLUklOrUk+ac6P5xzWNxe5AcH73Ij7WSsYc3Oak7kGX8bAbsaE9D9qI6mczzN0DlB07
         jaZDU0fU6E4cl9JbdzAfRg7OeOunNUgzVzieX0O81cM8beBEghz9iPHYvxY4DT7ROh12
         5NkA==
X-Forwarded-Encrypted: i=1; AJvYcCVmnBGY7aRYg11wkwTn0vdzgtkr5NbjTIEaPE925bsanZB8h/Ud7qONT+19Nn7gUfcBMXym1wEiLWbxvQ==@linaro.org
X-Gm-Message-State: AOJu0Yy2Eq4t13SvDavFvQ7BwJZnqpSYDFLawhCkcdBBd1Vjxc52CruA
	BDbcNAdpVhPosfjefzVaX515e85oqi9dXZYxQ89XLMzSsvx6c4LxZqsyraR/qcvYbx6QWoV8TL4
	++7BDDA==
X-Google-Smtp-Source: AGHT+IFtm1mShQvC9KuvEbIZnRt7374CZIAKFOhFvl7LIqOSaL1Sy/MomYKV91jo5dcpa9+B8XEokA==
X-Received: by 2002:a17:902:f0cc:b0:20c:5983:888b with SMTP id d9443c01a7336-20e5a94e8c6mr94003655ad.54.1729478051092;
        Sun, 20 Oct 2024 19:34:11 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([187.121.94.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef08d29sm16049405ad.64.2024.10.20.19.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 19:34:10 -0700 (PDT)
Message-ID: <acd27416-e612-48c1-b2f4-c6157d710bb3@linaro.org>
Date: Sun, 20 Oct 2024 23:33:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 0/4] Arch agnostic ACPI changes to support vCPU Hotplug
 (on Archs like ARM)
To: Igor Mammedov <imammedo@redhat.com>, Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, andrew.jones@linux.dev, david@redhat.com,
 philmd@linaro.org, eric.auger@redhat.com, will@kernel.org, ardb@kernel.org,
 oliver.upton@linux.dev, pbonzini@redhat.com, gshan@redhat.com,
 rafael@kernel.org, borntraeger@linux.ibm.com, alex.bennee@linaro.org,
 npiggin@gmail.com, harshpb@linux.ibm.com, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, shahuang@redhat.com,
 zhao1.liu@intel.com, linuxarm@huawei.com
References: <20241014192205.253479-1-salil.mehta@huawei.com>
 <20241018164629.2939b711@imammedo.users.ipa.redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20241018164629.2939b711@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MZc7Yy4C8rou

Hi Igor,

On 10/18/24 11:46, Igor Mammedov wrote:
> On Mon, 14 Oct 2024 20:22:01 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
> 
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
> 
> the series is peppered with *simulated* idea, which after looking at code
> I read as 'fake'. While it's obvious to author why things need to be faked
> at this time, it will be forgotten later on. And cause a lot swearing from
> whoever will have to deal with this code down the road.
> 
> Salil, I'm sorry that review comes out as mostly negative but for me having to
> repeat 'simulated' some many times, hints that the there is
> something wrong with design and that we should re-evaluate the approach.

I think 'simulated' was indeed a badly chosen name because the series,
as read it, is merely saving the hotplugged/unplugged vCPU states to the
ACPI for persistence and later restoration, so I think s/simulated/saved/ is
reasonable here, i.e., ACPI now reflects the vCPU states after hotplug/unplug.
QEMU manipulates the ACPI tables and methods to reflect the machine config.
and this series is essentially doing the same. Why that's not ok?


Cheers,
Gustavo

> ps:
> see comments on 1/4 for suggestions
> 
> 
>> This patch set introduces the following features:
>>
>> 1. ACPI Interface with Explicit PRESENT and ENABLED CPU States: It allows the
>>     guest kernel to evaluate these states using the `_STA` ACPI method.
>>     
>> 2. Initialization of ACPI CPU States: These states are initialized during
>>     `machvirt_init` and when vCPUs are hot-(un)plugged. This enables hotpluggable
>>     vCPUs to be exposed to the guest kernel via ACPI.
>>
>> 3. Support for Migrating ACPI CPU States: The patch set ensures the migration of
>>     the newly introduced `is_{present,enabled}` ACPI CPU states to the
>>     destination VM.
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
>>      architectures that don’t Support CPU Hotplug (like ARM64)
>>      a. Kernel Link: https://kvm-forum.qemu.org/2023/KVM-forum-cpu-hotplug_7OJ1YyJ.pdf
>>      b. Qemu Link:  https://kvm-forum.qemu.org/2023/Challenges_Revisited_in_Supporting_Virt_CPU_Hotplug_-__ii0iNb3.pdf
>> [2] KVMForum 2020 Presentation: Challenges in Supporting Virtual CPU Hotplug on
>>      SoC Based Systems (like ARM64)
>>      Link: https://kvmforum2020.sched.com/event/eE4m
>> [3] Check comment 5 in the bugzilla entry
>>      Link: https://bugzilla.tianocore.org/show_bug.cgi?id=4481#c5
>> [4] [PATCH RFC V4 00/33] Support of Virtual CPU Hotplug for ARMv8 Arch
>>      Link: https://lore.kernel.org/qemu-devel/20241009031815.250096-1-salil.mehta@huawei.com/T/#mf32be203baa568a871dc625b732f666a4c4f1e68
>> [5] Architecture agnostic ACPI VMSD state migration (Discussion)
>>      Link: https://lore.kernel.org/qemu-devel/20240715155436.577d34c5@imammedo.users.ipa.redhat.com/
>> [6] Upcoming RFC V5, Support of Virtual CPU Hotplug for ARMv8 Arch
>>      Link: https://github.com/salil-mehta/qemu/commits/virt-cpuhp-armv8/rfc-v5
>>
>> Salil Mehta (4):
>>    hw/acpi: Initialize ACPI Hotplug CPU Status with Support for vCPU
>>      `Persistence`
>>    hw/acpi: Update ACPI CPU Status `is_{present, enabled}` during vCPU
>>      hot(un)plug
>>    hw/acpi: Reflect ACPI vCPU {present,enabled} states in ACPI
>>      _STA.{PRES,ENA} Bits
>>    hw/acpi: Populate vCPU Hotplug VMSD to migrate `is_{present,enabled}`
>>      states
>>
>>   cpu-target.c         patches.vcpuhp.rfc-v5.arch.agnostic.acpi          |  1 +
>>   hw/acpi/cpu.c                  | 70 +++++++++++++++++++++++++++++++---
>>   hw/acpi/generic_event_device.c | 11 ++++++
>>   include/hw/acpi/cpu.h          | 21 ++++++++++
>>   include/hw/core/cpu.h          | 21 ++++++++++
>>   5 files changed, 119 insertions(+), 5 deletions(-)
>>
> 
