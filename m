Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp458036njc;
        Wed, 12 Mar 2025 11:31:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW5CDmUG8ruZuai04+Etxyvp5z7StwOHjhBjLNBysq6BZOh5sUJSm1uN6rJodugtYzp5V7A9Jsr9thHhQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHDWw1NZKl0PmrIcKn5MaMDiGW+ZWKZ+rSAz0SZTguoUIv/5fsdNmZlC+jg1IrLRhmaSzm5
X-Received: by 2002:a05:6102:291e:b0:4bb:ba51:7d47 with SMTP id ada2fe7eead31-4c30a52a05dmr14685925137.4.1741804265129;
        Wed, 12 Mar 2025 11:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741804265; cv=none;
        d=google.com; s=arc-20240605;
        b=Se9gy86nP1Lk8VBnapPZVgB0qAZBcFaCIHrjDElikynl1sMjD5YKzMA8I9d2yAiBSd
         JAnAk+Ml3xNsZZpmTwtNZEZlqDK4I5ozUYCseutqscJCEjbsq4vmeEWXLs3rn1aKqUCX
         OmlMKgKaCHYhUxNCNk8pHlmjk4VL+E1csE/Q2tAH+mevg79jRFM/UEomaA0QDrim9ooa
         EAx7ZUJhlbif6A/7Haktz68ryI6Z1784ufkaQ9mvT7f0+M50+0eBoFD3yIS38xZ6q8zC
         IdDaTdvlODHyG0GFG0dckmDJs4QhkJB15Jz1tZUGxKDAcSCvaIDn3pOoztD0SAtShoVn
         eL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CWORE9gkDVvMOWO7MsPN5L11w6mKMTpxSYPB9jqPXZo=;
        fh=IgZqmnBKjb54OCUSrZXFVzCkCNmLLS581C1XS9VAKPg=;
        b=CU7A4z77ikERMTNnhJOJVrtNOL1qg0w0DBCGQc9HA5YDWcfjj1MOpCjw81U+zGaNgA
         Dw1HC69pNmB2kYUHBnPIrqOToBxCpNuVpe2ccpmQiuMbkPgUawAfB7RY3VLbbJiey0Rh
         AOh+jwS0FDVCH9DbU80Mia5B+/8a+xhHv+o33MZc5BOERZUoxs9lUG26/idCOc3JuSU6
         JpDHg6W6uYdJke8YSyjROKxT88367xdXAKvcwBERdnWNWNfB701TOZlBHSSK6zagmCN5
         rwTmEt15VVGfBhna/Khi5jtTXqUs8raFMNgTRsl8VfZnLJaYtsvqWDNTahRsQckAEe0y
         w/qA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tzge2VQS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c2fbc78e3csi3816157137.345.2025.03.12.11.31.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 11:31:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tzge2VQS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsQqx-0007iR-5M; Wed, 12 Mar 2025 14:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsQqo-0007g5-1E
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 14:30:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsQql-0003WO-Vw
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 14:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741804237;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWORE9gkDVvMOWO7MsPN5L11w6mKMTpxSYPB9jqPXZo=;
 b=Tzge2VQSKZltUC1tfm748p3xck624VhzMDWLxknZ7yo7+EBhZMhOjZ2+FVACDySBms2gFA
 OivGI02h+qQb9Zigx/FhR4AiBLeUYNLm6cbVmVcv4FzC6xl5fbcanFHVhwOiZ7PAV4nBdD
 FplH5ynyoS1LF1qYIAGsF0zuVGCSDVw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-6ZdXgLmiMd-Tkqk8zocXdA-1; Wed, 12 Mar 2025 14:30:35 -0400
X-MC-Unique: 6ZdXgLmiMd-Tkqk8zocXdA-1
X-Mimecast-MFC-AGG-ID: 6ZdXgLmiMd-Tkqk8zocXdA_1741804235
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8ffb630ffso3665216d6.1
 for <qemu-arm@nongnu.org>; Wed, 12 Mar 2025 11:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741804235; x=1742409035;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CWORE9gkDVvMOWO7MsPN5L11w6mKMTpxSYPB9jqPXZo=;
 b=O8rs7b0+es9cHz0bWJMcsmiEUQkLMAqovov0hwa4kEISnkVs16dX9a/n6CA5uxJDsb
 l9h3V5/pj81bNBx09fojFTcAL6ymD6gvR0ZA2UrIU0wS9efNysLG59UJ16ZmwG5xzygH
 bGUmq47380yRmJSY64o8AWmHdnk38A3jB9wn45d/OgksWuLHj/jnJPlYK/wDvHPSjLWB
 pVLlCH5e1iM8yOehB8iFAp23J5pyDSfUjnovVFLVD/woOI+F9iBYwYmoIsCWaMT1qs/m
 cH34xwxvMnRHP0e7FDkYw8UBt5UQzcqpHIz7scfxk9v3RIk6NJ4mTXgl1PO51le1RhZK
 9Pww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVki7P5j32fDGlQTKL0Z0BQ0bBr1vGDGkfZH7BEDaMkOUpUZnWVvgWbpfMF6hzbq9r+ROPWPxxFg==@nongnu.org
