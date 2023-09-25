Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp60084ejc;
        Sun, 24 Sep 2023 17:25:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlX1vuLKqpLLGzG4ynMjCgCFcSYi5n6VrLbc9PC5zIJ3258mJxPOcIr0KL2iEH8qaFo8iy
X-Received: by 2002:a05:620a:44c7:b0:76f:1954:165d with SMTP id y7-20020a05620a44c700b0076f1954165dmr7423668qkp.56.1695601500300;
        Sun, 24 Sep 2023 17:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695601500; cv=none;
        d=google.com; s=arc-20160816;
        b=jLu6Gfwh9Wsf9YRbkXdOFr2Y42PrUnp6vJMyJ8MNjP7QIEgy/RogizXfWleSnF/aov
         MuT+gcThCx7uM3n2hZzJtf30T2Fz50YGokUy2edyHo/0Mg8GwdvBMSiFDpMo1rViWnDN
         H0c3S55heU3U7jlVVGThmzHu17XxFER6MNdnV5UGrdVFvFzBtWv8aN1fwYDt9rDXvwgH
         /WnxGT4Plj5CLrqdYVbCEToLxf3Ruxs6zlLcGXzL0ACTBHkM9qNxphFhuJ7IcZwLULza
         5YIYb99nCwvwEY1CznSJ30CZdT80lD42iy2o8JWz3x0Tq9zIDmoJAGIVPcske+T4Bkst
         Be6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=aPk3ge9QXMJ1XbAnO/Cqt8Jm9Bz3ZpC9BoVYrzsRNtg=;
        fh=umzWOJsUp6qBpMZfaR/35tHg7PJylqVzX5Du8QxP/Gc=;
        b=Jpha6Aoz7cteO4eESQ4aXtwqgXFhzLdtM160MlJMYEZUfBwoj6EqY1giR5puhj1I5T
         5qOyIo9YltyEDzpHqjz4FSH++AxyWgPM/jKiRy04BQm8+DcUn/wzoAhAOLH8J3XXLW6u
         A1KxfEw70r+a56HncXi9CTR97nEMDL8l+trKB1uDBqbsQK+fqXqmh/BhYX8Ltj3nCTNt
         5sx/2/mpJqnVwzoqhk+ts+DvfzrpXqaBtdhO5ehR24yAFiQAulKvb+B7/e7F8xyOl4E2
         PSV5uFgRcvZfBfVZB6/FSKKhcBj+NPh3EXn3ZG9ndcHHtFTowPS4xKoZB5ExNrGwVQah
         hpZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MKbVMTFV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19-20020a05620a24d300b00765ae950bb1si5613149qkn.499.2023.09.24.17.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Sep 2023 17:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MKbVMTFV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qkZOp-0003LU-MN; Sun, 24 Sep 2023 20:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qkZOn-0003Jq-JC
 for qemu-arm@nongnu.org; Sun, 24 Sep 2023 20:24:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qkZOl-00075F-1x
 for qemu-arm@nongnu.org; Sun, 24 Sep 2023 20:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695601465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aPk3ge9QXMJ1XbAnO/Cqt8Jm9Bz3ZpC9BoVYrzsRNtg=;
 b=MKbVMTFVIbnTIIQ48JgEiI60oBzfO5m8HcqiLgo8QXjqflKm149iFSOF1mT0HvX57tjkBI
 yJwiTXr5j0efv6fGe2qm4EKkcVh8KxhIW6d7oXvyLjEyTTo1GWPnZRjJEs6vhErRCgDY7/
 4renfwX4LPVgj4qYgecW57RNrEQi4vU=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-82APHk2eMeWpUD2U3J_MsA-1; Sun, 24 Sep 2023 20:24:23 -0400
