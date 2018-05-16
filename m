Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1242759wme;
        Wed, 16 May 2018 08:22:20 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpN87LozxATvYZ8k8jg9+b2NhGKt/D+eaBhSriHVaMZY+VWhC+9w3sC22C/c85VvKm2BB/F
X-Received: by 2002:a37:5184:: with SMTP id f126-v6mr1213548qkb.265.1526484140743;
        Wed, 16 May 2018 08:22:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526484140; cv=none;
        d=google.com; s=arc-20160816;
        b=u4h95Nbt1M0oPU7WPUTlvOSFwRSNgwSWoZffUBjRPNTt9C2MUrBQR5crQjv4FKCHyM
         63jeLAeo7dPVDz9Mt74J6aOQdzEeIDRkFjTOINU4tzm3xKg4cmb4xvTwmsvduwodwthG
         k53BCz3cPTxxCU+PMlSHYYdyfjy4qgP7KvkIi3ZDebfwjSMhMtuxu+bs47S7v+lBU8IK
         ebSdW7jrNvlLti2orUnpqm/3YYWBCGhQo5CdaYsby7n+xveiwq8i9OrXfguL/nf2nn/U
         +emaKpKW6WHe7OJAXBWtrDamR76obmW4vHW7oOykzXeeUujuvrZZf/SGfMosGh4o5efg
         HbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=f6D65E/49dmXQ6OZMpXYEBdNnhagKdTS9bVHsp4XG34=;
        b=zU6WFHqjd5vHtVlPZekdHvBySSjPtN4m6lUr/eRmUyGIfmph3t78YCMz9O+MN5NC7s
         NmeSeUEgI4sc+aXMUrLM0ZivfhRhmi9BrIPCYTgnJzPh6De4SjEs2H6A8znZreDqUnbG
         aBkP/pCatpzIOH1SBH/AJ5SqpZZnBbIVo/PPX5N3IFfSr2SeiPI8EVOdYUPCJLoSzotw
         MdYdGjnYZaM0qJObo0MYpveCLyCxhj/YhRxnlg6SIfsYAm18jbaeEJF+3WslCUvMd+Ej
         MAs0X6a5aFLCEijwLoWHBAwuzIwOa1XjURBbe7a1qEvWRM2aY8Re6W5mR5VqMbOsmcKh
         ejtw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j16-v6si2840375qvj.75.2018.05.16.08.22.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 08:22:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51199 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIyFv-0007n2-8Z
	for alex.bennee@linaro.org; Wed, 16 May 2018 11:22:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyFh-0007mI-Fs
	for qemu-arm@nongnu.org; Wed, 16 May 2018 11:22:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyFc-0005gh-OE
	for qemu-arm@nongnu.org; Wed, 16 May 2018 11:22:05 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2616 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyFb-0005e4-Pn; Wed, 16 May 2018 11:22:00 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id AC8B631608156;
	Wed, 16 May 2018 23:21:41 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.361.1; Wed, 16 May 2018 23:21:36 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Wed, 16 May 2018 16:20:20 +0100
Message-ID: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [RFC v2 0/6] hw/arm: Add support for non-contiguous iova
 regions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, jonathan.cameron@huawei.com,
	linuxarm@huawei.com,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	eric.auger@redhat.com, alex.williamson@redhat.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xhdL0iIIBSpq

When the kernel reports valid iova ranges as non-contiguous,
memory should be allocated to Guest in such a way that
reserved regions(holes) are not visible by Guest.

This series retrieves the valid iova ranges based on the new
proposed VFIO interface for kernel [1]. It then populates the
first 1GB ram as a non-pluggable dimm and rest as a pc-dimm if
the valid iova ranges are non-contiguous.

Patch #3 of this series is loosely based on an earlier attempt
by Kwangwoo Lee to add hotplug/pc-dimm support to arm64[2]

RFC v1[3] --> RFCv2
 -Based on new VFIO kernel interface
 -Part of Mem modelled as pc-dimm 
 -Rebased to qemu 2.12.0

[1] https://lkml.org/lkml/2018/4/18/293
[2] https://lists.gnu.org/archive/html/qemu-devel/2016-07/msg04600.html
[3] https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg02412.html

Shameer Kolothum (6):
  hw/vfio: Retrieve valid iova ranges from kernel
  hw/arm/virt: Enable dynamic generation of guest RAM memory regions
  hw/arm/virt: Add pc-dimm mem hotplug framework
  hw/arm: Changes required to accommodate non-contiguous DT mem nodes
  hw/arm: ACPI SRAT changes to accommodate non-contiguous mem
  hw/arm: Populate non-contiguous memory regions

 default-configs/aarch64-softmmu.mak |   1 +
 hw/arm/boot.c                       |  91 ++++++---
 hw/arm/virt-acpi-build.c            |  24 ++-
 hw/arm/virt.c                       | 367 +++++++++++++++++++++++++++++++++++-
 hw/vfio/common.c                    | 108 ++++++++++-
 include/hw/arm/arm.h                |  12 ++
 include/hw/arm/virt.h               |   3 +
 include/hw/vfio/vfio-common.h       |   7 +
 linux-headers/linux/vfio.h          |  23 +++
 9 files changed, 589 insertions(+), 47 deletions(-)

-- 
2.7.4


