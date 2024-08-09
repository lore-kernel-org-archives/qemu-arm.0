Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp807151njc;
        Fri, 9 Aug 2024 02:39:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVUQ3j04xEfWwEBVQhUzPJ7S8y/PrRSYOBBAFS0CCZtTs65YwMDqXuy0ONEca4aKzjQy6m2nA7BpdD3Vg==@linaro.org
X-Google-Smtp-Source: AGHT+IHKPr66pE8UsOQMJNXqc+CqD9DLZlzvfPQiDBoh3oHMTDP4gDJx1SLR1e8veNKCc+7qBNVo
X-Received: by 2002:a05:690c:17:b0:63b:d711:e722 with SMTP id 00721157ae682-69ec4b0e35cmr10544117b3.1.1723196392144;
        Fri, 09 Aug 2024 02:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723196392; cv=none;
        d=google.com; s=arc-20160816;
        b=o7GfbCJbafWFhxsQs1mz2VY26MrzFSzaNA2kdiTnWqeQOj78J3w9lb+Gr+mReuiF8M
         SZmc96xcCo49VLJtOHju7ryXtdGz9STmEo+tLWT0n1R1ssDjuIXHZfDVXp+1g9z36L5U
         +n1CFUnhFv9J6HxS6bn0+k7gUWaGAdIoL5zU5fMUHzxIBCgUmY3GP0lSuwHJ0dnQqtJt
         hwcN1kTBDX74V/mQiQ2gxdewO4kdhkA4vuKVGo5uxeoTqQfDiH7p2tk7AslXcn0tGwcg
         OaTuXIAzU57xTctQvUsVFUK3DA5EAfbrSeLyzwoK1VdHQ6UgeB0tcAdtkzTqN5DBnDWB
         bP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=saM/xkfKcVoXunhXuQeDRUAo9xzzmY9xbqpMgYaXrVY=;
        fh=RlG/M+sxXJiPgVNN8Sx76WPoY6SyjFnkjv01G5ARAEY=;
        b=HIX5OUW0GbseCkU2oZuZSTmdJTki0m9Sf7xbKFXM3EtarSj072DvLL0DD5iefx7Uh4
         wylUmIEA74vL0ast1EvBbZ7nUALcXg4n2kf7xWm7wUj/KScsTAPRWbm7uNviA6uChXrw
         dD5xU+eAz4MxGtGRAmG2dauvMsOCUjQtjQPIJn8/7JeRSNP1oORU499IP7awq03mrnn1
         RyKJY/PpAWHsmyCPV4Vs0a4BqhKK/Lk7yyMlAr7m4dYi1QPHmTTIUduNYlS3TboqfXMf
         dKtjfXJWggQD8fUl71UtzlLC1gg2OH1rUeFb0QuI1FlHAjmMt+HxqfdRZ5hL6wrin2H3
         nLUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wyc1LexV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a37882993dsi632326585a.400.2024.08.09.02.39.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2024 02:39:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wyc1LexV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1scM5j-00027L-2C; Fri, 09 Aug 2024 05:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1scM5h-00023Y-KP
 for qemu-arm@nongnu.org; Fri, 09 Aug 2024 05:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1scM5g-0001Ax-5D
 for qemu-arm@nongnu.org; Fri, 09 Aug 2024 05:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723196359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=saM/xkfKcVoXunhXuQeDRUAo9xzzmY9xbqpMgYaXrVY=;
 b=Wyc1LexVrBcQl6Vgrr3AmFHNzq7FFpID/ePG3cYnAf/zBctqwchYAr3M6sTzwjDIn3RZys
 TFBymbNjsN65vyHm3D9o7KpzY9My0EFxbWxvtkbOx0elDhy6/jBUEKMK68HuDVAzjQ/rlT
 tVIMXQFaptd2Fk5N00OQ6qRGtikLhPE=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-f8lgORadNDyC3y3npJTwwA-1; Fri, 09 Aug 2024 05:39:17 -0400
