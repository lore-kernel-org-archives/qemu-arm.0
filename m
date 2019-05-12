Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1641461wrg;
        Sun, 12 May 2019 01:37:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXsbyp58dZwyVSz3Zy+/aqXjbe4ziQW/smUNyvckZWdZzYC5AyQDdaQlh20hnNhHF1aKvp
X-Received: by 2002:ae9:e50f:: with SMTP id w15mr16460716qkf.297.1557650257246;
        Sun, 12 May 2019 01:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557650257; cv=none;
        d=google.com; s=arc-20160816;
        b=1JGPyD5/xrc2jPfu/3XloF6moN8yGW4GPtk8fP0l55imv1zfkNT6+mY59FZn93AL6P
         LV9BIDMLx3PMrG/y/R2Iz3wMGL38hCjqQDOINPuX5ChdOzPJxgnZq9yd+XAcFE+DiaqR
         Rmn2Bb+DA/CKtJoTla6ePfKO/Cok6zCfLu9EcAu2TSfoOJq6B2ISrYElURPiPu+HLkY0
         iY7UVDneTs6CfXecScdoQC3F2M1XxQ6t2ED/StSdsYtFFRXDZ5SiC2INZy6NhoIc4cbw
         EfHL3J2MkzwqQDXv8l6QLZrZ5g4Jea0YJs82YtZfEwARoPRs8FLOKdEB3Nmg1S79Yila
         mKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=/p/0QiNY4/OqwYmVpGCXKrcwhf1tS+rVRdLmSWUhxuA=;
        b=Rc0Lir8ZlDFftSxvyGYutk9x8DlG+IW4lqn3TYQysqaZ0z+8I6scmQCalDQmbivoiN
         83WEd3y5e8CORrJd5MdrFFs6VecukY39lOp4xSGdh7XsbuVLHmN7m7+VYo04FcLvZPnf
         CWamIXTfIXsCdSGPAeDDw8RYtlsRTZlwbwUUQp3uniE22f5VqMzw8eug1E5Ki1oZr2bE
         fY05MFBOR8R2c/2AEA15mtabXSqYXShp1p6F2vapXOuwlFgA5Yk5C0iSM8LHDSP4Fmly
         CUQ9kiY50FMMmZ/hmec5+c8BKwraLLRM6rNTwtV1I0EA0KeTeL+SD8f9wOhWWyF+zcvw
         hddg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id w64si1335403qka.94.2019.05.12.01.37.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 01:37:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C29781F13;
	Sun, 12 May 2019 08:37:36 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-87.ams2.redhat.com [10.36.116.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 571015D706;
	Sun, 12 May 2019 08:37:30 +0000 (UTC)
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
Subject: [PATCH 13/13] target/arm/kvm: host cpu: Add support for sve-vls-map
Date: Sun, 12 May 2019 10:36:24 +0200
Message-Id: <20190512083624.8916-14-drjones@redhat.com>
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Sun, 12 May 2019 08:37:36 +0000 (UTC)
X-TUID: tLM5snZbAGwl

Allow the host cpu type to enable SVE in guests with the sve-vls-map
cpu property.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu.c   |  1 +
 target/arm/cpu.h   |  2 ++
 target/arm/cpu64.c | 12 +++++++++---
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ea0e24bba8b6..a5c01ff42c78 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2222,6 +2222,7 @@ static void arm_host_initfn(Object *obj)
     ARMCPU *cpu = ARM_CPU(obj);
 
     kvm_arm_set_cpu_features_from_host(cpu);
+    aarch64_add_sve_vls_map_property(obj);
     arm_cpu_post_init(obj);
 }
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f0d0ce759ba8..13731ccb39f3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -976,11 +976,13 @@ int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
+void aarch64_add_sve_vls_map_property(Object *obj);
 #else
 static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
 static inline void aarch64_sve_change_el(CPUARMState *env, int o,
                                          int n, bool a)
 { }
+void aarch64_add_sve_vls_map_property(Object *obj) { }
 #endif
 
 target_ulong do_arm_semihosting(CPUARMState *env);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 94f3dd5b51e5..3b0b900a4d97 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -310,7 +310,8 @@ static void cpu_set_sve_vls_map(Object *obj, Visitor *v, const char *name,
             error_setg(&err, "SVE vector length map has unsupported lengths");
             error_append_hint(&err, "Valid vector lengths in range [1-%d]\n",
                               ARM_MAX_VQ);
-        } else if (cpu->sve_max_vq != ARM_MAX_VQ && cpu->sve_max_vq != -1 &&
+        } else if (cpu->sve_max_vq && cpu->sve_max_vq != ARM_MAX_VQ &&
+                   cpu->sve_max_vq != -1 &&
                    cpu->sve_max_vq != arm_cpu_fls64(cpu->sve_vls_map)) {
             /*
              * If the user provides both sve-max-vq and sve-vls-map, with
@@ -340,6 +341,12 @@ static void cpu_set_sve_vls_map(Object *obj, Visitor *v, const char *name,
     error_propagate(errp, err);
 }
 
+void aarch64_add_sve_vls_map_property(Object *obj)
+{
+    object_property_add(obj, "sve-vls-map", "uint64", cpu_get_sve_vls_map,
+                        cpu_set_sve_vls_map, NULL, NULL, &error_fatal);
+}
+
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
@@ -437,8 +444,7 @@ static void aarch64_max_initfn(Object *obj)
 
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_vq,
                         cpu_max_set_sve_vq, NULL, NULL, &error_fatal);
-    object_property_add(obj, "sve-vls-map", "uint64", cpu_get_sve_vls_map,
-                        cpu_set_sve_vls_map, NULL, NULL, &error_fatal);
+    aarch64_add_sve_vls_map_property(obj);
 }
 
 struct ARMCPUInfo {
-- 
2.20.1
