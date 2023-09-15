Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1271280ejb;
        Fri, 15 Sep 2023 07:20:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6EQQW2AHODlt0aHD2hcW+jHFk5WwnlaLv84GIujvSeXoToqEXFspNW7kDmWe3q4idFfjk
X-Received: by 2002:a05:622a:111:b0:412:2b9a:3b2b with SMTP id u17-20020a05622a011100b004122b9a3b2bmr2201362qtw.37.1694787601268;
        Fri, 15 Sep 2023 07:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694787601; cv=none;
        d=google.com; s=arc-20160816;
        b=W4TReLCQNHqIC+Asd78wwxKYZqQqSP44bFhchSj6v/CcrGM6VeKvP3FIN8HXY0w80/
         BjSxLCt+egguO9G2fC7p+pqRSqMH+rhB1ZLTnmcPY3k47o/G6hGMStqp7m/o7By7Ik8B
         q3hJZH/nneWiqm8c1DX1S7AOtuKDbk/XTMPGZjxuSjceo18A+iUZv4u7mhAsDSlDOdyj
         Aw0jjHVIJ3KKdCIR3VCyfRte+T3/W3QOWIh9CD5OiLQdblVSfybmEE9ZLco42oCYddU5
         dnpxC2u8JrTlF8sITvw1ZsoM1apzPe9Se3pxaY9HhEMWkTKoTgtoZHv+YD4CPGTRHLOU
         8NvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=a32ot1mLc+fauQaQeiFV3v+/qakq+bCy5oHpGBXA1nk=;
        fh=3shaNPx5hp4WITKjR9ZdpDVCOS5aqH7wyPE0hOu2ivk=;
        b=pXnziIe5xIArK9uqIbSegLoR/f80whquv3qkiV9/hVaaSelK0lD6HrOFtDZ0NvmiuK
         qySruXfDYv0mwWP7L6xWediobIngIehJS6ujb0sugZrjUIUqHONbce+18wNVC4TLnPtq
         tXJhnWe0ax4yCYJDWPE4ewPne8e2tj/vbluXvIcslfMw2nS8hLjH7D6DK+IgrPyqxL4/
         LhUpdPBMWMVoks20c1zD4by5+zVpVNsU0ehwrMmXx3tgC7crOsW5cWwp8KSXZ1ZzG7ki
         qSGuJZkbeoKVdV8rAyc0Rod3+9t6PA2/MZ8Vyg1nm1AJjgfIxiYcZb4TeRdp2bkjE0ah
         WhsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a3kRQm0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9-20020ac85f49000000b0040fd9d097b2si2329470qta.54.2023.09.15.07.20.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Sep 2023 07:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a3kRQm0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qh9ff-0007Lt-8q; Fri, 15 Sep 2023 10:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1qh9fX-0007FY-JN
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 10:19:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1qh9fV-0000N1-JH
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 10:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694787576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a32ot1mLc+fauQaQeiFV3v+/qakq+bCy5oHpGBXA1nk=;
 b=a3kRQm0ftJkXxekAWUkxc/bMXk6bdWsVpZS6B7POJOuYojQQwQXyEQWvDoc2p1mDbKfrdb
 sC/Lu+QPkqiNESpLnkGk6Cx5vAr+yh2+yf/dcen1yxlIgIXARVzfiilUVxKNYS+RneOnlb
 o/uaUYtgVXHOE4I/Xie2i+o17R+Mf7s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-aH8DfOJYNUWDQP_BwNZXag-1; Fri, 15 Sep 2023 10:19:33 -0400
X-MC-Unique: aH8DfOJYNUWDQP_BwNZXag-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6562de246d3so14699676d6.1
 for <qemu-arm@nongnu.org>; Fri, 15 Sep 2023 07:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694787573; x=1695392373;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a32ot1mLc+fauQaQeiFV3v+/qakq+bCy5oHpGBXA1nk=;
 b=t/pjx3MIKgVGQN0VZHt38bnD9VagwGIR52VVpziKEXUSi6WdRt2H3r0/9KkC8o8C8L
 xM+iUUVX8RaOeUjPGAZ4nfZL8PfiOsG60iX8nYMgN6s08TnUOXIz6IFMRz0CUKk9GvXG
 jm4g+BGiawvPGfBXtdhHL2VGUo0HR/6tQUd9el9aU3G9JbMspWQ7plLlQCyQe6tKcZEa
 09GX9dt3FSvTYwJJ8grbGtP1ZPIdQdsFCCrbZOpuLpjj9f4KwsWKNLbpknk3hCopfSxf
 vj1Eapgv74CEdYudMv2Cf/hP0rNGNQxY5dMtnvd0Tkxej5maVAFBZwoNdmLIbe9cGjQb
 PYkg==
