Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2032902njc;
        Mon, 24 Mar 2025 08:36:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2fzzjTpLdspve2Sfu0KIOqRr7++AjWjfvxufT5BBTsIoNZqut8g+TCCEsZ3ogfGjRodydXeFi9DMSlA==@linaro.org
X-Google-Smtp-Source: AGHT+IG9Jk+2gq1+H1t8hseJt+w6MQifFm4+tnbpO2bj/qM6WZq40jTIi0ogHIHMZt3Y3cisXpT/
X-Received: by 2002:a05:622a:510c:b0:476:9483:feaf with SMTP id d75a77b69052e-4771dd68810mr233231621cf.19.1742830563786;
        Mon, 24 Mar 2025 08:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742830563; cv=none;
        d=google.com; s=arc-20240605;
        b=i+4iJetdcKUfDRPgAxSU5bN2WFtavAIEwNzvfbPsKnKSIb1j0bi7ScIuvxDJHb3VqE
         t+yBh9O+WOYDU4rXg+5wyAD8C1IgLNeUvkDvHVvok+jIPtfBFPAYSLNhBVtDegRQBP1x
         oEbLGYEt8c24I3Hinm++YMTaAi4pPQPIy206rW0q5CQOFKmPovsW5YsqL8iERigKqtBv
         asMmSRcpCz8FemAzJ0Pz+OcIcmRoGCA3OKKseu7C48yMtL0FqDM027BIBoxajjZhB7xd
         +V+G16LZ0l4K5kgT3DwZ2iZwzs5cJdB2H+b+Q4Raf699fOFjlIoEKOWne33JTQUxzlY5
         mcBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0mF0KCivyzFQot6GHwz/QXo5Xq1LGOjWGQ7K2aoxWRk=;
        fh=iq0p25IcD/ZCh8LAkex4KCIJPgQYjii4tsuQwp0BiHc=;
        b=EKU8z9+mmx7DtZuDp4EqFF33ooaDVWzFhCup93lVUQHrwHpZmUGchXQYyjxdYL4dJN
         7jKrF4xMA8HGMAM01ZZp9TBeFqM2ZQYck/wvGlq6ic7ACQvO/i1/1GqJISxjMBQMz655
         myaz9CKeMXI4TCXhBCfseEVR6hr+hWoljIuJX8RH3luCawJAybaEYDGds1We6OmStPIa
         afC7G5IDElpCUbbl1AiR6KIwKbJa4PPF00txMMI5nVYvauoLqGWYOKWCwOeqmnHfkHi7
         mWDHdtu40w6jbPUyz8dabaB7LVoKImaJNCmL6aa+tzuprUC6NCgjXHDM/+SdxGTzhUF0
         Tl3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q8rw95yf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ecdca9a68asi64444076d6.96.2025.03.24.08.36.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Mar 2025 08:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q8rw95yf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twjpX-0003cF-FB; Mon, 24 Mar 2025 11:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1twjpT-0003at-Ay
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 11:35:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1twjpP-0000bF-JE
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 11:35:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742830502;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0mF0KCivyzFQot6GHwz/QXo5Xq1LGOjWGQ7K2aoxWRk=;
 b=Q8rw95yfQBvULeHcEk2TQmC4KhDNDuhAlIZqie1luF82oYeqGcHmzU0BD+h3RVfSnPa/bi
 ueH1g2ucWtgmXSPj8j6bpJPWT8lY7LGVHsalmbf79mUuovW1iO031v3dKy50W1i3qYD0qe
 3s4YqxWVSRXnm7wC/CCeCCwMVn3Jx3s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-JzU3NgxyPweEt9wYT9W3eA-1; Mon, 24 Mar 2025 11:34:59 -0400
