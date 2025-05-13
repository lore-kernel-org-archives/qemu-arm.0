Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp440838njb;
        Tue, 13 May 2025 04:16:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpEebrUE5UhByaeHNpSZQxO2uvMZKCx/DYueK8F88th9aiihu9Z2hA4gaEC77HR3A901nai1QkfQLxTQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFaURdtxywAKwzVFmmCOHO1N6+Vkv+zPOQ4b0w+uJGWAC1ukME/9dvlrWVcCzu/jK8djK50
X-Received: by 2002:a05:620a:d81:b0:7c7:a537:7ce2 with SMTP id af79cd13be357-7cd01115c96mr2431067385a.32.1747135014612;
        Tue, 13 May 2025 04:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747135014; cv=none;
        d=google.com; s=arc-20240605;
        b=BStI8t9XwAv82jIVx12t6oY33BYRo2StW+drQWhiBq7OevBBFpCg2LdjhHYt2p2kyv
         oRJZXPcA+IqCYS7R2KxFYkTsmVC8MBKzu0qkupzQcbWu4bq+f/M96XM47zQcOcqlEqrG
         AShGWLQ540rT5z01KXIXwZ3V9GKoTSrYGB00jXz4GbHsC+zCn1gNG6rAWhUpIhVdUIg+
         S+O194F09ved+YxF1nE7wdfNoATPdbdWJGogWd1EQmtRXbfNtqIyhO304fdedCjZPxEZ
         5cAUwI9v147pKI3Y85Fv6geDOm/Daoi0EbeotuhJmoHslGvUSNwOW1fx/bSAHbF3K401
         DyWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=EUavEMNq0BIAmF05dbWWawEZZEeWmnZxDVW8LPlDsmo=;
        fh=X5nH5YuFPf4WKqGf6XsKhoyhnk+YS/0SzZ/7HifbnvI=;
        b=hszRldUZl2eQFyCNT1io9SHsGlV6skAz2qMsIRZR7cyKsQNo2FmQAlMrrN7xccxeZT
         XC39wmXWZv0z2Py0x20gpp6Zza/1D9ZiXkPxtqSm5LdlmXmUwjxl7RJobJo2RwulgJEo
         pqmICjPZgDJjEFnzhZlhFyQX4oLDantpdWs4Jfv0IWElP5F3mrmqsjUpqgSQV+Ewoeb0
         vBWR/9U9h2J646uHvu1jB4Fw9sRVQR0Slymb4Q4ibzZ8HRitReNq5OpWJPsClVTgJ1qS
         yq203GBvIQBvqMAEf1oQEvEcv3+pXXQHn068BEfJzN2iGWCJfWh4FWDExp2FyrmikqIU
         24IA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fd3ee4si1056080585a.327.2025.05.13.04.16.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 04:16:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uEncl-0007zw-AC; Tue, 13 May 2025 07:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uEncj-0007yY-9n
 for qemu-devel@nongnu.org; Tue, 13 May 2025 07:16:37 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uEnch-0006sd-DU
 for qemu-devel@nongnu.org; Tue, 13 May 2025 07:16:37 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZxYhQ0h1yz6M4Lf;
 Tue, 13 May 2025 19:11:50 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 5A624140276;
 Tue, 13 May 2025 19:16:30 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 May 2025 13:16:29 +0200
To: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, Peter Maydell
 <peter.maydell@linaro.org>, <mst@redhat.com>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, 
 Yuquan Wang <wangyuquan1236@phytium.com.cn>, Itaru Kitayama
 <itaru.kitayama@linux.dev>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: [PATCH v13 3/5] hw/cxl-host: Allow split of establishing memory
 address and mmio setup.
Date: Tue, 13 May 2025 12:14:53 +0100
Message-ID: <20250513111455.128266-4-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513111455.128266-1-Jonathan.Cameron@huawei.com>
References: <20250513111455.128266-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5/m1zw+6c2DP

On arm/virt the memory map is set up before any devices are brought
up.  To enable this provide split functions to establish the fw->base
and later to actually map it.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 include/hw/cxl/cxl_host.h |  2 ++
 hw/cxl/cxl-host-stubs.c   |  2 ++
 hw/cxl/cxl-host.c         | 44 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/include/hw/cxl/cxl_host.h b/include/hw/cxl/cxl_host.h
index 6dce2cde07..aee9d573d6 100644
--- a/include/hw/cxl/cxl_host.h
+++ b/include/hw/cxl/cxl_host.h
@@ -16,6 +16,8 @@
 void cxl_machine_init(Object *obj, CXLState *state);
 void cxl_fmws_link_targets(Error **errp);
 void cxl_hook_up_pxb_registers(PCIBus *bus, CXLState *state, Error **errp);
