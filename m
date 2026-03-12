Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F088BFED2F0
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Mar 2026 08:52:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0bmD-0000p7-W4; Thu, 12 Mar 2026 04:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0bmB-0000o8-4y
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 04:52:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0bm8-00040k-Ja
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 04:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773305531;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wE9sPJoS+PvsawByzPBkkoM8UixyCC0LDr4EX6fyKOg=;
 b=XJ6uOc5HuEGt0sCr0ZyiTz8IWGg6iv0sbuAzsvF7SZo21Rdi24045zP12i7y1f7Gpt3yt6
 l3s0KKZI+F3N8nucX8HbnNoalXz5mA+yQc5ldX+Z/HO7nlEiuaUHwSy7wps3NsfR93myhR
 kZp2hKdANFKCumlXTIKt9OWNL3W96oY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-qkg55lUOM_WIwbURcx9sng-1; Thu, 12 Mar 2026 04:52:10 -0400
X-MC-Unique: qkg55lUOM_WIwbURcx9sng-1
X-Mimecast-MFC-AGG-ID: qkg55lUOM_WIwbURcx9sng_1773305529
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-439c794ec8eso900641f8f.1
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2026 01:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773305529; x=1773910329;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wE9sPJoS+PvsawByzPBkkoM8UixyCC0LDr4EX6fyKOg=;
 b=vbNSJAeO5m+ak03whIKHjJRtOMxky9BNzfN2/5gNQjWo7Fuw9M3ju+ywNWhVMPxkig
 O2XUW0gmXI8o19KgjjB/jHce+i2TUcrOHnmfOVodgG+O3s0n5uJlfkZIWKnwzzoALYAn
 DN3NOatbOCXxa9Wg5ixBUbUWJWVWV3egzX5eoGVpbbTFGkkmNdOslHhaAi8m3gbgR5P4
 MIH8l+T9trMA5kE9/q2jTIewXFMkLMFJUVl7Tp3Y2T9WVuA0+YeoV+5XfW22dh38Izz+
 FRgXkD1c9hyYB8JuaKfbm1djzIn93EQnhFaGhtIf4y7XiYr+3DmbksVhRbp7eY9NBMh1
 AGeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq9x5UI1JLW9WkvcZyUGycfTwNTJgS0D67hMspI4QO5rEVbC+cQO3z0R19XLZMk+qYMGQ+9iUMKQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy+3r82SrBHqhqqfST1sH9jFCz6Rs1gBw9RNhVkLolge/Odl6mk
 +XbEcOJGIyuQoALDOg0xpgUNUVy4y05HkKa5vcWyYoXC+g7CyXun9zAEvkuQhrlqVthzN7vbKvp
 HAtRXbm6kP6Zue7C7fNYA0r7LKO13IdM6rxUuD4EOQnuTS4EYS+z+Vw==
X-Gm-Gg: ATEYQzyJ712IC/eW9Z4onxu6yfxhXl/gb+liaO/2aOmFTN92aDLNegJ7hkBJnFCMgL7
 kmH3DHnVQ3l/inSuuWYdpr0h56SUwyXJdP02gbLHCLDK0dtrFSw8pW5aC598npfOwvxTBiDnikn
 mnlHGenSezugO0okP5y65Fx5tQ85CzU2iWDyybpjyRBpdSpcX3dT73vqWQLw7l90lsUx3TKVypg
 4zLb3JIMBqLcZInp39oY0f6brkc+9nDgnyAxHjZjDvrfQ9qm62VYUvg1Er9+sN80hCPqQQn0X5+
 s7R55AZVCC6nANpSQv5wWmTz25E1B2evSMNzJuBqKNxKvREZfKDenkvFyq0jUjq7iNQzjVnPIaJ
 7I9XPqQCl5l4L9bCfBzeY7vnr58fe7EwcM820wxDcJRWoRz2I2EArx3MTWAI27D574VIzDg==
X-Received: by 2002:a05:6000:2883:b0:439:c661:3232 with SMTP id
 ffacd0b85a97d-439f8200e1fmr10237769f8f.20.1773305529142; 
 Thu, 12 Mar 2026 01:52:09 -0700 (PDT)
X-Received: by 2002:a05:6000:2883:b0:439:c661:3232 with SMTP id
 ffacd0b85a97d-439f8200e1fmr10237535f8f.20.1773305526661; 
 Thu, 12 Mar 2026 01:52:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe1aa2c3sm4965309f8f.13.2026.03.12.01.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 01:52:06 -0700 (PDT)
Message-ID: <dc138268-2f96-4a64-9132-6b375fc53514@redhat.com>
Date: Thu, 12 Mar 2026 09:52:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/8] hw/arm/smmuv3-accel: Introduce _AUTO support for
 ATS
