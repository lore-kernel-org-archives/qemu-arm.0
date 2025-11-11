Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C67CCFA18
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 03:41:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIfFV-0004B5-PW; Mon, 10 Nov 2025 22:40:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIfFT-00049B-4A
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 22:40:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIfFQ-0005XG-N2
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 22:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762832447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oqeI8PBOVyJPpLRawkuwP2zVH9YjBiGVPSlZ3dKGgB8=;
 b=S8LAqJn/G0MTAqMM10sismICiZvjheGoqPHlbyRalIIYoY5QAe4SoHXwUskKja5xWVDZf+
 MaVckaxeDzw2xrCzvg7CtaqdJu4GV4ESgI0AvGDmQvT7KG4m0dA4WdkzWDaeNXzYcRey7y
 Jm+vxPBCTQJzXyhwMf02MNfUqs1Soyc=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-3pTuCgIBP8aYJ9k4tqYx9g-1; Mon, 10 Nov 2025 22:40:45 -0500
X-MC-Unique: 3pTuCgIBP8aYJ9k4tqYx9g-1
X-Mimecast-MFC-AGG-ID: 3pTuCgIBP8aYJ9k4tqYx9g_1762832444
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-295fbc7d4abso36421125ad.1
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 19:40:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762832444; x=1763437244;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oqeI8PBOVyJPpLRawkuwP2zVH9YjBiGVPSlZ3dKGgB8=;
 b=haqwqXco2iZb8iMl2nNvW1AebsqCjvwXeWV3+Dp77W5xWJNllBjQyjCxFp+r+L0gCP
 1NK3SrTxXmnS4uVylZEZQ0qW9T5a25AnJTI/YegXSXgK+FRGXEDYJBNHobFh263ts3Mh
 zM6+qD8hx31rJjEJs3L1yWAR5a1VH4h4IGNwHWDenfixu4F1asP2oy2XFJfeNyxCIjaY
 u0RhhWluUALBdGO++tZVjTMUEJyS07lL2A6jAES1PORg0+rr/q/+8insmxZindvSeyUQ
 wXV5aoKmWHHa/xELMvT6Mn42A4lhu+MmfaC8WcCBQ24zuszd9NLNA153vtpZr57PoZwa
 rW+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7zwjncoBWDF/0ehJwkz7T3kiOcdrfV1muR4IfAmIHfCTTxUm9/qTRLX4ar1leWxcBM5ztmbayCA==@nongnu.org
X-Gm-Message-State: AOJu0Yz4+dr0jXnGQLZHgU8/boUi9D1JBJllg7RxQutmR6z4fS+QBmgG
 X82pkIlcebAhvNBJH/srrwrT+xh9zuLlorS4KHHcEDi5Xvik8J87gySefWTpHr1m1PtO239ILLQ
 l8z4k3LNkMcCHK917utv9VDeC3mZy9XDKFmPicngKsftHXrBU85daYg==
X-Gm-Gg: ASbGncseZzei3aQIepHE5rJ9b4i1HPNlMn4quqsvRx1Pe2KGvFlQQBkdcCDOY4cK64v
 ww9W1NmaXbqCQO6PvwiCFNyWoYnmlSZzmTkPx3za7lAgJxIksXhPIqLM87P8gSyMcnR05zg4n+e
 5EfXOel6SUu/YL6BwZ0/TxCysx7pIFdUk99spb/vGB3NETrAfJLhidwRegoRAqqShm80/nvmfZI
 oclp/9zbQGuNIE/uDYxMbhToY79zyVdyVzbJW503QnJhC6nMywrH0lpT4m5PuIYdFIc9nVKkIdp
 1Yn5cafpMcHKnnYP2GZWYufDkDnqvvfy47drfWnCkxP1oE/wXqfeWR2qIhJfH2gVs5B21gUqMy+
 EmCBy2DuSFXAQIHklcBVBCU8z++g/fVNh9l1dLhE=
