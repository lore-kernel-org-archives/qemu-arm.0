Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2533672wre;
        Mon, 28 May 2018 07:26:14 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIulW7aVU4yI2F6iGy0EF/bNNacQJZgFaq8PFudp1SbQ1LA9agIXzRimRMlR2fCx09ynDjn
X-Received: by 2002:a0c:e5d1:: with SMTP id u17-v6mr12146596qvm.248.1527517574304;
        Mon, 28 May 2018 07:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527517574; cv=none;
        d=google.com; s=arc-20160816;
        b=WQfqdreE3Mnt6sIo898nI+U5yUgk/EZbOrcBBseFuRIXo9JNkFza/e9wH4x9An90SW
         RBqUu8Kw63kEFfFCwT//r1DSFg+SqlOsbNrEBRK/aQ/3reBRZzm1yPhJISKajIsdd6PE
         5Dy29PnbLKpV7/ZuY4ZsqIoVPUDRsDl3xacSzZ1LLloJ7f9GgMqFbn5eCuqt3PjKYKMX
         RKFfQ4WrPRHXlugqJUb7VoIARvyvv/P2qGy7PsnuJMT4719MxCLDA0cAj7vKfLGkwBDv
         XALr8a1MflLLkDU7QwXUsps+c9uIQONY8oqSRnq6jzUaQS/n/Io53hTahviTtLlsLMtC
         I3XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=P7c4Q98dAZz/iBIlYeDkzgCbu8MtRYmrBtbSA2iHT+E=;
        b=H5cM229oDeR/7T0E4cBo1Frhd5OSGUhue27SJf5rztAgB981zFTgDQgl0O0bNOmm8z
         /PCWNM+u2QpEULOwyNPCXg5fHX3MLU4ozGUKFbJJpInHIgWK1WmyhbEOLnQCgcKUfsOv
         qA+sAnMU9g4M6gj13TM3GEN0mWVHa6j5Xvh0Ud3ZJ/2O6m6MHyXVzOcIUza2O39Oxfwa
         Y3pGr3y4Pk/YziKnXbuExbqUkFzB5gB3/cBYUDj0tO5VoiPQ6McHsB0+YkJVmuvLUSf3
         0vC5yWh0DxvwoDCbAyER0VUjtH9B6LxhBvS64gZ8Z1u0/uAQswxmbwT6n8X69sWeLyA+
         3lPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 62-v6si392587qkt.231.2018.05.28.07.26.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 07:26:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNJ6D-0002c1-QK
	for alex.bennee@linaro.org; Mon, 28 May 2018 10:26:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNJ2F-0008Ai-RR
	for qemu-arm@nongnu.org; Mon, 28 May 2018 10:22:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNJ2E-0006W3-OM
	for qemu-arm@nongnu.org; Mon, 28 May 2018 10:22:07 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51686 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNJ2E-0006Vp-Iy; Mon, 28 May 2018 10:22:06 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C78CBB413;
	Mon, 28 May 2018 14:22:06 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD8902166BB2;
	Mon, 28 May 2018 14:22:04 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f365f305-175c-db54-677d-6f66719b24cd@redhat.com>
Date: Mon, 28 May 2018 16:22:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 28 May 2018 14:22:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 28 May 2018 14:22:06 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC v2 0/6] hw/arm: Add support for non-contiguous
 iova regions
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
	linuxarm@huawei.com, alex.williamson@redhat.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 34PbtKAB2uLy

Hi Shameer,

On 05/16/2018 05:20 PM, Shameer Kolothum wrote:
> When the kernel reports valid iova ranges as non-contiguous,
> memory should be allocated to Guest in such a way that
> reserved regions(holes) are not visible by Guest.
> 
> This series retrieves the valid iova ranges based on the new
> proposed VFIO interface for kernel [1]. It then populates the
> first 1GB ram as a non-pluggable dimm and rest as a pc-dimm if
> the valid iova ranges are non-contiguous.

Some general comments:

- what are your plans with respect to VFIO device hot-plug handling?
IIUC, at the moment, any collision between reserved regions induces by
hot-plugged devices are not detected/handled. I understand mem hotplug
is not supported on aarch64. Would you simply reject the vfio device
hotplug.

- IIUC any reserved window colliding with [4000000, 1GB] cold-plug RAM
segment is show-stopper. How was this 1GB size chosen exactly?

- Currently you create a single PC-DIMM node whereas several ones may be
possible & necessary? Do you plan to support multiple PC-DIMMS node?

- I have started looking at RAM extension on machvirt. I think adding
support of PC-DIMMS through the qemu cmd line is something that we need
to work on, in paralell.

Thanks

Eric
> 
> Patch #3 of this series is loosely based on an earlier attempt
> by Kwangwoo Lee to add hotplug/pc-dimm support to arm64[2]
> 
> RFC v1[3] --> RFCv2
>  -Based on new VFIO kernel interface
>  -Part of Mem modelled as pc-dimm 
>  -Rebased to qemu 2.12.0
> 
> [1] https://lkml.org/lkml/2018/4/18/293
> [2] https://lists.gnu.org/archive/html/qemu-devel/2016-07/msg04600.html
> [3] https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg02412.html
> 
> Shameer Kolothum (6):
>   hw/vfio: Retrieve valid iova ranges from kernel
>   hw/arm/virt: Enable dynamic generation of guest RAM memory regions
>   hw/arm/virt: Add pc-dimm mem hotplug framework
>   hw/arm: Changes required to accommodate non-contiguous DT mem nodes
>   hw/arm: ACPI SRAT changes to accommodate non-contiguous mem
>   hw/arm: Populate non-contiguous memory regions
> 
>  default-configs/aarch64-softmmu.mak |   1 +
>  hw/arm/boot.c                       |  91 ++++++---
>  hw/arm/virt-acpi-build.c            |  24 ++-
>  hw/arm/virt.c                       | 367 +++++++++++++++++++++++++++++++++++-
>  hw/vfio/common.c                    | 108 ++++++++++-
>  include/hw/arm/arm.h                |  12 ++
>  include/hw/arm/virt.h               |   3 +
>  include/hw/vfio/vfio-common.h       |   7 +
>  linux-headers/linux/vfio.h          |  23 +++
>  9 files changed, 589 insertions(+), 47 deletions(-)
> 
