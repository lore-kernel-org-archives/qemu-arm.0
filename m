Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp506371ocb;
        Tue, 4 Oct 2022 15:48:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6MyRWoyMMBluur7IGVUZhf9wcYqhyllM9p9LMw0I22Lr7DLsmu13xa/+Z7V8wvlGjvkQ00
X-Received: by 2002:a05:620a:14a2:b0:6ce:8b5:a21f with SMTP id x2-20020a05620a14a200b006ce08b5a21fmr18451409qkj.450.1664923724689;
        Tue, 04 Oct 2022 15:48:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664923724; cv=none;
        d=google.com; s=arc-20160816;
        b=v5+iQjw47TzCApNi5qBarnetDKjxAIOJf7g05GdsaIxcCq2ACCMfLALNf/Z/PCBGtg
         1LC0RK0GgZS4/Xul20iKwibsiUiiPdR3GtsKFIpy3iBGv3mDPEmhURp0d6H+bsBRWim3
         PHV/m8hqHdQL2vnx+qfOBfMYCUTSBwYfIhpIKURXShV4J3RWTipztJLEvxSozUN8P0d/
         RJG7oYYpNUf1D6DMDFLmvFPqYy9iJFsRnPjKLN+3b3JRFfiIur9ntiHlBghJkcY3uNXD
         LR6vqMH6T1DEYmm2RIzRHe7l6AZNZttDOHwWNEOkCu+VAnLs4jJkahDdT27oJVKnUu2p
         kGFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=PPbr3QCqtzr0g+MtjmAnmregqIcr6LBz7fse6xCfF38=;
        b=apqseYqOcWE5nA37LHle9suEpC5y7HS8s1PQgKU4JuwFcyxeHMjfkYxQeB9qRPBGpt
         sF8Nu9YTSytnlhxHQyQ63zNYommVowSKMU+ah4lu1MlVicwV/Ajvl15/ycYeTaytL76l
         Zh52q1AWQA0SLEa3GQMEM27JqL1YcftTbkhQ+za1xggPnUtg75LVzUrwAxV0f4virIkp
         tcnQLiV0nt0ioKz2SSdrn6AU84EQ4CDfElrLpMzuSsptrxGQOWI2w9hnTpzBSugBnyXo
         n5pZs0C/C4batnf9CTzfVFDdTQSdr6SLrcqtrrXI/Yc8GZ4qFddZUtyuUDac+uR7k4XJ
         BefQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aV5Yy4j6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5-20020a056214194500b004b1c8f75ec7si58687qvk.243.2022.10.04.15.48.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Oct 2022 15:48:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aV5Yy4j6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofqiS-0005us-1H
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 18:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofqha-0005tC-UK
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 18:47:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofqhX-0003BM-Ld
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 18:47:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664923667;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PPbr3QCqtzr0g+MtjmAnmregqIcr6LBz7fse6xCfF38=;
 b=aV5Yy4j62SSXwKoQjYMHyl3FSr5IBc7wHNIU87UYxrNObuKRwA2g5yOBDUOiNW1EBweI2q
 +R6YcpjBgFGex+sqEShFosnHVUCzfxtb7xoijIM1xYuynQDRZWiAhDM9E3g4zbvQQrLUlz
 jGdI1aKb4UUhaSpQY6TbO2JiTBF+MTE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-DC0Swd7IO1SffHyBx__z5A-1; Tue, 04 Oct 2022 18:47:42 -0400
X-MC-Unique: DC0Swd7IO1SffHyBx__z5A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E7CC3C01D89;
 Tue,  4 Oct 2022 22:47:41 +0000 (UTC)
Received: from [10.64.54.56] (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00EC4140EBF3;
 Tue,  4 Oct 2022 22:47:37 +0000 (UTC)
Subject: Re: [PATCH v4 4/6] hw/arm/virt: Introduce
 virt_get_high_memmap_enabled() helper
To: Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20221004002627.59172-1-gshan@redhat.com>
 <20221004002627.59172-5-gshan@redhat.com> <87edvnooqb.fsf@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <a4bb90c8-3793-23ec-79a6-edf44565c8ff@redhat.com>
Date: Wed, 5 Oct 2022 06:47:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <87edvnooqb.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.449, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GTf32gpiwhd7

Hi Connie,

On 10/4/22 6:41 PM, Cornelia Huck wrote:
> On Tue, Oct 04 2022, Gavin Shan <gshan@redhat.com> wrote:
> 
>> This introduces virt_get_high_memmap_enabled() helper, which returns
>> the pointer to vms->highmem_{redists, ecam, mmio}. The pointer will
>> be used in the subsequent patches.
>>
>> No functional change intended.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c | 30 +++++++++++++++++-------------
>>   1 file changed, 17 insertions(+), 13 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index b0b679d1f4..59de7b78b5 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1689,14 +1689,29 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>       return arm_cpu_mp_affinity(idx, clustersz);
>>   }
>>   
>> +static inline bool *virt_get_high_memmap_enabled(VirtMachineState *vms,
>> +                                                 int index)
>> +{
>> +    bool *enabled_array[] = {
>> +        &vms->highmem_redists,
>> +        &vms->highmem_ecam,
>> +        &vms->highmem_mmio,
>> +    };
>> +
>> +    assert(index - VIRT_LOWMEMMAP_LAST < ARRAY_SIZE(enabled_array));
> 
> I wonder whether we want an assert(ARRAY_SIZE(extended_memmap) ==
> ARRAY_SIZE(enabled_array))? IIUC, we never want those two to get out of
> sync?
> 

Yeah, It makes sense to ensure both arrays synchronized. I will add
the extra check in next respin.

>> +
>> +    return enabled_array[index - VIRT_LOWMEMMAP_LAST];
>> +}
>> +

Thanks,
Gavin

