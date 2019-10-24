Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2271655wrq;
        Thu, 24 Oct 2019 05:18:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8Y6u8EBgGZgCFRyJ4jBQPwQHIi27wE419/E7ojSUPeAMww6ORoh13Dt1OLm3lhKMJcAf/
X-Received: by 2002:ac8:fa1:: with SMTP id b30mr3729676qtk.71.1571919537455;
        Thu, 24 Oct 2019 05:18:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571919537; cv=none;
        d=google.com; s=arc-20160816;
        b=a9OKqH/tkBQc0tMGtFtnutsMNYcrgnyX35QY6Fq2DHA0uIzAOi7O8iNmDWQLG6bNqh
         4MW43DBDu+N4JUvIYVNjERvuKN5/qAa3CJubDyfUM+jX6gQ6XNp8JqHu6FL+BXRAAkrX
         Lgizy+lx76l6k/FdFl5A7kEWklw/5zkTtZZ8dfq7JiS6mt9BPvutwE/YkQSkYRhUYQZR
         3aYztaHDdLpsHVrEkApLaUEdsVFfskXl1VUdlotpn48aPdwqymQTv57EO7pu2t+2Kd6Z
         qTmlqNfKvdxl7U/9FvdH2Q0cuIZT4tlMzGVisqG0SdViebtBT7XD9HQN5pLASdHs0PFS
         4htw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZKBy1Y1Kkn9dGmibAmsiz6a0MAdBDihiPMDDXFne0IQ=;
        b=OmPQuAHucTkthBYNYkYa+GN2PN2J9OYX3+ZMbSwzZA2SAQ9GSv9IUqinRPCqik9OgP
         ku7pLnGhhDhnoAVVamzlOSoI1RCogkz3pdzdvi9n2xAlHGO91CbZLj3NGJQRX3GCLOoL
         LlHim5+SA40lynjHvSajiVhffV2veI566W1bNnU0XCV+i3eEmHXZPTluWAuWcMhmIo2D
         AEBkZ2Qyh+1kV7zUQsUzxBMriryMxgDRcSsnW4bXq8VPQFkyM9dn0qgPD5Ka027f0s5m
         h2K4cFPHx1xNQHAzTt4z7ECgXk51rc2eO6Luo1F+vTGVhoAkaJbmL5odCA/xu0guEBr/
         0qwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MvxghL51;
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id d145si19930656qkb.69.2019.10.24.05.18.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 05:18:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MvxghL51;
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571919536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZKBy1Y1Kkn9dGmibAmsiz6a0MAdBDihiPMDDXFne0IQ=;
	b=MvxghL51bC6ASvYALqd6U4hjD6kMxVB5gNH/G0DTNU0Vs/mknyCVdrmmVEEJ43vnwKusGn
	qZP9qI1tJY+5NgzE7A/JKo/VhnrAi/hOBhBomTePM+7h/zz24d0Pw7JsNZ3D7Y4ca9wdCK
	JSTiVIcFxz0U6kCij9/7DzXyTZ4LGO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-Jn5c4ILVMNeA7xQzhloKuw-1; Thu, 24 Oct 2019 08:18:52 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 111CE1800D6B;
	Thu, 24 Oct 2019 12:18:51 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 609735E9C0;
	Thu, 24 Oct 2019 12:18:46 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	eric.auger@redhat.com,
	beata.michalska@linaro.org,
	m.mizuma@jp.fujitsu.com,
	alex.bennee@linaro.org,
	Dave.Martin@arm.com,
	armbru@redhat.com,
	eblake@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v7 7/9] target/arm/kvm: scratch vcpu: Preserve input kvm_vcpu_init features
Date: Thu, 24 Oct 2019 14:18:06 +0200
Message-Id: <20191024121808.9612-8-drjones@redhat.com>
In-Reply-To: <20191024121808.9612-1-drjones@redhat.com>
References: <20191024121808.9612-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Jn5c4ILVMNeA7xQzhloKuw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-TUID: qNyqVcYZ12Dl

kvm_arm_create_scratch_host_vcpu() takes a struct kvm_vcpu_init
parameter. Rather than just using it as an output parameter to
pass back the preferred target, use it also as an input parameter,
allowing a caller to pass a selected target if they wish and to
also pass cpu features. If the caller doesn't want to select a
target they can pass -1 for the target which indicates they want
to use the preferred target and have it passed back like before.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
Reviewed-by: Beata Michalska <beata.michalska@linaro.org>
---
 target/arm/kvm.c   | 20 +++++++++++++++-----
 target/arm/kvm32.c |  6 +++++-
 target/arm/kvm64.c |  6 +++++-
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index f07332bbda30..5b82cefef608 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -66,7 +66,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpu=
s_to_try,
                                       int *fdarray,
                                       struct kvm_vcpu_init *init)
 {
-    int ret, kvmfd =3D -1, vmfd =3D -1, cpufd =3D -1;
+    int ret =3D 0, kvmfd =3D -1, vmfd =3D -1, cpufd =3D -1;
=20
     kvmfd =3D qemu_open("/dev/kvm", O_RDWR);
     if (kvmfd < 0) {
@@ -86,7 +86,14 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cp=
us_to_try,
         goto finish;
     }
=20
-    ret =3D ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, init);
+    if (init->target =3D=3D -1) {
+        struct kvm_vcpu_init preferred;
+
+        ret =3D ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, &preferred);
+        if (!ret) {
+            init->target =3D preferred.target;
+        }
+    }
     if (ret >=3D 0) {
         ret =3D ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
         if (ret < 0) {
@@ -98,10 +105,12 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *=
cpus_to_try,
          * creating one kind of guest CPU which is its preferred
          * CPU type.
          */
+        struct kvm_vcpu_init try;
+
         while (*cpus_to_try !=3D QEMU_KVM_ARM_TARGET_NONE) {
-            init->target =3D *cpus_to_try++;
-            memset(init->features, 0, sizeof(init->features));
-            ret =3D ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
+            try.target =3D *cpus_to_try++;
+            memcpy(try.features, init->features, sizeof(init->features));
+            ret =3D ioctl(cpufd, KVM_ARM_VCPU_INIT, &try);
             if (ret >=3D 0) {
                 break;
             }
@@ -109,6 +118,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *c=
pus_to_try,
         if (ret < 0) {
             goto err;
         }
+        init->target =3D try.target;
     } else {
         /* Treat a NULL cpus_to_try argument the same as an empty
          * list, which means we will fail the call since this must
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 2451a2d4bbef..32bf8d6757c4 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -53,7 +53,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *a=
hcf)
         QEMU_KVM_ARM_TARGET_CORTEX_A15,
         QEMU_KVM_ARM_TARGET_NONE
     };
-    struct kvm_vcpu_init init;
+    /*
+     * target =3D -1 informs kvm_arm_create_scratch_host_vcpu()
+     * to use the preferred target
+     */
+    struct kvm_vcpu_init init =3D { .target =3D -1, };
=20
     if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
         return false;
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 850da1b5e6aa..c7ecefbed720 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -502,7 +502,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures =
*ahcf)
         KVM_ARM_TARGET_CORTEX_A57,
         QEMU_KVM_ARM_TARGET_NONE
     };
-    struct kvm_vcpu_init init;
+    /*
+     * target =3D -1 informs kvm_arm_create_scratch_host_vcpu()
+     * to use the preferred target
+     */
+    struct kvm_vcpu_init init =3D { .target =3D -1, };
=20
     if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
         return false;
--=20
2.21.0