X-MC-Unique: 82APHk2eMeWpUD2U3J_MsA-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-692bf04c548so2459978b3a.0
 for <qemu-arm@nongnu.org>; Sun, 24 Sep 2023 17:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695601463; x=1696206263;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aPk3ge9QXMJ1XbAnO/Cqt8Jm9Bz3ZpC9BoVYrzsRNtg=;
 b=Hldwya0u/UMKhlUSTHtNwO6ExIylBvH0edTPrfI4O81nYAZ9+GaUwXuXRXVc4zYN1h
 Qh9RiR89+26KnsOegj7YFoNs7rH2pcgatann2DBA6J8x/5qxdI+yPu/0zrRlPIwMiFRR
 YPurTB8QaP3G3fvy/krnTREC/NwdUhO1AJkvEoDn+9ydVCDYnj7UzQPVz81uJ5RnMbeW
 TQ0/W/8YUE5BGCwSnQcL11A/cl9q4DQrroEDSHjKvSmikPYwilmwyuTmRJvt9pBfA/5A
 Hui/WNP18Kl2awpcBtAgpY0E94JPnKPDHAABgEUzPeNhG9d77bLeyXuQMwzAWW76KCnP
 CvLQ==
X-Gm-Message-State: AOJu0YzLBSHIfSezLw2Jz1HQCc5HcvzqPJquO8tgQTLiCkcng3y7d6hW
 IFYWH0gladN9sUkzrKe/z7ST7+XxuyZWJyfo/D3wsvyz2zjn02oSKgwEPfYOvHgzGCYzTdXM2fJ
 YvrOzTXfaVGT2
X-Received: by 2002:a05:6a00:1748:b0:68e:399e:70db with SMTP id
 j8-20020a056a00174800b0068e399e70dbmr4446387pfc.6.1695601462803; 
 Sun, 24 Sep 2023 17:24:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:1748:b0:68e:399e:70db with SMTP id
 j8-20020a056a00174800b0068e399e70dbmr4446338pfc.6.1695601462370; 
 Sun, 24 Sep 2023 17:24:22 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a62ee0f000000b00686fe7b7b48sm6728499pfi.121.2023.09.24.17.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Sep 2023 17:24:21 -0700 (PDT)
Message-ID: <a42dd7a0-e73f-8410-d096-8298da03f70d@redhat.com>
Date: Mon, 25 Sep 2023 10:24:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] hw/cpu: Introduce CPUClass::cpu_resolving_type field
From: Gavin Shan <gshan@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Cc: Chris Wulff <crwulff@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-s390x@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Rolnik <mrolnik@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, Bin Meng <bin.meng@windriver.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Song Gao <gaosong@loongson.cn>,
 Stafford Horne <shorne@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>, Brian Cain <bcain@quicinc.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230908112235.75914-1-philmd@linaro.org>
 <20230908112235.75914-4-philmd@linaro.org>
 <87cb0174-c652-aa44-be7c-49e78e0a5003@redhat.com>
 <af78b6c9-14e5-3256-9670-c106f4942140@linaro.org>
 <35653f53-a977-02ea-28f6-6fe85b1efd5a@redhat.com>
In-Reply-To: <35653f53-a977-02ea-28f6-6fe85b1efd5a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: gQRBXLmcglsF

Hi Philippe,

