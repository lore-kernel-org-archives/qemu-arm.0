Received: by 10.28.71.27 with SMTP id u27csp3777772wma;
        Tue, 23 Jan 2018 00:25:03 -0800 (PST)
X-Google-Smtp-Source: AH8x224GAweMy0EGKp+wKAZq9lLrFIO+jpM39tmMMNCLuH1UPVd2fasYb/LgNfW0Qyv4C0vRaCrl
X-Received: by 10.37.86.70 with SMTP id k67mr1576114ybb.61.1516695902922;
        Tue, 23 Jan 2018 00:25:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695902; cv=none;
        d=google.com; s=arc-20160816;
        b=OdZRqnwugEwdbI7XpQpGEtufGoxxN2d/L6L6/DGCxJcfJLW3z1t+QPhHXggE6lHo8d
         54pmrcJnYwQG9MBRNvpqFdBAQONPw04KdjvWLLg/PRunbNLhfXVmxRoriFBexyLzCFXM
         RD4UERVvAHaFntn1czURbNJBoz8tuMhx1otYyUYaIvKpvi9wy7sYYYHuu3fjvaPnB/yo
         4Rw0Ck+TsuSvqf5JLKOXLxHvB6oY2CLDnC8VUkMRjQDrUn9CoGE228Sky2N4OtsLcpjZ
         372N6JcmWIBNX2oGX57lA9ITWR5CR1/v/X1YmDwMsIiOduC5/JH0jS9ZArTgXcKkjaAN
         9HOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=elzTSpjowAqyYlr3wmCpkRp7mf3cZUqRrrx1LOivhCo=;
        b=XNDB4sPv1cBaBG5LwulK+VrGLNLhkRq5z3ND81QlnRsm6azAbtmaxZO8hQVDD3yLHg
         wQLvd4nNPKVxETzPXYEPP0BupwQwnYlvj6lDfG3YfYOyZ1QJk8mFUH2L9GTLZ+K4kOsE
         iA9D6ug8dwYD1Xi3aSV4B8eWa5m1ua2tHSbGewVlFmelXjopy6MFXfGrwtLuVv7E1bzk
         iGVzh7zxr6tY/a+89ideRg4QQWWrDdWbqhAikH0XPz7bFgpbV93O6vX9gjNCaVqBhgf0
         ESR4fFp8cKQas4drS5ezx/BOgAYWdEpvw0WQwXVcHZYJ+d3oEkazR/arKiu2MrVr30IX
         r8LA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c9si2338815ybm.440.2018.01.23.00.25.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:25:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43948 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtt8-0003Mt-Ac
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:25:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfJ-0007qP-9Q
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfH-0002BJ-Jc
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43624)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtfH-0002Av-D1; Tue, 23 Jan 2018 03:10:43 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 972BD51473;
	Tue, 23 Jan 2018 08:10:42 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC7F463F94;
	Tue, 23 Jan 2018 08:10:40 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:17 +0100
Message-Id: <1516694904-64879-19-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 23 Jan 2018 08:10:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 18/25] tricore: cpu: add CPU_RESOLVING_TYPE
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xzNf2H+rbOez

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/cpu.h      | 1 +
 tests/machine-none-test.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index f41d2ce..a2ef632 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -415,6 +415,7 @@ static inline void cpu_get_tb_cpu_state(CPUTriCoreState *env, target_ulong *pc,
 
 #define TRICORE_CPU_TYPE_SUFFIX "-" TYPE_TRICORE_CPU
 #define TRICORE_CPU_TYPE_NAME(model) model TRICORE_CPU_TYPE_SUFFIX
+#define CPU_RESOLVING_TYPE TYPE_TRICORE_CPU
 
 /* helpers.c */
 int cpu_tricore_handle_mmu_fault(CPUState *cpu, target_ulong address,
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index 0f80d7b..0430b06 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -49,6 +49,7 @@ static struct arch2cpu cpus_map[] = {
     { "sh4eb", "sh7751r" },
     { "sparc", "LEON2" },
     { "sparc64", "Fujitsu Sparc64" },
+    { "tricore", "tc1796" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

