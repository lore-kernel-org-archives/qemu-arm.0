Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE38CCF9E3
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 06:02:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIhSk-0006YA-OA; Tue, 11 Nov 2025 01:02:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIhSj-0006U1-4g
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 01:02:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIhSf-0007kL-Vw
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 01:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762840957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=koH81FTGaXA6b5zb+G0vk5e0prX1lbQsjBrO4oK8u+E=;
 b=SGrhrUh+rIjaKBfPSggBc/ngDrtffbzdO6jsJ2aHCF9pk8CeMq96Erqo7F47OrieBTAZyU
 zxlOBdbDQAh4OXrkHIhzcoc3+hFylunxk46ZXMTrLm1Vjnu9k72GjsTPuczQyyYL9RIHrU
 u+uGzjnEjtwLOvpj2lzvkg83sTqWQX8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-94ZICNtSNZSoEXPgERbulg-1; Tue, 11 Nov 2025 01:02:33 -0500
X-MC-Unique: 94ZICNtSNZSoEXPgERbulg-1
X-Mimecast-MFC-AGG-ID: 94ZICNtSNZSoEXPgERbulg_1762840952
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-34378c914b4so3080986a91.1
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 22:02:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762840952; x=1763445752;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=koH81FTGaXA6b5zb+G0vk5e0prX1lbQsjBrO4oK8u+E=;
 b=sGdEiwVqix8Dv2In7MOVGDXDrAavxIZ0GJaIJKH3FySookpBidHk6RYXoiKfmRk1AS
 EEN3FVFDIPORJIm9WYcWJ0eQvAXwSJbNqsahG9ucbIHJz+IcV+qW7gxjuP1QgOa1UWe8
 ZGbPzGLjzMoOW4BtW+jWqE3QLKHYMqc1H8pWxS/y8TVs+v9Z3XwAFMzjvAmqFmg1rIne
 XI1+1vZ2jNz3CYop5fld8+Oiwb4Xr0lp7XiUJucxRJiwW+TavpYgubrzPQvR7J05cwS3
 JoJ6rm3vF9z5rwQnCzrquVR1r53Q9O4C4fKi30NFfw0CdPIppQzj676l1xr4UnAusZz4
 qX9Q==
X-Gm-Message-State: AOJu0Ywx/yZ6i9RYLjdUizvNyrnp44xJMil8LVqXmaANJgmtY3fKKvNn
 kUtryiX5Ao4MqfMOEkfiy2Ptol0yF/lQvAVl6DWat4LUB+c+JRlirj180lwUxJ1pJK4+1RBiTEi
 hzzbLmTxDR7wL9SN2Mwhp7t7Rn80ZyBjHoJcct3hoX669DqqAAbLSCw==
X-Gm-Gg: ASbGnctBt1bMxhufpsUyx8Ohvwf3lQmjhMUReDLEri922ZRclFbADKdadmx5P+l6pBI
 DyvPdHUuHU8RD7Fkq/Z/SJp9jchISJUQEWXcBQdzY8fwvf3j5KR/Pkts1EvApp1WLdpbzcRo1NH
 4/rxLUdlt6otuSX9g3yQ7g+OIPS5rHBIZdXLxRQvS53rSGQrsglsicnJA6fbymBfq8E2iOmREqO
 UNY+U40Ncra1R22bJMnanU3SsjNs1nTtqcMsCa3B474LBNOUbLYMJDF2psTAETEWm5UCG+wQRO3
 zeDgVvbIKMjRgKsCvqowoVicyO3fRNk6V1h35xVfNoV1z53NZipBlJb71Lm9edyaeN0SXh4tURH
 CTr2AjE6tGi4bJr3wcezYxZ5uGu86+86MR2cqF3M=
