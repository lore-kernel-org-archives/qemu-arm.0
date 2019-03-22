Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp902487wrx;
        Fri, 22 Mar 2019 09:33:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz8PZMeVDFtCHMze52oQtfULjYjgkIwhIPEFadVABADzkPHgCqZ7Ts5kyxEBS3n33jUaaqu
X-Received: by 2002:a81:3456:: with SMTP id b83mr9326913ywa.492.1553272386573;
        Fri, 22 Mar 2019 09:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553272386; cv=none;
        d=google.com; s=arc-20160816;
        b=fnn1r5nFOqTZ6uGWzoYaopy+zvBw8oPodi8o+3mRCoNv8FY0iaJzdxJ8SOQeybFey8
         fD/Fs70ByhqwwB49wRe38ZrLFgdN+l0Yn8gdEAeWgjisBCCinxfuDKGvYz/mGwYJCZ6L
         cZOfBhigAHOUmSdAjBvFxWEs8ANxPXGdHCnUWBJTdKe60/1vKM7DWkwnbbGFgYhBKxk1
         KU3exwEtXWBHP324ZHYu0RTEzOPh91xIKhZl/SmzWmP1LSHd3bGeFCq8Tr6NRzbtvFzC
         INTYvthRJRTkF0zhlULkYWuvVViNWOoKmcbtqvJJWNnYBx5jCWhDV8ulhaqG3NhWb9Bf
         4PZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=qUdub/kkgKaAJz8DbWHi9kMtrfGXcmpTMx0xPGfUYF8=;
        b=KUkoWjgYJsdd9PDsPNZaiCHAIaHMl/u0AWfG0HLvE8gj1pDIw76/86KOI7pO1HXkF5
         5ZrNwERgmZEC2KpQBLA/uDhjSKcbpOnbkp6TyJdVfXt+w0pka2FP8EZ3Ejk1FDRtLgOT
         ov8EqBILbVj+JhV4COoeRxuhfBTkd7uZuSsiNnHTR8rMOjh2xHVaHSE/odfJ3JI86wI8
         zUMQ+dX5LnLMXDzpj/IYdMMhASnnh3Y4CD//uCgApUbrvRTi/k4FDLjBtW89SX6LnxK2
         Ik5bAyUDkVwhCGNDDIy3AKTChdI1KCqrh71JxL6cKHEBItnSFGK5/GRlIV7Sh9DFBa6z
         CK1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f66si4952983ybb.336.2019.03.22.09.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Mar 2019 09:33:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59887 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h7N6P-0002J8-T8
	for alex.bennee@linaro.org; Fri, 22 Mar 2019 12:33:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1h7N4b-0001NB-8w
	for qemu-devel@nongnu.org; Fri, 22 Mar 2019 12:31:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1h7N4Z-0006zu-Hd
	for qemu-devel@nongnu.org; Fri, 22 Mar 2019 12:31:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38573)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1h7N4W-0006su-Gu; Fri, 22 Mar 2019 12:31:08 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08FA33086223;
	Fri, 22 Mar 2019 16:23:39 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7F1E5D9CC;
	Fri, 22 Mar 2019 16:23:37 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 22 Mar 2019 17:23:32 +0100
Message-Id: <20190322162333.17159-3-drjones@redhat.com>
In-Reply-To: <20190322162333.17159-1-drjones@redhat.com>
References: <20190322162333.17159-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 22 Mar 2019 16:23:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/3] target/arm: cortex-a7 and cortex-a15 have
 pmus
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
Cc: peter.maydell@linaro.org, aaron@os.amperecomputing.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ck0gmQwhxmhF

cortex-a7 and cortex-a15 have pmus (PMUv2) and they advertise
them in ID_DFR0. Let's allow them to function. This also enables
the pmu cpu property to work with these cpu types, i.e. we can
now do '-cpu cortex-a15,pmu=off' to remove the pmu.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 96f0ff0ec727..504a4771fbd3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1109,6 +1109,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 #endif
     } else {
         cpu->id_aa64dfr0 &= ~0xf00;
+        cpu->id_dfr0 &= ~(0xf << 24);
         cpu->pmceid0 = 0;
         cpu->pmceid1 = 0;
     }
@@ -1744,6 +1745,7 @@ static void cortex_a7_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A7;
     cpu->midr = 0x410fc075;
     cpu->reset_fpsid = 0x41023075;
@@ -1789,6 +1791,7 @@ static void cortex_a15_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
     cpu->midr = 0x412fc0f1;
     cpu->reset_fpsid = 0x410430f0;
-- 
2.17.2

