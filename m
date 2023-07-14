Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp2856252dle;
        Thu, 13 Jul 2023 17:55:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFNJJLkrBxXAnVC7VqOnQ5pN+EBxZZ1UcnsFiYk72yAxtfVWCknEeySJqyoZgqhdvdTkJC6
X-Received: by 2002:ac8:57cc:0:b0:400:9896:b0fa with SMTP id w12-20020ac857cc000000b004009896b0famr4034689qta.64.1689296112831;
        Thu, 13 Jul 2023 17:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689296112; cv=none;
        d=google.com; s=arc-20160816;
        b=daB/VvsSjb4LF1E9feCif0B69M6Pu6FO5CQRXgo2wCf+L6zmTZlFMhj8YFICPBWymN
         72KLUjTX9lcHem0Dy9Yi1PJq89LVNbgjLh7/fDq7iZd1GCVccaknivFL2xQsTiepqOiF
         z6E909cTYmZgpXqBO93gMB4ivUC/7uh+1WUWGJSSJMGV59WJqIACmmnypABjttpiHanr
         JTol9385g6e7ej2RsAXk6BtnxxCGwBiS7DsIQ8G0Ul+tAKdyXVGRl7FQYZkjz7PTljQs
         6CrVX19hE/iOlL6a8gr7NJ8mf+veukFQpOYMxwZDjcWn7l1MjFZIqNNh2o3EWEXLhPqe
         4Ivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pZF99bZwxHh+aYHFUkyiI0Ad/SC2kuV7B8NSvKw9bog=;
        fh=w5a6y7BdSA2kyTdfg0nNOaUT26aL0BWENZqBmdXsrFU=;
        b=Xa7GXCxqIQUpmcbgE6l/nTeNhKBpq0FUPGz08ziClcLo6TCbM8JF4sJiMaiR3RjHMK
         eQ4JFrtmlqcqZpiINqFvn1pd9vD5MqIRiMs3tP++vBu/d2aOcjGbkAzw6tsQWGYKiMI3
         sRg2SpBlDN3tvjmBRlT50h0kg+QN4uDFuJmkFNGGYjuYHGSqqx3GuNZEgj/I/TxTBboE
         hyMJBNtdNSptobb4aXQTHH+Jv6hkFfrtw0gzxt1CX2ypFWLd94P9fiz2834t4B8ks5Ck
         tcNFYtWfunIxy6UZ0QJDK6iNnpyGNfLfoKvDFJGguQ7q2hgNxj7aMCV1ReAoZusNSKiu
         0Amw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fnRmxjmR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11-20020a05622a130b00b004039ba73decsi3798560qtk.642.2023.07.13.17.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jul 2023 17:55:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fnRmxjmR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qK757-0008Ol-FB; Thu, 13 Jul 2023 20:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qK755-0008ON-N3
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 20:54:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qK753-00007B-2K
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 20:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689296083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZF99bZwxHh+aYHFUkyiI0Ad/SC2kuV7B8NSvKw9bog=;
 b=fnRmxjmR948R0cCSkN41CK+AQr0xmcZb5AZG+ZTVj/ltqri1flfrv6mIi7TilYh4npRjtI
 LS0YamprehcCKx3NfOpeTD+aCWjgQFPXjeK/7fxvX83fG6UJZqVxkrqyWkRWJKGXgX2gEy
 rUe1yqf8aicUQlZ22IEVE2ANy3+RqpQ=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-kE9Tqi_QPLmjNBi6ogpgCg-1; Thu, 13 Jul 2023 20:54:42 -0400
X-MC-Unique: kE9Tqi_QPLmjNBi6ogpgCg-1
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-6b8757995eeso2028061a34.1
 for <qemu-arm@nongnu.org>; Thu, 13 Jul 2023 17:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689296081; x=1691888081;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pZF99bZwxHh+aYHFUkyiI0Ad/SC2kuV7B8NSvKw9bog=;
 b=BgpDvrB3fFqAa6hQ/G5SvMDz3FeTgRB/dsrR4iy+i8AoSN5SWMw1wZrhYoBs+7LbDM
 7whNZl+LPnY1jDDxMc2JwJJxWxgHQ7c8n+hEQeUnLAa4i8GnxFut/pAJ17CcwJGl016h
 uF6n30fIiZ+6BdW8DUEbgb5or2CrIrXmS5U5HzHCoksxfD0RjPAqScp42DbWhzuDITOg
 rbXPeWjEUHwGkAWnrmomLH8R6BnQWRUX16YgWtXwnzAwOD4u8de9NR4NwXHllfJayCz0
 WlWTS+u+5tfYIrR5X6E2TX1g29QzfPwdbhxWgXOxBRhpKScYGGbPrnrYiXvFeoQA6tvy
 HEpw==