X-Received: by 2002:a17:90b:17cb:b0:340:e521:bc73 with SMTP id
 98e67ed59e1d1-3436cb73b73mr12513649a91.5.1762840951926; 
 Mon, 10 Nov 2025 22:02:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzPdJPk3Wrt3JCPxia0buuUMKIFZVDvMzforq2lAJo6mRKfjyheZLW//gK9V1l/tF0uLzxkw==
X-Received: by 2002:a17:90b:17cb:b0:340:e521:bc73 with SMTP id
 98e67ed59e1d1-3436cb73b73mr12513610a91.5.1762840951465; 
 Mon, 10 Nov 2025 22:02:31 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-343c52046f6sm512563a91.14.2025.11.10.22.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 22:02:30 -0800 (PST)
Message-ID: <b673bf36-cf1b-4103-bce8-0465a1385403@redhat.com>
Date: Tue, 11 Nov 2025 16:02:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] acpi/ghes: Use error_abort in
 acpi_ghes_memory_errors()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 mchehab+huawei@kernel.org, gengdongjiu1@gmail.com, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-7-gshan@redhat.com> <87o6p9gmy4.fsf@pond.sub.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <87o6p9gmy4.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wZyWzamUzIZ9FIC_QqRFVPanIUSulxU3LBgHTq00UkY_1762840952
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
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

Hi Markus,

On 11/11/25 3:25 PM, Markus Armbruster wrote:
> Gavin Shan <gshan@redhat.com> writes:
> 
>> Use error_abort in acpi_ghes_memory_errors() so that the caller needn't
>> explicitly call abort() on errors. With this change, its return value
>> isn't needed any more.
>>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/acpi/ghes-stub.c    |  6 +++---
>>   hw/acpi/ghes.c         | 15 ++++-----------
>>   include/hw/acpi/ghes.h |  5 +++--
>>   target/arm/kvm.c       | 10 +++-------
>>   4 files changed, 13 insertions(+), 23 deletions(-)
>>
>> diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
>> index 4faf573aeb..4ef914ffc5 100644
>> --- a/hw/acpi/ghes-stub.c
>> +++ b/hw/acpi/ghes-stub.c
>> @@ -11,10 +11,10 @@
>>   #include "qemu/osdep.h"
>>   #include "hw/acpi/ghes.h"
>>   
>> -int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>> -                            uint64_t *addresses, uint32_t num_of_addresses)
>> +void acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>> +                             uint64_t *addresses, uint32_t num_of_addresses,
>> +                             Error **errp)
>>   {
>> -    return -1;
>>   }
> 
> Before the patch, this function always fails: it returns -1.
> 
> Afterwards, it always succeeds: it doesn't set @errp.
> 
> Which one is correct?
> 

Both are correct. This variant is only used on !CONFIG_ACPI_APEI. In this case,
there is no chance to call this variant in the only caller kvm_arch_on_sigbus_vcpu().
acpi_ghes_get_state() returns NULL on !CONFIG_ACPI_APEI there.

>>   
>>   AcpiGhesState *acpi_ghes_get_state(void)
>> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
>> index 055e5d719a..aa469c03f2 100644
>> --- a/hw/acpi/ghes.c
>> +++ b/hw/acpi/ghes.c
>> @@ -543,8 +543,9 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>>       notifier_list_notify(&acpi_generic_error_notifiers, &source_id);
>>   }
>>   
>> -int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>> -                            uint64_t *addresses, uint32_t num_of_addresses)
>> +void acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>> +                             uint64_t *addresses, uint32_t num_of_addresses,
>> +                             Error **errp)
> 
> qapi/error.h:
> 
>   * - Whenever practical, also return a value that indicates success /
>   *   failure.  This can make the error checking more concise, and can
>   *   avoid useless error object creation and destruction.  Note that
>   *   we still have many functions returning void.  We recommend
>   *   • bool-valued functions return true on success / false on failure,
>   *   • pointer-valued functions return non-null / null pointer, and
>   *   • integer-valued functions return non-negative / negative.
> 

