Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7DFCCFA05
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Nov 2025 03:26:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGqe5-0006Pc-4U; Wed, 05 Nov 2025 22:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vGqe3-0006Oy-Dt
 for qemu-arm@nongnu.org; Wed, 05 Nov 2025 22:26:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vGqe1-0000hg-OT
 for qemu-arm@nongnu.org; Wed, 05 Nov 2025 22:26:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762399600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oRag6wziRdgZUwX9iqrzGiFz4QSgtuzykdahY0fkwvc=;
 b=DnSr3O7C/FB+G4RakJJrevcERaXdH03hiY/3kijKEetbUCAPPLZKUkBeYWGPpKu8/7oNUx
 hxbSAK4ucXrZu5pd3OpqUC+kJlUVWUBcxgJs0/lVlgFdEO+ilOyIxlhRHgBtWPSyQzMojO
 payfXCBcZsMgfYXwEGqjc0WVbvQHKvI=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-2P6ol8nZMdKun5PQBnSa3w-1; Wed, 05 Nov 2025 22:26:36 -0500
X-MC-Unique: 2P6ol8nZMdKun5PQBnSa3w-1
X-Mimecast-MFC-AGG-ID: 2P6ol8nZMdKun5PQBnSa3w_1762399596
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-341616a6fb7so641575a91.0
 for <qemu-arm@nongnu.org>; Wed, 05 Nov 2025 19:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762399596; x=1763004396;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oRag6wziRdgZUwX9iqrzGiFz4QSgtuzykdahY0fkwvc=;
 b=AjyCyjIRBM/6MXgVksUKvB8RTgXkPal4gKI8I09NR/9xeGcr7EsBBWw1+JzjviKffl
 u94wMQ07jE0hXmUuh6UhzbPkGMlTpUdw55upa+6/ecN3g+L/izi9mcK9OztQ7XC4UAKz
 Khh45/j0UY5BMepkGCnCEZ99etnC9b3bOhYb5IdvJSpRl5C5+7zwHt6xGKOsbREsLuar
 +oovDNhpgktafKBJNL0oT85cEgGGHQEL9h1yCyaTOVmuNZt04Ja0FS5xak33AsEwC5il
 NyRLcTsqZqT6pt9iUAYQd0fFE356RqcwzVi0GLNMpjkegjB+oaI5qBEoF3Qbmh0nBvb3
 4ezw==
X-Gm-Message-State: AOJu0Yx75pIZO7jgihMqyNOfs8utSPNNrkSqbatMmJ+6zQphJmjTzq+N
 Gi/xgqA7uyXR2QZkAd3uJTt9FUxsoAkmBwVyWchJxYOWNNVrHJ5rb9tCyVJwPCr08wU5SIniBAF
 MOombHqT/4LeCJbqdVufXf94JmkkFHZPxoaJIpPLVqLxhXWt7kQBWsA==
X-Gm-Gg: ASbGncvoQxUjiWknkoCKJxW4Kym7Bn4kqjBpzziun18NETI4SdpqylxjiKeejFzpUcl
 cfS9GttnVXkO8B2C1L/6xJ0W9OZe9kp3jNQEHwOPejbPbbUIeF5aPZIEFs0LCRZOWuNPnZ3mROV
 CmuNJ258K1fe4ZPgbRflKkWCBjWBaWS6oVwF11NKBQ7w2mB3bysCqu5LPDbdxbb6KRu3H3FQJ8e
 uIVErybYzR/iOnTLpVKzCBvOHY0Wfh7x8TfR28b4bZMq7Ql0fG7rJ8KO85Ap7tTKCGSOuawQqwl
 bfMFPq1MrhGlwuYNmfedOA2KEeRp+yobxq2+CBAgHx/W8OSUhP3kTu4mn4v2Q7h6o6jOG9p2Sdl
 j4UyRQQcTbw1oMilPZefOax3GOxTXuKGhz01qkzA=
X-Received: by 2002:a17:90b:3b52:b0:340:54a1:d703 with SMTP id
 98e67ed59e1d1-341a7002455mr6686019a91.35.1762399595661; 
 Wed, 05 Nov 2025 19:26:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHga/MElz4trTOnHJ1w9E+SKAP3VZ5HAdAMo8EtY3k4eVhVjgy78NWyn7+SoZUryrogjfMKow==
X-Received: by 2002:a17:90b:3b52:b0:340:54a1:d703 with SMTP id
 98e67ed59e1d1-341a7002455mr6685989a91.35.1762399595179; 
 Wed, 05 Nov 2025 19:26:35 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-341d048e1d9sm767330a91.6.2025.11.05.19.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 19:26:34 -0800 (PST)
Message-ID: <9fbd5344-947d-46bd-8754-16fc9e3fff05@redhat.com>
Date: Thu, 6 Nov 2025 13:26:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] target/arm/kvm: Support multiple memory CPERs
 injection
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mchehab+huawei@kernel.org,
 gengdongjiu1@gmail.com, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 shan.gavin@gmail.com
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-9-gshan@redhat.com>
 <20251105143710.000041f5@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251105143710.000041f5@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fAegi4BqppbgYNPqyQ_XCELbNq8YF8FJpbb_bQSUadQ_1762399596
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Jonathan,

