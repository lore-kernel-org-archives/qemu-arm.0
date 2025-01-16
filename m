Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3936257njn;
        Thu, 16 Jan 2025 10:05:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXi8IBH25iWMcW97hYQvmHpu/Ad7l3sXOALfoOOHfSsD+vvKILFSCzu7Rd3Tg26TyDG9FAGdfffazucrg==@linaro.org
X-Received: by 2002:a05:600c:468a:b0:434:a968:89a3 with SMTP id 5b1f17b1804b1-436e26a78a5mr272286855e9.9.1737050750551;
        Thu, 16 Jan 2025 10:05:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737050750; cv=none;
        d=google.com; s=arc-20240605;
        b=aOL2OGQYLFuTqAGXT0voxsAynDcysA5qtLjPmrj+vfnnIsh96JEC5Aj5GRRk2nDT7/
         X7hGxKCXfuOTuZbUXBA62nq9g8Zi5iRlOozIvibHIq5c0lp7gEhZEorzx080FXEiT7F+
         vSEJlr8Q6tBTwXrHOi8rPKFKEkMChElxyaZ4Lg9hwUnVeKSpflOacyNoOHjyQh33ceC2
         b5ruDb13cXVbbo2ze2XDUPbimz4pTbhPmWwZz13fxOx9JvzdeniatEW4zXxIohRNcV67
         aRIlRR09kkUqNTGadn1qUEuFLFzRQnl/7DvAlhaOdcobc1YaYUHm44x/U1TA/sK4a9ch
         zifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Rhp05gJbQRlTNfvgsZGYVcl1Q/y5Mvv1WzUV/6aq+RQ=;
        fh=rhAvN/6HUMa6wSWGCktSk5xms99FXmZZt27IiiTBhsg=;
        b=gVvA+tO5jqTsKmGype3WBhy0qrOtVwtLayIoEluY4VVzmz4KE0Jbfesw2jdY6q5oTl
         Hy+X6x7acL0gb7FTj9ae8xOA/VYdXdIUF7vovnhllapv7S8E2wu37TvqrWCq1MekgeUq
         DiNFXyV+rDFTJld7SVky8A+ldqZphulJcFKJfi2tiJCllxk6lxszWA4XcRVApzAIVIRU
         6AgpNJUO2dJwLfLPudWj33s+UH7fmBfMH/bXj65lCBD19b34zEPe/si/y1ADClZvSO71
         qwMlbzfV+YA6/rg8DNW3DT7N+eADYzCqDQ5xErnFlxZnBwvrMEsgGCpOnjviHhYKOfTe
         M7rQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VFaBYoMg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438904928b1sor2113695e9.6.2025.01.16.10.05.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Jan 2025 10:05:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VFaBYoMg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737050750; x=1737655550; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rhp05gJbQRlTNfvgsZGYVcl1Q/y5Mvv1WzUV/6aq+RQ=;
        b=VFaBYoMgAlZ0dFaSZRrcbIMMlI9M+pz2Mc4MluVSqI+IPGOkIoocbK4dFQsuXBHJKQ
         NSJhxVpIeqpxOhHPzpa4Fs/5jEeK4Ebbb3+cG9SjCq88YSi1O1YoSGIaIDr0mjHFZYEL
         4ZQp6z87VXL9AZTmO7nlW15HkTND+fnJxHMLflpJEt53yh411qflxGED2veJknntzZp2
         9Re10FPLYhhlrV6WQZ/Z95Pu3mXs+u/Dr20vmcK0TmNaXww7JFYcoUuoFJWSR9oOiXcQ
         +MFcyEPKsx7EGf8fPGeEh2CqzaagD440xzYkKBuKVDWX6hocevbBo9s5xC9whKgs6CSM
         Xqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737050750; x=1737655550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rhp05gJbQRlTNfvgsZGYVcl1Q/y5Mvv1WzUV/6aq+RQ=;
        b=pMFXpgS/X96HCwmTxYOO/z/7hrY8YpX/uDZg1ptLzjre80d0TL626wDR+2+vr+xdJI
         60dtv2o1Q1WquOnc0AVbLUaB8T7FbP0C9wTBcBsFT0bS8tmGTJge6GIAsyVXlwq1zZek
         gWLCFDJzXFUM+XqN/PMO2sZq92VpzhtNJ6zY4J8Uu66GYs78Mz2Zvv8VZslzY2lXhkNb
         Fr6wHOpNV/vV+JnDtn0lKinU3j9vf4bPVOjzj5CYTzayCBHUHKeBANFjH4Ese3tQIrfO
         SaggYsl4Fp0KmLhwUK3E0A9BQbFbrKTU/sueOPHJ45PsbffABy+w3gLwNFqdf/Yl+uRZ
         TWKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtihMGZG1lMlg24OFsxKOWy0yhD/ETlaYnRrXTYrDkC3+7sgSRJSxpXGHN5jPb9gHHudPYhPR5D1UuFQ==@linaro.org
X-Gm-Message-State: AOJu0YzyW+Pte77FbpnXoDy1sjgh721yGGMExTddIPKu/+HqxN7DsvyK
	Zz/FdTr24hj94gdpmygGM+vRs+gcZel+YWfu/mmvZIa3n720aBQcnWvwmJkP7du16Q==
