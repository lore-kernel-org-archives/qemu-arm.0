Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp30396lfb;
        Thu, 2 Sep 2021 01:17:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7fq/PEWWgSU6flQcX0L+gIxjo3XA7t3rGvHRqyyU3qhuiIlgQmqEWC328rstjEBoyU+JQ
X-Received: by 2002:a02:ab87:: with SMTP id t7mr1810745jan.127.1630570624573;
        Thu, 02 Sep 2021 01:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630570624; cv=none;
        d=google.com; s=arc-20160816;
        b=f+q1S5wOr/vILbr4o4g4lOf71m28BVET7WKBmE8ayY+t4dy1Qy5Grcqajhl32Suxrv
         z5lyDQH/5zVaxmmzU+mEXH+cOSwgcgvBa8GZjbW9aL9AZbRVDHft1UyPfkgdiND+lI85
         xmQ5anHY6KkxcpGYZIhvhGH32sOXN4+g7p1FRdzvuOKpUc/g6IitB1w9Nz9UDncyKyA9
         t66yyBNCIKWo54I0WMkhmZRzQ+FPIsid2Mj4lTG7428foieMX6r3l8WSHW2HCsOtm8t2
         VbH6unKoiS2tPMYTOzjCIbb7AAglb9G2CwESEe3JtCSdyTCl/xTOW8fFh7EzeyPpF2/c
         F9mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/Uyc5PzT8EKt6zmEc25VFAwVDkD1qIMpvvkUsu5fmg4=;
        b=RY/7VR3b54kvMrS5wCvQB1/tL1FhQ7Bc8/2CJ59V7XYkBbjFkkrZmyLhtA6q585+wX
         OSjNVwe7GavrWVpYR42PQmJbEjZAaQF/2rvWBm+k7XtTLnVTsmWcUyluwkNVjmH26F0Y
         cMcq7CG+OK/xm8JHa+xRk/vdfCCNCuxkWOXiY0dBIDSJXMJpCiS7PkrgjYtrUXFYX5Sd
         3SEFOWebt4THPwAyhCPHeuqqwIFqi3WRnhTK/U9miKBS9QvLloCjomdX90e6tTQBc4h4
         fTmohi84ZTJIczgUeTN+mXD0w4UixzP3Wbofm5bdZLVBAEZtOiNrjb8ncggqD9GLTvjW
         RE5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=HLEzstvF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si1253299ioz.59.2021.09.02.01.17.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 01:17:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=HLEzstvF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1]:39944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLhuB-0003xM-Ub
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 04:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chunming_li1234@163.com>)
 id 1mLhsN-0001n6-JF; Thu, 02 Sep 2021 04:15:12 -0400
Received: from m12-16.163.com ([220.181.12.16]:52841)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chunming_li1234@163.com>)
 id 1mLhsJ-0002jk-1E; Thu, 02 Sep 2021 04:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=/Uyc5
 PzT8EKt6zmEc25VFAwVDkD1qIMpvvkUsu5fmg4=; b=HLEzstvFiv9lZvR+tM2BU
 Ax6pxpx0Xqc7IRSBymPbl9g6rvvMjZtzBW5gRxgft/s7PJ/2EFpRZZF8a3CE+eH2
 t0w41iKZ83e4zw4fCf2m0/Gkq1W1ZnQSkqmNBy7Tvge5Kgd8+OQ6MsJp4F6ODMQV
 Nxq4jQO46lqBMzMr5IYqD8=
Received: from lcm-VirtualBox.verisilicon.com (unknown [182.148.13.201])
 by smtp12 (Coremail) with SMTP id EMCowABXMRDmhzBhan7BAQ--.86S7;
 Thu, 02 Sep 2021 16:14:45 +0800 (CST)
From: chunming <chunming_li1234@163.com>
To: eric.auger@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v6 3/4] hw/arm/virt: Update SMMU v3 creation to support non
 PCI/PCIe device connection
Date: Thu,  2 Sep 2021 16:14:28 +0800
Message-Id: <20210902081429.140293-4-chunming_li1234@163.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210902081429.140293-1-chunming_li1234@163.com>
References: <20210902081429.140293-1-chunming_li1234@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowABXMRDmhzBhan7BAQ--.86S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyDCr1fWr4rKF4kKw1kuFg_yoW8Cw1xpF
 s5tFykGryY93W3Z392vF13u3WrGws2gw1UKr4xWrZ3Aw1Ut34UWr1kKa1YkFWUuF1kCF43
 ZFn2gF47Wr17XrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bsVbkUUUUU=
X-Originating-IP: [182.148.13.201]
X-CM-SenderInfo: xfkx0zplqjszjlrsjki6rwjhhfrp/1tbivxUCdlWBveQstQABsL
Received-SPF: pass client-ip=220.181.12.16;
 envelope-from=chunming_li1234@163.com; helo=m12-16.163.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: renwei.liu@verisilicon.com, qemu-arm@nongnu.org,
 jianxian.wen@verisilicon.com, qemu-devel@nongnu.org,
 chunming <chunming.li@verisilicon.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9R9zaDYIjDkD

From: chunming <chunming.li@verisilicon.com>

  . Add "smmuv3_sidmap" to set non PCI/PCIe devices SID value
  . Pass non PCI/PCIe devices SID value to SMMU v3 model creation

Signed-off-by: chunming <chunming.li@verisilicon.com>
---
 hw/arm/virt.c         | 14 ++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 81eda46b0..9373d20e9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -204,6 +204,9 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("max"),
 };
 
+static const uint16_t smmuv3_peri_sidmap[] = {
+};
+
 static bool cpu_type_valid(const char *cpu)
 {
     int i;
@@ -1244,6 +1247,15 @@ static void create_smmu(const VirtMachineState *vms,
 
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
+
+    qdev_prop_set_uint32(dev, "len-peri-sid-map",
+                         ARRAY_SIZE(smmuv3_peri_sidmap));
+
+    for (i = 0; i < ARRAY_SIZE(smmuv3_peri_sidmap); i++) {
+        g_autofree char *propname = g_strdup_printf("peri-sid-map[%d]", i);
+        qdev_prop_set_uint16(dev, propname, smmuv3_peri_sidmap[i]);
+    }
+
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     for (i = 0; i < NUM_SMMU_IRQS; i++) {
@@ -2762,6 +2774,8 @@ static void virt_instance_init(Object *obj)
 
     vms->irqmap = a15irqmap;
 
+    vms->peri_sidmap = smmuv3_peri_sidmap;
+
     virt_flash_create(vms);
 
     vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9661c4669..fb00118b3 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -167,6 +167,7 @@ struct VirtMachineState {
     PCIBus *bus;
     char *oem_id;
     char *oem_table_id;
+    const uint16_t *peri_sidmap;
 };
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
-- 
2.30.2


