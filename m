Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp625843njb;
        Tue, 18 Feb 2025 03:42:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWl/3+7olTzgr83tKcdSWH6mndWfY/e/4l/QNf7G25LS0AsvxM1vI1wfoBwys/3GFzMGHc9TcyoUbIBxQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEDmcRvKKjLbO2OXt2C/Dm2l6rxpncV1wyeaaWrr6IrYyVE0j05Yxe4f2QkvQ5/jkFHT/Qb
X-Received: by 2002:a05:620a:4507:b0:7c0:7818:855c with SMTP id af79cd13be357-7c08aaa8affmr2273415785a.36.1739878940632;
        Tue, 18 Feb 2025 03:42:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739878940; cv=none;
        d=google.com; s=arc-20240605;
        b=Ebb3GsaH/s/yzxSdYwM9m6yXgN4VW7DNxaHDyjaxPhGS5AcO28YUGnyOLJg6O9X0h2
         oeWfu4z8ROlX2IfuPY3UMnjK75NvkzzKdVPCj5UqxXbsTd/uYoFMsitwIlRfW41wUvnc
         eug18BwpQFvxmf1d1LY6ENW+ba8Yz6lj1E7V1Vz+0njx7/WJ8U6PnhAU5ZECsZ5Rktqp
         M70wSvBHPRrCZfkq+t9Um0++fT6nlPKEygs+juHiBlZlDFPfdHnH/V/ZMkCjwazkpYD1
         R2DVGKwJ05mk5vC4yaNJS8JgpCw17sCUrLxNTSjLcKRa1/0RyafKeJ4j2pMfFa992dMn
         9rpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=cYFiM7+SnDa3qBFNCUzCy41sKq6H2/+OeY+qMU/MNFg=;
        fh=yxEa2zOCo7dY1kUzT2XegwTUlbBas1qaH410V1GORtE=;
        b=ED+OKcLA0PrvkDDBYYqyndZoKud9AOY5ICXICrVOou6QksS62iT6B8H3d4zZ+KmaJY
         AcHXDQCZsKDRuVgRz7TrwjZzO0rQq7SKSZcgSes9fins1tfuHu1uW5VJ4kfE2LHQ78tg
         BuMtEC6vvhQloQ4ijIXyey475psILb0fYckTF+uar8biFaIwTA91xZ9cTIR77Axw0/Ac
         jjjlnSKkiWsgmtyRdAnS6kEKg/2nSsnfrvTZe+oBlufqprDNqGm4MQ86C3V3ZZjRnhxL
         xEYnsnky6ylLsCO8xi9qq4NpW2hgTu3J4MloYS8canEX6Yxqo2yoRKDaNqt7pnv6jJv+
         Vtnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DkZ2iWDN;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c0959e423esi458207385a.125.2025.02.18.03.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:42:20 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DkZ2iWDN;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739878940;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cYFiM7+SnDa3qBFNCUzCy41sKq6H2/+OeY+qMU/MNFg=;
	b=DkZ2iWDNdpo6b65smU6j1Qcl/GNJMJHNfsn8uYB2AQEFfsaakT94vJbKOgTtIkdOrlmDKh
	It5ZTFE+Uvwh2JKqt9qBAFsFbZ8XZUMTd9CzQXowx954QZALrIq2c6LA+RIBX8TCNanF2o
	nhFqZGupPMRt3USs8zZIp7LzoHa6mTU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-HjJWJ2vTNT6Lo7wW1SdrJA-1; Tue, 18 Feb 2025 06:42:19 -0500
X-MC-Unique: HjJWJ2vTNT6Lo7wW1SdrJA-1
X-Mimecast-MFC-AGG-ID: HjJWJ2vTNT6Lo7wW1SdrJA_1739878938
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43947a0919aso43829095e9.0
        for <alex.bennee@linaro.org>; Tue, 18 Feb 2025 03:42:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739878938; x=1740483738;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYFiM7+SnDa3qBFNCUzCy41sKq6H2/+OeY+qMU/MNFg=;
        b=upCUUqJgd32mFVm7v953Ns62ckQOMHnm9UGgkC/zPxU9PZCX6Y3KoQVxPnjz/UEn/t
         ijSe130mzlON3YHxSGdX1Clz8qK/NKr+xOeT+tw+8nHId/p9B7I47npKWQVAGL32oi8R
         QI5HQv3d2CJGmrW904xw8Yrz1+oqIl7OZBPFlQ4ZEP8vNeEHuI28C/SbcxvaPK3RvmOX
         hubK1gLPnujAz0CHPeDejxx3q9xi8ziaUf6WW6/+rd+hYJjJWrtc1B3qouJTNVgfaLCK
         ebuO9ogkxBAcEK+8Kqvj+hI0qzTkQBaxruzghtzgoSDf6F09pEWI2F0nvuGWuoTUakOK
         kPyw==
