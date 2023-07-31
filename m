Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp1945259ejb;
        Sun, 30 Jul 2023 22:08:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGQpbAqzym4ogkO+K/QBuR9pxnT6SUPxI8gqbA2A5DzyvNuONJ7Mwn+3P21DwDREErZNAsH
X-Received: by 2002:a05:620a:2225:b0:76c:ba1a:d53a with SMTP id n5-20020a05620a222500b0076cba1ad53amr4290qkh.8.1690780118604;
        Sun, 30 Jul 2023 22:08:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690780118; cv=none;
        d=google.com; s=arc-20160816;
        b=VkQ46gHjIcDIKHIQDCis5MSwenENvBUt1NgAWwCeh+FifeDQHfSgvp5GmB0afcJ6br
         1PbCVaP+4IGY7LVAIhyDrv6tBO+ahzm6nSkzso1kdpWaPMualh9HGcAO2HjafBF/jf0x
         mzbuvnrHmfEjXFnDr1dg2DkqveT3lUa1HRb/8qmPbvm0W31AE8NkIzmx1UuEjfLIKLS3
         jcW0eiptSUCP7Ktdep1XFmm3KAno64xqgdyAYKa377lbrQqqxMS4dzxzZGx5cuEEu+nx
         IwLZ68UX+5H98lvg7dqueEoPp/T49SzemyBVKtMBCfnOb4jHCX3yAJLudRxMNdKKIFzM
         eXvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fLr0jbgRsn8JbzxQyvh2GheqsJiBVxc89Ks8rVIh/Uo=;
        fh=C2DphJCFmTD9UOd24D3sb5C/w5mrwtSZNR7mSyXLYN0=;
        b=wiE2bMCZTDyLZ97fZ6zBoJPvvMfu6pScOsE4+p3QPNlOFsm7/mBBlhF4lv5yTOoXBI
         q/3BJ2Ckzrf9lB3P65QK1ecfNBRUyyjp0S4m/bT7hWbmNjVgE+2MkQss18dekdUAjTds
         HyjeVtcESTIdefV9TFUpvk1m1seYBvEoTeLNNmwP/O7zzaL8WJgelRDXLOfCiLJ7/mPc
         lnaULy6nnuQN1F2IxtHl6BaFbLwTUAux0OIWyA3fiurq8xtt1wTpko3jlEeCBu1ejLbE
         ZWaE9fD+Q6LguBGfq5hwS3+JJjVlHRPnEd1lo9jJrBEUPnZk+k2177QLieHPWqvFo7xE
         s7hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RPgpAhFB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i20-20020a05620a405400b0076728f5d394si5603417qko.415.2023.07.30.22.08.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jul 2023 22:08:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RPgpAhFB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQL8K-00053G-1i; Mon, 31 Jul 2023 01:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qQL8I-00052j-Rt
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 01:07:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qQL8G-0007gr-SJ
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 01:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690780068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fLr0jbgRsn8JbzxQyvh2GheqsJiBVxc89Ks8rVIh/Uo=;
 b=RPgpAhFBW+BEbgFVkY9YVRtAjCEvDaF4l1I0uAsUZXvnTYk0CUHsdn+OmhE7VmZWG76N1Y
 M9fCwX5unJRDMBOy5/WYdWJc4nwpAGjOJsR02YCmEE19t3ryEfdO7irht9VrW+RNlthBft
 74q1sPXUeEcqJPbNj7B2KpLmS23Mt+k=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-ZRIi-K0AMnG2Ampc1tuaDQ-1; Mon, 31 Jul 2023 01:07:47 -0400
X-MC-Unique: ZRIi-K0AMnG2Ampc1tuaDQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2683548c37cso2958047a91.2
 for <qemu-arm@nongnu.org>; Sun, 30 Jul 2023 22:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690780064; x=1691384864;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fLr0jbgRsn8JbzxQyvh2GheqsJiBVxc89Ks8rVIh/Uo=;
 b=dyT6Rkm5cSxIp3GooEfukjr3RgToSAXeNrgWmwDaosU4MZPQ0EIhx7k11Ap7F04Ed8
 pYTclkPq8Ks3UxqXI1dTswwBe3KugQ06y/WX+ItdI8zblI3HUlQnVvrepUaVRmpyxHys
 G/QcF98Ut4xlfxNCzuvNn6Vw6/92wbmnbydL18IVJDoAvbOBu0QpucQXovz8bUJqeunG
 EuW21HoyuZJFuwJh3++ytboQLVIYez/5c9NwDM1n2Gke8wz+2ER+o1ioLVvY7C59dNGk
 wWSpSE8c45OFNR6vEmAH/L+hfdGN5R+7thkwT4/zWufSiRNRASmMmZyXSWkX6SzivUCa
 X79Q==
