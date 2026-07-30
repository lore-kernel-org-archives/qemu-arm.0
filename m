Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBA5C531D0
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Jul 2026 06:09:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpJx8-00030r-Ua; Thu, 30 Jul 2026 02:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wpJx5-0002yn-Rg
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 02:09:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wpJx3-0006Lm-Aj
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 02:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785391743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yQTI73ivUEZuX6HNEWKmrBdj1qeSbZfkMYzYDeZp5E=;
 b=jEJWB0gV63rdZ/psYCkNeiKlbacGPI0R+RHHPKPOOggpMXomIi7Y7eg90ceY5UcrPFyGOq
 P1IUSb8tV4gc8/NAwLwirZd0QUQwcT1/563q2idWoJ6S3i2swqhTGd5OrLJ1MD3hCfzc1q
 229olx82tLNc/xUGaao0V53Glu/Dpy8=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-putxm1OoOrKJW9ITjC3Tig-1; Thu, 30 Jul 2026 02:09:01 -0400
X-MC-Unique: putxm1OoOrKJW9ITjC3Tig-1
X-Mimecast-MFC-AGG-ID: putxm1OoOrKJW9ITjC3Tig_1785391741
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-ca6bd8a190cso2578777a12.0
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 23:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785391741; x=1785996541;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/yQTI73ivUEZuX6HNEWKmrBdj1qeSbZfkMYzYDeZp5E=;
 b=HEr7tcBndznEzb65UBX6NTQKaaIva7gUy9MMOxaR+HiQttO+nElDBrQOZvZAfPyvP2
 dgVzVZOwzoN+Yz3xUjwZcvXoscktez9MYSOpaZa6Y27eOq5M6gKyW8SkK3K+gDGBu8qM
 Ad/1LtAyQ7f5ktTl1aPUhIIF1GQYqKsRPxt9qP/ncQjkMgDhSeBe23V+tS52e4xHtlEF
 EIv2ozN+e35SdIl38FhBSO1VFiWSUUlHStRUHpbkLt/TQ155H4SSZUxtjYHhja6ypGzy
 ztJLi6GXZT6BrTBJqopn3yyexDODJNzoSRWvF11g0xq6U4bn3l4Z9kkN30UJn6QTaJmY
 Omrg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp/B/zXySLh7V1iiS+ZPJQ5YjlLXa5hIHfQGOGfSdjW088T/nq5URAaMzT/0QFN+gwt7BpLH5kjvw==@nongnu.org
X-Gm-Message-State: AOJu0YzVsWyisAdRvzIi9qGAxPqjQpNYUDucYgy6sstat9+vTaDhR61N
 F6QshIGnyNOX245dzUEY7gDMCOoFUFEzdzH8XEwNdBrd516gVX3bXhnJ/dkWRSWYXc+eq+iVaDF
 N0CnMilOWFUTWa9SiksUGRUcTJUbm6ioEfpzzOt7z4z9yn6exi1kK3w==
X-Gm-Gg: AR+sD12jRheKlRTDDP7qJBdXXtkm3zFJ9zAOyTxVyZzBjw4mlyvo/szcS/Y4Sd8nwcj
 vRcJQAKIvyDts8OIDYgQ+A5axbAhCsOVOo0yZ5b/VjAhWHWwmFC6BsNTSSPVp7S4isOG3dupNV7
 ISkNammDOVJcWrXmc7U0aMetPh4i4bJVApKgF7DpF9UkyIEW6Y8lDgeyNzYVfvK99glm982wnZP
 dRLENjo+D4nAMnLkneh/9umumfVAiKnE2GGPrXWZMBNk3wHU7LtH2zE+CwzumVVif8V2/KYiW+o
 7bt4k4M8cEbABHouHnUQdRj4U4OCQP2XS5gd6ico/S2L0OeNnJ+qV/HigHYE0qtEpleoAZ9vDif
 aH5LSSfrbIc+k8xYSWXAYzsOXrCRqCyxRdBK8Tr8sif8=
X-Received: by 2002:a05:6a21:1f85:b0:3c3:83e6:c705 with SMTP id
 adf61e73a8af0-3c9008d2508mr1222721637.35.1785391740789; 
 Wed, 29 Jul 2026 23:09:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f85:b0:3c3:83e6:c705 with SMTP id
 adf61e73a8af0-3c9008d2508mr1222699637.35.1785391740341; 
 Wed, 29 Jul 2026 23:09:00 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbdb8250daesm1800701a12.9.2026.07.29.23.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 23:08:59 -0700 (PDT)
