Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp42890njf;
        Tue, 13 Aug 2024 01:28:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWPS1Jukf79usOuXAtuM+Z/Qz0L/+AWLvSZkAkSGMQxjjC4do7mA18OLHWfQs6Kace0bTrPrp7L9tyoUQ==@linaro.org
X-Received: by 2002:a05:6512:b81:b0:52c:e091:66e4 with SMTP id 2adb3069b0e04-53213681b17mr2625347e87.44.1723537707818;
        Tue, 13 Aug 2024 01:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723537707; cv=none;
        d=google.com; s=arc-20160816;
        b=PgaojfHrpB5touZjnP7w8vyAwGE7cYZJkRSb9WKSHDSkP1i2DeAj5YtbLIUyYIwqp9
         vPiEYiKqn0dpJHggPNslGm0pvS4/LS3dTQD6X6sx0O7l0myHPpp1Pvndh083W6/Noe8o
         GBljxdlhCJt8FRIE8rngOPPRkQ0d4ZLxWN90usmuF/8Ox8B4fe9i1ukkKedE4xAhfxaP
         WIV3NsTVdiIrltQ7V8t/BXqyp9v0qXZAIToUQdA9W79tufEQssaKrVBcs9cuxrO8enty
         InKNRZty1ET7QAXJFMM7NmO8OFENYYlmp441x78qBDfNPUWd+ze14hxZnRZDHxVJwRG2
         TOJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=C2dcd/MnpZ8v72aLdJKBRsWw+8Ha1UH03gZIJXyjOrE=;
        fh=g/aywGjaD+T7D/5fzLftV0dnaV0R29pjy7d/EIpKDD0=;
        b=ceALS0OsWIf9vT6PbPEfE1JkxPVs9u+lAgFcsM8oMjAifLMq2Ed9y+SStx9aRSMGvc
         qT+MmHDYd3ASgqF9t9gWG1fBLh+44LEVq+BuBW8c16R4D545pDY5av80VHuqLhF7AoyD
         8QswyRD058UivHMQT/hejgoBUDxgpa1BmB6ZUinrz1TAyy/HM1FXhCvkOZqUwdHKeWVz
         G5yyAPx2k7eUpFS6tSwWFewR/q0jnB9E06m+L++bEB/RAw5dOO9UGjiDzG8nRsNfl+yV
         ZoIeuOpyIO0KHQnekDl8UyikxdtJynkbmAXo7RBXXwqE4FEu+EgwOxyLSl2XBACvqE/Z
         oz/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wBQp9d8B;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-53200ee7be2sor2077303e87.18.2024.08.13.01.28.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Aug 2024 01:28:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wBQp9d8B;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723537707; x=1724142507; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2dcd/MnpZ8v72aLdJKBRsWw+8Ha1UH03gZIJXyjOrE=;
        b=wBQp9d8BHD72dY3z5XCjCTdr9RkKSk1e5W1/h2pxcQ84aCnSVIZJh05LwZKe6H24bT
         rPBUuUgrmxC4y0CoV1YLZliYyR1K/H1WD/fgnAUBU4Kye4Ioqjuy1BTmNAboxAvMJolB
         yBcmIpz9m0PJBHtbItbyyFk4YQ90QzsPK3/D3alS3Dw4i6Fm3KLYhAnsWxHHgrecX+pu
         xGu8QI7Gt2kIkOnJQ3iJ+83qW/Umg1WmHD8oc5MYyEqXPPlUpyzkS6IQtWrCh/gVbTD5
         RUdM+DXIrwmtdweU4BqphPRNXVmCwlMeWbmt5mN71VP7PB3i2piA1FXJ15omv/atmdKL
         rpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723537707; x=1724142507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2dcd/MnpZ8v72aLdJKBRsWw+8Ha1UH03gZIJXyjOrE=;
        b=h4KH1NqAMPW8gMIM6bDSXQzMEC9KjsrWQ62mZoQFo4lwv1jJCtlOHiArSo5xSTTWgr
         7+Bz5k4w6wJ51QCB2CcVYbrKstPrNxvJ2oC/q8HPCsk+8R4qG6OGMiskamHXZET2o3wR
         +fLpYIfN3bxQQLAIYTszOqOIiByaHfmL7fCcQY+DwqhVx2wd+NrxTbTSuLBmMBciqXHl
         dCMABAJUD5Dj5ywxba4owX5HQGMJ3wA0S9BLAdtMld7zdDi+CwHJ340S+09Q0KcnI/3t
         h+JUws1F581VLyMdpmgBnsnYGry/2biggcjNwvUgdK3yVIThzakONjiXpf81GplLRe2T
         2YAg==
