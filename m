Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1528876njc;
        Wed, 21 May 2025 16:54:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1HVfVY7lB6kezXCyv6CHlyZg88ArPBQd0mLEwsHAEYRddvU8fFEGCCmeKjbvWNwPKy2aeEi1rpoBTig==@linaro.org
X-Google-Smtp-Source: AGHT+IH9/Pzz/+mp9t8GckHwULJHyVUBbSP+Ijlhjps0pA/zwObpj9P+doKF6ZQN4qQLSW2V8yi8
X-Received: by 2002:a05:6214:dc4:b0:6e8:c713:321f with SMTP id 6a1803df08f44-6f8b2d9e07emr365700636d6.35.1747871661904;
        Wed, 21 May 2025 16:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747871661; cv=none;
        d=google.com; s=arc-20240605;
        b=Nh35RjL6uMj5ZOed8wdpfC9JVPx2d2rOzMVchCui+YDTxgw2PkSIuAmFQi/OZyb4SI
         Uj/aZi4aeRqO/9WpVRd1mQqqLDnK24kLZxXNVvXhJBNFL6RW1D8gaBCJsg/ZhxFWWMEY
         uy+tuBJW2ZNhTlnchMvKJaxASMX2Xxxovti9Fqyt4CHvbC3vbaUbiMBr6fHoUCxKaZQR
         +ukrqzMH84tGma/0iVjDe7vAnM7wkA5CfM3jET3dWpgN7rlMPiXAHV8uqsa3B9KqR8zA
         TXBW6kF3uZjWIWUFH89J/TEjekKdmvGBIZG6BA3tL6Ia5sdps4Jnf3AF6EhKnDvUJTcs
         KVYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6aIEsADfMxGCubH6K//UVxoho4gM0V5AfnS6wwT1cj8=;
        fh=d8xtuN/Zlo2ccE1bA5ScwH52MF+1e6r0b2wxyjaD5ZY=;
        b=Mh9+yNlY3ExUCqCrvo9omkx9woDEMh/4WWAneNQ0uyCja89zRHZeFYiFY4XpqtxvgM
         l9zT6BclE0Lmy9PyPRPLwQpPW3c6Ma+pMW6G5MzHnEl0yATr3bD/cUQScgpHLqLKV16J
         NWYva7H2piTmaKgHJFozSU6wuRh6CZwCU7V72gl6ioPKLi0mBnuQ+PgrMp3E1uIPkkOV
         eEZzGqfnaSSNH0EqIyMzH5hwAhZlNEpZ2JV/ajFr9r1Jy3Ae+Nv4oUJZ1wBmBGd8hLg/
         1Ve6caiU9YcG7n3nU1G1UbPF3/LqXZMFNMohYLnLW/SHfZmACyYAu63b+Oqg1iMcpkoT
         pnOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T2q4X3g8;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b08a0a18si146905786d6.49.2025.05.21.16.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 16:54:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T2q4X3g8;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747871661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6aIEsADfMxGCubH6K//UVxoho4gM0V5AfnS6wwT1cj8=;
	b=T2q4X3g87Nl93Wz/jQgxdVRdmmexEt/4B5T90Hj3Kq3GMxeKzfa84Yp7XoE2L1jW39MMJP
	neYzrcD9uzdrSJj5koLHfzqU1Ng3+N6oaRsE4JXevJDC6gWWxGy6ASPrJ/pSrzv4eDmBt/
	5M/+CI2a04vSOm8h1qjrgnrawmwjIi0=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-RbwbycyZPz-_STTMfFBg1Q-1; Wed, 21 May 2025 19:54:20 -0400
X-MC-Unique: RbwbycyZPz-_STTMfFBg1Q-1
X-Mimecast-MFC-AGG-ID: RbwbycyZPz-_STTMfFBg1Q_1747871659
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-73dcce02a5cso4697405b3a.0
        for <alex.bennee@linaro.org>; Wed, 21 May 2025 16:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747871659; x=1748476459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6aIEsADfMxGCubH6K//UVxoho4gM0V5AfnS6wwT1cj8=;
        b=liqKQDSjZPSN1oKgEvnu7zUARFZlVPP/2yGX1qughhh5VoWydv0l3zW8kENASnR+KF
         RC+AiMuI4rMEY3hwHUKZLTeE8Y1WowhxtdpCrGGdNZbtwWK+FuBTv3TABjSZ05bo+2jA
         EI5kLdmCzpanIXj35hSphZowIzrnkjDzW+U35BfD96WdpktV7F5BOzjbNPK0NKKExHYJ
         ilu+CR24okhXyeIqaaNa46XT9LniFRA/dXUxAB8AC/b6YxND5xNNGNKMrtdUILwgzZFE
         GZWMwA0hHvSt+6vJ1fy5KEPkWdDB2Hk8/XqGOtscV/OQkxW316RLpxSpXqVEYYdRLzX3
         ZVyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHYZqgw94+tYwHgTtARGOg4uGt+wy+dw+wmbPClxC/edc/lyfS2MLLhWfZ+oX0/W10v7dpPDUtj+8tlw==@linaro.org
