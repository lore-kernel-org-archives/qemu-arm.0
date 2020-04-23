Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1592362lfm;
        Thu, 23 Apr 2020 00:36:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypKp/2hzGOXBtQYhtcKqmX2/vMyVK09Ub699wDaPgu435VShU6J0J81ht+trunXZYbPDVeca
X-Received: by 2002:ad4:4182:: with SMTP id e2mr2880408qvp.61.1587627407855;
        Thu, 23 Apr 2020 00:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587627407; cv=none;
        d=google.com; s=arc-20160816;
        b=dn+QVIjoBT3H2ohDVfpmmK1UL9x+5eDg+9wFolX3CkALd2ex7EdUSBIf3S/OP7lnxW
         lRpPQTX+FHQYlJhgPvltvDv4G8ATTv1oPe1N0aeSeVroEdLgSV0sBt0Sepc7/g2tkFJt
         DNFI5ezZPqkSTIpr2JAlUXzGKp6GqO0Ok2cKfKM6F8AioogDpS2kZvj7FlKLw/PjOy+V
         Mi53qyVPdrloJ0JECchOnsw56uPNo0WwgAR9yZeCntCs+l36n3PtUreySVBSKq9Tc8dI
         Hbk5hnhxGqcLStsnnSdq3qw+X17jw/gDeA16FLUlGMJD58kLQCWHcn40Nei6CuitIO/6
         P4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mDbLYbJnK16dDXRL5VVauGB0aFR8uwkJ/bINCwCcCMA=;
        b=l+WDAKEGonXVjT56TvWQ/saCgFYLm0ZwMABsF9MF6kL4LjfADJXEazZmYh0ywOKRuv
         rcKRmvWq6u1gyX662N8LXXJsWj0H3CtsneAw636yPc6FOIRINRlPsXCcJsO9ZrYvqLe3
         wsxQLUuM0CcwEZPQjaAz8wYSJ+xLuOAR9tirTvOIAaIp+93k45DG1nlzhXKRPtiM00dV
         2pzShPItEU9gH1wo+NTP1jBPmga7TrhDaFefUOjbU2vIgs2sSLk5gP0sTVBZTeq7YiaQ
         KSxU+5bQyqa0RIC7fTB0mF8CdaIMBr5dxUeRN7yUOebtenWiG57yJaeaEmF+gLHhDEfV
         D4zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e4dbeMhT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8si811450qtp.311.2020.04.23.00.36.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 00:36:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e4dbeMhT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRWPf-00081O-4L
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 03:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46776)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRWNG-0004ye-PL
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 03:34:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRWNG-0006pb-4g
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 03:34:18 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:53005
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRWNF-0006ng-OM
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 03:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587627257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mDbLYbJnK16dDXRL5VVauGB0aFR8uwkJ/bINCwCcCMA=;
 b=e4dbeMhT93z2YkfN2M9NG/tD0Gl27nWtjgwl1SaNttu1oGkxNXv+HXgbGl3Nwx21lwKc7f
 LJyIB1PcLHaNbcvON8RL4N6uAH1wyn0pPwjR/YH7iUaCDuLKTu6kz0evLUAyzA+Nu8UJ4O
 LBHEz5n+oFWZn3ieFEw8uFFf4aEJMnQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-8oPlQjnDP7SW-KYcW9VDtw-1; Thu, 23 Apr 2020 03:34:15 -0400
X-MC-Unique: 8oPlQjnDP7SW-KYcW9VDtw-1
Received: by mail-wm1-f70.google.com with SMTP id 14so1921373wmo.9
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2020 00:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T7HnB0KxDMdAS4VzLsEn4+uw/vEe0sZVaSPI+AwP3h8=;
 b=nZbfbr5WFjNnipPE7tNOI1RsLi/r6J3GPC6g6z/HpVv2YdESImSMGbc0SU28y9OKwE
 f3UWlFYSA7KvuHQEgvNUnPDKYZtm6nzW1TlxfMVlBvxOu/csqsIrBY3TyNWuFQ854Fg5
 YOd/JNpCfyCJ9YgxiHkRnmfBfzoXM4lmdZnddgywenll9Ref4FkBzBsW2mYv6nOuLI9K
 LAw05iZB6saK4fZ5P+j32sc62ARdSYoVq0TFnE5rnI8d5woZ1YvVPlh8lEzrPB4s1JGY
 LboZmKlBnuPkGBEvWSfeynUNAZjtstPGR6Ee1WD8ImPv1sdQ0i7QoI8iRHLh+8ygWRrj
 WL1w==
X-Gm-Message-State: AGi0PuZKFlvt3ljR4DFt4jC+Qaux2FTO11xpt9SQvzeJokKRMvmpWPJy
 ugiGGXjNVM9sZb1WCRS+N7msv6ua/3UVJnWnstdlEZac1IZ3eFb57ox03Pgu4Pm5Mk0TND0bqCI
 dmGlX7wke4a7D
X-Received: by 2002:a5d:5646:: with SMTP id j6mr3489511wrw.207.1587627254304; 
 Thu, 23 Apr 2020 00:34:14 -0700 (PDT)
X-Received: by 2002:a5d:5646:: with SMTP id j6mr3489494wrw.207.1587627254122; 
 Thu, 23 Apr 2020 00:34:14 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id l16sm2385970wrp.91.2020.04.23.00.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 00:34:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] target/arm: Make cpu_register() available for other
 files
Date: Thu, 23 Apr 2020 09:33:55 +0200
Message-Id: <20200423073358.27155-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200423073358.27155-1-philmd@redhat.com>
References: <20200423073358.27155-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 02:14:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pGITTO+6wzfh

From: Thomas Huth <thuth@redhat.com>

Make cpu_register() (renamed to arm_cpu_register()) available
from internals.h so we can register CPUs also from other files
in the future.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190921150420.30743-2-thuth@redhat.com>
[PMD: Only take cpu_register() from Thomas's patch]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/cpu-qom.h |  9 ++++++++-
 target/arm/cpu.c     | 10 ++--------
 target/arm/cpu64.c   |  8 +-------
 3 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index d95568bf05..56395b87f6 100644
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
index a79f233b17..47e35400da 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2693,12 +2693,6 @@ static void arm_max_initfn(Object *obj)
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
@@ -2864,7 +2858,7 @@ static void cpu_register_class_init(ObjectClass *oc, =
void *data)
     acc->info =3D data;
 }
=20
-static void cpu_register(const ARMCPUInfo *info)
+void arm_cpu_register(const ARMCPUInfo *info)
 {
     TypeInfo type_info =3D {
         .parent =3D TYPE_ARM_CPU,
@@ -2905,7 +2899,7 @@ static void arm_cpu_register_types(void)
     type_register_static(&idau_interface_type_info);
=20
     while (info->name) {
-        cpu_register(info);
+        arm_cpu_register(info);
         info++;
     }
=20
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 62d36f9e8d..951588c56e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -737,12 +737,6 @@ static void aarch64_max_initfn(Object *obj)
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
@@ -825,7 +819,7 @@ static void cpu_register_class_init(ObjectClass *oc, vo=
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

