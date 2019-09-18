Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp6468934wrp;
        Wed, 18 Sep 2019 06:08:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz+z07eVQDmqs+GVDP2KZejxEIAZjWoNOGnl9b04rFrt8vxYhhBGeehh2iv0DIoEBy6HFuG
X-Received: by 2002:a05:6402:128c:: with SMTP id w12mr3947068edv.158.1568812116046;
        Wed, 18 Sep 2019 06:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568812116; cv=none;
        d=google.com; s=arc-20160816;
        b=PnQP9KdnKQICem5Q+Y5BJF2A74ODvVyfDjXWTy1odu0IRvTjx6TJf+GhhtyNO1/VBj
         tcEV4YQ45o3Toli4tJpeM4XRaldsJX02bxMuQOc0IRYcHBc2mO2uNtFC2rQ/e4Ci5zY9
         q6qz0BqgVXjZhTkkOohkxli/GnCgqfSrxr9Q64nZ29tM4b3lNh8zkAZf71+GLQVXLvWe
         pWahyyskkDZyrYy+W+4DmQBDPL/OWb1vq4BNq0gGeBN31YzNwo1xfjmTet0AazsmRBih
         zNDYdwqRLDGZNJXx3NVOuPdaEiUa7zz5bUsyHgD247PJ/kFKhHfFUyz+ByVtLZybfuPV
         GqVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=baRvW1oCGVZkVk4Dgfg2Qxz+MISC/NzNUi8xulrSLos=;
        b=1CwsggcX1KiKvCi3bLJgERQRva864O+EtJUVUyBmBwlLj+8XHj/w80s6QrbWAUyfPj
         JgQSRiKyzWmZ2alvV6EZFErkxZmJqNFwiiPszwPk4IQ44oOgHouFYBOaCBYPXSjW44p7
         kq5C6494eRBXBTijsc/sLbhIJxCUPxS10YsSkRNgNe/vpH4wA3zQgz2gZuwA5gAC5rmC
         OrEwGYtLMG9DbyoN4+TApoSzizyBreJBcmpStL9ywzo87OWSy+0UgIGIlJTavzf1gJKS
         JhPgy/OrV6Ve4ebCOXnT5IJFaoKiS0JlNS/rA7BsRv3l08zv8RWH/tC+sktVpcgcq8oA
         QMyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20si702379edq.195.2019.09.18.06.08.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 06:08:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAZhC-00047G-4u
	for alex.bennee@linaro.org; Wed, 18 Sep 2019 09:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58561)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZgo-00046r-Ll
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 09:08:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZgm-0003CM-Pz
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 09:08:10 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2235 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZgm-00039G-Fa; Wed, 18 Sep 2019 09:08:08 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id AE59F6DF4B77786E9BF5;
 Wed, 18 Sep 2019 21:08:02 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 18 Sep 2019 21:07:56 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Wed, 18 Sep 2019 14:06:24 +0100
Message-ID: <20190918130633.4872-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
References: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH-for-4.2 v11 02/11] hw/acpi: Do not create memory
 hotplug method when handler is not defined
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dDxLf1vRL0vJ

From: Samuel Ortiz <sameo@linux.intel.com>

With Hardware-reduced ACPI, the GED device will manage ACPI
hotplug entirely. As a consequence, make the memory specific
events AML generation optional. The code will only be added
when the method name is not NULL.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/memory_hotplug.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index 9b0b150f4f..8d2e82240f 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -712,10 +712,12 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
     }
     aml_append(table, dev_container);
 
-    method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
-    aml_append(method,
-        aml_call0(MEMORY_DEVICES_CONTAINER "." MEMORY_SLOT_SCAN_METHOD));
-    aml_append(table, method);
+    if (event_handler_method) {
+        method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_call0(MEMORY_DEVICES_CONTAINER "."
+                                     MEMORY_SLOT_SCAN_METHOD));
+        aml_append(table, method);
+    }
 
     g_free(mhp_res_path);
 }
-- 
2.17.1


