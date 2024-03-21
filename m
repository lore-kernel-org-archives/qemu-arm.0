Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp490129ejv;
        Thu, 21 Mar 2024 06:12:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJHzyaOqNMkPT96ZFppYl9kkHaVimpNbcbJ8Mx76KO3JVFAUHeIHp8cBaC4NXHiB1z4+tT6neY4DF8Dr3ypTzSK6HdD2Yd
X-Google-Smtp-Source: AGHT+IEIXJppA6DsvEXw5DfLzuNFH8pLY/gViBLM34NHVMg755DgjbPtbMf0zBEXyhGKPLaV/M2k
X-Received: by 2002:a0c:dd91:0:b0:691:8382:67a0 with SMTP id v17-20020a0cdd91000000b00691838267a0mr9073352qvk.50.1711026731574;
        Thu, 21 Mar 2024 06:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711026731; cv=none;
        d=google.com; s=arc-20160816;
        b=gt5Nxz4fZf8gQAEpDeOGLxOggSuTFsSyyEPUegRvyEwWkZHnzjCZLdQIku5cJmZK53
         pqCfenuWzmrbymYWCESHR6CVd4Rq+9ADJ9TofsbQ7Sw/cuWBHcZSkE/B20XYQDEliUKs
         de6EMXN0TDbHawsaBB251dUM9ZKrJWhWa0agU1aXgBdnEOkli3NrCUFyNjtMXJYao/Zq
         D6sTf/c/Ay6YF5AUTwYWqwzJSo7BenuO0LZ61M9Wabwv0Z+PKz6waT35Va34HAgmIjEM
         /dIPlnW5k6fEdPakw0ZIwaYW/gkOW9GjgFlAYMpsgdyA2JdSMm/5zaG+IPNic0ul9lOP
         Eg0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Saap2FMxIpOPUBX0IH9pOgg3BzQsYcr4zuOaSuZrYTM=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=jRz33ygES2Cb5ia/wUdwgvGEq8eXjxXLMNcYbnUFbVQJkkd15CPThif4F/Nh8VgXFM
         trGxy/olTmUs7TALwxk1XhHfiI08nIswKBTQiA928DLl/KJxCfG/3vvGeCFGoBT7sTP8
         nb3xTB/mbFeFXVH9g6qkFGFjQCtSiKhG7PnXYzk/7hUc1P0ANzuvPEsh3ku07TGctuXV
         zEhs1u4f1IXgPivoXganRgQdplxrEU7fDicqMdb2Ek2ZS7+KuG+tX8z3iQGgbNqSJ4/L
         njIGUgDRV8NOMIGFUkpIM9kOQQpPciQ48FuT6Dqj5n52MFuTcx0vDf9/aM36u/jMD5sz
         4gKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020ad45ba5000000b0069614edd5a4si9013157qvq.535.2024.03.21.06.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 06:12:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rnIB8-0007MW-P5; Thu, 21 Mar 2024 09:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIB4-0007KT-VV; Thu, 21 Mar 2024 09:09:50 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIB3-0002vM-6C; Thu, 21 Mar 2024 09:09:50 -0400
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V0m2R00Bwz1h3MS;
 Thu, 21 Mar 2024 21:07:10 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 30CC31A016C;
 Thu, 21 Mar 2024 21:09:45 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 21 Mar
 2024 21:09:44 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v9 23/23] hw/arm/virt: Add FEAT_GICv3_NMI feature support
 in virt GIC
Date: Thu, 21 Mar 2024 13:08:12 +0000
Message-ID: <20240321130812.2983113-24-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321130812.2983113-1-ruanjinjie@huawei.com>
References: <20240321130812.2983113-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZJbbvDtZlK2S

A PE that implements FEAT_NMI and FEAT_GICv3 also implements
FEAT_GICv3_NMI. A PE that does not implement FEAT_NMI, does not implement
FEAT_GICv3_NMI

So included support FEAT_GICv3_NMI feature as part of virt platform
GIC initialization if FEAT_NMI and FEAT_GICv3 supported.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v4:
- Add Reviewed-by.
v3:
- Adjust to be the last after add FEAT_NMI to max.
- Check whether support FEAT_NMI and FEAT_GICv3 for FEAT_GICv3_NMI.
---
 hw/arm/virt.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ef2e6c2c4d..63d9f5b553 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -729,6 +729,19 @@ static void create_v2m(VirtMachineState *vms)
     vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
 }
 
+/*
+ * A PE that implements FEAT_NMI and FEAT_GICv3 also implements
+ * FEAT_GICv3_NMI. A PE that does not implement FEAT_NMI, does not implement
+ * FEAT_GICv3_NMI.
+ */
+static bool gicv3_nmi_present(VirtMachineState *vms)
+{
+    ARMCPU *cpu = ARM_CPU(qemu_get_cpu(0));
+
+    return cpu_isar_feature(aa64_nmi, cpu) &&
+           (vms->gic_version != VIRT_GIC_VERSION_2);
+}
+
 static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
@@ -802,6 +815,11 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                               vms->virt);
         }
     }
+
+    if (gicv3_nmi_present(vms)) {
+        qdev_prop_set_bit(vms->gic, "has-nmi", true);
+    }
+
     gicbusdev = SYS_BUS_DEVICE(vms->gic);
     sysbus_realize_and_unref(gicbusdev, &error_fatal);
     sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
-- 
2.34.1

