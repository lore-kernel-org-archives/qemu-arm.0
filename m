Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp6166232njd;
        Mon, 28 Apr 2025 11:41:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXsG5zl2jU3UZfB5UT9XtM+XflWM8RM6j99twtQon8s7ezDVTThnKBJ77l+aN7YFnaU6HCY55pJrw9bg==@linaro.org
X-Google-Smtp-Source: AGHT+IFwXPRLMnv+I3CgcwmweaBxOX+hgzTedZue96vBTaxQExMyKttfRw7P05Py0YqL7d72L3FZ
X-Received: by 2002:a05:620a:1920:b0:7c5:49c9:e4ae with SMTP id af79cd13be357-7c9668851a4mr1728238685a.32.1745865716022;
        Mon, 28 Apr 2025 11:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745865716; cv=none;
        d=google.com; s=arc-20240605;
        b=kReI+1B9jc34dNsNCS/CsZ+rYLPM7t8ZztDwycKobz8/ui2FF/8I49wRNFcTrjkEai
         vcf226hg/bHUXA5Or4fsIel5XlTvl/VOs/B2tWyB6vTwH6/nA3xzydARcbmG7UG0FYy5
         DaZYvS2ezl2+omwfrljrs8EjU9FuAzfnfsM0nCZolyMxDGNT7LNQD5mlYni/FWhniKuO
         aOfLwHlafAyu2DCb+cy8e//jVpVF2TrU1Up2NR17SDt07/RyPDlwlE37VvM/su1DzgPa
         wF/xLFsD5MQs6V3zaArx/4P5JBD2ije2iZumIT8pXPHZMrIQUwQNC06Zb/mIK4hrfAlV
         pq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=a6If9EO/h7rU4F1PikJSkICcwblsjKckeKQKcOucDD4=;
        fh=WCQFMXa6ASwRuyLuiFU2CGx1D48oZU6pc00A6tBFag0=;
        b=Svo9b+H/YH3MCfCGjFmsxoFbgg1NvWPofkI7s799PtGcg7uWO9Pq0Y6yVRTlFWG+b/
         T8QCEjKa1aC0Mc2VsgbvudCubsMx1dOESbHQqjkRyWPjI6lqynfHRBxJ0Wgm/rvrKYK1
         C1aO4Pz36ZHE5sMU0GTEwYFBqv/au3aATzdUX6XXAeGn3dxeXH9F+tUkWSRbRbig91ML
         /GKJ8G2T6lhTrdhV10VNpKTbxQ6+Ot5cK3EIThY/mtDEQoL8srIk6VgEv1BuglpbSV1p
         AV+If+AmUg6EMFO7TSUR31WMJBGlQO6vNVw+8qK7ZnTmjvljpBY3volR5Q3V0Pt9YG6C
         eiog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cEm3+8yl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ea1f95bf9si113248231cf.454.2025.04.28.11.41.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 11:41:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cEm3+8yl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9TQH-0008Ki-Rl; Mon, 28 Apr 2025 14:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1u9TQF-0008KR-VV
 for qemu-arm@nongnu.org; Mon, 28 Apr 2025 14:41:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1u9TQC-0000lZ-Ob
 for qemu-arm@nongnu.org; Mon, 28 Apr 2025 14:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745865698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a6If9EO/h7rU4F1PikJSkICcwblsjKckeKQKcOucDD4=;
 b=cEm3+8yl9WDxi57nPQF0WKRVykWPH9xbUXHcOIjj4Y55jbPBlU8UEoUU7RJbYg5EDe6XJz
 4HBYSir7I3ni7Yz5W3WopUurfd1LjOdh2PrQgxWxzdRjHZaGvo4x6qZfAMu6IScZIAwSmt
 ufHH5Ho+Q19e22fGOmXo9Njc9acH8F8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-V_BjrcQqOHaa1_poyXQHkg-1; Mon, 28 Apr 2025 14:41:36 -0400
