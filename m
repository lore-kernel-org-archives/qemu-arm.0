Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp98302ejr;
        Thu, 13 Jun 2024 16:44:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWa4jIHdmWzUQvdFWQOcU+7qdM/a3kScn0oPiT1FQaPHia+jMVxOwkO7pxgB/slO7+nmPmWC1eLIsV9QOz1gSDLDNeq0HY
X-Google-Smtp-Source: AGHT+IHxuYmb7Tp+dN21jKp/sllbOri6lYsVYVjI04KacpIZrF9VVXHc37iVM3/PamOsx0pkCHp5
X-Received: by 2002:a05:6a20:a123:b0:1b1:f7a1:df91 with SMTP id adf61e73a8af0-1bae8353db0mr1659170637.61.1718322241368;
        Thu, 13 Jun 2024 16:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322241; cv=none;
        d=google.com; s=arc-20160816;
        b=mg2r9OU+B4KErSniEyjqBTyDwFXlF35EG5gWqKmOxhoA+OQ2Q0sWEd0thTJyZEkc3L
         BCr3kR9/SyeumBOdM4vVLmMyjdWUTDj5tI9iakXC0bgoeDwMn853PXP7rP+gGkNYs1Zf
         M3GSCTde/sK3ZPPkxhtkTUIM2F8KkF8vUvpe33jK//Y+9NoWlpWt+LblukOvM3Z8Vg3L
         d/2KG81F4Sv93dMIQ3GFCV9n3dN2ZGrNqIqmUvYckWwCxmi9YW5h0pOb39+a6nCelqu9
         jkmbCgfIvDuHC0/DO5AFMLSdZIPQPjagyVW4IOWNFzvGfrTaIJELTsXtZqgDF4KU9gbE
         Cy2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=U0MkhtkTmorqu3YZOEBY5M8g+0j8xFJH79hP7MzVzi4=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=lqy4T0c6tzKMaVc9wECfjX0pJcuyEL+EK6BDAKY2bBMeith6yCiqqC7ixLN90dfzIy
         x0BQ0/ZoORhTElCdNZhTlthcddOc/rntIhE/NQXAqvDgAHuCkSe83O0SY64cOUK98TT8
         kI/qDxAvZoRfwMofTI4ujyVT9AwVEAibnenYx4l/AUD2HkdtTdtJTQ1RJgeBcidbmIVn
         3WLNMJ3V3oyN8TeN7zyfRadsT8m+e9ARhgdO1NTPxSALb8NBsW3iP4Te9cLVK+1jxY9H
         yZYakz6gx3szFK2zGP1pb0iki+6RK8JCPBex81+oU3GIZm/MFpqmbQcoKzKhD0m1J4HE
         TXrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d2e1a72fcca58-705cc9019ebsi2296107b3a.11.2024.06.13.16.44.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:44:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0fBL0Bl2z6K6Sd;
	Fri, 14 Jun 2024 07:43:54 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id DD488140C72;
	Fri, 14 Jun 2024 07:43:56 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:43:34 +0100
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
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>
Subject: [PATCH RFC V3 16/29] hw/acpi: Make _MAT method optional
Date: Fri, 14 Jun 2024 00:36:26 +0100
Message-ID: <20240613233639.202896-17-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: sH3E8MhhYjAR

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The GICC interface on arm64 vCPUs is statically defined in the MADT, and
doesn't require a _MAT entry. Although the GICC is indicated as present
by the MADT entry, it can only be used from vCPU sysregs, which aren't
accessible until hot-add.

Co-developed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Co-developed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/cpu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 40b8899125..2240c6e108 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -717,10 +717,13 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
             aml_append(dev, method);
 
             /* build _MAT object */
-            build_madt_cpu(i, arch_ids, madt_buf, true); /* set enabled flag */
-            aml_append(dev, aml_name_decl("_MAT",
+            if (build_madt_cpu) {
+                build_madt_cpu(i, arch_ids, madt_buf,
+                                true); /* set enabled flag */
+                aml_append(dev, aml_name_decl("_MAT",
                 aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)));
-            g_array_free(madt_buf, true);
+                g_array_free(madt_buf, true);
+            }
 
             if (CPU(arch_ids->cpus[i].cpu) != first_cpu) {
                 method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
-- 
2.34.1
