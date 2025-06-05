Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp127694njc;
        Thu, 5 Jun 2025 03:02:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV8+iwG9YvxmfXtoAbahtXHvS2PM/zMziKNQD8jQMY41k29LxUbs6eRHJxR+jUPZYjExK9Dz4bnslCXAg==@linaro.org
X-Google-Smtp-Source: AGHT+IEie6m/5raWeiQZgo0at1gHijhLlVCpB3HBNPhdFNiTIt8DvAo0ADF5mch+S5Rr57B5s25A
X-Received: by 2002:a05:6214:2501:b0:6fa:9a6e:ee36 with SMTP id 6a1803df08f44-6faffe84225mr41760496d6.13.1749117755967;
        Thu, 05 Jun 2025 03:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749117755; cv=none;
        d=google.com; s=arc-20240605;
        b=gNsm8mimQioTbGIGmmNkAofKEblb+2Pad7D6sdq1qFNim2ZpL+gi3sB6/Ryy4RNrcm
         pNHn7ySh2rbQiMp5LZX0meOCwxNnSQjEszQIBxc0HwzpeP/POihSpNjBYsrrAy4qfR3D
         4LHJJ2h8bnxC0sz5dqiW4KL/sPlDvLXDZkqKh2tzfOof1i0967ooaB6auvg6lQYuiGWT
         b59RoLaMPFjf2TbVSa8LNDiJVWtyNzsFGleonKa+3A9MF4tpluNJwAltES7ik599YF5M
         NxxfBm3AfAmR0tCsf0a+YlxHlpi28J8lCvn40hURE+PTTIQ+IZ781Jn0mjbMi4bX83rD
         gZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:references
         :cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/HEoOMSqXtdi0Q51L1Ph5UeJyMg5C6Ya+67lIbUsoJY=;
        fh=WB+keIl1Wh8GDoCC9xGmzhepiTDGlMNr0/C3Is+O82Q=;
        b=G5yP/8FUGpQ1iBVze3JUA1PqlNTNFZF/8NpzD76Pkl+gpt/Z9b9PX4L97lUF/qqSCB
         rZnFADVRWwiIMSxqf4F7B6R7x/LutbdfJd0z1B9Cw6TyxN5I/c5EsxbEyEvO7LcnOgkx
         bQMEXEXvEvThScfMwUjRB2Z6xNUxGJ92OTG24Ja6Pz97P0UzVosaiZkWbztfmwIFkuXD
         eJobo1xN7F9eTxZygoGeux7ufGtSZIkkwZCG4XhJbqLeTpIFQyF94CRr02jU7JOgXwoS
         fGBtpbZZe7oOJjvsbmaDLgWaHhAsNk3MAdKa77oZ3FudhgOaSu3kyzCSFkat2vbZQcG0
         hMsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XxCtwsne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fac6dab970si166079196d6.51.2025.06.05.03.02.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 03:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XxCtwsne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uN7QX-0000qS-3c; Thu, 05 Jun 2025 06:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uN7QV-0000qC-FB
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 06:02:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uN7QU-0004aj-2p
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 06:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749117736;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/HEoOMSqXtdi0Q51L1Ph5UeJyMg5C6Ya+67lIbUsoJY=;
 b=XxCtwsnegnxPgisrOc0GOqCW0S5Py404u1fR7UPL9LcOLfctUtrVdZ1bCFH8LRKTA5WzDe
 3+OPRoKw1/S675zinjNNOAP2YWk/tfEUYIrL/GPOsMP3xgoFKGB9biFVZpabZ4BQERy7DV
 wjyeJVzTvav4Q6ApLNBBV/pqmn+z7uc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-T8gtU5JDNRWtf5MPxMUg2w-1; Thu, 05 Jun 2025 06:02:14 -0400
X-MC-Unique: T8gtU5JDNRWtf5MPxMUg2w-1
X-Mimecast-MFC-AGG-ID: T8gtU5JDNRWtf5MPxMUg2w_1749117727
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-450787c8626so4177575e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 03:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749117727; x=1749722527;
 h=content-transfer-encoding:in-reply-to:references:reply-to:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/HEoOMSqXtdi0Q51L1Ph5UeJyMg5C6Ya+67lIbUsoJY=;
 b=WRhlviZDAkSFhrWJEjI01xxhEGosUJLnuhgYD59Xdcg3F01J2NfomkwsBQgAKBvv5L
 ZWvWLJl7OG+4FRbhCJl2BsSfubq3MnZeaPm1iSNkIbBPVTVCdhg4Xboxd7P7DkXXX6jZ
 lBUxTeGfiOnmplfuHZFOhJL9ueEuQ5kon3E8OrrzB2klDYSkvBPrjqMJrxVx9AE/OwZE
 KJGaH/dqkEcmJKWKz6QlryFj+VUkuS6rwsyvSTwpT6e2wH0ePFrSsS2oHDsAWfpJDDW1
 AfZfNP61A8FYd4NhLmX9JrBoo78apgkYZ89v3M4jThIR3FBk1SWvrB2Vnpc2hJpRrLPv
 oMrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy8ZhOFh23APERH2IJ1GtiIac+FtRwk8yLURZxxXiDqSyISHOdFFI/dEulP+eolLu2jCVrNhwLfQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw9GXsnJ3PFMPXlM7U7hNt5z3iuJpWLAMq1aejVxUVIkLOts2DM
 Q42HmXiy8ZaVqQpyEgBAeVtVe/+yhfR+0ShyEVMnf7YoCrzZQOtd76zam1EwckyvRjA9+iNbiiX
 uon+11DD7mdx+rEQIwkGwwdJIFtMFvWx3KVLL4tNZuYJwuTNmC3kaLA==
