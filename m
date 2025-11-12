Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8686BCD342F
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 17:44:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJEsn-0008Hm-R3; Wed, 12 Nov 2025 12:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vJEqN-0004ny-16
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 12:41:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vJEqK-0002Fl-I5
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 12:41:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762969275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q5BID2g4Ux0itV/YP5INGMeHDUmnM90k7s0Z4ua4VjY=;
 b=XYBd+LPyIJwxXgODuMwwZrTi/dbX9I7dmjTgZLFZXJ40mDanBlhzybVEaX9OJc/odTaNHe
 jf8HwBnneHaFch6ScsLUzU5u/ksncfg67mkR41NkkZ8TRpYBdOqBk2wG4fnYxMoVOQrIoM
 YHFil07OSm81s7n/V0gXlH/w9mrVN7g=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-LG4RciUuNOiH5e5D1XsGww-1; Wed, 12 Nov 2025 12:41:14 -0500
X-MC-Unique: LG4RciUuNOiH5e5D1XsGww-1
X-Mimecast-MFC-AGG-ID: LG4RciUuNOiH5e5D1XsGww_1762969273
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-341cd35b0f3so1172315a91.0
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 09:41:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762969273; x=1763574073;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q5BID2g4Ux0itV/YP5INGMeHDUmnM90k7s0Z4ua4VjY=;
 b=VHXP94V0JQZLrFcTjgkQsBnWGGhXofJH07Z2jIiMYZ7ohgG5hRonxbVTZcTDjfXmyK
 MSe77i38UYClBg5NCYkllcaYC2jLg3Tj6KirAsfKOeOLANk0SCRmH0Wux2cTs6OibAh+
 71/nUwf2Wk2yBefwP28f/RlJZGZ6ue2LfCbI7b7M6SGQYp2otebaUG1DB7MYWvCebqVn
 YCKCGB1JtsQWCGxTCIu82/vqA8YDO5cU2hGccKs35aIN2TitwKKcAIZwWKi5JndE2Pih
 q6d75HlmF0PNbNjgVAcHcq7M0yuguuZjssVeoQvGe7GQTL3t/XxsABXN5w4f4rKd4WKv
 Z6wg==
X-Gm-Message-State: AOJu0Yw34DswIWrDILSOR9DKIVlN7Q7OtPnDnMquviayIgaBTZG/XeRw
 3U9wFBa6BzdRURrS24krVoMfn4nSD+QlOolrzE57B6TeKGuzgrDrbgL8Jrh7D1Ml93xCYljuTX5
 BEX7VR+Yxy7lh9D3tmz5eh78vBAqgRfXEryYqZI62B2kA/mOvhGD7XQ==
X-Gm-Gg: ASbGnct35zc6+4JTf3zER/8zQf72oFnGUs91o/yBLLNPVSEIVdLdojvKtOQnCXdNsf/
 hRlh4RTROrSDw72eku6Qln1EHXONZawj5wCh+pbbhU2cRxf7knjf8BDkyyNy6rQJ644CLPD8wBQ
 oHDTAf+R5l/jDbp7pzAyTCz7kE0D4A3jCJpVk9PQ/iQBaGi82QngtFuwIXgGYgetOcehCfl3CR6
 iynO5O5eUQ1jLbYwcKc3ejZOMOfkONvpLsmQ0dvlqMHkRR4j91kv3bK72wbKHHrKRp1cO1ltKek
 63W703MuG2OziWvSEF/5IwK5n/9QtUWU86QfkLd82OHQb88bN3Fm8HLv1+3zQvCyZVPDklbon+8
 Cp/rifyI7AyfsxJUKyJ34VCsNds1MUFcyn1hivoU=
X-Received: by 2002:a17:90b:562c:b0:343:89cc:6f23 with SMTP id
 98e67ed59e1d1-343eacba165mr202044a91.14.1762969273165; 
 Wed, 12 Nov 2025 09:41:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFI1rQsfYV8cSqEvqIVKqykhD1/MtJpAXyaLqrFfKmq7jNBv0vTUJM4AlqkZ+dXLPg01GJ7Pg==
X-Received: by 2002:a17:90b:562c:b0:343:89cc:6f23 with SMTP id
 98e67ed59e1d1-343eacba165mr202023a91.14.1762969272799; 
 Wed, 12 Nov 2025 09:41:12 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-343eac7ec56sm48384a91.10.2025.11.12.09.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 09:41:12 -0800 (PST)
