Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp433079njb;
        Thu, 8 May 2025 06:47:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUu6VLEpUxMWrt0palaGhnU5PJLKpOFscYnJdSbNhEbfnSCkyg7psRYQIHELuTbGECxFOA6KTjWDbibRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGrhzKbe73UpgFU8drJP0+q4qee2b1ygkU1x7RlAxYnjVgs8qJVppuIf+NYwbh82yO7Ydkv
X-Received: by 2002:a05:622a:2cc:b0:476:97d3:54f with SMTP id d75a77b69052e-49225b37959mr130176351cf.14.1746712028607;
        Thu, 08 May 2025 06:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746712028; cv=none;
        d=google.com; s=arc-20240605;
        b=PpzQQ0W8D8Za35sojwm2N48E8b+WR7mCQMGne8wdioH5QH8ToE0VQEk4nm8chDnATF
         5gp9MXVexwJLxmrz+lJPVhXXKsar3us7zLoKfncFMIUnj+olAA1zN0b7i8GzXSmQyR3u
         eHQi06L03rimAwNlOiEPi0hXcQeXGkcEYXSPtRe7Zjerhb4YdJqLb6EI4wGl70aR1Nqo
         Phz+g3Ax6ir5uzgEIeHfLhRYo3HSb/QZ7GZCrX2yYejDemP8dRbPIxzyMCkgAwQG9OyS
         ljxZek6lLcJVPJJbifgZGD1e2CL9M3CHJH8QqCC2mAS8j/O3YBVXgMeKh9OlxwGWg+IU
         0ctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0rjas0OHxnPU/kTC68JR63X8vr0znQHtqaPOm4UsunY=;
        fh=puDIjHmCEKalHeP/7BHdDEBAWYsxyCBmYAaatjAeKxo=;
        b=hr5hO3jtG054PbJUbxS2TtTef2nKCOPQufK0AGcvq/42iTDyeSMoRVVmjKjaXqXoaJ
         5rLN3QIapiwJ3oLW3auNLMP1GvkmXf1X15WzlybvzECdVUv4dICp/FTBHQxOV65PQa7z
         1tHkLr3JOdDmyPEHydJsayr6z+An94OVI5hE5joSyOmVI1JJ8T1mIJfwnsXwSFLk9LGF
         FjBFbibHkeMhRymGXNbbd0Mmb0qoMepC603epkYNwGEN33RN3w0Z1HwU/d9yVdksgfUk
         /gVhLdgNWj4M3d7JNKIeokgWNNKXh2Ao/VlXtIg5vJQ3xepCDW5fcBw+E+VmZ/Q11AP5
         36fQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GDZEGLjc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49220f82daesi45709391cf.48.2025.05.08.06.47.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 06:47:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GDZEGLjc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD1aW-0007IG-KN; Thu, 08 May 2025 09:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uD1aU-0007EF-6J
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:46:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uD1aR-0005MO-O8
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746712014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0rjas0OHxnPU/kTC68JR63X8vr0znQHtqaPOm4UsunY=;
 b=GDZEGLjcb9sEH5MGiWRXyQtwlNzgUp/e6Li01gEkQrhsQ9u6jLge7iRwhTtfzV/xFVVJuz
 qkR2cRbTdmSb3loeUe2LPduaUmzyec39gOUSmY8cLpB/G1n/TlAcnwh0xr2vYgWbMYZnj1
 H8lE6ry+O9RMClclGj5hMB0IdBYKsws=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-yAI4Kx-sP3az3Ts5iieIuw-1; Thu, 08 May 2025 09:46:53 -0400
X-MC-Unique: yAI4Kx-sP3az3Ts5iieIuw-1
X-Mimecast-MFC-AGG-ID: yAI4Kx-sP3az3Ts5iieIuw_1746712011
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7caef20a528so255929085a.0
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 06:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746712011; x=1747316811;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0rjas0OHxnPU/kTC68JR63X8vr0znQHtqaPOm4UsunY=;
 b=spxi1It3yoDmSFVkaSayi6v3maLL+JxYJXkbtXA+Rj/5TmhvcpWA2p5OCopDSwkgFe
 8Hf8skBID4ZX4rZg3m2E5KDISgnDOWme8BwgqnW/64s/SFuzS0QWHb85txDIr3mA83aa
 1vSl3/IJ8hS2LNcsUGD43vwqb/RUVw31GvYRbHTxGP8uZNoC6tUdAEdqCCIbGuFtFTY8
 OWA2DsUjg4LxMf1mutMVplQInqOVWMYsv4iDwgYCudAry3OA98ufx2GMdbrAVTUWhJRx
 75IBFBOhJ5gkOsk+yUgvkcxPbVGRLHgVCIezSjlm00KSeXAhSss0b9FmTCEZgDZogqPG
 wPvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEx3N5xBv50atwkjxunfbCYcreya3wVtYQQharOgBTTReFEz15TQ3cZbZ4k7Dm3/04zUhebDNMkQ==@nongnu.org
