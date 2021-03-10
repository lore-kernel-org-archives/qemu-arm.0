Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp134115lfg;
        Tue, 9 Mar 2021 19:03:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyN7pcGrL5pGeDB1uTKw5UXVoI5K+z/4tDuxvAjePkf0BdVHZOXAQELnVfROopE2tJ0f2qV
X-Received: by 2002:a02:c017:: with SMTP id y23mr1259142jai.3.1615345412438;
        Tue, 09 Mar 2021 19:03:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615345412; cv=none;
        d=google.com; s=arc-20160816;
        b=CpzJTe1hA993pMoZOl37sH4Kk8QYDrNzgd+IESZJaWIWQLdAe4KBoCTQbZ0EC8oMSh
         uw/40H6EwwLU0H+Z++t+8ZVWu8X4WhRBG0CKzAyQg7AxaqI7iKiwlW2Y0kvUdk2kfwhr
         0q4j0zFDD0Z43tzu/UPsSWVoVmupwksGn9ohzbPbwU2fLfjnVphQzcSY3woBZeXBHS+w
         Oz52k+hLTM458SqWmDkjkN5Ppx0LGSLVOMrXsGdhrpPBudb3Fl1qVPu4rFPjEdvnAuAK
         p8DzPTn0yew7x6ffL5/kBTM20/IHfqj5KSwG5TANiSM2fXehlEtNdOUYwA3qTSj0CMRT
         puew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=+hr6vanJn8JlzKSFpl1lnXkCIzy2VYYWxQ1A1xj9exA=;
        b=BgGDWxFhnAwYEOXbu4iGW1z3VgGTvZX6fHMT00EyZJH0kpoGr0t40+J83gWqNB+MNK
         I+RMPsdmYJQYdJHlCuIH3cmRr16VaZADhADgdF+1fj2ty2dBjy3W8tpYl74jayhYHTLq
         IUXx7RYmZKm2XiHtcjTPwHDZ7MdRfgl1dwznrP/kWWCui2B765f4KNB/+bWVZ4iwgfaF
         YESJny8r5yihJcSdvd3lHaf8Eifji/ySQ3vi0giBndSyQkbAcWKC6xSvnyjP3MFSLkPy
         MmQfA+tS05+a/nW1ZXbbmyvhvEfw0dsRRZimX1A2jsMgWc3AZUVfjOXuOGJp1YJ4Vxux
         CR1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si13616454jar.79.2021.03.09.19.03.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 19:03:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJp8F-0005CE-Ob
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 22:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lJp80-0005AH-VT; Tue, 09 Mar 2021 22:03:18 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:4374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lJp7u-0002vC-Ko; Tue, 09 Mar 2021 22:03:16 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DwH0F5p0fz17Hbp;
 Wed, 10 Mar 2021 11:01:17 +0800 (CST)
Received: from DESKTOP-7FEPK9S.china.huawei.com (10.174.184.135) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 10 Mar 2021 11:02:55 +0800
From: Shenming Lu <lushenming@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v4 1/3] vfio: Move the saving of the config space to the right
 place in VFIO migration
Date: Wed, 10 Mar 2021 11:02:31 +0800
Message-ID: <20210310030233.1133-2-lushenming@huawei.com>
X-Mailer: git-send-email 2.27.0.windows.1
In-Reply-To: <20210310030233.1133-1-lushenming@huawei.com>
References: <20210310030233.1133-1-lushenming@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.135]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=lushenming@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, marcel.apfelbaum@gmail.com,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com, lushenming@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: no5ODhvX6Duq

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
Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
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

