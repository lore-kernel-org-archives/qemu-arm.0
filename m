Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp1251761wri;
        Thu, 31 Oct 2019 07:36:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxH1VIYcDy4L0Ng95jxttJ9NSUYtW3CAPhyDXkzjW/Gl06qRbEbFbMrdU48f1DoAs2zyQBE
X-Received: by 2002:ac8:28a1:: with SMTP id i30mr691909qti.245.1572532563248;
        Thu, 31 Oct 2019 07:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572532563; cv=none;
        d=google.com; s=arc-20160816;
        b=Jg65qqbGYzaoJBkyEuQvJc3Z0cox93aNfcGPA8h4hMcrAuaP1/dOhxqlkNRIw83imO
         CxdA4czRxiRqDYn1BFyUG1XPJ6+Rx5F1MFxz6G+FiCz+wIURrmvMys2CYxObHFthwDDe
         /xUNKQIgQJBA9sZ2JD3t13q97aeu35dOI8LEJy5SMo9jtNuA5qElip8ggeOII2RY0C9r
         laoR/763LDlm+ms1zcnuG8vDYR3KgmhktTPcjhsvPQrAnL4vK5kyrCuk+ri6F9TYMUk2
         S2GAq4BD8Hdz+DR0h1sSwp/Hk8v0n6a1X9YG3YEg8BHRxbUb+kvEra00Z4qzGExt+Aw2
         G8FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZKBy1Y1Kkn9dGmibAmsiz6a0MAdBDihiPMDDXFne0IQ=;
        b=D9yLWyNJRCCCxGRmDfdWI6rxtQR/wr8jBzcuuRv8F7GukQZRyODFBn61cteP2EgsVo
         twlnoU/cWsROSc/Q0zMwz4O213fitUMBGa+ykpd6QBUdXTftec2s2eDlzHnmUXYR+rTk
         hl0fB+MDsJ02BXGW2r3Qn0+Wwodr7GR5wiqanaw40oeaE84daXK/jC5ApTrutuq/SGh0
         iYEntJrMzCgnjzysKCmxV6iZhRe9MVZeKnNo+swujFbI0S9DpbRK50CyAp7mgPm5E4qH
         FjACAU/0KtdNafsUC4gAgc28/FOYBARu4bRs2Sv8IWNlPKjHz7Xtu2wz7Bn8/7DkzB7g
         yDKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=arvxgqDx;
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id a7si4814133qvy.136.2019.10.31.07.36.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 07:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=arvxgqDx;
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572532562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZKBy1Y1Kkn9dGmibAmsiz6a0MAdBDihiPMDDXFne0IQ=;
	b=arvxgqDxEXg0DXiBAoIFBHugpAlLizbqMhuVBvg4SG+/XzreZH2mKVO8gG4fBBLR9APk2f
	4gdM3nOjX5A0xnxzmwmfghJS5xRqSK6JSpmgkEAEriQgyEvW7kNGQm80wOUekTUqQpsx6r
	HxRmXd3o1Yt8PO59548op/AaTjwHAsQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368--GBC6y7tPmezM__IsCJtsg-1; Thu, 31 Oct 2019 10:35:59 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D98801800D6B;
	Thu, 31 Oct 2019 14:35:57 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-117-53.ams2.redhat.com [10.36.117.53])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DAEDB60870;
	Thu, 31 Oct 2019 14:35:26 +0000 (UTC)
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
Subject: [PATCH v8 7/9] target/arm/kvm: scratch vcpu: Preserve input kvm_vcpu_init features
Date: Thu, 31 Oct 2019 15:27:32 +0100
Message-Id: <20191031142734.8590-8-drjones@redhat.com>
In-Reply-To: <20191031142734.8590-1-drjones@redhat.com>
References: <20191031142734.8590-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: -GBC6y7tPmezM__IsCJtsg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-TUID: hulOKfIQKNuI

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
