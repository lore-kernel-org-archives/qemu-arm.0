Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp614080wrs;
        Fri, 23 Aug 2019 07:01:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxknKlnCbHf5ojF45WS5dy/raTs/GvmKR+DtTs4xSBJuNkkq4rjLAewsgQ51tb6+beslg8W
X-Received: by 2002:a17:906:cd03:: with SMTP id oz3mr4433319ejb.210.1566568913424;
        Fri, 23 Aug 2019 07:01:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566568913; cv=none;
        d=google.com; s=arc-20160816;
        b=zdWRPoVmqArW2P4wNsejdXBVUWr3OGvU6w/0rMITj3nDcf/Le8VaQ3thyBxIGS83Zf
         OVS7S8mSy76s5F6TDsqbBnISEpLRpqqO5Ok8uHnpGH1XUHxpD0g5lKhs6cWeERXy4EIe
         M9twKGPzUcqjTCdkkyvIL2RXJWvLgQEQ6mHfIRxwYB4aM2b4VmA8mbvUk5rS7D1yxDYl
         rVCmdsiblu1aD3OGCNvQP2MX6rSBmrKBt1b59o8GgBC8v6HhyTlTSZV8cHSIs8HoPPTk
         W12Zby5XxBqgQRGiHRWw5wd5kuGKOJNQjt3mvkxfmBHxmEg2nXrQnenwYtxhsy+p3+K9
         Y0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=xZr948EsRQ9Gq01IRJ6tKFlKE9KjmiI+j6SSYOUUWqc=;
        b=D5GaZWUzPXKUIH2wO1CnEo8IU+K3UBtA7QA8t7Nd0itwY91xPgApz3g3Xu9wUqqAMB
         P+gI4cr25vaAuCW82Uvi/Q9ImDYOvFX9OIH0uAOOFyk+zNVf2EMtv1E7m+uqWoq7Id73
         3kB4tSDulbYa7qw3JJkZ/roenXxgVcZEaIGoeAGiLzjHSC47jgLSDTiFbnNZBzr/unTA
         vxIMkeus8Tzyey2cHNzmanwBeyfwibtpmMvPzWrhTefHG8+X41/0I+kNFXJPdYmFV1sM
         8ZvjoD4mpuk6z80Db+6lJZWUeHp7GagjvP/orQBBR2p0mRIrq1qO860Jq45mdKaUqlRf
         MXGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k52si1843629ede.189.2019.08.23.07.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 07:01:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1A8W-0004EP-5L
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 10:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i1A59-0001PL-7Y
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 09:58:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i1A58-0007I9-5E
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 09:58:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40776)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i1A57-0007Hs-Un; Fri, 23 Aug 2019 09:58:22 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3E0A54E93D;
 Fri, 23 Aug 2019 13:58:21 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-118.brq.redhat.com [10.40.204.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29D6A261A7;
 Fri, 23 Aug 2019 13:58:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 15:58:08 +0200
Message-Id: <20190823135811.13883-2-philmd@redhat.com>
In-Reply-To: <20190823135811.13883-1-philmd@redhat.com>
References: <20190823135811.13883-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 23 Aug 2019 13:58:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/4] target/arm: Restrict pre-ARMv7 cpus to TCG
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AzbpukO1sh9a

KVM requires at least a ARMv7 cpu.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/cpu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2399c14471..522485a2de 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1678,6 +1678,8 @@ static ObjectClass *arm_cpu_class_by_name(const cha=
r *cpu_model)
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
=20
+#ifdef CONFIG_TCG
+
 static void arm926_initfn(Object *obj)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
@@ -1900,6 +1902,8 @@ static void cortex_m0_initfn(Object *obj)
     cpu->midr =3D 0x410cc200;
 }
=20
+#endif
+
 static void cortex_m3_initfn(Object *obj)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
@@ -2283,6 +2287,8 @@ static void cortex_a15_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
 }
=20
+#ifdef CONFIG_TCG
+
 static void ti925t_initfn(Object *obj)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
@@ -2451,6 +2457,8 @@ static void pxa270c5_initfn(Object *obj)
     cpu->reset_sctlr =3D 0x00000078;
 }
=20
+#endif
+
 #ifndef TARGET_AARCH64
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this =
host);
  * otherwise, a CPU with as many features enabled as our emulation suppo=
rts.
@@ -2523,6 +2531,7 @@ struct ARMCPUInfo {
=20
 static const ARMCPUInfo arm_cpus[] =3D {
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
+#ifdef CONFIG_TCG
     { .name =3D "arm926",      .initfn =3D arm926_initfn },
     { .name =3D "arm946",      .initfn =3D arm946_initfn },
     { .name =3D "arm1026",     .initfn =3D arm1026_initfn },
@@ -2535,6 +2544,7 @@ static const ARMCPUInfo arm_cpus[] =3D {
     { .name =3D "arm1176",     .initfn =3D arm1176_initfn },
     { .name =3D "arm11mpcore", .initfn =3D arm11mpcore_initfn },
     { .name =3D "cortex-m0",   .initfn =3D cortex_m0_initfn,
+#endif
                              .class_init =3D arm_v7m_class_init },
     { .name =3D "cortex-m3",   .initfn =3D cortex_m3_initfn,
                              .class_init =3D arm_v7m_class_init },
@@ -2548,6 +2558,7 @@ static const ARMCPUInfo arm_cpus[] =3D {
     { .name =3D "cortex-a8",   .initfn =3D cortex_a8_initfn },
     { .name =3D "cortex-a9",   .initfn =3D cortex_a9_initfn },
     { .name =3D "cortex-a15",  .initfn =3D cortex_a15_initfn },
+#ifdef CONFIG_TCG
     { .name =3D "ti925t",      .initfn =3D ti925t_initfn },
     { .name =3D "sa1100",      .initfn =3D sa1100_initfn },
     { .name =3D "sa1110",      .initfn =3D sa1110_initfn },
@@ -2564,6 +2575,7 @@ static const ARMCPUInfo arm_cpus[] =3D {
     { .name =3D "pxa270-b1",   .initfn =3D pxa270b1_initfn },
     { .name =3D "pxa270-c0",   .initfn =3D pxa270c0_initfn },
     { .name =3D "pxa270-c5",   .initfn =3D pxa270c5_initfn },
+#endif
 #ifndef TARGET_AARCH64
     { .name =3D "max",         .initfn =3D arm_max_initfn },
 #endif
--=20
2.20.1