X-MC-Unique: JzU3NgxyPweEt9wYT9W3eA-1
X-Mimecast-MFC-AGG-ID: JzU3NgxyPweEt9wYT9W3eA_1742830498
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-391315098b2so1792549f8f.2
 for <qemu-arm@nongnu.org>; Mon, 24 Mar 2025 08:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742830498; x=1743435298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0mF0KCivyzFQot6GHwz/QXo5Xq1LGOjWGQ7K2aoxWRk=;
 b=XGpH2s2vNO/9M+IDnPetqC9KfL5dzFzi1kYRKDC5to6Tixcg7cH8P56CgoEmMFHvmO
 AzHs1oTfXqC+zhCXjS/rOsXojCs+ySssAmdyAocnbhEOMBe5lZrQgXN2p6l0wyGi6KQ8
 GdslrU8t9q9xO+Vdx+mNjFrs11ZXrPuECGZabA5XWhcNQF0jggz63NX1xUFaBZLz87k5
 DqBS+BKd00gZGiQNVwolcqbr7d57vPwQYimLGmZ9WfaiwZzR3nNG82G9NqyK76DOzceQ
 3Vk4qzhYqlvlIPXgqrm+mLbIB+OGtZS0/KwuKJkp4hnkV0ALte2SOChlJph6C0PNcmF8
 dvKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOO0/fQFLRChr9kXQnSx7rbzznvx1aRYMFJmvENkQV8Nd0PvENl9Ki8k2joqA8RuyorwUM/GV8lQ==@nongnu.org
X-Gm-Message-State: AOJu0YzPhXkt9wu6yujhYRaJR3lQdgP9lxo8B0MkT4Q0X1C2RJGdnqx4
 MuFmS46ronHMEFCxJDoFVBSSRL7ALP96uGCAA+0vavipk7Zc8YfvxdUdW3cWJa1iz/xxgbi9qhJ
 bSKelWaGKrxjP+RSAGQ/Vt6hnnVIPwAAM8pJCtKuvGLpDOg6seg==
X-Gm-Gg: ASbGncuhvouLxjBS4kXSIjJ8egvTCkb9MLJgLNrzGnp4zOg0cg2OMozeO8uCe+g4q+5
 lzpSi1foX9EyUt3mHccYpZNzdckFhWP2cgCChOATvdlXpdgWYRa1xr2scH4ZxVGe9NEjvu/LPiv
 OsUv/yLK8lG1O3Kq7CcVPX09b9/XUYdDjACgPCcUF+OOgOa4tyM3okkw49cvuy8OttRAgdVLClb
 CM72aqki2P8v8O5wMQAH3lcjKsWg4Znj61yE4nMrwSLwOzrridZf8ErNEvnqA4YgBt57lnkBLcd
 lpla6+ec4DYcQLOyQZ5JeQCrKfeARYfWHmPOrJ0IcimBYko+LSPHcTdu86iq4L4=
X-Received: by 2002:a05:6000:2b08:b0:38f:3c01:fb1f with SMTP id
 ffacd0b85a97d-3997f90a518mr7781352f8f.30.1742830497859; 
 Mon, 24 Mar 2025 08:34:57 -0700 (PDT)
X-Received: by 2002:a05:6000:2b08:b0:38f:3c01:fb1f with SMTP id
 ffacd0b85a97d-3997f90a518mr7781331f8f.30.1742830497415; 
 Mon, 24 Mar 2025 08:34:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39abafed528sm7815944f8f.27.2025.03.24.08.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 08:34:56 -0700 (PDT)
Message-ID: <466ea2a7-c113-426d-ad71-cb39efd2595f@redhat.com>
Date: Mon, 24 Mar 2025 16:34:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-pcie bus
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Cc: Donald Dutile <ddutile@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-6-shameerali.kolothum.thodi@huawei.com>
 <b3a4ce7f-41a9-4da9-a8ca-54848b9e9cf1@redhat.com>
 <3d1312b411f04121a3be90879a915982@huawei.com>
 <Z9xKL49nOenvQIsW@Asurada-Nvidia>
 <2f84490d309440a4a2ac56fd893ddab8@huawei.com>
 <ad0b5fac-2a7f-4978-9f6b-0f7b1df14a35@redhat.com>
 <a5ba5e2228b24338b4ef509bb1748739@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <a5ba5e2228b24338b4ef509bb1748739@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xG6RJeEYgTqpgqvY2F3IDQBGsCv0G_e3fEHRz0lU9kk_1742830498
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
X-TUID: 3w8TESyMsHVl



