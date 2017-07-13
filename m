Received: by 10.25.44.15 with SMTP id s15csp2464578lfs;
        Thu, 13 Jul 2017 10:37:16 -0700 (PDT)
X-Received: by 10.55.126.69 with SMTP id z66mr6012848qkc.48.1499967436182;
        Thu, 13 Jul 2017 10:37:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499967436; cv=none;
        d=google.com; s=arc-20160816;
        b=e8sZvhfb/fLUhAW/ve7pieu2Rr0bCAy85aOeWeeBN4i+JdN7K8PiRy3KtUJzXA/VDr
         w8K0VcxCkajkble9fJe8In24xv3FzRyM89FpcwBjQTnZv7IMKdkAuIMdihneRL6z0JnJ
         G9d5NcQloUEdt2bRUvtwsbp1a1W7Gd9Cr8FaFJ7QHCFCASahZbSg7n+lz8kxhV0ihsH0
         MU4W+3cct4iJZoJWSGzaPXUruB6OsYlllwRiajbIVUxfUd/AsSIWpIaOfa5BBRwEhlSh
         igWXqYAHbSDCgefDjtvjhoEB1s3VoeI8Gx+caJsdbN27zMeyAs1Pv9jZY2P0R8HTcRYF
         h/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=leTvRF+XY+ddCu/u9iVkl5DQmj/q0QfWJsZIuY8eTJI=;
        b=aJMIkJ/R1WuC5nwkAY9BxJaWLXzCulboBSHB/Ll0yIlZTLgUoDyi5y5RKeDfizOoAn
         ljALNW+3XWNIJiJRY/RjOUT45Ahf7UYZNddSDmZeyT4kEXjGvYv1EFLfdMQegWcwhNDg
         7cb4FEcfN43X29IjHZvk3JDGg028c6qKy1K3X2PAOiCIlse5X77azVORo7QBj+QM5BPi
         H2lyqJNUIUJqJ7E4FyJpgxVpTNYnRClm2iIThJDhA/1XE7X02eOVRxqJN9ahGrDeP1/c
         BFpS8Qg3nFPY6rmKilWzU2RwraKXMm3OMGxQXsMIJNmeAAOOm231yxW/dp2w4DPOZPpp
         l1hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i69si5633295qke.182.2017.07.13.10.37.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 10:37:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVi37-0000Cq-I2
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 13:37:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dVi33-0000CU-7U
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 13:37:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dVi2y-00075A-AJ
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 13:37:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57574)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1dVi2y-00074k-0x; Thu, 13 Jul 2017 13:37:04 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF1C1267CF;
	Thu, 13 Jul 2017 17:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DF1C1267CF
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mst@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com DF1C1267CF
Received: from redhat.com (ovpn-121-70.rdu2.redhat.com [10.10.121.70])
	by smtp.corp.redhat.com (Postfix) with SMTP id 27337702E6;
	Thu, 13 Jul 2017 17:36:57 +0000 (UTC)
Date: Thu, 13 Jul 2017 20:36:56 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dongjiu Geng <gengdongjiu@huawei.com>
Message-ID: <20170713203512-mutt-send-email-mst@kernel.org>
References: <1499825297-20335-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1499825297-20335-1-git-send-email-gengdongjiu@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 13 Jul 2017 17:37:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 0/3] Generate APEI GHES table and
 dynamically record CPER
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
Cc: peter.maydell@linaro.org, wuquanming@huawei.com, famz@redhat.com,
	zhengqiang10@huawei.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, james.morse@arm.com, huangshaoyu@huawei.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: idqdyhexo+YK

On Wed, Jul 12, 2017 at 10:08:14AM +0800, Dongjiu Geng wrote:
> In the armv8 platform, the mainly hardware error source are ARMv8
> SEA/SEI/GSIV. For the ARMv8 SEA/SEI, the KVM or host kernel will signal SIGBUS
> or use other interface to notify user space, such as Qemu. After Qemu gets
> the notification, it will record the CPER and inject the SEA/SEI to KVM. this
> series of patches will generate APEI table when guest OS boot up, and dynamically
> record CPER for the guest OS about the generic hardware errors, currently the
> userspace only handle the memory section hardware errors

This is in a decent shape. I would prefer some cod cleanups
before this goes in. Mostly I would like the amount of
pointer math trickery to go down, drop a bunch of
unused code and fix up comments that point to ACPI spec.

I pointed out some instances but pls find all instances and try
to clean up some more.

Thanks!

