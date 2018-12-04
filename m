Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8132552wrt;
        Tue, 4 Dec 2018 06:27:59 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XerSstdoTfyFfnsDOxVoV1Lm7hS/NmU7DAKFu0kiO01reBspqQsNvax7qYGs4y5KnTQlz8
X-Received: by 2002:a37:5f82:: with SMTP id t124mr18736680qkb.204.1543933679711;
        Tue, 04 Dec 2018 06:27:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543933679; cv=none;
        d=google.com; s=arc-20160816;
        b=O3odU/nuILsImx0fG254YUvpwvlmXtpYNqXlSXzecPRkf5WkTwMa7SIiYBiEewoCUA
         6Yf2sVfKtp2yffht9xWSZnWnt08tYkdZM8eVzhTOhuZfsEYGZL66easGqt/N5MCGU+EM
         uhNvO2JQJv98Jff0O0RxTDE9Cc2g+yhmipugaCT0dNLD805JbWQJQosad9L4z+3l2cu8
         rDWfZiE3IiI4WEb8AxPNH7n55hlKSZ52y5a1zc07la4svfjMxQV+TZvk28Roq9g1kMnQ
         r9bpp1TLRvEhWOF2IXCvi2FPJ5cqWYcT+SwIoN3/shdWVkOzgMYMpdjd7yIqgDkFpXmR
         5sww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=T0B+isNFnwX3D+run4HjT+IKSwd7hKqxQVDQb0w+L2s=;
        b=jswod/cxmwBiZCF80tf+B3zzbEHxlcwVZpfBZt/mgcjOdUIysN9csBhRrCJp5iYrz5
         hXBdfrzzK8aMpkJe/6GKQfmIAaq//hDYhRamcyOw6DydA8RRCt6tKZfScWHjCvyhZd1/
         bKY3H0OOEVJBABlahFbDRN+ur62ZBz12g/ld7Lew2WKVOJsHd0LVs3rKHCCgk3kL774D
         zz3noKeEMdl3bDyClJab0rjERCWdE7+zJXHQSR/vNSbgQ3Js44Sc8nkNsAZKi9fJgn2/
         EO8fulfl4+rrRrAyXuHdNuQ2QdqZMS9M2lAs8rDON6Jhl0GCQfFuCh09OAaMRze2nJLa
         sEBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 73si3723341qtg.288.2018.12.04.06.27.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 06:27:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUBg6-00031p-M6
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 09:27:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gUBbX-00066g-8h
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:23:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gUBbS-0008In-7y
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:23:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48462)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gUBbR-0008I0-TX; Tue, 04 Dec 2018 09:23:10 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EAEA6308424D;
	Tue,  4 Dec 2018 14:23:08 +0000 (UTC)
Received: from localhost (ovpn-112-31.ams2.redhat.com [10.36.112.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 125FA27C35;
	Tue,  4 Dec 2018 14:23:02 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  4 Dec 2018 18:20:20 +0400
Message-Id: <20181204142023.15982-17-marcandre.lureau@redhat.com>
In-Reply-To: <20181204142023.15982-1-marcandre.lureau@redhat.com>
References: <20181204142023.15982-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 04 Dec 2018 14:23:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.2 v5 16/19] RFC: arm: replace
 instance_post_init()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, imammedo@redhat.com,
	"open list:ARM" <qemu-arm@nongnu.org>, ehabkost@redhat.com,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jMwW/s8kvf9G

Replace arm_cpu_post_init() instance callback by calling it from leaf
classes, to avoid potential ordering issue with other post_init callbacks=
.

Note: this patch is no longer needed in this series, since the
compat-props interface approach was abandoned.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
---
 target/arm/cpu.h   |  2 ++
 target/arm/cpu.c   | 15 ++++++++++++---
 target/arm/cpu64.c | 11 ++++++++++-
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2a73fed9a0..84fba2b24b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -884,6 +884,8 @@ static inline ARMCPU *arm_env_get_cpu(CPUARMState *en=
v)
     return container_of(env, ARMCPU, env);
 }
=20
+void arm_cpu_post_init(Object *obj);
+
 uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz);
=20
 #define ENV_GET_CPU(e) CPU(arm_env_get_cpu(e))
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 60411f6bfe..8a4aae7438 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -734,7 +734,7 @@ static Property arm_cpu_pmsav7_dregion_property =3D
 static Property arm_cpu_initsvtor_property =3D
             DEFINE_PROP_UINT32("init-svtor", ARMCPU, init_svtor, 0);
=20
-static void arm_cpu_post_init(Object *obj)
+void arm_cpu_post_init(Object *obj)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
=20
@@ -2094,6 +2094,7 @@ static void arm_host_initfn(Object *obj)
     ARMCPU *cpu =3D ARM_CPU(obj);
=20
     kvm_arm_set_cpu_features_from_host(cpu);
+    arm_cpu_post_init(ARM_CPU(obj));
 }
=20
 static const TypeInfo host_arm_cpu_type_info =3D {
@@ -2108,14 +2109,23 @@ static const TypeInfo host_arm_cpu_type_info =3D =
{
=20
 #endif
=20
+static void arm_cpu_instance_init(Object *obj)
+{
+    const ARMCPUInfo *info =3D object_class_get_class_data(object_get_cl=
ass(obj));
+
+    info->initfn(obj);
+    arm_cpu_post_init(obj);
+}
+
 static void cpu_register(const ARMCPUInfo *info)
 {
     TypeInfo type_info =3D {
         .parent =3D TYPE_ARM_CPU,
         .instance_size =3D sizeof(ARMCPU),
-        .instance_init =3D info->initfn,
+        .instance_init =3D arm_cpu_instance_init,
         .class_size =3D sizeof(ARMCPUClass),
         .class_init =3D info->class_init,
+        .class_data =3D (void *)info,
     };
=20
     type_info.name =3D g_strdup_printf("%s-" TYPE_ARM_CPU, info->name);
@@ -2128,7 +2138,6 @@ static const TypeInfo arm_cpu_type_info =3D {
     .parent =3D TYPE_CPU,
     .instance_size =3D sizeof(ARMCPU),
     .instance_init =3D arm_cpu_initfn,
-    .instance_post_init =3D arm_cpu_post_init,
     .instance_finalize =3D arm_cpu_finalizefn,
     .abstract =3D true,
     .class_size =3D sizeof(ARMCPUClass),
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 873f059bf2..dbfc3ee490 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -447,14 +447,23 @@ static void aarch64_cpu_class_init(ObjectClass *oc,=
 void *data)
     cc->gdb_arch_name =3D aarch64_gdb_arch_name;
 }
=20
+static void aarch64_cpu_instance_init(Object *obj)
+{
+    const ARMCPUInfo *info =3D object_class_get_class_data(object_get_cl=
ass(obj));
+
+    info->initfn(obj);
+    arm_cpu_post_init(obj);
+}
+
 static void aarch64_cpu_register(const ARMCPUInfo *info)
 {
     TypeInfo type_info =3D {
         .parent =3D TYPE_AARCH64_CPU,
         .instance_size =3D sizeof(ARMCPU),
-        .instance_init =3D info->initfn,
+        .instance_init =3D aarch64_cpu_instance_init,
         .class_size =3D sizeof(ARMCPUClass),
         .class_init =3D info->class_init,
+        .class_data =3D (void *)info,
     };
=20
     type_info.name =3D g_strdup_printf("%s-" TYPE_ARM_CPU, info->name);
--=20
2.20.0.rc1