X-Gm-Message-State: AOJu0YyZdaM7kRVfXcMZEkf9OMfayiX79qmzwIRIukBScLIeMZgZ6+c/
 c8Rk4IM7DM0Y7S3gUj7ECu3zR3HpMHZcoVx2Dz4Df46FEHRMTekPyDAJrpf7AC/w9p20datf84/
 RmaNqVZX5dfeVdNAkL2lgySHlKvESBjvfIIxJIgWnVCpjDefjew==
X-Gm-Gg: ASbGncsfarAqQiT9+1zJg7Ce8K9W44txOmEHPjni9mN30lzcPfwk4xd/QsaKGKfQ781
 WfqOpIpO3zCeT0fBq7MRMJ5YYBQGQwkuG/SaHjgtasOUZt1eLm1YpykheR5aZO6zcEhCThvn9KR
 qY1OHJjSt3eiyRuvAkmMqiTpaijwA36ixu0qMzlpZpGrvt2ilMyzY1DroypcuWR1rn3bCR7CoYQ
 MHiD64Q+T2ZXGTwjsPnh0i32JvNUCF2sxIcPcWqpLZzwjf+1tW4wp71lnBSoHnzT2vjNi5Azf/O
 jU4QOXGNY4dq
X-Received: by 2002:a05:620a:3951:b0:7ca:f003:a833 with SMTP id
 af79cd13be357-7caf74061aamr1016526485a.37.1746712011318; 
 Thu, 08 May 2025 06:46:51 -0700 (PDT)
X-Received: by 2002:a05:620a:3951:b0:7ca:f003:a833 with SMTP id
 af79cd13be357-7caf74061aamr1016506485a.37.1746712008808; 
 Thu, 08 May 2025 06:46:48 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7caf752b696sm356764785a.44.2025.05.08.06.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 06:46:48 -0700 (PDT)
Message-ID: <d21e0c57-b89a-4c79-958e-e633de039e4c@redhat.com>
Date: Thu, 8 May 2025 09:45:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a PCIe RC
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Shameer Kolothum via <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
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
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
 <20250502102707.110516-2-shameerali.kolothum.thodi@huawei.com>
 <877c2ut0zk.fsf@pond.sub.org>
 <e02e884b-0f3d-4426-8a67-2cbd23e80e8c@redhat.com>
 <87frhglwjl.fsf@pond.sub.org> <72f9043a73294bfc9b539ae9b94836d3@huawei.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <72f9043a73294bfc9b539ae9b94836d3@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VOGqBumOFiEl1HUrEjMJlbtMTNXSk46J8fRQHim7Qqk_1746712011
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.416,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /LNH6YNq9Aq1



On 5/7/25 4:50 AM, Shameerali Kolothum Thodi wrote:
> 
> 
>> -----Original Message-----
>> From: Markus Armbruster <armbru@redhat.com>
>> Sent: Wednesday, May 7, 2025 8:17 AM
>> To: Donald Dutile <ddutile@redhat.com>
>> Cc: Shameer Kolothum via <qemu-devel@nongnu.org>; qemu-
>> arm@nongnu.org; Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; eric.auger@redhat.com;
>> peter.maydell@linaro.org; jgg@nvidia.com; nicolinc@nvidia.com;
>> berrange@redhat.com; nathanc@nvidia.com; mochs@nvidia.com;
>> smostafa@google.com; Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
>> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
>> Jonathan Cameron <jonathan.cameron@huawei.com>;
>> zhangfei.gao@linaro.org
>> Subject: Re: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a
>> PCIe RC
>>
>> Donald Dutile <ddutile@redhat.com> writes:
>>
>> [...]
>>
>>> In this series, an iommu/smmu needs to be placed -BETWEEN- a sysbus
>> and a PCIe-tree,
>>> or step-wise, plug an smmuv3 into a sysbus, and a pcie tree/domain/RC
>> into an SMMUv3.
>>
>> RC = root complex?
> 
> Yes.
> 
+1.

