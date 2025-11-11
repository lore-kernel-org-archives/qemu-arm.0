Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD6CCCFA18
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 04:11:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIfiR-00033S-G8; Mon, 10 Nov 2025 23:10:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIfgD-0001Zn-K0
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 23:08:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIfg9-0000LP-VC
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 23:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762834102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uohHNH9wZFBBqRf+7H5zTRW9WT7sd4c/Jhauiiq23sg=;
 b=gTtJNKArxdcZKM6FMbBNqR20bpdUTcUX6wRgEDHi0YeSILoj28NsNia4WDn1fsGfqmIaHu
 GHkRcPstXPpYxv9uV2y2NBSpvBoWre7d0IpYUz8pT3iWf9tDm6UMwAvNErAfa6t1zFpbAS
 iJwxOWAsT9dgPAJ/y7Q/rYqNi8hNGoU=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-yqzK5lB0PAey3BBVyb750Q-1; Mon, 10 Nov 2025 23:08:20 -0500
X-MC-Unique: yqzK5lB0PAey3BBVyb750Q-1
X-Mimecast-MFC-AGG-ID: yqzK5lB0PAey3BBVyb750Q_1762834099
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b6097ca315bso8751060a12.3
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 20:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762834099; x=1763438899;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uohHNH9wZFBBqRf+7H5zTRW9WT7sd4c/Jhauiiq23sg=;
 b=uBbwU+oQgGXUQ4vofQXcuRKIzjiFzWu2u2WmreX2xnUHXd6ZnJdDLER/DNRRjugLxQ
 SkbJ1BuDOnR+uvnLMYkGpNPjNDm4+3p4OlbFVe1s0QUD4IrfzOAQCyvbLBE+Am8XN70S
 SgvU1WgoBs9wlfYAP2dUKK4FecUHBmvL7EKi3X24SeyYjcD47BLoDaOG5QC1ldYCqr3T
 fiCye29cSvjegmBfZE1rHbt88s6Gx/XaTqE8Az6S8A0E+TbNcukxDvelGOE4bjp06ixU
 hteSJfTM4jZlMzdH0TN5AA3ps4cstxUjcK1R1kaX06F+zKx/TRVxEgLnW85CgYC+g8cl
 EOjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUvF+IH3jMrpSEH4uD5Mza6jXW7o+v5/v7euAuP2z+9jzFdD16sscZ+w3R/ulYEmPhNxovt6aI8w==@nongnu.org
X-Gm-Message-State: AOJu0YzR0KNH7TrEiXKWa6DiqMRgQAJm/uOu4tnxkkjR/LZZoV+fNsdV
 gPktJ6xT8JC9hq+BqPrkuHgZ6hP2bIe8UZW3SZc6MEHQ/9jfNQV3CnqT012Y5xiqHI3CcXN23Sh
 hyzianv+UmBtOXJjqwaFw4GUBNvPV4250gaJez6l7supue5K9IE/fiw==
X-Gm-Gg: ASbGncvd0uApDbqsfYbErkidASFLRIN3SLGje/2mmE/WvLzZreBn2Hg2rZnfnwHWn94
 M0gdhcDHDv8Y9o0NezSdj3dX0SPJwqRoKW1hT3VVhiPmRmGynFiWaGUIpEdwg03uYMLWzWIqgCE
 Xmi3Edkdfg+HVW4FFFIOeIt990svNQd15Pn1lC1Owc1rl+OIzRoKMGBTcxmof1TySz2YTSTUH8W
 8y+5p+dIu7N+dx5FRT1QFvrqDbLPTmT2Rmqeoe9jca7cg2D6Li7GmUmcdR+NCPbbB7EsuA34wr8
 d2qHq+BxJRsjTMN8HdVO8XpxEoMF7ZoL2pmt5rxUG7PZLGJrS8Yuq7Qy/uPQtmqOoAbS2XBfIbf
 BW98JguHy0SEH7TklXRbwkaG7X+RaoSjmQed8dwM=
X-Received: by 2002:a17:902:cf04:b0:296:5e6b:e1c8 with SMTP id
 d9443c01a7336-297e5606ec8mr138440795ad.13.1762834099435; 
 Mon, 10 Nov 2025 20:08:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGn/X6BKBS+OlMyI2SeRFVV2xfbY+0yelul7zDFlP3b/x9cTC0IGUu3UKpj39I5VTDbW6LPJg==
X-Received: by 2002:a17:902:cf04:b0:296:5e6b:e1c8 with SMTP id
 d9443c01a7336-297e5606ec8mr138440515ad.13.1762834099008; 
 Mon, 10 Nov 2025 20:08:19 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29650c5eb35sm163336385ad.38.2025.11.10.20.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 20:08:18 -0800 (PST)
