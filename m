Received: by 2002:a05:7022:c43:b0:7e:eb73:5b3b with SMTP id ej3csp1476443dlb;
        Thu, 13 Jun 2024 17:19:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZVocE7ykz1e3F486sPub6Li8wzknlgKaFNnA77UK2bOROchMtZljIyzXqBfsEmMdLW7QFgtF7ElBSrKQHWRQKgNG8rRhU
X-Google-Smtp-Source: AGHT+IG7C/m9vPTi71ixflBzHfnZCfBJrNIexmgSWAEqOpyPFxu/5EcQB0vWgcwS5CKx0h/sFAqg
X-Received: by 2002:a05:600c:470f:b0:421:81c1:65fa with SMTP id 5b1f17b1804b1-423048240ddmr11554975e9.13.1718324354345;
        Thu, 13 Jun 2024 17:19:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718324354; cv=none;
        d=google.com; s=arc-20160816;
        b=FHp8bcP4d/dPptD1kBx+N85xAbjXxY5jeCz2/0/U2MFBkom55ZBoSXVi+tXVIz6+R+
         pl2pE7kyiQOPITUmWyMCwfFpa2U7FO7m8MO1HwsotlX+4tnNYb+8B850e+XwIV2RiXpe
         2dO9sfFc6QMUz1K/1GojmHK9Jegttx0cpfOrBqrMUDwBS9j7C77tgF5t1ljw/d8AeGjE
         Nu6gFkatRtd1WaygrxhsEXwMzQwbpD+vOynwJrHklYuK6JDbHxLvl68tfITy5xQV2qL3
         3Bt6UeLPUECIHuQ+sgXC15xK1zdijQcSfCw9vXXk4aKA9Hxe59zTwAYPIKK5tnO+VU34
         BO3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=9ARSYZlsndBJtILYXEQq2NxjhAZAZEzpRksPPu5RnrU=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=aC6sZV81ZbMud9zaDNYjEMHtutFg35w606lAdLhOU66AfPG1Ei55F17BNHpWLWmuT9
         dobvQYKqdj7XGFL+MX5a1u2MTDf46BoXTugCiLT+WJQsGcwoLHRbt6RJYo1+gWKJBwwe
         D1dh2P4oTMUX74zRFPGWiYAe5nJLSyrN3zynd9iGKd8mM30LjNc74T/f6NSpz+6J0UAy
         N4W5s6WDHpEWRNMnwfY9xx9qjm3cz07Z0qRG5Jq/fR04s6BI5HOO+B2u/eFe0tFXz3HH
         Qu84VVFg0mgxYdItu0SU640iyodbLf53o5mrHi08irLc9lI4m7g+5IkNp0vVYmLu5yCA
         0AmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3607511da78si1436280f8f.477.2024.06.13.17.19.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 17:19:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0fxT4hWVz67MmR;
	Fri, 14 Jun 2024 08:17:49 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 2807714065C;
	Fri, 14 Jun 2024 08:19:13 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 01:18:50 +0100
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
Subject: [PATCH RFC V3 27/29] hw/arm: Support hotplug capability check using _OSC method
Date: Fri, 14 Jun 2024 01:18:36 +0100
Message-ID: <20240614001836.203018-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: YXs7ltdJs45p

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
index 4b4906f407..6cb613103f 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -818,6 +818,55 @@ static void build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
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
@@ -852,6 +901,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
