Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp718537ejn;
        Wed, 19 Oct 2022 16:09:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Tv9wRRlcb6fzEDpmVUG31UOGqbWjZZojGSHyEYg09jTe/Imz/LeOgZiFDbNzyIsir/iu6
X-Received: by 2002:a0c:e087:0:b0:4b8:ff9:f760 with SMTP id l7-20020a0ce087000000b004b80ff9f760mr498750qvk.52.1666220962788;
        Wed, 19 Oct 2022 16:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666220962; cv=none;
        d=google.com; s=arc-20160816;
        b=hiDLsWDsyS+9W8rg/AGwfqbxgJPvt4xd5L+rqsjGJWCQxlLrkoOt3vmomSPGE0CmIv
         ov/osTwKUNbdEY0UaeBcyuFHElIRYPP8Aa1bTvFSDIm9/WpprY/SQFMAwMHpboriAqro
         pE4zH+omlUrITCIBJGI3ndzr3LwU9X/drnCSglRIpFaMtjOaNSxKZI/BvBC26rC6I2qi
         FxZQnkNDp7tAzWPIrEgBLjTInOwunt9dwwnZZOsg8ZSbzIhXof/LfU3Toq2sb6Ew+EnY
         qMSA/Dsn2nWos0Xmvgo/pHfhmETUFWILkLAbpkyRk0qLnSyiN/ERWzSe3O/zDRU9LQjK
         eVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=UqS0OaRTclrvQS1F++P6OcXZ7D4qL/lGMqMKXJUVXMI=;
        b=uKSeE2GJ0eARDJ6cFk1rZX7f0sPgtARqG0Oz6i6lInh01QxLwABve0qMxmIpM7ex/c
         8S/KG3YlEGvrm6O7v8m9yhaCcSmfrBWipSBGziBXQ5yuV7sDVDYhjOf+nwHUwu8WavW2
         4q9TDRZfNm9dm9WexoOZIGHA/kPYpJeGTJ8ecD1t3+xSWus3yB22iyuhaCiWwuV8q6iz
         n05umpvhB9AE3GsyqdKXbU4ekWaz7J8LvrC3WEqxotJO5aj7dzCatmKpxy4LEAEZzjpc
         yqd0ZhZ7v9SpOW7zE6v/cFESH6Ps5+owoo+KJGVfoZvoau+Yeln8s4a4b8thn3X0yyp9
         236Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=USOqjXH7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12-20020a05620a28cc00b006cf427bc181si10693235qkp.8.2022.10.19.16.09.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 16:09:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=USOqjXH7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olIBY-0004vy-NK
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 19:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1olIBK-0004vM-PZ
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 19:09:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1olIBI-00027o-TI
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 19:09:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666220939;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UqS0OaRTclrvQS1F++P6OcXZ7D4qL/lGMqMKXJUVXMI=;
 b=USOqjXH7iyCn1HGBfVq7YeruD2TrR614IihWVbVbHCN1USm8GAsI0OUj3PqWBnMUL+hRFn
 dgANA44BSY4Hd7KE2vpTrCy2oEH7Q8HwVh3+lviA1DD3LWQCkOqoHZ5ZBIceOX/y4J4atj
 pUu3N10Bm4pqqt7hCJfQnag+JJRtvCo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-sq2h0_VqPwOyUkh8rj6Gnw-1; Wed, 19 Oct 2022 19:08:57 -0400
X-MC-Unique: sq2h0_VqPwOyUkh8rj6Gnw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74F2D185A794;
 Wed, 19 Oct 2022 23:08:57 +0000 (UTC)
