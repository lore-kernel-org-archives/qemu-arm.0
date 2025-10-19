Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ADACCD195
	for <qemu-arm@archiver.kernel.org>; Sun, 19 Oct 2025 00:37:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAHPa-0006O5-FG; Sat, 18 Oct 2025 20:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vAHPY-0006NY-IV
 for qemu-arm@nongnu.org; Sat, 18 Oct 2025 20:36:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vAHPW-0003pR-Fc
 for qemu-arm@nongnu.org; Sat, 18 Oct 2025 20:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760834186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/EoQQGY1oiKJb347eN4UYnYv72bKi5Q9J1ot1CL6iyI=;
 b=W+ykfqgGELW0jyFMMnZygFxQtsZ3r6jReLvwprnoYo2bTInamIeP0fEZC96NbSIaPBQguu
 l+By3pI/a3Mam7dA3+nLsYTz9fbq7/4iEkTZKBIdqPog+7AqTdshg+UCf56+cNtjCiHJgR
 HNDXBySP2soJyKQwvCoV9XCAUA9mSO8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-EK6RSf-VOkS_nQyu_F0ang-1; Sat, 18 Oct 2025 20:36:24 -0400
X-MC-Unique: EK6RSf-VOkS_nQyu_F0ang-1
X-Mimecast-MFC-AGG-ID: EK6RSf-VOkS_nQyu_F0ang_1760834184
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-272ed8c106eso19207495ad.2
 for <qemu-arm@nongnu.org>; Sat, 18 Oct 2025 17:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760834184; x=1761438984;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/EoQQGY1oiKJb347eN4UYnYv72bKi5Q9J1ot1CL6iyI=;
 b=qyjAN9S/b8Ew8j8z+TGKoR0EiOD0/CbZ4MSxCDjKVE9d1geh1vLUxQWBanFqTFD1iN
 7bH+YJOhGClSd5vUcMNTY7I7pa+IUsELVikVJnSqjqvc69+jaYh86kjbWdy55BYZOV1A
 GOD01aS5ywscY31Jq9AdM7A9o8J6Xa2YBOnyPiT6FStg7YZfF+eYzjl7PwHWI61xuu+W
 MGmEDrlvjWFyQs6SNFyx2qhi16+KYDEi7gmcBKdi2GHYVCewrqoViIvdVl+reHXPgHn3
 QeHaG0yM30RJilSsKnpOP1JuHaUx8X+FABxLe9SBb5OHFyY0oyW3LsqVPpzj1rt143uS
 TMZQ==
X-Gm-Message-State: AOJu0YxC0Z6yPUZTo+XUbWVPak/xLLcUGgE4dxnhmKruwt0PP/Giqtrm
 HsxtoWKJlMvqWuSp/sapPLLPVji3qnl9D208vAoOjRw2ddE2fPq2406LDh5k704LWzX9CsQ4qub
 jrk1BDmLyg7kUrBYi4cC7Z/MTPA8hykgWuAT7JYyLNrMWuNsYkCOU3Q==
X-Gm-Gg: ASbGnctZY5BoBZwlrUdp4WtzhIp5pNUuS70XKseVuGMrBZBns9BiV6g4vPLh2uL7B7Y
 Bd5Cr3q4iYLJXhntzSRGHX7x1fhppL+LqGSyiMWBG+LQVIV0y7WQmfUHakksShco7dr80n/hZdj
 LeFk8dFNeha2HfGADD9ridOUpw+kucwy05aO+sNs4JHKjewPYeAFGs28rO/ErcN6lixIS+Irqe0
 l9J9JMmS6wNDu7WDhvNJyBb5EsOJCPt72AnvmJVkjzzZmZAmfZ5l2SYvikUekbQ23bW6mJylsNG
 BzknLTZDrsMPdZilwmK3sHg7TkSinnEar9Yd8fSdu+ZYgpA+aq0OImVIfKJSMWqI/smeSQtWiUb
 4DrX7Qq6dvIIpGhPi6EcfBXn9p6iFK+lpWpnIG3c=
X-Received: by 2002:a17:902:e5cc:b0:267:95ad:8cb8 with SMTP id
 d9443c01a7336-290cb079f2dmr112334445ad.44.1760834183699; 
 Sat, 18 Oct 2025 17:36:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2S1Y6tVMW5wXQjGFG48O8/s51uWjYy/wXrtA1/toNbXZoARSzITJtK2P3m4swRfzaXh2VqA==
X-Received: by 2002:a17:902:e5cc:b0:267:95ad:8cb8 with SMTP id
 d9443c01a7336-290cb079f2dmr112334235ad.44.1760834183263; 
 Sat, 18 Oct 2025 17:36:23 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2924721948bsm36930935ad.109.2025.10.18.17.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Oct 2025 17:36:22 -0700 (PDT)
Message-ID: <a635de53-71fa-4edb-87c0-8775722c284d@redhat.com>
Date: Sun, 19 Oct 2025 10:36:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 3/3] target/arm/kvm: Support multiple memory
 CPERs injection
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, mchehab+huawei@kernel.org, Jonathan.Cameron@huawei.com,
 shan.gavin@gmail.com
References: <20251007060810.258536-1-gshan@redhat.com>
 <20251007060810.258536-4-gshan@redhat.com> <20251017162746.2a99015b@fedora>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251017162746.2a99015b@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2usjNMo_dIgWo2jZRSTn9hutg6mWMkWzz7WNX6fWPLM_1760834184
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

