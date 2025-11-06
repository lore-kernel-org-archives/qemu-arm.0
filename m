Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2EACCF9F8
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Nov 2025 07:43:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGudp-0003UF-Fj; Thu, 06 Nov 2025 02:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGudk-0003T9-EY
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 02:42:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGudi-0000ZT-KW
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 02:42:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762414957;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wtZkFzJvAWKRTuLvfQKCt2G5L1fwhTXwQ3aqq8468eo=;
 b=dk0GCFqQq4bGU1E2ztNqgm57wc6zPf7+sPyH9ZFni9kUeLpmwJCmg4JKCjOOSnH9IaMGvb
 ae3jv4hNoxMTFPx3VQUOzP8+q16lQdxIpZl9LFi8CRanrM2e2+wEUCAAgUDQmkA2Lhv1ba
 8/4/irc9A4aq3Y0PViOHrcHnMMxHy5A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-8Yhi0PjFNXWzFA7YsHLmfw-1; Thu, 06 Nov 2025 02:42:35 -0500
X-MC-Unique: 8Yhi0PjFNXWzFA7YsHLmfw-1
X-Mimecast-MFC-AGG-ID: 8Yhi0PjFNXWzFA7YsHLmfw_1762414954
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-477594aad41so3147725e9.2
 for <qemu-arm@nongnu.org>; Wed, 05 Nov 2025 23:42:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762414954; x=1763019754;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wtZkFzJvAWKRTuLvfQKCt2G5L1fwhTXwQ3aqq8468eo=;
 b=nb8kRshBakHarOkMMkd6UtOJAVhCZtXZMMLpYfSSQtvFBX2x9fZvZDplXkKQw4IpN7
 R8v6Y4KMob1Rbt8De9+YP1MumVARbnubR0ghVjNoGOONcNXUR8wrniuwtoOmO4S5hRc5
 dCq185e7uAG04+8FJG6g2rfdw2QchuLVedRYKvH63pfcq383OqwY+iXBGPo/fleEFevV
 xDM5a+TGn/0AIiXxmAsX3lRH202/q0Qs3ecDh5+BZhfIQ0Y0iUSSsq9dOoV5wBQJSp6L
 DWPdjQTKxlQbWLEZJvyZZWIEESn8uRTxZWL0ctpgWGkKkZ24QYcF8ldJTwY9bzXJ8wXR
 v2dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe9ZsKYf2K2Hob+AdzoS8EmG7gmnVkQ7EdVYJCsCfPF8oLQ9Xzom38v82C/d1x7efbDqJACTaTlQ==@nongnu.org
X-Gm-Message-State: AOJu0YxTJJCH+bRBW+aBKUS69SU6iBqdu/w2ewmhUqZvfO/SpUcUGSdK
 QQuXf8lkd39371x/qX4gbOa8MZAZI6okyPl4X+nueZYPC/iNHrxMSDtbArmTe9YtcEH2GpJzLfV
 ko5z4KGRoZru8g1m6WbsxUNez3m/S1aSTs7G3RbwK6PQJa3odfcBAFg==
X-Gm-Gg: ASbGncuEehNk49hK1TaxZmL4TwCLAcM2MM64zF0ZZibxqUL7Z7cgQREtTN1M3g7Wu29
 kO6wVq+fkTXk3Jp1mUFBIxw5OsZUU3TJM70HY4aAnscFTcgO6q/2IB6UYFh5wN8biIx/OLJuIC1
 mCFELUmTWSU15yuEF2Q8K2xEuHJab+0uxe/lrODyUlCKFsR0xHnHDy09xfw6XShDc8KVpxzdc6a
 ri91f0nbVH1Cbxf5qClW0aKowC0aMWQKBWyKpdJA8PuVqW8qF5MkokAfioeQ2SBRQONeaBPqog6
 LcRVOZ3ejtdO08zw6pCdJZg2HpjVbhvlo79LoqNYVYONkA9JhaFhfD0n5O5Lu6Sdy8OgNOSb11Y
 CSmNDPVi+p37GiLDc5MQF8qxMqp+1tsW8KnJ6Oe/sP9B3tQ==
