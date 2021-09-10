Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp913249lfb;
        Fri, 10 Sep 2021 00:40:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWEn/Yak+9wj7vOZQ61HDRsr3mwDlweWeCC/ZnJGZfwUN4CIy7osiHsaMm3TGik32GoX62
X-Received: by 2002:a05:6638:14cf:: with SMTP id l15mr3374780jak.8.1631259655704;
        Fri, 10 Sep 2021 00:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631259655; cv=none;
        d=google.com; s=arc-20160816;
        b=zI4O3S60QRg2l93GUCOWNeyz+ZPstok5O5gJ3OlO9nCDLf8W/t8V98OG5WnbsU2jIR
         xp+cc+zhgozf3qL9mu2aPvAdShVCukDSxst1huYDu4I1urAq/efMW1QexgMUdFQ6CxH7
         uTJ7kvrZzXsxI/crmGx/H/1AjRlfDmyV3/Lp2T3e1bSIPAj///gT1o8jXtiW9TR89hsE
         pGXE+kEWY9CkJbH96a82XbJO12zNhWX7CX16j/c2D9Z1YvrSp7JBUiC9TqYUscN1gCO3
         ant4hWCXfsEvG3VDcUimFoETmMsL5UeorZBPSjyEaqk8/OcXSy1ibrESwyEFUiq/QO6Y
         4UtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=qmcPTRSPzmb/gUeDolTtWhhIkD8EPy0hVuA6YfkdsGc=;
        b=LHfU9xPk2N0+YwRcZaBUTdO5jzDpdFYj1jWGW3e7Z4fE2GVuq4mn0JdqjxqBoNNhCJ
         oGn2ajxhCnf4BCbXWt4DFTx5Cvo30jYdhOoil0AoB37Fz+ICaeCMVXvDGe29hMucU5so
         JLSotmgAQREAjlMQxTuekuMaWKz+S3Uj41M3xK9iqjOpPGHJJSlc/d7gCY7IWxqmphwi
         rh89SDTod4aZ2yB3cc4F+v3UvGBSaJdLf2TRQVOqBoXcfjkthp4zG3WVbld4WkfNMmHr
         mP854DbDYGysA4Md0AMC5uOFNlBsFPS/Gfer+GQzNHJE7MiMKsVqEYOFuHjWqt5dHlA8
         8JFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2si3955618ila.178.2021.09.10.00.40.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Sep 2021 00:40:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:39228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOb9b-00082c-00
	for alex.bennee@linaro.org; Fri, 10 Sep 2021 03:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazu-0005Do-Hy; Fri, 10 Sep 2021 03:30:54 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazr-00010B-S8; Fri, 10 Sep 2021 03:30:54 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4H5SFD6ZBxz1DGLX;
 Fri, 10 Sep 2021 15:29:52 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:46 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:45 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, 
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
Subject: [PATCH v9 13/16] machine: Move smp_prefer_sockets to struct
 SMPCompatProps
Date: Fri, 10 Sep 2021 15:30:22 +0800
Message-ID: <20210910073025.16480-14-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210910073025.16480-1-wangyanan55@huawei.com>
References: <20210910073025.16480-1-wangyanan55@huawei.com>
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Greg Kurz <groug@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QsRSn1h6uQ94

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
index 2d97c0ab3e..9eae40e32c 100644
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
index 5401c985cf..653587ea62 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -814,7 +814,7 @@ static void ccw_machine_6_1_class_options(MachineClass *mc)
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
2.23.0

