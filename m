Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp1953648ejb;
        Sun, 30 Jul 2023 22:34:28 -0700 (PDT)
X-Google-Smtp-Source: APBJJlETgjGdfkngqX08StYDpxjfSdvLlJkRNFsdXrrTdkrA6v9B7EFwXDECEZrdgJO+cQWSMHRH
X-Received: by 2002:ac8:5f91:0:b0:40b:b39a:eb4d with SMTP id j17-20020ac85f91000000b0040bb39aeb4dmr6624959qta.43.1690781668093;
        Sun, 30 Jul 2023 22:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690781668; cv=none;
        d=google.com; s=arc-20160816;
        b=XVhTD0lJg6JzrviRRxhIAYV4k8PgYzgqaVzPZO2dR/xunzd5pVyituSMrtTmgAD2fK
         W0k/tljou4zs41pxEg3yUGPAG7I3RZAeAQnQ8K2+jAhSRrV6yaI331+9LvRF0mAy1JYq
         9Vmv8vYIOdm4b1/4ND4UBPvOzWzortblZCtDbjrLYcKC3ymcQOv+fexOZDN/wxtddUmg
         9Upqar3JuCSTx0loswI+X7dg9D2DMvpQ1qyBMoVBaIfcOF18asDvDKYHLMlFBtfN7JQy
         FajGY9IzxJkTbds0cu5zyyIWxUaeO5d3wa1VhKUhhMVIEnvs0FUipf1IdWAJRwBIJOba
         wyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=orzf4vpttn9IT/9TBL80GRKgt3M6BExqqgcTsFw9qBI=;
        fh=2i+0HmulVhkVmsJZJ7DQ/g8gxtPOOs0jQlE7O3/dr2c=;
        b=e2vVKdSWNpFv7VW3OfsM8wQbV3MNtdKHbzJ5XJVDqO2MYTWbS3uGhiaBS+pu81FPQf
         8Ia7vimnqEUYzAXmQc19u6KUGlSWbUBQbIbK3zine3k/MGFQtIPSzX8Aue/yGgnfIjy0
         sl0RB3O+lCNGNfnqdCkDL2m6KMajvSZ0K1jf6XxazYTGMCuh1Pz+iRb7b35Ls23Evc20
         oESQOQffdgiV8tq+nXp1cFar4neUw34J4Yvqi+sJR3nD/ZKj84tVavYqirKCP4Z5gY/D
         83Ni13wRzEGS+Bwir0Tblos/cFCkOu/VT098ZMDWoHML2WSfCtG6RGI9ctNc9pAE90D1
         jQMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=icFCrhiC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020ac87e8c000000b004039bcc4d87si5394125qtj.313.2023.07.30.22.34.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jul 2023 22:34:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=icFCrhiC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQLXX-00069m-PA; Mon, 31 Jul 2023 01:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qQLXV-00068l-M0
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 01:33:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qQLXT-0004Ed-Cu
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 01:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690781630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orzf4vpttn9IT/9TBL80GRKgt3M6BExqqgcTsFw9qBI=;
 b=icFCrhiCsdREx813YD+tGpddqzqoKYvHf7L0KM8/AdX8n5CdSqXMQD/+w+NGoiMwT6vAj7
 y/Kq4SitNQvveWv8TTfiJKUBQ4uIzwUcjQysRTiqPv+y7pRIpqthNxq0Qwj8VmDhcsRPak
 Wd1Wp89xZs1oUTDLRl93SyedIlHzUUg=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-KyzUZa3kN3OFvN31eN2LeQ-1; Mon, 31 Jul 2023 01:33:48 -0400
X-MC-Unique: KyzUZa3kN3OFvN31eN2LeQ-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1bba760f2c6so29097515ad.2
 for <qemu-arm@nongnu.org>; Sun, 30 Jul 2023 22:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690781627; x=1691386427;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=orzf4vpttn9IT/9TBL80GRKgt3M6BExqqgcTsFw9qBI=;
 b=CvCLDStkNtBlj0oAY5cAxL0FgcNtzxdiKzi9sU5BaIeXNQfT0L1vHhTScJ29md/HdW
 Hc+l2kFiSn/gvdpenTqvIxC1Yhqa0/lnHerx5qXLZK9oRu/v4ANsvwqyU4h4y7HiMZi4
 7Bbcb6ijUaikdontKWsRvEkAUXYTz9CpUz5CUi/2rQDTgzS8cYxlNWU4sSxHHRArGsq/
 M6ZjGUR3AcIDbWDAdIgKz2+fnijhEqbwUwqn09ShDBvDXEUwqN5tCnVRPAsqXC/kDJS2
 yv7KOj4yMce3tQ/+qWSVy28M3eECN965NBBC87dsFpPNvtIzVtMefndGvwxb6F7IexER
 aUPw==
