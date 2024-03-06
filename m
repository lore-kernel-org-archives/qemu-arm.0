Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp380833ejb;
        Wed, 6 Mar 2024 01:13:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWchCAgknTUFUIgIC81zkbWfQ3/4yZmq6BNbimFhoBdXhKNupi1bdaUICkF5n9t39NNdVqvVuvfLzatv5mqKDKrnctR4PGa
X-Google-Smtp-Source: AGHT+IFfhvuCbKtSIWM3uOF1P3zorJqgmr8szb9On4zapoKKJS0+vYGTATPsa3VOmdBYPaDicPgX
X-Received: by 2002:a0c:e441:0:b0:690:897f:a615 with SMTP id d1-20020a0ce441000000b00690897fa615mr3693721qvm.9.1709716389202;
        Wed, 06 Mar 2024 01:13:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709716389; cv=none;
        d=google.com; s=arc-20160816;
        b=zWztXk2DUv6hFr1AwwMkQMPM3HG7lmsUOkhs4MnRwt0atp0RMQUe4J+lwHDgTOuRbH
         wttXsqkA888WYPg5ZowgSDD58ggCJe0TfxtQCPpO0HVLvYd1IZwBz2wHPfswGJFfviPb
         9ZhdhNw1KpLfgm6zTEprdKz2OluLbLY31pxfOlfUCsJTVXYS7qRUWinjn7GnKepkydEW
         4k4Vaj3xuVdow+mUVeSXHfaErMEP3jD3pdwPh6zshRV+z5J0wuPYuU4DRdABf2CNGp39
         DPkBmajcDnh+CI2LQmtxN74x/fWODSCGNAGK7gFmXmYuAnCwVV54UqcNJSMFrbzRQneJ
         WwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=Ix5xOJqLYr7w/HTxqVLMqz2EUzihrKosNUDugP2z9LE=;
        fh=0LvxF2gBko4aRsXKwNWweY2aR++Z7KX7V7rhsneOS3o=;
        b=yR+T/5fnJsxE3zWTg0RirH2Hixec2Wv8DJPBhgtim9JAkWiUjpUhpK2kK5ZfW88Fs1
         27R4T4ZCmOiKHyUBwbiK8qc18gqpYlWjwwQSBWrORV0UjhmoCY/D1/VCmYrZuX4QmEq0
         JIUpBHmNnsMtF6Oj7ICVGhg5e8tO2AkyyxnsvK+eyN6qky1m5IzZDJ/43HQeHIlLzDzG
         0K2W53WzC+/374CDSA6m370+LM/NVpPTCmoQeRXg3rDAXoyMuUNJzVMSqQrlgLtxpo6N
         eAXCu6+wknq8evPfd5KzHjz3F8gVfr/5BJy204Wf8K4DqLlf6FpAJHg8EbCzIZqP+Yyz
         4l4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2-20020a05621421c200b0068ff09d8b69si14913919qvh.197.2024.03.06.01.13.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 01:13:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhnKb-0000rL-ER; Wed, 06 Mar 2024 04:12:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rhnKZ-0000qc-Ab; Wed, 06 Mar 2024 04:12:55 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rhnKV-0007cU-A3; Wed, 06 Mar 2024 04:12:54 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TqRR40drBz67hqY;
 Wed,  6 Mar 2024 17:07:44 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 15F27140DF4;
 Wed,  6 Mar 2024 17:12:43 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 6 Mar
 2024 09:12:42 +0000
Date: Wed, 6 Mar 2024 09:12:41 +0000
To: Jonathan Cameron via <qemu-devel@nongnu.org>
CC: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, <ankita@nvidia.com>,
 <jgg@nvidia.com>, <alex.williamson@redhat.com>, <clg@redhat.com>,
 <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>, <ani@anisinha.ca>,
 <berrange@redhat.com>, <eduardo@habkost.net>, <imammedo@redhat.com>,
 <mst@redhat.com>, <eblake@redhat.com>, <armbru@redhat.com>,
 <david@redhat.com>, <gshan@redhat.com>, <zhiw@nvidia.com>,
 <mochs@nvidia.com>, <pbonzini@redhat.com>, <aniketa@nvidia.com>,
 <cjia@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <vsethi@nvidia.com>, <acurrid@nvidia.com>, <dnigam@nvidia.com>,
 <udhoke@nvidia.com>, <qemu-arm@nongnu.org>
Subject: Re: [PATCH v7 2/2] hw/acpi: Implement the SRAT GI affinity structure
Message-ID: <20240306091241.0000432b@Huawei.com>
In-Reply-To: <20240226164229.00001536@Huawei.com>
References: <20240223124223.800078-1-ankita@nvidia.com>
 <20240223124223.800078-3-ankita@nvidia.com>
 <20240226164229.00001536@Huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: sCy9FZ3nfbt5

On Mon, 26 Feb 2024 16:42:29 +0000
Jonathan Cameron via <qemu-devel@nongnu.org> wrote:

> On Fri, 23 Feb 2024 12:42:23 +0000
> <ankita@nvidia.com> wrote:
> 
> > From: Ankit Agrawal <ankita@nvidia.com>
> > 
> > ACPI spec provides a scheme to associate "Generic Initiators" [1]
> > (e.g. heterogeneous processors and accelerators, GPUs, and I/O devices with
> > integrated compute or DMA engines GPUs) with Proximity Domains. This is
> > achieved using Generic Initiator Affinity Structure in SRAT. During bootup,
> > Linux kernel parse the ACPI SRAT to determine the PXM ids and create a NUMA
> > node for each unique PXM ID encountered. Qemu currently do not implement
> > these structures while building SRAT.
> > 
> > Add GI structures while building VM ACPI SRAT. The association between
> > device and node are stored using acpi-generic-initiator object. Lookup
> > presence of all such objects and use them to build these structures.
> > 
> > The structure needs a PCI device handle [2] that consists of the device BDF.
> > The vfio-pci device corresponding to the acpi-generic-initiator object is
> > located to determine the BDF.
> > 
> > [1] ACPI Spec 6.3, Section 5.2.16.6
> > [2] ACPI Spec 6.3, Table 5.80
> > 
> > Signed-off-by: Ankit Agrawal <ankita@nvidia.com>  
> 
> One thing I forgot.
And another :)

It might be nice to also support x86 from the start (apparently people still
care about that old architecture)

https://gitlab.com/jic23/qemu/-/commit/ccfb4fe22167e035173390cf147d9c226951b9b6
is what I'm carrying for this (see below)

We could do this later as part of the generic ports series (which is also on
that tree if you are curious).

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 2d2bb0a325b83f5e3fb4666a462a693aea1a2220..54462d3a46c379a4159b4d71d7689a107745fa4c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -68,6 +68,7 @@
 #include "hw/acpi/utils.h"
 #include "hw/acpi/pci.h"
 #include "hw/acpi/cxl.h"
+#include "hw/acpi/acpi-generic-initiator.h"
 
 #include "qom/qom-qobject.h"
 #include "hw/i386/amd_iommu.h"
@@ -2097,6 +2098,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
         }
     }
 
+    build_srat_generic_pci_initiator(table_data);
     if (machine->nvdimms_state->is_enabled) {
         nvdimm_build_srat(table_data);
     }




> 
> Please add a test.  tests/qtest/bios-tables-test.c
> + relevant table dumps.
> 
> Could also hook this up for x86 with a oneline addition and improve
> test coverage.  If not, I'll do it when I add Generic Ports as annoyingly
> people still care about x86 for some reason.
> 

