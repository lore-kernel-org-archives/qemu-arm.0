Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6BBD116F3
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Dec 2025 14:15:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQ4go-0007Au-8P; Mon, 01 Dec 2025 09:15:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vQ4gj-0007A7-9u
 for qemu-arm@nongnu.org; Mon, 01 Dec 2025 09:15:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vQ4gg-0007x6-Vd
 for qemu-arm@nongnu.org; Mon, 01 Dec 2025 09:15:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764598533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lRimqVUdrfhnSN8lnxeb4rNnaVCQkkqSk+hKq8qjfsQ=;
 b=C2SrzIAoFDnqvKR05j8waH2O1ZnKQvx+PZACaAEgxjf/a4UcueVZbmSjL1grhjqYzqhBHq
 vLhOmJMlg5kIQvTvwudCwikon8thgTRWejmrwY1b3ZSS3WEQayu3vZXFI6VTO1UQZY78AX
 f9SjHrvBIB9M89d5h1UN3gE8nioB4lY=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111--5VJm8bYNF-AH3cQcZ1OMg-1; Mon, 01 Dec 2025 09:15:32 -0500
X-MC-Unique: -5VJm8bYNF-AH3cQcZ1OMg-1
X-Mimecast-MFC-AGG-ID: -5VJm8bYNF-AH3cQcZ1OMg_1764598531
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-295952a4dd6so55643325ad.1
 for <qemu-arm@nongnu.org>; Mon, 01 Dec 2025 06:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764598531; x=1765203331;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lRimqVUdrfhnSN8lnxeb4rNnaVCQkkqSk+hKq8qjfsQ=;
 b=JuvCxvKQLVMVuXdayC7l1+JeWYXzQeq3/rRxukQlKxz2Hhr3QC3UXA898oFltYfDbX
 1CLQv/FvTucQy5eKSEjwoQpNN8MRmtfVxrZbPU70KtEQK54xQ4NucuotaZnWGGPg8IVT
 l9gMtjSq2DPPqvX8Qw89miN+fBE9CTtwbTGJiynlypUcjrVhKOWSq6dkAsLjtyUhHasI
 GOryrhP3XLWtebOwiYjSyZi7juaE9vE5jAX212nlR6Ok8CS6Y8TVFoQT1GjvWUpuIY5u
 e7GtoMcvSSIfHJMdBuU7T4o2pDqdbgLjMsUMygPQhARm/gzA5bra/mRZfNPDS35TmtI0
 hCAg==
X-Gm-Message-State: AOJu0Yy82EjkLEZpnByDKCDTrF/c2WOiK/Sgg7d14Fftda4U3TaHMujF
 yWW9B7YN2f5JVbNNJ/75KFtKvDbBW1DxydinHxS1CpAuNmCgCbz/jq504+1EyIucB5PaWaiXu/j
 XRLo7e2blhiCE/gcPBRba8+b4Foy39v1jj0ZhK8CjJSWshEbNXGrkBA==
X-Gm-Gg: ASbGncuzLanP1QcjOGxPdSIfnIAleQ2Wm9kkY3DFirKFR2cEjGAKSNOuGYDj2kbJz+n
 gYYgmmlh1tO6JDFr8wZrRAqJk7QYAxgQuWcRj4mXvI9y7G+1ztr6gD5WWpTwhBlBeNE1xUfF8Fi
 i7xagIda4xy0UqYuXfZ+DfQsbSvdBGY3APggm/wQ52b5YoQxqCE3TeMKebP+L/n2dQy5Z20CCBW
 Ow4fS7FNAzmIqNeKiSMG+zo2sxfX79LlpXKPL1p3oK/vbHRXzQPoj0z6i4o2o5S0mx1/VSJke9O
 1Q848ZsM3zJvDVdDeUGET35aU8Fokxa/QxhDqkMX+AGHkhnyE7LPtrNQcJDM8dnagXXQbOLaUMh
 5G+LgxPd8SSDk6iGmuyBlLtfAcWK7E05Sg+nBCRjwfsyvaBlnzQ==
X-Received: by 2002:a17:90b:5626:b0:343:cfa1:c458 with SMTP id
 98e67ed59e1d1-3473346ea40mr39657204a91.18.1764598531290; 
 Mon, 01 Dec 2025 06:15:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErX3sPZK0s5undad65f7ioCTdwRsgWt3H5r43OEblW7IcWgqWTJDlkp5rhcnRowawH75DkVQ==
X-Received: by 2002:a17:90b:5626:b0:343:cfa1:c458 with SMTP id
 98e67ed59e1d1-3473346ea40mr39657105a91.18.1764598530456; 
 Mon, 01 Dec 2025 06:15:30 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3476a7bd7f3sm16975827a91.13.2025.12.01.06.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 06:15:29 -0800 (PST)