X-Gm-Message-State: ABy/qLZX0Dqh5QfYiNaba/gTB0MCGWqSqQFXi8yR3uTtO2mPYUJV52wV
 7lpp8Ds+CH6j6o6UvpczO3OZa6NQWjEebRwlsX5gPxFKEPukPAQa/WRXfNRLf8lR5Vtr4Y583zk
 Hcap9SWxs8gFf
X-Received: by 2002:a17:90a:3e84:b0:267:f7eb:f12e with SMTP id
 k4-20020a17090a3e8400b00267f7ebf12emr8048885pjc.39.1690780063751; 
 Sun, 30 Jul 2023 22:07:43 -0700 (PDT)
X-Received: by 2002:a17:90a:3e84:b0:267:f7eb:f12e with SMTP id
 k4-20020a17090a3e8400b00267f7ebf12emr8048871pjc.39.1690780063386; 
 Sun, 30 Jul 2023 22:07:43 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 29-20020a17090a1a5d00b0025c2c398d33sm6006386pjl.39.2023.07.30.22.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jul 2023 22:07:42 -0700 (PDT)
Message-ID: <5f26299e-f1e0-a2ab-db83-87011fe524d5@redhat.com>
Date: Mon, 31 Jul 2023 15:07:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/8] machine: Print supported CPU models instead of
 typenames
To: Igor Mammedov <imammedo@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, laurent@vivier.eu, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, cohuck@redhat.com, pbonzini@redhat.com,
 shan.gavin@gmail.com, qemu-ppc@nongnu.org
References: <20230726003205.1599788-1-gshan@redhat.com>
 <20230726003205.1599788-4-gshan@redhat.com>
 <24e54bac-9149-20da-e4cf-5829a6dcb174@linaro.org>
 <0454c1ad-314c-3df6-d6e9-1a05cb4c4050@redhat.com>
 <20230727110010.648b61a6@imammedo.users.ipa.redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230727110010.648b61a6@imammedo.users.ipa.redhat.com>
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
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.101, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: UD5tHDD4zNDG