X-MC-Unique: V_BjrcQqOHaa1_poyXQHkg-1
X-Mimecast-MFC-AGG-ID: V_BjrcQqOHaa1_poyXQHkg_1745865696
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c544d2c34fso754737085a.1
 for <qemu-arm@nongnu.org>; Mon, 28 Apr 2025 11:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745865696; x=1746470496;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a6If9EO/h7rU4F1PikJSkICcwblsjKckeKQKcOucDD4=;
 b=b5OiVRO8o5versrVU8Xg97AME+8v5TFhRVrC9GDr5eugmK+PvRjhncZNUCWGD/Ocq5
 UOBGELyw85T+3fG05YhS3KAfGIPMqgcBYRlH8mvP/2yZ2i9RuESh+ZeAKwVSMEk5+k+0
 /cbjHtPHQ5drj/9c6ekkr7hXb1tD5lcf/3LaQ+4sbAdmbQ9R1qUWeY+LNZIAaMglD7u8
 7PKGMDx6kKrLNv7WJDMGbjb67sQVHl7A3M3fyvKacq74F1R33xufbcN8viSdzpEire0F
 7hAeAiCLQEEz6GPGvxuY8E8EF6XXNz9dbyd/M4+8EEoUe9LRROX5U2Lk3FDUOrNUicC1
 Pnig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyfcgcZP2UReBR6IB03X4AFj538g4L6CA5/tFSNSbS9LDPl3W9bEShMEVLJYTyK9jWpHl1+krr3A==@nongnu.org
X-Gm-Message-State: AOJu0YzJwYNvmglypw+dSM/Fa/ChMz0Qh6oTa41PNTh2ZXjtbEmtvGFC
 cFaoITASNCwNsygf4OuK064bt0x3hJ9HiZXg4Wimk+4XIfOITTFJGVBiXRPEb8dQFeEu9/xwT2e
 a9Si1z3nfUvbwmAYmukvQsTdFvrT116RkbwCH8Ti7wLq04RWAqQ==
X-Gm-Gg: ASbGnctGJ/8dxd9HYkCc22DlVOYVWa0+TGIZB7J2OSpDd5SlfF4vZVNAmRMY29Zbwxh
 rUBBEHfFqZvMvv7OpI4eYo5w2h4x9cMxV6nAG7cT00MwrZ45X/1U2lTls4BD++2psV/Fy7zCEih
 8eWx70Qg90Efqx28zD/ZkVO5cbBrd4jQWxS4zcxo+3Qr0obvBMzk2Y+X1DiKDIDs+sRdrJWnuIN
 7R9bqzk8IpKOiXNNOJWWwuscOftQ1+woQQrkZwPGpaQuteMi0A458q4CSWDT6vjPRp631xdDat+
 CDW60ro0JVl1
X-Received: by 2002:ac8:5889:0:b0:476:790c:739a with SMTP id
 d75a77b69052e-48131806878mr181232231cf.20.1745865695708; 
 Mon, 28 Apr 2025 11:41:35 -0700 (PDT)
X-Received: by 2002:ac8:5889:0:b0:476:790c:739a with SMTP id
 d75a77b69052e-48131806878mr181231821cf.20.1745865695227; 
 Mon, 28 Apr 2025 11:41:35 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4811f9bafdasm44820691cf.50.2025.04.28.11.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 11:41:34 -0700 (PDT)
Message-ID: <7446ba2c-0dbb-44dc-9e48-300f431dcf85@redhat.com>
Date: Mon, 28 Apr 2025 14:41:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add support for user creatable SMMUv3 device
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250415081104.71708-1-shameerali.kolothum.thodi@huawei.com>
 <84870c74-f078-48c5-bead-96db1d582987@redhat.com>
 <8f7cc59e3745407bb7ae3d875cf97ae0@huawei.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <8f7cc59e3745407bb7ae3d875cf97ae0@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jBbP7-dma2VZklkaxzpZPAzegKG4e-3nFDiH5_ASnas_1745865696
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.484,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ivR3ND17i52n



