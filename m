Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2227AC982CF
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 16:52:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6srK-0000IB-3n; Wed, 16 Sep 2026 12:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1x6sr5-00006f-Rm
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:51:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1x6sr4-0001dH-2i
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789577489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DceylnPw8tnbzv24tzOsmyILBNWMpDPlJWn3IRyqBt0=;
 b=Aak1nYzfEl3ynUnGHpcQ5SNJIhTchVGATUBmo0o5CocCHHqwFA29ZAeGZn/yqWiISzodwv
 B37x5IMQ2YDyN6K5xkx5XlQ6l6DBg1cv1isoRfypBjuJSkwF34KCoYXMzOhcFvIobyeEW+
 m/ipw3B/Nn9k8+ROUnD05U+UOP7zLM0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-_z-TXStaM-CT2DTWzO7H8Q-1; Wed, 16 Sep 2026 12:51:28 -0400
X-MC-Unique: _z-TXStaM-CT2DTWzO7H8Q-1
X-Mimecast-MFC-AGG-ID: _z-TXStaM-CT2DTWzO7H8Q_1789577487
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-4870a0f802cso1695294f8f.0
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 09:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789577487; x=1790182287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=DceylnPw8tnbzv24tzOsmyILBNWMpDPlJWn3IRyqBt0=;
 b=UVJt33gmTj8oWmVBuDSkh/t6+m1rYPAmSQh8cxJcaW063HQpOzZ5oydMUIJz9LCxzd
 wf+5IaQGv1fHxh9FcghjcLGpek2GeShtUdcmKq7as2ysINqXJSsYvGbjlPTASzkPS8l6
 zMFVe8BhyXww/fgtw8K0AA1NMzMK9q0i25Oa9R+fKA78DrLOqpdnB4vUIZkJnJp6+BUk
 s6ot980dtzTs7lROm2JTUEtF6COtQtavLriYdOXOPQ70NKhuIAf7jDZu434RAwWDrkMb
 Q0oVnKipqL53Np8eFqGP0vbvsEe3yDDhEtP+p0a6Epd7PrzVE7OXW21bOVL+iqAuTFVZ
 LDCg==
X-Gm-Message-State: AFuF++n0ILPqIqHOp8lW/yopdsEEuXkg4m/1xBcCpy3ZFycY6uW2BqXI
 /S9qFJKm9ugn2Q1FVQWnfHRGKudYFnGHwfocGkwPGdROO3X80d+hGhx09wrhDWydEhAAFPJXKyV
 D0JKTvV0k6EU9R4BbVQR62RlM7HOS3KgDssF2pOLEyxEGT72k8y67fw==
X-Gm-Gg: AYBFou0kE9jODP6QIf7x4sXB6TSBy96sfeBIeq0tK0gdja4r9KEhGj15o/NIZkoPVcL
 1HsTVQ3YtsCsCF5MkWFCkfrv5nVUvWj86nEuddLocRwvKfLAtNA5XVCmpbpeSTMF4M2LKYijtds
 usJ7Z2gd0ET9OQcWiPT+JSfXjbSOT9zpzKl8bevJV7/8FQezSvMF1eCpzomk2zYXLNtCLe7FV4P
 7v3DgHg5SJE2OyFXPztlYIg6XieX0GZ9GnMSpMh5xq+EDlJhcaZ3X9rli0uPWJhz3DBHDoZYltT
 6Hv4ZFRItnAoz3eE6SxhiGcV2K6SuDje2AiJjbKsEycXICkGxqqAQdrmQytCCK3+KJs04h4J/yZ
 zI4xcgYwcqJhhkUfnJCwznN8j1EuIvBHasU3Uqdiy9mVZj5MtoKMPuNF8uT2PChyi3g==
X-Received: by 2002:a5d:584b:0:b0:487:1004:3935 with SMTP id
 ffacd0b85a97d-48710043962mr3063699f8f.25.1789577486857; 
 Wed, 16 Sep 2026 09:51:26 -0700 (PDT)
X-Received: by 2002:a5d:584b:0:b0:487:1004:3935 with SMTP id
 ffacd0b85a97d-48710043962mr3063676f8f.25.1789577486519; 
 Wed, 16 Sep 2026 09:51:26 -0700 (PDT)
Received: from rh.redhat.corp
 (p200300f6af00a400b6f52cb1a2e89932.dip0.t-ipconnect.de.
 [2003:f6:af00:a400:b6f5:2cb1:a2e8:9932])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf33e01sm9655089f8f.23.2026.09.16.09.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 09:51:26 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eauger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, khushit.shah@nutanix.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v6 3/3] arm/kvm: get demuxed ID registers from kvm
Date: Wed, 16 Sep 2026 18:51:17 +0200
Message-ID: <20260916165117.39764-4-sebott@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916165117.39764-1-sebott@redhat.com>
References: <20260916165117.39764-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KILbfXelhmwVRhhroEXdoooQs7L24QuWyyjlOmFgQxA_1789577487
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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

From: Cornelia Huck <cohuck@redhat.com>

We now have the infrastructure in place to handle demuxed ID registers
from kvm. Use it to get the values that kvm emulates for CCSIDR_EL1.

Tested-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 target/arm/kvm.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ed99be7fd8..e4ef11945e 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -244,6 +244,44 @@ static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf,
     return ret;
 }
 
+
+/* CSSELR values supported by kvm; used to index KVM_REG_ARM_DEMUX_ID_CCSIDR */
+#define KVM_CSSELR_MAX 14
+/*
+ * QEMU historically supported CSSELR values 0..15. This difference doen't matter
+ * since CSSELR_EL1.Level == 0b111 is reserved and thus CSSELR values 14..15 will
+ * make CCSIDR read as zero. Larger CSSELR values will only be necessary when
+ * support for MTE Allocation Tag caches is added.
+ */
+#define QEMU_CSSELR_MAX 16
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
+        if (subindex >= QEMU_CSSELR_MAX) {
+            return -EINVAL;
+        } else if (subindex >= KVM_CSSELR_MAX) {
+            /* CSSELR_EL1.Level == 0b111 is reserved. */
+            ahcf->isar.idregs[index + subindex] = 0;
+            return 0;
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
@@ -454,6 +492,10 @@ static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
             /* Read the set of supported vector lengths. */
             arm_host_cpu_features.sve_vq_supported = kvm_arm_sve_get_vls(fd);
         }
+        /* Grab demuxed registers. */
+        for (int i = 0; i < QEMU_CSSELR_MAX; i++) {
+            err |= get_host_cpu_reg_demux(fd, ahcf, CCSIDR_EL1_IDX, i);
+        }
     }
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
-- 
2.55.0


