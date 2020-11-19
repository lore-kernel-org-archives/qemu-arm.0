Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp296181lfb;
        Thu, 19 Nov 2020 03:57:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBCQAoaetA9BHrgMyK5ruknRzQzWe8b/Kv9gPZoT/QTGIfajDYQsjk5KDTBcV62qZ2vPKD
X-Received: by 2002:a25:c7c6:: with SMTP id w189mr11360271ybe.403.1605787047313;
        Thu, 19 Nov 2020 03:57:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605787047; cv=none;
        d=google.com; s=arc-20160816;
        b=bYIRwP7b+5omW707BPabKQD96LPDFZ8F6kZhZFzq9AVDvzrUBCI6z/x+4YBKaa0ZgI
         v9Pe4d5Duit/J/WrC/gv1gqlJCtcxhQxMrQQSCaToFZVrt8xCBbfXvGiRidv8kmNa4QD
         8heZQIOphj3HHBXU0tY8+zMUQWb1KxMWN/f/IlrqFYZsPedCIMq3xIbVGL721clFb9Z0
         mkwuG8zZaTt50WxP/Bmu+CIcc2Bl9erf4q981yTSPffiB/l3lwqIL98AG6wubXp6Jk/h
         E19M/rmMuHSpqvRcXKJCaUpox36IJwLCE4efxgBshM+H6hiadGHeE44rj5eK3cGyanue
         QdnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Bb3sXPzF+RMAbwpEksJR8Qqh1UA+Gme1cltf9t8lGRs=;
        b=LDgbcC2wj3CpBjgXOf1ogzK92hgKCeexEt9IzfPU0XlSjjkg8sxu2tRHlrXraeVUDi
         5WNripWZQHeFO2apj8rMBagxqc7k8No3YupFqilyfVFs3tB7jT8wNAQDmkZ4BBj/djyj
         YpGkYqbg/h5NRTRFU1rCXDpL45Fwmg8X3GwlOLMgfbvPdRO/CgvmmRjjygAElL0es5b2
         04NCmimnMyDI0pkDNytU7o2/yXxqvhNwUVykpjlZtoMnLZN7UOVOeej9BSJ/BaH2z2Nv
         0mnmWKVeWOMyBPUaSGWOF1h+Bd4ZPJbK63d9iyEylmGYSgNs3996KkAyn54+9hOr9k2i
         fy9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A3T66xWd;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id j10si27141908ybg.408.2020.11.19.03.57.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 03:57:27 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A3T66xWd;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605787046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bb3sXPzF+RMAbwpEksJR8Qqh1UA+Gme1cltf9t8lGRs=;
	b=A3T66xWdrUO2jiJszc3xxQd/pbk0SHykwvoNShU4Qt/5GY4EW3AMYI9fjR+AF20/PqWZaH
	YpymtEykacogeBzVuvA6LMqkfHQJhJXpR3V1z0xAigXU1eof45sbjJJPR9sfwAlCwp4o7f
	nIveoIsdS6dCozmhzO2SToEclpd8z2I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-3_tk7do4NcW_4dHxqp_OHw-1; Thu, 19 Nov 2020 06:57:24 -0500
X-MC-Unique: 3_tk7do4NcW_4dHxqp_OHw-1
Received: by mail-wr1-f71.google.com with SMTP id g5so1923344wrp.5
        for <alex.bennee@linaro.org>; Thu, 19 Nov 2020 03:57:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bb3sXPzF+RMAbwpEksJR8Qqh1UA+Gme1cltf9t8lGRs=;
        b=FPYOprbNqaudCsb+cO/Xmupcq4v3MkU7vyqmCSOuzpfu0aEx73Nw9DJkwyXS8VQ6qI
         izJI5YwnvD0JDobkdikQgYbYphmIIREIgkTP4fT/WPoqtyPMOSvyG6I02rJPISmn1Vgs
         esfSfI7WXrA9CXlV+VTTdnokbfJlPJOEzm65VPuacB7zLTGfHMSzhfIJ/Fxr9hK0Efto
         IiwjAmokCyneH89oAzUOTBn16am21eLl5OpHES9tno/C8yMXaPzkp8FFUL2J/AOUgK8F
         l2MvHyxLMpH4J+Qnhwdk4DK1XPAb9247Q7W2qyUe75ZQUu0nyGD7Ynsq9EspWBk+LIWQ
         tQ5g==
