Received: by 10.28.71.27 with SMTP id u27csp3772255wma;
        Tue, 23 Jan 2018 00:17:29 -0800 (PST)
X-Google-Smtp-Source: AH8x227SeVO3BdGjCmalj1v091Plk1uANa1nxxfzty8tzXAgcH3hhq7RqJbkk36h1CFVkjtrFAb7
X-Received: by 10.129.4.202 with SMTP id 193mr1674959ywe.201.1516695449270;
        Tue, 23 Jan 2018 00:17:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695449; cv=none;
        d=google.com; s=arc-20160816;
        b=skB3leVQ8bWmY8hW01SqjDB8Pk8hkIRfTKfWzhRVHyE2kqTn9pdQnrU+8hxUq0jXmL
         UPw6X505D4vnztspTmkRKdpCZ7abJnfyUNSEKJoNczTaZoRX4CcaueRs9hbW0zjseMLO
         /9jGsRxK2sTJFgkNTjVQPkYpmB7NempOUHtR0GJXdjeoWjrCTGtyRFMPjxWPJZ1dbce2
         PVOInGr2/J+NTZoTedwptNkS6aXR13jAX/bmPo5Bw60bz4adHIBTV/91a/C8jDU7EzCz
         0azeHTXeE6m36N9qRriSr7zIHM+wJeJy63DgWZp9WWPoP31OkdqUM/3wrHUjGQWpXp6J
         eiMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ZI6ne5WH/eDcxNBThbJ/+lQ3YE1qMXn+Gzh8svWY0pU=;
        b=VB4Pfsv+xb4hZFoP+5UiHBYIhFxt15QjpEu8JPp5LCNLcJeDnDqriOOc1d4dTJPVcu
         lqEbYlfSArkL0FOT3jHuGVshYsh1bKSYQvnxzkjpoSih/ncw2ohCKo1/VJhRjc7qWoIY
         SvBKSFYxTmXUjf/2tyVMOWo1yjTMMvMRxEHFftBLGAS8wHrmQecO3KMcZAFihAg1/g1d
         jmbJ4jE45X3ZmQGGWj51xN9MwHgtyPaAjKjJEg7U8XVL4lCRy3VeHb7HxlIN+4o6Xsq6
         ihs9syEShC/dq5wPOO/KXNB7mcqLgP073uyreRLf+JF5xvd/+M9quUMNfKXuBBC7dbp+
         TBFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f70si4093905ywh.747.2018.01.23.00.17.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:17:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43871 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtlo-0005JI-Hl
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:17:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtf3-0007TO-Ft
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtf1-00020I-UG
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52198)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtf1-0001zw-OM; Tue, 23 Jan 2018 03:10:27 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3F7219CF8E;
	Tue, 23 Jan 2018 08:10:26 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A37FBD1D1;
	Tue, 23 Jan 2018 08:10:24 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:09 +0100
Message-Id: <1516694904-64879-11-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 23 Jan 2018 08:10:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 10/25] mips: cpu: add CPU_RESOLVING_TYPE macro
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Yongbok Kim <yongbok.kim@mips.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KDotc5P+jRZN

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Aurelien Jarno <aurelien@aurel32.net>
CC: Yongbok Kim <yongbok.kim@mips.com>
---
 target/mips/cpu.h         | 1 +
 tests/machine-none-test.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 7f8ba5f..0fcbfb3 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -743,6 +743,7 @@ int cpu_mips_signal_handler(int host_signum, void *pinfo, void *puc);
 
 #define MIPS_CPU_TYPE_SUFFIX "-" TYPE_MIPS_CPU
 #define MIPS_CPU_TYPE_NAME(model) model MIPS_CPU_TYPE_SUFFIX
+#define CPU_RESOLVING_TYPE TYPE_MIPS_CPU
 
 bool cpu_supports_cps_smp(const char *cpu_type);
 bool cpu_supports_isa(const char *cpu_type, unsigned int isa);
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index 984def6..9bc6a06 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -34,6 +34,10 @@ static struct arch2cpu cpus_map[] = {
     { "m68k", "m5206" },
     /* FIXME: { "microblaze", "any" }, doesn't work with -M none -cpu any */
     /* FIXME: { "microblazeel", "any" }, doesn't work with -M none -cpu any */
+    { "mips", "4Kc" },
+    { "mipsel", "4Kc" },
+    { "mips64", "20Kc" },
+    { "mips64el", "20Kc" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