Message-ID: <30967c8c-be29-49bb-b8fc-f4a3b870fed1@redhat.com>
Date: Thu, 30 Jul 2026 16:08:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 01/24] linux-headers: Add RME related definitions
To: Kohei Enju <enju.kohei@fujitsu.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org, mst@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
References: <20260728192630.240375-1-mathieu.poirier@linaro.org>
 <20260728192630.240375-2-mathieu.poirier@linaro.org>
 <amrhioS_O_0ztjb_@FCCLS0092175.localdomain>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <amrhioS_O_0ztjb_@FCCLS0092175.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: owtgkFxAQH2eCsep0gTR8FIEnvUT9_b0iCBEpI8ou6c_1785391741
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.58,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/30/26 3:41 PM, Kohei Enju wrote:
> On 07/28 13:26, Mathieu Poirier wrote:
>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>
>> This is a temporary patch intended for testing purposes only. It provides
>> definitions related to supporting Realms by the QEMU-VMM.
>>
>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> ---
>>   linux-headers/asm-arm64/kvm.h |  9 +++++++++
>>   linux-headers/linux/kvm.h     | 10 +++++++++-
>>   2 files changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
>> index 6aefe7973814..4c08631ec7d2 100644
>> --- a/linux-headers/asm-arm64/kvm.h
>> +++ b/linux-headers/asm-arm64/kvm.h
>> @@ -208,6 +208,15 @@ struct kvm_arm_counter_offset {
>>   	__u64 reserved;
>>   };
>>   
>> +#define KVM_ARM_RMI_POPULATE_FLAGS_MEASURE     (1 << 0)
>> +struct kvm_arm_rmi_populate {
>> +	__u64 base;
>> +	__u64 size;
>> +	__u64 source_uaddr;
>> +	__u32 flags;
>> +	__u32 reserved;
>> +};
>> +
>>   #define KVM_ARM_TAGS_TO_GUEST		0
>>   #define KVM_ARM_TAGS_FROM_GUEST		1
>>   
>> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
>> index dd52e2a65bfd..cdd5ad11f85a 100644
>> --- a/linux-headers/linux/kvm.h
>> +++ b/linux-headers/linux/kvm.h
>> @@ -689,14 +689,19 @@ struct kvm_enable_cap {
>>    * address size for the VM. Bits[7-0] are reserved for the guest
>>    * PA size shift (i.e, log2(PA_Size)). For backward compatibility,
>>    * value 0 implies the default IPA size, 40bits.
>> + *
>> + * Bits[30-31] are reserved for the VM type
>>    */
>>   #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
>>   #define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
>>   	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
>>   
>> +#define KVM_VM_TYPE_ARM_NORMAL		0
>> +#define KVM_VM_TYPE_ARM_REALM		(1UL << 30)
>>   #define KVM_VM_TYPE_ARM_PROTECTED	(1UL << 31)
>>   #define KVM_VM_TYPE_ARM_MASK		(KVM_VM_TYPE_ARM_IPA_SIZE_MASK | \
>> -					 KVM_VM_TYPE_ARM_PROTECTED)
>> +					 KVM_VM_TYPE_ARM_PROTECTED | \
>> +					 KVM_VM_TYPE_ARM_REALM)
>>   
>>   /*
>>    * ioctls for /dev/kvm fds:
>> @@ -719,6 +724,8 @@ struct kvm_enable_cap {
>>   #define KVM_GET_EMULATED_CPUID	  _IOWR(KVMIO, 0x09, struct kvm_cpuid2)
>>   #define KVM_GET_MSR_FEATURE_INDEX_LIST    _IOWR(KVMIO, 0x0a, struct kvm_msr_list)
>>   
>> +#define KVM_ARM_RMI_POPULATE	  _IOWR(KVMIO, 0xd7, struct kvm_arm_rmi_populate)
>> +
>>   /*
>>    * Extension capability list.
>>    */
>> @@ -986,6 +993,7 @@ struct kvm_enable_cap {
>>   #define KVM_CAP_S390_KEYOP 247
>>   #define KVM_CAP_S390_VSIE_ESAMODE 248
>>   #define KVM_CAP_S390_HPAGE_2G 249
>> +#define KVM_CAP_ARM_RMI 250
> 
> Not a big deal, but a note for anyone testing this series:
> 
> Use Linaro's Linux kernel tree, as mentioned in the cover letter:
> https://gitlab.com/Linaro/cca-public/linux/-/tree/upstream-v2?ref_type=heads
> 

It seems the capability values get an extra leap on KVM_CAP_ARM_AMI in
"upstream-v2" host kernel.

   include/uapi/linux/kvm.h

   #define KVM_CAP_S390_KEYOP 247
   #define KVM_CAP_S390_VSIE_ESAMODE 248
   #define KVM_CAP_ARM_RMI 250

> Alternetively, if you're using Arm's tree or other trees with Steven
> Price's v14 series as I am:
> 
> You'll need to adjust the definition of KVM_CAP_ARM_RMI, since it uses a
> differenct capability number.
> 
>>   
>>   struct kvm_irq_routing_irqchip {
>>   	__u32 irqchip;
>> -- 
>> 2.43.0
>>

Thanks,
Gavin


