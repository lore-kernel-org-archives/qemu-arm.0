Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4668212njb;
        Thu, 12 Dec 2024 02:04:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLHSEwC8FP/UMA/Zz6yTn1B+4wZaLo2E6hDz/7Z1qpbOcOBR1beIrbsd7Cs+02ICP0tY02y9N5BI/Oeg==@linaro.org
X-Google-Smtp-Source: AGHT+IEItodJqpMgZq7vmhzMbHgAgJLkzklHqA4d90dzAhxE7uGcdQKRErT1JPm8pafnztGogaZE
X-Received: by 2002:a05:620a:6007:b0:7b6:f34a:c0db with SMTP id af79cd13be357-7b6f34ac11amr294094585a.57.1733997878235;
        Thu, 12 Dec 2024 02:04:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733997878; cv=none;
        d=google.com; s=arc-20240605;
        b=a4Bo3PbnvC/OEDB6xUg/7t2NEjFpNGGFC9T8miyMbWxWSWsm7At6fax5yaoT3GUhBy
         UatcgCD+YsqUyJgWiAIFG+LxGnXOLrfIngOCn4q00zVxHnfSwB15WqwdaOZxInmYAoC5
         l/FQZJQf/87etjyvLARKvaVOnDNKKx6T7HnL1H4+bZ6sulSSs+aTX3qkZ/bQvfkJP+gP
         WZ/9LmXpDQFGuJI/QS9oBMA4tGHgCy2yRayRAIkbwYPyRwe2tNivDDwyA+AiKx4bBBgU
         MvWew6cupDLg1E1MeIL6dJvqwkLPM/26UAsrDKWXepeLF6lOxxmftPPYIyCwJDPrnZLL
         qahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Xuef9j19a6S4cy5t3jz7hMtr1tGA8HyHJRgE1u6fNo8=;
        fh=JZQjyiB9frJmT3jGIAkeBWb011tuec14K8Hw9X8Pcd8=;
        b=iAX0aiRVsk/6SviL1ogoRnS+mDOQWpLV9BOogXioaB+BL6T8tEFkQUMnkRi0luWRqX
         xug4XpDTmYl1SQWtr7TJ4pSkp9wE/520w00pTL9CpflYCigc8QTiTrV2A7epXFksf+tc
         0UeY6CSRHaj1bfkuJxKig1+d6Q2QPAEUfh4nmI3HFUns8UMgcJejl/zgCaKAooo8ljU4
         VCpUPdJgsFTa/OruQYR0roscRXdORSoMUkOc/WBKuJ5wVEUrD2SLtfxnqOdoYuJLa7Re
         SIM3fJc+8CKzDkdUOky/o26zMa+Pzwe4FepSi6H31WeNgrVbQLGR6jZfnpl0TvVf4603
         d+BA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CXq1HPKv;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d90cbb0255si108214676d6.390.2024.12.12.02.04.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 02:04:38 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CXq1HPKv;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733997877;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xuef9j19a6S4cy5t3jz7hMtr1tGA8HyHJRgE1u6fNo8=;
	b=CXq1HPKvk7OtffVY7smyrWYhdthDjDJVxxk14cWX6kJoKwxBrXqy17seXnKaJfZn765k1Y
	rSpnD0qR1zUkyTewM0rpmzeMqqLffqr24aBUH8MZqoua1ikG0OHGNR04e5zS13RdIwKcxC
	AUgVlME45KKKdjHAESaNWmA8Fnz0/wc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-Bth8pistMZ2JIMXzwmpvLA-1; Thu, 12 Dec 2024 05:04:36 -0500
X-MC-Unique: Bth8pistMZ2JIMXzwmpvLA-1
X-Mimecast-MFC-AGG-ID: Bth8pistMZ2JIMXzwmpvLA
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d88c987fc7so7368786d6.3
        for <alex.bennee@linaro.org>; Thu, 12 Dec 2024 02:04:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733997876; x=1734602676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xuef9j19a6S4cy5t3jz7hMtr1tGA8HyHJRgE1u6fNo8=;
        b=IhE73V8HVrjAbg4juCDTYevUglOVBEHnJcVkXSAPqjNLPvbXeyBLcUzonrbMP/Mia3
         dSWY4+si3+XV4zq69DrTka01GxZ/DNnhqvfmpiIqS94v+wyUCKoxFg2g7044sq7eWRer
         ZbAqj97BauWDBU5HTHXli19E9m0L7nbn3K4tOU7yahdhcE92mTkYVVXXhys+/9c6if86
         tlThYSvUAO9FoVC4ynWmlS/aQ5xQYL2hTjGzbAMyJwloK4E5L3s1P5brP5B4RdmAWqaQ
         En0tycYs1OfltoJagrm7tHmqcCdoMRiUV422qjpeXl2zv936PrT+oo5FnJRcI6Rfjq1f
         hOGw==
X-Forwarded-Encrypted: i=1; AJvYcCWFlL897eB2p96NvtY3AD0T/38yIK8wIflCifX+QQqeSa4kukgAl69Cb17RLTiscFDVxudqeWqZqIJnrg==@linaro.org
X-Gm-Message-State: AOJu0Yx/o1nEGRIfcro1nhixjzTlTlBjmhi0Z/SgZ1q7HcBSMuVpbPKz
	4oBJ15ixJLW8snl2uVb+2l1iPOffwUZMhfhSwgPNOAoj4zEyFK+lNWVKBIuGYxHFL7fIOXbR+kw
	Q8PCWmWBfUbgcMVMk2WydOXrvQsyjDH4KqbVXxfqmE/Ffp+wJdKS1ubChRHTh/w==