On 3/24/25 2:55 PM, Shameerali Kolothum Thodi wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: qemu-devel-
>> bounces+shameerali.kolothum.thodi=huawei.com@nongnu.org <qemu-
>> devel-bounces+shameerali.kolothum.thodi=huawei.com@nongnu.org> On
>> Behalf Of Eric Auger
>> Sent: Monday, March 24, 2025 1:13 PM
>> To: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; Nicolin Chen
>> <nicolinc@nvidia.com>
>> Cc: Donald Dutile <ddutile@redhat.com>; qemu-arm@nongnu.org; qemu-
>> devel@nongnu.org; peter.maydell@linaro.org; jgg@nvidia.com;
>> berrange@redhat.com; nathanc@nvidia.com; mochs@nvidia.com;
>> smostafa@google.com; Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
>> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
>> Jonathan Cameron <jonathan.cameron@huawei.com>;
>> zhangfei.gao@linaro.org
>> Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-
>> pcie bus
>>
>> Hi Shameer,
>>
>> On 3/24/25 9:19 AM, Shameerali Kolothum Thodi wrote:
>>>> -----Original Message-----
>>>> From: Nicolin Chen <nicolinc@nvidia.com>
>>>> Sent: Thursday, March 20, 2025 5:03 PM
>>>> To: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>
>>>> Cc: Donald Dutile <ddutile@redhat.com>; qemu-arm@nongnu.org;
>> qemu-
>>>> devel@nongnu.org; eric.auger@redhat.com; peter.maydell@linaro.org;
>>>> jgg@nvidia.com; berrange@redhat.com; nathanc@nvidia.com;
>>>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>>>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>>>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>>>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>>>> Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a
>> pxb-
>>>> pcie bus
>>>>
>>>> On Wed, Mar 19, 2025 at 09:26:29AM +0000, Shameerali Kolothum Thodi
>>>> wrote:
>>>>> Having said that,  current code only allows pxb-pcie root complexes
>>>> avoiding
>>>>> the pcie.0. The idea behind this was, user can use pcie.0 with a non
>> accel
>>>> SMMUv3
>>>>> for any emulated devices avoiding the performance bottlenecks we are
>>>>> discussing for emulated dev+smmuv3-accel cases. But based on the
>>>> feedback from
>>>>> Eric and Daniel I will relax that restriction and will allow association
>> with
>>>> pcie.0.
>>>>
>>>> Just want a clarification here..
>>>>
>>>> If VM has a passthrough device only:
>>>>  attach it to PCIE.0 <=> vSMMU0 (accel=on)
>>> Yes. Basically support accel=on to pcie.0 as well.
>> agreed we shall be able to instantiate the accelerated SMMU on pcie.0 too.
>>>> If VM has an emulated device and a passthrough device:
>>>>  attach the emulated device to PCIE.0 <=> vSMMU bypass (or accel=off?)
>>>>  attach the passthrough device to pxb-pcie <=> vSMMU0 (accel=on)
>>> This can be other way around as well:
>>> ie,
>>> pass-through to pcie.0(accel=on) and emulated to any other pxb-pcie with
>> accel = off.
>> +1
>>> I think the way bus numbers are allocated in Qemu for pcie.0 and pxb-
>> pcie allows
>>> us to support this in IORT ID maps.
>> One trouble we may get into is possible bus reordering by the guest. I
>> don't know the details but I remember that in certain conditions the
>> guest can reorder the bus numbers.
> Yeah, Guest kernel can re-enumerate PCIe. I will check.
>  
>> Besides what I don't get in the above discussion, related to whether the
>> accelerated mode can also sipport emulated devices, is that if you use
>> the originally suggested hierarchy (pxb-pcie + root port + VFIO device)
>> you eventually get on guest side 2 devices protected by the SMMU
>> instance: the root port and the VFIO device. They end up in different
>> iommu groups. So there is already a mix of emulated and VFIO device.
> True. But I guess the root port associated activity(invalidations etc) will be
> very minimal(or nil?) compared to a virtio device.
Agreed. I just meant discriminating between devices that can bring
trouble and others may require some caution

Eric
>
> Thanks,
> Shameer
>
>
>