X-Forwarded-Encrypted: i=1; AJvYcCVWppYwAKACgi74HRM3q3RpPVq24LKj5Lcugeivrb9bs+lpxddOabwe+FiUrhXEeXch6Fd1YqS+v+7+Mw==@linaro.org
X-Gm-Message-State: AOJu0Yw+n+dc6h0twuEGpi6tDortKYv1/142wZlxvQVDZlg8GrIFKueB
	0sBOFNvhekLpMYdWT+V6e/ONfK4qXKpis6WX0kTrSzsCFsS6TEDnJIrjWFS5pJ/lwIWPqEFF61f
	Qxw9o9YdTSNbThVPhXwDI0/wxJtlDdkLmmAUEBWOUy4NOLiux+K6t1w==
X-Gm-Gg: ASbGnct1zlvr7LJr7NWNnuCsoAidHz1N/usDOU1qcF4ea5xtaJKMJXCr5cLX+O/wcPQ
	uKA7+UPnwPgGJdS2i1/B4Gt21Ro1ATVFyjcoUimGRVYPlCZw70fYLu0T20WoISSeegITXrOet/G
	ZjEFH3zuTNFBjwOgGUYZjwkE3Hbn0gtcRUMzd0cY2Hwu4vULJm4YRq9Slcq/bohKdebM/48U+Zo
	aPmDLnaT4PIGsm3rA8+/R2uv8FJw5PNylwpHchT5C9+KO8GkqiP7KzU/TbrhbhKKjuBkU4eFsvL
	yPePQmn2KLlZXdm5lrW3h3D0h/UYQdPdE0X7oquS2A9clZS/Bg+X
X-Received: by 2002:a05:600c:3594:b0:430:57e8:3c7e with SMTP id 5b1f17b1804b1-4396e730949mr123278585e9.28.1739878938022;
        Tue, 18 Feb 2025 03:42:18 -0800 (PST)
X-Received: by 2002:a05:600c:3594:b0:430:57e8:3c7e with SMTP id 5b1f17b1804b1-4396e730949mr123278195e9.28.1739878937515;
        Tue, 18 Feb 2025 03:42:17 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa7bcsm178892785e9.28.2025.02.18.03.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 03:42:16 -0800 (PST)
Message-ID: <a5d89352-597f-4adc-8f67-a5a7dd9bcffb@redhat.com>
Date: Tue, 18 Feb 2025 12:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2 2/3] docs/cpu-features: Update "PAuth" (Pointer
 Authentication) details
To: Peter Maydell <peter.maydell@linaro.org>,
 Kashyap Chamarthy <kchamart@redhat.com>
Cc: qemu-devel@nongnu.org, Ninad Palsule <ninad@linux.ibm.com>,
 sebott@redhat.com, maz@kernel.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Yi Liu <yi.l.liu@intel.com>, qemu-arm@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>, richard.henderson@linaro.org
References: <20250217163732.3718617-1-kchamart@redhat.com>
 <20250217163732.3718617-3-kchamart@redhat.com>
 <ff481ffd-545f-4d0c-b53a-3cf9e0f8f388@redhat.com> <Z7Qnsm02w6gao_ui@gezellig>
 <CAFEAcA8H0P14JaAtpcwG99SYkqAdhoNzyQBuO++YjJjM1rUbPw@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA8H0P14JaAtpcwG99SYkqAdhoNzyQBuO++YjJjM1rUbPw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Py2m43HoI7gCS7GLa-wjXrHp0xL9ZOZXMQKd8DPcKRA_1739878938
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: r1vT5foa78TF

Hi,


On 2/18/25 12:34 PM, Peter Maydell wrote:
> On Tue, 18 Feb 2025 at 11:29, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>> (Cc: Richard Henderson; context: "SME" and "RME" feature discussion
>> below.)
>>
>> On Mon, Feb 17, 2025 at 06:43:01PM +0100, Eric Auger wrote:
>>> The resulting header layout seems weird to me.
>>> Initially we had at top level (assuming ===):
>>>
>>> KVM vCPU Features
>>> TCG vCPU Features
>>> SVE CPU Properties
>>> SME CPU Properties
>>> RME CPU Properties
>>>
>>> and now
>>>
>>> TCG vCPU Features has somehow disappeared giving the impression that
>>> there are none.
>>> Maybe we shall
>>> - rename KVM vCPU Features -> KVM only vCPU Features
>>> - Add a TCG only vCPU features including both SME and RME ones
>>> - introduce a top level KVM and TCG vCPU features with below:
>>> PAUTH, SVE, detailing potential different semantic for both KVM and TCG mode
>> Yeah, it can be done.  Would you be okay if I do it as a follow-up?  As
>> this a re-work of the entire doc with several features.
> I think personally I would favour not having the split of
> "KVM only", "TCG only", etc sections. Instead document
> all of the properties in the same format, and have each
> property say whether it is TCG-specific, KVM-specific, etc.
This other alternative looks totally fine to me as well.
>
> Some of these properties may at some point in the future
> change, after all -- SME is currently TCG only but may get
> support in KVM and HVF in future; "aarch64" is currently
> KVM only but we might some day support it in TCG.
agreed

Eric
>
> thanks
> -- PMM
>
