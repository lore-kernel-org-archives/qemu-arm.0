Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2386290njb;
        Mon, 17 Mar 2025 09:58:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGiSQ2lG23PfDcbo2Ak2N5GQ5hxa82kSmxGhAEtesR5S6y12e4dwSmAjyYI9pfFMP/7MkUmSQuwBNz7w==@linaro.org
X-Google-Smtp-Source: AGHT+IGeiNAumw+YhccNxhgxFhvG9herYKR0u2MAnFuGxXxvXhVHhbdIid2fA+7JGCqQVRaCox+f
X-Received: by 2002:a05:622a:438b:b0:476:b33f:6694 with SMTP id d75a77b69052e-476c815ef7bmr179462141cf.28.1742230702163;
        Mon, 17 Mar 2025 09:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742230702; cv=none;
        d=google.com; s=arc-20240605;
        b=UIspcu5cyRkQJXneZOK8k5+a+dPCemNn50a7Q5HWanm+/5oMilzIZ4n1+ZA9J6i+3r
         Gl4+oqYxNGjS2rIwk4J/SaYfDR8W1dzBpQLacSNkqlZSFj4oJiFNhw23fRvbpbxIzMSi
         f1fH1MaG4NGjIvDldzQQVouCii7HCPaBml5bHGTtVCL9amwH8e7w0Pu65vzOGgL+6sMd
         VFCqAsLM+3Fv683FhRa9KHBJvLKqraRId4bZAoGic11VzRE0adrsU6c8iSqqIxG4YomQ
         Usx1YKUjKTOkyc9wqms/Fuq+/5lUs8eSxzDXTOM8nq6DY+XgSqwCAjkD4/XxiJ/pX08f
         DmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jn0mL8Uy/CFPQop64/UetnBCUzfjhxm2sPZVA0oO3aQ=;
        fh=Y2/6WsZ4EQXQx/Q4+g922Gcvt7gFimEe/KpFOQ0zNao=;
        b=Wo9TnYdXZmSZvyXf6SNCh+5zrmQq51CjPQEDjfGmx8kd4hSoZP4PicaOnxLCLptBYT
         nzeGJRaYPJQqqOMqfglRj6HaVoL1q6nAqv7ArbNxdOLhqanE2n8cxCv/cbPoKVhzSJAt
         1RTTQQhEw8KHUbqRiOfU6om2CNd4M4Ba6nlmPrgFee2mTAZh3ZDUXNb9zaeFjX+HCrBj
         nYHPfgvVcccPmkzZNWkqn04GTlo3aXiNAdpIs8L07oaa200uqaz2mUBkxiHTfDwN+c6G
         xUNOdycleoimSmSSeZ4oC/HRJcrgZ+Dc+fjfdbCsQJQdIxC0EjlACyVeL0NP8Z5U2NQP
         i9fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jNTNIdy9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb64ca6asi100013621cf.150.2025.03.17.09.58.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 09:58:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jNTNIdy9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuDmo-0008Pu-Mg; Mon, 17 Mar 2025 12:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuDmh-0008Ow-ID
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 12:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuDmW-0003yZ-M7
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 12:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742230656;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jn0mL8Uy/CFPQop64/UetnBCUzfjhxm2sPZVA0oO3aQ=;
 b=jNTNIdy9qGJRIuYRHlXsns3Nr8XXkSUPFJ8lSyX0gnes48E8LD5wy0w4r524egeKV5LnC/
 zYYi6CAVgtMeM6xZfYi1CNI/xHelAePtsLWnJWxAIMp7r5Fx3+i7scaG5dxOb3FECWOp8/
 4773fyZpBjlQbNdBOx+SS0s2Mo/cG1g=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-Sr_G-XuXP2aWsVANzmJzsQ-1; Mon, 17 Mar 2025 12:57:34 -0400
X-MC-Unique: Sr_G-XuXP2aWsVANzmJzsQ-1
X-Mimecast-MFC-AGG-ID: Sr_G-XuXP2aWsVANzmJzsQ_1742230654
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c3b6450ed8so823310385a.3
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 09:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742230654; x=1742835454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jn0mL8Uy/CFPQop64/UetnBCUzfjhxm2sPZVA0oO3aQ=;
 b=t1ZTPP8FLMX7+SwkRORqrZoymw1ELVBkz40CYz+WJx34aMCybTlfUZIp3/kF7BbEqa
 QRhvJH20szJJSO+omg7Tt0KXEZgFNPY0olzhdYtasjllBGznx7y+OcgLXlAxrsyP0C4A
 aFHpDjpq0bA+0b0ZoZJ67/JpqM01E+5VnYwBeQczfbIbCnxBX+cStobRMcA69r8RaO74
 UM4fPSOwWJHjJ+Glh1jTngdP9znadU/wDLG6Xea82e7Bnuk4nfu5s8Z0XrG++8skEDkX
 ohuX5VEM1BmonIE6YyzxvwORbOMK5rOEWC5iw2lKUNtXNq3hKe2ofu5Mq+eksKhzzR5F
 tm5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPJipffmaKH8XHJ+3hylWZ24f0ZqMJpJHQDxSAPU3C+7NykOlk2hqC8tz+zN3HargFy+wtDdiRag==@nongnu.org
X-Gm-Message-State: AOJu0YzRw/QrC8eTpP2q+DCxPKhwgE1ojENMwaayDOGo3tWoZp9PY8SW
 cT7IwZ8wgkg0CGkdg/H5/zUqrJfMcrCBLzmx0l30O8qrFQHbCz3R5tDd8a2qHaW3+mMKP3o24Vi
 HzJJJfjsDHgVVYgrJVYxNjJzAaL5PPkECdDb6T3BZHtIdwadDNg==
