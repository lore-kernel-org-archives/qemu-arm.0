Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp152975lfb;
        Thu, 2 Sep 2021 04:13:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznTHmAovXQWFQGDPpIIh4N5nItu6y38opmoqKoIXnow0zVJ0uw5qnUgD8muJfpAk9pE2NL
X-Received: by 2002:a05:6102:a0f:: with SMTP id t15mr1295247vsa.51.1630581207932;
        Thu, 02 Sep 2021 04:13:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630581207; cv=none;
        d=google.com; s=arc-20160816;
        b=kpXA7svMKMctxV8BZcRSfVKd4asLUagwaQo2ujkWyQFBrW/0mXV3DiKJEWmRP5wOZW
         tRgXP/pQxC1cRQCNTCB1pY7aB4tYtHL3U7U8JtR3dKPxq1JhhQ/UpU6w86Js/sBJ0WPY
         xTWT4ZRHeHCvMfJlzSyJH8M7ZwDRfpsAmbHiZN4AipRALp8NPPYiqvjMpA65WQ9TXyf3
         wy3tmuhZquzTFwFXfgxFO+0tZW5lkMwNTddCcEtZ14j7N/K/4+72XfVX+QjrvdWYMZS7
         vCObWwDtybHbuqNcu7WuLl8c0cJsX0kO/UIxcoIDqpnHe8tk9PoJK7Mp0a2Phu5KTRy8
         ERLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=ld2f/DMbcgA5HFAWH2ZcMOF/biGvn9IiW4EXOu75uSc=;
        b=tHOYxnEPN4fqdk0V+XX+aC2s7LpAc9gpD0jeJyRvpS9mjfWFjiEd9PdW+sNeffjrHX
         iyJ04PSJV1yQ3H02Xo9PpQtCY16Sogz0YX64jwTkoqVLLPuLuKJM30RxJlNlEB5xmYXf
         u1whRdd5pt+5rfhNmkVyUj6VzayF+wyZJXlW4cmFZONPnGDVYaRLtnCTUB9YdcXZo/C4
         m/yE2xVIuTi+aPkkVPQNCJhHwkSg9B9u77xNGP7sOIMrD6U1ErSaTb7t6SLunykiEx+6
         VW3wDw2Tbhw88jGUpHIB0VxZFWKbtuRm3DoDM4Ibym0qbSCKdVJSVGaXOP4z+XXcDjzX
         AsUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17si325794uaf.96.2021.09.02.04.13.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 04:13:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:44704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLket-0006Ng-4W
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 07:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLkVg-0007FU-7f; Thu, 02 Sep 2021 07:03:56 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLkVb-0003jM-V8; Thu, 02 Sep 2021 07:03:55 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4H0dLv4fkkz1DFjS;
 Thu,  2 Sep 2021 19:03:03 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 2 Sep 2021 19:03:47 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 2 Sep 2021 19:03:46 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, 
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
Subject: [PATCH v8 11/14] machine: Move smp_prefer_sockets to struct
 SMPCompatProps
Date: Thu, 2 Sep 2021 19:03:27 +0800
Message-ID: <20210902110330.18036-12-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210902110330.18036-1-wangyanan55@huawei.com>
References: <20210902110330.18036-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Greg Kurz <groug@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g6KwNMS1m81M

Now we have a common structure SMPCompatProps used to store information
about SMP compatibility stuff, so we can also move smp_prefer_sockets
there for cleaner code.

No functional change intended.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c              | 2 +-
 hw/core/machine.c          | 2 +-
 hw/i386/pc_piix.c          | 2 +-
 hw/i386/pc_q35.c           | 2 +-
 hw/ppc/spapr.c             | 2 +-
 hw/s390x/s390-virtio-ccw.c | 2 +-
 include/hw/boards.h        | 3 ++-
 7 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ad244f0ff1..be2e5ff37c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2793,7 +2793,7 @@ static void virt_machine_6_1_options(MachineClass *mc)
 {
     virt_machine_6_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
-    mc->smp_prefer_sockets = true;
+    mc->smp_props.prefer_sockets = true;
 }
 DEFINE_VIRT_MACHINE(6, 1)
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index ca7ca68ae3..1bdeff32b3 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -836,7 +836,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     } else {
         maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-        if (mc->smp_prefer_sockets) {
+        if (mc->smp_props.prefer_sockets) {
             /* prefer sockets over cores before 6.2 */
             if (sockets == 0) {
                 cores = cores > 0 ? cores : 1;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 077644ee9c..5efb6f1949 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -431,7 +431,7 @@ static void pc_i440fx_6_1_machine_options(MachineClass *m)
     m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
-    m->smp_prefer_sockets = true;
+    m->smp_props.prefer_sockets = true;
 }
 
 DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index c762df5818..1ce653a21a 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -371,7 +371,7 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
     m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
-    m->smp_prefer_sockets = true;
+    m->smp_props.prefer_sockets = true;
 }
 
 DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index a481fade51..efdea43c0d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4702,7 +4702,7 @@ static void spapr_machine_6_1_class_options(MachineClass *mc)
 {
     spapr_machine_6_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
-    mc->smp_prefer_sockets = true;
+    mc->smp_props.prefer_sockets = true;
 }
 
 DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index b40e647883..5bdef9b4d7 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -809,7 +809,7 @@ static void ccw_machine_6_1_class_options(MachineClass *mc)
 {
     ccw_machine_6_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
-    mc->smp_prefer_sockets = true;
+    mc->smp_props.prefer_sockets = true;
 }
 DEFINE_CCW_MACHINE(6_1, "6.1", false);
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index fa284e01e9..5adbcbb99b 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -110,9 +110,11 @@ typedef struct {
 
 /**
  * SMPCompatProps:
+ * @prefer_sockets - whether sockets are preferred over cores in smp parsing
  * @dies_supported - whether dies are supported by the machine
  */
 typedef struct {
+    bool prefer_sockets;
     bool dies_supported;
 } SMPCompatProps;
 
@@ -250,7 +252,6 @@ struct MachineClass {
     bool nvdimm_supported;
     bool numa_mem_supported;
     bool auto_enable_numa;
-    bool smp_prefer_sockets;
     SMPCompatProps smp_props;
     const char *default_ram_id;
 
-- 
2.19.1

