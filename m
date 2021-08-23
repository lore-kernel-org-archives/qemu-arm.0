Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2005780lfg;
        Mon, 23 Aug 2021 09:13:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxH3sx9YR02cTlScen7BnWIX+5uVnVtLQ/xrBm1qDcR8WLfJERcQhCZarV9WFDJeZQswVK9
X-Received: by 2002:aa7:d95a:: with SMTP id l26mr1941108eds.305.1629735184023;
        Mon, 23 Aug 2021 09:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629735184; cv=none;
        d=google.com; s=arc-20160816;
        b=wkaut2hov2hshFUi3W/Xir3wzG2vJkVRSsrrS8OXtqtl8NDalxGzUR8mranX35MlKF
         QpLR4oO0PLgPbj5+MxPLvIKUlJPhOz+mczRR26OQt25hMlw/z4deKqQ2OCTx3KM0OJ/h
         0SMbb1eFOPKsVSNWH6c+6IhEPfnBlv2XTXiL8D3+F/mkNow/o4TYH+B+d5KHfQoXe5ZF
         9RJjrE7bL3GnifLL6tueVmCnS8vpCURQ16wYK4j4uQM5330YJUJBjIt6OnTKjflfdd/T
         +9plShgxl6BKdRauGxbEKJBruHl8BymXm8NU0K22PnQHs0vf2z+JZksjlaF8T7/Lqcx6
         1eVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=T1X9/1+/2b9e9bKrOVFRBolcoPKcB32213cUj9YFLRg=;
        b=VP/bB8G58LAbF7aMGYYDk47SYfuYD1oKKCiXrmShs+A6sMiHFyttyi+qGFqMlLO5vU
         N5r7X8aS0MLbQXY5/fXJscdz501A4SctGKLxtQkcg+aDobR3xScxZkncKqy5Icd2F5s0
         EJdsw1lXX/JCpEgdTvr1nOLKDxM6G/MxykHM7b1mgaAWukQUatjiwndUdtzpZXNezXv9
         pUk85dNn1kxNlaww+54yriZfSDgch2poTYNOoyFc7a70bETuLrniwVaKDtj7sTctU93l
         nYvSV9p30VXaOExkYLgUYX990UVXfPHCBm23Q+QRBMduU2pfVdRlvhSv+ujdfv5TaHux
         97Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JwC9G3vK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id du3si5372397ejc.378.2021.08.23.09.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 09:13:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JwC9G3vK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mICZL-0008QW-2J
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 12:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICTb-0007ls-UV
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 12:07:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICTZ-0000Ji-C6
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 12:07:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629734824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T1X9/1+/2b9e9bKrOVFRBolcoPKcB32213cUj9YFLRg=;
 b=JwC9G3vKs+VtJQvm61d+NCWIrlhgudEKhO9+nfggF4lLXanQYNhUugqC6eCcZxb8RKs4fS
 wI8T8nuuO+hNYOHd+hMh/7C8W8AWRw7w9XLYeQZgSfN50P/Kz9M7b5qIXyb6tmXQFMtEQz
 yUf9yFKREFoNFrcdjPfR9VO4PRtJKks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-wB1VN-8NNU2JIIILM1sMng-1; Mon, 23 Aug 2021 12:07:03 -0400
X-MC-Unique: wB1VN-8NNU2JIIILM1sMng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11B443E741;
 Mon, 23 Aug 2021 16:07:02 +0000 (UTC)
Received: from gator.redhat.com (unknown [10.40.194.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3215560CC9;
 Mon, 23 Aug 2021 16:07:00 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 4/4] target/arm/cpu64: Validate sve vector lengths are
 supported
Date: Mon, 23 Aug 2021 18:06:47 +0200
Message-Id: <20210823160647.34028-5-drjones@redhat.com>
In-Reply-To: <20210823160647.34028-1-drjones@redhat.com>
References: <20210823160647.34028-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 ishii.shuuichir@fujitsu.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NMaFohS/FlFG

Future CPU types may specify which vector lengths are supported.
We can apply nearly the same logic to validate those lengths
as we do for KVM's supported vector lengths. We merge the code
where we can, but unfortunately can't completely merge it because
KVM requires all vector lengths, power-of-two or not, smaller than
the maximum enabled length to also be enabled. The architecture
only requires all the power-of-two lengths, though, so TCG will
only enforce that.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu64.c | 101 ++++++++++++++++++++-------------------------
 1 file changed, 45 insertions(+), 56 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 557fd4757740..2f0cbddab568 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -329,35 +329,26 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
                     break;
                 }
             }