X-Gm-Message-State: AOJu0YwLD5C0T87+SByXSdCXeELyCHsFdtbnmeY3xic7KFWfmcrvVQZZ
 zAH0w0gcDRxmPZn0ICkLtUCxn190ExbT3LSRo96wfX/TIA3F6B5Bzd+maYdGAigu7uJPATggkF+
 B/IEi7lyW0WV4
X-Received: by 2002:a0c:f390:0:b0:64a:959f:22fb with SMTP id
 i16-20020a0cf390000000b0064a959f22fbmr1843913qvk.58.1694787573110; 
 Fri, 15 Sep 2023 07:19:33 -0700 (PDT)
X-Received: by 2002:a0c:f390:0:b0:64a:959f:22fb with SMTP id
 i16-20020a0cf390000000b0064a959f22fbmr1843886qvk.58.1694787572860; 
 Fri, 15 Sep 2023 07:19:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a0ca81a000000b00655e2005350sm1316128qva.9.2023.09.15.07.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 07:19:32 -0700 (PDT)
Message-ID: <d09b3df6-74f8-c93b-b26e-59de5b2dd114@redhat.com>
Date: Fri, 15 Sep 2023 16:19:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 0/4] vfio: report NUMA nodes for device memory
To: ankita@nvidia.com, jgg@nvidia.com, alex.williamson@redhat.com,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, ani@anisinha.ca
Cc: aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com,
 targupta@nvidia.com, vsethi@nvidia.com, acurrid@nvidia.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230915024559.6565-1-ankita@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230915024559.6565-1-ankita@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
X-TUID: TGwCHyVTu984

Hello Ankit,

On 9/15/23 04:45, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> For devices which allow CPU to cache coherently access their memory,
> it is sensible to expose such memory as NUMA nodes separate from
> the sysmem node. Qemu currently do not provide a mechanism for creation
> of NUMA nodes associated with a vfio-pci device.
> 
> Implement a mechanism to create and associate a set of unique NUMA nodes
> with a vfio-pci device.>
> NUMA node is created by inserting a series of the unique proximity
> domains (PXM) in the VM SRAT ACPI table. The ACPI tables are read once
> at the time of bootup by the kernel to determine the NUMA configuration
> and is inflexible post that. Hence this feature is incompatible with
> device hotplug. The added node range associated with the device is
> communicated through ACPI DSD and can be fetched by the VM kernel or
> kernel modules. QEMU's VM SRAT and DSD builder code is modified
> accordingly.
> 
> New command line params are introduced for admin to have a control on
> the NUMA node assignment.

This approach seems to bypass the NUMA framework in place in QEMU and
will be a challenge for the upper layers. QEMU is generally used from
libvirt when dealing with KVM guests.

Typically, a command line for a virt machine with NUMA nodes would look
like :

   -object memory-backend-ram,id=ram-node0,size=1G \
   -numa node,nodeid=0,memdev=ram-node0 \
   -object memory-backend-ram,id=ram-node1,size=1G \
   -numa node,nodeid=1,cpus=0-3,memdev=ram-node1

which defines 2 nodes, one with memory and all CPUs and a second with
only memory.

   # numactl -H
   available: 2 nodes (0-1)
   node 0 cpus: 0 1 2 3
   node 0 size: 1003 MB
   node 0 free: 734 MB
   node 1 cpus:
   node 1 size: 975 MB
   node 1 free: 968 MB
   node distances:
   node   0   1
     0:  10  20
     1:  20  10

   
Could it be a new type of host memory backend ?  Have you considered
this approach ?

Thanks,

C.

> 
> It is expected for a vfio-pci driver to expose this feature through
> sysfs. Presence of the feature is checked to enable these code changes.
> 
> Applied over v8.1.0-rc4.
> 
> Ankit Agrawal (4):
>    vfio: new command line params for device memory NUMA nodes
>    vfio: assign default values to node params
>    hw/arm/virt-acpi-build: patch guest SRAT for NUMA nodes
>    acpi/gpex: patch guest DSDT for dev mem information
> 
>   hw/arm/virt-acpi-build.c    |  54 +++++++++++++
>   hw/pci-host/gpex-acpi.c     |  69 +++++++++++++++++
>   hw/vfio/pci.c               | 146 ++++++++++++++++++++++++++++++++++++
>   hw/vfio/pci.h               |   2 +
>   include/hw/pci/pci_device.h |   3 +
>   5 files changed, 274 insertions(+)
> 

