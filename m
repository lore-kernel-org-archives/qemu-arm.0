Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1641418wrg;
        Sun, 12 May 2019 01:37:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMl8HGw1oLzMf3FdE8f+5PH5qgmEevyJ2WD5H7RhW29GsHHUlWLg0RlIVuQB7iw7bAlxfE
X-Received: by 2002:ac8:25d9:: with SMTP id f25mr18073526qtf.249.1557650251562;
        Sun, 12 May 2019 01:37:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557650251; cv=none;
        d=google.com; s=arc-20160816;
        b=kZywS8Fy2aMhmaYamch/FlfjJjPyBRRKyvnaNci0b9kIvqRhuUznyq0pUEdO4jRhls
         9xlqewxA+FNibQvz7gsAByzL6OZgYWVb1GME8KNBPp4k05J8bSErnNMXPKqJEWL+V0n4
         UYq4U41YmVWde+aLO/5GhtsGYeMr5oUjCWXqHvp72aTzaxl9LWjCs37sbMExsFfRYglX
         gM4qprUQsgSeaW45Ix27+Y+AoN2ApWWC+myH12K07+qT598frOxkJ9aC1mnxZuxTjSNv
         L4msApbUsAes4CntMbvyhMkpq9fDoCPbwgVEo4VJxijmxARAc60oi6uDa3oRHhWbzdSv
         jgUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=L5i8wpTTm3voVOgGfd+6IZq7a5rq1Jc4JhXgOdmkkzk=;
        b=1BKcGY8Ptwgp/icDe+t57xuAJGxQ8W17F0skLK4PqU5KH0dbBeln+NoJJBgzX8X7+w
         DI0Svx0tn6bpiQ1HrRBTqq2kgR131Hj115/OL89nvw1xs4VaozNTMHO32toNKxSuvjax
         AqrghFlNP6v1MWKqGJ6vIQnu6P8p88JUaMA00EnFA96xconmVbGuLyoLo8magH0dQldI
         cQ/JweYpoi3H7QTK6tIo+vX0VfHuWXutwWvnV/oL90u/JbOFu4jpZDk5LDnA/tMFBiFE
         csKcn0291vVvxXkNNT0RdovYfEsc1suix5NAg10/pjnaVTssnAhb7dux0TZbrjxk83MI
         NNcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c25si1784389qta.234.2019.05.12.01.37.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 01:37:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91DED3082E4C;
	Sun, 12 May 2019 08:37:30 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-87.ams2.redhat.com [10.36.116.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D26D5D706;
	Sun, 12 May 2019 08:37:25 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	abologna@redhat.com
Subject: [PATCH 12/13] target/arm/kvm: max cpu: Add support for sve-vls-map
Date: Sun, 12 May 2019 10:36:23 +0200
Message-Id: <20190512083624.8916-13-drjones@redhat.com>
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Sun, 12 May 2019 08:37:30 +0000 (UTC)
X-TUID: 7FWotXAxHgU3

The max cpu type can have its SVE vector lengths explicitly set
with the sve-vls-map property. This patch allows that property
to work when KVM is in use. The map must conform to additional
constraints for KVM which are checked at vcpu init.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu64.c |  7 +++---
 target/arm/kvm64.c | 56 +++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 56 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9ac702d54136..94f3dd5b51e5 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -310,7 +310,7 @@ static void cpu_set_sve_vls_map(Object *obj, Visitor *v, const char *name,
             error_setg(&err, "SVE vector length map has unsupported lengths");
             error_append_hint(&err, "Valid vector lengths in range [1-%d]\n",
                               ARM_MAX_VQ);
-        } else if (cpu->sve_max_vq != ARM_MAX_VQ &&
+        } else if (cpu->sve_max_vq != ARM_MAX_VQ && cpu->sve_max_vq != -1 &&
                    cpu->sve_max_vq != arm_cpu_fls64(cpu->sve_vls_map)) {
             /*
              * If the user provides both sve-max-vq and sve-vls-map, with
@@ -433,13 +433,12 @@ static void aarch64_max_initfn(Object *obj)
 #endif
 
         cpu->sve_max_vq = ARM_MAX_VQ;
-
-        object_property_add(obj, "sve-vls-map", "uint64", cpu_get_sve_vls_map,
-                            cpu_set_sve_vls_map, NULL, NULL, &error_fatal);
     }
 
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_vq,
                         cpu_max_set_sve_vq, NULL, NULL, &error_fatal);
+    object_property_add(obj, "sve-vls-map", "uint64", cpu_get_sve_vls_map,
+                        cpu_set_sve_vls_map, NULL, NULL, &error_fatal);
 }
 
 struct ARMCPUInfo {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 11c6334a7c08..5506f019c190 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -685,9 +685,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
     } else {
         unset_feature(&env->features, ARM_FEATURE_PMU);
     }
-    if (cpu->sve_max_vq) {
+    if (cpu->sve_max_vq || cpu->sve_vls_map) {
         if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_SVE)) {
-            if (cpu->sve_max_vq == -1) {
+            if (cpu->sve_max_vq == -1 && !cpu->sve_vls_map) {
                 cpu->sve_max_vq = 0;
             } else {
                 error_report("This KVM host does not support SVE");
@@ -704,12 +704,62 @@ int kvm_arch_init_vcpu(CPUState *cs)
         return ret;
     }
 
-    if (cpu->sve_max_vq) {
+    if (cpu->sve_max_vq || cpu->sve_vls_map) {
         uint64_t sve_vls[KVM_ARM64_SVE_VLS_WORDS];
         ret = kvm_arm_get_sve_vls(cs, sve_vls);
         if (ret < 0) {
             return ret;
         }
+        if (cpu->sve_vls_map) {
+            uint64_t ovls;
+            int i;
+
+            /*
+             * We currently only support a single VLS word, as that should
+             * be sufficient for some time (vq=64 means a 8192-bit vector
+             * and KVM currently only supports up to 2048-bit vectors).
+             * The choice to only support a single word for now is due to
+             * the need to input it on the command line. It's much simpler
+             * to input a word as a cpu property than an array of words.
+             * So for now just warn if we detect our assumption was wrong.
+             */
+            for (i = 1; i < KVM_ARM64_SVE_VLS_WORDS; ++i) {
+                if (sve_vls[i]) {
+                    warn_report("KVM supports vector lengths larger than "
+                                "sve-vls-map can select");
+                    sve_vls[i] = 0;
+                }
+            }
+
+            ovls = sve_vls[0];
+            sve_vls[0] = cpu->sve_vls_map;
+
+            if (cpu->sve_vls_map & ~ovls) {
+                error_report("sve-vls-map=0x%lx is not valid on this host "
+                             "which supports 0x%lx", cpu->sve_vls_map, ovls);
+                return -EINVAL;
+            }
+
+            i = arm_cpu_fls64(cpu->sve_vls_map);
+            if (cpu->sve_max_vq && cpu->sve_max_vq != -1 &&
+                cpu->sve_max_vq != i) {
+                error_report("sve-vls-map and sve-max-vq are inconsistent");
+                return -EINVAL;
+            }
+            cpu->sve_max_vq = i;
+
+            /*
+             * sve-vls-map must have all the same vector lengths up to its
+             * max vq that the host supports.
+             */
+            if (cpu->sve_vls_map != (ovls & (BIT_MASK(cpu->sve_max_vq) - 1))) {
+                error_report("sve-vls-map=0x%lx is not valid on this host "
+                             "which supports 0x%lx", cpu->sve_vls_map, ovls);
+                error_printf("All host vector lengths up to %d must also "
+                             "be selected.\n", cpu->sve_max_vq);
+                return -EINVAL;
+            }
+        }
         if (cpu->sve_max_vq == -1) {
             cpu->sve_max_vq = ret;
         } else if (cpu->sve_max_vq > ret) {
-- 
2.20.1
