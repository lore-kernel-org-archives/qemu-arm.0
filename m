Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp231848njk;
        Tue, 16 Jul 2024 07:59:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+zZOtYlci4SzSPc95kOs7ZhlizjynubttlBA4LKQuKsiSEhx22oF5MwxyBqa4BGNu8xhKUeSBkf22oPs6mwuRkXXM2fv0
X-Google-Smtp-Source: AGHT+IFm4GyLBhH9cexZgj3IoJ+jpH8iCzFsxwQ3OMLvkmNvkAapeVNsQ3l+LYcJhDVq1d6KcY34
X-Received: by 2002:ad4:5d6d:0:b0:6b5:5687:8f7a with SMTP id 6a1803df08f44-6b78104eb63mr44172676d6.21.1721141984641;
        Tue, 16 Jul 2024 07:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721141984; cv=none;
        d=google.com; s=arc-20160816;
        b=QYLgKtj8C6uWe40uiX7TVsULqclryo3yw5ZyjtQ2QhH9bgFv+GGfGj9RdiijW/t8WF
         3w034mWeTWO4bIxDpJ/W0KIPLlsgnTT4HtrDIqvDwsQI9oLX2y40fCdChZg1HibMKOe1
         eJNvMapI1QbPrb6200Wo6b1y2l5/OLux7k/4W4o8dQ4FHpVzTWBtNshn2ZVXPcnR2nR/
         0cPBATR+bgZueC4rOYb6LEcYxahRV5uyG2OoPGTUWhM2pTPzBOO2xw0CUj54zeL1cr8t
         bx4Vwcju3E9dBB4mRpxHv1VvAyBkGSrVuttQiW34hZqVv2HHh753wr6htod/hZsYLDIu
         Jgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=S1PxolepRSOrb2n2US5yhZ+v8cjPWcxydv/e3e2gsfg=;
        fh=Ef2Ce9pLfeGc8t3v/ttpdfxZh2APwgi9IxLJ77XHAWo=;
        b=OIIRwOvlvh40ID4hHGwSzRZys6W+T0LDKMcnhQl8/Brk9NsIXnT4ycHpwHiqvOx5fb
         ErG3yD+pG/a6NyEnjS1/7aEDLULi+3k22oextUNppIAuW2ElviK4t0ClLqEXm5jHIONK
         0wF8ptlOXyFIQbt5N1+tbBM6xEtm8LkdfIho4ri4UCsoxNl8hlqAyZgzF7juxtc+RdYj
         3wLryDGxgOQJkJRPwQdTE7yQIHeuzgL/iCjjfW7nw+7VQMDqbuIbZOgNHX6/V6LHgkvC
         FFuHUEZ80KyL4Vh/dBwF3MDflf+jqw10TNuHsyxYCyRcc+gwnaAXuqqUK0my/1Q0D1vJ
         aS/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lgv9MTPu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a41f7dsi76818096d6.485.2024.07.16.07.59.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 07:59:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lgv9MTPu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTjeK-00067z-Lg; Tue, 16 Jul 2024 10:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sTjeJ-000629-FK
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 10:59:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sTjeH-0007BO-QA
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 10:59:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721141964;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S1PxolepRSOrb2n2US5yhZ+v8cjPWcxydv/e3e2gsfg=;
 b=Lgv9MTPuPwObUhv+bGJPze459JPfwFTXXq7+lLcqjmVdf9aPwUAKryUYuVWjSt46XpXFO2
 SsEzwOWSm4DKAdVm5JDdYnTn7akB71rkMjJkDPGxdkYs28G2BRixGz4IevQKSC/rFtsfJm
 Y2dvf8eefMe5AkKBPUx8SNC3BnpRCOQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-APf7pSCEMPyQApwowSrL6Q-1; Tue, 16 Jul 2024 10:59:23 -0400
X-MC-Unique: APf7pSCEMPyQApwowSrL6Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4272718b9b0so40144705e9.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 07:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721141957; x=1721746757;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S1PxolepRSOrb2n2US5yhZ+v8cjPWcxydv/e3e2gsfg=;
 b=emGkeNEDxzyrqxldPwVivmaZw7IgODYInIgCR62YUfT+qisbUrkbBBCOSFtd+YEeH8
 d+yfO7tIWkAB8l6XJyMnzVeImMFlZZrcCI91P9kg8KXCvuKAMLY7gUyL+hak7XSBXHbZ
 VZrljrm939oLFepc61J+gyusoZ4QEROg6OifbbH/s/kpGc86w89vBX8QETkmk/Mji11e
 GExH2asFL39WKBsBkml0OWqzhYXyhtyxSTe8F+dsRzzJDQHGy9qKnw1L5jxaL4PbVtct
 rcR7xBJn33Y6Z4dYGPE5ivm8Hfy3x98KTDhcmwd4ReVEedGgCsMHFpQN9t8geOOwSUc1
 4U+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdp3mzpJfZtPQGcIDEZoMOGTj82GupZSKwttrzOQlBWj/3dgdAE7IzvnG25YTMrNUYAuUI35KAaGBHqFPDuSrsSGIK
