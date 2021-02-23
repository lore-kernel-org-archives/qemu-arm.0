Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2248335lfc;
        Mon, 22 Feb 2021 18:25:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrdTCmGbr/T5S7NNfEnmQLgpvo57I+DyESWRw/tczLYd19q74Nd88T0YBXAKAdZYIc7QTX
X-Received: by 2002:a05:6602:3319:: with SMTP id b25mr10542034ioz.54.1614047132449;
        Mon, 22 Feb 2021 18:25:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614047132; cv=none;
        d=google.com; s=arc-20160816;
        b=ucxSalChVkTZd0tPEMA61H/LEKaL/3agLSMtho/MUTqqqi6YVIXDZdGYCT52Fc7CKY
         lR2GjCcB1peUoDm0CVR71rsAXJ85LTaFUpje3uYuMdwCmPX/Rd8ZEdAKlNK/bvxt2eqG
         G9WP+EVvDJRcpj0+/5IVhMIiQOF5vVXFgiDLu6zvXD7FIYQrGZmrYc2GWHE8TXM76bEu
         EoZsFOnBW6z5CVOkR+uJoIB1A6bmo1U4Hnhku6UYLUKtRTjbUwIsDTMTTA/Re+F8ynAt
         mW5iO3+ODJJYXChc0u+nmrIqyHE96U+R8D+O5sZ/fAJxmqR36SPr99I0iLn7eQTWWsZX
         10UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=/h8tnxt2iXDI7D3kKbtL+lTmXLrLuaO228+gz+ahPcw=;
        b=LyXxqXx6qASoQijMBBqGvWn7UqCLSaSs2Parhoa8bZfCPXGOKAxOTTouz3g7VDW4w/
         jJLIgF9UPyqPPwtF9XC8akGed6g2nozylxfOO0rsm2dTB2DeIPw1TsB/bkTFUi4a93FF
         1aC7EJF3qYKr5GlncbKP5YT+JTBFDli2wvevEqJMQS0dx+gxkdsslDEZQFJk3aS3B0MP
         2RAACOujYGl+ptPqLM/WEb7itIhZMxW3i1GFnk21h8hI+b5bhKHob0En3TTKvmPFBIxg
         me+bxOFkvOLc2bQ6JMcUI72O+r/wyISFc4OnDoQZNfHOgxOfOc/wlFPpGLW5Wqt/4LIE
         IOaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11si11812514jam.89.2021.02.22.18.25.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Feb 2021 18:25:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lENOF-0000mV-Pk
	for alex.bennee@linaro.org; Mon, 22 Feb 2021 21:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lENM2-0006AJ-7d; Mon, 22 Feb 2021 21:23:14 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lENLq-0000IQ-6V; Mon, 22 Feb 2021 21:23:13 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dl2q81TSdzjQvX;
 Tue, 23 Feb 2021 10:21:24 +0800 (CST)
Received: from DESKTOP-7FEPK9S.china.huawei.com (10.174.184.135) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 23 Feb 2021 10:22:49 +0800
From: Shenming Lu <lushenming@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v3 1/3] vfio: Move the saving of the config space to the right
 place in VFIO migration
Date: Tue, 23 Feb 2021 10:22:23 +0800
Message-ID: <20210223022225.50-2-lushenming@huawei.com>
X-Mailer: git-send-email 2.27.0.windows.1
In-Reply-To: <20210223022225.50-1-lushenming@huawei.com>
References: <20210223022225.50-1-lushenming@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.135]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=lushenming@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Eric
 Auger <eric.auger@redhat.com>, yuzenghui@huawei.com, wanghaibin.wang@huawei.com,
 lushenming@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eGClUuF33vIF

On ARM64 the VFIO SET_IRQS ioctl is dependent on the VM interrupt
setup, if the restoring of the VFIO PCI device config space is
before the VGIC, an error might occur in the kernel.

So we move the saving of the config space to the non-iterable
process, thus it will be called after the VGIC according to
their priorities.

As for the possible dependence of the device specific migration
data on it's config space, we can let the vendor driver to
include any config info it needs in its own data stream.

Signed-off-by: Shenming Lu <lushenming@huawei.com>
---
 hw/vfio/migration.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 00daa50ed8..f5bf67f642 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -575,11 +575,6 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = vfio_save_device_config_state(f, opaque);
-    if (ret) {
-        return ret;
-    }
-
     ret = vfio_update_pending(vbasedev);
     if (ret) {
         return ret;
@@ -620,6 +615,19 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
     return ret;
 }
 
+static void vfio_save_state(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    int ret;
+
+    ret = vfio_save_device_config_state(f, opaque);
+    if (ret) {
+        error_report("%s: Failed to save device config space",
+                     vbasedev->name);
+        qemu_file_set_error(f, ret);
+    }
+}
+
 static int vfio_load_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -670,11 +678,7 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
         switch (data) {
         case VFIO_MIG_FLAG_DEV_CONFIG_STATE:
         {
-            ret = vfio_load_device_config_state(f, opaque);
-            if (ret) {
-                return ret;
-            }
-            break;
+            return vfio_load_device_config_state(f, opaque);
         }
         case VFIO_MIG_FLAG_DEV_SETUP_STATE:
         {
@@ -720,6 +724,7 @@ static SaveVMHandlers savevm_vfio_handlers = {
     .save_live_pending = vfio_save_pending,
     .save_live_iterate = vfio_save_iterate,
     .save_live_complete_precopy = vfio_save_complete_precopy,
+    .save_state = vfio_save_state,
     .load_setup = vfio_load_setup,
     .load_cleanup = vfio_load_cleanup,
     .load_state = vfio_load_state,
-- 
2.19.1