>>
>>> So, an smmu needs to be associated with a bus (tree), i.e., pcie.0, pcie.1...
>>> One could model it as a PCIe device, attached at the pcie-RC ... but that's
>> not how it's modelled in ARM hw.
>>
>> Physical ARM hardware?
>>
yes, physical hw.

>> Assuming the virtual devices and buses we're discussing model physical
>> devices and buses:
>>
>> * What are the physical devices of interest?
>>
>> * How are they wired together?  Which of the wires are buses, in
>>    particular PCI buses?
> 
> SMMUv3 is a platform device and its placement in a system is typically as below
> for PCI devices,
> 
> +------------------+
> |   PCIe Devices   |
> +------------------+
>           |
>           v
>    +-------------+      +---------------+
>    |  PCIe RC A  |<---->| Interconnect  |
>    +-------------+      +---------------+
>                                 |
>                                 |
>                          +------v---+
>                          | SMMUv3.A |
>                          | (IOMMU)  |
>                          +----+-----+
>                               |
>                               v
>                       +-------+--------+
>                       |   System RAM   |
>                       +----------------+
>   
> This patch is attempting to establish that association between the PCIe RC and
> the SMMUv3 device so that Qemu can build the ACPI tables/DT iommu mappings
> for the SMMUv3 device.
> 
I would refer to the ARM SMMU spec, Figure 2.3 in the G.a version, where
it's slightly different; more like:

  +------------------+
  |   PCIe Devices   | (one device, unless a PCIe switch is btwn the RC & 'Devices';
  +------------------+   or, see more typical expansion below)
            |
     +-------------+
     |  PCIe RC A  |
     +-------------+
            |
     +------v---+    +-----------------------------------+
     | SMMUv3.A |    | Wide assortment of other platform |
     | (IOMMU)  |    |   devices not using SMMU          |
     +----+-----+    +-----------------------------------+
          |                      |   |   |
   +------+----------------------+---+---+-+
   |         System Interconnect           |
   +---------------------------------------+
                                |
   +-------+--------+     +-----+-------------+
   |   System RAM   |<--->| CPU (NUMA socket) |
   +----------------+     +-------------------+

