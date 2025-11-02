Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB37BCCFA00
	for <qemu-arm@archiver.kernel.org>; Sun,  2 Nov 2025 22:46:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFgpX-0003gZ-Ui; Sun, 02 Nov 2025 17:45:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vFgpR-0003ft-Br
 for qemu-arm@nongnu.org; Sun, 02 Nov 2025 17:45:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vFgpN-0008S9-Po
 for qemu-arm@nongnu.org; Sun, 02 Nov 2025 17:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762123531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8d8S2xUzgj+mrBrYPWvOjf+k48CAlwVF/c/e8nNh9k=;
 b=AwItE7UZBjDWos2uawQpKRS5Pcm0oVxCxJLmRXndG+Jw5nwz3r5O7MM//qnKvlKPEwttcx
 DynrPoFjgh+v9P9ISJyLG1e8jrzLFYbIPBBqNKmWhcTATdLrrJVCL1YHjLKoGUiKNYKxY5
 K+w+PkEOilBP+aK79HWclENiJalRZGA=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-fpCtc0sLOz2b5OZy5q0ERg-1; Sun, 02 Nov 2025 17:45:30 -0500
X-MC-Unique: fpCtc0sLOz2b5OZy5q0ERg-1
X-Mimecast-MFC-AGG-ID: fpCtc0sLOz2b5OZy5q0ERg_1762123529
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2955f0b8895so10726065ad.0
 for <qemu-arm@nongnu.org>; Sun, 02 Nov 2025 14:45:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762123529; x=1762728329;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y8d8S2xUzgj+mrBrYPWvOjf+k48CAlwVF/c/e8nNh9k=;
 b=g16ihBn3QsD/K8SPU4YUyBDFgJHGduElgiXTW2cl2oec3C1ORg0TEgoxHhonbLNUyy
 tKHXfNv7873jnqG5fmocIF0hUzAGizHbqqk/7BY3Wl7yiLsnjTj6vRlL1mIqq/OoOC7b
 JMVbKuxgP9SJm+RgIxtYFQZ8d0zTHZf/c4VnoAemx3sllFryfcyKuYvVb+pAN0MEiSdj
 oVXLtwvP7PgWrcTNkyIQDASR4wzGXjTCfi1j2UuCfXy5K5HazQA1NWj4huOkhZlglwRR
 +fP4onaN2icErXl2LtHDtxMIMeVXBoejwtg7ak1dddKHnyc6GnmLoJrtWxF9a7SmTvNL
 Z5xw==
X-Gm-Message-State: AOJu0YxheB1VKJyb4ZKMDxpj/57CJyWPcgv+e0d6rdMgEgVKHZGcY++G
 WU1WjDcfuEurvkokHduww/bJW4azaTCno4fDgH+aEoG0Gkg0v8NZDVl7GHox2ra89WVJXhOyd8W
 AdEh4uvnrwy2rk5takudXdz6z/5WyRT5+zDaquSdMsZw9xugH9MlAkA==
X-Gm-Gg: ASbGncviD6S0l3nOex9dRdl5/kFc2wI1GE199GeXCysnfIvQ3sQwITRx9iPzKsMLGC5
 Xx/QwZeUvsw1yoMDAoLBPI4pMHqdG3O2ah7SGmzWoxGGmaZ4GRFaXIt4jt4Q3U9ZZxcBc0SCQsD
 ygLAnL+wEMekWfJjJTUieQ2m8GvL75vrBKNwkG5c0LCfCzJq2eKJIGM7H7WqWCzLl9GV2zjA7yi
 +LfFilvM7i6v0lGzdvtuSW5uU8E+CKJRe3KNyxa1/4gFUNiWBXnBEmRICYJDeCoCIoTbrDRsycq
 iOPm0YntAw/pXph2Q5BfIOsadDctfUyEZnpbNx7NvqVjRPy4fDUoFnwhm87+zDdxhNwqoU1JM8W
 X84VzhQ0YHK+G0e/vhGZ6f6wvhj17mq7aKI7skOk=
X-Received: by 2002:a17:902:db0f:b0:295:3141:4d54 with SMTP id
 d9443c01a7336-2953141500bmr114924005ad.18.1762123528931; 
 Sun, 02 Nov 2025 14:45:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpFm814j7GAKlbphVBlai9uR6hmBezuNkZuaJ8kJQxWwYtEOFceRSOP2l8JPwTgCiJKOdw6w==
X-Received: by 2002:a17:902:db0f:b0:295:3141:4d54 with SMTP id
 d9443c01a7336-2953141500bmr114923785ad.18.1762123528443; 
 Sun, 02 Nov 2025 14:45:28 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3407f096a44sm5423449a91.2.2025.11.02.14.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Nov 2025 14:45:27 -0800 (PST)
Message-ID: <adf9d0f6-4d27-47fe-8153-28e07fa28394@redhat.com>
Date: Mon, 3 Nov 2025 08:45:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 1/3] acpi/ghes: Extend acpi_ghes_memory_errors()
 to support multiple CPERs
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, gengdongjiu1@gmail.com,
 peter.maydell@linaro.org, pbonzini@redhat.com, mchehab+huawei@kernel.org,
 shan.gavin@gmail.com
References: <20251007060810.258536-1-gshan@redhat.com>
 <20251007060810.258536-2-gshan@redhat.com>
 <20251031095850.00002589@huawei.com> <20251031100823.00001c8d@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251031100823.00001c8d@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IJfMHae9s3rFN602PsCP1pXjAzpOuW-Gijo9R3T4rgo_1762123529
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

