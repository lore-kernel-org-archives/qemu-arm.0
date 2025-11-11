Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636B8CCF9E3
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 03:59:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIfX6-0003Qu-HB; Mon, 10 Nov 2025 22:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIfX3-0003Ow-28
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 22:59:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIfX1-0007io-42
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 22:59:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762833537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W40hsoHZzfYuXfaygXOzFaBww57/LsJq5UosWDuMl6E=;
 b=FMpmAhjFCBKH1ycrqfiQElsgoGzAHdP4IjkTe0K7sI9uCiYn2Rdw2JkjnfeYG7khWE3fT+
 daBsnoh4MR8ZNq4AzDoqHV4Rja8+0g41hZxcnL8OUptr9va02ZglRe0sY1vuL38KvHJxy/
 Uy7/hiRD+T7XQpNGijLK0RihukpKCo0=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-MfkaGJF7Mae3P1qJ6-qPIA-1; Mon, 10 Nov 2025 22:58:55 -0500
X-MC-Unique: MfkaGJF7Mae3P1qJ6-qPIA-1
X-Mimecast-MFC-AGG-ID: MfkaGJF7Mae3P1qJ6-qPIA_1762833534
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2982dec5ccbso31984845ad.3
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 19:58:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762833534; x=1763438334;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W40hsoHZzfYuXfaygXOzFaBww57/LsJq5UosWDuMl6E=;
 b=iH6ERQZKAEIKAhdkoSWHfgeDnh/rB4IS1lUPuChpioTROWpFDgKhBUgjMsDAF6gdTZ
 C61e0z/06tdz2UHjwJIXlKyCaNQ06CbfHa8ElRBtoIP5BRhLaKl6f/0sfUPnJS4YdsWh
 +0LY5iovLrN8GDXw50Hzj1A4IwXTu5pNmNsGX1jcaMRscS6lc2G4JanurNQSjJxDVif9
 pZKrTAbN3ShQGxhMyyMzs2rrIxz0apN3TXno8MA5HxEIFmOSyhbzIwrw5ZIkTWtHMXlV
 XwzHMoWAlZbULpzjMvYqEa3SE6l2P4BiNlFYKb9sAWjnouZcx0E5Dg5ZEJzATUD9Ce3a
 lKAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMO33FAkM8nUrPAVOmZoPA+QmEDJrnidhhmSQ1qx1qnW+GMkA1kP7NukJLYLUUW+tf3kaK2qRxKQ==@nongnu.org
X-Gm-Message-State: AOJu0YyNB6gOODUA76Gpb2Ymgb6nxfHNQFBWg0u4GQbzCv5HtmAJABWD
 avzoMJX/WdQWXvcLkX48c8r2+MFLsB9ExKPMsQeRIdFGGKO4OdpzYNdl6nEkpLjJRk/wvCZ+pCC
 l0mX3t5K/eStH3yk4WjMfyWypYXsNwXaHX+6bKyMU2FLzlmjXa5fqSQ==
X-Gm-Gg: ASbGncvBQjU/l90jGWFS5ZWvB/0+kNMn3ccLYUue3Vtz5k7VweSVKiwM/0xKqfXE0fJ
 aioSCuTFABnWG+ikjT/cxM/9fkFmXSflKDwNFUWegJvaoSWwPziG6vphYlj82isR49K+BbmV70C
 cho2fChPsq2lm4r6x0814KRiO5RjOLYLMmEKzr34PUvtJlM7drBUm5HKUMRquEGrOL3Y6DUEvnt
 qBSYLYXpFuPAPLRW4LNdWWeZgPS3XKsVP8mFBYp+yOvRffZ+EJBi6tUwiKa3YziWrm9zUvAOsUa
 J3GR5AjvL6a9uaXlyiVn7W/++LHFiy4dCbOGv9Kt//Q812b+Qa/z4OtAD+A44F+RlSymCT+G+S/
 pj3TMxyTjJSxeTu86GUsZfnV4uJ9wunQK/mqOeQY=
