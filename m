Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1240856ejc;
        Tue, 26 Sep 2023 09:55:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR7dkAIAhugWo6uh0qqW/n3Y5Kuo2xu++xOhj2SHUuWTIXstOYAW/CN3oIqNX9MXe6IpzH
X-Received: by 2002:ad4:4e92:0:b0:65a:2d16:c2 with SMTP id dy18-20020ad44e92000000b0065a2d1600c2mr9156709qvb.46.1695747323032;
        Tue, 26 Sep 2023 09:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695747323; cv=none;
        d=google.com; s=arc-20160816;
        b=UVM3rNc5F4dpZnzZijh8QQZUPu8HMMzK8IGYDK597XQ3foPtT9D63ukMXZPr2eqdJC
         4L3KqofW8xlhQ0vUnRx50N9acc/ncbJDbRTeIkGorbOTfh2/B7Wf51sOjuF1ou0zjVEL
         4nF5IvRbCg72BtY3QZy6wbHsppjf0nuq/d3oj3B7K85zIcSHxene0mGGMnYL5nyHx5KV
         5+bZOe1JeonSbpfGg94WpqzadSmvR0LNjiNotvQNT6nTfOkQlNLRtq9YwNQQg9thG308
         GcRFB4eZVlTTQW8fvhjYuhywwbPlJ8T0V/yrzmYdXluGDi5NhQbxRzCI8Hyk9Tht4A5m
         mIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:organization:from:references
         :cc:to:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Zj3q5flgaeqb4qWSO0AKftsTTGLjck96xlxTasXf9m8=;
        fh=oh0VF6cx7kUYga07fgOYAvnrAGdbmdkwahVKDrelKo0=;
        b=JNKNdrqy2pPR1tuSihT6pFyLrqVgZDWF+TFS/S1ohk7xRvs7kfU8PxB74wkS5i2Vme
         yyJLUyn7yiXEBXXaQEEpt5wHQV+KLMuKXxoU97F14LRfn1IZzcPYsjhI8rXPtjSlq/3y
         7Wj/XEpWMHAGHZ2AZdH+LZgxTtUVXYa11z2/G6ni9QssySCNp1uqe7FDOqp0+6JZhwEj
         pQoCqD9pSgrLwzejS9h3oObUUzHUb8Nfcx0SLRn+DrO/ntE3KNy8A4paBdLGcuuLk13/
         3Xj1z6GsXRndEdgSKglL8KBS+jnWHtRmuIb+Qu2erOJsDN+NIKymuIfkoCD1jk4cMle7
         T5CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZbdarcWX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13-20020a0cf18d000000b00658b874e502si4187354qvl.547.2023.09.26.09.55.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Sep 2023 09:55:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZbdarcWX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlBL0-0007Pv-Ur; Tue, 26 Sep 2023 12:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qlBKx-0007K1-K4
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 12:55:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qlBKt-0005FN-2P
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 12:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695747297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zj3q5flgaeqb4qWSO0AKftsTTGLjck96xlxTasXf9m8=;
 b=ZbdarcWXGveHahegiAe3sJ/8kPOmJ0U0s83zw7XcSV7pplQT+YQzQ67rK1KhG7FcUeZ/Yk
 NdHUULoZhXdzA6Acw7G6YfNWaFk7HvaV9rfyI2+2Hee6WUasLxHcTwNXYm+kMzXfnucHjb
 xT72+wzDY1PrenWFr/+Kuz/zlPvRilU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-PTbspFPvO9KEXDxtV9SZjw-1; Tue, 26 Sep 2023 12:54:56 -0400
