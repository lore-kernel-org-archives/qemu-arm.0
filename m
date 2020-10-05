Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4210552lfq;
        Mon, 5 Oct 2020 10:19:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwk+hCBBD5bepD/OdA5KkhDlv7yluCTcL35RzeWiQE6ihC16BJ5JeI50X57OpP+qVJJKsBt
X-Received: by 2002:a5b:d46:: with SMTP id f6mr1344970ybr.146.1601918397591;
        Mon, 05 Oct 2020 10:19:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601918397; cv=none;
        d=google.com; s=arc-20160816;
        b=K4MPDKKpEIpH0gNOz3WVWPxQJhQLhJSEIWR7IwR/TqySXQSYenUk7+MyhkA+duS7id
         J/zF0ejfGVu6bV4pfv+IXxWq3M7ne7WSuVdeRa4ueP90vMS2i9Dx5+0aWPaBSt86pASq
         XeI1GuuoYJA1rva/4raZ6W7uJVIZChCzbNMqMqOll0rzWPjefhwMviXZDxVASMTqM2sz
         U/vpdt2er/mDzkJ5MJ1P7T8ORmTRsTrgeVlPo3ANjewM2zTPr5HgMEJ/FfC69VqYeo2d
         U5xUNTV8cpSSh56lyvB6JEKAmd/Ft6zGbRy3SQFg7E8K7Xt3LuCr3Mds4BRFpunMdwHR
         kXTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hEYxtkF9k8vEKpTtFSpwlYRzQgBV94tZn+kfekFSemQ=;
        b=k2o+IDL5N2XYke+lrpYBnOtt9pP44IJBmV7V1CnjpZHzVQy8PL56Mh5W8vTp5tKc16
         /AUcdDYPFSIEC57Z2rE0b2FqBS9i4uzmH+jJyPiPtjbxLGtmBQAW3FXzkyw94O4hxwaf
         osEu9AXNHLvkkw70Oo7xRVEzG6zZxrh9ipHaXVyp/QG6ly0j3RAmk8cQX5G8ifTgUQ4l
         K7KJjXKAGWYB+T9vUJqESfx2rX+yEf3DDORqVk+494PJTg/6+odr7d6ZhHr7LsXq8bMj
         XowyWnaPt7GQoDb8S935q0TZbjv33fNdd+qoceS5svq+to0w2cKVfQENx1+k37wGFz7F
         7maA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JtUqHArH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si578982ybt.105.2020.10.05.10.19.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Oct 2020 10:19:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JtUqHArH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kPU9U-0001zR-Tc
	for alex.bennee@linaro.org; Mon, 05 Oct 2020 13:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kPU9D-0001yG-5B; Mon, 05 Oct 2020 13:19:39 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kPU9B-0004um-EU; Mon, 05 Oct 2020 13:19:38 -0400
Received: by mail-wr1-x444.google.com with SMTP id m6so10520173wrn.0;
 Mon, 05 Oct 2020 10:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hEYxtkF9k8vEKpTtFSpwlYRzQgBV94tZn+kfekFSemQ=;
 b=JtUqHArHUPLEAaTQZkEKJNa6nDSxggvXSTLiSmYbNhEqmCgKozG+s1whuvDAUwaHoz
 /fTKRIYrlLNYQWGN+lLmkjT0Utb7vCqiIDrlO6xM0pYJ5ixTV1mGKqksrY1bfhvj2M1Y
 BS8qEyXrmlqVM7RRbgqXDnhnningIs3HJx6jBhoQG89CiGcDRu7c18/tZgXN9nJ318sU
 tRekKxj2jPycXuenwlnNGzZELeiWY6VbHuwDOqizbmg3NCvD/NPiZN7rsYteY/zQTQS4
 J1+TISUNLiMyEM9NlEHum3RTA4NMtJYa4QtNnFSkH5G9mFIrONEvOZx8SKHfMnoStjJB
 rEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hEYxtkF9k8vEKpTtFSpwlYRzQgBV94tZn+kfekFSemQ=;
 b=QlNaDs7v0zrQjYbDebrJDPuyyonMCa8Zqt3x0kd0hxddKXG3t/+YYsKdtC/JWk03cJ
 Sdq38gLDvzn814Gxuf4QWgWYhckLcKpMGje7+9u+sz71zFQRpbDPwj4HoC+ve3a36d1Z
 Wnojllz7fm6oTkXr+j4XSB/fe7I01qWa/zwO/UMajBuMuxDc6iwMy6K7POFCSQYIkJF6
 AbbGCwEa6xIc+KrB/PJapauh+vE6BlBk3ps0EDmWPeL1IdX3WJ0KIIB0AeTJFpJ2fplA
 lP7PdTpKtKZxTjID36jvozh8Kl1mjM8rAFtXRHqg4Em6qWTDBhjo+i6VbMFgZa38m4XJ
 uxAg==
X-Gm-Message-State: AOAM532xthVQwuwjRLbICoDYBaLA041CRVYRWT4AQRgOtWeSbaJtulH0
 zoHVZFzf8QT+YDVClEnJWss=
X-Received: by 2002:adf:f4c6:: with SMTP id h6mr438819wrp.310.1601918374600;
 Mon, 05 Oct 2020 10:19:34 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id g14sm752398wrv.25.2020.10.05.10.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 10:19:33 -0700 (PDT)
Subject: Re: [PATCH 01/16] hw/core/cpu: Let CPU object have a clock source
To: Igor Mammedov <imammedo@redhat.com>
References: <20200928171539.788309-1-f4bug@amsat.org>
 <20200928171539.788309-2-f4bug@amsat.org>
 <20200930094313.1120a040@redhat.com>
 <da7248f7-5098-188b-d274-e122c87bb498@amsat.org>
 <20201005184009.493629b0@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6f6ae858-6c73-a9bf-c0fa-4d40ebc5c4d4@amsat.org>
