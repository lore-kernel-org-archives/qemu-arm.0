Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3968780njn;
        Thu, 16 Jan 2025 11:02:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUOxmKsAYKI5R2fZWzg6nAsdUGldqByzB6409p+slctv2No8jml1VS8GedvDCHsenDQ16GqqbotqHsvHg==@linaro.org
X-Received: by 2002:a05:6000:18a3:b0:385:f0dc:c9fd with SMTP id ffacd0b85a97d-38a8730dcf3mr7569604f8f.27.1737054143745;
        Thu, 16 Jan 2025 11:02:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737054143; cv=none;
        d=google.com; s=arc-20240605;
        b=G+YYdMc03A0XGzh/a6mXuppqCBkOORIo5d0LKKzU2XZf6pfVZihC8hRM9jZEB/lmSs
         lgaqaYzF7mppQVQlzCQ/+nSZ8bakNMew2Q20jALk5uAl/A666XKi9YZQICdEOpxAFKAq
         BV06m8Db50oBcQdqVGKvwfuaYAgxBbGQBZE26OKHPzn111D8N7SJ58PbYnYakLZ+LNKH
         GoXtq0EJVaXFS5lEWGoQcLTfarm57EsseYGMBac2f09v1y2kUF5O00i7OwWHXCGam+QF
         Lt/ICE3SU5fRHsMPlS/no4EPO4m9izSYLGQail81mILmzGgOCTTJ5wT353X1G/5rnMiZ
         8VjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fuRyw5EWWx6Yp+3IBCpdAz3q5PYO8xyuKBCIsOMef9E=;
        fh=EUAshhcvffaqXRWvAx4aUpcpvLIXpK92aLkV0wi61pU=;
        b=OaH+GRhrNzThSchA5YzGpWGgXzLPm6vpgFIHK/KCwlCzn60N/QdwGWdcqeGxyWoM/v
         GYZSfWPsR9dZOToU6Oiv5GBduZcHlwgs6BfhDdkpXhB+buynRbfp8LjnhblS7Hm0ZeYl
         87e5goof9Ls3KKOS7flBghYe0KCgCJtgFeKZCzUrg39ET4MGtMbC+6nWEhxHMy6AJt8A
         JySd74SJYYqGtUZw7nos7mijgMG3G9h1tZu6BvcNqHbR5t8CqjHXLsb/j1r5TJxpC+9X
         czFwJoMgK7/VrSKG15Jz/KLJpHDxcfSSfa1CrNwr5MoHrBQx9F4fxEWL2gl+ZVU+BMuq
         m7ow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XLt7R0po;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38bf3a44f22sor57078f8f.2.2025.01.16.11.02.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Jan 2025 11:02:23 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XLt7R0po;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737054143; x=1737658943; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fuRyw5EWWx6Yp+3IBCpdAz3q5PYO8xyuKBCIsOMef9E=;
        b=XLt7R0poQs5kQfbad8R+sz1ZyPt4AM0883hqQyc1UqxTApjqdTDIT8RzNaxVWdvFou
         54qGi6UHXE0Wu+BLcarkM+oUQgZGUnTWKryu0PvrYgNxaa8c7+j6e/lyoM5xQXcO4u7Z
         fj/JuSPE1Ir1HNjsFXpKYuXZBIt40LkIKePUhdf0+wAgrKJN8aQQa/df+ChpDco2UgkB
         R2tz0A9OpyBj7eK7C0BT8Nscb3qnHqSfYnQcTGnzIKQsNyWauXmXAtf7PlKFJE43DV8N
         POMmB1DAF2hloJBPtx3H1BAWAjAhpbKBO/aTkLhHv5uggH2KzCzC/zfIPaZURAn/hdfT
         QWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737054143; x=1737658943;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fuRyw5EWWx6Yp+3IBCpdAz3q5PYO8xyuKBCIsOMef9E=;
        b=Z+Zu/OYM3AoF0QZ07vDx3oklId72tvQdSoYDhrpT+Clo90UcLKotry44DJQCGPps+y
         i944BRho+rmOAfVMijXHmr0o1/HzRrDoHSEr49/Z/TGFoL1548zf8/vcptTvWXhLfdH7
         lqi0Y6VUDPBf66zxQT9UfNFVzzaiheOMx1zXYDO25ZGJTbYhgimo7ksxMp3hpoEChVy8
         1iVLslk99K0bK3sfoaEcb16K2J1MiW8+oyGJ5clsQ9dIAXEm1bbNEYonijtZ+ReeXVry
         xWCjvu/LreMjCl/3eT3sqqiUEVpfwgiDOO5k6fFPk2v+n5PZFvCk5cPg4qRh1xIfoqOH
         jEFg==