X-Gm-Gg: ASbGncvJVyHRL4GZJEnpLZKxpebbEJNUDtOLKQ7AWgBhjlRrD0dxKXZj7EopNAdUxMt
	8JaIJpqJecU43v/1qdOZ4Okok52wLnvrSXrhFD5/zkKwpWE9HO0Z6twKKHu1+UPKe5tNShV+uSV
	BQ/a8zaiiRKZ+Llr4/akzpZCgiKrc5kRYtL3vuTJOlh9FhCC4xEWEz61uyj9mQfukCT7U4owsxO
	rZrUNnc+rt62SOpNJ777i6/Gog7d11wrOLbVUzPqW3h5YYv77b+NnZDgt3X5EU3rYLBEh7N8giy
	jSlR/6yxsgnBdHVIABB1UcwY
X-Google-Smtp-Source: AGHT+IE7PicfAMlxA+nlONgB6VhOPYA3/3n8nOIee+iKmvhp7eYMFXXEQKotYDBpJUtL/z/v/0EW/g==
X-Received: by 2002:a05:600c:314b:b0:434:f270:a513 with SMTP id 5b1f17b1804b1-436e26ff288mr247488285e9.29.1737050749887;
        Thu, 16 Jan 2025 10:05:49 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.151] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890367b48sm6925895e9.0.2025.01.16.10.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 10:05:48 -0800 (PST)
Message-ID: <5f25576c-598f-4fd7-8238-61edcff2c411@linaro.org>
Date: Thu, 16 Jan 2025 19:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/22] exec/cpu: Call cpu_remove_sync() once in
 cpu_common_unrealize()
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
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231128174215.32d2a350@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: biZGcZNoFrkm

On 28/11/23 17:42, Igor Mammedov wrote:
> On Mon, 18 Sep 2023 18:02:39 +0200
> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> 
>> While create_vcpu_thread() creates a vCPU thread, its counterpart
>> is cpu_remove_sync(), which join and destroy the thread.
>>
>> create_vcpu_thread() is called in qemu_init_vcpu(), itself called
>> in cpu_common_realizefn(). Since we don't have qemu_deinit_vcpu()
>> helper (we probably don't need any), simply destroy the thread in
>> cpu_common_unrealizefn().
>>
>> Note: only the PPC and X86 targets were calling cpu_remove_sync(),
>> meaning all other targets were leaking the thread when the vCPU
>> was unrealized (mostly when vCPU are hot-unplugged).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/core/cpu-common.c  | 3 +++
>>   target/i386/cpu.c     | 1 -
>>   target/ppc/cpu_init.c | 2 --
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
>> index a3b8de7054..e5841c59df 100644
>> --- a/hw/core/cpu-common.c
>> +++ b/hw/core/cpu-common.c
>> @@ -221,6 +221,9 @@ static void cpu_common_unrealizefn(DeviceState *dev)
>>   
>>       /* NOTE: latest generic point before the cpu is fully unrealized */
>>       cpu_exec_unrealizefn(cpu);
>> +
>> +    /* Destroy vCPU thread */
>> +    cpu_remove_sync(cpu);
>>   }
>>   
>>   static void cpu_common_initfn(Object *obj)
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index cb41d30aab..d79797d963 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -7470,7 +7470,6 @@ static void x86_cpu_unrealizefn(DeviceState *dev)
>>       X86CPUClass *xcc = X86_CPU_GET_CLASS(dev);
>>   
>>   #ifndef CONFIG_USER_ONLY
>> -    cpu_remove_sync(CPU(dev));
>>       qemu_unregister_reset(x86_cpu_machine_reset_cb, dev);
>>   #endif
> 
> missing  followup context:
>      ...
>      xcc->parent_unrealize(dev);
> 
> Before the patch, vcpu thread is stopped and onnly then
> clean up happens.
> 
> After the patch we have cleanup while vcpu thread is still running.
> 
> Even if it doesn't explode, such ordering still seems to be wrong.

OK.

>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>> index e2c06c1f32..24d4e8fa7e 100644
>> --- a/target/ppc/cpu_init.c
>> +++ b/target/ppc/cpu_init.c
>> @@ -6853,8 +6853,6 @@ static void ppc_cpu_unrealize(DeviceState *dev)
>>   
>>       pcc->parent_unrealize(dev);
>>   
>> -    cpu_remove_sync(CPU(cpu));
> 
> bug in current code?

Plausibly. See:

commit f1023d21e81b7bf523ddf2ac91a48117f20ef9d7
Author: Greg Kurz <groug@kaod.org>
Date:   Thu Oct 15 23:18:32 2020 +0200

     spapr: Unrealize vCPUs with qdev_unrealize()

     Since we introduced CPU hot-unplug in sPAPR, we don't unrealize the
     vCPU objects explicitly. Instead, we let QOM handle that for us
     under object_property_del_all() when the CPU core object is
     finalized. The only thing we do is calling cpu_remove_sync() to
     tear the vCPU thread down.

     This happens to work but it is ugly because:
     - we call qdev_realize() but the corresponding qdev_unrealize() is
       buried deep in the QOM code
     - we call cpu_remove_sync() to undo qemu_init_vcpu() called by
       ppc_cpu_realize() in target/ppc/translate_init.c.inc
     - the CPU init and teardown paths aren't really symmetrical

     The latter didn't bite us so far but a future patch that greatly
     simplifies the CPU core realize path needs it to avoid a crash
     in QOM.

     For all these reasons, have ppc_cpu_unrealize() to undo the changes
     of ppc_cpu_realize() by calling cpu_remove_sync() at the right
     place, and have the sPAPR CPU core code to call qdev_unrealize().

     This requires to add a missing stub because translate_init.c.inc is
     also compiled for user mode.

> 
>> -
>>       destroy_ppc_opcodes(cpu);
>>   }
>>   