On 9/12/23 08:40, Gavin Shan wrote:
> On 9/11/23 19:43, Philippe Mathieu-Daudé wrote:
>> On 11/9/23 01:28, Gavin Shan wrote:
>>> On 9/8/23 21:22, Philippe Mathieu-Daudé wrote:
>>>> Add a field to return the QOM type name of a CPU class.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>   include/hw/core/cpu.h   | 2 ++
>>>>   hw/core/cpu-common.c    | 2 +-
>>>>   target/alpha/cpu.c      | 1 +
>>>>   target/arm/cpu.c        | 1 +
>>>>   target/avr/cpu.c        | 1 +
>>>>   target/cris/cpu.c       | 1 +
>>>>   target/hexagon/cpu.c    | 1 +
>>>>   target/hppa/cpu.c       | 1 +
>>>>   target/i386/cpu.c       | 1 +
>>>>   target/loongarch/cpu.c  | 1 +
>>>>   target/m68k/cpu.c       | 1 +
>>>>   target/microblaze/cpu.c | 1 +
>>>>   target/mips/cpu.c       | 1 +
>>>>   target/nios2/cpu.c      | 1 +
>>>>   target/openrisc/cpu.c   | 1 +
>>>>   target/ppc/cpu_init.c   | 1 +
>>>>   target/riscv/cpu.c      | 1 +
>>>>   target/rx/cpu.c         | 1 +
>>>>   target/s390x/cpu.c      | 1 +
>>>>   target/sh4/cpu.c        | 1 +
>>>>   target/sparc/cpu.c      | 1 +
>>>>   target/tricore/cpu.c    | 1 +
>>>>   target/xtensa/cpu.c     | 1 +
>>>>   23 files changed, 24 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>>> index 129d179937..e469efd409 100644
>>>> --- a/include/hw/core/cpu.h
>>>> +++ b/include/hw/core/cpu.h
>>>> @@ -100,6 +100,7 @@ struct SysemuCPUOps;
>>>>   /**
>>>>    * CPUClass:
>>>> + * @cpu_resolving_type: CPU QOM type name
>>>>    * @class_by_name: Callback to map -cpu command line model name to an
>>>>    *                 instantiatable CPU type.
>>>>    * @parse_features: Callback to parse command line arguments.
>>>> @@ -148,6 +149,7 @@ struct CPUClass {
>>>>       DeviceClass parent_class;
>>>>       /*< public >*/
>>>> +    const char *cpu_resolving_type;
>>>>       ObjectClass *(*class_by_name)(const char *cpu_model);
>>>>       void (*parse_features)(const char *typename, char *str, Error **errp);
>>>
>>> The question is why not use CPU_RESOLVING_TYPE directly? It seems CPU_RESOLVING_TYPE
>>> is exactly what you want here.
>>
>> Unfortunately CPU_RESOLVING_TYPE is target-specific, we want
>> hw/core/cpu-common.c to be target-agnostic (build once for all
>> targets). This is particularly important in the context of
>> heterogeneous QEMU, where a single binary will be able to create
>> CPUs from different targets.
>>
> 
> CPU_RESOLVING_TYPE and CPUClass::cpu_resolving_type is duplicate to
> each other. There are two options I can figure out to avoid the
> duplication.
> 
> (a) move cpu_class_by_name() from hw/core/cpu-common.c to cpu.c, so that
>      CPU_RESOLVING_TYPE can be seen. cpu.c::list_cpus() is the example.
> 
> (b) remove hw/core/cpu-common.c::cpu_calss_by_name() and squeeze its
>      logic to cpu.c::parse_cpu_option() since there are not too much
>      users for it. target/arm and target/s390 needs some tweaks so that
>      hw/core/cpu-common.c::cpu_calss_by_name() can be removed.
> 
>      [gshan@gshan q]$ git grep \ cpu_class_by_name\(
>      cpu.c:    oc = cpu_class_by_name(CPU_RESOLVING_TYPE, model_pieces[0]);
>      target/arm/arm-qmp-cmds.c:    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
>      target/s390x/cpu_models_sysemu.c:    oc = cpu_class_by_name(TYPE_S390_CPU, info->name);
> 
> When option (b) is taken, this series to have the checks against @oc
> in hw/core/cpu-common.c::cpu_calss_by_name() becomes non-sense. Instead,
> we need the same (and complete) checks in CPUClass::class_by_name() for
> individual targets. Further more, an inline helper can be provided to do
> the check in CPUClass::class_by_name() for individual targets.
> 
>     include/hw/core/cpu.h
> 
>     static inline bool cpu_class_is_valid(ObjectClass *oc, const char *parent)
>     {
>         if (!object_class_dynamic_cast(oc, parent) ||
>             object_class_is_abstract(oc)) {
>             return false;
>         }
> 
>         return true;
>     }
> 

Since my series to make CPU type check unified depends on this series, could
you please share your thoughts? If you don't have bandwidth for this, I can
improve the code based on your thoughts, and include your patches to my series
so that they can be reviewed at once. Please just let me know.

Thanks,
Gavin