Received: from [10.64.54.70] (vpn2-54-70.bne.redhat.com [10.64.54.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDDB52027061;
 Wed, 19 Oct 2022 23:08:53 +0000 (UTC)
Subject: Re: [PATCH v5 6/6] hw/arm/virt: Add 'compact-highmem' property
To: Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20221011231832.149839-1-gshan@redhat.com>
 <20221011231832.149839-7-gshan@redhat.com> <87wn8vzze9.fsf@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <678052ed-2dbd-05c2-2e42-6b4ffa55f633@redhat.com>
Date: Thu, 20 Oct 2022 07:08:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <87wn8vzze9.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: oXGsWTuXNsTs

Hi Connie,

On 10/19/22 10:00 PM, Cornelia Huck wrote:
> On Wed, Oct 12 2022, Gavin Shan <gshan@redhat.com> wrote:
> 
>> After the improvement to high memory region address assignment is
>> applied, the memory layout can be changed, introducing possible
>> migration breakage. For example, VIRT_HIGH_PCIE_MMIO memory region
>> is disabled or enabled when the optimization is applied or not, with
>> the following configuration.
>>
>>    pa_bits              = 40;
>>    vms->highmem_redists = false;
>>    vms->highmem_ecam    = false;
>>    vms->highmem_mmio    = true;
>>
>>    # qemu-system-aarch64 -accel kvm -cpu host    \
>>      -machine virt-7.2,compact-highmem={on, off} \
>>      -m 4G,maxmem=511G -monitor stdio
>>
>>    Region            compact-highmem=off         compact-highmem=on
>>    ----------------------------------------------------------------
>>    RAM               [1GB         512GB]        [1GB         512GB]
>>    HIGH_GIC_REDISTS  [512GB       512GB+64MB]   [disabled]
>>    HIGH_PCIE_ECAM    [512GB+256MB 512GB+512MB]  [disabled]
>>    HIGH_PCIE_MMIO    [disabled]                 [512GB       1TB]
>>
>> In order to keep backwords compatibility, we need to disable the
>> optimization on machines, which is virt-7.1 or ealier than it. It
>> means the optimization is enabled by default from virt-7.2. Besides,
>> 'compact-highmem' property is added so that the optimization can be
>> explicitly enabled or disabled on all machine types by users.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
>> ---
>>   docs/system/arm/virt.rst |  4 ++++
>>   hw/arm/virt.c            | 47 ++++++++++++++++++++++++++++++++++++++++
>>   include/hw/arm/virt.h    |  1 +
>>   3 files changed, 52 insertions(+)
>>
>> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
>> index 20442ea2c1..75bf5a4994 100644
>> --- a/docs/system/arm/virt.rst
>> +++ b/docs/system/arm/virt.rst
>> @@ -94,6 +94,10 @@ highmem
>>     address space above 32 bits. The default is ``on`` for machine types
>>     later than ``virt-2.12``.
>>   
>> +compact-highmem
>> +  Set ``on``/``off`` to enable/disable compact space for high memory regions.
> 
> Maybe s/compact space/the compact layout/ ?
> 

Yeah, 'compact layout' is better. I will amend in next respin.

>> +  The default is ``on`` for machine types later than ``virt-7.2``
>> +
>>   gic-version
>>     Specify the version of the Generic Interrupt Controller (GIC) to provide.
>>     Valid values are:
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index c05cfb5314..8f1dba0ece 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -174,6 +174,27 @@ static const MemMapEntry base_memmap[] = {
>>    * Note the extended_memmap is sized so that it eventually also includes the
>>    * base_memmap entries (VIRT_HIGH_GIC_REDIST2 index is greater than the last
>>    * index of base_memmap).
>> + *
>> + * The addresses assigned to these regions are affected by 'compact-highmem'
>> + * property, which is to enable or disable the compact space in the Highmem
> 
> s/space in/layout for/ ?
> 

Agreed.

>> + * IO regions. For example, VIRT_HIGH_PCIE_MMIO can be disabled or enabled
>> + * depending on the property in the following scenario.
>> + *
>> + * pa_bits              = 40;
>> + * vms->highmem_redists = false;
>> + * vms->highmem_ecam    = false;
>> + * vms->highmem_mmio    = true;
>> + *
>> + * # qemu-system-aarch64 -accel kvm -cpu host    \
>> + *   -machine virt-7.2,compact-highmem={on, off} \
>> + *   -m 4G,maxmem=511G -monitor stdio
>> + *
>> + * Region            compact-highmem=off        compact-highmem=on
>> + * ----------------------------------------------------------------
>> + * RAM               [1GB         512GB]        [1GB         512GB]
>> + * HIGH_GIC_REDISTS  [512GB       512GB+64MB]   [disabled]
>> + * HIGH_PCIE_ECAM    [512GB+256GB 512GB+512MB]  [disabled]
>> + * HIGH_PCIE_MMIO    [disabled]                 [512GB       1TB]
>>    */
>>   static MemMapEntry extended_memmap[] = {
>>       /* Additional 64 MB redist region (can contain up to 512 redistributors) */
> 
> (...)
> 
>> @@ -3124,8 +3167,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
>>   
>>   static void virt_machine_7_1_options(MachineClass *mc)
>>   {
>> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
>> +
>>       virt_machine_7_2_options(mc);
>>       compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
>> +    /* Compact space for high memory regions was introduced with 7.2 */
> 
> s/space/layout/ ?
> 

Ack.

>> +    vmc->no_highmem_compact = true;
>>   }
>>   DEFINE_VIRT_MACHINE(7, 1)
>>   
> 
> Other than the wording nits, lgtm.
> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> 

Thanks,
Gavin