X-Gm-Gg: ASbGncswkwDB2/2uEXfe1SMmvGSd2Dd6YWFyksP5LYe1VEcVN6RqJstFpkAfE6H+vVJ
	AK7KlL0TpsJcYqtSLfN3v8GT/x0k7p3MF1QbPXE8DQsa2x/ubaFgO+nDzdYZrTMRwk0HH1Xtgcv
	E8HBaoie3lP8H0piX0/DI1Q5lztES0FIAHJ9Jnv9Qb4ENk54WEItt/dbJXz/vwM+qyWwgcjPnpw
	lxoasw99d9Hl/jMuW4GLdGWNaP+mIFLWASVwhjy2xNKkJHFFA4zL9blDUConpG5X2ekgDB8hNKs
	bUBMYxnxOrFXaVrQCZgnh/72IqzQ
X-Received: by 2002:ad4:5748:0:b0:6d8:959b:c307 with SMTP id 6a1803df08f44-6dae38dd832mr47255626d6.10.1733997875826;
        Thu, 12 Dec 2024 02:04:35 -0800 (PST)
X-Received: by 2002:ad4:5748:0:b0:6d8:959b:c307 with SMTP id 6a1803df08f44-6dae38dd832mr47255336d6.10.1733997875470;
        Thu, 12 Dec 2024 02:04:35 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d9162133aasm39276806d6.129.2024.12.12.02.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 02:04:34 -0800 (PST)
Message-ID: <1fea79e4-7a31-4592-8495-7b18cd82d02b@redhat.com>
Date: Thu, 12 Dec 2024 11:04:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH RFCv2 00/20] kvm/arm: Introduce a customizable aarch64 KVM
 host model
To: Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com,
 mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
References: <20241206112213.88394-1-cohuck@redhat.com>
 <edc12140-6345-4868-938d-c80c4d2c2004@redhat.com>
 <Z1qoa8yXscTSAJ9e@redhat.com> <8734it1bv6.fsf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <8734it1bv6.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9TRwyJqKkBzjLDhXHSyENtZjIc6wst1_FOgf-c2rzjw_1733997876
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qv2uaUzmX6PV



On 12/12/24 10:36, Cornelia Huck wrote:
> On Thu, Dec 12 2024, Daniel P. Berrangé <berrange@redhat.com> wrote:
>
>> On Thu, Dec 12, 2024 at 09:12:33AM +0100, Eric Auger wrote:
>>> Connie,
>>>
>>> On 12/6/24 12:21, Cornelia Huck wrote:
>>>> A respin/update on the aarch64 KVM cpu models. Also available at
>>>> gitlab.com/cohuck/qemu arm-cpu-model-rfcv2
>> snip
>>
>>> From a named model point of view, since I do not see much traction
>>> upstream besides Red Hat use cases, targetting ARM spec revision
>>> baselines may be overkill. Personally I would try to focus on above
>>> models: AltraMax, AmpereOne, Grace, ... Or maybe the ARM cores they may
>>> be derived from.
>> If we target modelling of vendor named CPU models, then beware that
>> we're opening the door to an very large set (potentially unbounded)
>> of named CPU models over time. If we target ARM spec baselines then
>> the set of named CPU models is fairly modest and grows slowly.
>>
>> Including ARM spec baselines will probably reduce the demand for
>> adding vendor specific named models, though I expect we'll still
>> end up wanting some, or possibly even many.
>>
>> Having some common baseline models is likely useful for mgmt
>> applications in other ways though.
>>
>> Consider you mgmt app wants to set a CPU model that's common across
>> heterogeneous hardware. They don't neccessarily want/need to be
>> able to live migrate between heterogeneous CPUs, but for simplicity
>> of configuration desire to set a single named CPU across all guests,
>> irrespective of what host hey are launched on. The ARM spec baseline
>> named models would give you that config simplicity.
> If we use architecture extensions (i.e. Armv8.x/9.x) as baseline, I'm
> seeing some drawbacks:
> - a lot of work before we can address some specific use cases
> - old models can get new optional features
> - a specific cpu might have a huge set of optional features on top of
>   the baseline model
>
> Using a reference core such as Neoverse-V2 probably makes more sense
> (easier to get started, less feature diff?) It would still make a good
> starting point for a simple config.
>
Actually from a dev point of view I am not sure it changes much to have
either ARM spec rev baseline or CPU ref core named model.

One remark is that if you look at
https://developer.arm.com/documentation/109697/2024_09?lang=en
you will see there are quite a lot of spec revisions and quite a few of
them are actually meaningful in the light of currently avaiable and
relevant HW we want to address. What I would like to avoid is to be
obliged to look at all of them in a generic manner while we just want to
address few cpu ref models.

Also starting from the ARM spec rev baseline the end-user may need to
add more feature opt-ins to be close to a specific cpu model. So I
foresee extra complexity for the end-user.

But again I from a dev pov it shouldn't change much and we should end up
with a proto that illustrates the working model

Eric
