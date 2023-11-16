Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3393568ejc;
        Thu, 16 Nov 2023 02:35:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEF9rZPkcpz6r5JRfXR+5skq9ANNa3hTy4QhyYQxCMLVtH5LQvy6jmR3m8LI9yqIfYqLHyq
X-Received: by 2002:a05:620a:170b:b0:773:c792:bdda with SMTP id az11-20020a05620a170b00b00773c792bddamr9884412qkb.53.1700130943275;
        Thu, 16 Nov 2023 02:35:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700130943; cv=none;
        d=google.com; s=arc-20160816;
        b=MxnqvF9Nz/ZTnqiu1D3DEDSlh+xbB7hT+iboLbD/FeMziHZxJrkveBENbjsiZloBet
         zy+UdUJKHECHgklLuXMD5/GHKFt7jG1bmK1+k3TF5SCDz5kxqK+DuYHY4pTaSoSVhrNf
         7c/ApWWGwwoqn/B3nlY5YmUOs472i09CTzG1cBfZOovwLaH1hRJJKndBFN2nJatFmIgk
         B/QCn1zpAM5xTfPq8pq/h/o2hQ4zwQjNmPnzUgGCxvs7VseVa5OESlwJ93W+K5ZEgxWA
         NXdDsXEI2ahD94NEUh+gbqzVJYB+jipxQc25by3nsytjViXJKNTzvvPKSvhYGijmZrec
         4UmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TkF5SooOT9kaUjO3QP6Bxrm8owBD8rkz72Yox0uZtMI=;
        fh=a7pXOaTBsSHAOcDhqYGjai0RHNA6jEApxyxU387OqdQ=;
        b=IgDb0+NX6MULiIlb18hpbqG/pte/SvdJ/6cxwOeIgHYFf/mqnORLV2r9uIMN2kcwoi
         sgtxfyD7VnH4tOCvBKNf/5d/B4dkKTVfKWy1b9eTlgM0WXFAifphIEtLVsTcHC+pMjhx
         w+hOf/GY+FfHeQEycK01bY/WinXoo11eGBd4TigtmfKaqshkOx+XFo4NzfrFGSd1uGiN
         Br/oaJc8V+Bo2VQUwJ7XJGTgS/gLmALTjPJsbrV/QUBgQAZ8IAy+zLjB+T1WOmZxStXQ
         LVbJR4LsgsR6TKi4rDT8CoJHGMpFIsHJW2kMo10om+9MIWdqeHM8lwx/GPJPcGE1CNQz
         oEkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JLi5Uyd0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl30-20020a05620a1a9e00b0076d95f4524bsi11067492qkb.682.2023.11.16.02.35.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 02:35:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JLi5Uyd0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3Zhv-0004x3-PW; Thu, 16 Nov 2023 05:34:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3Zhr-0004rU-JN
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 05:34:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3Zhp-0006PS-JP
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 05:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700130880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TkF5SooOT9kaUjO3QP6Bxrm8owBD8rkz72Yox0uZtMI=;
 b=JLi5Uyd0aC7yjSpSJ/6ZC1ucMSArhFvizfmr5PkSTgeF/wmEbh5r0Ro2dRAVqV8RSQ5Azc
 7oNugE/U2mDX1s1LefO5VURYLzPHsm1nzxYupXbU16EJ4UF7NVcRBBYw2qmqWp/L5a9gT3
 NCjeOJcV+1yDNjDnaCN8qsa032NI8VI=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-kp2F5FCJO6W8NT07bA-jhA-1; Thu, 16 Nov 2023 05:34:34 -0500
X-MC-Unique: kp2F5FCJO6W8NT07bA-jhA-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-6c7c69e4367so819715b3a.0
 for <qemu-arm@nongnu.org>; Thu, 16 Nov 2023 02:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700130873; x=1700735673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TkF5SooOT9kaUjO3QP6Bxrm8owBD8rkz72Yox0uZtMI=;
 b=uGYYvEqe90GwYXjRNxq7nE+Dah2u4L4pP61wJA8Jmuk/zw8/ogYAktVRlSdev2XlQh
 2zY6bjCHUtu87B5laduIOlN0OJu/v6GbIjPLSD8TNiTdX+EXGljAjaGvcnDtsySC+Gry
 lN9Odi9pxJRVOWFBvlIprwp+6PsMb1UmqRTZegelkbtGxBl4RK9Gsd9umpdJGe4x3/pM
 OS7UFzkpjb2xW9GuxEHs5dcTfMi92JHC7pKX41lmk4YSJhxZ+yvAuv43SQ8eU4sLBs+D
 mEQO7S9YZ9W+AU+TOFr1o+EB/YaASI63ZVvrNEwpbK+5NtAOhMrG+BuSNPFZ9RfvKHgd
 F//g==
