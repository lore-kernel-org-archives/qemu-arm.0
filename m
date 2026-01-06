Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B20CDC19F
	for <qemu-arm@archiver.kernel.org>; Tue,  6 Jan 2026 13:23:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vd71i-0004Mz-7H; Tue, 06 Jan 2026 08:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vd71g-0004Kh-CY
 for qemu-arm@nongnu.org; Tue, 06 Jan 2026 08:23:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vd71e-00012e-EM
 for qemu-arm@nongnu.org; Tue, 06 Jan 2026 08:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767705785;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uMUbwMUBdsteMrWsSiLau8ydg0IZY1pjxR1xIKUeOR8=;
 b=EKAJaI4+QJKcT7dll+S9o6Z0nRXoGwuYcKBY0r/ZMP3OiAevAVipy1mtB4Tjn3HoLm8xFl
 ULOtuQMjI4jdQ+BO84aLzI7JSYjDMT556l7YSk1y+am0fST9q8lmnUtVikvtR6LIbKYcby
 vYX2X2qc98EY966dAkKB7FMxe/6Z1OI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-DZhkG5eBPgezrMqI5Qb6rA-1; Tue, 06 Jan 2026 08:23:01 -0500
X-MC-Unique: DZhkG5eBPgezrMqI5Qb6rA-1
X-Mimecast-MFC-AGG-ID: DZhkG5eBPgezrMqI5Qb6rA_1767705780
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47788165c97so5944255e9.0
 for <qemu-arm@nongnu.org>; Tue, 06 Jan 2026 05:23:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767705780; x=1768310580;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uMUbwMUBdsteMrWsSiLau8ydg0IZY1pjxR1xIKUeOR8=;
 b=cF/sS39YEyrews/NiXG53RnVxPLH2UYCcFVVrFQdw2fAi62k7uVLVAliMu2+yY2c+i
 DbveMMgMF4yMfw7eTj4VH4uH667Mrjv9ePHzlELId/4WQKPb0nwwzm0KRW52PQI7OL/t
 nvasE55HW42iqBWTNp3c3/YqIiBsbdrecZf2Roo5ScfjS53eN4PizPY6XdUmq2x+cvJu
 SNs2B/zhqx46NElL2kz07Il6M+exjm65+BuCLrJVtxoEdVtTgBL4SL37K6YOx7w2mZoq
 mGgPEN3aIKZihvsbPjfqIpFnPTx1cSpR+ngCJMNtaPRr/5+lUqCILgeiAhcYvPyJ4Bt8
 sx7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcsVJINXwM61b9hPbzdNjkkt1kc3osVl67JUsvJYn12UMaArVG9oMTZXtFLN/XsTJRFQV0fVZuiw==@nongnu.org
X-Gm-Message-State: AOJu0Yy6TW0VSy2oqkDbyR46Ta6JDyNNCpSeNVhY59jtI1IbNCN8kvp5
 ni7dBFHFdxCAw7PIvP9wAZybW9+RFMnVylgER3Dgwg9/tNaMbd1tEru/BWleY39vWJvnCOKds7+
 PjonnQBIQdE+Y30BMV3Ug6Zxs+t35Y9HW1DslY5NqxzVkadA12/58yg==
X-Gm-Gg: AY/fxX7aO+DdoYeAfhhLyBGSB/PKQXFmwnrWghnySZf3Ijx3wcz1seZkQ5MTYEZdAG+
 8/Fc+az4QC3DA/5LRlZFvzCpyJGc73DdYgpU4/nUiZY27GebhIR7C7Ew9qpmxvEcq4BVuEFeypB
 rvTGJlmW8mMSbLT1w6tPslYXyB0jKfDsRaPA/oFGFMgyyrmTpirIftxWLYsQ0ukqqAQXcPqNCbz
 ATLN09ztukTyO4lT4FR5eL5qsDTd5Dx9u/5hoTtaZQXn2qBC0SxU5PAgBI+eh8enCChSPs7M/Gc
 yVKxFy2gVFrLJdHG9Qtn+HB4h8zOxsbP4/nvb5zeG376C9BYjSEOAv4YwdxsVZTYuoEIRZnFe6B
 3EHLD+uu3sD3zCeJHoyQzOYHiVL9+8dofPAHLLrjkDBB0hebWcAxQweH9xw==
X-Received: by 2002:a05:600c:548b:b0:477:7b9a:bb0a with SMTP id
 5b1f17b1804b1-47d7f099a1amr33532375e9.21.1767705780445; 
 Tue, 06 Jan 2026 05:23:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeBNiJh2dt5qDwMBQNNyOrzSEg61TAqGZFP9VmuDWgrwL/ihWeKed0RSe5N2D3gyleLpsZdg==