X-Forwarded-Encrypted: i=1; AJvYcCWyJtjKAN6Tqup7GrhopdXsOiOUPrhGgvFeN2vIJMcKERhemGdEWY2W0RmjRw4YCJmVuTnh7GsaztpXwA==@linaro.org
X-Gm-Message-State: AOJu0YyTcfzpRiv8R/q4o4g7aqc7AN+Z8UCVJ1Shs6qsKr4uyMc4ltdW
	7rCVDmiG/KhA7Lc6zHRPr3tyImDmwQQoqniYYINBbF0kXdHN3NxSf9Gq/6W9eulObA==
X-Google-Smtp-Source: AGHT+IF/l4mdJJu2qUMw2X287dHk4ueEfrtIEPOlvh/7mXBDEJ2k2XFEd1/fDllwwXRsIbvpBVMsYQ==
X-Received: by 2002:a05:6512:3c8b:b0:530:d334:e0f1 with SMTP id 2adb3069b0e04-53213681798mr2406447e87.41.1723537707022;
        Tue, 13 Aug 2024 01:28:27 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.129.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f4183aa5sm49026966b.211.2024.08.13.01.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 01:28:26 -0700 (PDT)
Message-ID: <b7f837dd-a58a-4912-9400-514fd5cdac4d@linaro.org>
Date: Tue, 13 Aug 2024 10:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/23] hw: add register access utility functions
To: Octavian Purdila <tavip@google.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com,
 pbonzini@redhat.com, alex.bennee@linaro.org, thuth@redhat.com,
 marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com,
 jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
References: <20240805201719.2345596-1-tavip@google.com>
 <20240805201719.2345596-6-tavip@google.com>
 <CAFEAcA8w47gZYV8GBQa3fNf1cBWNtm_k4DAdnOVt4RWBdSrghg@mail.gmail.com>
 <CAGWr4cSwJPMngzA7DAHRHu7eJkWGhzxuAMB2fbGRnNAx-7AR7g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAGWr4cSwJPMngzA7DAHRHu7eJkWGhzxuAMB2fbGRnNAx-7AR7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zuT08oOjUrXV

On 12/8/24 23:14, Octavian Purdila wrote:
> On Mon, Aug 12, 2024 at 8:33 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Mon, 5 Aug 2024 at 21:17, Octavian Purdila <tavip@google.com> wrote:
>>>
>>> Add register access utility functions for device models, like checking
>>> aligned access and reading and writing to a register backstore.
>>
>>
>>> Signed-off-by: Octavian Purdila <tavip@google.com>
>>> ---
>>>   include/hw/regs.h | 89 +++++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 89 insertions(+)
>>>   create mode 100644 include/hw/regs.h


>>> +/*
>>> + * reg32_read
>>> + * @base: base address
>>> + * @addr: register offset in bytes
>>> + *
>>> + * Returns: 32bit value from register backstore
>>> + */
>>> +static inline uint32_t reg32_read(void *base, uint32_t addr)
>>> +{
>>> +    return *(uint32_t *)(base + addr);
>>> +}
>>
>> Pointer type handling looks suspicious here -- if
>> the thing we're accessing is really a uint32_t* then
>> we should take that; if it isn't then casting it to
>> one and dereferencing might be reading unaligned memory.
>>
> 
> It is used for performing generic accesses to generated structs (patch
> 3/23) which should be aligned in the way that are used in the patch
> set. If we decide to keep it, I'll add a note regarding alignment.

Could we use ldl_he_p() instead?
