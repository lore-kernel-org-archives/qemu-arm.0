Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3187DCCF9E3
	for <qemu-arm@archiver.kernel.org>; Sun,  2 Nov 2025 22:52:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFgvj-0005TD-0R; Sun, 02 Nov 2025 17:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vFgvi-0005SU-H7
 for qemu-arm@nongnu.org; Sun, 02 Nov 2025 17:52:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vFgvf-0001t9-4p
 for qemu-arm@nongnu.org; Sun, 02 Nov 2025 17:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762123923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MDBbKutPjnr1sYwd8sdFxZCled7Fo0s/512vIMH3b3M=;
 b=jTc+Mgx2UccbTqDMESKaFlpFrbanfAsuH0wbQeiETIFnXAj61IAdnBogNwFrRxywbVx4/3
 ZMqLYNd3uvPMjPlewwcZ80e5LYcFFQi9O4BfU+5bDFJZ9V1fi3mF0dTVLBxGYfInAvFCVz
 7gzCeFBeXXB5E0szZQOQqn8C89m1J0o=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-5vgjNzKYMNy29JJKopXMtw-1; Sun, 02 Nov 2025 17:52:02 -0500
X-MC-Unique: 5vgjNzKYMNy29JJKopXMtw-1
X-Mimecast-MFC-AGG-ID: 5vgjNzKYMNy29JJKopXMtw_1762123921
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-29554d36a77so18767335ad.1
 for <qemu-arm@nongnu.org>; Sun, 02 Nov 2025 14:52:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762123921; x=1762728721;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MDBbKutPjnr1sYwd8sdFxZCled7Fo0s/512vIMH3b3M=;
 b=TFRXWfk15js76LW4lNn0QVbFGPtMm2GpH3npOlIfQrz4/ZgRurcF3K9Tr3jMX5b5Vo
 7ypwASKBAbRBvIi7PST+Ybnnro5N5/IiMZP84+Kt8C2r0IXJPkeOx8M8Wq1NJF2gJwJf
 htKNAm7Fg1NjFRgdoQINRwOq9vAGQowjZw+Rgnu2YArDuJ3eQCfsef3zZ4/VANOb9IP5
 WDuJ1gnKUauJRbJeSM25CQdYyXXI9awUO1AkwmfCSt3AWdCRE93Vb8Q1J1XaovkpVTLU
 Yu3hutxg/mJ/6T+Sx4tsbE5d9VC1IySHd4uqXuPaxAKiqIWdGO3Wz4PS+VJJPQQ5pDix
 srjw==
X-Gm-Message-State: AOJu0YxTah5OaaVThba+EXvMAo65epJ5fwXidvTiSWrnVgRf9juAqKlL
 or1rC5TrfRC7D8auHBXmzKLn8n9LhLaATmwlMb+uUCgwttjzLzyMLAdetNi6d6TWVXINTw+EJhl
 CVM96+lFjJyOKd1qoLfrq19Vpy0VeQB837O2OwXJjbDxpeZ/ot7zi2yrzYVyq1g==
X-Gm-Gg: ASbGncsLWmEHRZpKhze+cEgqKbnJEo/qQFyuHaHeUdduply93LHes7aRhAEujlHIMyD
 0Si1NePwIfwLqv28y1+XgRmhqVAPXG6+onOJc79K4rvW14fjon7XEraC+459rKpO7Wpc7GT/TDe
 Jq99/O0N+uaHLLiLucM9XDmweaFLHwhkd39/0u1JFXI1UEZ7B0o3wFAIAX8in3Wp2S3qkXFOnCJ
 KLsqtsqHlUVGrHCJUg3k5v0GcGIQq75UWAXo8kGlk9clktkbC95/vC8jes3swl+krW0Y0+TtXRd
 hwEmWwNHaozNa45Rn9LCd15aojsDeSEn+3onrBuv0es4KkbVBfW4rhBHLRlczHPELU+DwWoLi6j
 NLcXc85rHdGVUWCfTXldevw/TJ1/BZlb2UAcHD/s=
