Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp55600ejb;
        Sun, 16 Jun 2024 23:24:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNBb3jqTWntWdrsaqrzqu9U4dDDyc8VOJal7oj33g7sUebXMfw5X6N2NQnNlLGqD3Rczsi0G2o1njkaKatfQTc3JYxq5Pe
X-Google-Smtp-Source: AGHT+IEjfR8d4+ezZ4xw5+zxpiJ9Nn3IsQbxQGBnODhyzH/uQJB1Gk48A6NIEbFK6k6SSBhdJO0V
X-Received: by 2002:a05:6902:1b01:b0:df7:6030:bb4e with SMTP id 3f1490d57ef6-dff154e1ea3mr9746278276.61.1718605458924;
        Sun, 16 Jun 2024 23:24:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718605458; cv=none;
        d=google.com; s=arc-20160816;
        b=R58yfao8uiezgdpfbxvzDS7XdO12SkRpYZXLsnB2p66cfZ+xNya39aOqamOOQDBxWi
         GFoeKi0EvQF16UNlpMojp65pP2IcNL68sNjtfHse8CK1m28fYKGL12wNglZM2YBtJNAg
         3Pl0U7eix7WOqhgKybXxcUDYjUCt5yzaXpziADNkhrZlKStzSfzsSPxaWuSEcldeAdZN
         kWw5Dh4HgDJbNy7NtB4D2K+9a1VchlZonOIy9QGs5rgNZjwV2/p0pbSn2RhOLTn0KKJf
         QmvLAUmGwSj9N0aHLxljrMdV96UHuwvdFmcME8sWdBzCpu76RFPwpxOLOEAYeOoJseBW
         smKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bUjPEcJygmqh88A3E2HTiznvD7K/obHptczgW4nqY54=;
        fh=3k//9ZZ5yfhSKrC6eiDJdDDtzD5GRd7pE0hu2uBlPl4=;
        b=yRtMfgS4aU13ClDbZI97Gc/HhCj9d79puUMJWdRSuCS4tsTZYToyWh4bTAJpOsQho0
         ++0as0ec2wdK3B2uFu2Lo+mN3/HagDBVxY98FFCqm1AcyFKB46cUaRyOedpj5QpxY6Am
         IprQM8GubYgyccQTu04J/YBuXq9cXYGArIHet4lsCFUHZMnnqVE2n24uLllccrWQmtWt
         +GjSJfbENAs/Mr7a7nHXGTfEYfMA8PqMkVIvLlQofRp+LV6axgXY52CgOx6OmJuhQgDM
         qLjxunBZNJ3yfXqYBR4ovTjj1k3TPkwNDah+fZnG2fTu6issNQDwb/G2WcsyzX9UxHEG
         SXpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dpWzPjDf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5b88f69si94540856d6.565.2024.06.16.23.24.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Jun 2024 23:24:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dpWzPjDf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJ5mh-0001ZS-Os; Mon, 17 Jun 2024 02:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sJ5mg-0001ZK-2u
 for qemu-arm@nongnu.org; Mon, 17 Jun 2024 02:24:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sJ5me-0002jF-6X
 for qemu-arm@nongnu.org; Mon, 17 Jun 2024 02:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718605443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bUjPEcJygmqh88A3E2HTiznvD7K/obHptczgW4nqY54=;
 b=dpWzPjDf2/YQEzBSU2S4b/ZVV4Auv41JIVgx1xoVdLF+vVU42UgoXvUORcBkX5DsIqqrtg
 ZQhGSm84p7dwTwWQZLllJomWfTFFu7Qm9sHkOuFBed5+UEyfgse188/dVAfVzXpTO9ZUIn
 tLNTIuEZjy1rtLu3cWnxdV8VfLStntQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-pQE6iaPiO9KdF7v5culEnA-1; Mon, 17 Jun 2024 02:24:00 -0400
X-MC-Unique: pQE6iaPiO9KdF7v5culEnA-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6ad706fab2aso51697236d6.1
 for <qemu-arm@nongnu.org>; Sun, 16 Jun 2024 23:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718605439; x=1719210239;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bUjPEcJygmqh88A3E2HTiznvD7K/obHptczgW4nqY54=;
 b=SV8jWteOpTeHp3TO2jyYdNUPPH/R1wuO3s844UEV9aFq8ldRL0BnkGifB+0QstLxmO
 ym5uB3dYNAxfN8HoXq4Vfc2Y6N2xcWYn1UQhNcTHPwK1DMpH5GgXzBLypjKBEHKV2ow/
 fxSG+wKKLaZ1ae9Mja/0vHMGewX1HlbYxZBBJN2OYe5iXlOlyCvk3/8zU6QMDCXtLs4V
 RboBM+XX2ORDvsPVasQ1YmtOUsxadK4dJParX31/kDl6uLDx3sW6UIc/FRrOuce/hYcr
 lXFOPHAhqtsRN6JvohOt+Uo4MWzfjrGMis5RPEwiDfRSxmVNpbN2a4blOCnwHBRv7LvB
 rbkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmWdQ0xgmcgdUKy85D/87Fa2jMqPG9OkYR4haO06qVK60tpj+7mRo6KqEE/IS8LAHU8995UqukWKQzXI9LtBe3leOm
