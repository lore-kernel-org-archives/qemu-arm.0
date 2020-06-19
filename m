Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp733888lfm;
        Fri, 19 Jun 2020 09:15:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvcMHXExqDQTkVhdVsN082UQeUf0PRicLDoFMKZ+yJutviDuSOPIY8NEUw9FiKBkF3Iwuw
X-Received: by 2002:a25:ad45:: with SMTP id l5mr6716710ybe.401.1592583317573;
        Fri, 19 Jun 2020 09:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592583317; cv=none;
        d=google.com; s=arc-20160816;
        b=y6TLqrLrAZSgHByNXyZTEYsBhTXRZ0KiSgCmc8Yk+88ONndHoXg2vsdsqgbWAPVCBQ
         RCSGRAM/i6gbob/m7Rb3QZOV23zyUWKP/x8TaMgK2nObD05vtm582cu2lDFlh1iB83bf
         9EFKYLHJ29M9I1gftO6jBacGsmzQSK56rQSyq6m/cghIv+u3zbnXPeSF8+qyGJHP5A8r
         kbyGDFJcW7Kq14VyZ9X2xwXu+19bdXPAcrtvH8igs8O33P/rfTkfM1tNdWhWERB399/w
         yTwwSOjqsDEV/YwNaKW7e94Xi6R6PG1hkR70pD5whTTtm3K1Q69z/aCyQ2m65kqn10YL
         exmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GSb7a2HVPEyro4IgWZrApi+W8wMfkPhnS+RcTDCXHh8=;
        b=N5p+lxZ/AIYA4RtGi6mdWwh79tdEMaZB/nycNEo2lEB8sa4SKScC0+gepBma+YlSld
         U3kWvh2Fqa9egT0ZS7wiXROGQhUEs7CkO1dymzRid0/YK7M0bV9DfJqCcJ0k8Vq69d2j
         rNowwofAj+SQjd/GF9rkxPWW4OYwpbVmlghbYPIrWDvZ054cYzHQ5EfHHJrVVyEdWBMe
         TCKqFtxnBTHX/RW1vsmL3uPBiNVCAXVpV3paPUDJoLi7wSz1r8zhh5vB+pc+wUxlnDVp
         afki+YE/w1AHjf+iD42mbiSd5+6n4tMkS1uISD8uvW1Qba8mcBl975I0Q9HiS3+R/M58
         F8mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CZVVggf6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si8428334ybt.495.2020.06.19.09.15.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 09:15:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CZVVggf6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmJfg-00088e-U3
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 12:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jmJfR-00087F-MZ
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 12:15:01 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:55456
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jmJfP-0003BD-KU
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 12:15:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592583297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GSb7a2HVPEyro4IgWZrApi+W8wMfkPhnS+RcTDCXHh8=;
 b=CZVVggf6mT9Wbgtak2CT6k+A/uD8IamqWI/6MxheL40V9/6LzSPh7YlQPfQWtCHlDTw4co
 nnWe7dgqB+aS0Xd83c6VgarxjU/qDqgdTs31IIvkmTy8AGF8m9F4dwlmLDD3vXofa9hfqp
 uSmk3x6PUPQN9DIhJ/qf3g43SV5/7mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-9_999KXpN_CcuJi83BhxmA-1; Fri, 19 Jun 2020 12:14:44 -0400
X-MC-Unique: 9_999KXpN_CcuJi83BhxmA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC49E8AB3AC;
 Fri, 19 Jun 2020 16:14:33 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82F8361465;
 Fri, 19 Jun 2020 16:14:17 +0000 (UTC)
Subject: Re: [PATCH v6 1/3] acpi: Some build_tpm2() code reshape
To: Stefan Berger <stefanb@linux.ibm.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, imammedo@redhat.com
References: <20200619141851.16272-1-eric.auger@redhat.com>
 <20200619141851.16272-2-eric.auger@redhat.com>
 <bfd5813b-12ef-04c8-0f21-4a3934fa0035@linux.ibm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <cc346cfb-57c5-a5b8-812f-f8a2ab152373@redhat.com>
Date: Fri, 19 Jun 2020 18:14:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <bfd5813b-12ef-04c8-0f21-4a3934fa0035@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 02:45:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: 9wwVu9pfClB5

Hi Stefan,

On 6/19/20 6:09 PM, Stefan Berger wrote:
> On 6/19/20 10:18 AM, Eric Auger wrote:
>> Remove any reference to Acpi20TPM2 and adopt an implementation
>> similar to build_ghes_v2().
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> 
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> 
> Tested-by: Stefan Berger <stefanb@linux.ibm.com>

Thanks!

Eric
> 
> 
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

