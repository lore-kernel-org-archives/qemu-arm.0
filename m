Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2A1C79FB7
	for <qemu-arm@archiver.kernel.org>; Wed,  9 Sep 2026 14:43:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x4JWF-0000Ik-Bv; Wed, 09 Sep 2026 10:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1x4JWC-0000IN-Sp
 for qemu-arm@nongnu.org; Wed, 09 Sep 2026 10:43:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1x4JWB-0005jl-Ff
 for qemu-arm@nongnu.org; Wed, 09 Sep 2026 10:43:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788964998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wa+ZIKa32ONbC8JYjuP/+EOTZoP9I76CXnFoa7ddgXo=;
 b=WTiaD2knL/hk8Gn4LqQnlLOGuJZrBsfM9R58wMRj8hHhIQiJLojUm7Buv119FG84Z/mg1i
 vL5X2gXOnIkoiJtReF0zAN+KTeAszcNbNbGjG5b8SVkyw5Mw70P/lFB9THSbMoJoWEhYbn
 kMnmLEf9XXUXh0eBNtvn/8kjwj+dg3s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-9mo6tPkxNHm4FMPOjsUCNQ-1; Wed, 09 Sep 2026 10:42:08 -0400
X-MC-Unique: 9mo6tPkxNHm4FMPOjsUCNQ-1
X-Mimecast-MFC-AGG-ID: 9mo6tPkxNHm4FMPOjsUCNQ_1788964924
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-482f41ca436so5365863f8f.1
 for <qemu-arm@nongnu.org>; Wed, 09 Sep 2026 07:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788964924; x=1789569724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wa+ZIKa32ONbC8JYjuP/+EOTZoP9I76CXnFoa7ddgXo=;
 b=s37mWVvYApebuMDlK1J0/igZtH2YdhjEtnlBKeToJyAb9OQWQtttag9+8OLuFD0ixY
 ES/d8AaBR6BFwgct0YIgUSs4DkRX7IahGwCRShOScTJOgTx6oWvotUXnpPzzardnndG+
 jfogsAu8KxI6GqXOi/O0jAocmrVeAfBaMQwfXAdDo09TxMhsmCIuigQ50auThJczZTK1
 9RPPYASedWhPAfa5XO3oPwsMpQhrJGx9anTxGZx3YRO1OUaa6AULsII5XQx+3QDvCYB5
 Pl+dFpsGTJiQBPG482bx6hFmNeUIuZVu93vNlJ5W5N3vuK+P4dSg2vak98+fE2pvucb7
 nGTg==
X-Gm-Message-State: AFuF++lPmh6rGTO2w05hDl+WpkA+O2ioTMrOjb5fEZ/LqjlHa2kj13k2
 z+nLc1i0BDXtkho+AQLgdnnxwIhP59+o9l777ztW9eXxogtV4eyeweMHju388kc1bMEvEw77TL5
 SdY5pc11aV+yvPZDoKgbUS6ewfMMWppSBquEOgEHNm8y7DHddNdKnWQ==
X-Gm-Gg: AYBFou0SH4lv0AMaiDMGFCABxpaolEEe7h+dCkK6p+n3CYmR/rmsf49cwlqE5Z3m5Fk
 hhZttZHRDd11VQ+MuD52bigqxdLZcWJTzKYYxlN1ubueVflebw9WLcVDD0lOyGWv1O9lbwYr+50
 Nqi3q0qu+j6+SCeLWyLLPus/a7eBW0kcNSwcHK2XDg1Yo48DMaCrPR0X6Ky65h8tmTT6zGJYeRT
 +lAZpIqvQHe3FhNLv9lZ1KF3AUDYgKvge2ed+qpzd5FsM7Rec8KKV8/w2CCw8lRtAlKbAp7rDAm
 73XQ4M4jC6IyQ58i3cloFu1aRHirO7y5Nt8bpEXoPuKRV5Y8GGV7tQfoWBgdjVz2vSOCsee6H96
 ipqMYvuOqvpwqiIY1rGsSJABLJV3fIC203ePAV1F1iDmFLhMxqhUnjQcgIjNizFpduw==
X-Received: by 2002:a5d:6f10:0:b0:485:8a46:7061 with SMTP id
 ffacd0b85a97d-4858a467296mr33247751f8f.51.1788964924425; 
 Wed, 09 Sep 2026 07:42:04 -0700 (PDT)
X-Received: by 2002:a5d:6f10:0:b0:485:8a46:7061 with SMTP id
 ffacd0b85a97d-4858a467296mr33247719f8f.51.1788964924005; 
 Wed, 09 Sep 2026 07:42:04 -0700 (PDT)
Received: from rh.redhat.corp
 (p200300f6af0e1b00fa6b14698c8a91c3.dip0.t-ipconnect.de.
 [2003:f6:af0e:1b00:fa6b:1469:8c8a:91c3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485958f1493sm32933395f8f.37.2026.09.09.07.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 07:42:02 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eauger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, khushit.shah@nutanix.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v5 3/3] arm/kvm: get demuxed ID registers from kvm
Date: Wed,  9 Sep 2026 16:41:51 +0200
Message-ID: <20260909144151.26803-4-sebott@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909144151.26803-1-sebott@redhat.com>
References: <20260909144151.26803-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SEDseP2qwCm_5ZC9HaxDK1KVdGW1xN6vhNXzy0HVJ6I_1788964924
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 target/arm/kvm.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ed99be7fd8..1230acaff0 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -244,6 +244,33 @@ static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf,
     return ret;
 }
 
+
+/* CSSELR values supported by kvm; used to index KVM_REG_ARM_DEMUX_ID_CCSIDR */
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
@@ -454,6 +481,10 @@ static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
             /* Read the set of supported vector lengths. */
             arm_host_cpu_features.sve_vq_supported = kvm_arm_sve_get_vls(fd);
         }
+        /* Grab demuxed registers. */
+        for (int i = 0; i < CSSELR_MAX; i++) {
+            err |= get_host_cpu_reg_demux(fd, ahcf, CCSIDR_EL1_IDX, i);
+        }
     }
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
-- 
2.55.0


