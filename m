Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA36CCFA04
	for <qemu-arm@archiver.kernel.org>; Wed,  5 Nov 2025 08:56:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGZJu-0003Oj-A1; Wed, 05 Nov 2025 03:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGZJt-0003OQ-0t
 for qemu-arm@nongnu.org; Wed, 05 Nov 2025 03:56:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGZJq-0000gE-OC
 for qemu-arm@nongnu.org; Wed, 05 Nov 2025 03:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762333001;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oV0eH2fnsHPKBZMKWQmLdWCFgLGJVUO5pHkQrBWUa3c=;
 b=GKD5b/ZbGWobhmhN3+4CaX/nX4Eo4VpzeLyjaru2YKU0jhOBd2btnJLPUIwZnomNPZvZAZ
 ra3oNKym0TdGOAL7oF9xDyebTyGm0ppepUOmOp6ge76hf79HOIlxi9+IX4H+n3Lm6qxP3Y
 zI1bMa+CHRK4Eh3ux6+kiOvM/x77s/s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-j083-ZOCNM2m9GZwgnshZg-1; Wed, 05 Nov 2025 03:56:38 -0500
X-MC-Unique: j083-ZOCNM2m9GZwgnshZg-1
X-Mimecast-MFC-AGG-ID: j083-ZOCNM2m9GZwgnshZg_1762332997
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-471001b980eso46693715e9.1
 for <qemu-arm@nongnu.org>; Wed, 05 Nov 2025 00:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762332997; x=1762937797;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oV0eH2fnsHPKBZMKWQmLdWCFgLGJVUO5pHkQrBWUa3c=;
 b=YQ7h7IgtLLBQYPl949zP7sfq2hDfS97u2jMpB+xEPaee1+5lB9PwyqDoDqUxJtLrEs
 GhteIDv34bBlOvbn7d9H9mnet+Cz1CmIp8jAX+0Y0API0+2Xk2/cLvjEGUnEkMm3fjcU
 V/eGox1dkFllyStxZ8S3kseuz8vLG6yAMCERiBhjjSlhvvep3pV97ojaJl3G6GvhSjxb
 zPzD0IK85mo6WrgKg6S9tbJ2k8uBhigFC97qUQ/xpHiu1pcdbrJUus8L5uz8VgDHeL7U
 fuyIpzvL+RT1eYnUJjFX2uSpymm70j6wT7RCDDw1xFM1phanGs8Z++5sVZYouLc1MdsQ
 hS8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQTmh8ICkGe3Ws+72qrbmUYdPIS1Sd3dwrwCZtiMpuzuhrBcdYh2Q+uvkTU6/G1CAmp05q0iOjFA==@nongnu.org
X-Gm-Message-State: AOJu0YwL4eoGb5j6lCINcmHHq6zjxFOFZlqoSFAJehM5kAGffSnScZ3j
 p9wMKq2IopWGdbMQT2GoYsCp7g8zhxsR9kFE81tG1ytNaycaUlz+OYSt2elc4yKHyXw7822DEFY
 ABrbwqafl6G/y1OReDFanLMpqOSyw85ZAUeSpSquCh85smxxkXaxUrw==
X-Gm-Gg: ASbGncuSH/8/H+tPeT3CQZ9FT/oTYEvT6Cg/+1q5c6v+sIDVEW42kTySj8qctJMg4k7
 Uz87ZPM9wVli0LVh+XB6PLXgg2kJUQahx54/qY1SuFf9gyZqzODGajpVWP9rFbKwveKM/egNUOZ
 DnS+8sX5SmPrkjmkrgu3bwRUAuIBRuHGl3422S0tNNKYg97X2nUhHh97pCRQBXZ8I3l4SQQ6x8N
 SLo629NUQW/ZROsWxGm/+YLsQL/4aZ3k8Rz7AAeVjlwU/QlaCgAghSS3bGJ2Ob0+xRYLT69yVIa
 iTrb+mQbncVcJVf1Rpbt2BfGY4RorkWpX6Te7p3x8GRWqofgCy/BiroajsQLcW1H7odtnPd/BhC
 S1aIFeDaGJmeEkDa4WMrd/u9sYMwhXrfUWvdtnoifZ34KLg==
X-Received: by 2002:a05:600c:1d88:b0:477:54cd:202e with SMTP id
 5b1f17b1804b1-4775cdad6aamr19599805e9.2.1762332997259; 
 Wed, 05 Nov 2025 00:56:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPeRD7UuhtxIsBnds0goi9YLmW1c7okpmgUFqWx34NsYUJL9GSYeKfaQ4hXYjW/Cv4QYUalw==
X-Received: by 2002:a05:600c:1d88:b0:477:54cd:202e with SMTP id
 5b1f17b1804b1-4775cdad6aamr19599495e9.2.1762332996774; 
 Wed, 05 Nov 2025 00:56:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775cdc96edsm36138835e9.6.2025.11.05.00.56.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 00:56:36 -0800 (PST)
