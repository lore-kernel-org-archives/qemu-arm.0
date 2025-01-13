Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1587338njn;
        Sun, 12 Jan 2025 22:53:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUlBAq3jSne925jLxofjZarN+C2ixvSdMhlVQMQZ2S8P/cV8AV8SNyRHLEfpYcZD7CK1YAuf+471DoyDA==@linaro.org
X-Google-Smtp-Source: AGHT+IFYYEGxSkIVXVSmHJDrbTxEBMBfQs531hggGXlVgkBkW3HSYtdOlKNvfMUKtKMRWQ6IptwN
X-Received: by 2002:ad4:5ba9:0:b0:6d8:a5f7:f116 with SMTP id 6a1803df08f44-6df9b2eb364mr305514896d6.42.1736751195048;
        Sun, 12 Jan 2025 22:53:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736751195; cv=none;
        d=google.com; s=arc-20240605;
        b=ds56/BY/WpsvKqhmMuso2+WE77hy6pIeB+3ye60u6v838gvXp3fjzDXBk1RkrmYnWP
         kCWkfn1DnBLgUVVZeEuRiyBLFCE93zk1SOu5KY1Yio0HQvL11K53RSiR4gxLKax4XBtS
         qK/1pYTQhzT0S8ZQAigQFh0Bba9HGHA1gNcAkkFvWgdCXCxxWxMISGI5rf7LgW3C1tCm
         7c1543mZ7W1MVqP0qT+4/jqoaBfW9aJEv6RCFozSPgx2q5LLYJbYbCNbAfEGqprCXuTG
         hYUl5gL8uRAUdm1R9F5tmujrOPP9Slj/lypdJmRDS7sun5QbQ931LV7gw+oJXLgGAqAS
         ZdJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=pdm90ZFXqXfhlySAGDmKOf+f33qwcvJzeVusKwT5HGE=;
        fh=YEIdcLwbImwD+r1g8DUdd27iWfJEguvFB0tYoddqiYw=;
        b=J19AYv7cATFR3jCSP2ExJ3SjM1HnFSMrZV6vPrEKAW8be9CJ3gb0nMTLp316YAhs8g
         w0q7uiNTRyRzkA3vO8+OmLULTBfE7lQlX0C0YGYT51enPq0QcYhOk7WafbFVwUzk/n5C
         wfgksQBYVv3EInm8uCkOsDg8OW3q83okwAEJw4uynE2FCk5zt9uM+PrK5VX7dPCay6Dq
         oOHfueKBHxuWSs0VgVde3L3n2leNeULJ4KbtqLm+/4+Hgs0et2mVRYFPQoEYMayyFGrD
         WHMJ92q6q78kqP9P73/FH9TQFjWnFWk49P7x9DDtN1Q1w5HfJP++QsWxSinPeQTahW1y
         1pGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JWyb3dnt;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfae01ddf9si88705326d6.479.2025.01.12.22.53.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 22:53:15 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JWyb3dnt;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736751194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pdm90ZFXqXfhlySAGDmKOf+f33qwcvJzeVusKwT5HGE=;
	b=JWyb3dntydJo/bMzEsQt1yxEOEBVl9qoEMHviMTx1QWJjTTwkue0cGspAClUpvkmY7M047
	qr8fG804Va31RJdyOfawHb9n/zxlPKrmxTzZtQ8p1U9XR6S+oCmZ7gtKoEV+w0MFc9U9wJ
	DywBhkPgWUxR825rD6bAc+Ws1e4oWko=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-g7jWoQvXPMig4m62tPcOWQ-1; Mon, 13 Jan 2025 01:53:11 -0500
X-MC-Unique: g7jWoQvXPMig4m62tPcOWQ-1
X-Mimecast-MFC-AGG-ID: g7jWoQvXPMig4m62tPcOWQ
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d40c0c728aso3168302a12.2
        for <alex.bennee@linaro.org>; Sun, 12 Jan 2025 22:53:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736751190; x=1737355990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdm90ZFXqXfhlySAGDmKOf+f33qwcvJzeVusKwT5HGE=;
        b=VaeWRzh3SqwrHbUWOpzACHvnUYPXDhkL30cVYTdBTI8jJJ8ZvmJuAvKq43f4ANmlW+
         iJphpqBstB5clVu3Gj+VYZhW1q+GpzDPs+u9sO77+dUbUG1Ads1SFYDXuNvxAsr4Wzx8
         wjzrqmM8uxE++hph5Aju7H+QomEsYME81wjGbpIY3LyhL6/DbBe2nPX2qaD4jkS+JwoU
         KEo+PIbzXMirBpcEBP7bysR3zDoLDfSbqxXkaxa1+xSPKwjZzYwN5tjVR0oK5JyDBHE0
         dP10/iG4Iy0lcWIBNwJMNbswB3lR7/ixj0gNurIUSRSKsylzvhqeADRw0+/dsZ1xMhEJ
         1mlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyUGvUV7PyUHXmyl9kAN0OK01wuo0T/HQgKRoJrrj7P3ePkO34iaFJxNcYArLpZl5yzgNYwNuDxtXdzQ==@linaro.org