Message-ID: <cad74549-a313-48b6-8260-f23f6be1e8c8@redhat.com>
Date: Tue, 11 Nov 2025 14:08:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] acpi/ghes: Extend acpi_ghes_memory_errors() to
 support multiple CPERs
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>, shan.gavin@gmail.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, mchehab+huawei@kernel.org,
 gengdongjiu1@gmail.com, mst@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, pbonzini@redhat.com
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-5-gshan@redhat.com>
 <20251105141455.000052f0@huawei.com>
 <cc07dfc9-f58a-4654-8854-c16a2e85fecd@redhat.com>
 <20251110154957.5c481df7@fedora>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251110154957.5c481df7@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gNMBb8n8yzGHgHCmDL2g9TKgt6PQThBZU4VjRbXItuk_1762834099
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

Hi Igor and Jonathan,

On 11/11/25 12:49 AM, Igor Mammedov wrote:
> On Thu, 6 Nov 2025 13:15:52 +1000
> Gavin Shan <gshan@redhat.com> wrote:
>> On 11/6/25 12:14 AM, Jonathan Cameron wrote:
>>> On Wed,  5 Nov 2025 21:44:49 +1000
>>> Gavin Shan <gshan@redhat.com> wrote:
>>>    
>>>> In the situation where host and guest has 64KiB and 4KiB page sizes,
>>>> one problematic host page affects 16 guest pages. we need to send 16
>>>> consective errors in this specific case.
>>>>
>>>> Extend acpi_ghes_memory_errors() to support multiple CPERs after the
>>>> hunk of code to generate the GHES error status is pulled out from
>>>> ghes_gen_err_data_uncorrectable_recoverable(). The status field of
>>>> generic error status block is also updated accordingly if multiple
>>>> error data entries are contained in the generic error status block.
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> Hi Gavin,
>>>
>>> Mostly fine, but a few comments on the defines added and a
>>> question on what the multiple things are meant to mean?
>>>    
>>
>> Thanks for your review and comments, replies as below.
>>
>>>> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
>>>> index a9c08e73c0..527b85c8d8 100644
>>>> --- a/hw/acpi/ghes.c
>>>> +++ b/hw/acpi/ghes.c
>>>> @@ -57,8 +57,12 @@
>>>>    /* The memory section CPER size, UEFI 2.6: N.2.5 Memory Error Section */
>>>>    #define ACPI_GHES_MEM_CPER_LENGTH           80
>>>>    
>>>> -/* Masks for block_status flags */
>>>> -#define ACPI_GEBS_UNCORRECTABLE         1
>>>> +/* Bits for block_status flags */
>>>> +#define ACPI_GEBS_UNCORRECTABLE           0
>>>> +#define ACPI_GEBS_CORRECTABLE             1
>>>> +#define ACPI_GEBS_MULTIPLE_UNCORRECTABLE  2
>>>> +#define ACPI_GEBS_MULTIPLE_CORRECTABLE    3
>>>
>>> So this maps to the bits in block status.
>>>
>>> I'm not actually sure what these multiple variants are meant to tell us.
>>> The multiple error blocks example referred to by the spec is a way to represent
>>> the same error applying to multiple places.  So that's one error, many blocks.
>>> I have no idea if we set these bits in that case.
>>>
>>> Based on a quick look I don't think linux even takes any notice.  THere
>>> are defines in actbl1.h but I'm not seeing any use made of them.
>>>    
>>
>> I hope Igor can confirm since it was suggested by him.
>>
>> It's hard to understand how exactly these multiple variants are used from the
>> spec. In ACPI 6.5 Table 18.11, it's explained as below.
>>
>> Bit [2] - Multiple Uncorrectable Errors: If set to one, indicates that more
>> than one uncorrectable errors have been detected.
>>
>> I don't see those multiple variants have been used by Linux. So I think it's
>> safe to drop them.
> 
> even though example describes 'same' error at different components,
> the bit fields descriptions doesn't set any limits on what 'more than one' means.
> 
> Also from guest POV it's multiple different pages that we are reporting here
> as multiple CPERs.
> It seems to me that setting *_MULTIPLE_* here is correct thing to do.
> 

I don't have strong opinions. Lets keep to set _MULTIPLE_ flag if Jonathan
is fine. Again, this field isn't used by Linux guest.

>>>> +#define ACPI_GEBS_ERROR_DATA_ENTRIES      4
>>>
>>> This is bits 4-13 and the define isn't used. I'd drop it.
>>>    
>>
>> The definition is used in acpi_ghes_memory_errors() of this patch. However,
>> I don't see it has been used by Linux. This field isn't used by Linux to determine
>> the total number of error entries. So I think I can drop it either if Igor is ok.
>>

Lets keep this field either in next revision if Jonathan is fine.

Thanks,
Gavin



