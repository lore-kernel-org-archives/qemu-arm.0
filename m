Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp577657ejh;
        Sat, 6 Apr 2024 19:46:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWuPWlVnv6YGawmOsSS5N5gtrgB9AqtRrRO25/lUUC4vZobggNi8Q2FTkwaQdZ49MAH/BcBBTAFdTndrWPxPTmWvGcXRCD5
X-Google-Smtp-Source: AGHT+IG02FCpUc+4Qh22pGfAHsY1k6t+FxYmBNLhSHnlInQAL4OYcBS34IILCLxixD+S5oClMx5j
X-Received: by 2002:a05:622a:2a15:b0:434:7613:569b with SMTP id hc21-20020a05622a2a1500b004347613569bmr3597999qtb.58.1712458012810;
        Sat, 06 Apr 2024 19:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712458012; cv=none;
        d=google.com; s=arc-20160816;
        b=TVOeOtHFaghDdjp7824C0P2juYoXEcJ7bH9n3OW/6heB9xhP62IFMCEV1/n3QdHdU7
         RXwwT/f7DYgtIU196ulH8p56j9+f0gBqVjDrKsCP1+addOdC8eREBEq2VWbI3tYMoQpu
         SKRv9bzxNkmPpA5jLmJhY4wGNLPH1JI5euJhvknbc8WTTO0aMms68dNDKgE4DhJN0pYh
         E9aJyc9rls3nNg5a8kBjFciJpyr7VlwRe0oX7KIJKjn2h5VhgeZYTlo5/8cHRDLCVYzK
         +7iPFelD4wMo0pfdgL4FFwmM4kjJdMWCbLMywKaI4WS+3EauIyX8hNR3MtrUCo/z9ZmL
         LHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=oIYxpLYLR+tXnkOitOZp/agYNyxmEFVE7JdW4ekhIe0=;
        fh=/MSHAyhUJiTYoT4ekOyS/HopHNLqBW111kC/699+MBU=;
        b=jUwugewpClpjQsuj/+7bVnZUKw51KSzbjVBihV1K+PCK2fZ6hziLPPvlEMamCb70Qt
         HDW+D61gkml3ReuUR7Wqc0+0dp/KCRkceryfkGSXFhrq6WZUp/tDn3Acd3u5ohClDP82
         k8B3LmJKm+kKXDndneUvTSznsMNJFCGZpQRT3Fykt4L8vDYiuhpSt9HabnpUMBvp3hCB
         WrLMcEvkQGsw+XICUF7PieA66SmDJG1qW385UjlfK/HRQsB36kbYKyyjo2L7z1TCXJwd
         +AQVfieVj92+Tzz765UR1XxmBV1erKHAeFi9G4qOZjej7Bl6gVy8t+lf08p+aan8u9ZV
         B0rA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n21-20020a05622a11d500b0043476f3eed7si2187921qtk.669.2024.04.06.19.46.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Apr 2024 19:46:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rtIY6-0005ed-E9; Sat, 06 Apr 2024 22:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtIY5-0005eD-68; Sat, 06 Apr 2024 22:46:25 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtIY2-0002Hl-Io; Sat, 06 Apr 2024 22:46:24 -0400
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VBxNd2143zwRNQ;
 Sun,  7 Apr 2024 10:43:13 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 21CF314037B;
 Sun,  7 Apr 2024 10:46:05 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 7 Apr 2024 10:46:04 +0800
Message-ID: <028f285f-2bf7-c8cb-820c-ba1fd7ee7c9d@huawei.com>
Date: Sun, 7 Apr 2024 10:46:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v12 10/23] hw/arm/virt: Wire NMI and VINMI irq lines from
 GIC to CPU
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, 
 <wangyanan55@huawei.com>, <richard.henderson@linaro.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
 <20240403101611.3204086-11-ruanjinjie@huawei.com>
 <CAFEAcA8ESSRQtemj7xefeb8Fp0__EEiJh2FamGy7w7_iTpyf4A@mail.gmail.com>
In-Reply-To: <CAFEAcA8ESSRQtemj7xefeb8Fp0__EEiJh2FamGy7w7_iTpyf4A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.458,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eM28kEDB3yjR



On 2024/4/4 22:47, Peter Maydell wrote:
> On Wed, 3 Apr 2024 at 11:18, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>>
>> Wire the new NMI and VINMI interrupt line from the GIC to each CPU.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> v9:
>> - Rename ARM_CPU_VNMI to ARM_CPU_VINMI.
>> - Update the commit message.
>> v4:
>> - Add Reviewed-by.
>> v3:
>> - Also add VNMI wire.
>> ---
>>  hw/arm/virt.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index a9a913aead..ef2e6c2c4d 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -821,7 +821,8 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
>>
>>      /* Wire the outputs from each CPU's generic timer and the GICv3
>>       * maintenance interrupt signal to the appropriate GIC PPI inputs,
>> -     * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
>> +     * and the GIC's IRQ/FIQ/VIRQ/VFIQ/NMI/VINMI interrupt outputs to the
>> +     * CPU's inputs.
>>       */
>>      for (i = 0; i < smp_cpus; i++) {
>>          DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
>> @@ -865,6 +866,10 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
>>                             qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
>>          sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
>>                             qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
>> +        sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus,
>> +                           qdev_get_gpio_in(cpudev, ARM_CPU_NMI));
>> +        sysbus_connect_irq(gicbusdev, i + 5 * smp_cpus,
>> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VINMI));
>>      }
> 
> This patch needs to go after patch 11. Otherwise at this point
> in the patchseries we are trying to wire up GPIOs on the GIC
> which don't exist, and QEMU will assert:
> 
> $ ./build/x86/qemu-system-aarch64 -M virt,gic-version=3
> Unexpected error in object_property_find_err() at ../../qom/object.c:1366:
> qemu-system-aarch64: Property 'arm-gicv3.sysbus-irq[4]' not found
> Aborted (core dumped)
> 
> We also need to only connect these up if vms->gic_version
> is not VIRT_GIC_VERSION_2. This is because these GPIOs don't
> exist on the GICv2, and otherwise we again assert if you
> try to wire them up but you're using GICv2:
> 
> $ ./build/x86/qemu-system-aarch64 -M virt,gic-version=2
> Unexpected error in object_property_find_err() at ../../qom/object.c:1366:
> qemu-system-aarch64: Property 'arm_gic.sysbus-irq[4]' not found
> Aborted (core dumped)

Thank you! I'll fix them.

> 
> thanks
> -- PMM