Message-ID: <e4fd6d1e-3fca-457b-ac6a-69e721d799f4@redhat.com>
Date: Wed, 5 Nov 2025 09:56:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/32] hw/pci/pci: Introduce optional
 get_msi_address_space() callback
To: Shameer Kolothum <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>,
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
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-16-skolothumtho@nvidia.com>
 <318947de-4467-4ced-a5d2-929e3df210ef@redhat.com>
 <CH3PR12MB754815B9B902E7EF66B0A1B9ABC4A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <85f315a2-e49a-4330-9419-48a8a3a4a3e3@redhat.com>
 <CH3PR12MB754844745DF256D7FF2CB07AABC4A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB754844745DF256D7FF2CB07AABC4A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z3C_oxHepg-RikH5Akz6vb8G2FACuD5YPSzU-Ks4Qco_1762332997
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.788,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

Hi Shameer,

On 11/4/25 4:14 PM, Shameer Kolothum wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 04 November 2025 14:44
>> To: Shameer Kolothum <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>; Nicolin
>> Chen <nicolinc@nvidia.com>; ddutile@redhat.com; berrange@redhat.com;
>> Nathan Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; yi.l.liu@intel.com;
>> Krishnakant Jaju <kjaju@nvidia.com>
>> Subject: Re: [PATCH v5 15/32] hw/pci/pci: Introduce optional
>> get_msi_address_space() callback
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 11/4/25 3:37 PM, Shameer Kolothum wrote:
>>> Hi Eric,
>>>
>>>> -----Original Message-----
>>>> From: Eric Auger <eric.auger@redhat.com>
>>>> Sent: 04 November 2025 14:12
>>>> To: Shameer Kolothum <skolothumtho@nvidia.com>; qemu-
>>>> arm@nongnu.org; qemu-devel@nongnu.org
>>>> Cc: peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>; Nicolin
>>>> Chen <nicolinc@nvidia.com>; ddutile@redhat.com; berrange@redhat.com;
>>>> Nathan Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>>>> smostafa@google.com; wangzhou1@hisilicon.com;
>>>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>>>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; yi.l.liu@intel.com;
>>>> Krishnakant Jaju <kjaju@nvidia.com>
>>>> Subject: Re: [PATCH v5 15/32] hw/pci/pci: Introduce optional
>>>> get_msi_address_space() callback
>>>>
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> Hi Shameer, Nicolin,
>>>>
>>>> On 10/31/25 11:49 AM, Shameer Kolothum wrote:
>>>>> On ARM, devices behind an IOMMU have their MSI doorbell addresses
>>>>> translated by the IOMMU. In nested mode, this translation happens in
>>>>> two stages (gIOVA → gPA → ITS page).
>>>>>
>>>>> In accelerated SMMUv3 mode, both stages are handled by hardware, so
>>>>> get_address_space() returns the system address space so that VFIO
>>>>> can setup stage-2 mappings for system address space.
>>>> Sorry but I still don't catch the above. Can you explain (most probably
>>>> again) why this is a requirement to return the system as so that VFIO
>>>> can setup stage-2 mappings for system address space. I am sorry for
>>>> insisting (at the risk of being stubborn or dumb) but I fail to
>>>> understand the requirement. As far as I remember the way I integrated it
>>>> at the old times did not require that change:
>>>> https://lore.kernel.org/all/20210411120912.15770-1-
>>>> eric.auger@redhat.com/
>>>> I used a vfio_prereg_listener to force the S2 mapping.
>>> Yes I remember that.
>>>
>>>> What has changed that forces us now to have this gym
>>> This approach achieves the same outcome, but through a
>>> different mechanism. Returning the system address space
>>> here ensures that VFIO sets up the Stage-2 mappings for
>>> devices behind the accelerated SMMUv3.
>>>
>>> I think, this makes sense because, in the accelerated case, the
>>> device is no longer managed by QEMU’s SMMUv3 model. The
>> On the other hand, as we discussed on v4 by returning system as you
>> pretend there is no translation in place which is not true. Now we use
>> an alias for it but it has not really removed its usage. Also it forces
>> use to hack around the MSI mapping and introduce new PCIIOMMUOps.
>> Have
>> you assessed the feasability of using vfio_prereg_listener to force the
>> S2 mapping. Is it simply not relevant anymore or could it be used also
>> with the iommufd be integration? Eric
> IIUC, the prereg_listener mechanism just enables us to setup the s2
> mappings. For MSI, In your version, I see that smmu_find_add_as()
> always returns IOMMU as. How is that supposed to work if the Guest
> has s1 bypass mode STE for the device?
in kvm_arch_fixup_msi_route(), as we have as != &address_space_memory in
my case, we proceed with the actual translation for the doorbell gIOVA
using address_space_translate(). I  guess if the S1 is in bypass mode
you get the flat translation, no?

Eric
>
> Thanks,
> Shameer
>
>


