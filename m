Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AFBC43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 13:36:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfHaa-00087Q-9d; Thu, 02 Jul 2026 09:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wfHaX-000861-UD
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 09:36:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wfHaV-00017n-S6
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 09:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782999378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HITbRUTeXA1wLotn5EvEHiy6VVopLkZs61O7SoCF+I=;
 b=bb6wWASFGDDtGwpQwdsUJOEBHetNNtoZi2vP1OCwVFP3fNE0EF28wZ4XOFJOmHlK9YWa5u
 YyHNaUnR/BAYIiog1pMFN9ZBvBi96alfaY5c+QFeYRxrrmOXOGs/gRUDQCexziBD3jDMjQ
 lNG+M+wO9Xx5l+Gpg7qvtv5kBQQ5jlA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-n5jAZu3EOJK4bOyz5Bgsdw-1; Thu, 02 Jul 2026 09:36:16 -0400
X-MC-Unique: n5jAZu3EOJK4bOyz5Bgsdw-1
X-Mimecast-MFC-AGG-ID: n5jAZu3EOJK4bOyz5Bgsdw_1782999375
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-493b786d550so18973935e9.0
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 06:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782999375; x=1783604175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6HITbRUTeXA1wLotn5EvEHiy6VVopLkZs61O7SoCF+I=;
 b=d5DUaIy3YqeY6snrkb25pumCbUCpgJb6hU2XXrPs9ldmdbzMhtzCWNjM6zy+nS2M1f
 V2j5csEQoG+lZh25efP93cJRbQpfrnIYsANXpcmUTRQjNSKXyJk7bzLOBylnLDXPBcS9
 IbCO9B8b3INGcPVabNzQZvXz5FfSb9gxE7Ak5wnK0k0kZZHfVn47Doin0oDw7gXlgL4e
 umWSpzHFhkqoBU5aJBdUbDB5owtS8v1gE941y7WFBfbZxpY7/Tx6muD8h9uquCgiboEY
 QIkvc45wfvgXRLClghCqPonFTupdCGrhGH8SgzLqvKFlUf6erzWY5jby8tu6xTMtjSMr
 Fx5A==
X-Gm-Message-State: AOJu0YxAtOLdeLFW06fZukFawIi8CCxAWnXKXozdpLdk35CUoHU9zDvw
 FpxuTLWwLJZTgs/xMKxWlZsvumJQlFcZMzQ1J02reB9TP4pTDFihQJXvw3sBiasIs2IhWCWhMxb
 /xFlaxpEtQUVl9+F3ztdS9PP+msgAf/ZjzkNj79sGoJJ8IqBJt9oI4g==
X-Gm-Gg: AfdE7cn6xqVaVf6dOku9qnFQeIXxiZQpX03WrxpjJio03bgPriH6cWc1KJanL7ViS/U
 sM1RZg6Mk31GZgG4K6JQCdcQhSmr0cAC1Z5ks4h9MtVhSZFgyiqK+fd5IgvG+4rjk191GiLOPbb
 ADkFDT7xnuSxPju5UKtRQSzS0D1Gb6XexzvxQsJ1HRXeHBB1ZZBCF6T1jyfg8V/bLJdWRq8QJQ0
 I4v9DEXrGXQlZdG6iAFvhXZWkeSymc4/rYUpkZnXII/ZGfKN1XY98EIIUytQ73i85Xg94q69hLP
 G48dHhwXm/ssbfa8wF3jXMFOkQzpVe3Qz/j2uLSCpzKlHVDhIFeEolWHi1/Ayue2obBjqmQSTAH
 KwiYeamHmZ0G1WNx4iQSCaLQRyU93pGuw+e90XsMmHj0CfJ95Y3deToHkwBA3JV+9hyJ/fKGcHw
 ==
X-Received: by 2002:a05:600c:820d:b0:490:b00c:8e6a with SMTP id
 5b1f17b1804b1-493c83a5b92mr16574205e9.28.1782999375446; 
 Thu, 02 Jul 2026 06:36:15 -0700 (PDT)
X-Received: by 2002:a05:600c:820d:b0:490:b00c:8e6a with SMTP id
 5b1f17b1804b1-493c83a5b92mr16573725e9.28.1782999375055; 
 Thu, 02 Jul 2026 06:36:15 -0700 (PDT)
Received: from rh.fritz.box
 (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db3dbb01sm9135980f8f.1.2026.07.02.06.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:36:14 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eauger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v4 3/3] arm/kvm: get demuxed ID registers from kvm
Date: Thu,  2 Jul 2026 15:36:06 +0200
Message-ID: <20260702133606.34529-4-sebott@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702133606.34529-1-sebott@redhat.com>
References: <20260702133606.34529-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A05JTThMU_yuZi0p_QylNKvD1pWFi8WThOl1NeUQk9o_1782999375
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
 target/arm/kvm.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index a54ef51ec2..f57e86b441 100644
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
2.54.0


