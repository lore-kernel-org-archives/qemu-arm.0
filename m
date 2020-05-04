Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp663407lfb;
        Mon, 4 May 2020 10:26:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypJulguXuzukwiOSwFCrn6Bq4z+/D8kWInnNB+IwPQy4/gD8Dp+KATCjl9DHtjCZRSqJzdgH
X-Received: by 2002:a37:8002:: with SMTP id b2mr238790qkd.339.1588613181534;
        Mon, 04 May 2020 10:26:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588613181; cv=none;
        d=google.com; s=arc-20160816;
        b=GeuT4aPbF1fcAH6ndWYzz1EXKpLof7DCoLAvXqkfy/2A+uVHZm8oXm6nx6JKaD1eFM
         Ev8LCGXe67tNQo8+kbWm1vj3824gUDQ+cGCj/Ed4Me6X5pIyFlsT1E5ih/ks4iMaZdHB
         9c1//deXJqvMC1VdvuOL5q8FfeJN8I8ZALIXw/WlFb79Mi14cizjo56iB9Zi+8mgSPry
         hmVoA/gfK0CbnY3tBxaxRcCgRNV2aV53YKATo5oYQfkAf9IMpZUKtdAkbHxuaKN+rmHv
         /Oas+YUN8PBkGiF7t4L/zxVUzI5fUnOEictbD55kScJGvLE2e+V5o60MHA5vC2fkziaG
         ujwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Eji01/SBPkfeU3Z/BdrMTnTdR9yItWqYRqGxG9pfew4=;
        b=dDP6q2Rq515LMNcJud5yw7aIRRmb32JRomDpEZ5qr1toacVZHJTJG34M5hLrxvhA94
         sqt97Cx4jO/R7GTmvltSRsL4pXbgjKvXzalVNIQy3At2SiW7vSSc0znILadOWPOEbXPj
         85lri3itpGBcPqMLfWBEz5HYed1nEczB1a6ArlaKePGGj+14bmyk8b0RNxkZhxz6iaoh
         qan1YTw++QZBRCv/5VQYT/EG6X15Wy2q1ppbXqearJ0CWsMWOncUzj0hbAaRNrXCp5Iv
         a6jSu4mbD9SUv3Jhe5XIIB1eN+iaee8lcu/IMS+yQ7HlwQAEJZ9JsQRyHfvozxdUuglc
         uUVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a18FJODv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id k8si6818866qvw.72.2020.05.04.10.26.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 10:26:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a18FJODv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVerE-00048S-Vk
	for alex.bennee@linaro.org; Mon, 04 May 2020 13:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVeq7-0002MM-OX
 for qemu-arm@nongnu.org; Mon, 04 May 2020 13:25:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30739
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVeq6-0005N2-Li
 for qemu-arm@nongnu.org; Mon, 04 May 2020 13:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588613110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eji01/SBPkfeU3Z/BdrMTnTdR9yItWqYRqGxG9pfew4=;
 b=a18FJODvkXXg1LtGLsEIrYP2lqdZg2FvGAEnr5Oo4yi4+mcS5EB4s36czHqdzc272XUUWB
 chpx2/LDqb46UY7jOz9DBYZwnU6psG7N+HPjc3XKeWeXWP2pV91TqvS4+B+YGwok3klyqN
 bNQAp1dHU70GYcAx7I/HQ9j5rcqKjw4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-44KQqwRCMuu24byID0u5dA-1; Mon, 04 May 2020 13:25:05 -0400
X-MC-Unique: 44KQqwRCMuu24byID0u5dA-1
Received: by mail-wr1-f69.google.com with SMTP id p8so221157wrj.5
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 10:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ns/oosgPvEQDCh0mvkSvxQ2e1s0FFrQb4T4+vlueLeQ=;
 b=rmPFwHUgwyNtIA9JkDKnseyrk40HuUClL0dgV6+jK9s9D12Te++Z4MWq7Va44PMOzQ
 uChoD6W/Ydt1nO1yBCM0vCZmCcZ6XVmyDBDgGg4ZdgUa4CKeagWxS/kQEIKJnOWp99ev
 PGlWp3iWlq+8YP4yUh+ukpGsi95p3yEn1DTzFwCqw8QUmC3Xw6MLqyFWsvpX7H3Mcn1M
 gVpN2qNdOEdyoV7WaUmhuYxe9L+ruiPSj/dTrZeQ2jdlU5wsxctZ0rHeGAnP2Z0zmLgs
 IDH1Sx04/0796Jtj+JHuU8yZE7vyiiNpx1YwLs2xjeX4ESf7YCmQiuEF381OxNuqUT66
 vDYQ==
