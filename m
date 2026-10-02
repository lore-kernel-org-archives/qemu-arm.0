Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057EBCA5FE6
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 20:23:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCjkg-0007XO-Hp; Fri, 02 Oct 2026 16:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkQ-0007Jv-8G
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:20:52 -0400
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkM-0005mU-Kt
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:20:49 -0400
Received: by mail-pj2-x0f.google.com with SMTP id
 d9443c01a7336-2e2bfc2540cso22323725ad.3
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 13:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790972445; x=1791577245; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rc1hMaz4HVihHTfD+cBzgKL6/9ldS//SvnIMYsY26sA=;
 b=sPhrHH2Hpgj7LhAzG78rLhJGmV+CS+dNezkMUOmxq7ZvbTzTQVbYkN9i0Qh597Sum/
 K3rN3D2YHLGQslOvJXaDEF7YSDJMS4R4llUVApZnepGfUXpnwFyo4O14wX2RnZPwVbj1
 6Ore+mDNnxq0WdS5VIH2TuJoblGqZQPayX/b9s2uO7tq+Qpcrwpamglh2iZI3B1mDo/p
 ZE4Jkrb99/tWPmym4vULAP3sw/cOeOgGitj9nwOFUzqO11ZzyIYowoNCrfIAZDvXwGpT
 XirWnEuGvPE12Lu7V+qiw2b/2Wmu/qquoFyzCJ1Ivj10MkkK/C69xEpABp5HT9dRcsX2
 3MvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790972445; x=1791577245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rc1hMaz4HVihHTfD+cBzgKL6/9ldS//SvnIMYsY26sA=;
 b=Gr4l/0Vb7eUh3t8UjwtGMY6aBiyc/i1f5flDJ1Unqn4lJCjv0ac7XcTFfhJDD6m4V8
 XRumH8COgHVzcbR5lm+gT28x9iTMaiSOS1uvWYXNP6JNqs3ygN2F3yzzJl3pnXvP4K5j
 ryPszOl9yH6+u2NChrSS1nxLNxOuSiL8qkgfCsO2uTjuhAHxTEkmqCDaAhSLPozqoujq
 FCDPuZ8sTczOv8TEu1rNXuCI7S4q3psT9HWad4nYp4Iu2AiY277nYQ1Z0tEsGudgJv87
 nJLpPhIOHuBD2FGzOsKNAz4CwmaVZRcUELUc3s9BDflWgYWjiIIIo0g3P5MVkaznnhLi
 Vf6g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxcIApeE1NKBX9DTDgZd0+syNnvI1j8N0AcF3PyVNd4nzi74b/6LxcnRSfqend5wQhMwJMEx8Zjkg==@nongnu.org
X-Gm-Message-State: AFq9FYJQ1i3SkpBAyAHuSsGnYSG69zMIrLaiWsoK/em7JSXCvsOZClx+
 EhI/0ScHvSQjlbNICUf7mtl1JV1L8OIpak1VKmUonHiOXUm4687GQ6JpSg8UtJGKR9Y=
X-Gm-Gg: AYBFou15nPM86crh4B7tcFh5zMxh9WiPdvzW0GqNXMxsrhVkilEm+6qnqYLAPXvG+ie
 AwImogoQALFk28lhYWpWKNZ7ziO51DpGHXE/VGy87tZiDn/R+/pZZfa/J8QP//xCBsNcTI5OVO6
 JbRQjLaiTIHS5TK/S2fsOFSQdDBcoiGtZrS+tnv0V7HJLjuW9HcTP2RSl9as/9deaDp5J5Dx5Db
 U6/PQIb+R+/Ef8UgSoNKshHD2ZyvVVHA7GgpfZhRMzlHa3n7+YrgtNkBQbCzWMvrabnq0vTa6ec
 vJcEdUZYQRpqfobykIrt1kdFIpR1qtIHZnFHV1RXQSFtgcw/cQoWfZXfoW35BW/NpMw4pXXcQ1B
 m5t1Y/YITFlTsQcVP7nymbyIqGagr/KBfEFC7jETbtj+pWnz9i+SNcU17kxsX0ykzMiAz5jiOpL
 ux3DTZYUgr6crK7L2z2tVKz9e79gl71+9SsiO9YGTOn3EPskH8qy+rWqxARSDu16RS6BhBV30ps
 SyN8a8RNx1VhPsLBNAVoqpg