X-MC-Unique: f8lgORadNDyC3y3npJTwwA-1
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-7a3c6dd559aso2211221a12.1
 for <qemu-arm@nongnu.org>; Fri, 09 Aug 2024 02:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723196356; x=1723801156;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=saM/xkfKcVoXunhXuQeDRUAo9xzzmY9xbqpMgYaXrVY=;
 b=A0odbMZulQKkcFlcpZ0bvRaT44bfsd44LYMc7IXWX2chI9W1/9YyjpDuRL2iphOS3N
 +WcKIs6bXROUuXLy4Ha6gXfGuQU1CIKfxJ14zzTQY42BqYQ3YJf2zRLtwURVksmtBXoO
 pLMPwF/dFM915pxsSRS3UUPWxpbgmugdI8lHZ65g1GnGzVc2Y8XD/yT9kOrYKShE8BZ4
 VTxTC+b+EF3KtfUuG2SEOkKkaHcPbbEBGLLCXKYdfgDIFTECFfPgWiIQN0Ce9ZDRXpJE
 /qRpeyulm7P6CP35mt4hqcGDcDXfAZa+rMbobY50tIS8OBq9c3bNq9iS7ooSy7rkwKkK
 OP0Q==
X-Gm-Message-State: AOJu0YzNagtMWPBGX7EOHqkVtKgQJJurwxN2yMAMNA3s9d1Tm5XvQbL4
 jxm2DUacqQfEgafSPxZs3XuuwW7W1abCVLTEI72k6h4rJA4ZwFqvxKpuGGBaFMqDtlz5NyEbOOo
 9FmVE8h2tfYtiL5xjBYdwugVPqw/yZewe62zxkjn3Jh+HAsgPIx1u+O8qVg==
X-Received: by 2002:a17:902:d48d:b0:1f9:f3c6:ed37 with SMTP id
 d9443c01a7336-200ae4f98a5mr9660905ad.14.1723196355669; 
 Fri, 09 Aug 2024 02:39:15 -0700 (PDT)
X-Received: by 2002:a17:902:d48d:b0:1f9:f3c6:ed37 with SMTP id
 d9443c01a7336-200ae4f98a5mr9660735ad.14.1723196355262; 
 Fri, 09 Aug 2024 02:39:15 -0700 (PDT)
Received: from [192.168.68.54] ([43.252.112.201])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff58f5346csm138690485ad.66.2024.08.09.02.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 02:39:14 -0700 (PDT)
Message-ID: <eea906ac-0a46-4ce9-b81a-813e9f730548@redhat.com>
Date: Fri, 9 Aug 2024 19:39:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] hw/arm/virt: hide virt_kvm_type() on !CONFIG_KVM
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 philmd@linaro.org, richard.henderson@linaro.org, shan.gavin@gmail.com
References: <20240809035134.699830-1-gshan@redhat.com>
 <20240809035134.699830-2-gshan@redhat.com>
 <CAFEAcA_KWo2fkiFJ4CrznNkti7bdp_QTXWEdc2nJtd-a6=SPpw@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <CAFEAcA_KWo2fkiFJ4CrznNkti7bdp_QTXWEdc2nJtd-a6=SPpw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: b7osUopOe7Cd


On 8/9/24 7:00 PM, Peter Maydell wrote:
> On Fri, 9 Aug 2024 at 04:52, Gavin Shan <gshan@redhat.com> wrote:
>>
>> virt_kvm_type() and mc->kvm_type() are only needed when CONFIG_KVM
>> is enabled. It's reasonable to hide them when CONFIG_KVM is disabled.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 719e83e6a1..83be57db37 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2991,6 +2991,7 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>>    * for arm64 kvm_type [7-0] encodes the requested number of bits
>>    * in the IPA address space
>>    */
>> +#ifdef CONFIG_KVM
>>   static int virt_kvm_type(MachineState *ms, const char *type_str)
>>   {
>>       VirtMachineState *vms = VIRT_MACHINE(ms);
>> @@ -3025,6 +3026,7 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
>>        */
>>       return fixed_ipa ? 0 : requested_pa_size;
>>   }
>> +#endif /* CONFIG_KVM */
>>
>>   static void virt_machine_class_init(ObjectClass *oc, void *data)
>>   {
>> @@ -3084,7 +3086,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>   #endif
>>       mc->valid_cpu_types = valid_cpu_types;
>>       mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
>> +#ifdef CONFIG_KVM
>>       mc->kvm_type = virt_kvm_type;
>> +#endif
>>       assert(!mc->get_hotplug_handler);
>>       mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
>>       hc->pre_plug = virt_machine_device_pre_plug_cb;
> 
> This adds extra ifdefs to the source code -- is there any
> reason why we need them? If nothing goes wrong, I'd
> prefer not to clutter the source with thme.
> 

There is nothing wrong in current code. Actually, it's preparatory work
to replace kvm_arm_get_max_vm_ipa_size() with kvm_arch_get_default_type()
in mc->kvm_type() in PATCH[3/4]. kvm_arch_get_default_type() is visible
only when CONFIG_KVM is enabled.

Thanks,
Gavin

