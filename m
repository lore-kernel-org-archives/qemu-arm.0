Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B96CCFA18
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 04:08:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIffh-0001Me-2p; Mon, 10 Nov 2025 23:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIfdf-0008Sj-TI
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 23:05:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIfdY-0000Bb-Lw
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 23:05:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762833932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kivIOnHysFG4OgTJ+JkyZMHRr+S7I5hTrCMBmeW+m48=;
 b=AmyRcEQk6+sTjg/kyLyY1IosshBmtI48C3I39edxGhqjpqwrK6CxTFgeQbHh2uM7RdsrQG
 frCP/8fdV7vP/3YyDVjuFfjWNmPee37wXhbZX0hzdnTiDA7XUzjyQvESZRcp+WGOrSLOO0
 Aq0SXykbPgHVABIDmp/Oq2uX1g2GoYE=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-IOuvT9gDPrqRAYYE70Kqsg-1; Mon, 10 Nov 2025 23:05:30 -0500
X-MC-Unique: IOuvT9gDPrqRAYYE70Kqsg-1
X-Mimecast-MFC-AGG-ID: IOuvT9gDPrqRAYYE70Kqsg_1762833930
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2954d676f9dso33250325ad.0
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 20:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762833930; x=1763438730;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kivIOnHysFG4OgTJ+JkyZMHRr+S7I5hTrCMBmeW+m48=;
 b=m0kTzG12PIuQMJZUoSfOo3zQxyxVrygHdAfTft2/Dl60xtFYM06aqzi+KRxatQUxc3
 KmCeH4r7MoY3wGZCeFgHNnaG7d9fn7B0qOpMsexc2OvFzX8+I7W6aAIJR8VrMxG9276C
 C+h42K2Cq+dW4sS+QaVD4IKuIuGUkJfgdlM1N8VdJR0kQbt1PNN9Bg/TjjZFDZUKDSQb
 Q4zZaY6JgDmO9wUccg8qSQ/skwnuf6+QiJVmmY4QasyP/gD+kOlRkzvcSWZoDxU5yNIi
 IAx6ycOa3B39LhxIPMsG7ov/CRgE0GcRdS2X/xvE/mxOctZpLNVcfoAbtjNLOXh4IRUc
 UtGw==
X-Gm-Message-State: AOJu0Yx2ZIe/bjSR1EzqZE6dF93uSRdGjxQii5enb+kQuTvbCJM79DHH
 rAP83hHarYoRbCJThsyea4aZ+DzTDQp/K6/3wPvAUwjFadS5d0VU5xBYp9KAr3iO2+xz44oUXBu
 uo+xnX0K7hGo96Cby6wp8Jag3ZC/nAY+aVK65iMq3gq4jB1a1Xkxdcg==
X-Gm-Gg: ASbGncv0ClDZFI/fw6KxoWl9GWgkC1VvhOayz8K59gf7auGKI4eWcTRUdDzrH4S1fL5
 Q29u5QxS+i9OPMOyIFUc0DOrkBRD+bptUCB71mud7NeLWQpdKGQCHhAPBQvntP211xYgeQWjYCq
 +o/xkB7Szv5+W58AeauAiKqwYQF+huSKsby4k7wU2KicMXgNz3tawAMX5ha2qAsPKmylSTvovWX
 EduPyIg1XxJooHGYKJFsZE1u/yNeEbOOr1g0PLdNUx49oYdIVj5/UYXEjg0wArnOFTCLoy+yVP7
 yGcR2Q73Vp45daT517jdT/FxKR575DZwSmGnYfofEgEG0+5ycJql3BZveVEEdj3OUA6JuxqHRBD
 vhRH33kSEZgu5HGhjX8gb9DKzx6IsZUiq/wf+51k=
X-Received: by 2002:a17:903:1a2e:b0:295:9c48:96c0 with SMTP id
 d9443c01a7336-297e53f905bmr135697755ad.5.1762833929819; 
 Mon, 10 Nov 2025 20:05:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHI4rF6RIz9KL4kS+jQI+eUj67Ht6CvKkw8HvBSz/gtXCeF7R+i2Rgve0vpkgf14rmb+la57A==