+hwaddr cxl_fmws_set_memmap(hwaddr base, hwaddr max_addr);
+void cxl_fmws_update_mmio(void);
 hwaddr cxl_fmws_set_memmap_and_update_mmio(hwaddr base, hwaddr max_addr);
 GSList *cxl_fmws_get_all_sorted(void);
 
diff --git a/hw/cxl/cxl-host-stubs.c b/hw/cxl/cxl-host-stubs.c
index 13eb6bf6a4..d9e38618d6 100644
--- a/hw/cxl/cxl-host-stubs.c
+++ b/hw/cxl/cxl-host-stubs.c
@@ -11,6 +11,8 @@
 void cxl_fmws_link_targets(Error **errp) {};
 void cxl_machine_init(Object *obj, CXLState *state) {};
 void cxl_hook_up_pxb_registers(PCIBus *bus, CXLState *state, Error **errp) {};
+hwaddr cxl_fmws_set_memmap(hwaddr base, hwaddr max_addr) { return base; };
+void cxl_fmws_update_mmio(void) {};
 hwaddr cxl_fmws_set_memmap_and_update_mmio(hwaddr base, hwaddr max_addr)
 {
     return base;
diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index 438f2920e1..3b9184e7e7 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -383,6 +383,7 @@ void cxl_hook_up_pxb_registers(PCIBus *bus, CXLState *state, Error **errp)
 struct cfmw_update_state {
     hwaddr base;
     hwaddr maxaddr;
+    bool update_mmio;
 };
 
 static void cxl_fmws_update(Object *obj, void *opaque)
@@ -397,7 +398,9 @@ static void cxl_fmws_update(Object *obj, void *opaque)
     fw = CXL_FMW(obj);
     if (s->base + fw->size <= s->maxaddr) {
         fw->base = s->base;
-        sysbus_mmio_map(SYS_BUS_DEVICE(fw), 0, fw->base);
+        if (s->update_mmio) {
+            sysbus_mmio_map(SYS_BUS_DEVICE(fw), 0, fw->base);
+        }
         s->base += fw->size;
     }
 
@@ -438,6 +441,24 @@ GSList *cxl_fmws_get_all_sorted(void)
     return g_slist_sort_with_data(cxl_fmws_get_all(), cfmws_cmp, NULL);
 }
 
+hwaddr cxl_fmws_set_memmap(hwaddr base, hwaddr max_addr)
+{
+    GSList *cfmws_list, *iter;
+
+    struct cfmw_update_state cfmwss = {
+        .base = base,
+        .maxaddr = max_addr,
+        .update_mmio = false,
+    };
+    cfmws_list = cxl_fmws_get_all_sorted();
+    for (iter = cfmws_list; iter; iter = iter->next) {
+        cxl_fmws_update(iter->data, &cfmwss);
+    }
+    g_slist_free(cfmws_list);
+
+    return cfmwss.base;
+}
+
 hwaddr cxl_fmws_set_memmap_and_update_mmio(hwaddr base, hwaddr max_addr)
 {
     GSList *cfmws_list, *iter;
@@ -445,6 +466,7 @@ hwaddr cxl_fmws_set_memmap_and_update_mmio(hwaddr base, hwaddr max_addr)
     struct cfmw_update_state cfmwss = {
         .base = base,
         .maxaddr = max_addr,
+        .update_mmio = true,
     };
     cfmws_list = cxl_fmws_get_all_sorted();
     for (iter = cfmws_list; iter; iter = iter->next) {
@@ -455,6 +477,26 @@ hwaddr cxl_fmws_set_memmap_and_update_mmio(hwaddr base, hwaddr max_addr)
     return cfmwss.base;
 }
 
+static int cxl_fmws_mmio_map(Object *obj, void *opaque)
+{
+    struct CXLFixedWindow *fw;
+
+    if (!object_dynamic_cast(obj, TYPE_CXL_FMW)) {
+        return 0;
+    }
+    fw = CXL_FMW(obj);
+    sysbus_mmio_map(SYS_BUS_DEVICE(fw), 0, fw->base);
+
+    return 0;
+}
+
+void cxl_fmws_update_mmio(void)
+{
+    /* Ordering is not required for this */
+    object_child_foreach_recursive(object_get_root(), cxl_fmws_mmio_map,
+                                   NULL);
+}
+
 static void cxl_fmw_realize(DeviceState *dev, Error **errp)
 {
     CXLFixedWindow *fw = CXL_FMW(dev);
-- 
2.43.0

