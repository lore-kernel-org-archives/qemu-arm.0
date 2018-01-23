Received: by 10.28.71.27 with SMTP id u27csp3766665wma;
        Tue, 23 Jan 2018 00:10:31 -0800 (PST)
X-Google-Smtp-Source: AH8x224GfMrgZvTK+jARcapdFLVpcsYw7PZ/L8vRtq8yrdDv83byvPmIGcIqOpee+J0JW7lDLYw9
X-Received: by 10.13.232.131 with SMTP id r125mr1604235ywe.338.1516695031687;
        Tue, 23 Jan 2018 00:10:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695031; cv=none;
        d=google.com; s=arc-20160816;
        b=0A+z2L4+dVJECCie0DSKkJASUlR8WGLVGExF7x76vZDlyXzHQOr58CgMsuridVMN9x
         IEj7Efx1Nm1l3Lag490D9Q9mSEFD+rUD1wVDsvJtAb9TjtP4Mr4SqhVh7KuHXTtgkpKL
         nxpQFhuMKaWvjaEEM3GCgdbvVoTWTC7XM8qbFslWvlGAk0MPAP8wILZp2Ch6qzryV+SJ
         PXcJ4EerqI0pgyk4AUxFzRM2ucBkARdLZzfNUpBtVHjK6cPy7ftlOqPzdDDdfKcYcDld
         lH92oLZQgK12D6Y2yyO+7r8Szmq5p0gVh8wW+rFq4PJ3kFemP8K8EMyEF3SanCtH/ryG
         4fMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=t4tHVKX4H2XI73lM+E+LylxMBj8uJTfanYHAfPkE/8g=;
        b=Esn8P1RhCRO/RFneZy5tad4gddIpR3oqpM45XBscX9hj9VZIXLJhKEZ/0okHNRSJZl
         nQVMMWtdi7hROXhgtf7enbR/51v2xcZFZSzpmbBkdQ3fPHJSYsCu2g3iRAtpqCCE/bmU
         k5ndqYd7UYqH+qRNINTlABdQhOpdIKXT7XT0szXNpe5PBtEliaji0cuuUF4drQnwG3Gg
         a3vDNW2t+CVNy/1aw1PZ0nUAzAXvfYTjDhIshsNcMwh1GMwQJMUOs3yARWKTHwGCvQKp
         rbmTc5Vq60YUCdKmZMT0RXP8g59mfTG3tvgb/7hI0ftoCmQXGqtv7i/qT2pY1qkIBkAq
         3wgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u140si3964911ywf.526.2018.01.23.00.10.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:10:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtf5-0007Hj-1v
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:10:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtep-0007Fu-NQ
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edteo-0001sZ-RB
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52110)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edteo-0001ry-Jn; Tue, 23 Jan 2018 03:10:14 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2C0415557;
	Tue, 23 Jan 2018 08:10:13 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C0A5D1D1;
	Tue, 23 Jan 2018 08:10:12 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:02 +0100
Message-Id: <1516694904-64879-4-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 23 Jan 2018 08:10:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 03/25] arm: cpu: add CPU_RESOLVING_TYPE macro
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g/m7zh6ICK5i

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
thest would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: qemu-arm@nongnu.org
CC: Peter Maydell <peter.maydell@linaro.org>
CC: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu.h          | 1 +
 linux-user/main.c         | 2 --
 tests/machine-none-test.c | 2 ++
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9631670..f9fb141 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2171,6 +2171,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
 
 #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
 #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
+#define CPU_RESOLVING_TYPE TYPE_ARM_CPU
 
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
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index 2eb13e8..1b213ff 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -24,6 +24,8 @@ struct arch2cpu {
 
 static struct arch2cpu cpus_map[] = {
     /* tested targets list */
+    { "arm", "cortex-a15" },
+    { "aarch64", "cortex-a15" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

