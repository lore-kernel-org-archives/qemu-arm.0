Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1244529njb;
        Wed, 14 May 2025 07:47:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3iHvaEb/yJU/YEMEd2zxL/IPaduxaUWajAL4OU/rJwFLw0wWZtTLYL9KEOwYINPByXgVfKqFhb1Oiow==@linaro.org
X-Google-Smtp-Source: AGHT+IErZXc5V2+pcd1yzNTYcNTe3o6A4PSW6x7mLj/LKByY+T7UHrRaRV+dkfsrEt6QVMEWSiJ/
X-Received: by 2002:a0c:e80e:0:b0:6f8:997d:fc84 with SMTP id 6a1803df08f44-6f8997dfe54mr31560316d6.19.1747234076323;
        Wed, 14 May 2025 07:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747234076; cv=none;
        d=google.com; s=arc-20240605;
        b=HNioSJaASqWHQmVlvt1K749O6HORfyw7h1myltHCo7DaecnO9a+U8QPFfLBpHYLKpx
         kZQnBAX+l7GNKxsMkT55I6LpY51/cS8Vkf+dROgJtx5oK7sqJqwy7ChhlkxvfUJ30Z4U
         uhCYY8o/gY6ZHu21mixSqzaDOcNwZedjnkTffaawjkKOYdb24Aex7gplne3XiWHpPbJz
         cAr2Ej3BzwmQCXCXeCExJwTlLaOf3Ms7gV/qfqG/zuGoqOX7AJallLkji1CI8AL0ctf0
         UEZWiEPXQFY18pigO3rYWbP3ErEMoDtkzni+K+kbTjom9M0VAraxldEhDf7TbJAf37Jj
         9AKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=X2BsONOjDivtTgtkFsn0yv2PnUrWsXcvAaV+8U9+UuA=;
        fh=tw24fwVItdZ4Dd0DYOZqMziHxzGIJGyGnGPzKHYEQEQ=;
        b=LT2E2/xxpVLXdte87pANDXqq6gy+OTANaHKwBqZKnECLcrTH0kL0n7PeUrDQIGe3hq
         4t2Ug2lCSJpwlHunPmrxa+00Li5uOtOmhea3M+oLGFobQhA2KQ0zTAylMBEo5L6+yARX
         8l9Q2kLyOL/GfGFQxHraidt7UrbLYba+Kkm20YA5pEJlvUA+jXdd6haQZxP2HE4dLqlK
         sjD+O9pzshHP9GH37RNmnxuOH2hrWy5jWNw0waGCd+O03Vr388AZuI14SY5zBgZER1fX
         tyEP6aytMf87OMQczeDVcflzk1xefg7SER3goRWLOQOcUqd5Pc8js0SrLOCV76gbz0Ty
         XPoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KGBXjTy3;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-494525b377asi130862721cf.667.2025.05.14.07.47.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:47:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KGBXjTy3;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747234076;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X2BsONOjDivtTgtkFsn0yv2PnUrWsXcvAaV+8U9+UuA=;
	b=KGBXjTy31yU31oYdSZKll1JahUtZ3PSKZAmIM5TRodPJUVcZPOvbcctta0Jvzxt+AuCNmw
	LThlMSSwnWlGFDLL2SA534T/JvS4mD1RGYaD55pZShNuRys7DV0I6QIl8lVki2c85elpAZ
	4S7eu/6b8Oqmoe0HbPey7vPvnGslTBg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-pMK9BxOXMbuiyLDydJDg6g-1; Wed, 14 May 2025 10:47:54 -0400
X-MC-Unique: pMK9BxOXMbuiyLDydJDg6g-1
X-Mimecast-MFC-AGG-ID: pMK9BxOXMbuiyLDydJDg6g_1747234074
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a0bcaf5f45so2340025f8f.1
        for <alex.bennee@linaro.org>; Wed, 14 May 2025 07:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747234074; x=1747838874;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2BsONOjDivtTgtkFsn0yv2PnUrWsXcvAaV+8U9+UuA=;
        b=nm06YQjI9oLfHMWsPTj0Y3QTMwkvAF6QoBBKkvJFiKzyX5AdduhDBk8crl7f1j84pu
         JpFO3ZqifzDvew2mS4AhWEnbpVv1oaUYpuoZBoRp1LyiPlJ/8mOS1gXJtnRfV+9QuZYu
         Vb3OXFwVeWjuYJa15Ux0IByNtGV3UeYZz02qNaaDrOIS+GUSL2Ti2ZJnViHhB1szFVLj
         S0MmFdH25mRXwhXqpUTYdjuk6uaVrtEFmlNAIKm1b6EoyF08rPw0AIXkllWAPPH3aTGx
         6Vvc55UC3V/FpMo8iMu3l0o90VNNfdoIOkWcufMRYUjivqz5BXMLihyRJlEvFaexiDr5
         tjJg==