X-Gm-Message-State: AOJu0YyvhegvUMi4YXz95Ra1B+pIOZVMUT5UlTuoc3X6sUXwbO4/SbaT
 rAuUlrbXYiHBFcaZYyT7llo3IZs8hVKrGV5HDRcwiyxjiZHwULwlFAv/3ptoEbveFld1UfCFMli
 wMDIOdbrEyS+nDaGQq4rn2iiu0jW7COZ3iOW5pRRJPtMNJZnIWw==
X-Received: by 2002:a0c:cc13:0:b0:6b0:6cb3:1c0d with SMTP id
 6a1803df08f44-6b2afcd996emr91165786d6.28.1718605439723; 
 Sun, 16 Jun 2024 23:23:59 -0700 (PDT)
X-Received: by 2002:a0c:cc13:0:b0:6b0:6cb3:1c0d with SMTP id
 6a1803df08f44-6b2afcd996emr91165676d6.28.1718605439445; 
 Sun, 16 Jun 2024 23:23:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5eb4f4asm52021396d6.98.2024.06.16.23.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jun 2024 23:23:59 -0700 (PDT)
Message-ID: <6753f002-2c9e-4491-8d6e-ccc91ff3c22d@redhat.com>
Date: Mon, 17 Jun 2024 08:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] HostIOMMUDevice: Store the VFIO/VDPA agent
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "yanghliu@redhat.com" <yanghliu@redhat.com>
Cc: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>
References: <20240613092359.847145-1-eric.auger@redhat.com>
 <20240613092359.847145-2-eric.auger@redhat.com>
 <ef400920-dcf4-4f37-b4ce-c5560b92d9c5@redhat.com>
 <f6473f76-1d8f-41cb-9488-73edc960c996@redhat.com>
 <ec740f33-44ae-4d50-be65-5f717122f4f0@redhat.com>
 <SJ0PR11MB674408FB45B20DC52E42193692CD2@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <SJ0PR11MB674408FB45B20DC52E42193692CD2@SJ0PR11MB6744.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ly6t1GTVK1qa

On 6/17/24 3:25 AM, Duan, Zhenzhong wrote:
> Hi Cédric,
> 
>> -----Original Message-----
>> From: Cédric Le Goater <clg@redhat.com>
>> Sent: Friday, June 14, 2024 6:05 PM
>> To: eric.auger@redhat.com; eric.auger.pro@gmail.com; qemu-
>> devel@nongnu.org; qemu-arm@nongnu.org; mst@redhat.com; jean-
>> philippe@linaro.org; peter.maydell@linaro.org; yanghliu@redhat.com; Duan,
>> Zhenzhong <zhenzhong.duan@intel.com>
>> Cc: alex.williamson@redhat.com; jasowang@redhat.com;
>> pbonzini@redhat.com; berrange@redhat.com
>> Subject: Re: [PATCH v3 1/7] HostIOMMUDevice: Store the VFIO/VDPA agent
>>
>>
>>>> Talking of which, why are we passing a 'VFIODevice *' parameter to
>>>> HostIOMMUDeviceClass::realize ? I don't see a good reason
>>>>
>>>> I think a 'VFIOContainerBase *' would be more appropriate since
>>>> 'HostIOMMUDevice' represents a device on the host which is common
>>>> to all VFIO devices.
>>>>
>>>> In that case, HostIOMMUDevice::agent wouldn't need to be opaque
>>>> anymore. It could  simply be a 'VFIOContainerBase *' and
>>>> hiod_legacy_vfio_get_iova_ranges() in patch 3 would grab the
>>>> 'iova_ranges' from the 'VFIOContainerBase *' directly.
>>>>
>>>> This means some rework :
>>>>
>>>> * vfio_device_get_aw_bits() would use a  'VFIOContainerBase *' instead.
>>>> * HostIOMMUDevice::name would be removed. This is just for error
>>>> messages.
>>>> * hiod_iommufd_vfio_realize() would use VFIOIOMMUFDContainer::be.
>>>>
>>>> That said, I think we need the QOMification changes first.
>>>
>>> OK I need to review your series first. At the moment I have just
>>> addressed Zhenzhong's comment in v4, just sent.
>>
>> Yep. Just take a look at mine. If both of you agree with above
>> proposal, I can care of it and resend all 3. It's a small change.
> 
> I would suggest using opaque pointer and VFIODevice for two reasons,
> 1. in nesting series vIOMMU needs to attach/detaching hwpt which is VFIODevice operations.
> See https://github.com/yiliu1765/qemu/commit/3ca559d35adc9840555e361a56708af4c6338b3d

OK. I realized later on that we needed the device id anyhow.
> 
> 2. If we plan to support VDPA Device in future, the opaque pointer can also point
> to an VDPADevice structure.

Thanks,

C.

