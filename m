Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp6379502lfa;
        Thu, 22 Oct 2020 01:34:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFJnx7qiQLLVbtz1spl4wodzkhsOXe3Es893NjVfoKuXXcyud0osFtyLNX1PKcWYmOwibb
X-Received: by 2002:a25:d284:: with SMTP id j126mr1680977ybg.220.1603355688007;
        Thu, 22 Oct 2020 01:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603355688; cv=none;
        d=google.com; s=arc-20160816;
        b=1ErpNJGPxyDcbTrqDZHdVWrlPZarMBO/67793fB8sjdIISuUALcvyUWobtA6h/UECR
         vtvT2gHTNt8q0efNzRKNX5irW6l+nc+cKPsmwa78b50knGa80gv4nqVJlkOTrIds3ITE
         8pNpl5FXdRIvbH4RpdCE8jx1I5TpznHIFX7jr+VpnYjQU1uoR6Xg9miXUfPX+WAP6NTW
         SsKylaC8fjufjQTrQQ8Fq1vyaLHK3ln7OgGrpCeZgOkkGTWO6ceIHoKqeYkZ3a1E6SYB
         AHB7CdYAxzNk2Y4DBBzrXCuz1Ygpmogrkq8G7DKH5Xt/pvXbikm96oeRmg98hhuBl6Ne
         8bpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=KSW4vd9JXP6+2XOuGpp+0xEta4oQs7CUNpzyXUTRHZw=;
        b=n5dgzeMoyPBxJV4zHntokixjIuV7LId5sqmj/4251NGSTTsLhI2x/UylSub3tEeoKU
         b0MceXCUZ71jqkh62Ij/5ik3covfZgKPCIfAwnjCmRf+xC2/+WPqQrjik2rTkNVJ5F5t
         WIUOmdL2qfcxpj7NdaLC789LxVfJ84Xbg5ztd1qqIE+4EqbF29fQ4zNll7z585tZOhV9
         fPQZ/8DHC8q2/TPChstA/7AjrCzqsGVmp4ZKZZdBvl6dcczDNBhKrrROI8MXQmEW8R4e
         acXo+C6zFbcwMCSDZj4BscmOHUeRYgWfn6GrM2IBD10DTz0+Rrxn8u9GKrJwjh73uwPK
         okeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@oracle.com header.s=corp-2020-01-29 header.b=TjrKZ6Mu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3si611137ybq.456.2020.10.22.01.34.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 01:34:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@oracle.com header.s=corp-2020-01-29 header.b=TjrKZ6Mu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:46194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVW3b-0004H8-EQ
	for alex.bennee@linaro.org; Thu, 22 Oct 2020 04:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1kVVui-0004SF-2c; Thu, 22 Oct 2020 04:25:36 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:34230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1kVVug-0006Bw-62; Thu, 22 Oct 2020 04:25:35 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09M8PVeG114849;
 Thu, 22 Oct 2020 08:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=KSW4vd9JXP6+2XOuGpp+0xEta4oQs7CUNpzyXUTRHZw=;
 b=TjrKZ6MuYhsCmDFjv1NIIOnzKGlghDCOpBDg49CEXILnfZATEqpQuyyBQy3F+H6KupUV
 Gep+qBBVCuHFvmvq3j6UNNiG6fspsVs35NOWKzvExvGCUbZQbtkwmGms0C3soW1m6ti0
 yDv8fWjmlKRuwhgLZi7A6R7Et2T7f1gRK1rjJZaOqKjR8YlruYgnAMka6xiidkFD8t5z
 JbU7KsxvcuS0gHjsWcFaVePzApZcYwhFN507q6gHDPUncjSeIaZzPWCisNXX3KJ9wZjS
 jHTBqoW0p406yDCziya90dDewLkZXvaxd6NwUs3wuD5xXxk0SvbG2YcTExt8DwyB5CYU 3g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 347p4b4nwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 22 Oct 2020 08:25:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09M8Fxb6024118;
 Thu, 22 Oct 2020 08:25:30 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 34ak19kdwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Oct 2020 08:25:30 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09M8PTb8013989;
 Thu, 22 Oct 2020 08:25:29 GMT
Received: from mihai.localdomain (/10.153.73.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 22 Oct 2020 01:25:29 -0700
From: Mihai Carabas <mihai.carabas@oracle.com>
To: peter.maydell@linaro.org, shannon.zhaosl@gmail.com, mst@redhat.com,
 imammedo@redhat.com
Subject: [PATCH 5/8] hw/arm/virt: add pvpanic device in virt acpi table
Date: Thu, 22 Oct 2020 10:42:53 +0300
Message-Id: <1603352576-21671-6-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1603352576-21671-1-git-send-email-mihai.carabas@oracle.com>
References: <1603352576-21671-1-git-send-email-mihai.carabas@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010220055
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010220056
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2130.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 04:25:28
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mihai Carabas <mihai.carabas@oracle.com>, Peng Hao <peng.hao2@zte.com.cn>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uCVv7niDFFqD

From: Peng Hao <peng.hao2@zte.com.cn>

Add pvpanic device in virt acpi table, so when kernel command line
uses acpi=force, kernel can get info from acpi table.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
---
 hw/arm/virt-acpi-build.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9747a64..f64bf89 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -87,6 +87,20 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
     aml_append(scope, dev);
 }
 
+static void acpi_dsdt_add_pvpanic(Aml *scope, const MemMapEntry *pvpanic_memmap)
+{
+    Aml *dev = aml_device("PEVT");
+    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0001")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+
+    Aml *crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(pvpanic_memmap->base,
+               pvpanic_memmap->size, AML_READ_WRITE));
+
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
 static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
 {
     Aml *dev = aml_device("FWCF");
@@ -605,6 +619,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     if (vmc->acpi_expose_flash) {
         acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
     }
+    if (vms->pvpanic) {
+        acpi_dsdt_add_pvpanic(scope, &memmap[VIRT_PVPANIC]);
+    }
     acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
-- 
1.8.3.1

