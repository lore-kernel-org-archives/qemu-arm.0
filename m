Received: by 10.28.71.27 with SMTP id u27csp3774530wma;
        Tue, 23 Jan 2018 00:20:39 -0800 (PST)
X-Google-Smtp-Source: AH8x2269SE9qKDxEgwpgVGyN6zszufW5JzNl6I8FVi3SYUPJ6jmRUh2Lc5r25JxKN3X8JmhWI2T3
X-Received: by 10.37.5.86 with SMTP id 83mr1612226ybf.322.1516695639742;
        Tue, 23 Jan 2018 00:20:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695639; cv=none;
        d=google.com; s=arc-20160816;
        b=Eg0a3QtcU4ju6emoOoEDZ/oSxCSrXSimRDlNkH9zWeDYTLwDTBkVFLmWmUbCLfwtG0
         jwpkC2Nkeo3AyFMYh4sBIkWYS8zUA+02FADXJMKnw/DyMcOruRByzNzFWiqrT8ZkokG4
         jk3QXNzUHFBt2tsRQ8F+RZzM6nUD8P0mmoftoqLAql1E27p0QLznXHwcdAw1AgLInn+k
         GVo7viWFXYBdyqTvcuO156uE/E/wCdioRzNxmFZWIWFkg8eAnjijGjIWEyQz6GmfuImM
         c6aeMXOkpqIPOuGvynE4WS6EPfwk1Yf3PVWBeZiQmVMtF93KSBDTjWWorr8vhTmdwwqo
         vfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=CMUw2JSoGsjHdgJai5JnJovpMwma4y8D73oR3eaGkSI=;
        b=ZHCDm/XcZ5r7r5zshPpuIfQzm7Jdz5QOdg+UtRxwPLxyGYApXI1XOTCDxtIXufXHau
         oAQJd/1K9wA5SaXy81sHGS5UPmhYMNQjvkweC+dGXO5nD1eNCfA/rZCHt51l4JYP7WcP
         3Xmbqxy854iCbLuDIK5WtyStoySU4ss+WP4ohmr72JNcaWgmzElw+6Mb4iT9JujI5e2W
         6zu0bfuRYs8/RTzfo54FSEx4Or26N91hHkG8laRBMQjZLETbgBqsYo48IacW3USe3z5I
         pAWDUO36aRFLgDlrSK32pBNOA5IynTFhy7o/aoUTe/owRbQTmuIFM2yi57VYy9XQ02Or
         z9Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o199si3964687ywd.178.2018.01.23.00.20.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:20:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtot-00082o-5Y
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:20:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtf9-0007bd-Bl
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtf5-00023H-MA
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41523)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtf5-00022r-Ef; Tue, 23 Jan 2018 03:10:31 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A519F13AAB;
	Tue, 23 Jan 2018 08:10:30 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D74599CCB;
	Tue, 23 Jan 2018 08:10:28 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:11 +0100
Message-Id: <1516694904-64879-13-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 23 Jan 2018 08:10:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 12/25] nios2: cpu: add CPU_RESOLVING_TYPE macro
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
Cc: Marek Vasut <marex@denx.de>, Eduardo Habkost <ehabkost@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TRbvT4h1zhp1

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

TODO:
 make nios2_cpu_class_by_name() to do name check instead of
 accepting anything

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Chris Wulff <crwulff@gmail.com>
CC: Marek Vasut <marex@denx.de>
---
 target/nios2/cpu.h        | 1 +
 tests/machine-none-test.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 88823a6..2234bff 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -232,6 +232,7 @@ void nios2_check_interrupts(CPUNios2State *env);
 #endif
 
 #define cpu_init(cpu_model) cpu_generic_init(TYPE_NIOS2_CPU, cpu_model)
+#define CPU_RESOLVING_TYPE TYPE_NIOS2_CPU
 
 #define cpu_gen_code cpu_nios2_gen_code
 #define cpu_signal_handler cpu_nios2_signal_handler
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index c15a857..c6ad495 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -39,6 +39,7 @@ static struct arch2cpu cpus_map[] = {
     { "mips64", "20Kc" },
     { "mips64el", "20Kc" },
     { "moxie", "MoxieLite" },
+    { "nios2", "FIXME" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