X-Received: by 2002:a17:903:1a2e:b0:295:9c48:96c0 with SMTP id
 d9443c01a7336-297e53f905bmr135697445ad.5.1762833929467; 
 Mon, 10 Nov 2025 20:05:29 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2981185e3a0sm60642025ad.45.2025.11.10.20.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 20:05:28 -0800 (PST)
Message-ID: <de9e6c46-6682-488e-bb50-9ce43ffaaa8e@redhat.com>
Date: Tue, 11 Nov 2025 14:05:23 +1000
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
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251110151107.5e825ea0@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NR4nZ0r-Db-QHBROZHVwW0goUfSL24qY1DG83WOz81Q_1762833930
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

On 11/11/25 12:11 AM, Igor Mammedov wrote:
> On Wed,  5 Nov 2025 21:44:47 +1000
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> The current GHES raw data maximal length isn't enough for 16 consecutive
>> CPER errors, which will be sent to a guest with 4KiB page size on a
>> erroneous 64KiB host page. Note those 16 CPER errors will be contained
>> in one single error block, meaning all CPER errors should be identical
>> in terms of type and severity and all of them should be delivered in
>> one shot.
>>
>> Increase GHES raw data maximal length from 1KiB to 4KiB so that the
>> error block has enough storage space for 16 consecutive CPER errors.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   docs/specs/acpi_hest_ghes.rst | 2 +-
>>   hw/acpi/ghes.c                | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
>> index aaf7b1ad11..acf31d6eeb 100644
>> --- a/docs/specs/acpi_hest_ghes.rst
>> +++ b/docs/specs/acpi_hest_ghes.rst
>> @@ -68,7 +68,7 @@ Design Details
>>       and N Read Ack Register entries. The size for each entry is 8-byte.
>>       The Error Status Data Block table contains N Error Status Data Block
>>       entries. The size for each entry is defined at the source code as
>> -    ACPI_GHES_MAX_RAW_DATA_LENGTH (currently 1024 bytes). The total size
>> +    ACPI_GHES_MAX_RAW_DATA_LENGTH (currently 4096 bytes). The total size
> 
> is it safe to bump without compat glue?
> 
> consider VM migrated from old QEMU to new one,
> it will have  etc/hardware_errors allocated with 1K GESB,
> and more importantly error_block_addressN will have 1K offsets as well
> 
> however with ACPI_GHES_MAX_RAW_DATA_LENGTH all length checks will
> let >1K blocks to be written into into 1K 'formated' etc/hardware_errors.
> 
> Thanks to previous refactoring we get all addresses right (1K version),
> but if you write large GESB there it will either overlap with the next GESB
> or a smaller GESB might overwrite tail of preceding large one.
> And in works case it's OOB when writing large GESB in the last block.
> 
> Given we have to write GESB successfully or abort, there is no point
> in adding compat knobs. But we still need to check if GEBS will fit into
> whatever block size etc/hardware_errors inside guest RAM is laid out originally.
> 

Good point. You're right that we're not safe for migration from old QEMU to
and new QEMU. So I think I need to bump vmstate_hest_state::minimum_version_id
in generic_event_device.c ?


>>       for the "etc/hardware_errors" fw_cfg blob is
>>       (N * 8 * 2 + N * ACPI_GHES_MAX_RAW_DATA_LENGTH) bytes.
>>       N is the number of the kinds of hardware error sources.
>> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
>> index 06555905ce..a9c08e73c0 100644
>> --- a/hw/acpi/ghes.c
>> +++ b/hw/acpi/ghes.c
>> @@ -33,7 +33,7 @@
>>   #define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
>>   
>>   /* The max size in bytes for one error block */
>> -#define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
>> +#define ACPI_GHES_MAX_RAW_DATA_LENGTH   (4 * KiB)
>>   
>>   /* Generic Hardware Error Source version 2 */
>>   #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10

Thanks,
Gavin