X-Gm-Gg: ASbGnctHgdcmx6bk7csRTkuXhqh8va6kKD7XHrj+ZOaQUYc6vNwime0yUF36DvqNfFr
 O631TQYuLSREiUJjmNKad5MoTg4IMay51ZkHEP0b0T33Z/nz4AUWkchc8W7bY12Zg1jhWMTob/x
 vOl2Pw601Vza+yYc0Gn0v73VqNwJ2kn0kcpNe/8ULRw/Rj+PXZdwZ4u8jYoyMmukbOc2mOzXTh+
 J4pI6hMimkbFt13mZgDe9SRzLzicxqJHD667IoO7zvOA/ps/Xd06+xbqv6f2EvDf8uQBZvtrxYp
 3OZ8+jgMt/1ArS88dPgmgzzFMC2ujGHxr2N9YtEeL6BFKwx5EsIBa49exZ8dT7I=
X-Received: by 2002:a05:620a:404b:b0:7c5:7a1f:4d89 with SMTP id
 af79cd13be357-7c57c8fb866mr2432198485a.54.1742230654044; 
 Mon, 17 Mar 2025 09:57:34 -0700 (PDT)
X-Received: by 2002:a05:620a:404b:b0:7c5:7a1f:4d89 with SMTP id
 af79cd13be357-7c57c8fb866mr2432194485a.54.1742230653756; 
 Mon, 17 Mar 2025 09:57:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c573c4dd9fsm613080085a.4.2025.03.17.09.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 09:57:33 -0700 (PDT)
Message-ID: <829ec481-b380-4d41-b441-0c4ee81ae1f9@redhat.com>
Date: Mon, 17 Mar 2025 17:57:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-pcie bus
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-6-shameerali.kolothum.thodi@huawei.com>
 <79bcc36c-1a12-4b18-a54c-afe734d6bef0@redhat.com>
 <9ffee8119fc441aeb760073c5f152fa4@huawei.com>
 <5fcaf9ee-4c95-400d-a641-20e0f17be87b@redhat.com>
 <c0048ea814ed46278804621753a3a78c@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <c0048ea814ed46278804621753a3a78c@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UyYk6kKCWvLcULxog2UYT9eFAMHI1orl-0ufGpmLDDY_1742230654
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.335,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ddf8Qy/RQmkg




On 3/13/25 9:22 AM, Shameerali Kolothum Thodi wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Wednesday, March 12, 2025 4:42 PM
>> To: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>> qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; jgg@nvidia.com; nicolinc@nvidia.com;
>> ddutile@redhat.com; berrange@redhat.com; nathanc@nvidia.com;
>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>> Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-
>> pcie bus
>>
>>
>>
>>
>> On 3/12/25 5:34 PM, Shameerali Kolothum Thodi wrote:
>>> Hi Eric,
>>>
>>>> -----Original Message-----
>>>> From: Eric Auger <eric.auger@redhat.com>
>>>> Sent: Wednesday, March 12, 2025 4:08 PM
>>>> To: Shameerali Kolothum Thodi
>>>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>>>> qemu-devel@nongnu.org
>>>> Cc: peter.maydell@linaro.org; jgg@nvidia.com; nicolinc@nvidia.com;
>>>> ddutile@redhat.com; berrange@redhat.com; nathanc@nvidia.com;
>>>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>>>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>>>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>>>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>>>> Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a
>> pxb-
>>>> pcie bus
>>>>
>>>> Hi Shameer,
>>>>
>>>>
>>>> On 3/11/25 3:10 PM, Shameer Kolothum wrote:
>>>>> User must associate a pxb-pcie root bus to smmuv3-accel
>>>>> and that is set as the primary-bus for the smmu dev.
>>>> why do we require a pxb-pcie root bus? why can't pci.0 root bus be used
>>>> for simpler use cases (ie. I just want to passthough a NIC in
>>>> accelerated mode). Or may pci.0 is also called a pax-pcie root bus?
>>> The idea was since pcie.0 is the default RC with virt, leave that to cases
>> where
>>> we want to attach any emulated devices and use pxb-pcie based RCs for
>> vfio-pci.
>> yes but for simpler use case you may not want the extra pain to
>> instantiate a pxb-pcie device. Actually libvirt does not instantiate it
>> by default.
>>>> Besides, why do we put the constraint to plug on a root bus. I know that
>>>> at this point we always plug to pci.0 but with the new -device option it
>>>> would be possible to plug it anywhere in the pcie hierarchy. At SOC
>>>> level can't an SMMU be plugged anywhere protecting just a few RIDs?
>>> In my understanding normally(or atleast in the most common cases) it is
>> attached
>>> to root complexes. Also IORT mappings are at the root complex level,
>> right?
>> Yes I do agree the IORT describes ID mappings between RC and SMMU but
>> the actual ID mappings allow you to be much more precise and state that
>> a given SMMU only translates few RIDs within that RID space. If you
>> force the device bus to be a root bus you can't model that anymore.
>>
> Do we really need to support that? What if the user then have another smmuv3-accel
> in the associated upstream buses/RC as well? Not sure how to handle that.
Well I agree we would need to reject such kind of config. Maybe we can
relax this requirement and connect the smmu to a root bus (including
pci.0 though). Then this SMMU would translate all the input RIDs. This
is not as flexible as what the IORT allows but maybe that's enough for
our use cases.

Thanks

Eric
>  
> Thanks,
> Shameer

