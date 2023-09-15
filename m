Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1293781ejb;
        Fri, 15 Sep 2023 07:52:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA2eyTazu3pYs1mKA+6GNHIhabXXmDVzLNkbZ4psxJVsRcjcclspW/ePVWxC5ByS1REmmj
X-Received: by 2002:a05:620a:29d3:b0:76e:e68d:14b2 with SMTP id s19-20020a05620a29d300b0076ee68d14b2mr2335084qkp.7.1694789542488;
        Fri, 15 Sep 2023 07:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694789542; cv=none;
        d=google.com; s=arc-20160816;
        b=Ru7AjPddYEB29ZZrpfjci55lkCBK9fD2tC0pjexCsp3xkSi+yurH/TUaqd0JCnNeNM
         tiTVKYjFN4PrqynIs+KNArmZW1FwnTfeme78wQ5VHKVebKC41U5e3ER5/pUW/BzmBAVL
         Ilh4l0SSECYU/qHcGp75jiYluJ5cYnnKscV/o9wxjp5pfLqbk+pSF0eM1ogGLiQW4qRB
         9PnVfsnWbuvMj258bPqBB0yGOel9JMTx5Eh8RBbHFF8ua/KieKG0pb1g9mf/I0BTP3ks
         LV+U3pnSP5pkllumQ/nBTU+jBpL6sR4ejpUTM0Ax1UanLRTF6qF/nSRqqAaZNlen7V6x
         A/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:dkim-signature;
        bh=m1zC+/mV0GQxS66pJuHR3016SQsszrgewXG+5sG/+Vc=;
        fh=PggjEyYaKhjYOF8iiNzOUaBUXci4aP5WrSFpC3EdfaU=;
        b=ARzEmCLdAdkHeyy/KoqRZoW3C/sFxIdo0C46Gd8oBuwnK3lQqNIvupxOnWfpwiDjjy
         7DzpEfE/UnvTOrgCxCMdadNMJ9Z+pA2+47rVVhqWRL2LjusEKsNYdJqdClyChcdWRn/7
         r7Hqy7LCwMCJPOSD+B88Z12kxfibaCiN8DEbqVGQ0HfDJMhK90puSbZoyzC9RCAf+aX/
         BozikvNq8wFt0GxOGVcOrOCD1iElsEXMUW53QikZw6CCdCJB0Y8lWXyyQewkrJngxVpq
         Pfwas+J52oznk8fvCjTXvfwXYTyr/fk6LRtSQB62JJXRYaVWJTzsAA+u2tQVpO0vTjtR
         fmeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HuO2pU6R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn7-20020a05620a2ac700b0076f1d964ea4si2374688qkb.96.2023.09.15.07.52.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Sep 2023 07:52:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HuO2pU6R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qhA77-00081n-Ho; Fri, 15 Sep 2023 10:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qhA70-0007jb-Qv
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 10:48:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qhA6y-0005pO-Rp
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 10:48:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694789279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m1zC+/mV0GQxS66pJuHR3016SQsszrgewXG+5sG/+Vc=;
 b=HuO2pU6RCy7IYd2rD/5PxsSjO97Vk0flr/KubxlMtIwiIEWZ+5sBKDOHgJ3Y7WpOX9TRPS
 8TN1XaIfLBbAZPFWxZLuriIGQLnzHBbStL8zjC0ZibynmvFImTq1/OuuNAa9rwXkVz3n8Y
 Xa1SW4C7VCjl0deZ0jZVMXHIWR4XXD0=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-vwsiVqRQNWmB4rfsDgg9kA-1; Fri, 15 Sep 2023 10:47:58 -0400
X-MC-Unique: vwsiVqRQNWmB4rfsDgg9kA-1
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-797f764a6faso194881439f.0
 for <qemu-arm@nongnu.org>; Fri, 15 Sep 2023 07:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694789277; x=1695394077;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DDZd0j05ISiiASU+Undv8ratNzoMS8WQhDvNfKUB/cQ=;
 b=DmfOzoNXZH+6m03fPPoEwpXIqJ25rCMVvbNfS2GHTCIYI5/NJ4KhHHTjHa01ISeYd1
 JfIbIPUZTpVkY0g+j353ARsLjDEIO/pvRmZ5iLZbeUIDz28Vk7E511BhvlrdV/etAzlh
 aoLRZb4/PCKedZPu17Q/Qt3k5sRGqKsexaDmKjx9DnxDR0goRd1/1bePWH4mQaJFcME0
 uR3EF8+kUcFRN5Ns3eVdsoj0zJZrOuS8fJBThRErsOIZ4siS0bgGglFoJu9M7jDmiwl5
 DE5xMqzX7H17a10FAJ5nrjJFrbmKDXynWcDM8mGU1QvHNMaf+hO8kUTQnTKrnTeTa431
 pM4A==