X-Received: by 2002:a17:902:e802:b0:2df:35f1:8771 with SMTP id
 d9443c01a7336-2e49b6d0622mr33942355ad.54.1790972445148; 
 Fri, 02 Oct 2026 13:20:45 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:61ac:e744:6559:a357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f6a99acsm12399415ad.34.2026.10.02.13.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:20:44 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v5 09/22] target/arm/kvm-rme: Populate Realm with runtime images
Date: Fri,  2 Oct 2026 14:20:13 -0600
Message-ID: <20261002202026.1204110-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
References: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::f;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Once the Realm descriptor has been created, tell KVM to transfer runtime
images (kernel, DT, and rootfs) from guest memory to Realm memory.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/kvm-rme.c | 76 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index b1fb8957f3de..22c8afe21505 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -15,6 +15,7 @@
 #include "migration/blocker.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
+#include "qemu/memalign.h"
 #include "qom/object_interfaces.h"
 #include "system/confidential-guest-support.h"
 #include "system/kvm.h"
@@ -41,12 +42,87 @@ OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
 
 static RmeGuest *rme_guest;
 
+static int rme_populate_range(const RmeRamRegion *region, Error **errp)
+{
+    int ret;
+    void *buffer;
+    hwaddr size = region->size;
+    hwaddr base = region->base;
+    unsigned long page_size = qemu_real_host_page_size();
+    hwaddr start = QEMU_ALIGN_DOWN(base, page_size);
+    hwaddr end = QEMU_ALIGN_UP(base + size, page_size);
+    size_t aligned_size = end - start;
+    struct kvm_arm_rmi_populate populate_args;
+
+    if (!region->data) {
+        return -ENODEV;
+    }
+
+    ret = kvm_set_memory_attributes_private(start, aligned_size);
+    if (ret) {
+        error_report("RME: failed to configure initial"
+                     "private guest memory");
+        return ret;
+    }
+
+    /* Allocate page-aligned memory */
+    buffer = qemu_memalign(page_size, aligned_size);
+
+    if (!buffer) {
+        return -ENOMEM;
+    }
+
+    memset(buffer, 0, aligned_size);
+    memcpy(buffer + (base - start), region->data, region->size);
+
+    populate_args = (struct kvm_arm_rmi_populate) {
+        .base = start,
+        .size = aligned_size,
+        .source_uaddr = (uintptr_t)buffer,
+        .flags = KVM_ARM_RMI_POPULATE_FLAGS_MEASURE,
+    };
+
+    while (populate_args.size > 0) {
+        ret = kvm_vm_ioctl(kvm_state, KVM_ARM_RMI_POPULATE, &populate_args, 0);
+        if (ret) {
+            error_setg_errno(errp, -ret,
+                "failed to populate realm [0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx")",
+                start, end);
+            break;
+        }
+    }
+
+    qemu_vfree(buffer);
+
+    return ret;
+}
+
+static void rme_populate_ram_region(gpointer data, gpointer err)
+{
+    Error **errp = err;
+    const RmeRamRegion *region = data;
+
+    if (*errp) {
+        return;
+    }
+
+    rme_populate_range(region, errp);
+}
+
 static void rme_vm_state_change(void *opaque, bool running, RunState state)
 {
+    Error *errp = NULL;
+
     if (!running) {
         return;
     }
 
+    g_slist_foreach(rme_guest->ram_regions, rme_populate_ram_region, &errp);
+    g_slist_free_full(g_steal_pointer(&rme_guest->ram_regions), g_free);
+    if (errp) {
+        return;
+    }
+
     kvm_mark_guest_state_protected();
 }
 
-- 
2.43.0