X-Gm-Message-State: AOJu0YzjtMirEgxL3Si5pfrlws9mnGF4xUrQ0xN6uLUGBaCRQjKa0N7Z
	A7GXGO0GDRVLES9V/0n8GjLX7vlJ1ePkQRaAXoY1Qcwc3HchcS+QWRv9GFX3bu5INdU7QfXUA1G
	6WS0X+aQMCUKGrg9wKc9ClJBSXEOwnBEwXIDDE5+2rDtK2HdHIFQ36A==
X-Gm-Gg: ASbGncvuYchqMKiZ42IqP/YgY1/p8lYSzKst6HZhMwoomQMxd60EcpZCUV4XTl0eWUI
	jT7UDLps5K6jNfj222kau+BRsb1FAPpX4Jx9MBLyaM1hLeBQVMar6D6daKEVL/tv/zzDJYGZySj
	FQQEJbWwsLDcotgZfjk0PAUFg+aKlhb3Bswm4REKHzIDc2ld1ocJXpYpUJYeKNgTUC9pn2Iajbi
	bztwpOfdAQdSx7PAinqR11GRdA/y6try40j+bRx3XcCwEMKu0PjgZGSef8/yzsp9VLnSi4GDWdM
	pk51DwHMhQ==
X-Received: by 2002:a05:6402:5251:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5d972e63ddfmr42175069a12.23.1736751189832;
        Sun, 12 Jan 2025 22:53:09 -0800 (PST)
X-Received: by 2002:a05:6402:5251:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5d972e63ddfmr42175025a12.23.1736751189411;
        Sun, 12 Jan 2025 22:53:09 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-48-16.web.vodafone.de. [109.42.48.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9562e83sm460671766b.103.2025.01.12.22.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 22:53:08 -0800 (PST)
Message-ID: <ac2a2d0a-49b1-46ec-8c45-0d9e4487fb11@redhat.com>
Date: Mon, 13 Jan 2025 07:53:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] docs/system/arm/virt: mention specific migration
 information
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Fabiano Rosas <farosas@suse.de>, Yanan Wang <wangyanan55@huawei.com>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, alex.bennee@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
 <20241219183211.3493974-4-pierrick.bouvier@linaro.org>
 <CAFEAcA-LYWhtFaUanq_qS8nDEVdhDOhDR2kcKv8Ch_5fKSnv-Q@mail.gmail.com>
 <70b28370-228d-41e6-88cd-eda686d55b21@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <70b28370-228d-41e6-88cd-eda686d55b21@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IqLJNaME6MJZavX8Y9EthDHHGfJlRtl6NmfrDPksisU_1736751190
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +ZM2n8v+9dvJ

On 10/01/2025 21.54, Pierrick Bouvier wrote:
> On 1/10/25 08:30, Peter Maydell wrote:
>> On Thu, 19 Dec 2024 at 18:32, Pierrick Bouvier
>> <pierrick.bouvier@linaro.org> wrote:
>>>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>   docs/system/arm/virt.rst | 14 +++++++++++---
>>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
>>> index d25275c27ce..9f1457cf9a2 100644
>>> --- a/docs/system/arm/virt.rst
>>> +++ b/docs/system/arm/virt.rst
>>> @@ -17,9 +17,17 @@ to have the same behaviour as that of previous QEMU 
>>> releases, so
>>>   that VM migration will work between QEMU versions. For instance the
>>>   ``virt-5.0`` machine type will behave like the ``virt`` machine from
>>>   the QEMU 5.0 release, and migration should work between ``virt-5.0``
>>> -of the 5.0 release and ``virt-5.0`` of the 5.1 release. Migration
>>> -is not guaranteed to work between different QEMU releases for
>>> -the non-versioned ``virt`` machine type.
>>> +of the 5.0 release and ``virt-5.0`` of the 5.1 release.
>>> +
>>> +When saving a VM using the ``virt`` model, the snapshot is automatically 
>>> set to
>>> +target the latest ``virt`` versioned model. When loading the VM with a more
>>> +recent QEMU version, you'll need to set machine model to match the 
>>> version of
>>> +your snapshot. When loading it, QEMU will return an error with the expected
>>> +``virt`` version you should set, so you don't need to record it.
>>
>> I don't think we should be encouraging this -- our standard approach
>> is "use the versioned machine types if you want migration", not
>> "you can start with an unversioned type on the source end". So I've
>> dropped this paragraph.
>>
> 
> That's fine for me, I don't have a strong opinion on this.
> I just had a (good) surprise when I saved a vm with virt machine, and 
> realised it's versioned by default. It's good to know that when you export a 
> virt machine, you are guaranteed it's bound to a specific version, so you 
> can always load it with new QEMU versions. This is what I tried to express 
> with this paragraph.

Technically, the "virt" machine is not a real machine, but an alias of the 
latest machine:

$ ./qemu-system-aarch64 -M help | grep alias
virt                 QEMU 10.0 ARM Virtual Machine (alias of virt-10.0)

So maybe that could be mentioned here instead?

  Thomas