To: Markus Armbruster <armbru@redhat.com>
Cc: Nathan Chen <nathanc@nvidia.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Yi Liu <yi.l.liu@intel.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20260309192119.870186-1-nathanc@nvidia.com>
 <20260309192119.870186-3-nathanc@nvidia.com> <87pl5cnp06.fsf@pond.sub.org>
 <98e7dd71-6669-4a82-bec8-f1dae2d861c3@redhat.com>
 <0bdcf7d7-136e-42f4-9fa9-d31f6ae6e19f@nvidia.com>
 <fd34b7a2-65ac-486f-bc17-23dd4f96a3df@redhat.com>
 <87o6ktxwzn.fsf@pond.sub.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <87o6ktxwzn.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0LztW1BUFdqjXMz2LOu2Y4bQpIrcFUjLuK5W8o9Ye9I_1773305529
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 3/12/26 9:39 AM, Markus Armbruster wrote:
> Eric Auger <eric.auger@redhat.com> writes:
>
>> On 3/11/26 6:08 PM, Nathan Chen wrote:
>>>
>>> On 3/11/2026 8:31 AM, Eric Auger wrote:
>>>> On 3/10/26 8:05 AM, Markus Armbruster wrote:
>>>>> Nathan Chen<nathanc@nvidia.com> writes:
>>>>>
>>>>>> From: Nathan Chen<nathanc@nvidia.com>
>>>>>>
>>>>>> Allow accelerated SMMUv3 Address Translation Services support property
>>>>>> to be derived from host IOMMU capabilities. Derive host values using
>>>>>> IOMMU_GET_HW_INFO, retrieving ATS capability from IDR0.
>>>>>>
>>>>>> Set the default value of ATS to auto. The default for ATS support used
>>>>>> to be set to off, but we change it to match what the host IOMMU
>>>>>> properties report.
>>>>>>
>>>>>> Add a "ats-enabled" read-only property for smmuv3 to address an
>>>>>> expected bool for the "ats" property in iort_smmuv3_devices().
>>>>>>
>>>>>> Signed-off-by: Nathan Chen<nathanc@nvidia.com>
> [...]
>
>>>>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>>>>> index 068108e49b..197ba7c77b 100644
>>>>>> --- a/hw/arm/smmuv3.c
>>>>>> +++ b/hw/arm/smmuv3.c
> [...]
>
>>>>>> @@ -2128,7 +2134,7 @@ static const Property smmuv3_properties[] = {
>>>>>>      DEFINE_PROP_UINT64("msi-gpa", SMMUv3State, msi_gpa, 0),
>>>>>>      /* RIL can be turned off for accel cases */
>>>>>>      DEFINE_PROP_BOOL("ril", SMMUv3State, ril, true),
>>>>>> -    DEFINE_PROP_BOOL("ats", SMMUv3State, ats, false),
>>>>>> +    DEFINE_PROP_ON_OFF_AUTO("ats", SMMUv3State, ats, ON_OFF_AUTO_AUTO),
>>>>> Is property "ats" accessible via QMP or JSON command line?  If yes,
>>>>> this
>>>>> is an incompatible change: JSON values false and true no longer work.
>>>> So what do you recommend to extend the property values. I guess we had
>>>> some existing scenarios happening in the past. What is the best way to
>>>> proceed?
>>> Is it a requirement to ensure boolean values are still supported when
>>> switching to OnOffAuto? I found that the x86-iommu intremap property
>>> had a change from DEFINE_PROP_BOOL to DEFINE_PROP_ON_OFF_AUTO [0].
> We promise to follow a certain process when changing external
> interfaces: docs/about/deprecated.rst.
>
> This is why I inquired about external access.  No external access, no
> compatibility worries.
>
> I specifically asked about JSON, because going from bool to OnOffAuto is
> mostly compatible in key=value syntax: values "on" and "off" keep
> working.
>
> Mostly compatible, because qapi_bool_parse() also recognizes "yes",
> "true", "y", "no", "false", and "n" for convenience, and these stop
> working.  We have a knack for inventing convenience features that later
> bite us.
>
> JSON breaks entirely, of course: all values stop working.
>
> Even with external access, compatibility worries start only after we
> shipped the interface in a release.  Did we?
those options were introduced in qemu 11.0. Fixing them in -rc is still
an option but it is a very tight schedule

Thanks

Eric 
>
> If the interface was released, we should keep our promise to follow the
> process.  From time to time, that's so onerous and we're so certain that
> nobody actually cares, we bend the rules.  This should not be done
> lightly.
>
>>> Should I add a custom property setter that accepts both boolean and
>>> on/off/auto for backward compatibility, or is following the intremap
>>> precedent acceptable? I'm happy to implement either approach.
>>>
>>> [0]
>>> https://github.com/qemu/qemu/commit/a924b3d8df55a395891fd5ed341d0deb135d9aa6 
>> Maybe we also need to emphasize that libvirt integration is still under
>> work (and waiting for that conversion to happen at qemu level). So do we
>> really care about keeping the compat wrt QMP and JSON. 
> I can explain our promise and the process to you, but I can't make the
> decision to bend the rules for you.
>


