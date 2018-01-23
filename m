Received: by 10.28.71.27 with SMTP id u27csp3771764wma;
        Tue, 23 Jan 2018 00:16:53 -0800 (PST)
X-Google-Smtp-Source: AH8x225tv+SVxJYoacahSwo0iQPJSlnEsvQbhT6bRzUFBLm+U2Sh6uqkf0iIY9ou6pnuMaN9pCd6
X-Received: by 10.129.183.8 with SMTP id v8mr1628723ywh.68.1516695413228;
        Tue, 23 Jan 2018 00:16:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695413; cv=none;
        d=google.com; s=arc-20160816;
        b=BDZfH93nNkLQgNY5wD+3DNx+F8zPEaMCUqNAQ9Khl69KcyyDAH2ebC9cu3+k3uKCOZ
         D2/m7O3umEn+KlVMA7ruemm3vch0Zs04zFthNq6zpV8FyklrQW3272ffAFpAQrv+qTt2
         ceAoteugCy3yaD4vEqb2ob7Uf/LTBrRGq0eWd35JQgpVr+X5uV3Q5NUgn0dWJ4Skqprn
         mJyyvKojYA34Qbk0RIZQqjs/NRhvoHFZYjL/t3c11PRgTs1zHvmB/3nj+elcxOICMyj1
         1iweQKgSlSMH6rs1ft08Plb4gPrMXEd9zFl9GKq+paqRCbDLTWlS9JCU05/fsAYWCEPm
         z2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=omxN/wXbEJrmrS2fXiYEvyidLAvAFf6+hwBF0DriFZA=;
        b=IvL5Slp6CucUS/J8XLbA5NPkK3EbPBm6r4ndRSFN0ivh6FJoW1Gvt6ZrOuOjEYAhAG
         7dof/P2ghO27tdiPm5x+4jgMJrebiWPsS6wCvGIz2KQBNz3dlD2nN3lPNzgI92Ra1LWO
         MO0jvVYrP4qBpDrjAYfpZxa+d9HnFpQLgBqMz18a7ii2KikcsHz3oE1AdxdmaPHBgOvQ
         EJP0lpAlIUVnYh7xb08z7QkNGz3Hqvt8mzjQdtuAjlgwJ4p070oB2Z4WqB7f6ceVtxyo
         ZVtLVvkWayFJS3McOkr1u1P9BxlLidDROlG7Dwcczxa6r6Q7j/zhV+YMw+lyvfJRtBKk
         hBIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si1003121ybm.124.2018.01.23.00.16.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:16:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43857 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtlE-0004lx-LC
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:16:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtey-0007PQ-VC
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtex-0001xI-HJ
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52176)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtex-0001x3-Aq; Tue, 23 Jan 2018 03:10:23 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9196113A9A;
	Tue, 23 Jan 2018 08:10:22 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42814D1EC;
	Tue, 23 Jan 2018 08:10:21 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:07 +0100
Message-Id: <1516694904-64879-9-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 23 Jan 2018 08:10:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 08/25] m68k: cpu: add CPU_RESOLVING_TYPE macro
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
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cSxXoXuIBJab

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/cpu.h         | 1 +
 tests/machine-none-test.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 2985b03..8a4299a 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -405,6 +405,7 @@ void register_m68k_insns (CPUM68KState *env);
 
 #define M68K_CPU_TYPE_SUFFIX "-" TYPE_M68K_CPU
 #define M68K_CPU_TYPE_NAME(model) model M68K_CPU_TYPE_SUFFIX
+#define CPU_RESOLVING_TYPE TYPE_M68K_CPU
 
 #define cpu_signal_handler cpu_m68k_signal_handler
 #define cpu_list m68k_cpu_list
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index 1159290..c9445b6 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -31,6 +31,7 @@ static struct arch2cpu cpus_map[] = {
     { "alpha", "ev67" },
     { "cris", "crisv32" },
     { "lm32", "lm32-full" },
+    { "m68k", "m5206" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

