Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp983405ejc;
        Tue, 26 Sep 2023 03:12:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv8alYPHsmzy/e6kUnz5gDmpexSSD4S1g9jQV/z5CW13Z6IOYg9dqMqOVblvXUKuDoYECT
X-Received: by 2002:a5d:4092:0:b0:31a:b3aa:d19b with SMTP id o18-20020a5d4092000000b0031ab3aad19bmr6918155wrp.23.1695723136554;
        Tue, 26 Sep 2023 03:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695723136; cv=none;
        d=google.com; s=arc-20160816;
        b=RPzSJrKk5km3xoR+HUeg7blhI6AV3Z7g7kxldePxKcWuQgEnOw64+sCGp1GiRRJgnm
         T7BgaVtntmpcw2e5wbeqpNbycpXFcrA2M3cxg1HgXefzQtVNEAkE7mUwuQQ/aAeFPJoZ
         9tImke3rwZgvbKVpM0jUVSkHUx/Ev6es9miFGJAJWIt+de8qWKjowjJupzJuoinryiwV
         4k9k55nrn6TcFK4Pf8ze7+3vllJYjeavtc8DNwJqyjD0mVUyxsDFmjh4ir1OwsZuN2IV
         Ppidu+AsTMP4nu3F6JQuNW6W3EaYd4vUURNoBAhoOP6Q5Q2uV6bmcSsHddpTEoemrYZi
         FngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=0UFDjTp96WyIGI6pgHFyDLanGZXfs4B6kudYtnbY3l4=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=Fgj2PhaoVzksXLU460TKVuz1DzTUMypH61L12REkzVmC/a2ZrDytIIUCJeOh+CxrGf
         H6GDhtvVLq98gCJktDyZQidvgoKe/Kk8Fp8Kiz0InrQn0dnw1PfzqS31FDaOaiggAOTF
         4vvLpK7YoKtxb1ot3wBQC2Wwq0WkUkEiL4iCPaWbUyTyZukHI4dExTlbha2jJC1AcpBi
         uUmV655N9rvz4fpkzklHoLQP5IF1GEk4+5hTO8dj3NnJvz7lEFJ0m+G4BJyGXe5bXMb+
         oHX7gXAC2/nxkbBSRpB3uL0N/21nUaoA8D6drJdij2psCComzlC1ZIOgNFoGkuFdLeN0
         UnNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id a8-20020a5d4568000000b0031ff8057ecfsi5904823wrc.629.2023.09.26.03.12.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:12:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwVs4r5Nz6K717;
	Tue, 26 Sep 2023 18:11:01 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:11:57 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 22/37] hw/acpi: Make _MAT method optional
Date: Tue, 26 Sep 2023 11:04:21 +0100
Message-ID: <20230926100436.28284-23-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: bExf+Z7BJW56

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The GICC interface on arm64 vCPUs is statically defined in the MADT, and
doesn't require a _MAT entry. Although the GICC is indicated as present
by the MADT entry, it can only be used from vCPU sysregs, which aren't
accessible until hot-add.

Co-developed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Co-developed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/cpu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index e1299696d3..217db99538 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -715,11 +715,13 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
             aml_append(dev, method);
 
             /* build _MAT object */
-            assert(adevc && adevc->madt_cpu);
-            adevc->madt_cpu(i, arch_ids, madt_buf,
-                            true); /* set enabled flag */
-            aml_append(dev, aml_name_decl("_MAT",
-                aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)));
+            if (adevc && adevc->madt_cpu) {
+                assert(adevc && adevc->madt_cpu);
+                adevc->madt_cpu(i, arch_ids, madt_buf,
+                                true); /* set enabled flag */
+                aml_append(dev, aml_name_decl("_MAT",
+                    aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)));
+            }
             g_array_free(madt_buf, true);
 
             if (CPU(arch_ids->cpus[i].cpu) != first_cpu) {
-- 
2.34.1
