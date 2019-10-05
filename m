Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2087735wrm;
        Sat, 5 Oct 2019 15:05:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz86HuZhjoWDDcgXjQfZO7pAAHp6bLQ6wOb66xfMuMRPG4+L/DzBPBd5sTgN2wNdpXILsm/
X-Received: by 2002:a17:906:349a:: with SMTP id g26mr17333299ejb.77.1570313145304;
        Sat, 05 Oct 2019 15:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570313145; cv=none;
        d=google.com; s=arc-20160816;
        b=GNMwNgIglRby4FmcDaDwfZoEZS2mq53OZqsH1/BMidgnvrb2yN65Bk3RxwO2sWFSjo
         Cd4f8C8rvSp76eYQTQyT5oNaUrusYjKduB4E+BxT2pHRpZO0NFTgvNZ/XH2mXnPDNEpi
         9Laryy2yyGTjsfEuSQyCqB9qy6zYit+jUPEPaClh1zx8LCxK8/NVcw4H6VY/q0JX2XId
         zU3v3QWL+WXw3+iEbDruFxP90iG1iGp6TUfes4CT80mZferjp4d0ArCyAVqWrm9XUgMm
         V6AO3bx7Hagdu468+XcWGYs28qA7/ZAu6RI5LXdu3PmLz+0qcxiAmamVoW3fIKD1Yz/N
         Uj9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date;
        bh=uyRLkWZIbvOXn6SP4FJI/0STB7Pb+nYILJOnqJPI2nI=;
        b=sTFvF/Bq+TT78BVg8xOBKLWfp0Jesn3tlCEURkIzgLO7durVu2iMyxc3XpaoxNN9l0
         sXw1yVMK0+Z5FKfO2Fe1n4RjGsCXTJVBGrkmANx45u0L7GShje1X+VrwN7HEetgr9f8u
         QQJLU4JAdC9cRkv/NQ1+tnSfwjIAPlW+RE5hfTEPCZUeTr0LfdPcal06YGnTrAKoPK20
         pYNjBqnFoPCkXDteOYCwSayzv6ph5lAiDY7M02pZ+QVCpoPOZ6xyZhuQz6f43GPSOYfv
         OBQLTNRWV7W7MvemhdNyySft8sHZN3kwGJussLipddcLtGvuPEimDyMJljvckur8SlJV
         327w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a23si6945541edj.201.2019.10.05.15.05.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Oct 2019 15:05:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGsBL-0001Jc-Jn
	for alex.bennee@linaro.org; Sat, 05 Oct 2019 18:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47881)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iGs5C-000517-2Q
 for qemu-arm@nongnu.org; Sat, 05 Oct 2019 17:59:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iGs59-0004Jf-W5
 for qemu-arm@nongnu.org; Sat, 05 Oct 2019 17:59:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48728)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iGs59-0004IY-OD
 for qemu-arm@nongnu.org; Sat, 05 Oct 2019 17:59:19 -0400
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D7FE1C057F2C
 for <qemu-arm@nongnu.org>; Sat,  5 Oct 2019 21:59:17 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id o26so2535839qtj.17
 for <qemu-arm@nongnu.org>; Sat, 05 Oct 2019 14:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uyRLkWZIbvOXn6SP4FJI/0STB7Pb+nYILJOnqJPI2nI=;
 b=uDWtbcbNJvqsdXpUvTVc+sYcpz6Dc36OFonhINLV4zHt/A5R3NcRonc0EUlG/fdOXn
 sBljB/kmvdqU6nyVNLI2GmZkiNCa3iiHXVvw11I5sleGXQXPSOC8ftC4yfiVhMwh7ObD
 EfHeVNBFolJtpn69Jcv/15qjv4/7UKLXsy6PU1j/jT8Jl5u4Wjm3Vb1wQl6AtdLiFSGc
 iI8j4iCZT0o6FZdNruaKBSorrdWEu8BCKS8WAWnDQk16RE2pv1EX9vZHPAC03ljJCVxY
 hbNTVi5xrCoeyhYr17o/1OnjXuePUMwPTIqcp7h8YyYFg1fmJj2hxAF4k8c1x31gwz9t
 O0zQ==
X-Gm-Message-State: APjAAAVtYqCZoOrMpR2oRoMZ5P/Zha4Z1LnQ0d6dQ9ckp4BlTQ6WEOWU
 lXa2h1mqi0dfJa6vT4Mbq0FMSd09DFPq63FIXW4oJ2+n3TuOJT7KwP6FjZFMDnHh9vVX6H6hRx7
 otCam1aLMWj71
X-Received: by 2002:ac8:7117:: with SMTP id z23mr22587921qto.309.1570312757206; 
 Sat, 05 Oct 2019 14:59:17 -0700 (PDT)
X-Received: by 2002:ac8:7117:: with SMTP id z23mr22587876qto.309.1570312756059; 
 Sat, 05 Oct 2019 14:59:16 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
 by smtp.gmail.com with ESMTPSA id
 a36sm5289376qtk.21.2019.10.05.14.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2019 14:59:15 -0700 (PDT)
Date: Sat, 5 Oct 2019 17:59:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/19] hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
Message-ID: <20190918130633.4872-7-shameerali.kolothum.thodi@huawei.com>
References: <20191005215508.28754-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191005215508.28754-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nc6+5sILgfMR
Message-ID: <20191005215911.f4poLpAtDVAXFQOAqhYPSFvQw3l2u2qrPI0wGGBhTW0@z>

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Generate Memory Affinity Structures for PC-DIMM ranges.

Also, Linux and Windows need ACPI SRAT table to make memory hotplug
work properly, however currently QEMU doesn't create SRAT table if
numa options aren't present on CLI. Hence add support(>=4.2) to
create numa node automatically (auto_enable_numa_with_memhp) when
QEMU is started with memory hotplug enabled but without '-numa'
options on CLI.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20190918130633.4872-7-shameerali.kolothum.thodi@huawei.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 8 ++++++++
 hw/arm/virt.c            | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index cadeea0f41..c97661ad68 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -546,6 +546,14 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         }
     }
 
+    if (ms->device_memory) {
+        numamem = acpi_data_push(table_data, sizeof *numamem);
+        build_srat_memory(numamem, ms->device_memory->base,
+                          memory_region_size(&ms->device_memory->mr),
+                          ms->numa_state->num_nodes - 1,
+                          MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
+    }
+
     build_header(linker, table_data, (void *)(table_data->data + srat_start),
                  "SRAT", table_data->len - srat_start, 3, NULL, NULL);
 }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f926477ba5..d221841c42 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2051,6 +2051,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->plug = virt_machine_device_plug_cb;
     hc->unplug_request = virt_machine_device_unplug_request_cb;
     mc->numa_mem_supported = true;
+    mc->auto_enable_numa_with_memhp = true;
 }
 
 static void virt_instance_init(Object *obj)
@@ -2156,6 +2157,7 @@ static void virt_machine_4_1_options(MachineClass *mc)
     virt_machine_4_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_4_1, hw_compat_4_1_len);
     vmc->no_ged = true;
+    mc->auto_enable_numa_with_memhp = false;
 }
 DEFINE_VIRT_MACHINE(4, 1)
 
-- 
MST

