Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1641320wrg;
        Sun, 12 May 2019 01:37:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqytfTytn8QSENkoB0w4ihIck1dX4TKHXJdPiJGoGvRoZimTPHrd+DWCOo576ALqkBfw0IZY
X-Received: by 2002:a37:e409:: with SMTP id y9mr16478920qkf.109.1557650242481;
        Sun, 12 May 2019 01:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557650242; cv=none;
        d=google.com; s=arc-20160816;
        b=SR3BDnO6n76SofizLHJYAcmG1L0S+ctbIlO3TquxLznKPA271M4iigeWZxMH0UxUvs
         +jDNQ5tmK4ljFitb9u5qQ+a9ahAUbH5krmhCpdPmJ3Ge4dj5ebRKP2TVx4/okolOlbbd
         IBLU69NvTdW/RTA1NQLBgsq7+lgIlQfj5EVm4x8XG2zDaisE9tyC99Ym2fPVgOdh8f+i
         93wogMBR82Zd5JXH9xFkxP8Q9OXmmLOL7y7H1eoezC68hQoqFTiD0Mpbsw/e6pD61ilS
         bNWvKJW7174x89GkHDLhVlJsXHrrErF/cugIue8kT25SqqAnQJHzqNpKoulfPGpBTfHw
         lPyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=wEGdwDfJWObqQEOzLF+HbVAGj4rS90N4t+MVtFaZghQ=;
        b=x9qUNafTthnAaDoocqZZcjdl/gmPS9pWwDn2QZhgvJ/EHjY9lf2KJmjn8kCLnZXXNN
         95FIrMdnZIThr5+UpERBDwW3Sq1BzvSEw82gb09zOZx/0RwhVO8tYIMEhhgM3qzo9xiA
         lvunBGp4YCj90GpvnAmRUebnTj4jMEYjnf53hpouiUJWjwkUkP9k986B/t+PR35RatUM
         3zDEf+36wVSEcYKqVChZcPmz79CQ6XpbNS/gPHm888OWfwDTU06qXzZwzG83BDAMXL5C
         C/8PDHnL+pFtGz7IFsyCfHK82tSa8Sr/r0c4zVqJIMIW2xwAHVqrVKvK1vQI40pqAZoi
         9KZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l23si300075qtj.161.2019.05.12.01.37.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 01:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A24F03084248;
	Sun, 12 May 2019 08:37:21 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-87.ams2.redhat.com [10.36.116.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3754E5D706;
	Sun, 12 May 2019 08:37:16 +0000 (UTC)
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
Subject: [PATCH 10/13] target/arm/monitor: kvm: only return valid sve vector sets
Date: Sun, 12 May 2019 10:36:21 +0200
Message-Id: <20190512083624.8916-11-drjones@redhat.com>
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Sun, 12 May 2019 08:37:21 +0000 (UTC)
X-TUID: nh4P5gvy2uyx

While the TCG SVE implementation can implement all vector lengths
which are a quadword multiple, up to some maximum length, KVM can
only provide what the host supports, and not all multiples are
required to be supported by the architecture. With this patch
we extend the QMP query to ask KVM for the valid vectors when KVM
is enabled.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/monitor.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 8b2afa255c92..3e13dd7c7b7a 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -84,6 +84,41 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
     return head;
 }
 
+#ifdef CONFIG_KVM
+static SVEVectorLengths *qmp_kvm_sve_vls_get(void)
+{
+    CPUArchState *env = mon_get_cpu_env();
+    ARMCPU *cpu = arm_env_get_cpu(env);
+    uint64_t sve_vls[KVM_ARM64_SVE_VLS_WORDS];
+    SVEVectorLengths *vls = g_new(SVEVectorLengths, 1);
+    intList **v = &vls->vls;
+    int ret, i;
+
+    ret = kvm_arm_get_sve_vls(CPU(cpu), sve_vls);
+    if (ret <= 0) {
+        *v = g_new0(intList, 1); /* one vl of 0 means none supported */
+        return vls;
+    }
+
+    for (i = KVM_ARM64_SVE_VQ_MIN; i <= ret; ++i) {
+        int bitval = (sve_vls[(i - KVM_ARM64_SVE_VQ_MIN) / 64] >>
+                      ((i - KVM_ARM64_SVE_VQ_MIN) % 64)) & 1;
+        if (bitval) {
+            *v = g_new0(intList, 1);
+            (*v)->value = i;
+            v = &(*v)->next;
+        }
+    }
+
+    return vls;
+}
+#else
+static SVEVectorLengths *qmp_kvm_sve_vls_get(void)
+{
+    return NULL;
+}
+#endif
+
 static SVEVectorLengths *qmp_sve_vls_get(void)
 {
     CPUArchState *env = mon_get_cpu_env();
@@ -130,7 +165,13 @@ static SVEVectorLengths *qmp_sve_vls_dup_and_truncate(SVEVectorLengths *vls)
 SVEVectorLengthsList *qmp_query_sve_vector_lengths(Error **errp)
 {
     SVEVectorLengthsList *vls_list = g_new0(SVEVectorLengthsList, 1);
-    SVEVectorLengths *vls = qmp_sve_vls_get();
+    SVEVectorLengths *vls;
+
+    if (kvm_enabled()) {
+        vls = qmp_kvm_sve_vls_get();
+    } else {
+        vls = qmp_sve_vls_get();
+    }
 
     while (vls) {
         vls_list->value = vls;
-- 
2.20.1