X-Gm-Gg: ASbGncs4We1slbRT+BoZHLSUCAxB5FCzeChZKCphnt6RjRulvuW8+SZf16yN6x19iPY
 0kId0z76+azEtj2YC5Yzax+xtbrajPpC0/emyVi2GsU8t5Csughc9mUhn9TCgJYzf7NSB9WQixH
 jHzSLea4RAwOHGCG7SGdjytTXK+s+Kl9S+eixtmyeemAPfQ4tLzBPjMfGLifi3ckjgvKvsXSZid
 vslPFcpN2v36C/OAIocW6wZaVG1hN4h6z1FIWG+cg7wGu5YimLgFwv5gYABHQ6i4b+fWi3xP+s6
 cERAC/XlclswpH/eKQmnPIc1D8QvNnUqBSWbYXSdHi1n7xpDINyEADYhPF0cgE5jPlUgsg==
X-Received: by 2002:a05:600c:1c97:b0:450:d3b9:4ba4 with SMTP id
 5b1f17b1804b1-451f0a6073fmr56892515e9.2.1749117727085; 
 Thu, 05 Jun 2025 03:02:07 -0700 (PDT)
X-Received: by 2002:a05:600c:1c97:b0:450:d3b9:4ba4 with SMTP id
 5b1f17b1804b1-451f0a6073fmr56891785e9.2.1749117726422; 
 Thu, 05 Jun 2025 03:02:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451f9924a6esm18909195e9.38.2025.06.05.03.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 03:02:05 -0700 (PDT)
Message-ID: <cb2a688d-fbf2-497e-8baf-f28352766105@redhat.com>
Date: Thu, 5 Jun 2025 12:02:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] hw/arm/smmuv3: Check SMMUv3 has PCIe Root Complex
 association
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com>
 <20250602154110.48392-2-shameerali.kolothum.thodi@huawei.com>
 <15b1fd04-2dd0-4191-8958-9d8db8dff7c9@redhat.com>
In-Reply-To: <15b1fd04-2dd0-4191-8958-9d8db8dff7c9@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YnUTG32oRz4MTSA061AO4_TwaNAHBKkeHAbFEA3DmyY_1749117727
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Reply-to:  eric.auger@redhat.com
X-ACL-Warn: ,  Eric Auger <eric.auger@redhat.com>
From:  Eric Auger via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kvuH2ucnWsRk



On 6/5/25 11:53 AM, Eric Auger wrote:
> 
> 
> On 6/2/25 5:41 PM, Shameer Kolothum wrote:
>> Although this change does not affect functionality at present, it is
>> required when we add support for user-creatable SMMUv3 devices in
>> future patches.
>>
>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> ---
>>  hw/arm/smmuv3.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index ab67972353..7e934336c2 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -24,6 +24,7 @@
>>  #include "hw/qdev-properties.h"
>>  #include "hw/qdev-core.h"
>>  #include "hw/pci/pci.h"
>> +#include "hw/pci/pci_bridge.h"
>>  #include "cpu.h"
>>  #include "exec/target_page.h"
>>  #include "trace.h"
>> @@ -1881,6 +1882,13 @@ static void smmu_realize(DeviceState *d, Error **errp)
>>      SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
>>      SysBusDevice *dev = SYS_BUS_DEVICE(d);
>>      Error *local_err = NULL;
>> +    Object *bus;
>> +
>> +    bus = object_property_get_link(OBJECT(d), "primary-bus", &error_abort);
>> +    if (!bus || !object_dynamic_cast(bus->parent, TYPE_PCI_HOST_BRIDGE)) {
>> +        error_setg(errp, "SMMUv3 is not attached to any PCIe Root Complex!");
>> +        return;
>> +    }
> shouldn't you check as well that !pci_bus_bypass_iommu(bus)?

I see you do the check in 6/6 and I think this is the correct way
because in case of legacy SMMU it is allowed to have
pci_bus_bypass_iommu set on the root bus to let the SMMU apply only on
pxb buses only. So please ignore this comment.

Eric
> 
> Eric
>>  
>>      c->parent_realize(d, &local_err);
>>      if (local_err) {
> 