X-Gm-Message-State: AOAM532XUQdqhLJQ3YFx4XY0PhjzsmryIhD73WK1UqoF7vtddsAOn0fN
	55xYoZto9NBOceEDuD12zwDupfLWs3MUXOoFBrX2P0kxe/K9LXMOkn7MbGBiNT/C+RTAeMxqij6
	nz0X4gQ03YklY532b
X-Received: by 2002:a7b:cf32:: with SMTP id m18mr4246241wmg.58.1605787043048;
        Thu, 19 Nov 2020 03:57:23 -0800 (PST)
X-Received: by 2002:a7b:cf32:: with SMTP id m18mr4246209wmg.58.1605787042829;
        Thu, 19 Nov 2020 03:57:22 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.234])
        by smtp.gmail.com with ESMTPSA id l16sm37321192wrx.5.2020.11.19.03.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2020 03:57:22 -0800 (PST)
Subject: Re: [RFC PATCH 0/5] ARM: reduce the memory consumed when mapping UEFI
 flash images
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Ard Biesheuvel <Ard.Biesheuvel@arm.com>, Leif Lindholm <leif@nuviainc.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Xu Yandong <xuyandong2@huawei.com>,
 Max Reitz <mreitz@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Zheng Xiang <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 =?UTF-8?B?aGFpYmluemhhbmco5byg5rW35paMKQ==?= <haibinzhang@tencent.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
References: <20201116104216.439650-1-david.edmondson@oracle.com>
 <3da830b6-8200-6df9-9ba3-1f51bf887c4e@redhat.com>
 <87a6vhxvit.fsf@dusky.pond.sub.org>
 <e54fc218-1eae-be1c-b064-049bc1d46793@redhat.com> <87ft55vad4.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7a87651c-47be-1d61-b88a-d0ee151d67fa@redhat.com>
Date: Thu, 19 Nov 2020 12:57:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87ft55vad4.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: sn4jAh2YpjVT

+Ard & Leif for EDK2.

On 11/19/20 12:45 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>> On 11/16/20 2:48 PM, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>
>>>> Hi David,
>>>>
>>>> On 11/16/20 11:42 AM, David Edmondson wrote:
>>>>> Currently ARM UEFI images are typically built as 2MB/768kB flash
>>>>> images for code and variables respectively. These images are both then
>>>>> padded out to 64MB before being loaded by QEMU.
>>>>>
>>>>> Because the images are 64MB each, QEMU allocates 128MB of memory to
>>>>> read them, and then proceeds to read all 128MB from disk (dirtying the
>>>>> memory). Of this 128MB less than 3MB is useful - the rest is zero
>>>>> padding.
>>>>
>>>> 2 years ago I commented the same problem, and suggested to access the
>>>> underlying storage by "block", as this is a "block storage".
>>>>
>>>> Back then the response was "do not try to fix something that works".
>>>> This is why we choose the big hammer "do not accept image size not
>>>> matching device size" way.
>>>>
>>>> While your series seems to help, it only postpone the same
>>>> implementation problem. If what you want is use the least memory
>>>> required, I still believe accessing the device by block is the
>>>> best approach.
>>>
>>> "Do not try to fix something that works" is hard to disagree with.
>>> However, at least some users seem to disagree with "this works".  Enough
>>> to overcome the resistance to change?
>>
>> Yeah, at least 3 big users so far:
>>
>> - Huawei
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg607292.html
>> - Tencent
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg742066.html
>> - Oracle
>> (this series).
>>
>> Then Huawei tried the MicroVM approach:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg680103.html
>>
>> I simply wanted to save David time by remembering this other approach,
>> since Peter already commented on David's one (see Huawei link).
> 
> IIRC the two questions that came up were:
> 
>   - what would reading memory not covered by a file look like (0's or
>     something more like real HW, 7f?).

For NOR flashes erased bit is high, programmed bit is low, so: 0xff.

> 
>   - what happens when the guest writes beyond the bounds of a backing
>     file?

Report an hardware error, so guest firmware have a chance to do
do something (not sure what, beside rebooting...).

> 
> I'm guessing for these cloudy type applications no one cares about
> persistence of EFI variables? Maybe we just need a formulation for the
> second pflash which is explicit about writes being ephemeral while also
> being accepted?

Someone suggested adding a new machine type to QEMU to be able to use
smaller flash for cloud usage (but I don't remember who). Then EDK2
could be built with for this new flash size.

Regards,

Phil.
