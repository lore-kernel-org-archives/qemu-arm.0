Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43536CCFA0D
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Nov 2025 03:16:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGqTp-0003t4-9p; Wed, 05 Nov 2025 22:16:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vGqTn-0003sc-R7
 for qemu-arm@nongnu.org; Wed, 05 Nov 2025 22:16:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vGqTl-00035V-9C
 for qemu-arm@nongnu.org; Wed, 05 Nov 2025 22:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762398962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dc+EgfG+CEzokJ22MK58FUPyJQ3TfKNKbmBl+mINl6U=;
 b=JzZZE2MJCRzC1Te2BiIm6OozmPr0UiktcE91BKM1dlZf5sF545sSktUUwtIJma6JqIbs/0
 sVY++QHpfRZcP1aMyUWNG+sJB+KNvM/CTyNRn6oeyTlpAo/yz2RALOTCrsUWPliJM12bf0
 8Hg5BeR68O9Ym76mXhhyNwbzQLqKTL4=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-y2FAvmLqOWSr0ZqvuLztgQ-1; Wed, 05 Nov 2025 22:16:01 -0500
X-MC-Unique: y2FAvmLqOWSr0ZqvuLztgQ-1
X-Mimecast-MFC-AGG-ID: y2FAvmLqOWSr0ZqvuLztgQ_1762398960
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-29598910dd2so14762425ad.1
 for <qemu-arm@nongnu.org>; Wed, 05 Nov 2025 19:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762398960; x=1763003760;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dc+EgfG+CEzokJ22MK58FUPyJQ3TfKNKbmBl+mINl6U=;
 b=v+e1YvHfOnXpzBrVFF3VNC0OagSO1At74d8J3bQYj1Hhz/KiFqA8BrSWjjJ5LRAvw4
 Ao1uYvohFCDanBVTyrMXiGK/llmuVLSTLNih2BIG9wfoWS8bfCpks5DVJJf/0QwdrFoz
 qIyjXFKJ2AJpvwtLcwz9QeC95FJ4N4C1FjcOytD6b513Ayy2yPpJvpWWQpvSg93v0xYA
 6Qv6dDB4s+1pxNcz9p7x9NGMSXa0UOkVJWwwAn8ZW/AxHFDqv7mOx3zKaME1oAHTu11h
 xwpD+E2ZDoj311dggBJCM4jXn/M3PJUvEoCxLI3MX05FkXAJG3XoobtlwAjDFUoyNvKW
 cGaA==
X-Gm-Message-State: AOJu0Ywg3a/RAMKKM5asfqEQwNmDpUf/ut+267b3SFMtfNhf+0u1woX0
 1WvsFB49X08EqXDEDC1G42Hr4BqsEljSfqxWVDEqqpYDO+XJMTbN0vGCySY6Pc4G5jnLZRy8h1j
 JwmoxDNrzLhwrW8M/WNwNLdkU+dNigSddMqRlB168txJpNkPodTud/A==
X-Gm-Gg: ASbGncvzKSaORPrV3N3vR1jzVH+jnFHkZUMdiR8uD9KqQl1IyzjcRDGzS6bcsDsoFqB
 pcOXJ/ri72tZt3uqsCzOd6rQVWZaumS0HUpyy1K6mScsvKs2aCADPF1XsCQ7MiVHSKev2U10ysz
 7jo9ZZpOoukOg5AMDKx3Yg9QvJ6o793agUAaDxhMhgYA/s2Onj50Htr4GR+s1j4Aw1eoDHKAmDH
 8SCLGRw+zP6Gf3Bm4su60ohc1JkwZjro2RNQ3SDiMqeslOcV8Qmtv6ekoX9i4ayJ3UKEfiHyXfM
 +zD69sZFFi2ILePoKJzC+Mn/hkG6Ti4mkz22gE/7Y92SdCbZVdfKw/TghCxxg5Qjpnh9cqzQ6un
 gcOky9jpoxp5D6Hu8sCPtbcNHfgYwVj1mPmHnCdo=
