Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp995503ejc;
        Tue, 26 Sep 2023 03:38:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6Q0dgiDz1i7g1lbYvDS55VrGNya68NijhTDYpWy7NmStrqBJqOy+Tm/kd5eKl85QbRBW2
X-Received: by 2002:adf:dec7:0:b0:319:8bd0:d18c with SMTP id i7-20020adfdec7000000b003198bd0d18cmr7441874wrn.52.1695724712813;
        Tue, 26 Sep 2023 03:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695724712; cv=none;
        d=google.com; s=arc-20160816;
        b=E5dkQIy7I3VVz+c4U+1cDJekJVWjlAw/BM25W2q+rZkg8Fm/Kqwo1PjaSpuQxY4/fv
         vbkEdKJ9+9oy/2sUwSLGeN5EKRCH5CHonavQbPEcB/w7ObyLUheoX8/bdHKfY5FWAUVw
         xugTWYR6zsZkwl8Tz+YcvD7b83NVx90mGdWRkyqslOcp3OqYp73rkQ5kqjOfJEh9/RYb
         CmlvGJQEN7YkQ7wt0pRlJ4vwC1rKqDLXBdpEAzHZTEn5oAyB5B8Pj+Oeb4zafJiMH7/Z
         0tSRV0bIue1/amKBgK7qgZRpWSwdbFTyJTdZeSysykwshO+955wHY6Rs2m1rG+53Gr6w
         rklg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=1qtELAS8ziLE2nssiISEzZoJFW8SYgla5bs0gLTEpJI=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=U/TldXC6yIhvN2awN7Rv1qu3U9wEcLJcRodxDwEwF6UoqF6TSQQ2whD6ut7YCCQaKl
         Vts58DzUpdZlqMmKkAsNH5VWuQx7DFj3mc0AniUcyGaUcMvrMyGquVsSeRG9yAacEid2
         FsS2ZWlxPMeDkc7fs6kSmYt46iVnqWJGtO5ELTl8goJ4AchUChW35FBzvp8lkp9+Vcbl
         r4wyIvLOvOfrA+23FLDyhL9XGZ/wHdLNkPX1IfgA5OmwkLRDL7llmWJEj6UZrohtviVe
         eMUqXR6bnJr95aJ1TGJGgCQKoz/3dGuxNSgsajViuQcJXZ92PlRCErVdmAu32wR/vjAh
         ipwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id g10-20020a5d698a000000b003231739897bsi3910556wru.505.2023.09.26.03.38.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:38:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rvx0s03xrz6J80t;
	Tue, 26 Sep 2023 18:33:32 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:38:12 +0100
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
Subject: [PATCH RFC V2 35/37] hw/arm: Support hotplug capability check using _OSC method
Date: Tue, 26 Sep 2023 11:36:52 +0100
Message-ID: <20230926103654.34424-4-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926103654.34424-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926103654.34424-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: wV1Bbgdu+O7T

Physical CPU hotplug results in (un)setting of ACPI _STA.Present bit. AARCH64
platforms do not support physical CPU hotplug. Virtual CPU hotplug support being
implemented toggles ACPI _STA.Enabled Bit to achieve hotplug functionality. This
is not same as physical CPU hotplug support.

In future, if ARM architecture supports physical CPU hotplug then the current
design of virtual CPU hotplug can be used unchanged. Hence, there is a need for
firmware/VMM/Qemu to support evaluation of platform wide capabilitiy related to
the *type* of CPU hotplug support present on the platform. OSPM might need this
during boot time to correctly initialize the CPUs and other related components
in the kernel.

NOTE: This implementation will be improved to add the support of *query* in the
subsequent versions. This is very minimal support to assist kernel.

ASL for the implemented _OSC method:

Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
{
    CreateDWordField (Arg3, Zero, CDW1)
    If ((Arg0 == ToUUID ("0811b06e-4a27-44f9-8d60-3cbbc22e7b48") /* Platform-wide Capabilities */))
    {
        CreateDWordField (Arg3, 0x04, CDW2)
        Local0 = CDW2 /* \_SB_._OSC.CDW2 */
        If ((Arg1 != One))
        {
            CDW1 |= 0x08
        }

        Local0 &= 0x00800000
        If ((CDW2 != Local0))
        {
            CDW1 |= 0x10
        }

        CDW2 = Local0
    }
    Else
    {
        CDW1 |= 0x04
    }

    Return (Arg3)
}

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt-acpi-build.c | 52 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index cbccd2ca2d..377450dd16 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -861,6 +861,55 @@ static void build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
     build_fadt(table_data, linker, &fadt, vms->oem_id, vms->oem_table_id);
 }
 
+static void build_virt_osc_method(Aml *scope, VirtMachineState *vms)
+{
+    Aml *if_uuid, *else_uuid, *if_rev, *if_caps_masked, *method;
+    Aml *a_cdw1 = aml_name("CDW1");
+    Aml *a_cdw2 = aml_local(0);
+
+    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
+    aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
+
+    /* match UUID */
+    if_uuid = aml_if(aml_equal(
+        aml_arg(0), aml_touuid("0811B06E-4A27-44F9-8D60-3CBBC22E7B48")));
+
+    aml_append(if_uuid, aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
+    aml_append(if_uuid, aml_store(aml_name("CDW2"), a_cdw2));
+
+    /* check unknown revision in arg(1) */
+    if_rev = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
+    /* set revision error bits,  DWORD1 Bit[3] */
+    aml_append(if_rev, aml_or(a_cdw1, aml_int(0x08), a_cdw1));
+    aml_append(if_uuid, if_rev);
+
+    /*
+     * check support for vCPU hotplug type(=enabled) platform-wide capability
+     * in DWORD2 as sepcified in the below ACPI Specification ECR,
+     *  # https://bugzilla.tianocore.org/show_bug.cgi?id=4481
+     */
+    if (vms->acpi_dev) {
+        aml_append(if_uuid, aml_and(a_cdw2, aml_int(0x800000), a_cdw2));
+        /* check if OSPM specified hotplug capability bits were masked */
+        if_caps_masked = aml_if(aml_lnot(aml_equal(aml_name("CDW2"), a_cdw2)));
+        aml_append(if_caps_masked, aml_or(a_cdw1, aml_int(0x10), a_cdw1));
+        aml_append(if_uuid, if_caps_masked);
+    }
+    aml_append(if_uuid, aml_store(a_cdw2, aml_name("CDW2")));
+
+    aml_append(method, if_uuid);
+    else_uuid = aml_else();
+
+    /* set unrecognized UUID error bits, DWORD1 Bit[2] */
+    aml_append(else_uuid, aml_or(a_cdw1, aml_int(4), a_cdw1));
+    aml_append(method, else_uuid);
+
+    aml_append(method, aml_return(aml_arg(3)));
+    aml_append(scope, method);
+
+    return;
+}
+
 /* DSDT */
 static void
 build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
@@ -894,6 +943,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     } else {
         acpi_dsdt_add_cpus(scope, vms);
     }
+
+    build_virt_osc_method(scope, vms);
+
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     if (vmc->acpi_expose_flash) {
-- 
2.34.1