X-Forwarded-Encrypted: i=1; AJvYcCUq3v26Gdafo9La9INqghw5P2kMsvRfslu9bmVovmXB11/Gn0y51FCRHy907s9sH/RBNsha90jPEUc6vQ==@linaro.org
X-Gm-Message-State: AOJu0Yys0yFcQIVE5LnOxKcdQSL1ZXTz9B1q8F2D6DSfOpsiOS4FShGG
	SAq9STG/Sr/HWj3UpfMrbuOmCQRiBxN219A+xLbaVWJpPpES1Socf7hYEbemHLE4bEXA3efmFeY
	dxV1OMUUimHNE6dlTNAbQQ7u5Lp7cr4F6p/F5JX01avYM3pUtxffxIA==
X-Gm-Gg: ASbGncviZxB37wimNnH7QGGdWoTnuOJyk27uHD+IDwukDb3N4oYvluJ/E9cmbos02y9
	P84fGZPdmUu1RdplQ/+KJK7iTZsVfj5PK5qDTcG325y9fIqs9FOpKQSv7dSPS9lFpIhqF2PAgYt
	uZ8bdc2joNIdnsHKJkeLcaq4Bll67gxErbrbc2th8d7aWtplpSPcfQ7gYKjJk1AaG4v92du2NQ0
	Scm1a18HGSvYZEzQ4yBEu2Ic6ZRvlbeXp5sx0asknnTookEJHcKlBLzuAaQaoYVv7kXBs3SqQ1x
	IAKBCRggubOu74P1I3YaHz80hFGpNXzHmrHRJUiEd8AtTsvmOBUb5tXjy3w=
X-Received: by 2002:a05:6000:2207:b0:3a1:fed3:7108 with SMTP id ffacd0b85a97d-3a349927544mr3236548f8f.40.1747234073713;
        Wed, 14 May 2025 07:47:53 -0700 (PDT)
X-Received: by 2002:a05:6000:2207:b0:3a1:fed3:7108 with SMTP id ffacd0b85a97d-3a349927544mr3236510f8f.40.1747234073308;
        Wed, 14 May 2025 07:47:53 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2af7sm20184529f8f.52.2025.05.14.07.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 07:47:52 -0700 (PDT)
Message-ID: <c8f14e69-21b2-403b-99a5-b34f4c9dc2c5@redhat.com>
Date: Wed, 14 May 2025 16:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 00/10] kvm/arm: Introduce a customizable aarch64 KVM
 host model
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
Cc: "agraf@csgraf.de" <agraf@csgraf.de>,
 "shahuang@redhat.com" <shahuang@redhat.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "philmd@linaro.org" <philmd@linaro.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
References: <20250414163849.321857-1-cohuck@redhat.com>
 <dadc4acd-97c8-4647-9467-89cd1966a6f2@redhat.com>
 <4fcfb4624f90491ebb238de76f04e4e5@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <4fcfb4624f90491ebb238de76f04e4e5@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AjRcDlow8ST9s_YTR0pehxNrURkfuncEnANRo5w7vPc_1747234074
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: TkmQQmHezeGj



On 5/14/25 3:47 PM, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Tuesday, May 13, 2025 4:30 PM
>> To: Cornelia Huck <cohuck@redhat.com>; eric.auger.pro@gmail.com; qemu-
>> devel@nongnu.org; qemu-arm@nongnu.org; kvmarm@lists.linux.dev;
>> peter.maydell@linaro.org; richard.henderson@linaro.org;
>> alex.bennee@linaro.org; maz@kernel.org; oliver.upton@linux.dev;
>> sebott@redhat.com; Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; armbru@redhat.com;
>> berrange@redhat.com; abologna@redhat.com; jdenemar@redhat.com
>> Cc: agraf@csgraf.de; shahuang@redhat.com; mark.rutland@arm.com;
>> philmd@linaro.org; pbonzini@redhat.com
>> Subject: Re: [PATCH v3 00/10] kvm/arm: Introduce a customizable aarch64
>> KVM host model
> [...]
>
>>> We still have to deal with MIDR/REVIDR/AIDR differences by exploiting
>>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i
>> d=d300b0168ea8fd5022a1413bd37ab63f4e5a7d4d
>>> (in a different series.)
>> Shameer, do you plan to contribute the qemu integration of this feature
>> you developped on kernel side; or do you allow us to integrate it in
>> this series?
> Yes, it's on my ToDo list. I'll first go through this series and then work on
> adding the above support on top of it.

OK. Thank you for your reply!

Cheers

Eric
>
> Thanks,
> Shameer
>