> how to test:
> 1. In the guest OS, use this command to dump the APEI table: 
> 	"iasl -p ./HEST -d /sys/firmware/acpi/tables/HEST"
> 2. And find the address for the generic error status block
>    according to the notification type
> 3. then find the CPER record through the generic error status block.
> 
> For example(notification type is SEA):
> 
> (1) root@genericarmv8:~# iasl -p ./HEST -d /sys/firmware/acpi/tables/HEST
> (2) root@genericarmv8:~# cat HEST.dsl
> 	/*
> 	 * Intel ACPI Component Architecture
> 	 * AML/ASL+ Disassembler version 20170303 (64-bit version)
> 	 * Copyright (c) 2000 - 2017 Intel Corporation
> 	 *
> 	 * Disassembly of /sys/firmware/acpi/tables/HEST, Mon Dec 12 07:19:43 2016
> 	 *
> 	 * ACPI Data Table [HEST]
> 	 *
> 	 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
> 	 */
>     ..................................................................................
>     [228h 0552   2]                Subtable Type : 0009 [Generic Hardware Error Source]
> 	[22Ah 0554   2]                    Source Id : 0008
> 	[22Ch 0556   2]            Related Source Id : FFFF
> 	[22Eh 0558   1]                     Reserved : 00
> 	[22Fh 0559   1]                      Enabled : 01
> 	[230h 0560   4]       Records To Preallocate : 00000001
> 	[234h 0564   4]      Max Sections Per Record : 00000001
> 	[238h 0568   4]          Max Raw Data Length : 00001000
> 
> 	[23Ch 0572  12]         Error Status Address : [Generic Address Structure]
> 	[23Ch 0572   1]                     Space ID : 00 [SystemMemory]
> 	[23Dh 0573   1]                    Bit Width : 40
> 	[23Eh 0574   1]                   Bit Offset : 00
> 	[23Fh 0575   1]         Encoded Access Width : 04 [QWord Access:64]
> 	[240h 0576   8]                      Address : 00000000785D0040
> 
> 	[248h 0584  28]                       Notify : [Hardware Error Notification Structure]
> 	[248h 0584   1]                  Notify Type : 08 [SEA]
> 	[249h 0585   1]                Notify Length : 1C
> 	[24Ah 0586   2]   Configuration Write Enable : 0000
> 	[24Ch 0588   4]                 PollInterval : 00000000
> 	[250h 0592   4]                       Vector : 00000000
> 	[254h 0596   4]      Polling Threshold Value : 00000000
> 	[258h 0600   4]     Polling Threshold Window : 00000000
> 	[25Ch 0604   4]        Error Threshold Value : 00000000
> 	[260h 0608   4]       Error Threshold Window : 00000000
> 
> 	[264h 0612   4]    Error Status Block Length : 00001000
>     .....................................................................................
> (3) according to above table, the address that contains the physical address of a block
>     of memory that holds the error status data for SEA notification error source is 0x00000000785D0040
> (4) the address for SEA notification error source is 0x785d8058
> 	(qemu) xp /2x 0x00000000785D0040
> 	00000000785d0040: 0x785d8058 0x00000000
> (5) check the content of generic error status block and generic error data entry
>     (qemu) xp /100x 0x785d8058
>     00000000785d8058: 0x00000001 0x00000000 0x00000000 0x00000098
>     00000000785d8068: 0x00000001 0xa5bc1114 0x4ede6f64 0x833e63b8
> 	00000000785d8078: 0xb1837ced 0x00000000 0x00000000 0x00000050
> 	00000000785d8088: 0x00000000 0x00000000 0x00000000 0x00000000
> 	00000000785d8098: 0x00000000 0x00000000 0x00000000 0x00000000
> 	00000000785d80a8: 0x00000000 0x00000000 0x00000000 0x00004002
> 	00000000785d80b8: 0x00000000 0x00000000 0x00000000 0x00001111
> 	00000000785d80c8: 0x00000000 0x00000000 0x00000000 0x00000000
> 	00000000785d80d8: 0x00000000 0x00000000 0x00000000 0x00000000
> 	00000000785d80e8: 0x00000000 0x00000000 0x00000000 0x00000000
> 	00000000785d80f8: 0x00000000 0x00000003 0x00000000 0x00000000
> 	00000000785d8108: 0x00000000 0x00000000 0x00000000 0x00000000
> 	00000000785d8118: 0x00000000 0x00000000 0x00000000 0x00000000
> 	00000000785d8128: 0x00000000 0x00000000 0x00000000 0x00000000
> 	00000000785d8138: 0x00000000 0x00000000 0x00000000 0x00000000
> 
> Dongjiu Geng (3):
>   ACPI: Add new ACPI structures and macros
>   ACPI: Add APEI GHES Table Generation support
>   ACPI: build and enable APEI GHES in the Makefile and configuration
> 
>  default-configs/arm-softmmu.mak |   1 +
>  hw/acpi/Makefile.objs           |   1 +
>  hw/acpi/aml-build.c             |   2 +
>  hw/acpi/hest_ghes.c             | 219 ++++++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c        |   6 ++
>  include/hw/acpi/acpi-defs.h     | 194 +++++++++++++++++++++++++++++++++++
>  include/hw/acpi/aml-build.h     |   1 +
>  include/hw/acpi/hest_ghes.h     |  47 +++++++++
>  include/qemu/uuid.h             |  11 ++
>  9 files changed, 482 insertions(+)
>  create mode 100644 hw/acpi/hest_ghes.c
>  create mode 100644 include/hw/acpi/hest_ghes.h
> 
> -- 
> 2.10.1
