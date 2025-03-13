Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp1017453njc;
        Thu, 13 Mar 2025 08:23:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfXIt63SlJTVqpi/QbZ65R95Q78U69R1HVtA/ClcktfDFC2lJ+pNlvi16z7Ufy8pC9qNhL8oa0R1QhtA==@linaro.org
X-Google-Smtp-Source: AGHT+IFC5IifAExvwRgeFYN7HUq1N8AaCQP5oMKC2XGLy7gjly/ZYa+3DFJMmionniuNMgZEvbUj
X-Received: by 2002:a05:6214:319a:b0:6d9:ac3:e730 with SMTP id 6a1803df08f44-6eadded9779mr49218516d6.5.1741879387358;
        Thu, 13 Mar 2025 08:23:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741879387; cv=none;
        d=google.com; s=arc-20240605;
        b=Yi1BWTDIKN9sXQB1R8LpWDpaIPaDmJHVCtBJmW3IxbE61JhoYbQnJo4st2AALnDDA0
         nBodP1E4BjBJYBCfOrvLBaaVq1K1n7h3cs/APpQgJ6vR/1oT1q/bgaA3Ci8lyAO0Fz8F
         ulEU7tKHw7yvJVTQTzs/GG2G/klo5AKyVXpazeP6DkqH2DJmritALruCzXVea5xipqPH
         RDcvj+al0mjkfgXiazKZGJUYDgynyIjYIpMoyoJOdXk1ADT4BQnCKsOO2Nw7m2sooEly
         s9Gy2ltTnOHtMvIpD64AatNpB6mLmN8sMIUfu0naiNFFgPOrzmFwOtiSs99+W0OHvJr4
         PgDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EZP3EINMiau0DOh25+wD2QEqLTqxWivDHuODrVbyHUE=;
        fh=piVsmnc5T4GCq+Bjk0sUJ+AitJDfyeSW55IhS36b0GQ=;
        b=JFNLXwsIulXWR2x9Lsbk8pfOa94bdoPnnvUvWE4l1o3MeQNmKX6crt5Sabt96KDxJ5
         OI2tFm4e1G+XXtGuLWujXnnF3QoQfSYzUlSF1L/CxjhE1NMkQFYIlW2LPaxFNKNHIXGx
         b/BCWz7Cj8RdU9RJg+7+wZImS3GUFXvKd1nV2GsjUS3iuMohMT9HXHbmxHWMcXQSEIYo
         IJKWnplQPKFHUdhK9xLzwZjsDVDibO2dYSBItqOZM8+nHIo+WuE6ITIrRdzvN4XpDvCx
         BKHnoVU0hNgneczy7fSnZRMWyhMG1hVKy2kV2Bd/lXjVTURohPekv8elepGc0bzVxzSd
         8rZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lr5iQNog;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade2127edsi19144256d6.136.2025.03.13.08.23.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Mar 2025 08:23:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lr5iQNog;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tskOk-0006t8-FK; Thu, 13 Mar 2025 11:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tskOi-0006sW-Jl
 for qemu-arm@nongnu.org; Thu, 13 Mar 2025 11:23:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tskOg-0001Wy-Rt
 for qemu-arm@nongnu.org; Thu, 13 Mar 2025 11:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741879377;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZP3EINMiau0DOh25+wD2QEqLTqxWivDHuODrVbyHUE=;
 b=Lr5iQNogmSqRG7t2sUZkqGg7HWYsHIxT5gncrxNo9reKL5y7QG/HvpHj0t08a6kP0946P/
 1lw6BIeGGMVxaVhou8I+wBuDtDkQwKn8EAoD8bzfsJCaX1mp5W/AJMP8heojfUIkgnUvlH
 8HUlpx1Xi7l8RnjNnKw8D2TlvOgHvQk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-53FGL4mVPiKQ8v5QXXjIBA-1; Thu, 13 Mar 2025 11:22:56 -0400
X-MC-Unique: 53FGL4mVPiKQ8v5QXXjIBA-1
X-Mimecast-MFC-AGG-ID: 53FGL4mVPiKQ8v5QXXjIBA_1741879376
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c54e8ad9b3so392130885a.1
 for <qemu-arm@nongnu.org>; Thu, 13 Mar 2025 08:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741879375; x=1742484175;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EZP3EINMiau0DOh25+wD2QEqLTqxWivDHuODrVbyHUE=;
 b=a8YrM4Haj6OAUiABcUxc7qgwTAfBawGqAE3463yDIwxAReYOS6J5v+vb6cnkNM2O+k
 CDmH7D9Xx2Z2A9+kB3r8/A3hN8bPI4w8K3/ZntRnyMp/MGsbyWpHAMrz6OdIkmeKAX9I
 oYGJ1oGu5Iujc+sCjzhxwJhbPP9qrYHFUzg9TJ2TnK2xZw1errUQ32tuhr7ouQSVCN5E
 bCzDvRS86SPrULfWxfRVpAIoBSAvP5oyRKSKKAzp+CCkijCMo617ZF2SeNcxupn0RalD
 D7lLaY5WNfoLX88zaxBm5sz0U7+0Bge0aF7WElI7ZUmF0Cldm5T+I6x2oMY/FGe+FnLN
 As0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJoP9K54tVArLooncqxGxhlLNErk3R2+9G8tjHckh95+f9buhUti89hTBE2AZngRv7q7MumDDN1g==@nongnu.org
