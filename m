Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2338200njb;
        Tue, 15 Oct 2024 03:04:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUf3HMRo2Ftrvaa0KHUeKGPxITrC+A9CVH928AwRea709H7sZd8twXZbeuV4eZGZ9XCpeqKQdaHlp8zuQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFJZixZLeEAxF88CoFRxxjT73aoFYl79Nu2st/QWihTS6dIuGDkZJXjzY5VlBi+exv4h17g
X-Received: by 2002:a17:903:40ce:b0:20c:7509:d948 with SMTP id d9443c01a7336-20ca14507bcmr201830745ad.17.1728986648624;
        Tue, 15 Oct 2024 03:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728986648; cv=none;
        d=google.com; s=arc-20240605;
        b=gGydZR4AQDhaJQv54EqIkhRA1pjw8eaOttkcwdqkb8bagxxaZbF3jsOv8Q97oxmW2O
         EK8pnfIQxH4RLPahFxjtcsdMFe2T9c7UUiI9Sbb2LR+PpOodHHeMyZifJ6OW1YI8oLbf
         qzb8pDL85c7DDAEGhnxrj/dx/BKCx6EUFku9qOQ885OPeXcrRGunX2v9r04YtLQiD+ac
         9Yr09i0lSfAzY6NMMsSCOfOCtDt65ODVENPra8w9PKsyUBMsqbMYeS3Bm+iDK8OzVHJe
         w40KdDA1WMz7l8ktKkE/8y5RQQ5h94TXszQqv9DQza1SDtRJSZB7sUAbCcuzyZg1Bg0e
         eRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=vRh7y2P6toDIhBFeeaGpb+TiXB1E0ZHxYjNICzOFhEs=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=DUmEj0AEOPXMC8VHInK4WBci4LrJd1uyWUYbsRtpsjomPu/QQJf7L/qE9DS42l9qSI
         6EZvSpAOp/zGUeLAJLwF1LC1ZQF4bxKpviqJ4KKnIP5B3CQhHjP1cdrjdr3MlqKXoIlT
         3CNhMVSU2NO7510OXLRheFdz2A5MdfAeVLa40SYQ0JLp2VMm7L0s13gbwPajKTsdRYw4
         ErbcG0tjRIbqM4lj1FNB2Hl/BKChfP4g0Ww4xjKKiKg8wqAtj3fO3YRDriu3lCVruYEg
         kfz4tzIz4dicx+vfzCujqhNga1/yZ+gCSfOEUcKox5dpMcpktN9JEpk0ttCKU1eawuXf
         fL+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-20d180c64besi12744515ad.381.2024.10.15.03.04.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:04:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSV6V1JRsz6K98V;
	Tue, 15 Oct 2024 18:03:30 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 509E4140A34;
	Tue, 15 Oct 2024 18:04:04 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:03:44 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V5 09/30] arm/acpi: Enable ACPI support for vCPU hotplug
Date: Tue, 15 Oct 2024 10:59:51 +0100
Message-ID: <20241015100012.254223-10-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: G78SyqN16XBy

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
index eac5070514..77cdbc5c27 100644
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
