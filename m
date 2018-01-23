Received: by 10.28.71.27 with SMTP id u27csp3772557wma;
        Tue, 23 Jan 2018 00:17:53 -0800 (PST)
X-Google-Smtp-Source: AH8x226J5/hHSW6WalxOZIxiC/SPtkl2MEl2ebIiNbxr7tktBVTuZ8T/A40ZKwz8VnqAt+4+e8qM
X-Received: by 10.37.216.213 with SMTP id p204mr1637918ybg.446.1516695473473;
        Tue, 23 Jan 2018 00:17:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695473; cv=none;
        d=google.com; s=arc-20160816;
        b=r1xo+pQSvdLBVFiyI6wudkk/4YLvi4HUjHUSj2PJ9M/uGWD1hgAbUGjL+Fjq6xZR4R
         xieyuKzH7591bYxpSHfqN2+sacXqrhdKfrMmPHXKFKPgmmics70DT8Miif7KQWI8+B3R
         I52SbcEfTG2RFYRRjB/YDEWdiskmsv5BRNWqzGlAw0my1UUX31CLGQWWLEIvKMuFctg4
         KSd2Ak7a0mMvCBciVZGa5O3zBab50jGFvKq19GtbQn3hdXwZQNJOqoAKUidbisqJT4Nv
         rSJ0kTCaVBy/0MdLm74eyQic+n9XI5Ojn+J6qRJ0u2xN7N5qHyoW73o75FeVtodzEtkP
         iqUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Un0vypPBubBEJ+n6MMdJTLCft9MRLnaIhAdwS76GbmY=;
        b=TYtbfkED6q40TwMy3fS/dBpa53Hrff61UN9kgWjLr1lmnhgRLAw6rBjoMIpbSaPQav
         vFKpaCIQ6ZLibmQ0izDsHbqU6LMuyXO54T7g+WVmE2JPKrFjjbylrOua7CvrQ/dhtCof
         xGMbwk/ZPiW3RHWMGelVtsdNe79U2tzH7h2GuciCAfxMZMYH6FVFK+bx1HPPbEWb1/RP
         gzeL3a9du6hqylSSY1ThouEM6luK1CIPPL0HBnSFIS/gKFukr03doOhFDr1Jln0tdre1
         nKqxVzYeJ6Z5OvBNXd1isgT7IpqJDa8LnwhgryFnUcEg02rQfaekU7n2ZgtNYms7cOXu
         tNcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f84si1286718ywf.598.2018.01.23.00.17.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:17:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtmC-0005KZ-Pm
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:17:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfK-0007sK-PF
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 03:10:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfJ-0002CT-Dp
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 03:10:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52382)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtfD-000289-A7; Tue, 23 Jan 2018 03:10:39 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8744313A9A;
	Tue, 23 Jan 2018 08:10:38 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12EB8D1E8;
	Tue, 23 Jan 2018 08:10:36 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:15 +0100
Message-Id: <1516694904-64879-17-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 23 Jan 2018 08:10:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 16/25] sh4: cpu: add CPU_RESOLVING_TYPE macro
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5gpo8e5eTzC1

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Aurelien Jarno <aurelien@aurel32.net>
---
 target/sh4/cpu.h          | 1 +
 tests/machine-none-test.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index a2c26e0..709e0ca 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -278,6 +278,7 @@ void cpu_load_tlb(CPUSH4State * env);
 
 #define SUPERH_CPU_TYPE_SUFFIX "-" TYPE_SUPERH_CPU
 #define SUPERH_CPU_TYPE_NAME(model) model SUPERH_CPU_TYPE_SUFFIX
+#define CPU_RESOLVING_TYPE TYPE_SUPERH_CPU
 
 #define cpu_signal_handler cpu_sh4_signal_handler
 #define cpu_list sh4_cpu_list
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index b3a346d..134036a 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -45,6 +45,8 @@ static struct arch2cpu cpus_map[] = {
     { "ppc64", "power8e_v2.1" },
     { "ppcemb", "440epb" },
     { "s390x", "qemu" },
+    { "sh4", "sh7750r" },
+    { "sh4eb", "sh7751r" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

