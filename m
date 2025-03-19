Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp404908njc;
        Wed, 19 Mar 2025 10:27:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWyGBXLJLIMIuI3FKgP8GmImVoqmd5Ek0iYw5vPEc40DmN6yt1ZLpYAvBwtgJrDuiOO5fwtHicTj8AOWA==@linaro.org
X-Google-Smtp-Source: AGHT+IFr4zyDtZBJNWoe2SbpySgjBOQVL+UQWLjrXk7pBpZny8FokvCHnlhAaFnLlgs31Mg8yDV+
X-Received: by 2002:a05:622a:44:b0:477:cb1:e1c0 with SMTP id d75a77b69052e-4770cb1e1d5mr26812461cf.0.1742405254748;
        Wed, 19 Mar 2025 10:27:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742405254; cv=none;
        d=google.com; s=arc-20240605;
        b=FBO6RZPe10gCpbhM9fUMQ24VLEdYo6XvxT1KdYuWES8LZ24JRUuWd7Bqn+AAz3xAFC
         9RkVIeljdKJBgOxlvKraNDR6fZJkYsru/M3dkVjZwI9OruprKVZ6cJjjnwvtiTslP4bU
         jxGs1N/l7a+xPcdepi2QdVM/ZGnYmnf7LoWD6TSjU1VoqLVDFg/fxgCO0U9OttPff5/U
         j8SEM08LNl5OUKaV4PG5ngetT0zfhCH/I8cXV6XccdHmf3ABgpfnPtI/xkx7JhJ02UBy
         BppcJOXfP3XhKIk/bDAA7/lWtu6kw0KT90HvEpT2znX6AlnIHfBIJwf/YasP+jBs5bpx
         ttuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=u/rODeXf3PlV/XHc+LDEhwS17RHRnNkBAC7tdmnnkPg=;
        fh=aZWAMUwNKbvFjGphyBohNHZM/ez7/0rkU6ykXjSs1pM=;
        b=XM+AgZstgze6PTHz9kyMtRe64RdVJm4899DEpxTIfrDIRM4Td6kUhq+H3M2pTEa3Wu
         SNs5D715vRFVdTY0hlo6OVWvcz3JcrRMVLVRhjYkaRfnbN9A+587lthkc8yMk97rrif7
         BIqHQsY4AzWP5f+UHQZ6BGhFU9tzBo7CVbqxqz0DmHlIe591Dzx1Uck3pZQCm7Bb+Uev
         WfbmcY2IcYrxQisa00nrAm1cGa82jmWDeBsVql+tbDrjAOGkubL2ExyhVUgg0h66+BFk
         PgGVcu12FIwhIs/Y0yFdos5TSSidW6CV+nYHNe9OtPQuS0YBybOj7oOWNzOB8MCzc58c
         lRUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H4G9ce+d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4770453f8b0si27428461cf.57.2025.03.19.10.27.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 10:27:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H4G9ce+d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuxCS-00080X-2n; Wed, 19 Mar 2025 13:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuxBy-0007pA-TK
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 13:27:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuxBw-0000Cm-He
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 13:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742405215;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u/rODeXf3PlV/XHc+LDEhwS17RHRnNkBAC7tdmnnkPg=;
 b=H4G9ce+dRjwbwPGkmblF/O5s6WO6tG0g+tXIB0tMgsqRNK5F2vLAYRks2WpS6z01R3Ha0g
 2bvz1nhtP1HqVpmeorV6SBy/azvEqoLa5/LZjoKheTCzfkrBXAf6wWlbxZgeNKyPKbqXev
 kr8ZsES3fco0MitNLRSSpTeZxyceVgI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-Sa7Lhu0JN9mhyCckSamRGQ-1; Wed, 19 Mar 2025 13:26:53 -0400
X-MC-Unique: Sa7Lhu0JN9mhyCckSamRGQ-1
X-Mimecast-MFC-AGG-ID: Sa7Lhu0JN9mhyCckSamRGQ_1742405212
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43ab5baf62cso42453255e9.0
 for <qemu-arm@nongnu.org>; Wed, 19 Mar 2025 10:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742405212; x=1743010012;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u/rODeXf3PlV/XHc+LDEhwS17RHRnNkBAC7tdmnnkPg=;
 b=X7ACwouo+5DtFt7igTaIbWYkOdmjQufvQdkHsLYs4xAKbNkqLS3NOIrVYlnPBzwm1A
 kD3O70DphsJC7nhSl116HhU3BB2uBmX5VyLxtsoxdjNbLXB+63XZK5mcSKO8AWj7aXMs
 hdV75FXBRWCmHWHRnUqsQODzIKbZnbbK+a0s36MLm3YHPLFsfhmkdjgdVelHI/XGN7az
 1l6eEeAPAaB89N302DOtlLT/FnZ6RWNDo60eJcIarRWyb+yxGv7mCNVW9mkCEl6yC9uc
 evtJYQFSoPARsigr8yv829T6kkzwlen7KNte0t7nPnymXoK0FboDjiF5lnJfziVv1Aii
 QCAw==
X-Gm-Message-State: AOJu0YyUrImgEXyamesfsSGT5XfJxm3qurIrWIH8XtuHpOv6m3azPoID
 tKVJ91ZodKTmHJKoQ6dilLWXkgKQyTxQJ9EIL4oZOYklCVQTjxp3ZyAb4w80O8J+ODPvVXEPI4U
 zicOwTAeUKMajCAbx8L4ShnyOtGRZtz51RZZXiG/sLHZb7C5YsQ==
