Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp240514dlb;
        Wed, 7 Aug 2024 04:24:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0W4TKFn+joq8FZBtUICgbiwbelrjS1KT51XIty8opAtVvmCnNl4UPS++edqWBnfithUJSdteRaFWWlYajbIriqpdC6OKn
X-Received: by 2002:a05:600c:4514:b0:426:64c1:8388 with SMTP id 5b1f17b1804b1-429052e1933mr14862795e9.17.1723029877965;
        Wed, 07 Aug 2024 04:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723029877; cv=none;
        d=google.com; s=arc-20160816;
        b=C97oiaSCcvWNpTFYWMa7HXjcdiTqaWjrX4aS/M9cfYl1vknT0Ta+hBAx2zwidNmtba
         IWwtAiZk/7RGHbxLnBHV8Xe7fLFZhGJKlBxpjJU7yZcWtTb/Adsne9VmlIwrepNtUeNz
         2CABv3cBGAxNfbYfux1QW+0ijGeCqRKuF2Uz9AxpSnU96ydznkUO1x6Oy84vdMwCQkxD
         P/XLiS4W/Mjc2fjcoJUKB2xLhey4m0Kww4jr36l5hoMtADYWvXXhIe9tkbNFKjsOTNoe
         1Ka5vkxNYmCn56svZ7WYvbcqXq6eYOaDL/Km3E/OrpRITYfgxCGyZ6kucOwHXlff1iL6
         7NaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IPqe+CXFhO2XZAxvBuXd4awThYyr5aarDl2ggjn89LA=;
        fh=bKiYgMfElQpO2chxKa4vzqnaNan6AFGiiKpwGUbe8J0=;
        b=Q793PpuCcMagWEfA7XT0kgOkFjCIDI51r4+D6lARZpjiVp8ycybj7v2nJ9HDDxvrAZ
         MynsTu6AH03kwodmsk9EfnSUFSzmorlDnXqBnL0vL13Ru7HGjf8lxtNqGdxTZs1ccVN6
         HbOE7Vv/rGBV+NhuxjOCcvt/WcU0FLaXoQrFqn9CfUOmWxqbSpZsaAbZoVdmI3ZDLsBZ
         8r/DDD5bTfgFt2XTldwr83mw9/+dXh0/R7kEoarsAzVSrmiaMAxi2lgr/x93M4X3Vwug
         A7jBSZi9vxCdRc4cS6NDCOt1tCsco3bX7oxzNBx4wmmREE5o5u3a3rmuDyn0xwNkYuNX
         PRGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fkwPeRqY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36bf0cd9504sor351128f8f.2.2024.08.07.04.24.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 Aug 2024 04:24:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fkwPeRqY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723029877; x=1723634677; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IPqe+CXFhO2XZAxvBuXd4awThYyr5aarDl2ggjn89LA=;
        b=fkwPeRqYEWwvq5dTraXT+OTa4b1WWQzIoW16dORRgLM3lEDyOOPumX6Fvt584T+lYd
         SR2UVCnqeUh4Dh+atvxAkyqkSV3gEsUZI8WGNz+KzXsRRSCbCXsQl8PTsBY/BVafpKmr
         EqAmr2WZtwRIyuL42Slrtc8Yv1hxdUaJQPWJlCHvYxHWQLlEsuNPdeoiefO20QL35b9x
         b7IF2k2P/9/xoMzWc9EOuLmrtYKLSesuKky8P7OFJed1nzLH6e8XdHMoHl05HrUge3h7
         2gcI+OD8t78uTI6n2NKldvHjlIrKX1pip51UGPM83r8c6AjfPnUkdZOH0hji/W1zEvHv
         1ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723029877; x=1723634677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IPqe+CXFhO2XZAxvBuXd4awThYyr5aarDl2ggjn89LA=;
        b=VuG2bDljx0whIvtnf2VdW1jl3dblrVQ6PzIJC1qC/16FifFt4oScQu0rB0LJf450Ym
         qH2wWH1oaHg6KIhd9tRQtZn2caaiDbvvJdLgCyQXqF0CKBB2tACeUduWuqK0UylN/wh4
         5SyXEIODiMKt/TJRPOfYXmCUL9XUZ2HSQFExPDdas8l+r8Jh8U6X4S3Htw+zYWxMmWfV
         J6VJYSzfi1KfTvX2fasOnxq8QzoQI+1285Su8oZ8akVKdplxH7Z2vHYDrCmdzA5RZn15
         EamaEKZlExImz6/Kj+iJQTWp2O6Atb+Qg/Kv29xMoh1BOjVXqSH+CgttK656r2JuG5VF
         rJbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxwjogMmc1CxMi0sLBNkPzcpakX+k6rfJqJAPc5BgaKVI06KzluZrhsTFvJeILgM5db1a95VbQchHfkKDbvCiYdkLedwO6
