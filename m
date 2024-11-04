Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2262734njc;
        Mon, 4 Nov 2024 09:07:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX/nelMtSy42ew+v62ZARuNu+NhNSK2FHwd17AsVTwgbPO3Skp6TTptY13nDKbaV+yTWrHT5tLEtOOfBw==@linaro.org
X-Google-Smtp-Source: AGHT+IHvp5CQkfa9f8HfwROLTwAvCLHPOJsheUYctfb++JmtWY078kLLKwVQ4+cD1Fjqk8Z6alOA
X-Received: by 2002:a05:6358:5f0f:b0:1ba:564b:48eb with SMTP id e5c5f4694b2df-1c3f9db9fabmr1478816255d.6.1730740048485;
        Mon, 04 Nov 2024 09:07:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730740048; cv=none;
        d=google.com; s=arc-20240605;
        b=Z2N+BqbrAqqby/fEhyeTE2yAIp48DjXA1HfWRoNNtPfI/h6tFtW0sulPDZ8VdFiQd4
         XhkNm0O5dRz7u+ZYHBAQihIeyvTll+xWK9pV9e1TqjFQgxNsrtzQH6Dvsvuq/pQgymeQ
         ErP2w4WVbyhzXd2CKMrQ/O5dxYymg31glu37ALp96zcLU3kZJKIftOT3FRYS4Kc5obzg
         oEYrBtl282SX9J499xFyD+vJT4akUoJC05cqTUHXOAhA6aFpu2LauiMVqwL7/6W1NFnb
         y29bj4jcye+MRj6FeFEBQqW+kNereBI0TjMBKDEWbE18g5jGAC0mOsWVOeFJgR97OcmI
         hENA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=9kd/SLSKtmTJFWvEeiYbH/ZTYsZ9MzO/O/GCUBVtKaw=;
        fh=X6ly4WJz8tAGsV2mG3R2vpJV9RpHkzWr1SO6IA/k2aU=;
        b=CLZNe8JDKtZEVdLX3fV2pinUrSgKNd4dojFE3qFaQTU5KkIuS4Z1a3YSyo3TMY3lYw
         GbD+CfvMOAxCFV+Er4GYCVL63/+oa+FLi38zMR1D4fZ4BB+BmjvlkaWDLEECuYCiOWBS
         XOx05XI6lcl0WVxxuGBOp6aP0IgD+8nPFgNwqAPzR0TnPwEZUB0h55e0tRN0d3p1QfrG
         sVSSQj9uc1Xm1/4CssOAxn0YKIzfafIsugVmEUUKYemZMiDzxL8uhUAVN+ZJ4eA/5S5g
         LLzflz6O/qS0VmIvWVGlPClCcA7tEkonVtG3Azdy1VtQyJ+17N8dGGqnGzogqbpxIwgh
         aYhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B+dhLpLK;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a957531d78si1916002137.374.2024.11.04.09.07.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:07:28 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B+dhLpLK;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730740048;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9kd/SLSKtmTJFWvEeiYbH/ZTYsZ9MzO/O/GCUBVtKaw=;
	b=B+dhLpLKARcdRmShEY8mw/7KkRhzPE4dxkg1TqIKqOCghtPWaU4ubrb6jta9aolzghcyR3
	Y2Fe4nNqAyBbifJo6HstmXcuzpUlebvJ1HuUKwnc6cJQG/u7t43seSrSsBQ2+Jst49j71a
	okNZUf65YyVcsK8ZROIItytcAG+5Qs4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-gFOKYXSlNEGShj-wNC5veA-1; Mon, 04 Nov 2024 12:07:27 -0500
X-MC-Unique: gFOKYXSlNEGShj-wNC5veA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4315d98a75fso30628215e9.2
        for <alex.bennee@linaro.org>; Mon, 04 Nov 2024 09:07:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730740045; x=1731344845;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kd/SLSKtmTJFWvEeiYbH/ZTYsZ9MzO/O/GCUBVtKaw=;
        b=YFfHlLRnHN6mvSLSTuUf3wSKsGcB2kg94z/hA2Ps6gI/wj17n+KqI4RYpM195nx3Jm
         ViL97qnaWsgITL5IDTP6GobWZ2ViKJNeBmiuJz16k4SXpK60rk8kQYCZGpls9UxMT/Dg
         aW5EeyJRqMSlkx5betd9ZrTG9CfWzoDVXPoAxOvikW9CjXapJeFUtXeQrgKMrj2raGbr
         AdmTVcpn9A3FbnoFTTdNxkg/vCjLO/4nCkqYA1dFjNhqqbHJ7w89xI9hIDXErG2EQVbv
         yG3Nle/sycKdDq7PHNnaykoCOYKfY89JSsFMm6DlPYTdBb+kf6MOrYzo515/mWK5Qkqm
         sORw==
X-Forwarded-Encrypted: i=1; AJvYcCV8gBnYzwRzLXODvsRlT8kuh+sqrNG6aBbQTtJkhBZ3cEqKR3lpExXEct4qbT2qIPeCXuRCD7OhdJhIwA==@linaro.org
X-Gm-Message-State: AOJu0Yz9Vdeu5mfMm3zML2Kho383AXc93CVzbq5Z+Rnsy6xqG8qioks7
	3S9vbV+N04jzNvIpyxuzrCKgFsStDQftWmc9ss78Bvu2RYeVuT0m+62PzDSoYZavRQe6NYEXTom
	2gZYf2qn1NIO9jppMsuVcPBuRb4wUPFi41KIxeazOsLf5S9aT2pyuMLXzIma/9Q==