Date: Mon, 5 Oct 2020 19:19:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201005184009.493629b0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Burton <paulburton@kernel.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NGghfQKlZvT8

On 10/5/20 6:40 PM, Igor Mammedov wrote:
> On Wed, 30 Sep 2020 12:16:53 +0200
> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> 
>> +arm/ppc/riscv folks
>>
>> On 9/30/20 9:43 AM, Igor Mammedov wrote:
>>> On Mon, 28 Sep 2020 19:15:24 +0200
>>> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>   
>>>> Let CPUState have a clock source (named 'clk') and CPUClass
>>>> have a clock_update() callback. The clock can be optionally
>>>> set Using qdev_connect_clock_in() from the Clock API.
>>>> If the clock changes, the optional clock_update() will be
>>>> called.  
>>>
>>> the sole user of it is mips cpu, so question is why
>>> you are making it part of generic CPUm instead of
>>> MIPSCPUClass/MIPSCPU?  
>>
>> This is a feature of the CPU, regardless its architecture.
>>
>> I expect the other archs to start using it soon.
> 
> if there aren't any plans to actually to do that,
> I'd keep it to MIPS class and generalize later when there is demand.

OK will update the patch.

>  
>>
>>>   
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>  include/hw/core/cpu.h |  5 +++++
>>>>  hw/core/cpu.c         | 12 ++++++++++++
>>>>  2 files changed, 17 insertions(+)
>>>>
>>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>>> index 6c34798c8b3..6989d90c193 100644
>>>> --- a/include/hw/core/cpu.h
>>>> +++ b/include/hw/core/cpu.h
>>>> @@ -31,6 +31,7 @@
>>>>  #include "qemu/thread.h"
>>>>  #include "qemu/plugin.h"
>>>>  #include "qom/object.h"
>>>> +#include "hw/clock.h"
>>>>  
>>>>  typedef int (*WriteCoreDumpFunction)(const void *buf, size_t size,
>>>>                                       void *opaque);
>>>> @@ -155,6 +156,7 @@ struct TranslationBlock;
>>>>   * @disas_set_info: Setup architecture specific components of disassembly info
>>>>   * @adjust_watchpoint_address: Perform a target-specific adjustment to an
>>>>   * address before attempting to match it against watchpoints.
>>>> + * @clock_update: Callback for input clock changes
>>>>   *
>>>>   * Represents a CPU family or model.
>>>>   */
>>>> @@ -176,6 +178,7 @@ struct CPUClass {
>>>>                                    unsigned size, MMUAccessType access_type,
>>>>                                    int mmu_idx, MemTxAttrs attrs,
>>>>                                    MemTxResult response, uintptr_t retaddr);
>>>> +    void (*clock_update)(CPUState *cpu);
>>>>      bool (*virtio_is_big_endian)(CPUState *cpu);
>>>>      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
>>>>                             uint8_t *buf, int len, bool is_write);
>>>> @@ -316,6 +319,7 @@ struct qemu_work_item;
>>>>   *   QOM parent.
>>>>   * @nr_cores: Number of cores within this CPU package.
>>>>   * @nr_threads: Number of threads within this CPU.
>>>> + * @clock: this CPU source clock (an output clock of another device)
>>>>   * @running: #true if CPU is currently running (lockless).
>>>>   * @has_waiter: #true if a CPU is currently waiting for the cpu_exec_end;
>>>>   * valid under cpu_list_lock.
>>>> @@ -400,6 +404,7 @@ struct CPUState {
>>>>      int num_ases;
>>>>      AddressSpace *as;
>>>>      MemoryRegion *memory;
>>>> +    Clock *clock;
>>>>  
>>>>      void *env_ptr; /* CPUArchState */
>>>>      IcountDecr *icount_decr_ptr;
>>>> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
>>>> index c55c09f734c..37fcff3ec64 100644
>>>> --- a/hw/core/cpu.c
>>>> +++ b/hw/core/cpu.c
>>>> @@ -30,6 +30,7 @@
>>>>  #include "qemu/qemu-print.h"
>>>>  #include "sysemu/tcg.h"
>>>>  #include "hw/boards.h"
>>>> +#include "hw/qdev-clock.h"
>>>>  #include "hw/qdev-properties.h"
>>>>  #include "trace/trace-root.h"
>>>>  #include "qemu/plugin.h"
>>>> @@ -247,6 +248,16 @@ void cpu_reset(CPUState *cpu)
>>>>      trace_guest_cpu_reset(cpu);
>>>>  }
>>>>  
>>>> +static void cpu_clk_update(void *opaque)
>>>> +{
>>>> +    CPUState *cpu = opaque;
>>>> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>>>> +
>>>> +    if (cc->clock_update) {
>>>> +        cc->clock_update(cpu);
>>>> +    }
>>>> +}
>>>> +
>>>>  static void cpu_common_reset(DeviceState *dev)
>>>>  {
>>>>      CPUState *cpu = CPU(dev);
>>>> @@ -367,6 +378,7 @@ static void cpu_common_initfn(Object *obj)
>>>>      /* the default value is changed by qemu_init_vcpu() for softmmu */
>>>>      cpu->nr_cores = 1;
>>>>      cpu->nr_threads = 1;
>>>> +    cpu->clock = qdev_init_clock_in(DEVICE(obj), "clk", cpu_clk_update, cpu);
>>>>  
>>>>      qemu_mutex_init(&cpu->work_mutex);
>>>>      QSIMPLEQ_INIT(&cpu->work_list);  
>>>   
>>
> 