On 7/27/23 19:00, Igor Mammedov wrote:
> On Thu, 27 Jul 2023 15:16:18 +1000
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> On 7/27/23 09:08, Richard Henderson wrote:
>>> On 7/25/23 17:32, Gavin Shan wrote:
>>>> -static const char *q800_machine_valid_cpu_types[] = {
>>>> +static const char * const q800_machine_valid_cpu_types[] = {
>>>>        M68K_CPU_TYPE_NAME("m68040"),
>>>>        NULL
>>>>    };
>>>> +static const char * const q800_machine_valid_cpu_models[] = {
>>>> +    "m68040",
>>>> +    NULL
>>>> +};
>>>
>>> I really don't like this replication.
>>>    
>>
>> Right, it's going to be lots of replications, but gives much flexibility.
>> There are 21 targets and we don't have fixed pattern for the mapping between
>> CPU model name and CPU typename. I'm summarizing the used patterns like below.
>>
>>     1 All CPU model names are mappinged to fixed CPU typename;
> 
>          plainly spelled it would be: cpu_model name ignored and
>          a cpu type is returned anyways.
> 
> I'd make this hard error right away, as "junk in => error out"
> it's clearly user error. I think we don't even have to follow
> deprecation process for that.
> 

Right, It's not expected behavior to map ambiguous CPU model names to
the fixed CPU typename.

>>     2 CPU model name is same to CPU typename;
>>     3 CPU model name is alias to CPU typename;
>>     4 CPU model name is prefix of CPU typename;
> 
> and some more:
>      5. cpu model names aren't names at all sometimes, and some other
>         CPU property is used. (ppc)
> This one I'd prefer to get rid of and ppc handling more consistent
> with other targets, which would need PPC folks to persuaded to drop
> PVR lookup.
> 

I put this into class 3, meaning the PVRs are regarded as aliases to CPU
typenames.

>>
>>     Target         Categories    suffix-of-CPU-typename
>>     -------------------------------------------------------
>>     alpha          -234          -alpha-cpu
>>     arm            ---4          -arm-cpu
>>     avr            -2--
>>     cris           --34          -cris-cpu
>>     hexagon        ---4          -hexagon-cpu
>>     hppa           1---
>>     i386           ---4          -i386-cpu
>>     loongarch      -2-4          -loongarch-cpu
>>     m68k           ---4          -m68k-cpu
>>     microblaze     1---
>>     mips           ---4          -mips64-cpu  -mips-cpu
>>     nios2          1---
>>     openrisc       ---4          -or1k-cpu
>>     ppc            --34          -powerpc64-cpu  -powerpc-cpu
>>     riscv          ---4          -riscv-cpu
>>     rx             -2-4          -rx-cpu
>>     s390x          ---4          -s390x-cpu
>>     sh4            --34          -superh-cpu
>>     sparc          -2--
>>     tricore        ---4          -tricore-cpu
>>     xtensa         ---4          -xtensa-cpu
>>
>> There are several options as below. Please let me know which one or something
>> else is the best.
>>
>> (a) Keep what we have and use mc->valid_{cpu_types, cpu_models}[] to track
>> the valid CPU typenames and CPU model names.
>>
>> (b) Introduce CPUClass::model_name_by_typename(). Every target has their own
>> implementation to convert CPU typename to CPU model name. The CPU model name
>> is parsed from mc->valid_cpu_types[i].
>>
>>       char *CPUClass::model_by_typename(const char *typename);
>>
>> (c) As we discussed before, use mc->valid_cpu_type_suffix and mc->valid_cpu_models
>> because the CPU type check is currently needed by target arm/m68k/riscv where we
>> do have fixed pattern to convert CPU model names to CPU typenames. The CPU typename
>> is comprised of CPU model name and suffix. However, it won't be working when the CPU
>> type check is required by other target where we have patterns other than this.
> 
> none of above is really good, that's why I was objecting to introducing
> reverse type->name mapping. That ends up with increased amount junk,
> and it's not because your patches are bad, but because you are trying
> to deal with cpu model names (which is a historically evolved mess).
> The best from engineering POV would be replacing CPU models with
> type names.
> 
> Even though it's a bit radical, I very much prefer replacing
> cpu_model names with '-cpu type'usage directly. Making it
> consistent with -device/other interfaces and coincidentally that
> obsoletes need in reverse name mapping.
> 
> It's painful for end users who will need to change configs/scripts,
> but it's one time job. Additionally from QEMU pov, codebase
> will be less messy => more maintainable which benefits not only
> developers but end-users in the end.
> 

I have to clarify the type->model mapping has been existing since the
model->type mapping was introduced with the help of CPU_RESOLVING_TYPE.
I mean the logic has been existing since the existence of CPU_RESOLVING_TYPE,
even the code wasn't there.

I'm not sure about the idea to switch to '-cpu <cpu-type-name>' since
it was rejected by Peter Maydell before. Hope Peter can double confirm
for this. For me, the shorter name is beneficial. For example, users
needn't to have '-cpu host-arm-cpu' for '-cpu host'.


> [rant:
> It's the same story repeating over and over, when it comes to
> changing QEMU CLI, which hits resistance wall. But with QEMU
> deprecation process we've changed CLI behavior before,
> despite of that world didn't cease to exist and users
> have adapted to new QEMU and arguably QEMU became a tiny
> bit more maintainable since we don't have to deal some
> legacy behavior.
> ]
> 

I need more context about 'deprecation process' here. My understanding
is both CPU typename and model name will be accepted for a fixed period
of time. However, a warning message will be given to indicate that the
model name will be obsoleted soon. Eventually, we switch to CPU typename
completely. Please correct me if there are anything wrong.


> Another idea back in the days was (as a compromise),
>   1. keep using keep valid_cpu_types
>   2. instead of introducing yet another way to do reverse mapping,
>      clean/generalize/make it work everywhere list_cpus (which
>      already does that mapping) and then use that to do your thing.
>      It will have drawbacks you've listed above, but hopefully
>      that will clean up and reuse existing list_cpus.
>      (only this time, I'd build it around  query-cpu-model-expansion,
>       which output is used by generic list_cpus)
>      [and here I'm asking to rewrite directly unrelated QEMU part yet again]
> 

I'm afraid that list_cpus() is hard to be reused. All available CPU model names
are listed by list_cpus(). mc->valid_cpu_types[] are just part of them and variable
on basis of boards. Generally speaking, we need a function to do reverse things
as to CPUClass::class_by_name(). So I would suggest to introduce CPUClass::model_from_type(),
as below. Could you please suggest if it sounds reasonable to you?

- CPUClass::class_by_name() is modified to
   char *CPUClass::model_to_type(const char *model)

- char *CPUClass::type_to_model(const char *type)

- CPUClass::type_to_model() is used in cpu_list() for every target when CPU
   model name, fetched from CPU type name, is printed in xxx_cpu_list_entry()

- CPUClass::type_to_model() is reused in hw/core/machine.c to get the CPU
   model name from CPU type names in mc->valid_cpu_types[].

Thanks,
Gavin