X-Gm-Message-State: AOJu0Yy8lsYm5F9Lmnm62LfkkcYt5hF46X/4ehgmZVJ7QUppXGfe/Z7d
 3Tkgd8PW/XDsngg3+PDU4RARVGKyoJ37I/qJ8VRA64iBf2pdUsOTpyq8rDZW/MXJ59yuVkwL1tv
 pCQI1C89kalgaKtjJ5qI/crVk6jPHXKoyz2PihnS0cR2mC5uVhw==
X-Received: by 2002:a05:600c:4f4d:b0:426:6f31:a605 with SMTP id
 5b1f17b1804b1-427ba64599fmr18891125e9.17.1721141957445; 
 Tue, 16 Jul 2024 07:59:17 -0700 (PDT)
X-Received: by 2002:a05:600c:4f4d:b0:426:6f31:a605 with SMTP id
 5b1f17b1804b1-427ba64599fmr18890945e9.17.1721141957087; 
 Tue, 16 Jul 2024 07:59:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dabf02csm9252330f8f.41.2024.07.16.07.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 07:59:16 -0700 (PDT)
Message-ID: <8a642d1e-0ae1-431e-91de-654e717c6894@redhat.com>
Date: Tue, 16 Jul 2024 16:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] VIRTIO-IOMMU/VFIO: Revert IOMMUDevice clear and fix
 hotunplug
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com, jean-philippe@linaro.org, peter.maydell@linaro.org,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com, jasowang@redhat.com
Cc: yanghliu@redhat.com
References: <20240716094619.1713905-1-eric.auger@redhat.com>
 <5f64db5d-7690-4d18-8c31-cfe8e2083f5f@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <5f64db5d-7690-4d18-8c31-cfe8e2083f5f@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: bzKhq8SYBda0

Hi Cédric,

On 7/16/24 16:02, Cédric Le Goater wrote:
> On 7/16/24 11:45, Eric Auger wrote:
>> 1b889d6e39c3 ("virtio-iommu: Clear IOMMUDevice when VFIO
>> device is unplugged" fixes the VFIO hotplug/hotunplug/hotplug
>> sequence by clearing the IOMMUDevice which backs the VFIO device.
>> However this brings other troubles such as a memory corruption.
>>
>> Even when fixing some cleanups that were missed on the first
>> attempt the memory corruption still exists if the IOMMUDevice is
>> freed. Until we understand the exact cause let's make things simpler:
>> let the backing IOMMUDevice survive the unplug as what is done
>> on intel iommu for instance. Clean up/reset resources that would
>> prevent the device from being hotplugged again (probe_done is removed,
>> [host_]resv_regions are reset). By doing this we also rule out the
>> use case of aliased BDFs which is known to be not functional with
>> virtio-iommu (missing guest kernel support) and the virtio-iommu device
>> implementation is not ready either.
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/virtio_iommu_device_clear_fixes_v1
>>
>>
>> Eric Auger (6):
>>    Revert "virtio-iommu: Clear IOMMUDevice when VFIO device is
>> unplugged"
>>    virtio-iommu: Remove probe_done
>>    virtio-iommu: Free [host_]resv_ranges on unset_iommu_devices
>>    virtio-iommu: Remove the end point on detach
>>    hw/vfio/common: Add vfio_listener_region_del_iommu trace event
>>    virtio-iommu: Add trace point on
>>      virtio_iommu_detach_endpoint_from_domain
>>
>>   include/hw/virtio/virtio-iommu.h |  1 -
>>   hw/vfio/common.c                 |  3 +-
>>   hw/virtio/virtio-iommu.c         | 88 +++++++++++---------------------
>>   hw/vfio/trace-events             |  3 +-
>>   hw/virtio/trace-events           |  1 +
>>   5 files changed, 35 insertions(+), 61 deletions(-)
>>
>
>
> Tested-by: Cédric Le Goater <clg@redhat.com>
>
> with a vfio-pci device (mlx5 VF) and a virtio-net-pci device.

Many Thanks!

Eric
>
> Thanks,
>
> C.
>