Question: If it's deterministic that caller passes @error_abort or @error_fatal
to acpi_ghes_memory_errors(), QEMU crashes with a core dump or exit before its
caller to check the return value. In this case, it's still preferred for
acpi_ghes_memory_errors() returns a value to indicate the success or failure?

>>   {
>>       /* Memory Error Section Type */
>>       const uint8_t guid[] =
>> @@ -555,7 +556,6 @@ int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>>        * Table 17-13 Generic Error Data Entry
>>        */
>>       QemuUUID fru_id = {};
>> -    Error *errp = NULL;
>>       int data_length;
>>       GArray *block;
>>       uint32_t block_status, i;
>> @@ -592,16 +592,9 @@ int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>>       }
>>   
>>       /* Report the error */
>> -    ghes_record_cper_errors(ags, block->data, block->len, source_id, &errp);
>> +    ghes_record_cper_errors(ags, block->data, block->len, source_id, errp);
>>   
>>       g_array_free(block, true);
>> -
>> -    if (errp) {
>> -        error_report_err(errp);
>> -        return -1;
>> -    }
>> -
>> -    return 0;
>>   }
> 
> The error reporting moves into the caller.
> 

Similar question as above. If it's deterministic for the caller passes @error_abort
or @error_fatal to acpi_ghes_memory_errors() and then to ghes_record_cper_errors(),
QEMU crashes with a core dump or exit before error_report_err(errp) can be executed.
In this case, it's still preferred to have error_report_err(&error_abort) or
error_report_err(&error_fatal) in its caller?

>>   
>>   AcpiGhesState *acpi_ghes_get_state(void)
>> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
>> index f73908985d..35c7bbbb01 100644
>> --- a/include/hw/acpi/ghes.h
>> +++ b/include/hw/acpi/ghes.h
>> @@ -98,8 +98,9 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
>>                        const char *oem_id, const char *oem_table_id);
>>   void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>>                             GArray *hardware_errors);
>> -int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>> -                            uint64_t *addresses, uint32_t num_of_addresses);
>> +void acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>> +                             uint64_t *addresses, uint32_t num_of_addresses,
>> +                             Error **errp);
>>   void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>>                                uint16_t source_id, Error **errp);
>>   
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 459ca4a9b0..a889315606 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -2458,13 +2458,9 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>>               addresses[0] = paddr;
>>               if (code == BUS_MCEERR_AR) {
>>                   kvm_cpu_synchronize_state(c);
>> -                if (!acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC,
>> -                                             addresses, 1)) {
>> -                    kvm_inject_arm_sea(c);
>> -                } else {
>> -                    error_report("failed to record the error");
>> -                    abort();
>> -                }
>> +                acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC,
>> +                                        addresses, 1, &error_abort);
>> +                kvm_inject_arm_sea(c);
> 
> Before the patch, we get two error reports, like this:
> 
>      qemu-system-FOO: OSPM does not acknowledge previous error, so can not record CPER for current error anymore
>      qemu-system-FOO: failed to record the error
>      Aborted (core dumped)
> 
> Such error cascades should be avoided.
> 
> Afterwards, we get one:
> 
>      Unexpected error at SOURCE-FILE:LINE-NUMBER:
>      qemu-system-FOO: OSPM does not acknowledge previous error, so can not record CPER for current error anymore
>      Aborted (core dumped)
> 
> Are all errors reported by acpi_ghes_memory_errors() programming errors,
> i.e. when an error is reported, there's a bug for us to fix?
> 
> If not, abort() is wrong before the patch, and &error_abort is wrong
> afterwards.
> 
> You can use &error_fatal for fatal errors that are not programming
> errors.
> 

No, there is no programming errors and the core dump is actually no sense.

It makes more sense for the caller to pass @error_fatal down to acpi_ghes_memory_errors().

>>               }
>>               return;
>>           }
> 

Thanks,
Gavin


