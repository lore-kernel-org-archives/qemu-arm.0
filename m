Received: by 10.28.71.27 with SMTP id u27csp3847643wma;
        Tue, 23 Jan 2018 01:53:18 -0800 (PST)
X-Google-Smtp-Source: AH8x225IK8uw1quy22Hd0gyUrvgBh/lSzA33eMvTUJXQ8ZvdvciNU1Rv7YPR934427MbpHEMWmyb
X-Received: by 10.129.235.3 with SMTP id n3mr1844895ywm.118.1516701198343;
        Tue, 23 Jan 2018 01:53:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516701198; cv=none;
        d=google.com; s=arc-20160816;
        b=EN0YaxtYzUBa8Rbw48QRb4VUiUU3S3tazaDP/6m8iyTl7zMhQO8Wrh4twJ/4UXzGVF
         3cp44sJj8+ffdmuY/F+dbN+XU1r24186Jd0JA7kNmO7HQBBvg2H/kHM6Q9ERI7BukdeW
         HgqbjmkEermykvLarvl7DCDWqVu1kTI1wCMeyuxdhvQj+UjOVMjYmuBaHP81wJqlr6M3
         ZC+RO3FlzhuDt+JZloPP8S0GK/tKiLTjAFfFZqlD/aHm2ppgjH9Ayyfsc/vBrmH8BzBp
         C3fWe4zRoRdIJa7sNMaSFniPCFI7SYCtou1PXUI5j44TIfArF2xiSSH1dmTeoroKcDwD
         GMPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=pkYUWdrUn/o+I2SWQyPQ3uYadqaeqbLl/kAUPTtJtPM=;
        b=g/xkjNpdeLybYls8imrgavPCfWlrjIgtZMHrvKFFrwV7geW+EDg0ew67b14UqdZ+Z5
         FpqXjZ2XRuUEwKLiDhwlP8VkvHij2pKb6RnUW2FhMm/T6OwpwsrS6N/xIXFuY/mCZ2c7
         Gq1W3qhBV2Vf+47fAXwA0bjG9UuTSbCteqKc+55qnPLEkz/o2S4D+fMXwRaGm5eBVmUh
         vuOmfLfadJ16IafPGi+ygkTPmAcJARB8Dx68yI8LINjPo4dB+Dszgy4gUuMQgRnPSUc1
         7fKSP0W91RUH+JowVKpQXMMaefqrrVqeKH+5DVPegl9cCoyzT+ew1eGaC/HNqzHAo/5G
         LJHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u6si1299692ywa.221.2018.01.23.01.53.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 01:53:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edvGX-0004o8-R3
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 04:53:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edvGJ-0004lC-De
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 04:53:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edvGF-0000qT-3H
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 04:53:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56876)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edvGE-0000pm-Tf; Tue, 23 Jan 2018 04:52:59 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C95A319F57;
	Tue, 23 Jan 2018 09:52:57 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18847859E5;
	Tue, 23 Jan 2018 09:52:50 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 10:51:12 +0100
Message-Id: <1516701072-81109-1-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-4-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-4-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 23 Jan 2018 09:52:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 03/25] arm: cpu: add CPU_RESOLVING_TYPE macro
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
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BpFkjSlO+mVp

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
thest would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
  - use cortex-a57 for aarch64 test (Andrew Jones <drjones@redhat.com>)

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
index 2eb13e8..06139f5 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -24,6 +24,8 @@ struct arch2cpu {
 
 static struct arch2cpu cpus_map[] = {
     /* tested targets list */
+    { "arm", "cortex-a15" },
+    { "aarch64", "cortex-a57" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

