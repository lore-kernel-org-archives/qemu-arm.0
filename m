Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1664351njb;
        Thu, 6 Feb 2025 08:44:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVcURC7Gl/UKhm6EFS4Kshf1TDkKWDHWXdrTYOI3Zn4+URHMzBucaScVSB/ly4hS409Ac0j8RFQrAYu7w==@linaro.org
X-Google-Smtp-Source: AGHT+IET5BFx+huOBq3WDSsQqfG8mh8N2TWVDtULHLLOaGq/6dpCiGLu2Gp6JSNQNxxf7eh1IV1m
X-Received: by 2002:a05:6214:3f8b:b0:6dd:d24:305c with SMTP id 6a1803df08f44-6e42fc3e596mr124567686d6.37.1738860285772;
        Thu, 06 Feb 2025 08:44:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738860285; cv=none;
        d=google.com; s=arc-20240605;
        b=FIUzyR7gDED1SxWOw12p7U4PbB8Vp/q/amUcFuseofuYs/7DZiBdtbjflR2EdCaa7l
         Osou0xmmUB6CRzrkMpMo35PB2B/IkMqb/bfC+wyHu6on1muHsyRimd7G1yolFPmHRHK8
         ddUs/ESCNFKvLcBqB3u3evL3KIIznukP9+Ixt/hv32+se2ZiftIiXIO9/BInDNOg3MtD
         NjbVeS5zFSNPPQPRg6GkaIhUX3QIlzRzVrc6drJDmrXIweLWDg11/K5Wv485t+0k6Cxn
         N4BSgVRo/JhfEAxQpvTFu5aPPB0EtEA+MTsyfA6CRUSHIyTa/xnTbP7ci9QhyoJ+M3bn
         gGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=AJO+sTH+JvPNIYxt4RBcmG5zc5ZBCPAAnh0ES/qJR2s=;
        fh=zK3LNGYIvDFScwiHf5w6LpIVEj0cZNg66psjx/u2N5Y=;
        b=W5ipXdAEmMrNEcP8BdjCQz5QymaIcJpR4PhTb5/Cxqmur6SZ5XhPR2ZkiRiKFRZ1xi
         JeQWzEa7AYYOVaLqsnBh2rxqqm9Zj6aC9zGVDZorlS7wrkx7/oluhjpgHfbm4+SGnYlW
         ujZt/B/8K7v6WVbQSyZFpCLMAC85U3kTktSFQs7vaBBWrfEZahrqeu4uY+bhAIwSuI/4
         YrQQvU23nRL918VFDVHz7yFul1r7l7oS/l4jZgf+EXC/DisINXwk5MdnJ/jBrE0R4TKo
         IB7jmlwW2OFHxJ73+6jYjyz2JSln8/W3aaVK5/4JXI/bC5PcY/73kdQPcqPN3kr2HqjC
         YpRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pr3MoL4r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43bac3266si14039466d6.182.2025.02.06.08.44.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 08:44:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pr3MoL4r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg4zF-00075p-Kc; Thu, 06 Feb 2025 11:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tg4zA-0006zD-E7
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 11:44:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tg4z8-0005Y5-79
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 11:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738860251;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJO+sTH+JvPNIYxt4RBcmG5zc5ZBCPAAnh0ES/qJR2s=;
 b=Pr3MoL4rnA1iT5KYex3T8QqMYeYHHXIJSpTSGwbKEtUrSzw8CIYW0MkBgBcuPYhfsfNgZI
 uKgLR8tOrE/12++SNI27xfcvYcGqIWUcI6fNhV0YiTnOBUYqiBfLsqQImbc6loTqY58MdJ
 59YgoKB8tQzP9xuR2eMdyIv7h0EY9Ik=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-6jw2cGW1Mz6VMD3HnQGiqg-1; Thu, 06 Feb 2025 11:44:10 -0500
X-MC-Unique: 6jw2cGW1Mz6VMD3HnQGiqg-1
X-Mimecast-MFC-AGG-ID: 6jw2cGW1Mz6VMD3HnQGiqg
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4361efc9d1fso9148635e9.2
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 08:44:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738860249; x=1739465049;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AJO+sTH+JvPNIYxt4RBcmG5zc5ZBCPAAnh0ES/qJR2s=;
 b=sx8VAfHh0m/GHuszPheoqYxs+TbUYenX/biuZQpsfllXu0Xhgpe7CBpX8K601tR/xF
 KQKKxr9si8SR+FYmJBm1MEfUE/nTvuQdLMQdPuU6Kecqrsz+RQK0x/byXFKeYwScB3Dd
 UyN88B1J6NhwnZzFH21Nxc6ExlDwoQp2X6B5ydwQ9EHa1fJL9NgUHj55KMFBhyVCveMf
 eEx2I0/gkQytQt7mpIr9HU4Qzc+qQrQRyI3rZ2PoqWpraVQsiTW/BlDi6iu2GaYr0ici
 c93Ezjzjc6f+FdgRAvbarukUWszcVFZ4vBxNuIXsCMRnOPZSQm3A+Z/eUg6LVGUkAA3w
 UeqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCXjj7iLiHs23MSyVYrMJYmMCj05JjQ8mdaBUA1PazQ1T+5tJbjwvynkM/bWgiJNMLDIzIrV0ltQ==@nongnu.org
X-Gm-Message-State: AOJu0YzmgRbVodQzKNmLyjlCB3+ptCAqFZoKrQudZjuJ375iKmRJR8kS
 Hj8hO0EtdjPACnHYfMRLpvpJ1IxIJDzpWnDAywz6wRUKa5Dufy/Wgr+dsemFU+hTxojWQcQeGOD
 XY9xksdA0rCNVPcB9jYR1CfF3PM759YmVzj9AK1r9h3G519iF/A==
