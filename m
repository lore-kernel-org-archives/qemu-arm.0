Received: by 10.28.71.27 with SMTP id u27csp3777934wma;
        Tue, 23 Jan 2018 00:25:17 -0800 (PST)
X-Google-Smtp-Source: AH8x226e3TL/oPwry4HTtZF8AMONuU3czhzFd2agVxR9ZHlvdamwVJtzwjQna8PNzA6PIuoNvVVm
X-Received: by 10.129.82.73 with SMTP id g70mr1701200ywb.172.1516695917176;
        Tue, 23 Jan 2018 00:25:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695917; cv=none;
        d=google.com; s=arc-20160816;
        b=Nqm2rM0tR06i9VEYVs9aprnwxGzPuWJMRnh5MMUr69WRo0VwX5S+1wYgWPfsGzKpRl
         4i/61+yAStODqOXWiCsH3p1XLp3Sk6dO4Bxu/m99ZlICBfBlqec4L2UUio9JTvM1VuMz
         BS7dzQIWiLi99z1hU7e0DnAXWtax7TM1lnm48luYPIs79DcKYdg7BalhEM1w48o7WYHl
         41Tp94+xNY92odFKJw5/yL+L0+7//q2V/U64Ug/nl2W+uLiVNF9XoIi7xtpL52/Fo8X+
         AjquX8/Am9DTrZ30LY738X7wPoJQD/6YuFNar+GUXz06WesTnYZWBSfxGP2GZ44VN4Nz
         gRfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=BuLQc3kFWKBfMwKgjAvl/cTQmgp/heONdBZzArWIwj0=;
        b=gvxzdrbDeDnyvi7vT5Yl2BOasCJ2fMO7OZo1vQ/ub4lhRuV+mdAwGG4V6FrwMoc8P+
         PMMgKKeAC5Co1nNRkc7LS2xlZHcEHrdPevskJ4Q/mrK40fBxKiO4IUjfUKGjjvx+z8w3
         s2efiC/bp3bYULcuKXZkwd1r+tlmjfABlN9EJK4s8ylW55kRHgxkbDoyTcuRlzXFgfgZ
         S/SzrDqGXtFt2pEIXcr4knlRC7skI6+BHxj4PhFT25UIl2sabRx8PEtJziXgjzdiE8R1
         WMUzrSuuasoNOR2jxDPmOhmX4+gqTnLbR6bo+uzCvWkxhRNEIHsV16Mw0/Gu3G2/4OcU
         ZtWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d14si2283606ybn.64.2018.01.23.00.25.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:25:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edttM-0003cN-Hv
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:25:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfJ-0007qQ-9T
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfF-0002AV-NE
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46854)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtfF-0002A1-HD; Tue, 23 Jan 2018 03:10:41 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AEAF4C0587C3;
	Tue, 23 Jan 2018 08:10:40 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0890D1F0;
	Tue, 23 Jan 2018 08:10:38 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:16 +0100
Message-Id: <1516694904-64879-18-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 23 Jan 2018 08:10:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 17/25] sparc: cpu: add CPU_RESOLVING_TYPE macro
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AeXIqwPu8Svp

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

PS:
sparc cpu model names might have spaces, add quotes around
cpu model name when creating CLI so QEMU could find cpu.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: Artyom Tarasenko <atar4qemu@gmail.com>
---
 target/sparc/cpu.h        | 1 +
 tests/machine-none-test.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 9fde547..345b39a 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -660,6 +660,7 @@ int cpu_sparc_signal_handler(int host_signum, void *pinfo, void *puc);
 
 #define SPARC_CPU_TYPE_SUFFIX "-" TYPE_SPARC_CPU
 #define SPARC_CPU_TYPE_NAME(model) model SPARC_CPU_TYPE_SUFFIX
+#define CPU_RESOLVING_TYPE TYPE_SPARC_CPU
 
 #define cpu_signal_handler cpu_sparc_signal_handler
 #define cpu_list sparc_cpu_list
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index 134036a..0f80d7b 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -47,6 +47,8 @@ static struct arch2cpu cpus_map[] = {
     { "s390x", "qemu" },
     { "sh4", "sh7750r" },
     { "sh4eb", "sh7751r" },
+    { "sparc", "LEON2" },
+    { "sparc64", "Fujitsu Sparc64" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
@@ -72,7 +74,7 @@ static void test_machine_cpu_cli(void)
                 " add it to cpus_map\n", arch);
         return; /* TODO: die here to force all targets have a test */
     }
-    global_qtest = qtest_startf("-machine none -cpu %s", cpu_model);
+    global_qtest = qtest_startf("-machine none -cpu '%s'", cpu_model);
 
     response = qmp("{ 'execute': 'quit' }");
     g_assert(qdict_haskey(response, "return"));
-- 
2.7.4