X-MC-Unique: PTbspFPvO9KEXDxtV9SZjw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32320b9d671so4188041f8f.3
 for <qemu-arm@nongnu.org>; Tue, 26 Sep 2023 09:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695747295; x=1696352095;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :content-language:references:cc:to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zj3q5flgaeqb4qWSO0AKftsTTGLjck96xlxTasXf9m8=;
 b=oy010sXbCTDTnndPkvjyJ1+J0cWsq76f0BHg/iHjibAbYWsK/i0QVTid2nahe0lgth
 oOahtJoe3FYYEZLFtgFwhK2I2mINp2j6JE+QT/dD/VUdoPTpzJXDfEGaLyOP1wcbdf0w
 qG27Icd154kXdg4LzcDd+7kRetdI7NvllVowdmFNN5WN6Ysks7EHULxcG7bYoXKI+oY6
 JDS3xTVWmG8iYVgD/wPxR/as6WbPpW9GrywzVB0M5NJ2O09PJFWQtCVqbQosllgFRrbz
 yPb4E+xz4RMRrZhMP7nJLQBPo1QEOZheZGA3qA1/6gyyTCJBVTgM/D4YQ71fbC2+1SuL
 wnpg==
X-Gm-Message-State: AOJu0Yz6yQQSSg99dF3mqZhh4ZjHHOfqF2ILSQpm9M2C38ZmzwXVUvUh
 gQNRrWwqnYPdEO2vtlRpAm9+gdXYYoV5uBrYJrtK8cQY2YyX2ZZDn+ET6/yhJlXLmGG2KGup5qv
 7NGi8p5klY4ky
X-Received: by 2002:a5d:6a46:0:b0:320:bbb:5ab1 with SMTP id
 t6-20020a5d6a46000000b003200bbb5ab1mr9214618wrw.14.1695747295411; 
 Tue, 26 Sep 2023 09:54:55 -0700 (PDT)
X-Received: by 2002:a5d:6a46:0:b0:320:bbb:5ab1 with SMTP id
 t6-20020a5d6a46000000b003200bbb5ab1mr9214587wrw.14.1695747294911; 
 Tue, 26 Sep 2023 09:54:54 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73f:600:933b:ca69:5a80:230d?
 (p200300cbc73f0600933bca695a80230d.dip0.t-ipconnect.de.
 [2003:cb:c73f:600:933b:ca69:5a80:230d])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a5d50c1000000b003142e438e8csm15127431wrt.26.2023.09.26.09.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 09:54:54 -0700 (PDT)
Message-ID: <769b577a-65b0-dbfe-3e99-db57cea08529@redhat.com>
Date: Tue, 26 Sep 2023 18:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Ankit Agrawal <ankita@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "ani@anisinha.ca" <ani@anisinha.ca>, Aniket Agashe <aniketa@nvidia.com>,
 Neo Jia <cjia@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Andy Currid <ACurrid@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Gavin Shan <gshan@redhat.com>
References: <20230915024559.6565-1-ankita@nvidia.com>
 <d09b3df6-74f8-c93b-b26e-59de5b2dd114@redhat.com>
 <20230915084754.4b49d5c0.alex.williamson@redhat.com>
 <f129b30b-bd0c-4e30-6be9-384b2b79a26b@redhat.com>
 <BY5PR12MB3763FA9922B9059DC14CA80DB0FFA@BY5PR12MB3763.namprd12.prod.outlook.com>
 <b67c18d1-a648-81bc-1144-33fb839f2aa3@redhat.com>
 <BY5PR12MB37636F9E84CF92020769D859B0C3A@BY5PR12MB3763.namprd12.prod.outlook.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 0/4] vfio: report NUMA nodes for device memory
In-Reply-To: <BY5PR12MB37636F9E84CF92020769D859B0C3A@BY5PR12MB3763.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: a3la7QBfb6DA

