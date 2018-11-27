Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1049698wrt;
        Tue, 27 Nov 2018 01:50:27 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Uvm340NWLiUv1+YB8L6TcbDtPYnfyXh8VlTnEfoSM0ijm8Ja3nr0ksJKdufQTuPKgIC514
X-Received: by 2002:a81:af0c:: with SMTP id n12mr31746441ywh.446.1543312227781;
        Tue, 27 Nov 2018 01:50:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543312227; cv=none;
        d=google.com; s=arc-20160816;
        b=UOHvYLXZqctpfbzYIxlLfZ1ElfHXARR7TkQbiiJK41vrHtYq8I9IkyAbRIHau2qAKd
         sFGXiYyk83vJ4F9XGiTeLWq0BSCkscAqThNkNJRMWtIreS4ADVgfVLDUg3lo6HVRQl7f
         4uf2tI6GUbcesdgvbbX4fq92B5wbRQx5Be3mj5EGcuPrI3ujec2MqplH6ck/LGjUKw2Y
         Z+uJiqTB5Mikwbvh7aqz/u3bp3kOrtBVFjTRj1Xp8oU2e5eLvVu+bVaia1GqE5TIZdSC
         rsK0RvkE67STHL4tyheH03Y6o4GJaaQI9c/QaeKWgRQ6/zSsimhq6sGufkVMiFz95aYM
         chkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=vcvBE/qYaxky41VquWYIv1e5LPL0t1Kx8PYYu02YmXw=;
        b=RnvL0FcOl356wPS47ff0EDQUE+X5frS9qavf4KkQFH2wY4vGhnBvnpJHp5Cu8JLsrN
         P1SgX5qGgvfRMsV/uSyeoCW9RBGT4Bbg1ZtvH1kSaT5az6oOw5FtdHlNkXdeeovfSeWc
         CZcpdyuvq4sDiKizspOkrhPjt019XVw4BH6bUxomThsUNahyhTy6Imfrdu4jqVlEFvMz
         PZu+5VagqaLL8tLVti8I3RvGSLKp0PkK4iFz4hZWcSZzcF2czJXQVgiFpMGQkI1RShFR
         V3D0tn4sHFocuIdL+s/b3V9A9S1u5mOJm2N0eK5FqxZXY+jfYtGLufEmUu4DjGQ+c6WU
         jw1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m127-v6si2254915ywm.405.2018.11.27.01.50.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 01:50:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40965 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRa0h-0005e3-4a
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 04:50:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gRZik-0005Ab-T7
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 04:31:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gRZih-0006X2-Ng
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 04:31:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33164)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gRZif-0006Vy-Km; Tue, 27 Nov 2018 04:31:49 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C0AB2A4021;
	Tue, 27 Nov 2018 09:31:47 +0000 (UTC)
Received: from localhost (ovpn-112-28.ams2.redhat.com [10.36.112.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53DBD5C3FA;
	Tue, 27 Nov 2018 09:31:45 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Nov 2018 13:27:57 +0400
Message-Id: <20181127092801.21777-25-marcandre.lureau@redhat.com>
In-Reply-To: <20181127092801.21777-1-marcandre.lureau@redhat.com>
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 27 Nov 2018 09:31:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-3.2 v4 24/28] arm: replace
 instance_post_init()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, imammedo@redhat.com,
	"open list:ARM" <qemu-arm@nongnu.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ESyZlT8yzvJL

Replace arm_cpu_post_init() instance callback by calling it from leaf
classes, to avoid potential the ordering issue with interfaces
post-init.

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

