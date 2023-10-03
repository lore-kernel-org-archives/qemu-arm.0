Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1753857ejb;
        Mon, 2 Oct 2023 22:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOAV+6BBrFQyJAxm29suNirkA52mqjlg+KFvyF0nMk9WRLOcrPZJxkrJgqY+ggdMC+LIuo
X-Received: by 2002:a05:620a:3846:b0:774:10ba:e9b8 with SMTP id po6-20020a05620a384600b0077410bae9b8mr12183311qkn.72.1696311586539;
        Mon, 02 Oct 2023 22:39:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696311586; cv=none;
        d=google.com; s=arc-20160816;
        b=F9APEJ2/jwU0Bz28b6ba9J1Hbai44bB1bRrg6oM7y7gOfn5NSeAnvyrKmiFJonXBYd
         Ps0NUFXj2MgOfm+lZFFa62+ZDJf5y1qerAgakC42TqhVoQ0ueLSRpwvBwuDPn3IZD7Ie
         +Tw0HpZwTgCfdT05jTUurNxagGNT6Aa4GJ83bMtZou3VzsqYfU6437a4Fr6x6r+FDNal
         tLD8gWDBu3zUCvlc5cSEzYimgrdaU1z58vu28ZXyn0ryi1tlzA9Of67dYHXRsLtd2YJP
         gL29P3yNM77TWjy/1bEeMlZn4bje9tUnEnQWoGjSg/giHRNtTLhBvc77d2hm9SDjL9px
         0CeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tQwXNFD1mmfjoJgOAPuBsqjLKn6rTm/R5yvDWHsaB84=;
        fh=fuJwIdfu8VPP6GfXn3BVoTVIzyX31MQ6OANRO+kwzA0=;
        b=RwPEN1k7W+zBEWPO83oClmbUfhDb2e5525UVxUCUc5VVrqOp67zNcnv7qzmGbz6lQA
         urljoP6t1co2tP9mu3TsHjP0hZsE1eHlCtu88Oj75ftJvO92lF7mncycBKjNXCUqdtym
         78HrLmYqdkD4yLRUbBSwp30XaUzB4DQcE7UzfWxJ+uSZNpPU9Iu6saxrWWGXa9CQxwgM
         Q7+tStOtE8gY44gFtC/gIOH5PVGEAX6OjzuCd9AsDG2Pb2yhrS1jdOHigqBeycgCRPhc
         baZyJa6mrhssDVSLuu9qFrk6xKj0h8XadghZ+uCJZ8L3TKXTzFNcNP405aFG4MuN+nSO
         8KNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JPhmKkgs;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id az11-20020a05620a170b00b0077074ac99besi202841qkb.763.2023.10.02.22.39.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 22:39:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JPhmKkgs;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696311586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tQwXNFD1mmfjoJgOAPuBsqjLKn6rTm/R5yvDWHsaB84=;
	b=JPhmKkgs3NJEkYLbWYB2Ib0Rf1brE0fXHMH/cYg0V4Qf6NfRul+v+g1dBoDT6SLBBAw61g
	pQ2ymOCyVvof+ZhKA9Pvv4Y7JSgI5NFKIeg3GB7EI4CcsHaIt+Punou+4iIlZZt8jeTYWv
	JnDr8i3zAHTqv7rnlAOOl3LoeGXx65U=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-3xwLWsdKPLqy2kt_QSlZIw-1; Tue, 03 Oct 2023 01:39:44 -0400
X-MC-Unique: 3xwLWsdKPLqy2kt_QSlZIw-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-574155a12d9so295511a12.2
        for <alex.bennee@linaro.org>; Mon, 02 Oct 2023 22:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696311584; x=1696916384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tQwXNFD1mmfjoJgOAPuBsqjLKn6rTm/R5yvDWHsaB84=;
        b=u1DXfm0Zsa7/fcccYxngSyuMkxp+qEhoW4y0GNI/BV6+EuM3JmuqWcJaRHlBBU5wUm
         UOWKJvqWy8oubegvXzPq8y9xCClawWGlziji++LgyOFcTDY3bd4vNkmiM8/MO5t0Vghj
         RbTuYyFgk62gWDh45IeB4pfXOn8r9IKCE3H8BZwYBfEv8PwgQc9wmdVJGeX+kDt3K0Bp
         ckmicjMe/vM6WZDkZ1/wDXwx7u9UvjgMuFsGb/mD5YC3Hx49aUcOgDq1kBL1/7Id5ggD
         ytTxS2Gs2M17kScCXooWfOvpokbKwmK7/HUmJGz1JF1bR5Fc0X5T5W56oPHzoDOnSD/B
         i8Qg==
X-Gm-Message-State: AOJu0Yw0b3UrEFbLn5qYFY7EgMKexmw3O4hBtiHcJYV2RRfSF/m9mwyZ
	SLYkg2P42iHH0ul4CeVD+qU3Lz9lwN2xP+q8jZ5cbZhj2j3V8pMdmo6Mauwd6le2oTOkUzD/qL3
	Yt0sWrnnmII0ekyPU