X-Received: by 2002:a17:902:dac7:b0:295:2c8e:8e50 with SMTP id
 d9443c01a7336-2952c8e96d9mr101389105ad.31.1762123920635; 
 Sun, 02 Nov 2025 14:52:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHoygPS9sE341OJUJJCGfaRlAl8U6IHD0TgjIWFGym0KvJvlCtNlMh+x2sWH3WC4OzhhCAyg==
X-Received: by 2002:a17:902:dac7:b0:295:2c8e:8e50 with SMTP id
 d9443c01a7336-2952c8e96d9mr101388905ad.31.1762123920219; 
 Sun, 02 Nov 2025 14:52:00 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29564fb531asm53068395ad.14.2025.11.02.14.51.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Nov 2025 14:51:59 -0800 (PST)
Message-ID: <4ea56333-ef9a-48fd-9bc1-6bba4d342318@redhat.com>
Date: Mon, 3 Nov 2025 08:51:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 1/3] acpi/ghes: Extend acpi_ghes_memory_errors()
 to support multiple CPERs
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, mchehab+huawei@kernel.org, Jonathan.Cameron@huawei.com,
 shan.gavin@gmail.com
References: <20251007060810.258536-1-gshan@redhat.com>
 <20251007060810.258536-2-gshan@redhat.com> <20251031141721.4d336189@fedora>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251031141721.4d336189@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T9J4V0EseUgUVbQV_rQIB6dRaq3vrqeGXUa_QXz3m3o_1762123921
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
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