X-Gm-Message-State: AOJu0YwVXT5gWiUXzOgLwOJQv2491ULmpGLk2x/CarzDqANH7BIWRPAr
 EZjYL9FvRaiCjrifAjeBtpyuPnSnsV5NdoDJEjW26xmKCfsV2SGUHBYjiGlqgKm8OEMSkhhUzQf
 T2DOAvbpBumRBOZNCjd74uqoCv6a1iVHL/KoI5sZCpFjZSf35kYfQ7eEkww==
X-Gm-Gg: ASbGncvVFINKUFIFpwVGw/JWzW7JZOKb9RG4+CZ3TLe8LW8G1oWK2r4eCr3Q+cbu7y0
 6PNqsSZp/BMw/Q7Dlm+1oQCfO00vCQe02kDLdSlLNWGgxhpQhuei0w4VDDhJYRwMnWxhv+MUnDQ
 g7rpNtjWAc3qjY5VQ5xFha9vN3ydvzfcj1L8+jo6HLBuEqckIUTGvIZhNe7p+cW7WiQYCam5dxk
 z44bT5eFFNCgZqha9tDFfPANyQRqw7I0FuKllx9GyjWAQV1QI+6MDtSlVDYinRNc2sWZ0ilbBIv
 62nLNvNzX1GI3TwZ1F2tNYEi6r1E2gp25XUKhdN7IVZvFzVYJnPDalSGnyBYqzc=
X-Received: by 2002:a05:620a:608c:b0:7b7:142d:53a8 with SMTP id
 af79cd13be357-7c5737f16c7mr504515085a.19.1741879375193; 
 Thu, 13 Mar 2025 08:22:55 -0700 (PDT)
X-Received: by 2002:a05:620a:608c:b0:7b7:142d:53a8 with SMTP id
 af79cd13be357-7c5737f16c7mr504511485a.19.1741879374876; 
 Thu, 13 Mar 2025 08:22:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c573c71628sm110305885a.32.2025.03.13.08.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 08:22:54 -0700 (PDT)
Message-ID: <dcd67e50-8dea-4793-86a3-0c987f46a0c5@redhat.com>
Date: Thu, 13 Mar 2025 16:22:49 +0100
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
 <df336b78-5a0f-450a-8d3c-95326f5eb9a0@redhat.com>
 <f4381814d71841a185ced57dfc4f4c62@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <f4381814d71841a185ced57dfc4f4c62@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: khcYxA6imJteJVrziilgLKoTPlqIZOuWjSJqITDO8Ws_1741879376
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: myP9Y2BDuGg7




On 3/13/25 9:26 AM, Shameerali Kolothum Thodi wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Wednesday, March 12, 2025 6:31 PM
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
>>
>> Hi Shameer,
>>
>>
>>>>>>> Thanks for taking a look. I am just jumping on this one for now.
>>>>>>> Yes, there were discussions around that. But I was not sure we
>>>>>>> concluded on deprecating the machine option. So if I get you
>>>>>>> correctly the idea is,
>>>>>>>
>>>>>>> if we have,
>>>>>>> -device smmuv3 it will instantiate the current machine wide smmuv3
>>>>>>> and for -device smmuv3,accel this device?
>>>>>> yes that would be my preference.
>>>>> Ok. I will look into that in my next respin. A quick question. Does
>>>>> qemu DEVICE model support the differentiation like above easily? Or
>> we
>>>>> have to manage it with properties?
>>>> Not sure if I understand you question. I meant it can be a boolean
>> device
>>>> property (DEFINE_PROP_BOOL) smmuv3,accel=on
>>>>
>>>> No?
>>> Right. My query was more about any hidden Qemu magic to have device
>> instantiation
>>> similar to what we have at the moment even though we name both
>> devices "smmuv3".
>>> That way I can keep much of the code rather than checking "accel"
>> property
>>> in SMMUv3 code and redirecting calls. But looks like not.
>> I don't think there is any such a trick.
>>
>> Having the legacy device (without accel) only instantiable with the virt
>> machine option and the new accelerated one only instantiable with a
>> -device option looks strange to me. By the way they model the same
>> device so I think it makes more sense to use the same device with an
>> option.
> Ok. Will address that in the next respin.
>
>> Also do you see anything that would prevent the acceleration enhanced
>> device from being able to translate emulated devices as well. Ideally
>> the smmu device should react differently depending on the device which
>> is translated. I think it worked with the original implementation as far
>> as I remember.
> Yes, smmuv3-accel works with emulated devices as well. Currently the only
> limitation is, we should have at least one vfi-pci dev cold plugged as mentioned
> in the cover letter. Hopefully we will be able to resolve that restriction soon.

OK thanks

Eric
>
> Thanks,
> Shameer
>

