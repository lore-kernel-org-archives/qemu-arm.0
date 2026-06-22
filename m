Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D046CDB46F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Jun 2026 13:56:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wbf8r-0002PX-UQ; Mon, 22 Jun 2026 09:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wbf8p-0002Om-Ns
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 09:56:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wbf8n-0007wt-Hy
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 09:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782136604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/URF9nfbf9hl1uNYYwQxU/heW1PoSsB716FltVdjwqg=;
 b=cIvD0ZtfaiM9/dM4P+RoZ4USIuMQbRQnKTwY5aHtQ8S0q0ws3rfdW5VMa6bfkXHLuQkDFC
 xIm80xEp56S1oiiWfqJLReawQJ4zPP+v3pXGORuqx3IQh50VkDLzfIIjqCDLZ5Cm669lHE
 pUrB6Uc1oLXsZJW9xdj6YIdHWh/eZqs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-qJvLkAQpNUKZ93TLyVRWHQ-1; Mon, 22 Jun 2026 09:56:41 -0400
X-MC-Unique: qJvLkAQpNUKZ93TLyVRWHQ-1
X-Mimecast-MFC-AGG-ID: qJvLkAQpNUKZ93TLyVRWHQ_1782136600
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-45f3d008865so3390636f8f.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2026 06:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782136600; x=1782741400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/URF9nfbf9hl1uNYYwQxU/heW1PoSsB716FltVdjwqg=;
 b=rTFpyywZ6TJ+IZLN2foTBaHbikEm5ZBWxXj/jvLHfwv2Z1EFUObQZPaBXnxbGlLuj8
 1VDdg8KDeHqI6tpZahLov22LPRycDjTbgZNOGi5njbYFQv2Mmxl2unuXlzWMlun2pP2G
 yyJgeDB2FsxlvsokE7XsrQpGOhylR9hf4c/zf691SrB4GYTs1fk88MW3aLAQEXL5fRRA
 s1ezIGLsxt4kRbSNzBnQa/vfUFB8zyChbIGnxvrEcKa/YlHZ4rL8Q3gCo9jQ+Nzrn08d
 iOUzZBj9MV90rBZM82AJqBrHdILC+YaBe2BtvS9Wj47vFQN6BRx9cCFa1H+ypS/tvzxM
 y6fg==
X-Gm-Message-State: AOJu0Ywpxa9oAvotpd+ZmNjeUzhOy0s1roUJ+TJ36SeXuBg2bQJOJ4fh
 k7zNLoJLAxbZOuV/ItDXbL8wMPu6ezv/bn/OLm7oLnowDzJkHHxs5yQ+HTcB9ako6gW+yN+y58S
 +AoRScnBM3/Pe0swswYWLytNd+CuixefjiHYWX4/6+I32bSp8VU6zmw==
X-Gm-Gg: AfdE7ckyO0WgjsZs9S0v2m9hYJZ/ptWJ9n909Im4o90O3r8HH+RsUnwIzStSoNdBP6k
 KPFQyW1glGLLizNk2rmZvyOEkhMhbsGNEVHpRPzYOvmfuNXmO47XAoxCLXYX0g+/1BqnxHcUwma
 ee4yNJ0TyxxEZh8N/XdzkcmcLldokJLubjVu8S+v0o7fLlflZmrWZ/4rkp14NJ1+E5W7WLorSZC
 vIQTTeYSsKafty8v6q7HbwEIxClaIFLQvLK8qA5M++oteXzCS51DDm5rN78FcaPuSYHF1B1c513
 MrmqVhmCxS5u/pjCPaTnQ3ezdjn40EOQ2S9GU/3i5uAOR4YG0iWvZ3mGk7eS5fGV+FiPN9Fn808
 3xM9t0NE6MU9OZ6OODw4BkFQBBUtVdKKxRpMQSQbJqSxmK8qeBAqqtmmgXgyXVlkZ0GdmjQgS8E
 A=
X-Received: by 2002:a05:6000:1889:b0:460:21e7:330e with SMTP id
 ffacd0b85a97d-4651c4275bamr21841261f8f.10.1782136599627; 
 Mon, 22 Jun 2026 06:56:39 -0700 (PDT)
X-Received: by 2002:a05:6000:1889:b0:460:21e7:330e with SMTP id
 ffacd0b85a97d-4651c4275bamr21841229f8f.10.1782136599279; 
 Mon, 22 Jun 2026 06:56:39 -0700 (PDT)
Received: from rh.redhat.com
 (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466643f4e9esm25162303f8f.1.2026.06.22.06.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 06:56:38 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eauger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v3 3/3] arm/kvm: get demuxed ID registers from kvm
Date: Mon, 22 Jun 2026 15:56:27 +0200
Message-ID: <20260622135627.40573-4-sebott@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622135627.40573-1-sebott@redhat.com>
References: <20260622135627.40573-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LehJJEiFU_VYCFM9CGTUyLKJ12Qw512quwGJ5TGhRfE_1782136600
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Cornelia Huck <cohuck@redhat.com>

We now have the infrastructure in place to handle demuxed ID registers
from kvm. Use it to get the values that kvm emulates for CCSIDR_EL1.

Tested-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 target/arm/kvm.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index a54ef51ec2..059d361d88 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -244,6 +244,33 @@ static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf,
     return ret;
 }
 
+
+/* CSSELR values; used to index KVM_REG_ARM_DEMUX_ID_CCSIDR */
+#define CSSELR_MAX 14
+
+static int get_host_cpu_reg_demux(int fd, ARMHostCPUFeatures *ahcf,
+                                  ARMIDRegisterIdx index, int subindex)
+{
+
+    struct kvm_one_reg one_reg = {
+        .id = KVM_REG_ARM64 | KVM_REG_SIZE_U32 | KVM_REG_ARM_DEMUX,
+    };
+
+    switch (index) {
+    case CCSIDR_EL1_IDX:
+        if (subindex >= CSSELR_MAX) {
+            return -EINVAL;
+        }
+        one_reg.id |= KVM_REG_ARM_DEMUX_ID_CCSIDR | subindex;
+        one_reg.addr = (uintptr_t)&ahcf->isar.idregs[index + subindex];
+        break;
+    default:
+        return -EINVAL;
+    }
+
+    return ioctl(fd, KVM_GET_ONE_REG, &one_reg);
+}
+
 static uint32_t kvm_arm_sve_get_vls(int fd)
 {
     uint64_t vls[KVM_ARM64_SVE_VLS_WORDS];
@@ -286,6 +313,7 @@ static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     bool pmu_supported = false;
     uint64_t features = 0;
     int err;
+    int i;
 
     ahcf->target = QEMU_KVM_ARM_TARGET_NONE;
     ahcf->dtb_compatible = "arm,armv8";
@@ -454,6 +482,10 @@ static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
             /* Read the set of supported vector lengths. */
             arm_host_cpu_features.sve_vq_supported = kvm_arm_sve_get_vls(fd);
         }
+        /* Grab demuxed registers. */
+        for (i = 0; i < CSSELR_MAX; i++) {
+            err |= get_host_cpu_reg_demux(fd, ahcf, CCSIDR_EL1_IDX, i);
+        }
     }
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
-- 
2.54.0