X-Received: by 2002:a05:600c:548b:b0:477:7b9a:bb0a with SMTP id
 5b1f17b1804b1-47d7f099a1amr33532085e9.21.1767705780029; 
 Tue, 06 Jan 2026 05:23:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f4184e1sm43720685e9.4.2026.01.06.05.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 05:22:59 -0800 (PST)
Message-ID: <15ace9b4-ead5-4153-be5c-7a0323498cb3@redhat.com>
Date: Tue, 6 Jan 2026 14:22:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 32/33] vfio: Synthesize vPASID capability to VM
To: Shameer Kolothum <skolothumtho@nvidia.com>, Yi Liu <yi.l.liu@intel.com>,
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
 Krishnakant Jaju <kjaju@nvidia.com>, "alex@shazbot.org" <alex@shazbot.org>
References: <20251120132213.56581-1-skolothumtho@nvidia.com>
 <20251120132213.56581-33-skolothumtho@nvidia.com>
 <7dc608a7-b36b-4250-befd-d26115b54e26@redhat.com>
 <483fa0e2-aeb5-43b7-a136-692bbd24d0ba@intel.com>
 <CH3PR12MB75489918DACE8B009A8F4F32AB86A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <4a1e1e8a-8480-4294-a176-b5e630b7d0c7@redhat.com>
 <CH3PR12MB75483839B76AB0C78803687FAB87A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB75483839B76AB0C78803687FAB87A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q42VuNwQ0T9jZ15ynnvEHMus16SPH2Wo_8eYTfs4X7A_1767705780
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 1/6/26 12:38 PM, Shameer Kolothum wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 06 January 2026 10:55
>> To: Shameer Kolothum <skolothumtho@nvidia.com>; Yi Liu
>> <yi.l.liu@intel.com>; qemu-arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>; Nicolin
>> Chen <nicolinc@nvidia.com>; ddutile@redhat.com; berrange@redhat.com;
>> Nathan Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; Krishnakant Jaju
>> <kjaju@nvidia.com>; alex@shazbot.org
>> Subject: Re: [PATCH v6 32/33] vfio: Synthesize vPASID capability to VM
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Shameer,
> [...]
>
>>>>> Besides the fact the offset is arbitrarily chosen so that this is the
>>>>> last cap of the vconfig space, the code looks good to me.
>>>>> So
>>>>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>>>>
>>>>> Just wondering whether we couldn't add some generic pcie code that
>>>>> parses the extended cap linked list to check the offset range is not
>>>>> used by another cap before allowing the insertion at a given offset?
>>>>> This wouldn't prevent a subsequent addition from failing but at least we
>>>>> would know if there is some collision.this could be added later on though.
>>>>>
>>>> You're absolutely right. My approach of using the last 8 bytes was a
>>>> shortcut to avoid implementing proper capability parsing logic
>>>> (importing pci_regs.h and maintaining a cap_id-to-cap_size mapping
>>>> table), and it simplified PASID capability detection by only examining
>>>> the last 8bytes by a simple dump :(. However, this approach is not
>>>> good as we cannot guarantee that the last 8bytes are unused by any
>>>> device.
>>>>
>>>> Let's just implement the logic to walk the linked list of ext_caps to
>>>> find an appropriate offset for our use case.
>>> I had a go at this. Based on my understanding, even if we walk the PCIe
>>> extended capability linked list, we still can't easily determine the size
>>> occupied by the last capability as the extended capability header does not
>>> encode a length, it only provides the "next" pointer, and for the last entry
>>> next == 0.
>> If my understanding is correct when walking the linked list, you can
>> enumerate the start index and the PCIe extended Capability variable size
>> which is made of fix header size + register block variable size which
>> depends on the capability ID). After that we shall be able to allocate a
>> slot within holes or at least check that adding the new prop at the end
>> of the 4kB is safe, no?. What do I miss?
> I think the main issue is that we can't know whether the apparent "holes"
> between extended capabilities are actually free. Depending on the vendor
> implementation, those regions may be reserved or used for vendor specific
> purposes, and I am not sure(please correct me) PCIe spec guarantee that
> such gaps are available for reuse. Hence thought of relying on the “next”
> pointer as a safe bet.
>
> Even if we look at the last CAP ID and derive a size based on the
> spec defined register layout, we still can;t know whether there is
> any additional vendor specific data beyond that "size". It is still
> a best guess and I don't think we gain much in adding this additional
> check.

Ah OK I see what you mean (you may have discussed that earlier in other
threads sorry). So you may have vendor specific private data in the
holes. In that case I guess we cannot do much :-/
>
> Perhaps, I think we could inform the user that we are placing
> teh PASID at the last offset and the onus is on user to make sure
> it is safe to do so. 
or another solution is to let the user opt-in for this hasardous
placement using an explicit x- prefixed option? Dunno

Thanks

Eric
>
> Thoughts?
>
> Thanks,
> Shameer
>