X-Gm-Message-State: AOJu0YyeL2rg2qgAYpMFNyckLiXCmbdXzR5rjMHIJ6mw36eF+68Ziv6P
	jBJsFYWgriKwPJL6bAgU6RIldjsCk+cCLDw3G/52rPvK7fadFz9dqQxcCyC6Tux5JQ==
X-Google-Smtp-Source: AGHT+IFogy5EXaAOooNclOMyYB+PlFsenzIv+3GVO9vZbhEe/ZPWeG3r+OR5TIdd89R35Kp8F9H9VQ==
X-Received: by 2002:a5d:6c6a:0:b0:360:9500:9bbb with SMTP id ffacd0b85a97d-36bf0db24c2mr1417224f8f.12.1723029877214;
        Wed, 07 Aug 2024 04:24:37 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.212.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd02884esm15485358f8f.60.2024.08.07.04.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 04:24:36 -0700 (PDT)
Message-ID: <ea6d7058-1460-49f2-967f-666650de1cce@linaro.org>
Date: Wed, 7 Aug 2024 13:24:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/23] hw/arm: add SVD file for NXP i.MX RT595
To: Octavian Purdila <tavip@google.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com,
 pbonzini@redhat.com, thuth@redhat.com, peter.maydell@linaro.org,
 marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com,
 jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20240805201719.2345596-1-tavip@google.com>
 <20240805201719.2345596-5-tavip@google.com> <87sevhrbjm.fsf@draig.linaro.org>
 <CAGWr4cTPqtzEvbd5s7xfMOzid90Gje6NSTGw1qR7r=Ao0xeAcw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAGWr4cTPqtzEvbd5s7xfMOzid90Gje6NSTGw1qR7r=Ao0xeAcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1TM/Xf/PRyl9

On 6/8/24 22:31, Octavian Purdila wrote:
> On Tue, Aug 6, 2024 at 7:06 AM Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> Octavian Purdila <tavip@google.com> writes:
>>
>>> Picked from:
>>>
>>> https://github.com/nxp-mcuxpresso/mcux-soc-svd/blob/main/MIMXRT595S/MIMXRT595S_cm33.xml
>>>
>>> NOTE: the file is truncated to keep the email size reasonable. Please
>>> use the link above and download the full file if you want to try out
>>> the patch.
>>>
>>> Signed-off-by: Octavian Purdila <tavip@google.com>
>>> ---
>>>   hw/arm/svd/MIMXRT595S_cm33.xml | 224052
>>> ++++++++++++++++++++++++++++++
>>
>> I guess one thing we need to decide is if the source XML should live in
>> the repository as the preferred method of making changes or just the
>> translations generated by the tool.
>>
> 
> I think we might want to store the XML in the qemu repo, even if we
> don't use it to generate the header files at compile time. This avoids
> issues with the original XML moving, going away, changed in
> incompatible ways, etc.

Until now we tracked external sources with git submodules or meson
wrap files (see commit 2019cabfee) forked into our GitLab namespace
(https://gitlab.com/qemu-project/) at a particular commit, so if
the external project is modified, we aren't disturbed, or have to
adapt our source to update the submodule. Isn't it good enough?

> 
> As for generating the headers at compile time, I don't have a strong
> preference. I like it because there is slightly less work to do and it
> avoids dealing with resolving changes on both the SVD and the
> generated headers. For example, the initial headers are committed,
> then some changes are done directly to the headers and then we want to
> pick up a new SVD from the vendor to support a new hardware revision.
> 
> There are disadvantages as well: pysvd dependency for building qemu,
> hard to review if the vendor dumps a new version with lots of changes
> and we want to update to it for a new hardware revision, slight
> increase in build time.
> 
>>>   1 file changed, 224052 insertions(+)
>>>   create mode 100644 hw/arm/svd/MIMXRT595S_cm33.xml
>>>
>>> diff --git a/hw/arm/svd/MIMXRT595S_cm33.xml b/hw/arm/svd/MIMXRT595S_cm33.xml
>>> new file mode 100644
>>> index 0000000000..8943aa3555
>>> --- /dev/null
>>> +++ b/hw/arm/svd/MIMXRT595S_cm33.xml
>>> @@ -0,0 +1,1725 @@
>>> +<?xml version="1.0" encoding="UTF-8"?>
>>> +<device schemaVersion="1.3" xmlns:xs="http://www.w3.org/2001/XMLSchema-instance" xs:noNamespaceSchemaLocation="CMSIS-SVD.xsd">
>>> +  <vendor>nxp.com</vendor>
>>> +  <name>MIMXRT595S_cm33</name>
>>> +  <version>1.0</version>
>>> +  <description>MIMXRT595SFAWC,MIMXRT595SFFOC</description>
>>> +  <licenseText>
>>> +Copyright 2016-2023 NXP
>>> +SPDX-License-Identifier: BSD-3-Clause
>>> +  </licenseText>
>>
>> This certainly seems compatible. XML is not the medium I personally
>> would have chosen as a register specification language but I guess there
>> are no other alternatives?
>>
> 
> I agree that the choice of XML is unfortunate but I am not aware of
> alternatives, this is what vendors will provide.