On 4/22/25 4:57 AM, Shameerali Kolothum Thodi wrote:
> 
>> -----Original Message-----
>> From: Donald Dutile <ddutile@redhat.com>
>> Sent: Friday, April 18, 2025 9:34 PM
>> To: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>> qemu-devel@nongnu.org
>> Cc: eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
>> nicolinc@nvidia.com; berrange@redhat.com; nathanc@nvidia.com;
>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>> Subject: Re: [PATCH 0/5] Add support for user creatable SMMUv3 device
>>
>> Shameer,
>> Hi!
>>
>> First off, like the partitioning of these pieces.
>>
>> On 4/15/25 4:10 AM, Shameer Kolothum wrote:
>>> Hi All,
>>>
>>> This patch series introduces support for a user-creatable SMMUv3 device
>>> (-device arm-smmuv3-dev) in QEMU.
>>>
>> Can we drop the '-dev', as 'arm-smmu' is sufficient, as is '-device'?
>>
>> I know, internal to QEMU, there's already an ARM_SMMU, but as suggested
>> later,
>> if it uses the same struct, the qemu cmdline syntax is a bit less redundant.
> 
> Trust me I tried that😊. The problem is that, the legacy one doesn't have a bus
> associated with it and the moment we change that and have bus specified for the
>   "-device arm-smmuv3, bus=pcie.0" the legacy smmuv3 creation in virt,
> 
> create_smmu() --> qdev_new(TYPE_ARM_SMMUV3)
> 
> will fails as it expects the bus type to be specified for it. I couldn't find a way
> to solve that.
> 
I guessed that's why there was new syntax for what is basically an extension of previous syntax.
I'll dig more into it and see if there's a way to handle it.
qemu does handle varying added params (id=blah, no id=blah),
so I'm researching how that's done, to figure out how the legacy, smmu-for-all,
and the smmu-for-specific pcie<RC> can both be supported.
Given your stated trials and tribulations, this should be fun. ;-)
- Don

>>
>>> The implementation is based on feedback received from the RFCv2[0]:
>>> "hw/arm/virt: Add support for user-creatable accelerated SMMUv3"
>>>
>>> Currently, QEMU's SMMUv3 emulation (iommu=smmuv3) is tied to the
>> machine
>>> and does not support instantiating multiple SMMUv3 devices—each
>> associated
>>> with a separate PCIe root complex. In contrast, real-world ARM systems
>>> often include multiple SMMUv3 instances, each bound to a different PCIe
>>> root complex.
>>>
>>> This also lays the groundwork for supporting accelerated SMMUv3, as
>>> proposed in the aforementioned RFC. Please note, the
>> accelerated SMMUv3
>>> support is not part of this series and will be sent out as a separate
>>> series later on top of this one.
>>>
>>> Summary of changes:
>>>
>>>    -Introduces support for multiple -device arm-smmuv3-dev,bus=pcie.x
>>>     instances.
>>>
>>>     Example usage:
>>>
>>>     -device arm-smmuv3-dev,bus=pcie.0
>>>     -device virtio-net-pci,bus=pcie.0
>>>     -device pxb-pcie,id=pcie.1,bus_nr=2
>>>     -device arm-smmuv3-dev,bus=pcie.1
>>>     -device pcie-root-port,id=pcie.port1,bus=pcie.1
>>>     -device virtio-net-pci,bus=pcie.port1
>>>
>>>     -Supports either the legacy iommu=smmuv3 option or the new
>>>     "-device arm-smmuv3-dev" model.
>>>
>> nice! :)
>> Can it support both? i.e., some devices using a system-wide, legacy
>> smmuv3,
>> and some pcie devices using the -device arm-smmuv3 ?
> 
> Please see my reply to patch #2. In short No, it doesn't support both.
> 
> Also I think we should slowly deprecate the use of legacy SMMUv3 going
> forward unless there is a strong use case/reason to support it.
> 
>> If not, then add a check to min-warn or max-fail, that config.
>> I can see old machines being converted/upgraded to new machines,
>> and they will want to switch from legacy->device smmuv3, and catching
>> an edit/update to a machine change (or enabling automated conversion)
>> would be helpful.
> 
> Please see Patch #4. It already checks and prevents if incompatible SMMUv3
> types are specified. Or is the suggestion here is to add something extra?
> Please let me know.
> 
> Thanks,
> Shameer
> 