Message-ID: <54de65b4-6ba3-474a-b9b2-e128cfc9f2ef@redhat.com>
Date: Thu, 13 Nov 2025 03:41:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] acpi/ghes: Increase GHES raw data maximal length
 to 4KiB
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 mchehab+huawei@kernel.org, gengdongjiu1@gmail.com, mst@redhat.com,
 anisinha@redhat.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 shan.gavin@gmail.com
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-3-gshan@redhat.com> <20251110151107.5e825ea0@fedora>
 <de9e6c46-6682-488e-bb50-9ce43ffaaa8e@redhat.com>
 <20251112133217.41cc6df8@fedora>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251112133217.41cc6df8@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vgKpDskkqwMdQSm4y5WgSakuzxUANobSbgbLzl2nzq0_1762969273
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

On 11/12/25 10:32 PM, Igor Mammedov wrote:
> On Tue, 11 Nov 2025 14:05:23 +1000
> Gavin Shan <gshan@redhat.com> wrote:
>> On 11/11/25 12:11 AM, Igor Mammedov wrote:
>>> On Wed,  5 Nov 2025 21:44:47 +1000
>>> Gavin Shan <gshan@redhat.com> wrote:
>>>    
>>>> The current GHES raw data maximal length isn't enough for 16 consecutive
>>>> CPER errors, which will be sent to a guest with 4KiB page size on a
>>>> erroneous 64KiB host page. Note those 16 CPER errors will be contained
>>>> in one single error block, meaning all CPER errors should be identical
>>>> in terms of type and severity and all of them should be delivered in
>>>> one shot.
>>>>
>>>> Increase GHES raw data maximal length from 1KiB to 4KiB so that the
>>>> error block has enough storage space for 16 consecutive CPER errors.
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>    docs/specs/acpi_hest_ghes.rst | 2 +-
>>>>    hw/acpi/ghes.c                | 2 +-
>>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
>>>> index aaf7b1ad11..acf31d6eeb 100644
>>>> --- a/docs/specs/acpi_hest_ghes.rst
>>>> +++ b/docs/specs/acpi_hest_ghes.rst
>>>> @@ -68,7 +68,7 @@ Design Details
>>>>        and N Read Ack Register entries. The size for each entry is 8-byte.
>>>>        The Error Status Data Block table contains N Error Status Data Block
>>>>        entries. The size for each entry is defined at the source code as
>>>> -    ACPI_GHES_MAX_RAW_DATA_LENGTH (currently 1024 bytes). The total size
>>>> +    ACPI_GHES_MAX_RAW_DATA_LENGTH (currently 4096 bytes). The total size
>>>
>>> is it safe to bump without compat glue?
>>>
>>> consider VM migrated from old QEMU to new one,
>>> it will have  etc/hardware_errors allocated with 1K GESB,
>>> and more importantly error_block_addressN will have 1K offsets as well
>>>
>>> however with ACPI_GHES_MAX_RAW_DATA_LENGTH all length checks will
>>> let >1K blocks to be written into into 1K 'formated' etc/hardware_errors.
>>>
>>> Thanks to previous refactoring we get all addresses right (1K version),
>>> but if you write large GESB there it will either overlap with the next GESB
>>> or a smaller GESB might overwrite tail of preceding large one.
>>> And in works case it's OOB when writing large GESB in the last block.
>>>
>>> Given we have to write GESB successfully or abort, there is no point
>>> in adding compat knobs. But we still need to check if GEBS will fit into
>>> whatever block size etc/hardware_errors inside guest RAM is laid out originally.
>>>    
>>
>> Good point. You're right that we're not safe for migration from old QEMU to
>> and new QEMU. So I think I need to bump vmstate_hest_state::minimum_version_id
>> in generic_event_device.c ?
> 
> that won't help,
> what would help is creating compat property (in the owner of GHES MMIO registers),
> and lower limits (to former value) for older machine types.
> That way sizes would match even if you do ping pong migration
> between old qemu and new one, since one would still be using old machine type
> for that.
> 

In v4, a compat property 'x-error-block-size' has been added, as the fence
between QEMU 10.1 and 10.2 (1KiB vs 4KiB GHES error block size).

https://lists.nongnu.org/archive/html/qemu-arm/2025-11/msg00534.html

>>
>>
>>>>        for the "etc/hardware_errors" fw_cfg blob is
>>>>        (N * 8 * 2 + N * ACPI_GHES_MAX_RAW_DATA_LENGTH) bytes.
>>>>        N is the number of the kinds of hardware error sources.
>>>> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
>>>> index 06555905ce..a9c08e73c0 100644
>>>> --- a/hw/acpi/ghes.c
>>>> +++ b/hw/acpi/ghes.c
>>>> @@ -33,7 +33,7 @@
>>>>    #define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
>>>>    
>>>>    /* The max size in bytes for one error block */
>>>> -#define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
>>>> +#define ACPI_GHES_MAX_RAW_DATA_LENGTH   (4 * KiB)
>>>>    
>>>>    /* Generic Hardware Error Source version 2 */
>>>>    #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
>>

Thanks,
Gavin


