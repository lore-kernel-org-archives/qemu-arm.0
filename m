Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp699457lfm;
        Fri, 19 Jun 2020 08:35:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzGS16GzcDC+jeRof80DbYL2+PBtrQPMfLkpTFrgzSzCs5YgIx4gNGCywPynoyKVBuJQkw
X-Received: by 2002:a5b:28f:: with SMTP id x15mr7007221ybl.335.1592580917699;
        Fri, 19 Jun 2020 08:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592580917; cv=none;
        d=google.com; s=arc-20160816;
        b=RMWgWSkfUHdFB+xJjYoO5a8BpXMF/RN5Sm9RDjeeSSVsdgY06FlmLR9eDsPJYq/GgO
         82amYih+6NLLZM6Rgd82OOsZqYdCG+dGvcSf9jOKQ/nYepTsz0p8dK2C6iulhzxDcTsg
         kDeyh8FnOPLzBa1UcrSmmLYZu96tx/UWvCB1a1Ey3z4/09F1tnbnwwngrYCmdZDaSoXC
         qtkRxmOKcfX2nVvYOe3FPlM+US3zr+pinzA6xLsj0SxqZDZY8MnKV2fJXXvgQYm3S58V
         ONTIRD4EljzE+uCTjUD2yB6IWjOl5OsdcS0qBCH0yKVEPSsRfGsK717nCdhZ0tsCNks6
         M0HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HaYoiaOLYH8rW6bGsVtEc09A/2jx9ZEME9QU5dLq3dQ=;
        b=eE2KbE2ZerE8Fz3do8NTe1wN3f4PdrgSAYK7n61tNy1VwgmsRiS1d/T8xJXUSw5o2t
         nJNPFPKODWDz8kPVoFg/fTh/06ft1kJBtD5u0daQgFTm1lbwwFTFq4Bf04GnjCa52u/s
         7LVBQbhJb7GRoPWOboOnguNy8Q4WmlwcxEzTOc7SzNafu0WoXYrUid/TbMWnbStBfaKD
         rhzX0EPMxwOS9pLZrwjPM6A+Nv8kLv4yUiUZJfd10YUtP1eahYBtbNl5Pg6aeEaMRgqG
         mCVbtGHmXsI6qlQ1JMzG2TX7MQDXf3UKkbsu6c7//9MFddK3LHnuz4zGV2JapKPjalVS
         cW3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HNPzD5Bf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 187si5265949yba.204.2020.06.19.08.35.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 08:35:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HNPzD5Bf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmJ2z-0003qp-1a
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 11:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jmJ2r-0003oX-K7
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 11:35:09 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46026
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jmJ2p-0004gY-7m
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 11:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592580906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HaYoiaOLYH8rW6bGsVtEc09A/2jx9ZEME9QU5dLq3dQ=;
 b=HNPzD5BfuxzzfabyLOhOiW9EK89zTJLpvpifHA6kNyrSbCuFUckCrbaILoI1x0SPYX0NJi
 EubaZGDC1WYo7mD7pNwDPuVoY/ZTnuGZDaeya961GmwG/LQHcjB5yFiJPSk2vMFLuhHHOQ
 9zc6VS14L2YJ8kmRMDxIKrz2Y3C0A0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-6_Y8EFsdMsCJ7quWjgZUig-1; Fri, 19 Jun 2020 11:35:02 -0400
X-MC-Unique: 6_Y8EFsdMsCJ7quWjgZUig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20518872FEA;
 Fri, 19 Jun 2020 15:35:01 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B6C25BAD3;
 Fri, 19 Jun 2020 15:34:52 +0000 (UTC)
Subject: Re: [PATCH v6 1/3] acpi: Some build_tpm2() code reshape
To: Stefan Berger <stefanb@linux.ibm.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, imammedo@redhat.com
References: <20200619141851.16272-1-eric.auger@redhat.com>
 <20200619141851.16272-2-eric.auger@redhat.com>
 <cd32ba20-a52d-4ff3-6f01-f03241dfc50d@linux.ibm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5ef75183-bef0-1484-1c80-6cfd3d1ef0b8@redhat.com>
Date: Fri, 19 Jun 2020 17:34:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <cd32ba20-a52d-4ff3-6f01-f03241dfc50d@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 01:50:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, lersek@redhat.com, drjones@redhat.com,
 shannon.zhaosl@gmail.com, marcandre.lureau@redhat.com, philmd@redhat.com,
 ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j54SUPjqFcgj

Hi Stefan,

