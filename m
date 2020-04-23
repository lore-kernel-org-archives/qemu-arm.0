Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1590632lfm;
        Thu, 23 Apr 2020 00:34:38 -0700 (PDT)
X-Google-Smtp-Source: APiQypLfYZAzh5eRc/9yLZn/jefUfV7HdgzowfeNAMrohwBuCYQXadB7czDfw6APMASZncTxRg3m
X-Received: by 2002:a37:9f15:: with SMTP id i21mr2146926qke.47.1587627278479;
        Thu, 23 Apr 2020 00:34:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587627278; cv=none;
        d=google.com; s=arc-20160816;
        b=Z02dLqrAHw6TWT9FztHIbIeQcVdh2t0R8U9Wfe4wJjPv5pq8zYFdzb2tAKe1rk+8k+
         xArGEguH/GESwV5Ty0AsiV1Tp6bkoiWiNDoGxp/R1A3deIhiTD5WaInSFeDlwQ345j/v
         UY9YPrm4lcuW2EsGhfachQsZpGMoZRXYI2JsQwNZFXvIwjHyX810cEFhx4sBRV2P6mHL
         3wSQDC+2QRD1N1pHPjPH/p3/V1aBv7s+/OjxwgDftNBhkZFHjB3qqTGdWr7qtuMGk7Oj
         do4CPNKfmEKowxQkwoUaDkjlPDw+Ypve3x7MBdFP54Fzb10iIeU3Nq0P/6WFt/MFHYsx
         z+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=F7pM8Y9foGxY0KgmfhDIgQ7kPDhEiL45SUO11cYWEao=;
        b=RUrkKPSa53rZ5ZB600/s7Xqg1gbBW2qsBS+Pm7898CDdHVZAu9pxoxwSErBiSCE62h
         ZDM+yEfln+e5j0u0gSbSBZbKK+JwY7PuSZb/FjEVXKSnlZJ7PXgtmpKYniq7RcD1+QmG
         IlfR8R71qiGM5FVbWVUTd1Vua5ujHI+yBffbvwLvUoHVFf6kjoSJLLNAJyzEdt4nc324
         TlXSL3TE+Acg9pKOXmlP8y203NG34CUfF1jg5wyVlxzNlMWmk23l0As1ZfI9iloLz+IW
         eu5jAKeGcZ22STrPTWhtNcu+lIj7HDJPk05azybd5rqZGmRnKvaCG1LZr5Dxg8albmoT
         xYzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Gbpju5Vb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1si835820qkk.261.2020.04.23.00.34.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 00:34:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Gbpju5Vb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRWNZ-00058U-Mw
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 03:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRWNO-00053i-Ut
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 03:34:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRWNL-0006y6-T2
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 03:34:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47814
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRWNL-0006x3-FQ
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 03:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587627262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F7pM8Y9foGxY0KgmfhDIgQ7kPDhEiL45SUO11cYWEao=;
 b=Gbpju5VbFP6THXJlzGejRxeNZ/+fYEE8njY00kqCInjCbsdwqLQQCgXPhtjoxQ7i36p29n
 qCbkxAbjKzVADWA0eluaSo4/wnVk6kRzD0mIoWlZn1h6OcU/jK2+kaXfSmcB95OZtCCgbu
 zWycfeG78axJrg0GtUOCvJ72R9lto7w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-V-zdLyXvMQSak8KFfL-zJw-1; Thu, 23 Apr 2020 03:34:20 -0400
X-MC-Unique: V-zdLyXvMQSak8KFfL-zJw-1
Received: by mail-wr1-f69.google.com with SMTP id i10so2418407wrq.8
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2020 00:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1CCEkWp7UjJNTmMA2CUtzCRavWKlDQWa9H1QWoyOCGE=;
 b=AdiqeJCB8gpzy7U+cMH9FKtLUVBoaVQFaNITSmNinOlcPJt8cuYGSkKyul9A85xNMA
 cR2BFPUCR3M90+gzfB+tDophpUJ6Vdb2lbmeTXK7D62S9nhVriggZj41Gc40ySDg3c00
 mfm1B3KWyq99cofj67tPVBzNpXu0yH7azrVOTKptgiN1lwYHIGiZ6UvcgmQCghXRa7aY
 VfdUiDwPYfgUa6MCG5ZPbG0RmAlGmfzw5uM36l2G9lVSM16xV8TkomUcMNmre6jb2xl7
 F0wGdMfKiSHaiGn4mg9Yv9dAzdQ1tlBsUFLww1tjC3kIVDRWiF8sZUvldmAWR5IMODIf
 9rGA==
X-Gm-Message-State: AGi0PuaNl017x+7S87o8bQJ7xdrm3Sz9HQMSgHf8sKl26K7RpjyQ7nkK
 2A0vs6U+GSEjxzS71lFLH5hqOW1h9XiIZhImFNs+TQApYoGDYJ/rse1vTHR5Lb2a7FfnL6P8Y/y
 wkVOmY8xBHuQR
X-Received: by 2002:a5d:5085:: with SMTP id a5mr3546542wrt.394.1587627259702; 
 Thu, 23 Apr 2020 00:34:19 -0700 (PDT)
X-Received: by 2002:a5d:5085:: with SMTP id a5mr3546518wrt.394.1587627259485; 
 Thu, 23 Apr 2020 00:34:19 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id 185sm2674363wmc.32.2020.04.23.00.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 00:34:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] target/arm/cpu: Use ARRAY_SIZE() to iterate over
 ARMCPUInfo[]
Date: Thu, 23 Apr 2020 09:33:56 +0200
Message-Id: <20200423073358.27155-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200423073358.27155-1-philmd@redhat.com>
References: <20200423073358.27155-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 01:42:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ghMpKhzGJAZ+

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/cpu.c   | 8 +++-----
 target/arm/cpu64.c | 8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 47e35400da..30e961f775 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2745,7 +2745,6 @@ static const ARMCPUInfo arm_cpus[] =3D {
     { .name =3D "any",         .initfn =3D arm_max_initfn },
 #endif
 #endif
-    { .name =3D NULL }
 };
=20
 static Property arm_cpu_properties[] =3D {
@@ -2893,14 +2892,13 @@ static const TypeInfo idau_interface_type_info =3D =
{
=20
 static void arm_cpu_register_types(void)
 {
-    const ARMCPUInfo *info =3D arm_cpus;
+    size_t i;
=20
     type_register_static(&arm_cpu_type_info);
     type_register_static(&idau_interface_type_info);
=20
-    while (info->name) {
-        arm_cpu_register(info);
-        info++;
+    for (i =3D 0; i < ARRAY_SIZE(arm_cpus); ++i) {
+        arm_cpu_register(&arm_cpus[i]);
     }
=20
 #ifdef CONFIG_KVM
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 951588c56e..ef9231d55b 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -742,7 +742,6 @@ static const ARMCPUInfo aarch64_cpus[] =3D {
     { .name =3D "cortex-a53",         .initfn =3D aarch64_a53_initfn },
     { .name =3D "cortex-a72",         .initfn =3D aarch64_a72_initfn },
     { .name =3D "max",                .initfn =3D aarch64_max_initfn },
-    { .name =3D NULL }
 };
=20
 static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
@@ -848,13 +847,12 @@ static const TypeInfo aarch64_cpu_type_info =3D {
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
2.21.1