X-Forwarded-Encrypted: i=1; AJvYcCXdy+KgxNxP0wemLHnmuULK14QgEQ1Qjft9wGEdwgXctEvq8cfk+XxUyxyjZmNliWm3kOWTd7hZ2LqEnw==@linaro.org
X-Gm-Message-State: AOJu0YxTdk5nzY4hAHaucUkxMjH8MBIIzUZU9ScK0ThCSlv0WW8cNoOK
	1s1iHCRa+pyxAMBiRek68dSAeP6DyELVahYTWiUqTtg5NA00FdTfXCDUEmFEIOQdGA==
X-Gm-Gg: ASbGncuPTCLv/L69bNOWajpH1lqGbvJy8wM2UxF4wmjtDWL2c3qsLDV23ARFxdAhEx2
	SG8eoQuOvX/f6THaTyQBwiTSdgVC2FNdinZaq4DXIDSkJcyMj+dK90gsjQTFqLBrbmCQoOB9nfV
	9gmhtZQPNrFutAVq59pQcvr+NhKWKgIOhSdgTcWrqyOutevvfxL4qy9ye32/7avRNwsEcQVwiPY
	P9CXnIbern3ugXJGAXF7yyCMFngV5WzotTjtCmKHggQMSHuyw9S0x/i6MLLb7z2AzsFaigG4Pw2
	M4tSZM72L4CAdop/z405PJ+S
X-Google-Smtp-Source: AGHT+IEcSQubzWb3CBuT1dMQ1/yjGUHi79uHcxM8wbngetpI0P1jFH07ZTZYoEfZXlXddWqceC+h5Q==
X-Received: by 2002:a5d:64a8:0:b0:385:e429:e591 with SMTP id ffacd0b85a97d-38a8730a6bdmr34444859f8f.23.1737054142828;
        Thu, 16 Jan 2025 11:02:22 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.151] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890421fabsm7885525e9.24.2025.01.16.11.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 11:02:22 -0800 (PST)
Message-ID: <b55ea724-cdc7-4e8c-a954-b10a1cde9bdd@linaro.org>
Date: Thu, 16 Jan 2025 20:02:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/22] exec/cpu: Call cpu_remove_sync() once in
 cpu_common_unrealize()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Anton Johansson <anjo@rev.ng>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, Marek Vasut <marex@denx.de>,
 David Gibson <david@gibson.dropbear.id.au>, Brian Cain <bcain@quicinc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Claudio Fontana <cfontana@suse.de>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alessandro Di Federico <ale@rev.ng>, Song Gao <gaosong@loongson.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Fabiano Rosas <farosas@suse.de>,
 qemu-s390x@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Luc Michel <luc@lmichel.fr>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Bin Meng <bin.meng@windriver.com>, Stafford Horne <shorne@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Rolnik <mrolnik@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20230918160257.30127-1-philmd@linaro.org>
 <20230918160257.30127-7-philmd@linaro.org>
 <20231128174215.32d2a350@imammedo.users.ipa.redhat.com>
 <5f25576c-598f-4fd7-8238-61edcff2c411@linaro.org>
Content-Language: en-US
In-Reply-To: <5f25576c-598f-4fd7-8238-61edcff2c411@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: OgsTNSZrud0e