X-Received: by 2002:a17:902:e951:b0:298:ab7:85b3 with SMTP id
 d9443c01a7336-2980ab78690mr95342525ad.55.1762832443954; 
 Mon, 10 Nov 2025 19:40:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF24LMbc4x2xiRhT1iaUbdmps+aAiZ3sIjijZ++isRA9vAiZA9U3907LPUZwBYWo07BOnRl0w==
X-Received: by 2002:a17:902:e951:b0:298:ab7:85b3 with SMTP id
 d9443c01a7336-2980ab78690mr95342245ad.55.1762832443518; 
 Mon, 10 Nov 2025 19:40:43 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651cc1907sm161713035ad.99.2025.11.10.19.40.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 19:40:42 -0800 (PST)
Message-ID: <a6adb9ad-5e73-4f86-951f-c2ef89e36226@redhat.com>
Date: Tue, 11 Nov 2025 13:40:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] acpi/ghes: Extend acpi_ghes_memory_errors() to
 support multiple CPERs
From: Gavin Shan <gshan@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 mchehab+huawei@kernel.org, gengdongjiu1@gmail.com, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-5-gshan@redhat.com>
 <aebd41cc-470d-46b3-85a2-1d8a1c62621d@linaro.org>
 <dd43ee6c-6968-4b45-ac35-e9e88bd80629@redhat.com>
In-Reply-To: <dd43ee6c-6968-4b45-ac35-e9e88bd80629@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g3kr7M7t9E-sbgHTgtZqis2DmZsZjW7f-0pPO-fjcxo_1762832444
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

On 11/11/25 9:38 AM, Gavin Shan wrote:
> On 11/11/25 12:43 AM, Philippe Mathieu-Daudé wrote:
>> On 5/11/25 12:44, Gavin Shan wrote:
>>> In the situation where host and guest has 64KiB and 4KiB page sizes,
>>> one problematic host page affects 16 guest pages. we need to send 16
>>> consective errors in this specific case.
>>>
>>> Extend acpi_ghes_memory_errors() to support multiple CPERs after the
>>> hunk of code to generate the GHES error status is pulled out from
>>> ghes_gen_err_data_uncorrectable_recoverable(). The status field of
>>> generic error status block is also updated accordingly if multiple
>>> error data entries are contained in the generic error status block.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   hw/acpi/ghes-stub.c    |  2 +-
>>>   hw/acpi/ghes.c         | 60 +++++++++++++++++++++++-------------------
>>>   include/hw/acpi/ghes.h |  2 +-
>>>   target/arm/kvm.c       |  4 ++-
>>>   4 files changed, 38 insertions(+), 30 deletions(-)
>>
>>
>>>   int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>>> -                            uint64_t physical_address)
>>> +                            uint64_t *addresses, uint32_t num_of_addresses)
>>>   {
>>>       /* Memory Error Section Type */
>>>       const uint8_t guid[] =
>>>             UUID_LE(0xA5BC1114, 0x6F64, 0x4EDE, 0xB8, 0x63, 0x3E, 0x83, \
>>>                     0xED, 0x7C, 0x83, 0xB1);
>>> +    /*
>>> +     * invalid fru id: ACPI 4.0: 17.3.2.6.1 Generic Error Data,
>>> +     * Table 17-13 Generic Error Data Entry
>>> +     */
>>> +    QemuUUID fru_id = {};
>>>       Error *errp = NULL;
>>>       int data_length;
>>>       GArray *block;
>>> +    uint32_t block_status, i;
>>>       block = g_array_new(false, true /* clear */, 1);
>>> -    data_length = ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH;
>>> +    data_length = num_of_addresses *
>>> +                  (ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH);
>>
>> Should we check num_of_addresses is in range?
>>
> 
> The check is already done by the following assert().
> 
>     /*
>       * It should not run out of the preallocated memory if adding a new generic
>       * error data entry
>       */
>      assert((data_length + ACPI_GHES_GESB_SIZE) <=
>              ACPI_GHES_MAX_RAW_DATA_LENGTH);
> 

I may have misunderstood your point. We probably need to ensure @num_of_addresses
doesn't overflow the bit fields (Bit#0 - Bit#10), as Igor suggested in another
reply.

Thanks,
Gavin


