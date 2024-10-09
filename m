Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp596180njl;
        Tue, 8 Oct 2024 20:24:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4dYZCfWsQd1cVfA82Cu/+DUZo05AkDzwS9TPudEjwldhk0ZyUJBBulbk8ZbnvD+LnbVaMxqnj+2EErg==@linaro.org
X-Google-Smtp-Source: AGHT+IFIzCrKgXlgEmH65MUlihIAaFhqhiVxKbL7qxwHGIw9REHtrOTYOhACqviqFkcJ6xh0fr2T
X-Received: by 2002:a17:90a:744a:b0:2dd:92e5:6f7d with SMTP id 98e67ed59e1d1-2e2a2471e84mr1505371a91.20.1728444294022;
        Tue, 08 Oct 2024 20:24:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444294; cv=none;
        d=google.com; s=arc-20240605;
        b=NhcAOGjU/IjFLzoDDrkWwgVlKotGTJvLpn3dw/GQ1hbeR+5PDDJl3k3M+1ELoIj2FR
         9zna5c3QYXBoN+NlvW05/YSLueoBilMnMiunjKtJUYbwiTE8ayuCZ2VVevoZ9C/rJIzE
         X+5iHlZXUTLevT7Z3L/F4mewT850hZpkyI+PB4aCQ232S73hod9gNYN8zQ/eU90uKUI1
         aafpbuf+guclvM+DwIMkaLzYi94DCTfIlTL7ilXZEtTKT8INgtSRibGlSzwRdicoh0R2
         rVvBdijDmki4aRCxvpv5rqBlyA/iPjsekkDeQLpzkaoGqCeQBAY5e8w28jn5dt82Ti6x
         Ce6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=1V0iwns42NhC4Ne9hVW3j5HCZ3gaWUBzlN7RaGXZyac=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=ejISTT2XNu8l1iWA+OctgQUCukxkd34LC3dJhR+3AGDqsPUOqc8OiqKy5pUUb8ckPn
         zUGcQfu9RLFCVCtG2vUUizO90bz33O8H1+1qYhN/wVlUMJVId699uubzxq3WQu8FKmGW
         lyCQiqJTg2ceug5uwMAp2K4NaFKBM8kLtLIt0y/W7fWYRXy/Au1BR6ZtzI61JAHyWKrS
         mV9ErLRk2yXlg5UI0FwMFBnpb3DTBhjDZMzhhmFUEBexrpsLn/GA9R+Ha+vhcss7vmB9
         m7KzDSwPbUqcnQph/h3yWoBcXFaiKmfhRJCD1DMS+BKcU8PREvyv6vxPghnq5ufVVKlg
         xlLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2e2a55eeb3fsi669682a91.27.2024.10.08.20.24.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:24:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdXy335Zz6K9F9;
	Wed,  9 Oct 2024 11:24:34 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 14727140A34;
	Wed,  9 Oct 2024 11:24:51 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:24:31 +0200
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
Subject: [PATCH RFC V4 16/33] hw/acpi: Make _MAT method optional
Date: Wed, 9 Oct 2024 04:17:58 +0100
Message-ID: <20241009031815.250096-17-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: bOQrDQLbDCqp

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The GICC interface on arm64 vCPUs is statically defined in the MADT, and
doesn't require a _MAT entry. Although the GICC is indicated as present
by the MADT entry, it can only be used from vCPU sysregs, which aren't
accessible until hot-add.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/cpu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 5cb60ca8bc..2d6afcfff7 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -671,10 +671,13 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
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
