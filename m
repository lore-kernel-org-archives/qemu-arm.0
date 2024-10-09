Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp595626njl;
        Tue, 8 Oct 2024 20:22:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVP6T7mc+zNcnhV6giXU7Je55P/Zz0RZXt+mOuTUMtYOWpDIHjyvtmHctqLAOUJc4lf56+vKY+Fm8Dy/w==@linaro.org
X-Google-Smtp-Source: AGHT+IF6wQjB/FmwmTsrzpxf8JtQBXS+mUxXbciVRuUPBExI+vYSe4Ikzt+6qIA9AvE3UO4s564k
X-Received: by 2002:a17:902:b289:b0:20b:61ec:7d2c with SMTP id d9443c01a7336-20c637d2b03mr13750185ad.44.1728444177876;
        Tue, 08 Oct 2024 20:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444177; cv=none;
        d=google.com; s=arc-20240605;
        b=MwAtORpDyj4U8CoRHTMqLBKfYfBIoBLA+RWbxjpEx8QXWRaB/Fkk5g6gftjzvpFYwQ
         h+uO0PPYve7Pfo8agdU16y+CI1cR9HPs8LTmRum9Q9xHhUqKPLWlAT4DWk4CP8ddfAG2
         oqqVZcUX/2slGlf1kVv1rtrQfw/qUiiihW3t9W0mJvdIJMPeKfZm1hGUhEeuJwc8s/vX
         C96KyAPnoa7aWMaswxhSAlBaewbp4Z53rCjdfJXFUmPPghVdscMiOjFNc8notsl5qmGN
         44E6SFhOMcEcbQ8/jbgGGE5vLjOhAoDtNkTbNqGAYbKj3FMyAmPn4/JGiOYTmoOlPb47
         Sumg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=7mLkHuHv3xU5YC+khcu/Mc+J0laXhVviae57itLtmMU=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=GITIMG1FfJ4fBNqfIrL0OtLPg0WtYQMTWU6SuOlvNJIlB6+EAKkAiXJfQ7I3P/2fd5
         NZrBiCRqqIhpKSIBpR/mS1ghIpfvt5fhytSY6uvXMFe+ZcRuo7TGztU5ntHVcjHKdd/+
         YizaPdpra51R7AG5YighnOdrtS/U6XvPNpA4FfmBsXRuGAIR23/ji3rSKDDS9PObevrs
         3jEm6B5GD5fT0/VP3hYCeJX2+mc3y7CuRn1M1xUFx2gpJv8bzHtoRLmxammYnqeYEhNf
         DkykkT9gtRnVI5yRqIz8XyeuPVSw2gy18ahqLBiXldBYY25rDCBiV/CWtwh97QjLS6Y1
         p6KQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-20c1393d3easi100108305ad.260.2024.10.08.20.22.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:22:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdTY4Fctz6J69c;
	Wed,  9 Oct 2024 11:21:37 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id F06B9140A34;
	Wed,  9 Oct 2024 11:22:53 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:22:34 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V4 10/33] arm/acpi: Enable ACPI support for vCPU hotplug
Date: Wed, 9 Oct 2024 04:17:52 +0100
Message-ID: <20241009031815.250096-11-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: DDSlm7qN7MQM

ACPI is required to interface QEMU with the guest. Roughly falls into below
cases,

1. Convey the possible vCPUs config at the machine init time to the guest
   using various DSDT tables like MADT etc.
2. Convey vCPU hotplug events to guest(using GED)
3. Assist in evaluation of various ACPI methods(like _EVT, _STA, _OST, _EJ0,
   _MAT etc.)
4. Provides ACPI CPU hotplug state and 12 Byte memory mapped vCPU hotplug
   control register interface to the OSPM/guest corresponding to each possible
   vcpu. The register interface consists of various R/W fields and their
   handling operations. These are called when ever register fields or memory
   regions are accessed (i.e. read or written) by OSPM when ever it evaluates
   various ACPI methods.

Note: lot of this framework code is inherited from the changes already done for
      x86 but still some minor changes are required to make it compatible with
      ARM64.)

Enable the ACPI support switch for vCPU hotplug feature. Actual ACPI changes
required will follow in subsequent patches.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 1ad60da7aa..b6f0a65ead 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -33,6 +33,7 @@ config ARM_VIRT
     select ACPI_HW_REDUCED
     select ACPI_APEI
     select ACPI_VIOT
+    select ACPI_CPU_HOTPLUG
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
     select ACPI_HMAT
-- 
2.34.1
