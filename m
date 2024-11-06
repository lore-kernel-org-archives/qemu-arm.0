Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3494019njc;
        Wed, 6 Nov 2024 05:04:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXcjb86IunM4AAmFSmD/bPrVxfZhF2Sw7R6hNOZcXFLHlq6rDg3H8ueUnIkY4Ex5Sf7nuxLbf4MHZXHPA==@linaro.org
X-Google-Smtp-Source: AGHT+IEu8zy5LBitNMuA2IPwXgNa4s1dZXrgI587GDvOE8HHdGq1puQewRsYZPMrfBfp1rtH5n5v
X-Received: by 2002:adf:b345:0:b0:37d:2d27:cd93 with SMTP id ffacd0b85a97d-380612008dbmr29864850f8f.43.1730898281690;
        Wed, 06 Nov 2024 05:04:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730898281; cv=none;
        d=google.com; s=arc-20240605;
        b=NTXTcxg7fxWf9GUQSc2JacBLaN8oSx5dzvnSOwVLHJlRTduZyMNvsUWm9qjl2M4NPN
         gKWxJzNjd26OiqijNg66v0povvWy05C4/OoU+Fy0/Fdaw1WpjENqAzOz2X48K92dS4Sj
         W8uUaM0JK1zmla9Ornzurub7vTePRIWgqzy3p8CCdqqfRIza68zCqkqRR1VdOAEVqAc3
         eGdnjFhdW5OGG0WEoJCl5kmngxbOGpspIkoepzPivLXkoKPpQiqQY1FMpIR29Gl+tq9b
         PZjsLq+qDjrwoIobuAsW5Zrxe4GGd01HBr9iFz4GhrSRV4bZD5Xh/d7t72KIh1fqYGGd
         CwtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=oox37Pap3DvVsC2IF2ympzKVwFSmZIcsqeGGf/9CSYY=;
        fh=r8ajd3FUMdtDxzqs0wLEINYA6psD113amket9C+CNXU=;
        b=cIsRwujUgv979xTSMhwKXOe7I3KzqyI6CUGmZ9Vha5fm7RXymq/O0Gd2J1rQKBjhBw
         ZPOOR3SorFkwBxW9ppztBMcHG9VARTG3R3C4FlRb6ShjgeFNxraEJapQAccyAISzhUA4
         VJ329upq27IENeNts1NqoomvqFsdp5HcgbK34J1ECEwpnxM41nfsPi8X9GvbeDTlVzQa
         ghUz353YdFS4c6tVl/PFcV3aUizSZPHko2DsGSG3cfBvbdZgu1Y1lm7o8HhSackjJjpd
         UnVg38IdVgvUFcYEzxYjl+B75rRu5AsDD2ya/Sr5TU1p0dBTuGS0KIq9JNHGFC/Ug+GK
         INoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-381c11ad3d2si9362900f8f.734.2024.11.06.05.04.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Nov 2024 05:04:41 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xk5293Kzxz6K7Hj;
	Wed,  6 Nov 2024 21:01:53 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id B738D14011D;
	Wed,  6 Nov 2024 21:04:40 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.170.112) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 14:04:26 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>,
	<imammedo@redhat.com>
CC: <salil.mehta@huawei.com>, <jonathan.cameron@huawei.com>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<anisinha@redhat.com>, <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>,
	<david@redhat.com>, <philmd@linaro.org>, <peterx@redhat.com>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>, <zhao1.liu@intel.com>,
	<linuxarm@huawei.com>, <gustavo.romero@linaro.org>
Subject: [PATCH 2/3] Fix: Reverse CPUs presence check logic for x86 backward compatability
Date: Wed, 6 Nov 2024 13:03:30 +0000
Message-ID: <20241106130331.205020-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106130331.205020-1-salil.mehta@huawei.com>
References: <20241106130331.205020-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.170.112]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: Cin1hKus4thR

Checking `is_present` first can break x86 migration from new Qemu
version to old Qemu. This is because CPRS Bit is not defined in the
older Qemu register block and will always be 0 resulting in check always
failing. Reversing the logic to first check `is_enabled` can alleviate
below problem:

-                If ((\_SB.PCI0.PRES.CPEN == One))
-                {
-                    Local0 = 0x0F
+                If ((\_SB.PCI0.PRES.CPRS == One))
+                {
+                    If ((\_SB.PCI0.PRES.CPEN == One))
+                    {
+                        Local0 = 0x0F
+                    }
+                    Else
+                    {
+                        Local0 = 0x0D
+                    }
                 }

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20241106100047.18901c9d@imammedo.users.ipa.redhat.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/cpu.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 23443f09a5..b2f7a2b27e 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -490,22 +490,22 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
             aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
             aml_append(method, aml_store(idx, cpu_selector));
             aml_append(method, aml_store(zero, sta));
-            ifctx = aml_if(aml_equal(is_present, one));
+            ifctx = aml_if(aml_equal(is_enabled, one));
             {
-                ifctx2 = aml_if(aml_equal(is_enabled, one));
-                {
-                    /* cpu is present and enabled */
-                    aml_append(ifctx2, aml_store(aml_int(0xF), sta));
-                }
-                aml_append(ifctx, ifctx2);
-                else_ctx = aml_else();
+                /* cpu is present and enabled */
+                aml_append(ifctx, aml_store(aml_int(0xF), sta));
+            }
+            aml_append(method, ifctx);
+            else_ctx = aml_else();
+            {
+                ifctx2 = aml_if(aml_equal(is_present, one));
                 {
                     /* cpu is present but disabled */
-                    aml_append(else_ctx, aml_store(aml_int(0xD), sta));
+                    aml_append(ifctx2, aml_store(aml_int(0xD), sta));
                 }
-                aml_append(ifctx, else_ctx);
+                aml_append(else_ctx, ifctx2);
             }
-            aml_append(method, ifctx);
+            aml_append(method, else_ctx);
             aml_append(method, aml_release(ctrl_lock));
             aml_append(method, aml_return(sta));
         }
-- 
2.34.1