X-Received: by 2002:a05:6a20:158e:b0:159:b4ba:a5bf with SMTP id h14-20020a056a20158e00b00159b4baa5bfmr13579887pzj.13.1696311583908;
        Mon, 02 Oct 2023 22:39:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:158e:b0:159:b4ba:a5bf with SMTP id h14-20020a056a20158e00b00159b4baa5bfmr13579866pzj.13.1696311583614;
        Mon, 02 Oct 2023 22:39:43 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id z18-20020a170903019200b001c72f4334afsm471544plg.20.2023.10.02.22.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 22:39:43 -0700 (PDT)
Message-ID: <dafa4d84-4e23-6bb9-fa33-17861c28ee4a@redhat.com>
Date: Tue, 3 Oct 2023 15:39:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC V2 05/37] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
To: Salil Mehta <salil.mehta@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "rafael@kernel.org" <rafael@kernel.org>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
 "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
 "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
 zhukeqian <zhukeqian1@huawei.com>,
 "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
 "wangyanan (Y)" <wangyanan55@huawei.com>,
 "jiakernel2@gmail.com" <jiakernel2@gmail.com>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>,
 "lixianglai@loongson.cn" <lixianglai@loongson.cn>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-6-salil.mehta@huawei.com>
 <d58c51d2-53e4-3873-7c87-c6ccc3025ed9@redhat.com>
 <2a1d9be1afb54290b6b0e4a54711e030@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <2a1d9be1afb54290b6b0e4a54711e030@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: d1KXuNtVRXaH


Hi Salil,

On 10/3/23 02:20, Salil Mehta wrote:
>> From: Gavin Shan <gshan@redhat.com>
>> Sent: Wednesday, September 27, 2023 7:52 AM
>> To: Salil Mehta <salil.mehta@huawei.com>; qemu-devel@nongnu.org; qemu-
>> arm@nongnu.org
>> Cc: maz@kernel.org; jean-philippe@linaro.org; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; lpieralisi@kernel.org;
>> peter.maydell@linaro.org; richard.henderson@linaro.org;
>> imammedo@redhat.com; andrew.jones@linux.dev; david@redhat.com;
>> philmd@linaro.org; eric.auger@redhat.com; will@kernel.org; ardb@kernel.org;
>> oliver.upton@linux.dev; pbonzini@redhat.com; mst@redhat.com;
>> rafael@kernel.org; borntraeger@linux.ibm.com; alex.bennee@linaro.org;
>> linux@armlinux.org.uk; darren@os.amperecomputing.com;
>> ilkka@os.amperecomputing.com; vishnu@os.amperecomputing.com;
>> karl.heubaum@oracle.com; miguel.luis@oracle.com; salil.mehta@opnsrc.net;
>> zhukeqian <zhukeqian1@huawei.com>; wangxiongfeng (C)
>> <wangxiongfeng2@huawei.com>; wangyanan (Y) <wangyanan55@huawei.com>;
>> jiakernel2@gmail.com; maobibo@loongson.cn; lixianglai@loongson.cn
>> Subject: Re: [PATCH RFC V2 05/37] accel/kvm: Extract common KVM vCPU
>> {creation,parking} code
>>
>> Hi Salil,
>>
>> On 9/26/23 20:04, Salil Mehta wrote:
>>> KVM vCPU creation is done once during the initialization of the VM when Qemu
>>> threads are spawned. This is common to all the architectures. If the architecture
>>> supports vCPU hot-{un}plug then this KVM vCPU creation could be deferred to
>>> later point as well. Some architectures might in any case create KVM vCPUs for
>>> the yet-to-be plugged vCPUs (i.e. QoM Object & thread does not exists) during VM
>>> init time and park them.
>>>
>>> Hot-unplug of vCPU results in destruction of the vCPU objects in QOM but
>>> the KVM vCPU objects in the Host KVM are not destroyed and their representative
>>> KVM vCPU objects in Qemu are parked.
>>>
>>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>> ---
>>>    accel/kvm/kvm-all.c  | 61 ++++++++++++++++++++++++++++++++++----------
>>>    include/sysemu/kvm.h |  2 ++
>>>    2 files changed, 49 insertions(+), 14 deletions(-)
>>>
>>
>> The most important point seems missed in the commit log: The KVM vCPU objects,
>> including those hotpluggable objects, need to be in place before in-host GICv3
>> is initialized. So we need expose kvm_create_vcpu() to make those KVM vCPU
>> objects in place, even for those non-present vCPUs.
> 
> 
> This is a patch common to all architectures. The point you are making is specific
> to the ARM architecture. This patch is now part of the common patch-set. Here,
> 
> https://lore.kernel.org/qemu-devel/20230930001933.2660-1-salil.mehta@huawei.com/
> 
> 

Yes, reviewed it again. Lets have more discussions over there.

Thanks,
Gavin
