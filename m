Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp250378lfe;
        Mon, 16 Mar 2020 09:07:22 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvi4sTH6stiquE1sy088NvtTHVtyheDtBlRze7KYOSZdq7tFVlsaaZykksmSNAIs/SPof6E
X-Received: by 2002:a25:c246:: with SMTP id s67mr389555ybf.95.1584374842706;
        Mon, 16 Mar 2020 09:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374842; cv=none;
        d=google.com; s=arc-20160816;
        b=JTPOllpnTAbw93jnh4xrSNBGYvkQ5QaqsCRmqVTbeK79ugtoj6VL52Oshpvsg7n0q+
         uDLqRyv0wSzxwr9RIN2Ym/aQY+uIbInjbUYMTQ05riQDJrt72Yt7V4z0AEIGlBMKgEOD
         MXNLkSDUMggJ4QcEv6Uz1H3CRvFHjT+oB8qXGmMJ4G75YN4hTmuKdbFUoSCopynUjOEd
         SxdSiBHSWLh4s2NXhbFMi5AUtKA/BDBZy5PhfaPvI92C2A2P8aqD0MRmXqKZukaD2RC1
         HgSSgBDSOQZzJqJ3H+yTgPfPrTy4IIcpMWzFzdIzQo4th8meYwBa8qUvXzBOlFOtckFZ
         99aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bL2VrSLFEXUirQF2ArCcrNoQCZwZW3hELnT927BBnbQ=;
        b=xy7RjMXJpGEnJ6BQNNy9PQg9rL2AH/pDfoaMTxnQ6kZ6NHBDuAuCGCCAt/m8IG4xIV
         v3uSJGYC7BLwBlrorkrYaId850chdXGOvhyfZqoWozdAL59PMwgNs1D1Fct22m/zqmS2
         81UAw0kwPg/oqY1quKCbx/O0gMkVHAd9zeXDTmtku8Ozn5sy3zKHXcQwsi5cZuQsGO4E
         P0LmFAb6I5sg6Pm6kcnss88iJMiCdIzTBBatQQMSqemo3+6/mnk3McKskwPHa36Z/Uiu
         PQmdzIlOZI5NI2Q7nfNGPG8FUkW+zQJiyBwHMGEherVJ2aLiUNEMPj5ZslCrDUido7BO
         C+mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VMbDa/Ay";
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [63.128.21.74])
        by mx.google.com with ESMTPS id z5si114429ybz.446.2020.03.16.09.07.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:07:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) client-ip=63.128.21.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VMbDa/Ay";
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bL2VrSLFEXUirQF2ArCcrNoQCZwZW3hELnT927BBnbQ=;
	b=VMbDa/AymFUOaTFpLLfvn964lbSorW/rRI/jQ5CwMKIadWr8i0vL6sQkxW0HQAJcaX0ztI
	gkZsKkD0mkruiJzT4eaOpo2ojflOyDxMVqBbChexAHWKUBzSnOwjr8EXRENDIQNNH/Xexj
	mKH26KApq1FcWZ/21QZaDuhG0WIEomU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-82y1rN6YMCi315TvN0zqNQ-1; Mon, 16 Mar 2020 12:07:18 -0400
X-MC-Unique: 82y1rN6YMCi315TvN0zqNQ-1
Received: by mail-wr1-f70.google.com with SMTP id t10so2953208wrp.15
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r1sJ64QkUjojSCH6EGfhYUMESaCKLhSIpdoia+8OdJA=;
        b=UcddUykeMGhLFOY0yNG1R51QkTbKTXsDhhMutSFIcWnBSIc2FWrny+FRMMzsK1PDLI
         1snjhTZ/MpVGnVzRqtJOFSOEU9Rm8LUGw/m/g8D0HClIxxy0hmjcFVUEsWwaYrBmCZsb
         7VY2ZSxldHAr9d+lOa+PVwDwi4lCWRMzKBrDuCqWcWe8+mepBemPtg+A3Iwors9rXfSx
         cQkhJjXeMbbggEYzl1ifGiirkxr+X7ygBEqWacpmwWZfnrgMLRB0vojP62qTtAaFhwqv
         uwVFOQaMe5kyww1E6EzTdHmOkyAONsK9Bg/KFeym6LNXl+4cACwpTxOLac+4Xp2SQngM
         uMCg==