In fact, the PCIe can be quite complex with PCIe bridges, and multiple Root Ports (RP's),
and multiple SMMU's:

     +--------------+   +--------------+   +--------------+
     | PCIe Device  |   | PCIe Device  |   | PCIe Device  |
     +--------------+   +--------------+   +--------------+
           |                  |                  |        <--- PCIe bus
      +----------+       +----------+      +----------+
      | PCIe RP  |       | PCIe RP  |      | PCIe RP  |  <- may be PCI Bridge, may not
      +----------+       +----------+      +----------+
          |                  |                  |
      +----------+       +----------+       +----------+
      |  SMMU    |       |  SMMU    |       |  SMMU    |
      +----------+       +----------+       +----------+
          |                  |                  |   <- may be a bus, may not(hidden from OS)
          +------------------+------------------+
                             |
             +--------------------------+
             |          PCI RC A        |
             +--------------------------+
  
where PCIe RP's could be represented (even virtually) in -hw-
as a PCIe bridge, each downstream being a different PCIe bus under
a single PCIe RC (A, in above pic) -domain-.
... or the RPs don't have to have a PCIe bridge, and look like
'just an RP' that provides a PCIe (pt-to-pt, serial) bus, provided
by a PCIe RC. ... the PCIe architecture allows both, and I've seen
both implementations in hw (at least from an lspci perspective).

You can see the above hw implementation by doing an lspci on most
PCIe systems (definitely common on x86), where the RP's are represented
by 'PCIe bridge' elements -- and lots of them.
In real hw, these RP's effectively become (multiple) up & downstream transaction queues
(which implement PCI ordering, and deadlock avoidance).
SMMUs are effectively 'inserted' in the (upstream) queue path(s).

The important take away above: the SMMU can be RP &/or device-specific -- they
do not have to be bound to an entire PCIe domain ... the *fourth* part of
an lspci output for a PCIe device: Domain:Bus:Device.Function.
This is the case for INTEL & AMD IOMMUs ... and why the ACPI tables have
to describe which devices (busses often) are associated with which SMMU(in IORT)
or IOMMU(DMAR/IVRS's for INTEL/AMD IOMMU).

The final take away: the (QEMU) SMMU/IOMMU must be associated with a PCIe bus
OR, the format has to be something like:
   -device smmuv3, id=smmuv3.1
   -device <blah>, smmu=smmuv3.1
where the device <-> SMMU (or if extended to x86, iommu) associativity is set w/o bus associativity.
It'd be far easier to tag an entire bus with an SMMU/IOMMU, than a per-device format, esp. if
one has lots of PCIe devices in their model; actually, even if they only have one bus and 8 devices
(common), it'd be nice if a single iommu/smmu<->bus-num associativity could be set.

Oh, one final note: it is possible, although I haven't seen it done this way yet,
that an SMMU could be -in- a PCIe switch (further distributing SMMU functionality
across a large PCIe subsystem) and it -could- be a PCIe device in the switch,
btwn the upstream and downstream bridges -- actually doing the SMMU xlations
at that layer..... for QEMU & IORT, it's associated with a PCIe bus.
But, if done correctly, that shouldn't matter -- in the example you gave wrt serial,
it would be a new device, using common smmu core: smmuv3-pcie.
[Note: AMD actually identifies it's IOMMU as a PCIe device in an RC ... but still uses
        the ACPI tables to configure it to the OS.. so the PCIe-device is basically a
        device w/o a PCIe driver. AMD just went through hoops dealing with MS
        and AMD-IOMMU-identification via PCIe.]

So, stepping back, and looking at a broad(er) SMMU -or- IOMMU QEMU perspective,
I would think this type of format would be best:

- bus pcie, id=pcie.<num>
- device iommu=[intel_iommu|smmuv3|amd_iommu], bus=[sysbus | pcie.<num>], id=iommu.<num>
[Yes, I'm sticking with 'iommu' as the generic naming... everyone thinks of device SMMUs as IOMMUs,
  and QEMU should have a more arch-agnostic naming of these system functions. ]

and then the bus that devices are attached to in the system will define the IOMMU/SMMU
devices that they manage/translate (for simpler IORT/DMAR/IVRS generation.]
Options for iommu=none could be applied to any device on any bus (pcie or sysbus) to
logically exclude them from an IOMMU (effectively creating a virtual RP not managed by
an IOMMU; and simple IORT/DMAR/IVRS exclusion).

If/when intel_iommu (& eventual amd_iommu) get muti-instance support, the above
formatting would work for them.
... and I would expect someone from libvirt-land to chime in on even a better
format that makes it more common/generic, but allows for more robust, per-arch or
per-IOMMU/SMMU-arch variants/parametization.


If any of the above seems mirky, please ask for clarification(s).
Hopefully I haven't mis-typed any of the above, causing conflict or confusion,
as the concepts above are shared to show the array of hw architectures,
yet, try to dissolve them into common IOMMU config formats for QEMU
(for multi-instance-iommu and multi-bus).

- Don

>>> SMMU's are discovered via ACPI tables.
>>>
>>> That leaves us back to the 'how to associate an SMMUv3 to a PCIe
>> tree(RC)',
>>> and that leads me to the other discussion & format I saw btwn Eric &
>> Shameer:
>>>   -device arm-smmv3,id=smmuv3.3
>>>   -device xxxx,smmuv3= smmuv3.3
>>> where one tags a (PCIe) device to an smmuv3(id), which is needed to build
>> the (proper) IORT for (pcie-)device<->SMMUv3 associativity in a multi-
>> SMMUv3 configuration.
>>>
>>> We could keep the bus=pcie.X option for the -device arm-smmuv3 to
>> indicate that all PCIe devices connected to the pcie.0 tree go through that
>> smmuv3;
>>> qdev would model/config as the smmuv3 is 'attached to pcie.0'... which it
>> sorta is...  and I think the IORT build could associate all devices on pcie.0 to
>> be associated
>>> with the proper smmuv3.
>>
>> Device property "bus" is strictly for specifying into which the bus the
>> device is to be plugged.  The device's type must match the bus: only a
>> PCI device can plug into a PCI bus, and so forth.
> 
> The whole idea of reusing the "bus" property for SMMUv3 device was to make
> it easier for libvirt. As I mentioned earlier we could go back and use a different
> property name like "primary-bus" or "pci-bus" for SMMUv3 dev here.
> 
> Thanks,
> Shameer
> 