X-Received: by 2002:a17:902:e382:b0:295:596f:850a with SMTP id
 d9443c01a7336-297e540d840mr91473045ad.5.1762833533774; 
 Mon, 10 Nov 2025 19:58:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRiUjnlI8y2+BW369QpuPGR9v1JePfWAQHOQ8q9RivJSZEl0zKgmbjr0c8sGrPSuBWFYnnuw==
X-Received: by 2002:a17:902:e382:b0:295:596f:850a with SMTP id
 d9443c01a7336-297e540d840mr91472905ad.5.1762833533393; 
 Mon, 10 Nov 2025 19:58:53 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651c8f07csm167324385ad.78.2025.11.10.19.58.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 19:58:52 -0800 (PST)
Message-ID: <4af87665-14b1-41a4-8ed9-d3c9dfc087b8@redhat.com>
Date: Tue, 11 Nov 2025 13:58:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] acpi/ghes: Use error_abort in
 acpi_ghes_memory_errors()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 mchehab+huawei@kernel.org, gengdongjiu1@gmail.com, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com,
 Markus Armbruster <armbru@redhat.com>
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-7-gshan@redhat.com>
 <2c3b388e-e002-466a-9b03-cafefcfc9d19@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <2c3b388e-e002-466a-9b03-cafefcfc9d19@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WbRAALX0zHJxCmmon8j_54H3iueJg6_myiJrg67s1sE_1762833534
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

Hi Philippe,

On 11/11/25 12:54 AM, Philippe Mathieu-Daudé wrote:
> On 5/11/25 12:44, Gavin Shan wrote:
>> Use error_abort in acpi_ghes_memory_errors() so that the caller needn't
>> explicitly call abort() on errors. With this change, its return value
>> isn't needed any more.
>>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/acpi/ghes-stub.c    |  6 +++---
>>   hw/acpi/ghes.c         | 15 ++++-----------
>>   include/hw/acpi/ghes.h |  5 +++--
>>   target/arm/kvm.c       | 10 +++-------
>>   4 files changed, 13 insertions(+), 23 deletions(-)
> 
> 
>> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
>> index f73908985d..35c7bbbb01 100644
>> --- a/include/hw/acpi/ghes.h
>> +++ b/include/hw/acpi/ghes.h
>> @@ -98,8 +98,9 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
>>                        const char *oem_id, const char *oem_table_id);
>>   void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>>                             GArray *hardware_errors);
>> -int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>> -                            uint64_t *addresses, uint32_t num_of_addresses);
>> +void acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>> +                             uint64_t *addresses, uint32_t num_of_addresses,
>> +                             Error **errp);
> 
> This is an anti-pattern w.r.t. commit e3fe3988d78 ("error: Document
> Error API usage rules"), because it can be called with an errp distinct
> of &error_abort.
> 
> If you really want to abort(), remove the errp argument, directly call
> abort() and rename as acpi_ghes_memory_abort_on_errors().
> 

Thanks for pointing it out. I will improve this like below in next revision.

- Drop 'errp' argument from acpi_ghes_memory_errors(), but I prefer to keep
   the function name.

- In acpi_ghes_memory_errors(), a local variable 'Error *err' is added and
   pass it to ghes_record_cper_errors(), which is also called by QMP handler
   qmp_inject_ghes_v2_error().

Please let me know if there are any more improvements needed.

>>   void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>>                                uint16_t source_id, Error **errp);
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 459ca4a9b0..a889315606 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -2458,13 +2458,9 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>>               addresses[0] = paddr;
>>               if (code == BUS_MCEERR_AR) {
>>                   kvm_cpu_synchronize_state(c);
>> -                if (!acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC,
>> -                                             addresses, 1)) {
>> -                    kvm_inject_arm_sea(c);
>> -                } else {
>> -                    error_report("failed to record the error");
>> -                    abort();
>> -                }
>> +                acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC,
>> +                                        addresses, 1, &error_abort);
>> +                kvm_inject_arm_sea(c);
>>               }
>>               return;
>>           }
> 

Thanks,
Gavin


