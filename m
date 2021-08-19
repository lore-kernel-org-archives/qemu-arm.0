Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp618726lfg;
        Thu, 19 Aug 2021 12:38:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqmLPhBIokI2hZpyDw8PssjZ3yDHe+HHBD5EON5/smkKJYMcSFDvt1WockxU36Bh2+Ki08
X-Received: by 2002:a05:6102:2004:: with SMTP id p4mr14558089vsr.5.1629401918087;
        Thu, 19 Aug 2021 12:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629401918; cv=none;
        d=google.com; s=arc-20160816;
        b=qVykhc53Udo0BQP5d4Qm1nWLp4MqjJKH/FkB18cIenzYHKiZkQ3QsnJUX4EV+D+v2j
         kLUzRYqc8I89MmaesIeg98ZziOEQMRrGt8hDp2LQF2wryEqYYQ5HtGIEeUBT2TtwYuPN
         pY2G2rOs6yShoYbNIS3GHIzyHBfNliVztkywibrit6BSpJ+NREXenplCx7nhhgyrp5dU
         JoEf5mJULRQQxdfWNA9T24C65pdPAPrZXFsVHCHL5+d+Mpb450yipV8EJrTG5022vHzg
         NE/Z6FAsy1fzyTnR1FH8W2KV1vy1wQ5NU75x7yvlnxV9cxU+dIFY6vVDiQJPiU2FnUeT
         qIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yO45+nK1BQOei6ySYl1qpyoEZ9mNjHXHcDF8uJJJvDo=;
        b=zCEusT9BxpSGGL1v9KZG5iBKomMPgR0AvzVujUtOi3bOIZdPMJN/g/fHWi+5mSAF8k
         bb/1wxn54VvRRtGuzk6g3s6Jg5hfEVPzrU4U5/SZYBbJ2wXc4bt8U4+Rj5nnNsXYL2hX
         ZAq+pRHAofTu1Un02rkVyxzRTs7Exp87VBnK/IWnggQjOwa0ci0VH51YbMLxwt1hjQML
         njJziiC6RCCzps2nqlfizMExcaVa7h73NVR62WTte9mPxUmndL9+eJy+ZMYLgZMjfGNR
         JhaLzDJ/Yz0wfXwn0vMLkBomw5q5PyOoo4O95iTo+c3eEcJ7tnyHGSJGDrIxQyeEaSUk
         0Eaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="CRK/0Flw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si2743341uai.228.2021.08.19.12.38.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 12:38:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="CRK/0Flw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGns5-0001SB-B5
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 15:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mGnrl-0001FI-3H
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 15:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mGnri-0000BB-4I
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 15:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629401893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yO45+nK1BQOei6ySYl1qpyoEZ9mNjHXHcDF8uJJJvDo=;
 b=CRK/0FlwFJWn6+DDoFwKAyxCysuStkCtiGFtL6p7hym/RaOU1uMk8wi4zBZo3DWSJA/wMb
 KPl82xAsVtdxbB+rGx30tMldwsUT/6tSVfvidTMMIgWDg8Y2CQypTpVyqVzFCu5dzdCU6q
 beFD5nr0W4Yq1YfXpvyi51IfWi5RB0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-fabAQ6_sMPCk4trnXJ0gBA-1; Thu, 19 Aug 2021 15:38:10 -0400
X-MC-Unique: fabAQ6_sMPCk4trnXJ0gBA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 256DB18C8C00;
 Thu, 19 Aug 2021 19:38:09 +0000 (UTC)
Received: from gator.home (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D9A71971B;
 Thu, 19 Aug 2021 19:38:07 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 4/4] target/arm/cpu64: Validate sve vector lengths are
 supported
Date: Thu, 19 Aug 2021 21:37:58 +0200
Message-Id: <20210819193758.149660-5-drjones@redhat.com>
In-Reply-To: <20210819193758.149660-1-drjones@redhat.com>
References: <20210819193758.149660-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8498iVSXSBAu

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
index 557fd4757740..9cb41c442600 100644
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
+                                          " than the maximum, sve%d\n",
+                                          vq * 128, max_vq * 128);
+                        return;
+                    }
+                }
             }
         }
     }
-- 
2.31.1