X-Gm-Message-State: ABy/qLZ0+Ut/Zu50ZRzmmYYlJCBb4DpZcb7QM05tm2nRKlJKXOBPGtrN
 CdH5WxZNkkFGRoe/cd82ukUmV8QJ9DoZSS9X/mxOcRXwX3I8xbloscnlxvTRU1CKW1LTPng3084
 YOro4kvmLLP/a
X-Received: by 2002:a17:902:8483:b0:1b9:de3e:7a59 with SMTP id
 c3-20020a170902848300b001b9de3e7a59mr8561658plo.10.1690781627571; 
 Sun, 30 Jul 2023 22:33:47 -0700 (PDT)
X-Received: by 2002:a17:902:8483:b0:1b9:de3e:7a59 with SMTP id
 c3-20020a170902848300b001b9de3e7a59mr8561627plo.10.1690781627263; 
 Sun, 30 Jul 2023 22:33:47 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a170902a38d00b001b9cf522c0esm7626384pla.97.2023.07.30.22.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jul 2023 22:33:46 -0700 (PDT)
Message-ID: <6150f429-e3c8-786d-7722-39ca75fcb87a@redhat.com>
Date: Mon, 31 Jul 2023 15:33:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/8] machine: Print supported CPU models instead of
 typenames
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, laurent@vivier.eu, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, shan.gavin@gmail.com
References: <20230726003205.1599788-1-gshan@redhat.com>
 <20230726003205.1599788-4-gshan@redhat.com>
 <24e54bac-9149-20da-e4cf-5829a6dcb174@linaro.org>
 <0454c1ad-314c-3df6-d6e9-1a05cb4c4050@redhat.com>
 <af279f3d-35b9-e782-8d55-98cd6b3ceb80@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <af279f3d-35b9-e782-8d55-98cd6b3ceb80@linaro.org>
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
X-TUID: qq5VgBuDhvVB


On 7/28/23 00:27, Richard Henderson wrote:
> On 7/26/23 22:16, Gavin Shan wrote:
>>
>> On 7/27/23 09:08, Richard Henderson wrote:
>>> On 7/25/23 17:32, Gavin Shan wrote:
>>>> -static const char *q800_machine_valid_cpu_types[] = {
>>>> +static const char * const q800_machine_valid_cpu_types[] = {
>>>>       M68K_CPU_TYPE_NAME("m68040"),
>>>>       NULL
>>>>   };
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
>>    1 All CPU model names are mappinged to fixed CPU typename;
>>    2 CPU model name is same to CPU typename;
>>    3 CPU model name is alias to CPU typename;
>>    4 CPU model name is prefix of CPU typename;
>>
>>    Target         Categories    suffix-of-CPU-typename
>>    -------------------------------------------------------
>>    alpha          -234          -alpha-cpu
>>    arm            ---4          -arm-cpu
>>    avr            -2--
>>    cris           --34          -cris-cpu
>>    hexagon        ---4          -hexagon-cpu
>>    hppa           1---
>>    i386           ---4          -i386-cpu
>>    loongarch      -2-4          -loongarch-cpu
>>    m68k           ---4          -m68k-cpu
>>    microblaze     1---
>>    mips           ---4          -mips64-cpu  -mips-cpu
>>    nios2          1---
>>    openrisc       ---4          -or1k-cpu
>>    ppc            --34          -powerpc64-cpu  -powerpc-cpu
>>    riscv          ---4          -riscv-cpu
>>    rx             -2-4          -rx-cpu
>>    s390x          ---4          -s390x-cpu
>>    sh4            --34          -superh-cpu
>>    sparc          -2--
>>    tricore        ---4          -tricore-cpu
>>    xtensa         ---4          -xtensa-cpu
> 
> That is unfortunate, however...
> 
> 
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
>>      char *CPUClass::model_by_typename(const char *typename);
>>
>> (c) As we discussed before, use mc->valid_cpu_type_suffix and mc->valid_cpu_models
>> because the CPU type check is currently needed by target arm/m68k/riscv where we
>> do have fixed pattern to convert CPU model names to CPU typenames. The CPU typename
>> is comprised of CPU model name and suffix. However, it won't be working when the CPU
>> type check is required by other target where we have patterns other than this.
> 
> (d) Merge the two arrays together and use macro expansion, e.g.
> 
> typedef struct {
>      const char *name;
>      const char *type;
> } Something;
> 
> #define ARM_SOMETHING(x)  { x, ARM_CPU_TYPE_NAME(x) }
> 
> static const Something valid[] = {
>      ARM_SOMETHING("cortex-a53"),
>      { NULL, NULL }
> };
> 
> where Something ought to be better named.
> 

Thanks, Richard. It's a nice idea, but not generalized enough. Igor suggested
to reuse the existing list_cpus() in another reply, and I suggested to add
CPUClass::type_to_model() to convert CPU type name to model name for every
target. Please take look and comment when you get a chance.

   https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00659.html

Thanks,
Gavin

