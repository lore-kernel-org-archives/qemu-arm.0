Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEBFCCF9E3
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 04:11:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIfiT-00034w-0r; Mon, 10 Nov 2025 23:10:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIfh1-0001y8-2K
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 23:09:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIfgy-0000Os-SP
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 23:09:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762834155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SzXhYlHXujNxUnW1WIoZlma35wUBWrfLZEYpSxKCIMs=;
 b=A9pxSsh3ylqKjd8q1ePlga7nl8D1EA14ULkgkdJbZiUsZ1ncOG1yXTLgMW7A8HOSFLGgta
 A13ewhOvZ+sompXXZqtsuQ4HqSQ40eKHQKjWQBoFjHtvpp84c6J1t5sl/RarfhESb+X2ws
 /3kF5xcNvnSbSITeV5xET3jzibSSUPo=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-EmyPPbqdOoCKPPuFU8XtmQ-1; Mon, 10 Nov 2025 23:09:13 -0500
X-MC-Unique: EmyPPbqdOoCKPPuFU8XtmQ-1
X-Mimecast-MFC-AGG-ID: EmyPPbqdOoCKPPuFU8XtmQ_1762834153
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2958c80fcabso102747165ad.0
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 20:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762834153; x=1763438953;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SzXhYlHXujNxUnW1WIoZlma35wUBWrfLZEYpSxKCIMs=;
 b=kp4qBIZ4dbChz3KYX5tqSSHi8HnhAKCuXXGSRNCN13XehFFAotj6AsFe7J7TNDeQW7
 /jZiKkLKM6aOxy21ThUpXfb/NrQILuzdzaLSnxMhn7EjwekG2TIY6JzOdY5pLydqN251
 i7TZ+7FRsZBZym234hUWSq1LCJwaJmo/kI4ino75CSgB10mXhHsXaUuy8sMgv1KpiDGu
 VTNAPf/yEpFhT8kPJBNDbaHGcP/4Yz8Qz4EBdx8+lbAgdAicIaXwpsmlMN6l+n2lC1vr
 lO1xwWcKAfKpQ8w/7R/Ly6fVZ++CyW9FQ2/V0xWKmDUDX8K6yS7SFAbWiBbJxrQ7jmfz
 Liog==
X-Gm-Message-State: AOJu0Yzh/1HzsWkAdh5JwZ/3HM5LVwLWIP3QG8VilI5t2lAcGcT2CBTv
 uaYbKeQOiOmI5mFhvRvWm8xufnBFSjXX8YluUJTNxL+FnXoYTBqWwg6OZI8ezh5LfJ9WhnwbAen
 Cj12Irqx9vYeu8VcF673cmIDeu6Y7ThihHxpaaiXpxxUiaJpCtUIB+A==
X-Gm-Gg: ASbGnctWpQwZPdCo8mVVFfzAtwpmY/9iscIWp6pwjnXu6ClthRp5Izr+lU0GYFTcqN2
 OHPhXfqKK0AA+BhQ5veSNudiCq1e5OMOJsf2wVqqpWec8ZcEgZwDxmOCXuK5zSnIohXB58z4ojK
 5oCaeGWQPn01G20FnZwMP84ua2SAOSTu7605QBsWTutGoTnYALiW+7sOivlqB2pQa++56eZYxIe
 4t2Vsxk9z0lkKendUTzhqLdRb14ozIxZs2PVEKsZFfk3eha+xdD0iNAtlnbLonuWSCNboLZvPav
 mjKWfwRIivbpiVfxpjwN2YZ4JTkPl35ua5/+fiDyROxVtlVxRzIYNoA83CCvyreAgSLcd3eU2Wq
 quEPutgTuXgFArd08VVm2C4SclSbPMGILLZjItEs=
X-Received: by 2002:a17:902:c952:b0:295:21ac:352b with SMTP id
 d9443c01a7336-297e560ec1cmr135488955ad.15.1762834152804; 
 Mon, 10 Nov 2025 20:09:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtQE+rkcfJ31HVUsDH0lTUIt0v98+uT+XI1dMKxvvN7FT2lbHIraCe6DMiVgRhocfnLSKzIw==
X-Received: by 2002:a17:902:c952:b0:295:21ac:352b with SMTP id
 d9443c01a7336-297e560ec1cmr135488635ad.15.1762834152446; 
 Mon, 10 Nov 2025 20:09:12 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2965096b8ffsm162681055ad.21.2025.11.10.20.09.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 20:09:12 -0800 (PST)
Message-ID: <90d9eab2-a144-430d-ad4a-6764ad08344e@redhat.com>
Date: Tue, 11 Nov 2025 14:09:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] kvm/arm/kvm: Introduce helper
 push_ghes_memory_errors()
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 mchehab+huawei@kernel.org, gengdongjiu1@gmail.com, mst@redhat.com,
 anisinha@redhat.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 shan.gavin@gmail.com
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-8-gshan@redhat.com> <20251110155642.2bf8eca0@fedora>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251110155642.2bf8eca0@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F2xLM7-GBysTvXvHdHMlTQpGjctMjEkUhBlA7ciSTq0_1762834153
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Igor,

On 11/11/25 12:56 AM, Igor Mammedov wrote:
> On Wed,  5 Nov 2025 21:44:52 +1000
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> Introduce helper push_ghes_memory_errors(), which sends ACPI GHES memory
>> errors and injects SEA exception. With this, we can add more logics to
>> the function to support multiple ACPI GHES memory errors in the next
>> path.
>>
>> No functional changes intended.
> 
> I'd squash it into the next patch
> 

Ack.

>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   target/arm/kvm.c | 19 +++++++++++++------
>>   1 file changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index a889315606..5b151eda3c 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -2429,12 +2429,23 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
>>       return ret;
>>   }
>>   
>> +static void push_ghes_memory_errors(CPUState *c, AcpiGhesState *ags,
>> +                                    uint64_t paddr, Error **errp)
>> +{
>> +    uint64_t addresses[16];
>> +
>> +    addresses[0] = paddr;
>> +
>> +    kvm_cpu_synchronize_state(c);
>> +    acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC, addresses, 1, errp);
>> +    kvm_inject_arm_sea(c);
>> +}
>> +
>>   void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>>   {
>>       ram_addr_t ram_addr;
>>       hwaddr paddr;
>>       AcpiGhesState *ags;
>> -    uint64_t addresses[16];
>>   
>>       assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
>>   
>> @@ -2455,12 +2466,8 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>>                * later from the main thread, so doing the injection of
>>                * the error would be more complicated.
>>                */
>> -            addresses[0] = paddr;
>>               if (code == BUS_MCEERR_AR) {
>> -                kvm_cpu_synchronize_state(c);
>> -                acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC,
>> -                                        addresses, 1, &error_abort);
>> -                kvm_inject_arm_sea(c);
>> +                push_ghes_memory_errors(c, ags, paddr, &error_abort);
>>               }
>>               return;
>>           }
> 

Thanks,
Gavin