On 6/19/20 5:07 PM, Stefan Berger wrote:
> On 6/19/20 10:18 AM, Eric Auger wrote:
>> Remove any reference to Acpi20TPM2 and adopt an implementation
>> similar to build_ghes_v2().
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>>
>> ---
>>
>> v5 -> v6:
>> - add reference to the spec + comment about LAML and LASA fields
>> - also moved LASA intro comment above build_append_int_noprefix()
>>    as requested by Igor
>> ---
>>   hw/acpi/aml-build.c | 54 +++++++++++++++++++++++++++++----------------
>>   1 file changed, 35 insertions(+), 19 deletions(-)
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index 2cb7b991ef..1cc08a3eb9 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -1878,48 +1878,64 @@ build_hdr:
>>                    "FACP", tbl->len - fadt_start, f->rev, oem_id,
>> oem_table_id);
>>   }
>>   +/*
>> + * build_tpm2 - Build the TPM2 table as specified in table 7 of
>> + * "TCG ACPI Specification; Family 1.2 and 2.0;
>> + * Level 00 Revision 00.37, December 19, 2014"
>> + * Note: the LASA and LAML fields are optional for TPM-2.0 (the above
>> + * table does not mention them) but are needed at least for SeaBIOS.
>> + * See the Acpi20TPM2 struct for the corresponding layout.
>> + */
>>   void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray
>> *tcpalog)
>>   {
>> -    Acpi20TPM2 *tpm2_ptr = acpi_data_push(table_data,
>> sizeof(AcpiTableHeader));
>> -    unsigned log_addr_size = sizeof(tpm2_ptr->log_area_start_address);
>> -    unsigned log_addr_offset =
>> -        (char *)&tpm2_ptr->log_area_start_address - table_data->data;
>>       uint8_t start_method_params[12] = {};
>> +    unsigned log_addr_offset, tpm2_start;
>> +    uint64_t control_area_start_address;
>>       TPMIf *tpmif = tpm_find();
>> +    uint32_t start_method;
>> +    void *tpm2_ptr;
>>   -    /* platform class */
>> +    tpm2_start = table_data->len;
>> +    tpm2_ptr = acpi_data_push(table_data, sizeof(AcpiTableHeader));
>> +
>> +    /* Platform Class */
>>       build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
>> -    /* reserved */
>> +    /* Reserved */
>>       build_append_int_noprefix(table_data, 0, 2);
>>       if (TPM_IS_TIS_ISA(tpmif) || TPM_IS_TIS_SYSBUS(tpmif)) {
>> -        /* address of control area */
>> -        build_append_int_noprefix(table_data, 0, 8);
>> -        /* start method */
>> -        build_append_int_noprefix(table_data, TPM2_START_METHOD_MMIO,
>> 4);
>> +        control_area_start_address = 0;
>> +        start_method = TPM2_START_METHOD_MMIO;
>>       } else if (TPM_IS_CRB(tpmif)) {
>> -        build_append_int_noprefix(table_data, TPM_CRB_ADDR_CTRL, 8);
>> -        build_append_int_noprefix(table_data, TPM2_START_METHOD_CRB, 4);
>> +        control_area_start_address = TPM_CRB_ADDR_CTRL;
>> +        start_method = TPM2_START_METHOD_CRB;
>>       } else {
>> -        g_warn_if_reached();
>> +        g_assert_not_reached();
>>       }
>> +    /* Address of Control Area */
>> +    build_append_int_noprefix(table_data, control_area_start_address,
>> 8);
>> +    /* Start Method */
>> +    build_append_int_noprefix(table_data, start_method, 4);
>>   -    /* platform specific parameters */
>> -    g_array_append_vals(table_data, &start_method_params, 12);
>> +    /* Platform Specific Parameters */
>> +    g_array_append_vals(table_data, &start_method_params,
>> +                        ARRAY_SIZE(start_method_params));
>>   -    /* log area minimum length */
>> +    /* Log Area Minimum Length */
>>       build_append_int_noprefix(table_data, TPM_LOG_AREA_MINIMUM_SIZE,
>> 4);
>>         acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
>>       bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE,
>> tcpalog, 1,
>>                                false);
>>   -    /* log area start address to be filled by Guest linker */
>> +    log_addr_offset = table_data->len;
>> +
> 
> Don't have to subtract tpm2_start from it ?
no that's the absolute offset. It was

unsigned log_addr_offset =
        (char *)&tpm2_ptr->log_area_start_address - table_data->data;

Thanks

Eric
> 
> 
>> +    /* Log Area Start Address to be filled by Guest linker */
>>       build_append_int_noprefix(table_data, 0, 8);
>>       bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
>> -                                   log_addr_offset, log_addr_size,
>> +                                   log_addr_offset, 8,
>>                                      ACPI_BUILD_TPMLOG_FILE, 0);
>>       build_header(linker, table_data,
>> -                 (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4,
>> NULL, NULL);
>> +                 tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4,
>> NULL, NULL);
>>   }
>>     /* ACPI 5.0: 6.4.3.8.2 Serial Bus Connection Descriptors */
> 
> 
> 