X-Gm-Message-State: AOJu0Yy3GippEj4NNW6YluuIcMLl/+26JdVk5hUN+HJSqabldVGSwvB8
 pwMZZXkKtg0mIpIjaaphkM+TI10G5ph2O2rVX+viFCuOZcghmlpYFYirPucH5vKGChRd1B+tk86
 cUq9quDU3DhM6
X-Received: by 2002:a05:6a21:339d:b0:16b:8154:2168 with SMTP id
 yy29-20020a056a21339d00b0016b81542168mr15293453pzb.26.1700130873513; 
 Thu, 16 Nov 2023 02:34:33 -0800 (PST)
X-Received: by 2002:a05:6a21:339d:b0:16b:8154:2168 with SMTP id
 yy29-20020a056a21339d00b0016b81542168mr15293426pzb.26.1700130873188; 
 Thu, 16 Nov 2023 02:34:33 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 by14-20020a056a02058e00b005bd980cca56sm2289210pgb.29.2023.11.16.02.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 02:34:32 -0800 (PST)
Message-ID: <93d5e7fa-b1c6-43cc-b3af-026e7a5964b5@redhat.com>
Date: Thu, 16 Nov 2023 20:34:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/31] cpu: Add generic cpu_list()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-7-gshan@redhat.com>
 <80da2d00-0d96-4252-b2aa-f7859e44bece@linaro.org>
 <55922c30-be4b-459d-835b-819e1dcd2437@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <55922c30-be4b-459d-835b-819e1dcd2437@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: OY91MmojyEDR

Hi Phil,

On 11/16/23 17:51, Philippe Mathieu-Daudé wrote:
> On 16/11/23 08:39, Philippe Mathieu-Daudé wrote:
>> On 15/11/23 00:56, Gavin Shan wrote:
>>> Add generic cpu_list() to replace the individual target's implementation
>>> in the subsequent commits. Currently, there are 3 targets with no cpu_list()
>>> implementation: microblaze and nios2. With this applied, those two targets
>>> switch to the generic cpu_list().
>>>
>>> [gshan@gshan q]$ ./build/qemu-system-microblaze -cpu ?
>>> Available CPUs:
>>>    microblaze-cpu
>>>
>>> [gshan@gshan q]$ ./build/qemu-system-nios2 -cpu ?
>>> Available CPUs:
>>>    nios2-cpu
>>>
>>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   bsd-user/main.c |  5 +----
>>>   cpu-target.c    | 29 ++++++++++++++++++++++++++---
>>>   2 files changed, 27 insertions(+), 7 deletions(-)
>>
>>
>>> diff --git a/cpu-target.c b/cpu-target.c
>>> index c078c0e91b..acfc654b95 100644
>>> --- a/cpu-target.c
>>> +++ b/cpu-target.c
>>> @@ -24,6 +24,7 @@
>>>   #include "hw/qdev-core.h"
>>>   #include "hw/qdev-properties.h"
>>>   #include "qemu/error-report.h"
>>> +#include "qemu/qemu-print.h"
>>>   #include "migration/vmstate.h"
>>>   #ifdef CONFIG_USER_ONLY
>>>   #include "qemu.h"
>>> @@ -283,12 +284,34 @@ const char *parse_cpu_option(const char *cpu_option)
>>>       return cpu_type;
>>>   }
>>> +#ifndef cpu_list
>>> +static void cpu_list_entry(gpointer data, gpointer user_data)
>>> +{
>>> +    CPUClass *cc = CPU_CLASS(OBJECT_CLASS(data));
>>> +    const char *typename = object_class_get_name(OBJECT_CLASS(data));
>>> +    g_autofree char *model = cpu_model_from_type(typename);
>>> +
>>> +    if (cc->deprecation_note) {
>>> +        qemu_printf("  %s (deprecated)\n", model);
>>> +    } else {
>>> +        qemu_printf("  %s\n", model);
>>> +    }
>>> +}
>>> +
>>> +static void cpu_list(void)
>>> +{
>>> +    GSList *list;
>>> +
>>> +    list = object_class_get_list_sorted(TYPE_CPU, false);
>>> +    qemu_printf("Available CPUs:\n");
>>
>> Since this output will likely be displayed a lot, IMHO it is worth
>> doing a first pass to get the number of available CPUs. If it is 1,
>> print using singular but even better smth like:
>>
>>         "This machine can only be used with the following CPU:"
> 
> Hmm I missed this code is common to user/system emulation.
> 
> System helper could be clever by using the intersection of cpu_list()
> and MachineClass::valid_cpu_types[] sets.
> 

When cpu_list() is called, it's possible the machine type option isn't
parsed yet. Besides, this function is usually used by "qemu-system-arm -cpu ?".
So I wouldn't connect to MachineClass::valid_cpu_types[] here if you agree.

Thanks,
Gavin

>> That said, this can be done later on top, so:
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>>> +    g_slist_foreach(list, cpu_list_entry, NULL);
>>> +    g_slist_free(list);
>>> +}
>>> +#endif
>>
>>
> 

