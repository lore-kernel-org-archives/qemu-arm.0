Received: by 10.28.71.27 with SMTP id u27csp3767346wma;
        Tue, 23 Jan 2018 00:11:22 -0800 (PST)
X-Google-Smtp-Source: AH8x2272bxiDekifonDft+61/1PVWTKH7BqnqxhZQp8ydKopwecx7YS5xVIgqidBCrwizPEmu+Ew
X-Received: by 10.129.154.146 with SMTP id r140mr1554235ywg.442.1516695082420;
        Tue, 23 Jan 2018 00:11:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695082; cv=none;
        d=google.com; s=arc-20160816;
        b=EjNC7Rmw42DxQl/RYB0lR1JPgF/X/JLeFyTNHx2IVuohjbwwxGFS9xe7iM/fpOzp/y
         CAh7Sy2BvOf/GUg+ztMYQdFS0rJBSy6Rn3RXYh3QYb/oquolY7BuaaIIWzFdhiQ+t4ef
         aBo44IvHGc6z2jSjaGI8p8I6jhP6VBZgf/oz9/1AwRXXsBBRuNJg2laLxqyuDtylz/ak
         gHHkYR9aphdXvHp0Lz8LHlgs4uJryfpE7VU9NwnCOsAXRj1zktdBBb1fwL0OjuEpw89d
         gfrr/gwKAEDqlLC13Fdbao/IglYCPYs3pOS6SF+CcYr8pPaJEXJT4WdPAghCOMwhKndT
         nLGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Z7goL2WmEJPOzxS4VaobJOQZl3yhEfQyrpVeFRA2XNU=;
        b=cSC0IOF2b3vDpdvUAcOnJMxry5vD8M6rWJLCfuirFfsaQq7iGzwqC6oye2a8ILPWu6
         F0EaL6YKIa/symIJ9JmY0jA2l1etBsf3RC1xy9ImE3Qc3nebK30WsvwEOJlAiUSEw2XO
         WAOOGLe8ZFtbiKilCNmzXThinPboE4m1PzYvEce7JPt9Wxytem2jcZ86xKVOcNaS/TAA
         jC5RpH4e4jvuogA/kKsSRSUEvTgCWJCKL4VUfqO+ASCFsj2XZ+HwDVAjDKO8L0uvvSAH
         NOBEMAMPTLEnnG7vGh+oIrB5Ln7uQDC3XdPLi/oWccTaJRmHLntO5o9cxhOIRHsNtkkG
         oNQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v191si4087491ywg.131.2018.01.23.00.11.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:11:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43814 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtft-0007pz-Op
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:11:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtf0-0007Qc-TL
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 03:10:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtez-0001z6-Nh
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 03:10:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35982)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtev-0001wU-Oh; Tue, 23 Jan 2018 03:10:21 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE2AD883AE;
	Tue, 23 Jan 2018 08:10:20 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60A989CCB;
	Tue, 23 Jan 2018 08:10:19 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:06 +0100
Message-Id: <1516694904-64879-8-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 23 Jan 2018 08:10:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 07/25] lm32: cpu: add CPU_RESOLVING_TYPE
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B/1f1xFDz2J+

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Michael Walle <michael@walle.cc>
---
 target/lm32/cpu.h         | 1 +
 tests/machine-none-test.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/lm32/cpu.h b/target/lm32/cpu.h
index 2279594..0656052 100644
--- a/target/lm32/cpu.h
+++ b/target/lm32/cpu.h
@@ -259,6 +259,7 @@ bool lm32_cpu_do_semihosting(CPUState *cs);
 
 #define LM32_CPU_TYPE_SUFFIX "-" TYPE_LM32_CPU
 #define LM32_CPU_TYPE_NAME(model) model LM32_CPU_TYPE_SUFFIX
+#define CPU_RESOLVING_TYPE TYPE_LM32_CPU
 
 #define cpu_list lm32_cpu_list
 #define cpu_signal_handler cpu_lm32_signal_handler
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index 68f7a30..1159290 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -30,6 +30,7 @@ static struct arch2cpu cpus_map[] = {
     { "i386", "qemu32,apic-id=0" },
     { "alpha", "ev67" },
     { "cris", "crisv32" },
+    { "lm32", "lm32-full" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

