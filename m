Received: by 10.28.71.27 with SMTP id u27csp3766873wma;
        Tue, 23 Jan 2018 00:10:48 -0800 (PST)
X-Google-Smtp-Source: AH8x226D+iS4vvkJzw6QrCsmyuueXIIUFumeo46NhKKBLCp1jT+9MoOBrNLR2+V9npalh0sIVvKX
X-Received: by 10.13.202.20 with SMTP id m20mr1593998ywd.81.1516695048238;
        Tue, 23 Jan 2018 00:10:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695048; cv=none;
        d=google.com; s=arc-20160816;
        b=SJsSDVRrNkV/b16VbArTWjrRc8fZ7OWlGpuvnJlnUa+LKIucNzW67MxgFFp4w4vqQV
         fXSfulqG7FTF1zXUPFRc6pXcFlbARoDs8csQGLFtIGAnhHEWHijGwaBBDqKUwZEjrA9r
         Z7Mox1B4xkCvTYFT6WgETbvJy31AX9u0phkyi1ZKeWxgGI8QAO40Nplvxes5xzJccXJo
         /y4EsbUoTFwvLz6Y7zfPrraqZP/v9g5xMI3Ax/PwTHAkHuhVV7z7ZCPOL6E2V0EKiVA9
         EqV1/P9zfKQHFxv6s3YxNQFtzNO3bQs9qMvga8GBDyIbbmD5E7cR7JXpbqSK1XyweAuP
         TgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=s/daCY5a4gGAc+688AVXCDDq57qpVoEznvN/TQCACLE=;
        b=nWAqIMzA8JeLJga0i1hZw0Nq0DYUjAU5ucv9UaWsE5EsLXPG/EU5XRlPWDgIbi5GCo
         TfjL8ENjfSJynzkXzMhSPgTJTNQ0XrOJ1M1CbNSfjZ7NnIS1fYiL5KTWbKcv7fp8E7eF
         /kacrFVtmJTLiJDLG4BEjZUdX5eOYi9YPwJQh9srftYxP2GBu7sby4iIzYD0vGBYvaja
         AdsiqrTxzuxdT3Vym5s53XX0fqZXmSY+180qeoFhU0vkelNbUnEg6RMeWX901EK1SveH
         y435EKXfc46wrXH0h2aPUE0u253xOgpTHZpxtXXdGwofYV67V/DVlPetOEbTIinly6Zm
         H9Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a202si2335301ybg.743.2018.01.23.00.10.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:10:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtfL-0007Zb-Ir
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:10:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edter-0007Gq-6E
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edteq-0001tQ-Dp
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35930)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edteq-0001ss-8T; Tue, 23 Jan 2018 03:10:16 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75645820F3;
	Tue, 23 Jan 2018 08:10:15 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 265FD63F94;
	Tue, 23 Jan 2018 08:10:13 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:03 +0100
Message-Id: <1516694904-64879-5-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 23 Jan 2018 08:10:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 04/25] x86: cpu: add CPU_RESOLVING_TYPE macro
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
X-TUID: rYGpkOS7hWMA

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.h         | 1 +
 tests/machine-none-test.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 30cc562..82c7381 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1568,6 +1568,7 @@ uint64_t cpu_get_tsc(CPUX86State *env);
 
 #define X86_CPU_TYPE_SUFFIX "-" TYPE_X86_CPU
 #define X86_CPU_TYPE_NAME(name) (name X86_CPU_TYPE_SUFFIX)
+#define CPU_RESOLVING_TYPE TYPE_X86_CPU
 
 #ifdef TARGET_X86_64
 #define TARGET_DEFAULT_CPU_TYPE X86_CPU_TYPE_NAME("qemu64")
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index 1b213ff..4b704fb 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -26,6 +26,8 @@ static struct arch2cpu cpus_map[] = {
     /* tested targets list */
     { "arm", "cortex-a15" },
     { "aarch64", "cortex-a15" },
+    { "x86_64", "qemu64,apic-id=0" },
+    { "i386", "qemu32,apic-id=0" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