X-Gm-Message-State: AGi0PubvuzsDEZEZgN62nyKjwd7E7w5eLxaMEjsqbdGAJYXMcgbP1jlr
 F7rBr/NSYJD/VMFvf0f83qkEeR/KTUK8EsiDqGAGUKGGIIrdVRiDzHXTqUuvacTWb41/yAsvuQs
 4CIjdqXvMeDGm
X-Received: by 2002:a1c:bc02:: with SMTP id m2mr15538321wmf.60.1588613103880; 
 Mon, 04 May 2020 10:25:03 -0700 (PDT)
X-Received: by 2002:a1c:bc02:: with SMTP id m2mr15538304wmf.60.1588613103651; 
 Mon, 04 May 2020 10:25:03 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id b66sm179291wmh.12.2020.05.04.10.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 10:25:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] target/arm/cpu: Use ARRAY_SIZE() to iterate over
 ARMCPUInfo[]
Date: Mon,  4 May 2020 19:24:46 +0200
Message-Id: <20200504172448.9402-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504172448.9402-1-philmd@redhat.com>
References: <20200504172448.9402-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 04:24:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZE9fqFi+pNLi

Use ARRAY_SIZE() to iterate over ARMCPUInfo[].

Since on the aarch64-linux-user build, arm_cpus[] is empty, add
the cpu_count variable and only iterate when it is non-zero.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Without using cpu_count we get:

target/arm/cpu.c:2904:19: error: comparison of unsigned expression < 0 is a=
lways false [-Werror=3Dtype-limits]
 2904 |     for (i =3D 0; i < ARRAY_SIZE(arm_cpus); ++i) {
      |                   ^
cc1: all warnings being treated as errors
---
 target/arm/cpu.c   | 16 +++++++++-------
 target/arm/cpu64.c |  8 +++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 13959cb643..b4d73dd47c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2739,7 +2739,6 @@ static const ARMCPUInfo arm_cpus[] =3D {
     { .name =3D "any",         .initfn =3D arm_max_initfn },
 #endif
 #endif
-    { .name =3D NULL }
 };
=20
 static Property arm_cpu_properties[] =3D {
@@ -2887,19 +2886,22 @@ static const TypeInfo idau_interface_type_info =3D =
{
=20
 static void arm_cpu_register_types(void)
 {
-    const ARMCPUInfo *info =3D arm_cpus;
+    const size_t cpu_count =3D ARRAY_SIZE(arm_cpus);
=20
     type_register_static(&arm_cpu_type_info);
     type_register_static(&idau_interface_type_info);
=20
-    while (info->name) {
-        arm_cpu_register(info);
-        info++;
-    }
-
 #ifdef CONFIG_KVM
     type_register_static(&host_arm_cpu_type_info);
 #endif
+
+    if (cpu_count) {
+        size_t i;
+
+        for (i =3D 0; i < cpu_count; ++i) {
+            arm_cpu_register(&arm_cpus[i]);
+        }
+    }
 }
=20
 type_init(arm_cpu_register_types)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index cbaa5ed228..f5c49ee32d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -734,7 +734,6 @@ static const ARMCPUInfo aarch64_cpus[] =3D {
     { .name =3D "cortex-a53",         .initfn =3D aarch64_a53_initfn },
     { .name =3D "cortex-a72",         .initfn =3D aarch64_a72_initfn },
     { .name =3D "max",                .initfn =3D aarch64_max_initfn },
-    { .name =3D NULL }
 };
=20
 static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
@@ -840,13 +839,12 @@ static const TypeInfo aarch64_cpu_type_info =3D {
=20
 static void aarch64_cpu_register_types(void)
 {
-    const ARMCPUInfo *info =3D aarch64_cpus;
+    size_t i;
=20
     type_register_static(&aarch64_cpu_type_info);
=20
-    while (info->name) {
-        aarch64_cpu_register(info);
-        info++;
+    for (i =3D 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
+        aarch64_cpu_register(&aarch64_cpus[i]);
     }
 }
=20
--=20
2.21.3