X-Gm-Gg: ASbGncvKgDHRmpOG+nFzKulGRXsErVzRDfcrIYeANXNpngA+flYA1QqVi+eBF/eGh7g
 UDYXJYAnVxtgMA6I/Vh6maE59eLcOnTeIKF8O1iSY+8Hs3IcYYgiK8M+S8hOvqwo0dkwZXbDz5I
 6xLmSOce3W5X7CbbfswArsw2wcLCvNpAZRvKIgcICHeK3epCyjLosYok2o1n0c4veu5IyQVGJzm
 sDz/6TmTLONu3ZqeHZ60QVAYnrlgZtmKa1TW+ZxShWQNxR5tgHZCOiu/rrH9G9YiCraP9sgy+6P
 TsU34F4vVNgmGauK4yWrparWMpSURNwXFA1AggXne3L+nlFsl0ZV
X-Received: by 2002:a05:600c:4706:b0:436:488f:4d8 with SMTP id
 5b1f17b1804b1-4392498d6cemr1202285e9.11.1738860249345; 
 Thu, 06 Feb 2025 08:44:09 -0800 (PST)
X-Received: by 2002:a05:600c:4706:b0:436:488f:4d8 with SMTP id
 5b1f17b1804b1-4392498d6cemr1202095e9.11.1738860248958; 
 Thu, 06 Feb 2025 08:44:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd5c87csm2212774f8f.52.2025.02.06.08.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 08:44:08 -0800 (PST)
Message-ID: <455143f1-db4f-40d0-a2e2-fc983476f76e@redhat.com>
Date: Thu, 6 Feb 2025 17:44:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@nvidia.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 Nathan Chen <nathanc@nvidia.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <Z5uiGnAxUf4jXTEI@redhat.com> <7ecabe74e0514367baf28d67675e5db8@huawei.com>
 <fc91e1a798324390b2a556fae5d40f46@huawei.com>
 <20250131142404.GP5556@nvidia.com>
 <3efcea1171af4b2f81be842f2c55fe51@huawei.com>
 <20250131145411.GR5556@nvidia.com>
 <20039bbc40df453a8a41a863d74b9ff9@huawei.com>
 <c292ab40-3620-4e72-b043-4e3cbd7fd297@redhat.com>
 <Z6R4fXAuNlx12kG9@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Z6R4fXAuNlx12kG9@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uM_Ps3mf-c8uMAju9SeN3PfxJ0JaYfHNN8uExOJbGAs_1738860249
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: elsFoAW2uwuQ




On 2/6/25 9:53 AM, Daniel P. Berrangé wrote:
> On Fri, Jan 31, 2025 at 05:08:28PM +0100, Eric Auger wrote:
>> Hi,
>>
>>
>> On 1/31/25 4:23 PM, Shameerali Kolothum Thodi wrote:
>>>> -----Original Message-----
>>>> From: Jason Gunthorpe <jgg@nvidia.com>
>>>> Sent: Friday, January 31, 2025 2:54 PM
>>>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
>>>> Cc: Daniel P. Berrangé <berrange@redhat.com>; qemu-arm@nongnu.org;
>>>> qemu-devel@nongnu.org; eric.auger@redhat.com;
>>>> peter.maydell@linaro.org; nicolinc@nvidia.com; ddutile@redhat.com;
>>>> Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
>>>> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
>>>> Jonathan Cameron <jonathan.cameron@huawei.com>;
>>>> zhangfei.gao@linaro.org; Nathan Chen <nathanc@nvidia.com>
>>>> Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
>>>> nested SMMUv3
>>>>
>>>> On Fri, Jan 31, 2025 at 02:39:53PM +0000, Shameerali Kolothum Thodi
>>>> wrote:
>>>>
>>>>>>> And Qemu does some checking to make sure that the device is indeed
>>>>>> associated
>>>>>>> with the specified phys-smmuv3.  This can be done going through the
>>>>>> sysfs path checking
>>>>>>> which is what I guess libvirt is currently doing to populate the
>>>> topology.
>>>>>> So basically
>>>>>>> Qemu is just replicating that to validate again.
>>>>>> I would prefer that iommufd users not have to go out to sysfs..
>>>>>>
>>>>>>> Or another option is extending the IOMMU_GET_HW_INFO IOCTL to
>>>>>> return the phys
>>>>>>> smmuv3 base address which can avoid going through the sysfs.
>>>>>> It also doesn't seem great to expose a physical address. But we could
>>>>>> have an 'iommu instance id' that was a unique small integer?
>>>>> Ok. But how the user space can map that to the device?
>>>> Why does it need to?
>>>>
>>>> libvirt picks some label for the vsmmu instance, it doesn't matter
>>>> what the string is.
>>>>
>>>> qemu validates that all of the vsmmu instances are only linked to PCI
>>>> device that have the same iommu ID. This is already happening in the
>>>> kernel, it will fail attaches to mismatched instances.
>>>>
>>>> Nothing further is needed?
>>> -device pxb-pcie,id=pcie.1,bus_nr=8,bus=pcie.0 \
>>> -device pcie-root-port,id=pcie.port1,bus=pcie.1,chassis=1 \
>>> -device arm-smmuv3-accel,bus=pcie.1,id=smmuv1 \
>> I don't get what is the point of adding such an id if it is not
>> referenced anywhere?
> Every QDev device instance has an 'id' property - if you don't
> set one explicitly, QEMU will generate one internally. Libvirt
> will always set the 'id' property to avoid the internal auto-
> generated IDs, as it wants full knowledge of naming.

OK thank you for the explanation

Eric
>
> With regards,
> Daniel