X-Gm-Message-State: AOJu0YxLf7FYgxijUxVLRkfcK3EviZ+mOagYxVTxsocrwX5wXferE2eP
 +QES9K1BM0dQ9OtInNd67PXSQjfjky1ehKqbWUex3R/5xsIuyHF98X6OGQGom5QRLR4Luc1ur31
 tNSMOydgjXxnnXf3hnDWYi6wH3XR10yKUQXHyuB517HuDyy3vgA==
X-Gm-Gg: ASbGncvR3OGbHS4Uipb4nG0YXtgi4RfpWzJN+8mDMP8GcjYdilI8ctBzL3pYog0YkBV
 +pkA1VtzFudR1FVDizZVpFFgj6Zhv+d1MFQekjsPWxQJRSmtlba/W1+tu1EJRkbR70LnT/S2e+w
 x7J8OYoCKbgriX2lymP46CtgS4HzULhvFf3vAYV48dGwMiRoHWzvb3ybCx+njGj2zkwTHX54Orf
 1OraIKYMxtMWskUdm+cAiqohQ1J0wRVvVEHKaHM7qrb+OVzYAs3NJecwOg2Ug2yePTno19/UsvG
 F8SFLmHKha+fcfnwOZl2kV8IKK9w4sbMdJgsjT3RC13XgrOA5X2aCspHTeR1TcM=
X-Received: by 2002:a05:6214:180d:b0:6ea:d033:284c with SMTP id
 6a1803df08f44-6ead0332c18mr47557656d6.0.1741804235221; 
 Wed, 12 Mar 2025 11:30:35 -0700 (PDT)
X-Received: by 2002:a05:6214:180d:b0:6ea:d033:284c with SMTP id
 6a1803df08f44-6ead0332c18mr47557296d6.0.1741804234928; 
 Wed, 12 Mar 2025 11:30:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e8f71709b9sm87526576d6.115.2025.03.12.11.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 11:30:34 -0700 (PDT)
Message-ID: <df336b78-5a0f-450a-8d3c-95326f5eb9a0@redhat.com>
Date: Wed, 12 Mar 2025 19:30:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 04/20] hw/arm/virt: Add support for smmuv3-accel
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
 <20250311141045.66620-5-shameerali.kolothum.thodi@huawei.com>
 <547f961e-380c-4ffe-8b8b-3e9d543aa702@redhat.com>
 <58c9c37876c64584b0c7961ec61696a3@huawei.com>
 <5b29ea01-1b86-4b48-a769-14986751a0f1@redhat.com>
 <5d894a546d3f4081ac2cfe98bd2ea612@huawei.com>
 <fb28c228-0c78-4412-ba91-a62cb4351793@redhat.com>
 <8490942b9428411e858a62a80ea12530@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <8490942b9428411e858a62a80ea12530@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DvVvu6fgcbw5dAsETTtyNXNEZmEsHUvd0HIyAJqGMYA_1741804235
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: QxWp0o0+Y6+h

Hi Shameer,


On 3/12/25 6:34 PM, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Wednesday, March 12, 2025 4:28 PM
>> To: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>> qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; jgg@nvidia.com; nicolinc@nvidia.com;
>> ddutile@redhat.com; berrange@redhat.com; nathanc@nvidia.com;
>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>> Subject: Re: [RFC PATCH v2 04/20] hw/arm/virt: Add support for smmuv3-
>> accel
>>>> Hi Shameer,
>>>>>> I know there were quite a lot of dicussions on the 1st multi
>>>>>> instantiation series related to the way we instanatiate that device
>>>>>> and maybe I missed some blockers but why wouldn't we allow the
>>>>>> instantiation of the legacy smmu device with -device too. I think
>>>>>> this would be simpler for libvirt and we would somehow deprecate
>>>>>> the machine option method? would that make a problem if you were
>> to
>>>>>> use -device smmu,accel or something alike?
>>>>> Thanks for taking a look. I am just jumping on this one for now.
>>>>> Yes, there were discussions around that. But I was not sure we
>>>>> concluded on deprecating the machine option. So if I get you
>>>>> correctly the idea is,
>>>>>
>>>>> if we have,
>>>>> -device smmuv3 it will instantiate the current machine wide smmuv3
>>>>> and for -device smmuv3,accel this device?
>>>> yes that would be my preference.
>>> Ok. I will look into that in my next respin. A quick question. Does
>>> qemu DEVICE model support the differentiation like above easily? Or we
>>> have to manage it with properties?
>> Not sure if I understand you question. I meant it can be a boolean device
>> property (DEFINE_PROP_BOOL) smmuv3,accel=on
>>
>> No?
> Right. My query was more about any hidden Qemu magic to have device instantiation
> similar to what we have at the moment even though we name both devices "smmuv3".
>  
> That way I can keep much of the code rather than checking "accel" property
> in SMMUv3 code and redirecting calls. But looks like not. 
I don't think there is any such a trick.

Having the legacy device (without accel) only instantiable with the virt
machine option and the new accelerated one only instantiable with a
-device option looks strange to me. By the way they model the same
device so I think it makes more sense to use the same device with an
option.

Also do you see anything that would prevent the acceleration enhanced
device from being able to translate emulated devices as well. Ideally
the smmu device should react differently depending on the device which
is translated. I think it worked with the original implementation as far
as I remember.

Thanks

Eric
>
> Thanks,
> Shameer
>
>
>
>