On 26.09.23 16:52, Ankit Agrawal wrote:
>>>>> Good idea.  Fundamentally the device should not be creating NUMA
>>>>> nodes, the VM should be configured with NUMA nodes and the device
>>>>> memory associated with those nodes.
>>>>
>>>> +1. That would also make it fly with DIMMs and virtio-mem, where you
>>>> would want NUMA-less nodes ass well (imagine passing CXL memory to a VM
>>>> using virtio-mem).
>>>>
>>>
>>> We actually do not add the device memory on the host, instead
>>> map it into the Qemu VMA using remap_pfn_range(). Please checkout the
>>> mmap function in vfio-pci variant driver code managing the device.
>>> https://lore.kernel.org/all/20230915025415.6762-1-ankita@nvidia.com/
>>> And I think host memory backend would need memory that is added on the
>>> host.
>>>
>>> Moreover since we want to passthrough the entire device memory, the
>>> -object memory-backend-ram would have to be passed a size that is equal
>>> to the device memory. I wonder if that would be too much of a trouble
>>> for an admin (or libvirt) triggering the Qemu process.
>>>
>>> Both these items are avoided by exposing the device memory as BAR as in the
>>> current  implementation (referenced above) since it lets Qemu to naturally
>>> discover the device memory region and do mmap.
>>>
>>
>> Just to clarify: nNUMA nodes for DIMMs/NVDIMMs/virtio-mem are configured
>> on the device, not on the memory backend.
>>
>> e.g., -device pc-dimm,node=3,memdev=mem1,...
> 

Alco CCing Gavin, I remember he once experimented with virtio-mem + 
multiple memory-less nodes and it was quite working (because of 
MEM_AFFINITY_HOTPLUGGABLE only on the last node, below).

> Agreed, but still we will have the aforementioned issues viz.
> 1. The backing memory for the memory device would need to be allocated
> on the host. However, we do not add the device memory on the host in this
> case. Instead the Qemu VMA is mapped to the device memory physical
> address using remap_pfn_range().

I don't see why that would be necessary ...

> 2. The memory device need to be passed an allocation size such that all of
> the device memory is mapped into the Qemu VMA. This may not be readily
> available to the admin/libvirt.

... or that. But your proposal roughly looks like what I had in mind, so 
let's focus on that.

> 
> Based on the suggestions here, can we consider something like the
> following?
> 1. Introduce a new -numa subparam 'devnode', which tells Qemu to mark
> the node with MEM_AFFINITY_HOTPLUGGABLE in the SRAT's memory affinity
> structure to make it hotpluggable.

Is that "devnode=on" parameter required? Can't we simply expose any node 
that does *not* have any boot memory assigned as MEM_AFFINITY_HOTPLUGGABLE?

Right now, with "ordinary", fixed-location memory devices 
(DIMM/NVDIMM/virtio-mem/virtio-pmem), we create an srat entry that 
covers the device memory region for these devices with 
MEM_AFFINITY_HOTPLUGGABLE. We use the highest NUMA node in the machine, 
which does not quite work IIRC. All applicable nodes that don't have 
boot memory would need MEM_AFFINITY_HOTPLUGGABLE for Linux to create them.

In your example, which memory ranges would we use for these nodes in SRAT?

> 2. Create several NUMA nodes with 'devnode' which are supposed to be
> associated with the vfio-pci device.
> 3. Pass the numa node start and count to associate the nodes created.
> 
> So, the command would look something like the following.
> ...
>          -numa node,nodeid=2,devnode=on \
>          -numa node,nodeid=3,devnode=on \
>          -numa node,nodeid=4,devnode=on \
>          -numa node,nodeid=5,devnode=on \
>          -numa node,nodeid=6,devnode=on \
>          -numa node,nodeid=7,devnode=on \
>          -numa node,nodeid=8,devnode=on \
>          -numa node,nodeid=9,devnode=on \
>          -device vfio-pci-nohotplug,host=0009:01:00.0,bus=pcie.0,addr=04.0,rombar=0,numa-node-start=2,numa-node-count=8 \

Better an array/list like "numa-nodes=2-9"

... but how would the device actually use these nodes? (which for which?)

-- 
Cheers,

David / dhildenb