X-Received: by 2002:a05:600c:37c8:b0:475:dd04:1289 with SMTP id
 5b1f17b1804b1-4775ce61f4amr49182455e9.20.1762414953715; 
 Wed, 05 Nov 2025 23:42:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZ6PIRyBdIoS3GRYmeIHD82Ao6Vjc3D23Q0MnHcaBrNJ1C0qX6rZrUIYwbWjUG9OKdDVQcGA==
X-Received: by 2002:a05:600c:37c8:b0:475:dd04:1289 with SMTP id
 5b1f17b1804b1-4775ce61f4amr49182135e9.20.1762414953325; 
 Wed, 05 Nov 2025 23:42:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477641b622asm9655905e9.4.2025.11.05.23.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 23:42:32 -0800 (PST)
Message-ID: <f0c5945d-ec24-4bb9-827c-c3e57abdea36@redhat.com>
Date: Thu, 6 Nov 2025 08:42:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/32] hw/pci/pci: Introduce optional
 get_msi_address_space() callback
To: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameer Kolothum <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Nathan Chen
 <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>
References: <20251031105005.24618-16-skolothumtho@nvidia.com>
 <318947de-4467-4ced-a5d2-929e3df210ef@redhat.com>
 <CH3PR12MB754815B9B902E7EF66B0A1B9ABC4A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <85f315a2-e49a-4330-9419-48a8a3a4a3e3@redhat.com>
 <CH3PR12MB754844745DF256D7FF2CB07AABC4A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <e4fd6d1e-3fca-457b-ac6a-69e721d799f4@redhat.com>
 <CH3PR12MB75489F2161213432D34688D2ABC5A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <7ac24d9a-0caf-48cb-832c-812fecc5c82c@redhat.com>
 <20251105181049.GU1537560@nvidia.com> <aQuYZM/8SX+RtDtv@Asurada-Nvidia>
 <20251105185816.GW1537560@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251105185816.GW1537560@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: plR-_3lEtI2-ISfAwFYxfcRNzWqXyogRm08cbg6SXW8_1762414954
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 11/5/25 7:58 PM, Jason Gunthorpe wrote:
> On Wed, Nov 05, 2025 at 10:33:08AM -0800, Nicolin Chen wrote:
>> On Wed, Nov 05, 2025 at 02:10:49PM -0400, Jason Gunthorpe wrote:
>>> On Wed, Nov 05, 2025 at 06:25:05PM +0100, Eric Auger wrote:
>>>> if the guest doorbell address is wrong because not properly translated,
>>>> vgic_msi_to_its() will fail to identify the ITS to inject the MSI in.
>>>> See kernel kvm/vgic/vgic-its.c vgic_msi_to_its and
>>>> vgic_its_inject_msi
>>> Which has been exactly my point to Nicolin. There is no way to
>>> "properly translate" the vMSI address in a HW accelerated SMMU
>>> emulation.
>> Hmm, I still can't connect the dots here. QEMU knows where the
>> guest CD table is to get the stage-1 translation table to walk
>> through. We could choose to not let it walk through. Yet, why?
> You cannot walk any tables in guest memory without fully trapping all
> invalidation on all command queues. Like real HW qemu needs to fence
> its walks with any concurrent invalidate & sync to ensure it doesn't
> walk into a UAF situation.
But at the moment we do trap IOTLB invalidates so logically we can still
do the translate in that config. The problem you describe will show up
with vCMDQ which is not part of this series.
>
> Since we can't trap or mediate vCMDQ the walking simply cannot be
> done.
>
> Thus, the general principle of the HW accelerated vSMMU is that it
> NEVER walks any of these guest tables for any reason.
>
> Thus, we cannot do anything with vMSI address beyond program it
> directly into a real PCI device so it undergoes real HW translation.
But anyway you need to provide KVM a valid info about the guest doorbell
for this latter to setup irqfd gsi routing and also program ITS
translation tables. At the moment we have a single vITS in qemu so maybe
we can cheat.

Eric
>
> Jason
>