X-Gm-Message-State: ABy/qLb9QcZJlsYaw1+xaRuSt/lhx3NbOlFb716VnfujyfC/6SJgGTHZ
 TUIhi7Kak5T8YeMpJ9yTcf8HENRaIE+/xs5Uo02/KaNishFSNvGKZ0NyMpAOYdfx18kEVWuBZ+S
 PIef0t8jF+PVY
X-Received: by 2002:a05:6358:9325:b0:134:c4dc:2c43 with SMTP id
 x37-20020a056358932500b00134c4dc2c43mr4206513rwa.28.1689296081369; 
 Thu, 13 Jul 2023 17:54:41 -0700 (PDT)
X-Received: by 2002:a05:6358:9325:b0:134:c4dc:2c43 with SMTP id
 x37-20020a056358932500b00134c4dc2c43mr4206481rwa.28.1689296080797; 
 Thu, 13 Jul 2023 17:54:40 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a62e907000000b0067e985d2526sm6171136pfh.149.2023.07.13.17.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 17:54:40 -0700 (PDT)
Message-ID: <c07e5e21-5c31-1aaf-a4c5-0484e47e1739@redhat.com>
Date: Fri, 14 Jul 2023 10:54:31 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] hw/arm/virt: Use generic CPU invalidation
To: Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, shan.gavin@gmail.com
References: <20230713054502.410911-1-gshan@redhat.com>
 <CAFEAcA8197FCwfNZrnxfO-87RveOko0Ju-KcTJOEi0vfjVtDKg@mail.gmail.com>
 <2d21e89f-c965-e8f1-3705-dfea8367fc7e@linaro.org>
 <3a392615-5aca-f384-197f-84beb3086a29@redhat.com>
 <21752231-e869-033f-2a48-d5f06d001a48@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <21752231-e869-033f-2a48-d5f06d001a48@linaro.org>
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
 NICE_REPLY_A=-0.096, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: oliSeDDUxP74

Hi Richard,

On 7/14/23 05:27, Richard Henderson wrote:
> On 7/13/23 13:34, Gavin Shan wrote:
>> On 7/13/23 21:52, Marcin Juszkiewicz wrote:
>>> W dniu 13.07.2023 o 13:44, Peter Maydell pisze:
>>>
>>>> I see this isn't a change in this patch, but given that
>>>> what the user specifies is not "cortex-a8-arm-cpu" but
>>>> "cortex-a8", why do we include the "-arm-cpu" suffix in
>>>> the error messages? It's not valid syntax to say
>>>> "-cpu cortex-a8-arm-cpu", so it's a bit misleading...
>>>
>>> Internally those cpu names are "max-{TYPE_ARM_CPU}" and similar for other architectures.
>>>
>>> I like the change but it (IMHO) needs to cut "-{TYPE_*_CPU}" string from names:
>>>
>>> 13:37 marcin@applejack:qemu$ ./build/aarch64-softmmu/qemu-system-aarch64 -M virt -cpu cortex-r5
>>> qemu-system-aarch64: Invalid CPU type: cortex-r5-arm-cpu
>>> The valid types are: cortex-a7-arm-cpu, cortex-a15-arm-cpu, cortex-a35-arm-cpu, cortex-a55-arm-cpu, cortex-a72-arm-cpu, cortex-a76-arm-cpu, a64fx-arm-cpu, neoverse-n1-arm-cpu, neoverse-v1-arm-cpu, cortex-a53-arm-cpu, cortex-a57-arm-cpu, host-arm-cpu, max-arm-cpu
>>>
>>> 13:37 marcin@applejack:qemu$ ./build/aarch64-softmmu/qemu-system-aarch64 -M virt -cpu cortex-a57-arm-cpu
>>> qemu-system-aarch64: unable to find CPU model 'cortex-a57-arm-cpu'
>>>
>>
>> The suffix of CPU types are provided in hw/arm/virt.c::valid_cpu_types in PATCH[2].
>> In the generic validation, the complete CPU type is used. The error message also
>> have complete CPU type there.
>>
>> Peter and Marcin, how about to split the CPU types to two fields, as below? In this
>> way, the complete CPU type will be used for validation and the 'internal' names will
>> be used for the error messages.
>>
>> struct MachineClass {
>>      const char *valid_cpu_type_suffix;
>>      const char **valid_cpu_types;
> 
> While you're changing this:
> 
> const char * const *valid_cpu_types;
> 

yes, will do.

>> };
>>
>> hw/arm/virt.c
>> -------------
>>
>> static const char *valid_cpu_types[] = {
> 
> So that you can then do
> 
> static const char * const valid_cpu_types[]
> 

yes, will do.

Thanks,
Gavin

