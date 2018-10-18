Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2391152wrt;
        Thu, 18 Oct 2018 07:43:24 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63kPYvAXfwS5I1hV7fLVAs/+mhwmdFekmywXBkbIkq5G5pj/HxQ+zXcwvRFe1gHsNEqz6KU
X-Received: by 2002:aed:2791:: with SMTP id a17-v6mr28918418qtd.303.1539873804816;
        Thu, 18 Oct 2018 07:43:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539873804; cv=none;
        d=google.com; s=arc-20160816;
        b=WwNxEcEPyx+d7ckTItb+FDh5oTFzzdqKun0tCZwHdNgSB1PO4mPj8sDJDu2gyo8IqK
         ag5MqwGoUxCaiKL+M97mDalGsE14EDRzLKSFvxgFUqHvbNolSi5wyDTqiMgcTrw9BlJK
         vYKODz4JzXC8tggrbTPMzVz4t3RJTMCaFP5raw0cYrUNTv2c+f0fQoXf9Vp45FeF9CQo
         wSvi77jjwWHn84QMZSAXWZ6XiZ8qQVnb5FQwIgYxoteVi75cbV853Y0YMAwzyWpUmLlY
         rmiN+0blrfzzXk6zF7HOEqQkfvYJbD2cPw5zAzFtIvU4xwzIb2xgMnfdLx78Ocaz5uDg
         HPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=FGW4797BOW3bBWuqz44PqBzIhumtT03TrPnE7mZ2dKE=;
        b=N/W548oDcoSb0OcSSrenxit7dFHc1eDeZ+WmkqcoCoY85ksqVAT00T6g7apsB33LHT
         UdLDMmo+zHLOjpXY/5E4LP2Ju9B9WWedRsv8nEZclCtx0FAO/w8Cs7fNH+TSFusN/Byy
         WyVPvmWz+n5q3WpFvScVIV8DH2BGusRbZ2Slebt4BIcPm7PLJpOPVBjpHSViHGlKV5Nf
         65MkyRXpSI6a9Q1+4wtPNHSIilNfOAhe62B09Gg5HdFOXI/zledrsP2htxFXsO58NBqt
         THAqqPSWFx8RGNDsAPsP03X00RyEn9E4HdN94OctvfkyuC5qVdh0KDljUjcBRlXikQrn
         IpNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q6si2906394qvo.96.2018.10.18.07.43.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 07:43:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42748 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD9WG-0007oB-A1
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 10:43:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9LI-0006Bg-LG
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:32:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9LH-0007bx-Gn
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:32:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56788)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gD9LH-0007aP-7c; Thu, 18 Oct 2018 10:32:03 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E40830F8BF0;
	Thu, 18 Oct 2018 14:32:02 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A55FD7899E;
	Thu, 18 Oct 2018 14:31:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Thu, 18 Oct 2018 16:30:38 +0200
Message-Id: <20181018143042.29588-13-eric.auger@redhat.com>
In-Reply-To: <20181018143042.29588-1-eric.auger@redhat.com>
References: <20181018143042.29588-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 18 Oct 2018 14:32:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 12/16] hw/arm/virt-acpi-build: Add PC-DIMM in
 SRAT
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, dgilbert@redhat.com, Suzuki.Poulose@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3KWu6lg+jtVZ

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Generate Memory Affinity Structures for PC-DIMM ranges.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v3 -> v4:
- do not use vms->bootinfo.device_memory_start/device_memory_size anymore

v1 -> v2:
- build_srat_hotpluggable_memory movedc to aml-build
---
 hw/arm/virt-acpi-build.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 5785fb697c..8818bbf5ec 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -545,6 +545,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     int i, srat_start;
     uint64_t mem_base;
     MachineClass *mc = MACHINE_GET_CLASS(vms);
+    MachineState *ms = MACHINE(vms);
     const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
 
     srat_start = table_data->len;
@@ -570,6 +571,9 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         }
     }
 
+    build_srat_hotpluggable_memory(table_data, ms->device_memory->base,
+                                   ms->device_memory->mr.size, 0);
+
     build_header(linker, table_data, (void *)(table_data->data + srat_start),
                  "SRAT", table_data->len - srat_start, 3, NULL, NULL);
 }
-- 
2.17.1

