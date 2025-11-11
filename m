Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187FCCCF9E3
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 03:45:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIfJG-0008Mq-Tx; Mon, 10 Nov 2025 22:44:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIfJD-0008Jz-Mr
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 22:44:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIfJC-0005ro-3N
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 22:44:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762832681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pm4JC7F7/iIv/XfExCDEOGMpFEMIENDZi2IMTYveMXc=;
 b=OvUrwHocqYP1zg/pX0p/i42oM2uaYyjf1346TZo5xGnfFMTZMSq5rrnsQGtvivCRSwrbO3
 BULjeymUNgaduei0134yLobs+FTN1I0RylyFYZIGs79/8PXAuV0t2n2Ja3ERlzzyWRLRwO
 mpXTk2pNX+5kp+83ShKETBBJmm8qHcU=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-Zz58DXm-PviB7xTIJ9BTnA-1; Mon, 10 Nov 2025 22:44:39 -0500
X-MC-Unique: Zz58DXm-PviB7xTIJ9BTnA-1
X-Mimecast-MFC-AGG-ID: Zz58DXm-PviB7xTIJ9BTnA_1762832679
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7a432101881so6736404b3a.0
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 19:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762832679; x=1763437479;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pm4JC7F7/iIv/XfExCDEOGMpFEMIENDZi2IMTYveMXc=;
 b=hMdMlhm7w6T9zLx6PmsIAQ8yq5/L2PoG5rO2y6IT4UTajHRkPPLV4P1wASroYG6SoQ
 f1CJg8BI5wEr+c5Fe324t6RlfLa9Hww9b8Wu+4MR9bCt0C2icz6D3fcoIMih3u0ywpHi
 NkeGu0K3QjVT4vvqyQQ+j0VuPCXPac+6D+CIquAAiDja82vQF6kpQ+nn7rioNfMHzggF
 CtAtv94ceCzVidwJprHqvZUFv1l8pmcqN/aQpVYlxkZU07kaZFJlzeMyJ4m93NkrFX3c
 30nRd1uDffPlBb3uZoE8jPGofo3g2980GngRmm1gg2iM9F1ZB/tNVxYdBAv7BajkFzqB
 9M4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiB6x29iC7/IKkWPlsh2xG+LR+wzfro9rVBeqzQ2lwpGywbdMIMTi6RENOq8Duztm/LjjXwWi0yg==@nongnu.org
X-Gm-Message-State: AOJu0YxACR4MewsLTeg3GA1FPTEpYC2bhvV4LpJbo8IesDzjZ/KUIHlb
 QGfy+//L2H++gjIpit6q8aHXMj8uSjITSr95yp9Kv3HOvbFhePqpzJQIx9L3GYHE8XTmvcD2WgI
 Bca9ZTCWXD+btcrPxdZVu6nMY77rSHrOeBPPV+OuGo8dLG6137qrxfQ==
X-Gm-Gg: ASbGnctUshBpauBIx5PHy35aKh4vord1OLvqfKQ17eUYZADlYVLe2Rdcdlzu2ckFjrA
 RFOo3cjG1gmLZ/d62onoyb/mCzuR29slAxfmcmKEaMYjffuY7BLpo71bbpzsl23MYa0hHUyCjOY
 +Q1m3JZwSC2SwfjYaZpiIse1qMfuOk2mb7wS9vuN2P6qzqwp9lTS+wrGWyjWnPgKzk3JcwG6RvX
 NAYxakBoaE7XL6y6iTd+OLys3Kis+5DndY5el3J9peyHnG3FH13r0yhFSUciCKKH6Gtn06Sp9Cw
 DgEaDVO6LnpaTz9UOIOfT608Z5iohlzFVf/6WseyQoaqeRu3NunjWT3CUMDmc00wjzfTQVG99Mi
 vwMRwlWV1JKNOvt9gMrMhHLm7qfoumqXSVDJLD0Q=
X-Received: by 2002:a05:6a00:2e84:b0:782:7052:5167 with SMTP id
 d2e1a72fcca58-7b225acce1bmr14344213b3a.6.1762832678721; 
 Mon, 10 Nov 2025 19:44:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8jOzNraaYSZ0QChjKiUaaMmGZ2uUO6gQFhmQxWAKnnIn4VGztVGqSvresLZcEO4sUs7EEKA==
X-Received: by 2002:a05:6a00:2e84:b0:782:7052:5167 with SMTP id
 d2e1a72fcca58-7b225acce1bmr14344183b3a.6.1762832678334; 
 Mon, 10 Nov 2025 19:44:38 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0ca1e7b19sm13313459b3a.32.2025.11.10.19.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 19:44:37 -0800 (PST)
Message-ID: <6196ad85-9afc-4e87-a784-9bf0191c329f@redhat.com>
Date: Tue, 11 Nov 2025 13:44:31 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] acpi/ghes: Extend acpi_ghes_memory_errors() to
 support multiple CPERs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 mchehab+huawei@kernel.org, gengdongjiu1@gmail.com, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-5-gshan@redhat.com>
 <7ae1ee01-5d3f-4afd-af9a-ba9bc62f3541@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <7ae1ee01-5d3f-4afd-af9a-ba9bc62f3541@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -mHtc6Nf5BI-bfFimjdhY7Wtv8-YiW-U1608365mybI_1762832679
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Philippe,

On 11/11/25 12:48 AM, Philippe Mathieu-Daudé wrote:
> On 5/11/25 12:44, Gavin Shan wrote:
>> In the situation where host and guest has 64KiB and 4KiB page sizes,
>> one problematic host page affects 16 guest pages. we need to send 16
>> consective errors in this specific case.
>>
>> Extend acpi_ghes_memory_errors() to support multiple CPERs after the
>> hunk of code to generate the GHES error status is pulled out from
>> ghes_gen_err_data_uncorrectable_recoverable(). The status field of
>> generic error status block is also updated accordingly if multiple
>> error data entries are contained in the generic error status block.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/acpi/ghes-stub.c    |  2 +-
>>   hw/acpi/ghes.c         | 60 +++++++++++++++++++++++-------------------
>>   include/hw/acpi/ghes.h |  2 +-
>>   target/arm/kvm.c       |  4 ++-
>>   4 files changed, 38 insertions(+), 30 deletions(-)
> 
> 
>> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
>> index a9c08e73c0..527b85c8d8 100644
>> --- a/hw/acpi/ghes.c
>> +++ b/hw/acpi/ghes.c
>> @@ -57,8 +57,12 @@
>>   /* The memory section CPER size, UEFI 2.6: N.2.5 Memory Error Section */
>>   #define ACPI_GHES_MEM_CPER_LENGTH           80
>> -/* Masks for block_status flags */
>> -#define ACPI_GEBS_UNCORRECTABLE         1
>> +/* Bits for block_status flags */
>> +#define ACPI_GEBS_UNCORRECTABLE           0
>> +#define ACPI_GEBS_CORRECTABLE             1
>> +#define ACPI_GEBS_MULTIPLE_UNCORRECTABLE  2
>> +#define ACPI_GEBS_MULTIPLE_CORRECTABLE    3
>> +#define ACPI_GEBS_ERROR_DATA_ENTRIES      4
> 
> Alternatively using "hw/registerfields.h" API:
> 
>    ...
>    FIELD(ACPI_GEBS, MULTIPLE_CORRECTABLE, 3, 1)
>    FIELD(ACPI_GEBS, ERROR_DATA_ENTRIES, 4, 10)
> 
> then use FIELD_DP32() to only set the correct bits.
> 

Acked. It's a nice point and will do in next revision.

Thanks,
Gavin