Hi Jonathan,

On 10/31/25 8:08 PM, Jonathan Cameron wrote:
> On Fri, 31 Oct 2025 09:58:50 +0000
> Jonathan Cameron <jonathan.cameron@huawei.com> wrote:
> 
>> On Tue,  7 Oct 2025 16:08:08 +1000
>> Gavin Shan <gshan@redhat.com> wrote:
>>
>>> In the situation where host and guest has 64KB and 4KB page sizes, one
>>> error on the host's page affects 16 guest's pages. we need to send 16
>>> consective errors in this specific case.
>>
>> Hi Gavin,
>>
>> Sorry this one has been on my to review list far too long.
>>

No worries. Thanks for your review and comments. Igor suggested to have
separate error source for each vCPU. In that way, there will have multiple
read_ack_reg and the specific issue addressed by this series can be resolved.

Answering your question below.

>>>
>>> Extend acpi_ghes_memory_errors() to support multiple CPERs after the
>>> hunk of code to generate the GHES error status is pulled out from
>>> ghes_gen_err_data_uncorrectable_recoverable().
>>
>> I think this description needs to be more detailed wrt to how those
>> multiple CPERs are handled.  Specifically that they are in a single
>> error status block (so should only represent related errors.)
>>
>> This is to make it clear this isn't queuing events, but instead just
>> presenting them as one block.
>>
>>>
>>> No functional changes intended.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   hw/acpi/ghes-stub.c    |  2 +-
>>>   hw/acpi/ghes.c         | 27 ++++++++++++++-------------
>>>   include/hw/acpi/ghes.h |  2 +-
>>>   target/arm/kvm.c       |  7 ++++++-
>>>   4 files changed, 22 insertions(+), 16 deletions(-)
>>
>>> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
>>> index 06555905ce..045b77715f 100644
>>> --- a/hw/acpi/ghes.c
>>> +++ b/hw/acpi/ghes.c
>>> @@ -214,18 +214,13 @@ static void acpi_ghes_build_append_mem_cper(GArray *table,
>>>   
>>>   static void
>>>   ghes_gen_err_data_uncorrectable_recoverable(GArray *block,
>>> -                                            const uint8_t *section_type,
>>> -                                            int data_length)
>>> +                                            const uint8_t *section_type)
>>>   {
>>>       /* invalid fru id: ACPI 4.0: 17.3.2.6.1 Generic Error Data,
>>>        * Table 17-13 Generic Error Data Entry
>>>        */
>>>       QemuUUID fru_id = {};
>>>   
>>> -    /* Build the new generic error status block header */
>>> -    acpi_ghes_generic_error_status(block, ACPI_GEBS_UNCORRECTABLE,
>>> -        0, 0, data_length, ACPI_CPER_SEV_RECOVERABLE);
>>> -]
>>
>> With this bit gone, is it worth having the helper?  Perhaps just move
>> the remains to where it is called.
>>

Ack.

>>>       /* Build this new generic error data entry header */
>>>       acpi_ghes_generic_error_data(block, section_type,
>>>           ACPI_CPER_SEV_RECOVERABLE, 0, 0,
>>
>>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>>> index 4f769d69b3..9a47ac9e3a 100644
>>> --- a/target/arm/kvm.c
>>> +++ b/target/arm/kvm.c
>>> @@ -2434,6 +2434,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>>>       ram_addr_t ram_addr;
>>>       hwaddr paddr;
>>>       AcpiGhesState *ags;
>>> +    GArray *addresses;
>>>   
>>>       assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
>>>   
>>> @@ -2442,6 +2443,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>>>           ram_addr = qemu_ram_addr_from_host(addr);
>>>           if (ram_addr != RAM_ADDR_INVALID &&
>>>               kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
>>> +            addresses = g_array_new(false, false, sizeof(paddr));
>>
>> Given you are going to free in all paths, maybe a g_autofree?
> 
> Oddly there is no use of g_auto() with g_array in qemu. Ah well, next suggestion is
> my preference anyway.
> 

Something like below can be used, and GArray is interchangeable to a regular array.
I guess GArray is preferred in QEMU.

     g_autoptr(GArray) sources = g_array_new(false, true,
                                             sizeof(AcpiNotificationSourceId));

>>
>> Also, we know this only grows to a fixed max size (16 after patch 3), so maybe just
>> provide a hwaddr paddrs[16]; and pass forwards the count?
>>
>>>               kvm_hwpoison_page_add(ram_addr);
>>>               /*
>>>                * If this is a BUS_MCEERR_AR, we know we have been called
>>> @@ -2454,16 +2456,19 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>>>                * later from the main thread, so doing the injection of
>>>                * the error would be more complicated.
>>>                */
>>> +            g_array_append_vals(addresses, &paddr, 1);
>>>               if (code == BUS_MCEERR_AR) {
>>>                   kvm_cpu_synchronize_state(c);
>>>                   if (!acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC,
>>> -                                             paddr)) {
>>> +                                             addresses)) {
>>>                       kvm_inject_arm_sea(c);
>>>                   } else {
>>>                       error_report("failed to record the error");
>>>                       abort();
>>>                   }
>>>               }
>>> +
>>> +            g_array_free(addresses, true);
>>>               return;
>>>           }
>>>           if (code == BUS_MCEERR_AO) {
>>

Thanks,
Gavin