-            max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
-            bitmap_andnot(cpu->sve_vq_map, cpu->sve_vq_supported,
-                          cpu->sve_vq_init, max_vq);
-            if (max_vq == 0 || bitmap_empty(cpu->sve_vq_map, max_vq)) {
-                error_setg(errp, "cannot disable sve%d", vq * 128);
-                error_append_hint(errp, "Disabling sve%d results in all "
-                                  "vector lengths being disabled.\n",
-                                  vq * 128);
-                error_append_hint(errp, "With SVE enabled, at least one "
-                                  "vector length must be enabled.\n");
-                return;
-            }
         } else {
             /* Disabling a power-of-two disables all larger lengths. */
-            if (test_bit(0, cpu->sve_vq_init)) {
-                error_setg(errp, "cannot disable sve128");
-                error_append_hint(errp, "Disabling sve128 results in all "
-                                  "vector lengths being disabled.\n");
-                error_append_hint(errp, "With SVE enabled, at least one "
-                                  "vector length must be enabled.\n");
-                return;
-            }
-            for (vq = 2; vq <= ARM_MAX_VQ; vq <<= 1) {
+            for (vq = 1; vq <= ARM_MAX_VQ; vq <<= 1) {
                 if (test_bit(vq - 1, cpu->sve_vq_init)) {
                     break;
                 }
             }
-            max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
-            bitmap_complement(cpu->sve_vq_map, cpu->sve_vq_init, max_vq);
+        }
+
+        max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
+        bitmap_andnot(cpu->sve_vq_map, cpu->sve_vq_supported,
+                      cpu->sve_vq_init, max_vq);
+        if (max_vq == 0 || bitmap_empty(cpu->sve_vq_map, max_vq)) {
+            error_setg(errp, "cannot disable sve%d", vq * 128);
+            error_append_hint(errp, "Disabling sve%d results in all "
+                              "vector lengths being disabled.\n",
+                              vq * 128);
+            error_append_hint(errp, "With SVE enabled, at least one "
+                              "vector length must be enabled.\n");
+            return;
         }
 
         max_vq = find_last_bit(cpu->sve_vq_map, max_vq) + 1;
@@ -393,46 +384,44 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
     assert(max_vq != 0);
     bitmap_clear(cpu->sve_vq_map, max_vq, ARM_MAX_VQ - max_vq);
 
-    if (kvm_enabled()) {
-        /* Ensure the set of lengths matches what KVM supports. */
-        bitmap_xor(tmp, cpu->sve_vq_map, cpu->sve_vq_supported, max_vq);
-        if (!bitmap_empty(tmp, max_vq)) {
-            vq = find_last_bit(tmp, max_vq) + 1;
-            if (test_bit(vq - 1, cpu->sve_vq_map)) {
-                if (cpu->sve_max_vq) {
-                    error_setg(errp, "cannot set sve-max-vq=%d",
-                               cpu->sve_max_vq);
-                    error_append_hint(errp, "This KVM host does not support "
-                                      "the vector length %d-bits.\n",
-                                      vq * 128);
-                    error_append_hint(errp, "It may not be possible to use "
-                                      "sve-max-vq with this KVM host. Try "
-                                      "using only sve<N> properties.\n");
-                } else {
-                    error_setg(errp, "cannot enable sve%d", vq * 128);
-                    error_append_hint(errp, "This KVM host does not support "
-                                      "the vector length %d-bits.\n",
-                                      vq * 128);
-                }
+    /* Ensure the set of lengths matches what is supported. */
+    bitmap_xor(tmp, cpu->sve_vq_map, cpu->sve_vq_supported, max_vq);
+    if (!bitmap_empty(tmp, max_vq)) {
+        vq = find_last_bit(tmp, max_vq) + 1;
+        if (test_bit(vq - 1, cpu->sve_vq_map)) {
+            if (cpu->sve_max_vq) {
+                error_setg(errp, "cannot set sve-max-vq=%d", cpu->sve_max_vq);
+                error_append_hint(errp, "This CPU does not support "
+                                  "the vector length %d-bits.\n", vq * 128);
+                error_append_hint(errp, "It may not be possible to use "
+                                  "sve-max-vq with this CPU. Try "
+                                  "using only sve<N> properties.\n");
             } else {
+                error_setg(errp, "cannot enable sve%d", vq * 128);
+                error_append_hint(errp, "This CPU does not support "
+                                  "the vector length %d-bits.\n", vq * 128);
+            }
+            return;
+        } else {
+            if (kvm_enabled()) {
                 error_setg(errp, "cannot disable sve%d", vq * 128);
                 error_append_hint(errp, "The KVM host requires all "
                                   "supported vector lengths smaller "
                                   "than %d bits to also be enabled.\n",
                                   max_vq * 128);
-            }
-            return;
-        }
-    } else {
-        /* Ensure all required powers-of-two are enabled. */
-        for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
-            if (!test_bit(vq - 1, cpu->sve_vq_map)) {
-                error_setg(errp, "cannot disable sve%d", vq * 128);
-                error_append_hint(errp, "sve%d is required as it "
-                                  "is a power-of-two length smaller than "
-                                  "the maximum, sve%d\n",
-                                  vq * 128, max_vq * 128);
                 return;
+            } else {
+                /* Ensure all required powers-of-two are enabled. */
+                for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
+                    if (!test_bit(vq - 1, cpu->sve_vq_map)) {
+                        error_setg(errp, "cannot disable sve%d", vq * 128);
+                        error_append_hint(errp, "sve%d is required as it "
+                                          "is a power-of-two length smaller "
+                                          "than the maximum, sve%d\n",
+                                          vq * 128, max_vq * 128);
+                        return;
+                    }
+                }
             }
         }
     }
-- 
2.31.1

