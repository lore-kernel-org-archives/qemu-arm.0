Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1439749ejb;
        Fri, 15 Sep 2023 11:35:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0oLzQd4sm6M7IBvS4k6LVkvc9blhHMF77p9E3P09P62VGSOJacABJZmK883baoTbg9C7t
X-Received: by 2002:a0c:b3c9:0:b0:656:2872:ec6b with SMTP id b9-20020a0cb3c9000000b006562872ec6bmr2377177qvf.57.1694802916254;
        Fri, 15 Sep 2023 11:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694802916; cv=none;
        d=google.com; s=arc-20160816;
        b=fFPA8ZBCsF0L2bIh+KRoxbdKa5Z/drHI2JoFgLgaDb84zU5M0dadtXt8h23sogusCW
         /THjz5rL2gwMl4+Cc23NpBQRVOXpJgZUI4mlRnnt6MA0ar9Z1UqDmA2fFpejGNoCBuGk
         CT9YG+XsUbxotYkPUZsp072Ahf15yHeqjz+r2Nhe4YI+1yyyiwrASBJXNb7tP+cSOyPR
         U/zmCXZlp/rGNtcbebaRUFPTdvPJkvlha47pM0K9LDBMkQ8MncEFAjAc51f9Q8wqQB0Y
         TMjrqndzQERWLJl6Vlz+3nTA23J4xfa9FjooPnpia/fkK1wWzn+mdF5lafDqrnnBv3jj
         J7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=TtSEInjybqRb6l9CiNMNLZiWNc6Hr1x7n1G1Nj2NnrI=;
        fh=U5PGVfIVPuPj0LAxPOe+l+QN8xYqrIQ/8vwBQogeORM=;
        b=jIhWX0gznX5hjO4+ClFSh37bGeQEyV9a+IfrHLv2BJ7cfuzb1IiP3+4PlitfWzNZ4C
         aUOndHV90NeDxfBSri+S9/ayT6HQ8A8T/Rbna9a02vSvaJH5qf/7G4jghgA4x3TsBvbc
         eWbQImilvbuPRFIQ9WBiFpPZMTT1Ju7+m1UN3AbAPV+ihXDWMcexns1OIj1iC6vC6nB/
         /oYjxUZ9kiqC04hEKmR9X0gM4TndvH2hmZqbU9SjPqzN/kuci7VADPT/M2EE5+FWJN52
         vSPvhXwv9+B7KnDRffG7rRUE9tZ28CXDvxlHXGJqN4UydDi3RfYA4s22Yd/ySQ6lhx09
         EvAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dxBuxNJA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2-20020a0ccc82000000b0065627a94051si2245795qvl.419.2023.09.15.11.35.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Sep 2023 11:35:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dxBuxNJA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qhDeb-0008OC-Cs; Fri, 15 Sep 2023 14:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qhDeU-0008JJ-QQ
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 14:34:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qhDeT-0001Ug-Dg
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 14:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694802888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TtSEInjybqRb6l9CiNMNLZiWNc6Hr1x7n1G1Nj2NnrI=;
 b=dxBuxNJAKHuMlU+UC5hGDd32xoKXYucfVG5WeT6DzQpZRmCCDtFbvvR//gSGtuxmw/Aguz
 /qugKVfGUNkuzQlk1Hgq/NFCQ2EcGOgTKGv833RzUIZIBBz5FEKVTO4RaXSKJjzWH+q/q7
 p+GfAIexyjO9fsFwH7rBTkhSZhMXIbs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-O01cYzE5NIKKZxPg1GfgrQ-1; Fri, 15 Sep 2023 14:34:44 -0400
X-MC-Unique: O01cYzE5NIKKZxPg1GfgrQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-401e1c55ddcso19805235e9.0
 for <qemu-arm@nongnu.org>; Fri, 15 Sep 2023 11:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694802883; x=1695407683;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TtSEInjybqRb6l9CiNMNLZiWNc6Hr1x7n1G1Nj2NnrI=;
 b=ahakBkE6DzTBOJPWWN2wE+HKlEsOloK8OUdm63HjXQS/3pglvnbSHuqpmr6XLA693T
 rBrij/iSgxY/6CKJrCQvR4Qq6n56WgUnV1oybHuj73UqSKcaHpTxvMWHltshZpOsXiZ+
 m8LjAnOSq+ZOigl7f3Nb6fYOJMlsOThd9Cab3pzG7F3ZYjrV1cr3FNa9lai4MsUw37ky
 kO6F0JGFPL9f6FupIuHAyKLH3Kt46HUJ0jWPpTDkm58FATMGHK8QiRMsItCtN/wgVdG6
 +1wwUirYuiDuf0mkRQy/GIvdwVVqRb3IPRfieyKfeSz5ZsxNYuOY3wwhdU1Ei+d+yxIZ
 tKMA==
