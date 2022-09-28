Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp630855ocs;
        Wed, 28 Sep 2022 16:16:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5xKdG1n0/3YS9JQfCYJL3zbIRnzpU2HNup5Xj0BzMtYxp3L/+kbbrpoachat9TBD5HLLOt
X-Received: by 2002:a05:620a:892:b0:6ce:3d8e:3a58 with SMTP id b18-20020a05620a089200b006ce3d8e3a58mr345873qka.133.1664407016392;
        Wed, 28 Sep 2022 16:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664407016; cv=none;
        d=google.com; s=arc-20160816;
        b=fN7eA9HYvCrLrGO9gO9zZmkjYXW7GhRowJsjVxId0h33THIDgud4yGylOBxeugxIGS
         1YCoKMqzPrdYdwfYXdf/dP76gN+vUcxOg3igSTqZvWrJ7hpUlIyXYjyhSv6qT+DhLjXg
         Sp9RyGBtbasI23M2nsjvmqjuNNhaXRd940UdnKutl9EpVTD05USmwonDxqrzzFyfz1eK
         NPn/TQBlRLpKKC8V+eNZK2hP6DDo21qpcn1x7at1qUc2GaLx7gIfE5I1hW+w5l7FYsq1
         lRbDGByd++kOfLdQN9ppLUYsG0bFftT++YAwipQni461in/J1dvzkntKtYsvouF2c7pu
         SXfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=e1jrYJ+kglX03W4nBmi5CZ2KjUjK5QDmGP96FkJhQZo=;
        b=p89HoyZSN/M2y4Yq0H+SzLSvHDfyeSNOPFy10H1JDfjYEGwoz8JeAfXbW4Ym7CuL4x
         6YCtuCBEwxF0Xi19Rcnf+cBbG32XwPp8JedIV6xEd3zpqxErHk73UqxjYVlVBWb60CFo
         hu8rp08JkEA4xyl/oe07Ps5wpEA6L5pbBpMIssfItwrYLOGjUaObxO4WMEmcAOWzuJni
         PNxZ7b94j7lSIUNwlivsu84kTtj6HblLK1+ANMeMaKEPpKmLjtq6KsFmwG3ng/MrkKT+
         cyQgebiVHzj8TCsnNJ5w52ymQVyIHS6lb3mrc03O7NuJ8EorQ7HZwCA9RddRu6vqnqSm
         v4Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LxnECKsI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13-20020a0562140c4d00b004768cb62b66si3366431qvj.87.2022.09.28.16.16.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Sep 2022 16:16:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LxnECKsI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odgIQ-0005lB-RH
	for alex.bennee@linaro.org; Wed, 28 Sep 2022 19:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1odgHl-0005jM-U8
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 19:16:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1odgHh-00005a-RK
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 19:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664406969;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1jrYJ+kglX03W4nBmi5CZ2KjUjK5QDmGP96FkJhQZo=;
 b=LxnECKsIR/8actZdjaj8fCkxROlY/buh8H6+XIoAgBVVePfa83cs4wXDiNOMoylNWiChZD
 zYPy93eou3N2lzJP8R7k0BgVppqxloYjQyOpToJA5DVFSlCsQBt0NwXs4cljLZMy9R5Ziw
 U6CbmUZMThmPqs5gOWWozDysL3+e9w8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-keQ_6p2VOW-IUbGFdGeX-A-1; Wed, 28 Sep 2022 19:16:06 -0400
X-MC-Unique: keQ_6p2VOW-IUbGFdGeX-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6102D811E67;
 Wed, 28 Sep 2022 23:16:06 +0000 (UTC)
Received: from [10.64.54.143] (vpn2-54-143.bne.redhat.com [10.64.54.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C8087AE5;
 Wed, 28 Sep 2022 23:16:02 +0000 (UTC)
Subject: Re: [PATCH v3 3/5] hw/arm/virt: Introduce variable region_base in
 virt_set_high_memmap()
To: eric.auger@redhat.com, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-4-gshan@redhat.com>
 <6e1b2667-b561-51ac-57af-123a393fc677@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <4e53182d-89f5-cd9e-fe71-073251bfe385@redhat.com>
Date: Thu, 29 Sep 2022 09:15:59 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <6e1b2667-b561-51ac-57af-123a393fc677@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +7hwiC2MddHp

Hi Eric,

On 9/28/22 10:10 PM, Eric Auger wrote:
> On 9/22/22 01:13, Gavin Shan wrote:
>> This introduces variable 'region_base' for the base address of the
>> specific high memory region. It's the preparatory work to optimize
>> high memory region address assignment.
> Why is it a preparatory work (same comment for previous patch, ie [2/5]
> ). Are those changes really needed? why?
> 

In PATCH[4/5], @base argument is added to virt_set_high_memmap(), to
represent current global base address. With the optimization applied
in PATCH[4/5], @base isn't unconditionally updated to the top of the
iterated high memory region. So we need @region_base here (PATCH[3/5])
to track the aligned base address for the iterated high memory region,
which may or may be not updated to @base.

Since we have @region_base in PATCH[3/5], it'd better to have @region_size
in PATCH[2/5].

Actually, PATCH[1-3/5] are all preparatory patches for PATCH[4/5]. My
intention was to organize the patches in a way to keep the logical
change part simple enough, for easier review.

Thanks,
Gavin

>>
>> No functional change intended.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 187b3ee0e2..b0b679d1f4 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1692,15 +1692,15 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>   static void virt_set_high_memmap(VirtMachineState *vms,
>>                                    hwaddr base, int pa_bits)
>>   {
>> -    hwaddr region_size;
>> +    hwaddr region_base, region_size;
>>       bool fits;
>>       int i;
>>   
>>       for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
>> +        region_base = ROUND_UP(base, extended_memmap[i].size);
>>           region_size = extended_memmap[i].size;
>>   
>> -        base = ROUND_UP(base, region_size);
>> -        vms->memmap[i].base = base;
>> +        vms->memmap[i].base = region_base;
>>           vms->memmap[i].size = region_size;
>>   
>>           /*
>> @@ -1709,9 +1709,9 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>>            *
>>            * For each device that doesn't fit, disable it.
>>            */
>> -        fits = (base + region_size) <= BIT_ULL(pa_bits);
>> +        fits = (region_base + region_size) <= BIT_ULL(pa_bits);
>>           if (fits) {
>> -            vms->highest_gpa = base + region_size - 1;
>> +            vms->highest_gpa = region_base + region_size - 1;
>>           }
>>   
>>           switch (i) {
>> @@ -1726,7 +1726,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>>               break;
>>           }
>>   
>> -        base += region_size;
>> +        base = region_base + region_size;
>>       }
>>   }
>>   
> 