X-Gm-Message-State: AOJu0Yyt4dAnV1YIOv6pujIeQyNl2n2NCs/Vrm/EWehh+xJ3fNUUh07e
	4PHzyXbZgVvXtDSPJ6Q5S7B50HbaTzFPvKen58RV7ePjgNFdp7kZoh+sMiQL7U/lS8FZLYXKbzh
	DizgYsothHcVWNeZA6rGtQSHsilmoT4IjGCUXOCuqQdOZhPvekJy7iWNPqg==
X-Gm-Gg: ASbGncuEhovfFX4kjd2u3xSB6JZav2UPhiTxPLGWpWiK0uxrSXb8QGori0HqjZBZv/W
	w+V3zLlvvJ9chCTKoFn/8wKpAQGo5qCXD5SyPtxuefey6xbBpk3Al5hkmyYj4yOANG+3lXgXKMl
	YJDbiz+j6zEpU+PsaejvSMHXckRL5hl1GndB9gzNL0h5WOO+fgl2ZoRXZNQxSnq54oq/dz0w7TG
	vCyZKlBIS8+6NdJe/XGXczQCe6BUbCGfjDFhY8LFGZ6O7m4VPR6yTJDqcoif4uVzr3ghoiBOTXr
	vzXhMVkEKUEM
X-Received: by 2002:a05:6a00:4b05:b0:736:3c2f:acdd with SMTP id d2e1a72fcca58-742acce2deemr31040340b3a.14.1747871659078;
        Wed, 21 May 2025 16:54:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b05:b0:736:3c2f:acdd with SMTP id d2e1a72fcca58-742acce2deemr31040287b3a.14.1747871658676;
        Wed, 21 May 2025 16:54:18 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ad2sm10537063b3a.93.2025.05.21.16.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 16:54:18 -0700 (PDT)
Message-ID: <0d1208fa-9fca-4b4b-bad0-8b596d5102fb@redhat.com>
Date: Thu, 22 May 2025 09:54:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V5 00/30] Support of Virtual CPU Hotplug for ARMv8
 Arch
To: Gustavo Romero <gustavo.romero@linaro.org>,
 Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Auger <eauger@redhat.com>
Cc: maz@kernel.org, jean-philippe@linaro.org, lpieralisi@kernel.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
 peterx@redhat.com, eric.auger@redhat.com, will@kernel.org, ardb@kernel.org,
 oliver.upton@linux.dev, pbonzini@redhat.com, rafael@kernel.org,
 borntraeger@linux.ibm.com, alex.bennee@linaro.org, npiggin@gmail.com,
 harshpb@linux.ibm.com, linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 shahuang@redhat.com, zhao1.liu@intel.com, linuxarm@huawei.com
References: <20241015100012.254223-1-salil.mehta@huawei.com>
 <b65590b1-8a6f-43e5-b367-732d6305c095@redhat.com>
 <429a8131-2b59-4800-891b-bcfbc6e44737@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <429a8131-2b59-4800-891b-bcfbc6e44737@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M5jxp0GVqBPl3ihRMT-B2kmJRUXFuXwFjy-OZnv5UeM_1747871659
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: b8eZb1fZFN/+

Hi Gustavo and Salil,

On 5/22/25 1:06 AM, Gustavo Romero wrote:
> Hi Salil, Gavin, and folks,
> 
> On 5/20/25 21:22, Gavin Shan wrote:
>> Hi Salil,
>>
>> A kindly ping. vCPU hotplug is an important feature and You has put so much
>> energies and amazing efforts to enable the feature from QEMU side, but it
>> seems it has been stuck recently. I received many messages from Redhat
>> internal and external to ask if vCPU hotplug has been supported on aarch64
>> in the past. So I'm heading up to check if you have bandwidth to continue
>> the effort, any kinds of helps are needed, especially from me.
> 
> You can count on me as well, Salil. I'm definitely in a better position now
> to help you with the technical review of the series, and I can also weigh in
> to help resolve any remaining issues so we can finally get it merged. Don't give up! :)
> 
> My suggestion: go ahead and post what you have now. Just highlight the main
> points of objection raised in the last review that still need to be addressed.
> 

Thanks for your response and to offer helps. Another suggestion I have in mind:
if there is uncertainty regarding the design, it would be nice to post a specific
thread for discussion until it's cleared prior to diving into code. After the
design is acknowledged by maintainers, our life will be much easier. The point
is to get enough attentions and feedbacks from the maintainers until it's
acknowledged.

> 
>> Besides, I'm reluctantly to ask if you're fine for some body else to pick this
>> up and continue the effort. The credits for all the contributors (Keqian Zhu,
>> Jean Philippe, Miguel Luis and you) will be kept.
> 
> I don’t want to speak for others, but in my view, Salil should ideally be the
> one to complete this work — as you said, he’s already invested a great deal of
> time and energy into it.
> 
> It would be tremendously helpful if maintainers could support Salil in bringing
> this to completion, kindly guiding him toward the path to get it finalized.
> 

Absolutely, Salil knows all the details, especially the historic steps how vCPU
hotplug has been evolving. I truly hope Salil is able to continue the efforts until
the feature lands upstream!

Thanks,
Gavin