On 10/31/25 11:17 PM, Igor Mammedov wrote:
> On Tue,  7 Oct 2025 16:08:08 +1000
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> In the situation where host and guest has 64KB and 4KB page sizes, one
>> error on the host's page affects 16 guest's pages. we need to send 16
>> consective errors in this specific case.
>>
>> Extend acpi_ghes_memory_errors() to support multiple CPERs after the
>> hunk of code to generate the GHES error status is pulled out from
>> ghes_gen_err_data_uncorrectable_recoverable().
>>
>> No functional changes intended.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/acpi/ghes-stub.c    |  2 +-
>>   hw/acpi/ghes.c         | 27 ++++++++++++++-------------
>>   include/hw/acpi/ghes.h |  2 +-
>>   target/arm/kvm.c       |  7 ++++++-
>>   4 files changed, 22 insertions(+), 16 deletions(-)
>>
>> diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
>> index 40f660c246..c1f8c9bec9 100644
>> --- a/hw/acpi/ghes-stub.c
>> +++ b/hw/acpi/ghes-stub.c
>> @@ -12,7 +12,7 @@
>>   #include "hw/acpi/ghes.h"
>>   
>>   int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>> -                            uint64_t physical_address)
>> +                            GArray *addresses)
>>   {
>>       return -1;
>>   }
>> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
>> index 06555905ce..045b77715f 100644
>> --- a/hw/acpi/ghes.c
>> +++ b/hw/acpi/ghes.c
>> @@ -214,18 +214,13 @@ static void acpi_ghes_build_append_mem_cper(GArray *table,
>>   
>>   static void
>>   ghes_gen_err_data_uncorrectable_recoverable(GArray *block,
>> -                                            const uint8_t *section_type,
>> -                                            int data_length)
>> +                                            const uint8_t *section_type)
>>   {
>>       /* invalid fru id: ACPI 4.0: 17.3.2.6.1 Generic Error Data,
>>        * Table 17-13 Generic Error Data Entry
>>        */
>>       QemuUUID fru_id = {};
>>   
>> -    /* Build the new generic error status block header */
>> -    acpi_ghes_generic_error_status(block, ACPI_GEBS_UNCORRECTABLE,
>> -        0, 0, data_length, ACPI_CPER_SEV_RECOVERABLE);
>> -
>>       /* Build this new generic error data entry header */
>>       acpi_ghes_generic_error_data(block, section_type,
>>           ACPI_CPER_SEV_RECOVERABLE, 0, 0,
>> @@ -557,19 +552,20 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>>   }
>>   
>>   int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>> -                            uint64_t physical_address)
>> +                            GArray *addresses)
>>   {
>>       /* Memory Error Section Type */
>>       const uint8_t guid[] =
>>             UUID_LE(0xA5BC1114, 0x6F64, 0x4EDE, 0xB8, 0x63, 0x3E, 0x83, \
>>                     0xED, 0x7C, 0x83, 0xB1);
>>       Error *errp = NULL;
>> -    int data_length;
>> +    int data_length, i;
>>       GArray *block;
>>   
>>       block = g_array_new(false, true /* clear */, 1);
>>   
>> -    data_length = ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH;
>> +    data_length = addresses->len *
>> +                  (ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH);
>>       /*
>>        * It should not run out of the preallocated memory if adding a new generic
>>        * error data entry
>> @@ -577,10 +573,15 @@ int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>>       assert((data_length + ACPI_GHES_GESB_SIZE) <=
>>               ACPI_GHES_MAX_RAW_DATA_LENGTH);
>>   
>> -    ghes_gen_err_data_uncorrectable_recoverable(block, guid, data_length);
>> -
>> -    /* Build the memory section CPER for above new generic error data entry */
>> -    acpi_ghes_build_append_mem_cper(block, physical_address);
>> +    /* Build the new generic error status block header */
>> +    acpi_ghes_generic_error_status(block, ACPI_GEBS_UNCORRECTABLE, 0, 0,
>                                               ^^^^^
> with following loop, it might be no enough. See ACPI6.5 Tables 18.11: Status field
> 
> Don't we need to set multiple_foo bit(s) and also fix 'Error Data Entry Count' bits?
> 

Ack, those two fields need to be fixed accordingly.

>> +                                   data_length, ACPI_CPER_SEV_RECOVERABLE);
>> +    for (i = 0; i < addresses->len; i++) {
>> +        ghes_gen_err_data_uncorrectable_recoverable(block, guid);
>> +        /* Memory section CPER on top of the generic error data entry */
>> +        acpi_ghes_build_append_mem_cper(block,
>> +                                        g_array_index(addresses, uint64_t, i));
>> +    }
> 
>>   
>>       /* Report the error */
>>       ghes_record_cper_errors(ags, block->data, block->len, source_id, &errp);
>> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
>> index df2ecbf6e4..a8cbc520d5 100644
>> --- a/include/hw/acpi/ghes.h
>> +++ b/include/hw/acpi/ghes.h
>> @@ -99,7 +99,7 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
>>   void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>>                             GArray *hardware_errors);
>>   int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>> -                            uint64_t error_physical_addr);
>> +                            GArray *addresses);
>>   void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>>                                uint16_t source_id, Error **errp);
>>   
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 4f769d69b3..9a47ac9e3a 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -2434,6 +2434,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>>       ram_addr_t ram_addr;
>>       hwaddr paddr;
>>       AcpiGhesState *ags;
>> +    GArray *addresses;
>>   
>>       assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
>>   
>> @@ -2442,6 +2443,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>>           ram_addr = qemu_ram_addr_from_host(addr);
>>           if (ram_addr != RAM_ADDR_INVALID &&
>>               kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
>> +            addresses = g_array_new(false, false, sizeof(paddr));
>>               kvm_hwpoison_page_add(ram_addr);
>>               /*
>>                * If this is a BUS_MCEERR_AR, we know we have been called
>> @@ -2454,16 +2456,19 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>>                * later from the main thread, so doing the injection of
>>                * the error would be more complicated.
>>                */
>> +            g_array_append_vals(addresses, &paddr, 1);
>>               if (code == BUS_MCEERR_AR) {
>>                   kvm_cpu_synchronize_state(c);
>>                   if (!acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC,
>> -                                             paddr)) {
>> +                                             addresses)) {
>>                       kvm_inject_arm_sea(c);
>>                   } else {
>>                       error_report("failed to record the error");
>>                       abort();
>>                   }
>>               }
>> +
>> +            g_array_free(addresses, true);
>>               return;
>>           }
>>           if (code == BUS_MCEERR_AO) {

Thanks,
Gavin