X-Received: by 2002:a05:600c:3b07:b0:426:602d:a246 with SMTP id 5b1f17b1804b1-4319ad361dfmr283157435e9.32.1730740045198;
        Mon, 04 Nov 2024 09:07:25 -0800 (PST)
X-Received: by 2002:a05:600c:3b07:b0:426:602d:a246 with SMTP id 5b1f17b1804b1-4319ad361dfmr283156685e9.32.1730740044307;
        Mon, 04 Nov 2024 09:07:24 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d698144sm163984475e9.39.2024.11.04.09.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 09:07:23 -0800 (PST)
Message-ID: <48637795-14b9-4b0c-9fb5-46b387be4fd0@redhat.com>
Date: Mon, 4 Nov 2024 18:07:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC 21/21] arm/cpu-features: Document custom vcpu model
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Kashyap Chamarthy <kchamart@redhat.com>, eric.auger.pro@gmail.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-22-eric.auger@redhat.com> <Zx__Zi3Zpg1AspnE@pinwheel>
 <52690aae-55b6-47d5-a308-dd75475f8377@redhat.com>
 <CAFEAcA9y5ooPNZ7JbGmRyTKbZn5XPK+5zZgVAvnER=++kWuBrg@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA9y5ooPNZ7JbGmRyTKbZn5XPK+5zZgVAvnER=++kWuBrg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: CK5JmWEAQcoo

Hi Peter,

On 11/4/24 17:30, Peter Maydell wrote:
> On Mon, 4 Nov 2024 at 15:34, Eric Auger <eric.auger@redhat.com> wrote:
>> Hi Kashyap,
>>
>> On 10/28/24 22:17, Kashyap Chamarthy wrote:
>>> On Fri, Oct 25, 2024 at 12:17:40PM +0200, Eric Auger wrote:
>>>> From: Cornelia Huck <cohuck@redhat.com>
>>>>
>>>> Add some documentation for the custom model.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>>> ---
>>>>  docs/system/arm/cpu-features.rst | 55 +++++++++++++++++++++++++++-----
>>>>  1 file changed, 47 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
>>>> index a5fb929243..962a2c6c26 100644
>>>> --- a/docs/system/arm/cpu-features.rst
>>>> +++ b/docs/system/arm/cpu-features.rst
>>>> @@ -2,7 +2,10 @@ Arm CPU Features
>>> [...]
>>>
>>>> +Using the ``host`` type means the guest is provided all the same CPU
>>>> +features as the host CPU type has.  And, for this reason, the ``host``
>>>> +CPU type should enable all CPU features that the host has by default.
>>>> +
>>>> +In case some features need to be hidden to the guest, ``custom`` model
>>>> +shall be used instead. This is especially useful for migration purpose.
>>>> +
>>>> +The ``custom`` CPU model generally is the better choice if you want more
>>>> +flexibility or stability across different machines or with different kernel
>>>> +versions.
>>> Does "more flexibility or stability across different machines" also
>>> imply "live migration compatiblity across host CPUs"?
>> yes that's the goal
>>>> However, even the ``custom`` CPU model will not allow configuring
>>>> +an arbitrary set of features; the ID registers must describe a subset of the
>>>> +host's features, and all differences to the host's configuration must actually
>>>> +be supported by the kernel to be deconfigured.
>>> [...]
>>>
>>>> +The ``custom`` CPU model needs to be configured via individual ID register
>>>> +field properties, for example::
>>>> +
>>>> +  $ qemu-system-aarch64 -M virt -cpu custom,SYSREG_ID_AA64ISAR0_EL1_DP=0x0
>>> If possible, it would be really helpful (and user-friendly) to be able
>>> to specify the CPU feature names as you see under /proc/cpuinfo, and be
>>> able to turn the flags on or off:
>>>
>>>         -M virt -cpu franken,rndr=on,ts=on,fhm=off
>>>
>>> (... instead of specifying long system register IDs that groups together
>>> a bunch of CPU features.  If I understand it correctly, the register
>>> "ID_AA64ISAR0_EL1" maps to a set of visible features listed here:
>>> https://docs.kernel.org/arch/arm64/cpu-feature-registers.html)
>> Not all the writable ID regs are visible through the above technique.
>> But indeed I think we converged on the idea to use higher level feature
>> names than ID reg field values.
>> However we need to study the feasibility and mappings between those high
>> level features and ID reg field values.
>> The cons is that we need to describe this mapping manually. Besides
>> being cumbersome this is also error prone.
> You might be interested in "Arm Architecture Features" on
> https://developer.arm.com/Architectures/A-Profile%20Architecture#Downloads
> which includes a 1.8MB Features.json which is a machine
> readable version of the "what are the features and their
> dependencies and ID registers and so on" information.
thank you for the link.
>
> But note that (a) it is alpha quality and (b) I am not personally
> going to try to interpret what might be reasonable to do with it
> based on the legal notice attached to it: that's a matter for
> you and your lawyer ;-)

Thank you for the notice. This may be similar to the ARM xml mentioned
by Marc...

Eric
>
> -- PMM
>