Hi Igor,

On 10/18/25 12:27 AM, Igor Mammedov wrote:
> On Tue,  7 Oct 2025 16:08:10 +1000
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> In the combination of 64KB host and 4KB guest, a problematic host page
>> affects 16x guest pages. In this specific case, it's reasonable to
>> push 16 consecutive memory CPERs. Otherwise, QEMU can run into core
>> dump due to the current error can't be delivered as the previous error
>> isn't acknoledges. It's caused by the nature the host page can be
>> accessed in parallel due to the mismatched host and guest page sizes.
> 
> can you explain a bit more what goes wrong?
> 
> I'm especially interested in parallel access you've mentioned
> and why batch adding error records is needed
> as opposed to adding records every time invalid access happens?
> 
> PS:
> Assume I don't remember details on how HEST works,
> Answering it in this format also should improve commit message
> making it more digestible for uninitiated.
> 

Thanks for your review and I'm trying to answer your question below. Please let
me know if there are more questions.

There are two signals (BUS_MCEERR_AR and BUS_MCEERR_AO) and BUS_MCEERR_AR is
concerned here. This signal BUS_MCEERR_AR is sent by host's stage2 page fault
handler when the resolved host page has been marked as marked as poisoned.
The stage2 page fault handler is invoked on every access to the host page.

In the combination where host and guest has 64KB and 4KB separately, A 64KB
host page corresponds to 16x consecutive 4KB guest pages. It means we're
accessing the 64KB host page when any of those 16x consecutive 4KB guest pages
is accessed. In other words, a problematic 64KB host page affects the accesses
on 16x 4KB guest pages. Those 16x 4KB guest pages can be owned by different
threads on the guest and they run in parallel, potentially to access those
16x 4KB guest pages in parallel. It potentially leading to 16x BUS_MCEERR_AR
signals at one point.

In current implementation, the error record is built as the following calltrace
indicates. There are 16 error records in the extreme case (parallel accesses on
16x 4KB guest pages, mapped to one 64KB host page). However, we can't handle
multiple error records at once due to the acknowledgement mechanism in
ghes_record_cper_errors(). For example, the first error record has been sent,
but not consumed by the guest yet. We fail to send the second error record.

kvm_arch_on_sigbus_vcpu
   acpi_ghes_memory_errors
     ghes_gen_err_data_uncorrectable_recoverable      // Generic Error Data Entry
     acpi_ghes_build_append_mem_cper                  // Memory Error
     ghes_record_cper_errors
       
So this series improves this situation by simply sending 16x error records in
one shot for the combination of 64KB host + 4KB guest.

Thanks,
Gavin


>> Imporve push_ghes_memory_errors() to push 16x consecutive memory CPERs
>> for this specific case. The maximal error block size is bumped to 4KB,
>> providing enough storage space for those 16x memory CPERs.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/acpi/ghes.c   |  2 +-
>>   target/arm/kvm.c | 46 +++++++++++++++++++++++++++++++++++++++++++++-
>>   2 files changed, 46 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
>> index 045b77715f..5c87b3a027 100644
>> --- a/hw/acpi/ghes.c
>> +++ b/hw/acpi/ghes.c
>> @@ -33,7 +33,7 @@
>>   #define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
>>   
>>   /* The max size in bytes for one error block */
>> -#define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
>> +#define ACPI_GHES_MAX_RAW_DATA_LENGTH   (4 * KiB)
>>   
>>   /* Generic Hardware Error Source version 2 */
>>   #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index c5d5b3b16e..3ecb85e4b7 100644
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
>> @@ -2433,10 +2434,53 @@ static void push_ghes_memory_errors(CPUState *c, AcpiGhesState *ags,
>>                                       uint64_t paddr)
>>   {
>>       GArray *addresses = g_array_new(false, false, sizeof(paddr));
>> +    uint64_t val, start, end, guest_pgsz, host_pgsz;
>>       int ret;
>>   
>>       kvm_cpu_synchronize_state(c);
>> -    g_array_append_vals(addresses, &paddr, 1);
>> +
>> +    /*
>> +     * Sort out the guest page size from TCR_EL1, which can be modified
>> +     * by the guest from time to time. So we have to sort it out dynamically.
>> +     */
>> +    ret = read_sys_reg64(c->kvm_fd, &val, ARM64_SYS_REG(3, 0, 2, 0, 2));
>> +    if (ret) {
>> +        goto error;
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
>> +        error_report("unknown page size from TCR_EL1 (0x%" PRIx64 ")", val);
>> +        goto error;
>> +    }
>> +
>> +    host_pgsz = qemu_real_host_page_size();
>> +    start = paddr & ~(host_pgsz - 1);
>> +    end = start + host_pgsz;
>> +    while (start < end) {
>> +        /*
>> +         * The precise physical address is provided for the affected
>> +         * guest page that contains @paddr. Otherwise, the starting
>> +         * address of the guest page is provided.
>> +         */
>> +        if (paddr >= start && paddr < (start + guest_pgsz)) {
>> +            g_array_append_vals(addresses, &paddr, 1);
>> +        } else {
>> +            g_array_append_vals(addresses, &start, 1);
>> +        }
>> +
>> +        start += guest_pgsz;
>> +    }
>> +
>>       ret = acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC, addresses);
>>       if (ret) {
>>           goto error;
> 


