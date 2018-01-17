Received: by 10.28.173.206 with SMTP id w197csp5419604wme;
        Wed, 17 Jan 2018 07:49:33 -0800 (PST)
X-Google-Smtp-Source: ACJfBovycTLBkjIEDIwIQdWSVxev+/hPWpgJP9uVtGYYz1o8dvZTbhDytEPhtQv8p8oBbewXBJsh
X-Received: by 10.37.39.71 with SMTP id n68mr1468361ybn.44.1516204173477;
        Wed, 17 Jan 2018 07:49:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516204173; cv=none;
        d=google.com; s=arc-20160816;
        b=ITN2/KveynCULPatJ8v/rD91ROGHdt4IXh+w4vwKJ1qgYb54sdxgcx9LoiP+Dqglb9
         U/7Y49K03WmeRhCEVactAkyU55uaQXHF+vS28SVobnuaHWJZZbMWeH75PgteMh27q2Xt
         ZznlVUnqbltlSNSqexQChbwiOcI0gWU6Fhs3Q+7iR6hE+hxzElOD002p+bYmLmOUn2NC
         BmedmsQ5uiJHlrfX1lm26AD20DgOa9uc0YWPu+oTFwgXTTmrkCwSfEVJBEZzwi/OZCN/
         H7ErHdWwNI8J5j3uqA1Z2yEqzqBtpFxGuyvLe1VqxON3KBNVHx11TF2MwtRXJ422hlP3
         2TyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=eiHUf5pZWQaNzo7M6QGuhU/vJs/Gn5NzMlIO6bVXzLU=;
        b=z4StprZzrnm9eco056ZOXlH/CB+9FVq7pX2aeQea7koEXrgyvZSsyjThyAjgRmFUKH
         0zLAp/ZfWFd3GdzikwU2hRHF3/sEKtiWYxWqZ6wY7JjeGWLQYU/lRLcxgg6eq23nsi7q
         SfcvdF7iy8b+rFXknbZ/7wBzM6bkAPjp79MrS+/BwBJEeA8PxquFUKsK9TNyck3+dd+T
         LqBwYVhakDwNtbRizaPXEC0VgGiPzrA4498sGCpdcTSdk6NPkKmFWWpUWWCu7Hp5WE+D
         ETH1GfMqJEvH9p51ZjhpSusTZJvn/ej7IcoKSLhPThBoeMPar+c+xPdKycXzyCYHXXpU
         AXzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p15si1240668ybc.557.2018.01.17.07.49.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Jan 2018 07:49:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44185 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebpy0-0007sY-S5
	for alex.bennee@linaro.org; Wed, 17 Jan 2018 10:49:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ebpuF-00056d-M8
	for qemu-devel@nongnu.org; Wed, 17 Jan 2018 10:45:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ebpuE-0008Aa-Rc
	for qemu-devel@nongnu.org; Wed, 17 Jan 2018 10:45:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57254)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1ebpu4-0007wQ-DX; Wed, 17 Jan 2018 10:45:28 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47FCE76540;
	Wed, 17 Jan 2018 15:45:22 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 735E74A9;
	Wed, 17 Jan 2018 15:45:20 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 17 Jan 2018 16:43:13 +0100
Message-Id: <1516203816-19374-2-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516203816-19374-1-git-send-email-imammedo@redhat.com>
References: <1516203816-19374-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 17 Jan 2018 15:45:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 01/24] arm: cpu: add TARGET_DEFAULT_CPU_TYPE
 macro
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vG0EO6y+S4PG

it will be used for for 2 purposes, 1st is to
provide to cpu name resolving class for machine 'none'
  cpu_parse_cpu_model(machine_class->default_cpu_type, cpu_model)
and later to replace a bunch of ifdefs *-user/main.c that
set default cpu_model with cpu type.

With the later in mind set it to 'any', which is current
default for ARM targets.

While at it, default cpu_model for ARM is set to 'any' under
TARGET_ARM, however there is catch all ifdef which also sets
cpu_model to 'any'. Drop unnecessary TARGET_ARM ifdef and use
catch all #else to set default value.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Riku Voipio <riku.voipio@iki.fi>
CC: Laurent Vivier <laurent@vivier.eu>
CC: Peter Maydell <peter.maydell@linaro.org>
CC: Andrew Jones <drjones@redhat.com>
CC: qemu-arm@nongnu.org
---
 target/arm/cpu.h  | 1 +
 linux-user/main.c | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9631670..c87bb76 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2171,6 +2171,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
 
 #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
 #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
+#define TARGET_DEFAULT_CPU_TYPE ARM_CPU_TYPE_NAME("any")
 
 #define cpu_signal_handler cpu_arm_signal_handler
 #define cpu_list arm_cpu_list
diff --git a/linux-user/main.c b/linux-user/main.c
index 450eb3c..a35477e 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -4325,8 +4325,6 @@ int main(int argc, char **argv, char **envp)
 #else
         cpu_model = "qemu32";
 #endif
-#elif defined(TARGET_ARM)
-        cpu_model = "any";
 #elif defined(TARGET_UNICORE32)
         cpu_model = "any";
 #elif defined(TARGET_M68K)
-- 
2.7.4

