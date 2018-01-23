Received: by 10.28.71.27 with SMTP id u27csp3769219wma;
        Tue, 23 Jan 2018 00:13:48 -0800 (PST)
X-Google-Smtp-Source: AH8x225ZGGh1QNMnIEdx+890ByLkE63S/fkuBzKe1f3+wS+R9xbuffL3iGetUv/VPu2MUuXKIpV6
X-Received: by 10.37.174.72 with SMTP id g8mr1610118ybe.474.1516695228890;
        Tue, 23 Jan 2018 00:13:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695228; cv=none;
        d=google.com; s=arc-20160816;
        b=l3nprng8pIRb8HGutclCXEtlqCN3kzhp1aJgFcRJpp/RkZyTbTvkbXbq1tPQSCyTfK
         pOh/9NCpQ0n1vIzxdTILz75jpAsZb3bVXUPDPGVG0dyUsASZTHw1ovqZ+s/w6NA2Ntfy
         E6pRIJfzoVSjgVdcaGJExSt286Epc4XxRSVu2TjHxBzI1kR1TNpBEXajEKjfrLzVuXmG
         vDmCuKwt7As5+R+H2e2D/2zeub5v/cX6xQH1kTegt6O2kIBNgnnWGDzko8i0XtkUliwj
         j+Q9Qo961/+Q2a5GHfKjUh+fSvXrXMHODLHrlL7gmEjDEfHC+6xGeLlle6UvjN4sSIIW
         8xbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=IF7tKA3fy2wjVq9x5MtMK1FosQiZvqvsQwhvOXuuP4o=;
        b=rxxtTxXMr17+u5aU2e/huyvAxQv6mnBDWsxhLmbTzFkWG1bHPzy7mEP1QAL9RrNCQt
         BhlxZu9N3XOh6iqkdkyS2ZK71IgSZwJjBlJQzOFo20YBJSXA+duM4e2xpblwUGI8+ElU
         yuTNq/oPDtZBM0BhJmQqSRRAL0j5pzwFcSke7J1wku6xOrUWz0Q4vVU4nJUU8nWx4dk1
         GvH1idCTiDjrEJMFGIiuqzfVDcYhkqL8ERa+WIfZmrYOPvi9n7AGS42r+Uj95SWC6yk6
         pkmhz2u8k6V1s2YHs+s3oxhDvwZKn8vjneDCstqj5yn6CcNhIv23tARUFCdQZL7gcrLp
         SylQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u188si408941ywd.25.2018.01.23.00.13.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:13:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43829 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtiG-00029Y-89
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:13:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtf0-0007Qe-TS
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtez-0001zH-P2
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56834)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtez-0001yF-60; Tue, 23 Jan 2018 03:10:25 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5953981DF3;
	Tue, 23 Jan 2018 08:10:24 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D99DDD1EC;
	Tue, 23 Jan 2018 08:10:22 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:08 +0100
Message-Id: <1516694904-64879-10-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 23 Jan 2018 08:10:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 09/25] microblaze: cpu: add CPU_RESOLVING_TYPE
 macro
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
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iZ8bLl7OmCrZ

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

PC:
 target cpu can't be instantiated with -M none -cpu
 Add FIXME note in test, so microblaze maintainers
 could fix it in future and add proper error checking
 in cpu_model resolver which accepts any junk now.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
---
 target/microblaze/cpu.h   | 1 +
 tests/machine-none-test.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 52b6b6a..492f9f7 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -344,6 +344,7 @@ int cpu_mb_signal_handler(int host_signum, void *pinfo,
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
 
 #define cpu_init(cpu_model) cpu_generic_init(TYPE_MICROBLAZE_CPU, cpu_model)
+#define CPU_RESOLVING_TYPE TYPE_MICROBLAZE_CPU
 
 #define cpu_signal_handler cpu_mb_signal_handler
 
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index c9445b6..984def6 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -32,6 +32,8 @@ static struct arch2cpu cpus_map[] = {
     { "cris", "crisv32" },
     { "lm32", "lm32-full" },
     { "m68k", "m5206" },
+    /* FIXME: { "microblaze", "any" }, doesn't work with -M none -cpu any */
+    /* FIXME: { "microblazeel", "any" }, doesn't work with -M none -cpu any */
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