On 11/6/25 12:37 AM, Jonathan Cameron wrote:
> On Wed,  5 Nov 2025 21:44:53 +1000
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> In the combination of 64KiB host and 4KiB guest, a problematic host
>> page affects 16x guest pages that can be owned by different threads.
>> It means 16x memory errors can be raised at once due to the parallel
>> accesses to those 16x guest pages on the guest. Unfortunately, QEMU
>> can't deliver them one by one because we just one GHES error block,
> 
> we have just one
> 

Thanks, fixed locally.

>> corresponding one read acknowledgement register. It can eventually
>> cause QEMU crash dump due to the contention on that register, meaning
>> the current memory error can't be delivered before the previous error
>> isn't acknowledged.
>>
>> Imporve push_ghes_memory_errors() to push 16x consecutive memory errors
> Improve
> 

Thanks, fixed locally.

>> under this situation to avoid the contention on the read acknowledgement
>> register.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Hi Gavin
> 
> Silly question that never occurred to me before:
> What happens if we just report a single larger error?
> 
> The CPER record has a Physical Address Mask that I think lets us say we
> are only reporting at a 64KiB granularity.
> 
> In linux drivers/edac/ghes_edac.c seems to handle this via e->grain.
> https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/edac/ghes_edac.c#L346
> 
> I haven't chased the whole path through to whether this does appropriate poisoning
> on the guest though.
> 

We have the following call trace to handle CPER error record. The e->grain
originated from the Physical Address Mask is used to come up with the size
for memory scrubbing at (a). The page isolation happens at (b) bases on the
reported Physical Address. So a larger Physical Address Mask won't help to
isolate more pages per my understanding.

do_sea
   apei_claim_sea
     ghes_notify_sea
       ghes_in_nmi_spool_from_list
         ghes_in_nmi_queue_one_entry
         irq_work_queue                          // ghes_proc_irq_work
           ghes_proc_in_irq
             ghes_do_proc
               atomic_notifier_call_chain        // (a) ghes_report_chain
                 ghes_edac_report_mem_error
                   edac_raw_mc_handle_error
                ghes_handle_memory_failure
                  ghes_do_memory_failure
                    memory_failure_cb
                      memory_failure             // (b) Isolate the page

Thanks,
Gavin

>> ---
>>   target/arm/kvm.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 50 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 5b151eda3c..d7de8262da 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -11,6 +11,7 @@
>>    */
>>   
>>   #include "qemu/osdep.h"
>> +#include "qemu/units.h"
>>   #include <sys/ioctl.h>
>>   
>>   #include <linux/kvm.h>
>> @@ -2432,12 +2433,59 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
>>   static void push_ghes_memory_errors(CPUState *c, AcpiGhesState *ags,
>>                                       uint64_t paddr, Error **errp)
>>   {
>> +    uint64_t val, start, end, guest_pgsz, host_pgsz;
>>       uint64_t addresses[16];
>> +    uint32_t num_of_addresses;
>> +    int ret;
>> +
>> +    /*
>> +     * Sort out the guest page size from TCR_EL1, which can be modified
>> +     * by the guest from time to time. So we have to sort it out dynamically.
>> +     */
>> +    ret = read_sys_reg64(c->kvm_fd, &val, ARM64_SYS_REG(3, 0, 2, 0, 2));
>> +    if (ret) {
>> +        error_setg(errp, "Error %" PRId32 " to read TCR_EL1 register", ret);
>> +        return;
>> +    }
>> +
>> +    switch (extract64(val, 14, 2)) {
>> +    case 0:
>> +        guest_pgsz = 4 * KiB;
>> +        break;
>> +    case 1:
>> +        guest_pgsz = 64 * KiB;
>> +        break;
>> +    case 2:
>> +        guest_pgsz = 16 * KiB;
>> +        break;
>> +    default:
>> +        error_setg(errp, "Unknown page size from TCR_EL1 (0x%" PRIx64 ")", val);
>> +        return;
>> +    }
>> +
>> +    host_pgsz = qemu_real_host_page_size();
>> +    start = paddr & ~(host_pgsz - 1);
>> +    end = start + host_pgsz;
>> +    num_of_addresses = 0;
>>   
>> -    addresses[0] = paddr;
>> +    while (start < end) {
>> +        /*
>> +         * The precise physical address is provided for the affected
>> +         * guest page that contains @paddr. Otherwise, the starting
>> +         * address of the guest page is provided.
>> +         */
>> +        if (paddr >= start && paddr < (start + guest_pgsz)) {
>> +            addresses[num_of_addresses++] = paddr;
>> +        } else {
>> +            addresses[num_of_addresses++] = start;
>> +        }
>> +
>> +        start += guest_pgsz;
>> +    }
>>   
>>       kvm_cpu_synchronize_state(c);
>> -    acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC, addresses, 1, errp);
>> +    acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC,
>> +                            addresses, num_of_addresses, errp);
>>       kvm_inject_arm_sea(c);
>>   }
>>   
> 


