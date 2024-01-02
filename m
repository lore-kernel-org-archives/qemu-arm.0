Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1290936eji;
        Tue, 2 Jan 2024 04:32:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0Ywr56/L/pfNQWOksVyl7uVmQ3jL8uh7hSoPfs4u01fiVrrLv2RBGYeJvV7XAe+era0fG
X-Received: by 2002:a05:6214:c42:b0:680:b881:5837 with SMTP id r2-20020a0562140c4200b00680b8815837mr3255249qvj.112.1704198757852;
        Tue, 02 Jan 2024 04:32:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704198757; cv=none;
        d=google.com; s=arc-20160816;
        b=J4UJSfRMmuyprHtVneXfT3XLx9FhAKytkrg/2DJS5uxgHSH5pFvJfuAntHMxJ9njHM
         8LBuka21GSiEgXhkmT2niR+zAcfU7h4xa/bsX/WIiQ4K/vC8yaVNjDDjZo0sV47Hryoh
         W88xN6ExtjWK+FTFVOPsPpw2JKArckOrN4mzwaDqA8Sx7nq3gwmAfcb4lhOq/FJLMuxj
         mPahmnCjOX8qsXwTex1aNv+r1x8EhhYdv2ShgLzdygvfbJ31wB9VvSS4Kn3m8g7AsjT7
         o6hKyKGdX1qsavRxNtpWiJJNxId3ubecK1YKBM9k1LsqkIb087fVIFD01qCb/U7oVTFH
         2JqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=J1Oisp85ibOv+thb2GuLX2mQxC5ajp4oAk9xAoq4bbY=;
        fh=DatRyqcc4vnlO5WuI3KCxbBmFk6W5gIOnuYG26IdcZo=;
        b=uXZOOPhMScxHaEuft0Y7KgeOfMkmHwZmVL0a5Wo85RO9dd3LK7C6NpsqI0My2sZ+H9
         aVTR4HwoSVT0noc4fZok9hNEQDq8tdWeWa60DmKWdQiTZySgZbwGHDWLFIdxHu7z7PdY
         7mlCdSW3HNi2aJHqNCeQXxcQ1nYGOSJc9ujQNvOuvEdfBjl2YlXYJ89yf+FXwP17L1JF
         xqqOm3GTLnv7PI9AjCj0GEqTu2X7B5ugDHipzLtKhwW1KwCFlzDrL6JsYr3iMAMzf8/G
         I/rbvqaXXIQLqwRqVpGc8aKy/vjlFEv47jIGgrPqGpWDVzeYo0jpRL6iO7BstfQHDh6z
         XDpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t17-20020a0cb391000000b0067efe941156si26391747qve.138.2024.01.02.04.32.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jan 2024 04:32:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rKdwW-0003JU-Cc; Tue, 02 Jan 2024 07:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rKdwU-0003JF-EA; Tue, 02 Jan 2024 07:32:22 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rKdwR-0006Oc-Q1; Tue, 02 Jan 2024 07:32:22 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4T4Bxj4gbpz6K7JW;
 Tue,  2 Jan 2024 20:29:45 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id B7DFA140DDB;
 Tue,  2 Jan 2024 20:31:49 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Jan
 2024 12:31:45 +0000
Date: Tue, 2 Jan 2024 12:31:43 +0000
To: <ankita@nvidia.com>
CC: <jgg@nvidia.com>, <alex.williamson@redhat.com>, <clg@redhat.com>,
 <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>, <ani@anisinha.ca>,
 <berrange@redhat.com>, <eduardo@habkost.net>, <imammedo@redhat.com>,
 <mst@redhat.com>, <eblake@redhat.com>, <armbru@redhat.com>,
 <david@redhat.com>, <gshan@redhat.com>, <aniketa@nvidia.com>,
 <cjia@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <vsethi@nvidia.com>, <acurrid@nvidia.com>, <dnigam@nvidia.com>,
 <udhoke@nvidia.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v6 0/2] acpi: report numa nodes for device memory using GI
Message-ID: <20240102123143.00006486@Huawei.com>
In-Reply-To: <20231225045603.7654-1-ankita@nvidia.com>
References: <20231225045603.7654-1-ankita@nvidia.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9I2sehmzT3M/

On Mon, 25 Dec 2023 10:26:01 +0530
<ankita@nvidia.com> wrote:

> From: Ankit Agrawal <ankita@nvidia.com>
> 
> There are upcoming devices which allow CPU to cache coherently access
> their memory. It is sensible to expose such memory as NUMA nodes separate
> from the sysmem node to the OS. The ACPI spec provides a scheme in SRAT
> called Generic Initiator Affinity Structure [1] to allow an association
> between a Proximity Domain (PXM) and a Generic Initiator (GI) (e.g.
> heterogeneous processors and accelerators, GPUs, and I/O devices with
> integrated compute or DMA engines).
> 
> While a single node per device may cover several use cases, it is however
> insufficient for a full utilization of the NVIDIA GPUs MIG
> (Mult-Instance GPUs) [2] feature. The feature allows partitioning of the
> GPU device resources (including device memory) into several (upto 8)
> isolated instances. Each of the partitioned memory requires a dedicated NUMA
> node to operate. The partitions are not fixed and they can be created/deleted
> at runtime.
> 
> Linux OS does not provide a means to dynamically create/destroy NUMA nodes
> and such feature implementation is expected to be non-trivial. The nodes
> that OS discovers at the boot time while parsing SRAT remains fixed. So we
> utilize the GI Affinity structures that allows association between nodes
> and devices. Multiple GI structures per device/BDF is possible, allowing
> creation of multiple nodes in the VM by exposing unique PXM in each of these
> structures.
> 
> Implement the mechanism to build the GI affinity structures as Qemu currently
> does not. Introduce a new acpi-generic-initiator object that allows an
> association of a set of nodes with a device. During SRAT creation, all such
> objected are identified and used to add the GI Affinity Structures. Currently,
> only PCI device is supported. On a multi device system, each device supporting
> the features needs a unique acpi-generic-initiator object with its own set of
> NUMA nodes associated to it.
> 
> The admin will create a range of 8 nodes and associate that with the device
> using the acpi-generic-initiator object. While a configuration of less than
> 8 nodes per device is allowed, such configuration will prevent utilization of
> the feature to the fullest. This setting is applicable to all the Grace+Hopper
> systems. The following is an example of the Qemu command line arguments to
> create 8 nodes and link them to the device 'dev0':
> 
> -numa node,nodeid=2 -numa node,nodeid=3 -numa node,nodeid=4 \
> -numa node,nodeid=5 -numa node,nodeid=6 -numa node,nodeid=7 \
> -numa node,nodeid=8 -numa node,nodeid=9 \
> -device vfio-pci-nohotplug,host=0009:01:00.0,bus=pcie.0,addr=04.0,rombar=0,id=dev0 \
> -object acpi-generic-initiator,id=gi0,pci-dev=dev0,host-nodes=2-9 \
> 

I'd find it helpful to see the resulting chunk of SRAT for these examples
(disassembled) in this cover letter and the patches (where there are more examples).