X-Gm-Gg: ASbGncuj/IQgQgrIbMtgBRSoJ0jwFLEOo8GdNV5xW9nKqz/qeD6B+BiQPfo076LGccc
 k9kaaWVbhWVsFDsk5LYJaBBBGXbRzarv4JXYx2MmyPhwN7b+HJAKFwJ164JZehP8bFJDHsFz12w
 NNz/qq3KX/Jwi7BoTi6VLVxuI6c3+v+W+LkTZX4fxUXvJkMEq0nkWmGygzfr6bSdcS5SlokMf4s
 jTG/BqjECJ534UqdsmnEdFagXC+nb0PHZvRx8RbEGB0TJOdT+JZ9i9U4SZN0vVTE8OxpF+WYAmq
 9C0q+ZVNeVt4MNY6vxd+EyHL1BI16wtpWUF5XuEd59EySMvBgubMN4HJcIZgob0=
X-Received: by 2002:a05:600c:1d9f:b0:43c:f81d:f with SMTP id
 5b1f17b1804b1-43d49542f51mr117535e9.8.1742405211782; 
 Wed, 19 Mar 2025 10:26:51 -0700 (PDT)
X-Received: by 2002:a05:600c:1d9f:b0:43c:f81d:f with SMTP id
 5b1f17b1804b1-43d49542f51mr117305e9.8.1742405211328; 
 Wed, 19 Mar 2025 10:26:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f74d9bsm24311045e9.32.2025.03.19.10.26.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 10:26:50 -0700 (PDT)
Message-ID: <5a273945-3557-43f6-a235-1517d5db9b48@redhat.com>
Date: Wed, 19 Mar 2025 18:26:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "ddutile@redhat.com"
 <ddutile@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-4-shameerali.kolothum.thodi@huawei.com>
 <d75feb00-72d3-4d79-a7ac-2548eadb6a77@redhat.com>
 <Z9hh8MIAQNQcvNlG@Asurada-Nvidia>
 <71b73212-3d8f-4c9d-93a4-bf07c0f169e3@redhat.com>
 <Z9hzmzHfWw18OyGO@Asurada-Nvidia>
 <11895c78-d6ab-40c8-a500-4abed1565234@redhat.com>
 <a1a62689da8c43ca98a4379773db241c@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <a1a62689da8c43ca98a4379773db241c@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tfbQqwyXT6YiHy_3XUFYupMZVj1zQ6HZw_juZdUyZns_1742405212
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.337,
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
X-TUID: ieLqbOS+0Qyb

Hi Shameer,


On 3/19/25 5:53 PM, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Wednesday, March 19, 2025 4:46 PM
>> To: Nicolin Chen <nicolinc@nvidia.com>
>> Cc: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>> qemu-devel@nongnu.org; peter.maydell@linaro.org; jgg@nvidia.com;
>> ddutile@redhat.com; berrange@redhat.com; nathanc@nvidia.com;
>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>> Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
>> infrastructure for smmuv3-accel device
>>>>> Is there any benefit from emulated devices working in the HW-
>>>>> accelerated nested translation mode?
>>>> Not really but do we have any justification for using different device
>>>> name in accel mode? I am not even sure that accel option is really
>>>> needed. Ideally the qemu device should be able to detect it is
>>>> protecting a VFIO device, in which case it shall check whether nested is
>>>> supported by host SMMU and then automatically turn accel mode?
>>>>
>>>> I gave the example of the vfio device which has different class
>>>> implementration depending on the iommufd option being set or not.
>>> Do you mean that we should just create a regular smmuv3 device and
>>> let a VFIO device to turn on this smmuv3's accel mode depending on
>>> its LEGACY/IOMMUFD class?
>> no this is not what I meant. I gave an example where depending on an
>> option passed to thye VFIO device you choose one class implement or the
>> other.
>>> Another question: how does an emulated device work with a vSMMUv3?
>> I don't get your question. vSMMUv3 currently only works with emulated
>> devices. Did you mean accelerated SMMUv3?
>>> I could imagine that all the accel steps would be bypassed since
>>> !sdev->idev. Yet, the emulated iotlb should cache its translation
>>> so we will need to flush the iotlb, which will increase complexity
>>> as the TLBI command dispatching function will need to be aware what
>>> ASID is for emulated device and what is for vfio device..
>> I don't get the issue. For emulated device you go through the usual
>> translate path which indeed caches configs and translations. In case the
>> guest invalidates something, you know the SID and you find the entries
>> in the cache that are tagged by this SID.
> Not always you get sid, eg: CMD_TLBI_NH_ASID

Effectively with ASID invalidation you potentially need to do both qemu
IOTLB invalidation and host invalidation propagation.
but this code is already in place in the code and used in vhost mode:

            smmu_inv_notifiers_all(&s->smmu_state);
            smmu_iotlb_inv_asid_vmid(bs, asid, vmid);

but as stated before in VFIO accel mode the cache is not filled so I
don't expect a huge penalty

Besides we can also disable qemu caches if it turns the accel mode is in
use, no?

Eric


>
> Thanks,
> Shameer