X-Gm-Message-State: ANhLgQ0KqSdaMCq8st0brxVVRrHYHg34tICPjrBM1JnNVcJv9UYKkgq6
	OD0f3m7+f9gCNllWTkdcsf7GikpWbcDHD7zVyB7vAV+s+ME85mHCNHZUpxUJGXJdulGku5nfLKd
	9mem3HBEvKhGdftOs
X-Received: by 2002:a05:6000:d0:: with SMTP id q16mr77274wrx.71.1584374836479;
        Mon, 16 Mar 2020 09:07:16 -0700 (PDT)
X-Received: by 2002:a05:6000:d0:: with SMTP id q16mr77257wrx.71.1584374836307;
        Mon, 16 Mar 2020 09:07:16 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id y7sm22973551wmd.1.2020.03.16.09.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:07:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 07/19] target/arm: Make cpu_register() available for other files
Date: Mon, 16 Mar 2020 17:06:22 +0100
Message-Id: <20200316160634.3386-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: LmqT9XRDhH8F

From: Thomas Huth <thuth@redhat.com>

Make cpu_register() (renamed to arm_cpu_register()) available
from internals.h so we can register CPUs also from other files
in the future.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190921150420.30743-2-thuth@redhat.com>
[PMD: Split Thomas's patch in two: set_feature (earlier), cpu_register]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/cpu-qom.h |  9 ++++++++-
 target/arm/cpu.c     | 10 ++--------
 target/arm/cpu64.c   |  8 +-------
 3 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 3a9d31ea9d..29c5e2f2c9 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -35,7 +35,14 @@ struct arm_boot_info;
=20
 #define TYPE_ARM_MAX_CPU "max-" TYPE_ARM_CPU
=20
-typedef struct ARMCPUInfo ARMCPUInfo;
+typedef struct ARMCPUInfo {
+    const char *name;
+    void (*initfn)(Object *obj);
+    void (*class_init)(ObjectClass *oc, void *data);
+} ARMCPUInfo;
+
+void arm_cpu_register(const ARMCPUInfo *info);
+void aarch64_cpu_register(const ARMCPUInfo *info);
=20
 /**
  * ARMCPUClass:
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c074364542..d2813eb81a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2698,12 +2698,6 @@ static void arm_max_initfn(Object *obj)
=20
 #endif /* !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64) */
=20
-struct ARMCPUInfo {
-    const char *name;
-    void (*initfn)(Object *obj);
-    void (*class_init)(ObjectClass *oc, void *data);
-};
-
 static const ARMCPUInfo arm_cpus[] =3D {
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
     { .name =3D "arm926",      .initfn =3D arm926_initfn },
@@ -2869,7 +2863,7 @@ static void cpu_register_class_init(ObjectClass *oc, =
void *data)
     acc->info =3D data;
 }
=20
-static void cpu_register(const ARMCPUInfo *info)
+void arm_cpu_register(const ARMCPUInfo *info)
 {
     TypeInfo type_info =3D {
         .parent =3D TYPE_ARM_CPU,
@@ -2910,7 +2904,7 @@ static void arm_cpu_register_types(void)
     type_register_static(&idau_interface_type_info);
=20
     while (info->name) {
-        cpu_register(info);
+        arm_cpu_register(info);
         info++;
     }
=20
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 622082eae2..e89388378b 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -728,12 +728,6 @@ static void aarch64_max_initfn(Object *obj)
                         cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
 }
=20
-struct ARMCPUInfo {
-    const char *name;
-    void (*initfn)(Object *obj);
-    void (*class_init)(ObjectClass *oc, void *data);
-};
-
 static const ARMCPUInfo aarch64_cpus[] =3D {
     { .name =3D "cortex-a57",         .initfn =3D aarch64_a57_initfn },
     { .name =3D "cortex-a53",         .initfn =3D aarch64_a53_initfn },
@@ -816,7 +810,7 @@ static void cpu_register_class_init(ObjectClass *oc, vo=
id *data)
     acc->info =3D data;
 }
=20
-static void aarch64_cpu_register(const ARMCPUInfo *info)
+void aarch64_cpu_register(const ARMCPUInfo *info)
 {
     TypeInfo type_info =3D {
         .parent =3D TYPE_AARCH64_CPU,
--=20
2.21.1