X-Gm-Message-State: AOJu0YysVd+e0fgtXVkTRrA+JpRTQjqyP8QmvKRTaeWAZfU3V/AqhJjE
 EWSBDjUeztuT4xGpnOVUlE46Z79YZUEtGE+BJWxJya2LSPCVzgrRnpNjo846gOlsbpWAzkN6Abd
 qBDLK1Z3RcITv
X-Received: by 2002:a05:6e02:152:b0:349:3020:d103 with SMTP id
 j18-20020a056e02015200b003493020d103mr2261469ilr.25.1694789277386; 
 Fri, 15 Sep 2023 07:47:57 -0700 (PDT)
X-Received: by 2002:a05:6e02:152:b0:349:3020:d103 with SMTP id
 j18-20020a056e02015200b003493020d103mr2261447ilr.25.1694789277125; 
 Fri, 15 Sep 2023 07:47:57 -0700 (PDT)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 g26-20020a02b71a000000b00433dd6c78b0sm1067707jam.97.2023.09.15.07.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 07:47:56 -0700 (PDT)
Date: Fri, 15 Sep 2023 08:47:54 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>
Cc: ankita@nvidia.com, jgg@nvidia.com, shannon.zhaosl@gmail.com,
 peter.maydell@linaro.org, ani@anisinha.ca, aniketa@nvidia.com,
 cjia@nvidia.com, kwankhede@nvidia.com, targupta@nvidia.com,
 vsethi@nvidia.com, acurrid@nvidia.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v1 0/4] vfio: report NUMA nodes for device memory
Message-ID: <20230915084754.4b49d5c0.alex.williamson@redhat.com>
In-Reply-To: <d09b3df6-74f8-c93b-b26e-59de5b2dd114@redhat.com>
References: <20230915024559.6565-1-ankita@nvidia.com>
 <d09b3df6-74f8-c93b-b26e-59de5b2dd114@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: uvjAqNjrC6cf

On Fri, 15 Sep 2023 16:19:29 +0200
C=C3=A9dric Le Goater <clg@redhat.com> wrote:

> Hello Ankit,
>=20
> On 9/15/23 04:45, ankita@nvidia.com wrote:
> > From: Ankit Agrawal <ankita@nvidia.com>
> >=20
> > For devices which allow CPU to cache coherently access their memory,
> > it is sensible to expose such memory as NUMA nodes separate from
> > the sysmem node. Qemu currently do not provide a mechanism for creation
> > of NUMA nodes associated with a vfio-pci device.
> >=20
> > Implement a mechanism to create and associate a set of unique NUMA node=
s
> > with a vfio-pci device.>
> > NUMA node is created by inserting a series of the unique proximity
> > domains (PXM) in the VM SRAT ACPI table. The ACPI tables are read once
> > at the time of bootup by the kernel to determine the NUMA configuration
> > and is inflexible post that. Hence this feature is incompatible with
> > device hotplug. The added node range associated with the device is
> > communicated through ACPI DSD and can be fetched by the VM kernel or
> > kernel modules. QEMU's VM SRAT and DSD builder code is modified
> > accordingly.
> >=20
> > New command line params are introduced for admin to have a control on
> > the NUMA node assignment. =20
>=20
> This approach seems to bypass the NUMA framework in place in QEMU and
> will be a challenge for the upper layers. QEMU is generally used from
> libvirt when dealing with KVM guests.
>=20
> Typically, a command line for a virt machine with NUMA nodes would look
> like :
>=20
>    -object memory-backend-ram,id=3Dram-node0,size=3D1G \
>    -numa node,nodeid=3D0,memdev=3Dram-node0 \
>    -object memory-backend-ram,id=3Dram-node1,size=3D1G \
>    -numa node,nodeid=3D1,cpus=3D0-3,memdev=3Dram-node1
>=20
> which defines 2 nodes, one with memory and all CPUs and a second with
> only memory.
>=20
>    # numactl -H
>    available: 2 nodes (0-1)
>    node 0 cpus: 0 1 2 3
>    node 0 size: 1003 MB
>    node 0 free: 734 MB
>    node 1 cpus:
>    node 1 size: 975 MB
>    node 1 free: 968 MB
>    node distances:
>    node   0   1
>      0:  10  20
>      1:  20  10
>=20
>   =20
> Could it be a new type of host memory backend ?  Have you considered
> this approach ?

Good idea.  Fundamentally the device should not be creating NUMA nodes,
the VM should be configured with NUMA nodes and the device memory
associated with those nodes.

I think we're also dealing with a lot of very, very device specific
behavior, so I question whether we shouldn't create a separate device
for this beyond vifo-pci or vfio-pci-nohotplug.

In particular, a PCI device typically only has association to a single
proximity domain, so what sense does it make to describe the coherent
memory as a PCI BAR to only then create a confusing mapping where the
device has a proximity domain separate from a resources associated with
the device?

It's seeming like this device should create memory objects that can be
associated as memory backing for command line specified NUMA nodes.
Thanks,

Alex