On 16/1/25 19:05, Philippe Mathieu-Daudé wrote:
> On 28/11/23 17:42, Igor Mammedov wrote:
>> On Mon, 18 Sep 2023 18:02:39 +0200
>> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>>> While create_vcpu_thread() creates a vCPU thread, its counterpart
>>> is cpu_remove_sync(), which join and destroy the thread.
>>>
>>> create_vcpu_thread() is called in qemu_init_vcpu(), itself called
>>> in cpu_common_realizefn(). Since we don't have qemu_deinit_vcpu()
>>> helper (we probably don't need any), simply destroy the thread in
>>> cpu_common_unrealizefn().
>>>
>>> Note: only the PPC and X86 targets were calling cpu_remove_sync(),
>>> meaning all other targets were leaking the thread when the vCPU
>>> was unrealized (mostly when vCPU are hot-unplugged).
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/core/cpu-common.c  | 3 +++
>>>   target/i386/cpu.c     | 1 -
>>>   target/ppc/cpu_init.c | 2 --
>>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
>>> index a3b8de7054..e5841c59df 100644
>>> --- a/hw/core/cpu-common.c
>>> +++ b/hw/core/cpu-common.c
>>> @@ -221,6 +221,9 @@ static void cpu_common_unrealizefn(DeviceState *dev)
>>>       /* NOTE: latest generic point before the cpu is fully 
>>> unrealized */
>>>       cpu_exec_unrealizefn(cpu);
>>> +
>>> +    /* Destroy vCPU thread */
>>> +    cpu_remove_sync(cpu);
>>>   }
>>>   static void cpu_common_initfn(Object *obj)
>>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>>> index cb41d30aab..d79797d963 100644
>>> --- a/target/i386/cpu.c
>>> +++ b/target/i386/cpu.c
>>> @@ -7470,7 +7470,6 @@ static void x86_cpu_unrealizefn(DeviceState *dev)
>>>       X86CPUClass *xcc = X86_CPU_GET_CLASS(dev);
>>>   #ifndef CONFIG_USER_ONLY
>>> -    cpu_remove_sync(CPU(dev));
>>>       qemu_unregister_reset(x86_cpu_machine_reset_cb, dev);
>>>   #endif
>>
>> missing  followup context:
>>      ...
>>      xcc->parent_unrealize(dev);
>>
>> Before the patch, vcpu thread is stopped and onnly then
>> clean up happens.
>>
>> After the patch we have cleanup while vcpu thread is still running.
>>
>> Even if it doesn't explode, such ordering still seems to be wrong.
> 
> OK.
> 
>>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>>> index e2c06c1f32..24d4e8fa7e 100644
>>> --- a/target/ppc/cpu_init.c
>>> +++ b/target/ppc/cpu_init.c
>>> @@ -6853,8 +6853,6 @@ static void ppc_cpu_unrealize(DeviceState *dev)
>>>       pcc->parent_unrealize(dev);
>>> -    cpu_remove_sync(CPU(cpu));
>>
>> bug in current code?
> 
> Plausibly. See:
> 
> commit f1023d21e81b7bf523ddf2ac91a48117f20ef9d7
> Author: Greg Kurz <groug@kaod.org>
> Date:   Thu Oct 15 23:18:32 2020 +0200
> 
>      spapr: Unrealize vCPUs with qdev_unrealize()
> 
>      Since we introduced CPU hot-unplug in sPAPR, we don't unrealize the
>      vCPU objects explicitly. Instead, we let QOM handle that for us
>      under object_property_del_all() when the CPU core object is
>      finalized. The only thing we do is calling cpu_remove_sync() to
>      tear the vCPU thread down.
> 
>      This happens to work but it is ugly because:
>      - we call qdev_realize() but the corresponding qdev_unrealize() is
>        buried deep in the QOM code
>      - we call cpu_remove_sync() to undo qemu_init_vcpu() called by
>        ppc_cpu_realize() in target/ppc/translate_init.c.inc
>      - the CPU init and teardown paths aren't really symmetrical
> 
>      The latter didn't bite us so far but a future patch that greatly
>      simplifies the CPU core realize path needs it to avoid a crash
>      in QOM.
> 
>      For all these reasons, have ppc_cpu_unrealize() to undo the changes
>      of ppc_cpu_realize() by calling cpu_remove_sync() at the right
>      place, and have the sPAPR CPU core code to call qdev_unrealize().
> 
>      This requires to add a missing stub because translate_init.c.inc is
>      also compiled for user mode.

See also:

commit 5e22e29201d80124bca0124f2034e72b698cbb6f
Author: David Gibson <david@gibson.dropbear.id.au>
Date:   Wed Jun 13 12:08:42 2018 +1000

     pnv: Add cpu unrealize path

     Currently we don't have any unrealize path for pnv cpu cores.
     We get away with this because we don't yet support cpu hotplug
     for pnv.

     However, we're going to want it eventually, and in the meantime,
     it makes it non-obvious why there are a bunch of allocations on
     the realize() path that don't have matching frees.

     So, implement the missing unrealize path.

diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index f4c41d89d6d..f7cf33f547a 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -186,6 +186,26 @@ err:
      error_propagate(errp, local_err);
  }

+static void pnv_unrealize_vcpu(PowerPCCPU *cpu)
+{
+    qemu_unregister_reset(pnv_cpu_reset, cpu);
+    object_unparent(cpu->intc);
+    cpu_remove_sync(CPU(cpu));
+    object_unparent(OBJECT(cpu));
+}