X-Received: by 2002:a17:903:350c:b0:295:94fe:d5dc with SMTP id
 d9443c01a7336-2962ad0c67bmr78049945ad.2.1762398959890; 
 Wed, 05 Nov 2025 19:15:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrHJjnnAxVxaVyJREL6rViJyXgqF0UXgZTx6h+0BQpLA15hAYDTMPKoK0bZ+j7MLeXOOquXA==
X-Received: by 2002:a17:903:350c:b0:295:94fe:d5dc with SMTP id
 d9443c01a7336-2962ad0c67bmr78049615ad.2.1762398959479; 
 Wed, 05 Nov 2025 19:15:59 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651c6f201sm10240195ad.55.2025.11.05.19.15.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 19:15:58 -0800 (PST)
Message-ID: <cc07dfc9-f58a-4654-8854-c16a2e85fecd@redhat.com>
Date: Thu, 6 Nov 2025 13:15:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] acpi/ghes: Extend acpi_ghes_memory_errors() to
 support multiple CPERs
To: Jonathan Cameron <jonathan.cameron@huawei.com>, shan.gavin@gmail.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mchehab+huawei@kernel.org,
 gengdongjiu1@gmail.com, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, peter.maydell@linaro.org, pbonzini@redhat.com
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-5-gshan@redhat.com>
 <20251105141455.000052f0@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251105141455.000052f0@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7ktbBWz8DOlJ21HTJUj8Xwn8OmER0E_upBTuFjW43MU_1762398960
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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

Hi Jonathan and Igor,

On 11/6/25 12:14 AM, Jonathan Cameron wrote:
> On Wed,  5 Nov 2025 21:44:49 +1000
> Gavin Shan <gshan@redhat.com> wrote:
> 
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
> Hi Gavin,
> 
> Mostly fine, but a few comments on the defines added and a
> question on what the multiple things are meant to mean?
> 

Thanks for your review and comments, replies as below.

>> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
>> index a9c08e73c0..527b85c8d8 100644
>> --- a/hw/acpi/ghes.c
>> +++ b/hw/acpi/ghes.c
>> @@ -57,8 +57,12 @@
>>   /* The memory section CPER size, UEFI 2.6: N.2.5 Memory Error Section */
>>   #define ACPI_GHES_MEM_CPER_LENGTH           80
>>   
>> -/* Masks for block_status flags */
>> -#define ACPI_GEBS_UNCORRECTABLE         1
>> +/* Bits for block_status flags */
>> +#define ACPI_GEBS_UNCORRECTABLE           0
>> +#define ACPI_GEBS_CORRECTABLE             1
>> +#define ACPI_GEBS_MULTIPLE_UNCORRECTABLE  2
>> +#define ACPI_GEBS_MULTIPLE_CORRECTABLE    3
> 
> So this maps to the bits in block status.
> 
> I'm not actually sure what these multiple variants are meant to tell us.
> The multiple error blocks example referred to by the spec is a way to represent
> the same error applying to multiple places.  So that's one error, many blocks.
> I have no idea if we set these bits in that case.
> 
> Based on a quick look I don't think linux even takes any notice.  THere
> are defines in actbl1.h but I'm not seeing any use made of them.
> 

I hope Igor can confirm since it was suggested by him.

It's hard to understand how exactly these multiple variants are used from the
spec. In ACPI 6.5 Table 18.11, it's explained as below.

Bit [2] - Multiple Uncorrectable Errors: If set to one, indicates that more
than one uncorrectable errors have been detected.

I don't see those multiple variants have been used by Linux. So I think it's
safe to drop them.

>> +#define ACPI_GEBS_ERROR_DATA_ENTRIES      4
> 
> This is bits 4-13 and the define isn't used. I'd drop it.
> 

The definition is used in acpi_ghes_memory_errors() of this patch. However,
I don't see it has been used by Linux. This field isn't used by Linux to determine
the total number of error entries. So I think I can drop it either if Igor is ok.

Thanks,
Gavin




