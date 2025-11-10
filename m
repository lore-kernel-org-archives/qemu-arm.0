Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3EDCCFA1A
	for <qemu-arm@archiver.kernel.org>; Mon, 10 Nov 2025 23:38:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIbSi-0006h3-QV; Mon, 10 Nov 2025 18:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIbSg-0006Z3-TQ
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 18:38:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIbSe-0001Cv-Op
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 18:38:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762817891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OMfGZ9JUUjIJMPY42nsl9O57la6VHKpSzHEkgK6kXss=;
 b=JtsOP3ZaS7ffCC2zZAkNkWNqgTsbGTm8Ej3BgEhP6ZQIXjfyaIqwbmS84FzItZSlUXZPnM
 JRLiz0JMiLjvPjEeNYr+BESm7hj1n/bM+p8aYoATCWcBciOa18PxqtE6sxoOW0/rz+TmBA
 bWZbiYsUGnryuSl0n/9zZhw2zq4jBcI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-ijI-URXmOGyMVRggy_J8zA-1; Mon, 10 Nov 2025 18:38:09 -0500
X-MC-Unique: ijI-URXmOGyMVRggy_J8zA-1
X-Mimecast-MFC-AGG-ID: ijI-URXmOGyMVRggy_J8zA_1762817889
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-297b35951b7so60359955ad.3
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 15:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762817889; x=1763422689;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OMfGZ9JUUjIJMPY42nsl9O57la6VHKpSzHEkgK6kXss=;
 b=LJIY2N52MnOn/llRLG/DkaJNq/x+Zn/45BTEgHHHhV7Fn1yxM0HKATjkXirm/iTEQ8
 /gmwdlOTOeQn2ZKVwwUejLniHUHTcxPwUS358j3NX+r9J6gBJhc+xSey0KlOhqhYWsl0
 LnjXeyM/vgBrzfKmWXNmtxLfozLgOkobJyr0UzN6K95ROd4thCs0WE5Q7Dz8VrdtPBt8
 UZkDUDQruj6GMgZLbcRfRVFIt6FYWb2Ja9SjjHU+58t43Oc+zNwdTapTxLF0rSFNAm9z
 LzoQ6y2OuqnGXxExnW0K5+Qs/XfgNM3+kIHldtmFOdtk2dfRNg/qTp+qLGpDMNmBjDSm
 EnMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz/dcRj3eLjf8RICgWN8rScg4BGNpjIBQPTSYPumP9mem63HWcuuWdLj8QzyyEoupMLAUb8zWd5w==@nongnu.org
X-Gm-Message-State: AOJu0YzT8PjMupk116i7hVaiDW4RO4MON9P9wBRxx9DOILcRcGJvNpqJ
 5WDg5qZmK132Kcn0Lq4IRCFQQv4tW82PZPM0oEjgdKqpEXKfLYeBZb0Xx31oKA8CWIwXWGENv00
 aejNlJtMrkCasywPHGzRs/UFx/N4OdxEspWJR5IosMNXyesK89RaOkQ==
X-Gm-Gg: ASbGnct4kqQxQ4dCaziyWdjMesxW+LLY4mvVJfz5SzHkPK9E4jtd/08SIZM8UZQ8J3T
 KJ52+UdTkS6xBrskeNpgVSnH+Qqa9qhBIOfbw3RJikAcZ1gN8TIHSwe9Qu8RQbkZgGVOvsC9psg
 TS5wjnpoqA9zm2JtubS3hr7dXZgeNNT16tgT1oeKgagM+yE/sVlF8fp3KzKVKkjV6YDCqYqF9rL
 lDGWvxxBTQiigyM84+k9+16AARWu95xYv0yFiGcjwCGOL1noXAVnlAuQycvsi2E2aESSjLKmgje
 fnUKOF0CdUB+Pty8Hv/vrZli+B0e3NAhObbt5dYth/Uly3aWamkkWQGazkQZr2h+KvtvC77i96O
 cG+/nj571lvBVoP4zKynHLCPpwdDb9+Sbz6r9SxU=
X-Received: by 2002:a17:902:e950:b0:295:c2e8:dabd with SMTP id
 d9443c01a7336-297e5658095mr139238255ad.26.1762817888622; 
 Mon, 10 Nov 2025 15:38:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHr5BSSyD+L9BwPc+iT4bCBSEwgoUH160ZjyP5iJc3IIRx84V4pKWAlO2KetLqY79WgzURItQ==
X-Received: by 2002:a17:902:e950:b0:295:c2e8:dabd with SMTP id
 d9443c01a7336-297e5658095mr139237775ad.26.1762817887878; 
 Mon, 10 Nov 2025 15:38:07 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2965096b8ffsm157920595ad.21.2025.11.10.15.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 15:38:07 -0800 (PST)
Message-ID: <dd43ee6c-6968-4b45-ac35-e9e88bd80629@redhat.com>
Date: Tue, 11 Nov 2025 09:38:01 +1000
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
 <aebd41cc-470d-46b3-85a2-1d8a1c62621d@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <aebd41cc-470d-46b3-85a2-1d8a1c62621d@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bh-5Y1yebCZ1Y0zVlmS7fQarG-YZL7Y3yhVL9__xNlw_1762817889
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

On 11/11/25 12:43 AM, Philippe Mathieu-Daudé wrote:
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
>>   int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>> -                            uint64_t physical_address)
>> +                            uint64_t *addresses, uint32_t num_of_addresses)
>>   {
>>       /* Memory Error Section Type */
>>       const uint8_t guid[] =
>>             UUID_LE(0xA5BC1114, 0x6F64, 0x4EDE, 0xB8, 0x63, 0x3E, 0x83, \
>>                     0xED, 0x7C, 0x83, 0xB1);
>> +    /*
>> +     * invalid fru id: ACPI 4.0: 17.3.2.6.1 Generic Error Data,
>> +     * Table 17-13 Generic Error Data Entry
>> +     */
>> +    QemuUUID fru_id = {};
>>       Error *errp = NULL;
>>       int data_length;
>>       GArray *block;
>> +    uint32_t block_status, i;
>>       block = g_array_new(false, true /* clear */, 1);
>> -    data_length = ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH;
>> +    data_length = num_of_addresses *
>> +                  (ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH);
> 
> Should we check num_of_addresses is in range?
> 

The check is already done by the following assert().

    /*
      * It should not run out of the preallocated memory if adding a new generic
      * error data entry
      */
     assert((data_length + ACPI_GHES_GESB_SIZE) <=
             ACPI_GHES_MAX_RAW_DATA_LENGTH);

Thanks,
Gavin