X-Gm-Message-State: AOJu0YwT1BgqzIJYZt5f6b7pzde8vP8U0wgvj/mlO7iWzpHWlPQJf/rq
 bR5vjLy5zdoiC2LWKvXteEhsUdqrG1Fse3gHl2SfhdWJhiQYRXkNH0iRMvF2ZeazWjot9NvYCcb
 MG3UKFLWZauE2
X-Received: by 2002:a7b:cd06:0:b0:3fe:22a9:907 with SMTP id
 f6-20020a7bcd06000000b003fe22a90907mr2255899wmj.20.1694802883330; 
 Fri, 15 Sep 2023 11:34:43 -0700 (PDT)
X-Received: by 2002:a7b:cd06:0:b0:3fe:22a9:907 with SMTP id
 f6-20020a7bcd06000000b003fe22a90907mr2255878wmj.20.1694802882964; 
 Fri, 15 Sep 2023 11:34:42 -0700 (PDT)
Received: from ?IPV6:2003:cb:c728:e000:a4bd:1c35:a64e:5c70?
 (p200300cbc728e000a4bd1c35a64e5c70.dip0.t-ipconnect.de.
 [2003:cb:c728:e000:a4bd:1c35:a64e:5c70])
 by smtp.gmail.com with ESMTPSA id
 4-20020a05600c22c400b00403b63e87f2sm5292465wmg.32.2023.09.15.11.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 11:34:42 -0700 (PDT)
Message-ID: <f129b30b-bd0c-4e30-6be9-384b2b79a26b@redhat.com>
Date: Fri, 15 Sep 2023 20:34:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 0/4] vfio: report NUMA nodes for device memory
To: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
Cc: ankita@nvidia.com, jgg@nvidia.com, shannon.zhaosl@gmail.com,
 peter.maydell@linaro.org, ani@anisinha.ca, aniketa@nvidia.com,
 cjia@nvidia.com, kwankhede@nvidia.com, targupta@nvidia.com,
 vsethi@nvidia.com, acurrid@nvidia.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230915024559.6565-1-ankita@nvidia.com>
 <d09b3df6-74f8-c93b-b26e-59de5b2dd114@redhat.com>
 <20230915084754.4b49d5c0.alex.williamson@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230915084754.4b49d5c0.alex.williamson@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: QbiJgfh2Uo4b

On 15.09.23 16:47, Alex Williamson wrote:
> On Fri, 15 Sep 2023 16:19:29 +0200
> Cédric Le Goater <clg@redhat.com> wrote:
> 
>> Hello Ankit,
>>
>> On 9/15/23 04:45, ankita@nvidia.com wrote:
>>> From: Ankit Agrawal <ankita@nvidia.com>
>>>
>>> For devices which allow CPU to cache coherently access their memory,
>>> it is sensible to expose such memory as NUMA nodes separate from
>>> the sysmem node. Qemu currently do not provide a mechanism for creation
>>> of NUMA nodes associated with a vfio-pci device.
>>>
>>> Implement a mechanism to create and associate a set of unique NUMA nodes
>>> with a vfio-pci device.>
>>> NUMA node is created by inserting a series of the unique proximity
>>> domains (PXM) in the VM SRAT ACPI table. The ACPI tables are read once
>>> at the time of bootup by the kernel to determine the NUMA configuration
>>> and is inflexible post that. Hence this feature is incompatible with
>>> device hotplug. The added node range associated with the device is
>>> communicated through ACPI DSD and can be fetched by the VM kernel or
>>> kernel modules. QEMU's VM SRAT and DSD builder code is modified
>>> accordingly.
>>>
>>> New command line params are introduced for admin to have a control on
>>> the NUMA node assignment.
>>
>> This approach seems to bypass the NUMA framework in place in QEMU and
>> will be a challenge for the upper layers. QEMU is generally used from
>> libvirt when dealing with KVM guests.
>>
>> Typically, a command line for a virt machine with NUMA nodes would look
>> like :
>>
>>     -object memory-backend-ram,id=ram-node0,size=1G \
>>     -numa node,nodeid=0,memdev=ram-node0 \
>>     -object memory-backend-ram,id=ram-node1,size=1G \
>>     -numa node,nodeid=1,cpus=0-3,memdev=ram-node1
>>
>> which defines 2 nodes, one with memory and all CPUs and a second with
>> only memory.
>>
>>     # numactl -H
>>     available: 2 nodes (0-1)
>>     node 0 cpus: 0 1 2 3
>>     node 0 size: 1003 MB
>>     node 0 free: 734 MB
>>     node 1 cpus:
>>     node 1 size: 975 MB
>>     node 1 free: 968 MB
>>     node distances:
>>     node   0   1
>>       0:  10  20
>>       1:  20  10
>>
>>     
>> Could it be a new type of host memory backend ?  Have you considered
>> this approach ?
> 
> Good idea.  Fundamentally the device should not be creating NUMA nodes,
> the VM should be configured with NUMA nodes and the device memory
> associated with those nodes.

+1. That would also make it fly with DIMMs and virtio-mem, where you 
would want NUMA-less nodes ass well (imagine passing CXL memory to a VM 
using virtio-mem).

-- 
Cheers,

David / dhildenb