Message-ID: <7893cf54-8fc6-47dc-a1a1-ebb8fd0f6036@redhat.com>
Date: Tue, 2 Dec 2025 00:15:22 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] acpi/ghes: Bail early on error from
 get_ghes_source_offsets()
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mchehab+huawei@kernel.org,
 jonathan.cameron@huawei.com, armbru@redhat.com, mst@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
References: <20251127004435.2098335-1-gshan@redhat.com>
 <20251127004435.2098335-5-gshan@redhat.com>
 <20251201111048.17551273@imammedo>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251201111048.17551273@imammedo>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ngrQCNQxnZxQheVVMiAwqNMxQiIga4bgHX5ftBAX3Ls_1764598531
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On 12/1/25 8:10 PM, Igor Mammedov wrote:
> On Thu, 27 Nov 2025 10:44:34 +1000
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> For one particular error (Error), we can't call error_setg() for twice.
>        ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> I can't really parse that
> maybe rephrase it to make some sense?
> 

I will drop this sentence in v2.

>> Otherwise, the assert(*errp == NULL) will be triggered unexpectedly in
>> error_setv(). In ghes_record_cper_errors(), get_ghes_source_offsets()
>> can return a error initialized by error_setg(). Without bailing on
>> this error, it can call into the second error_setg() due to the
>> unexpected value from the read acknowledgement register.
>>
>> Bail early in ghes_record_cper_errors() when error is received from
>> get_ghes_source_offsets() to avoid the exception.
>>

With above sentence dropped, the commit log improved to something like
below in v2.

In ghes_record_cper_errors(), get_ghes_source_offsets() can return
a error initialized by error_setg(). Without bailing on this error,
it can call into the second error_setg() due to the unexpected value
returned from the read acknowledgement register. The second error_setg()
can trigger assert(*errp == NULL) in its callee error_setv(), which
isn't expected.
     
Bail early in ghes_record_cper_errors() when error is received from
get_ghes_source_offsets() to avoid the unexpected behavior.


>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
> patch itself LGTM
> and with commit message fixed
>    Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
>> ---
>>   hw/acpi/ghes.c | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
>> index 6366c74248..c35883dfa9 100644
>> --- a/hw/acpi/ghes.c
>> +++ b/hw/acpi/ghes.c
>> @@ -443,7 +443,7 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
>>       *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
>>   }
>>   
>> -static void get_ghes_source_offsets(uint16_t source_id,
>> +static bool get_ghes_source_offsets(uint16_t source_id,
>>                                       uint64_t hest_addr,
>>                                       uint64_t *cper_addr,
>>                                       uint64_t *read_ack_start_addr,
>> @@ -474,7 +474,7 @@ static void get_ghes_source_offsets(uint16_t source_id,
>>           /* For now, we only know the size of GHESv2 table */
>>           if (type != ACPI_GHES_SOURCE_GENERIC_ERROR_V2) {
>>               error_setg(errp, "HEST: type %d not supported.", type);
>> -            return;
>> +            return false;
>>           }
>>   
>>           /* Compare CPER source ID at the GHESv2 structure */
>> @@ -488,7 +488,7 @@ static void get_ghes_source_offsets(uint16_t source_id,
>>       }
>>       if (i == num_sources) {
>>           error_setg(errp, "HEST: Source %d not found.", source_id);
>> -        return;
>> +        return false;
>>       }
>>   
>>       /* Navigate through table address pointers */
>> @@ -508,6 +508,8 @@ static void get_ghes_source_offsets(uint16_t source_id,
>>       cpu_physical_memory_read(hest_read_ack_addr, read_ack_start_addr,
>>                                sizeof(*read_ack_start_addr));
>>       *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
>> +
>> +    return true;
>>   }
>>   
>>   NotifierList acpi_generic_error_notifiers =
>> @@ -526,9 +528,10 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>>       if (!ags->use_hest_addr) {
>>           get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
>>                                &cper_addr, &read_ack_register_addr);
>> -    } else {
>> -        get_ghes_source_offsets(source_id, le64_to_cpu(ags->hest_addr_le),
>> -                                &cper_addr, &read_ack_register_addr, errp);
>> +    } else if (!get_ghes_source_offsets(source_id,
>> +                    le64_to_cpu(ags->hest_addr_le),
>> +                    &cper_addr, &read_ack_register_addr, errp)) {
>> +            return;
>>       }
>>   
>>       cpu_physical_memory_read(read_ack_register_addr,
> 

Thanks,
Gavin


