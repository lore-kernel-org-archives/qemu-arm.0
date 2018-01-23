Received: by 10.28.71.27 with SMTP id u27csp3778398wma;
        Tue, 23 Jan 2018 00:25:54 -0800 (PST)
X-Google-Smtp-Source: AH8x226/o+ghBZrCyNUMbzeSmgkONpi2o2K7V841YiYqV86zL7F/53vacfxs5ibvka6FimCdwKyD
X-Received: by 10.129.121.3 with SMTP id u3mr1578215ywc.303.1516695954686;
        Tue, 23 Jan 2018 00:25:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695954; cv=none;
        d=google.com; s=arc-20160816;
        b=LyJWSOUDiwBehLoOlHCIBOEdRHO6qXgvVukTXPiU/K+swO3+rmuWXF1GsyvGiP5Wsl
         3gkWSrj+5TgPAo8wG7vpM5IaEW5GUTNtCt0ZkxRTs5scND12DFvrUddRuaA6p6IHbxlO
         symNx018vx+TMEBoiZLs5cCgYm2vF+mnFHStKL8s8WY647r4BzORvVW3375jUojK/MrA
         S6tuGWAt3iX32RuPnZReZKP6Rw9hBYTJum77YohGjju0fQu3wIYNAzHapsI+0T1m4L3A
         eHxH0I4miArpT15oKnY9fYhSaO4keL2IU8fKcLHDkY9/y4fzNBNH0XYP4JNzHARXdRaA
         9aaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=W2nvlLZFS6LL960+2by43kwBP2Y+u5qqWGpwf6InUf4=;
        b=OYyhpDV+pCd54qM9z4MptOhLhD034DZcw1Zk4SwGiDFTRZjMOunsVcGjPPeZdKc5Zq
         aweB/ultMdB87l2sSbJlkhWR8izbYCi6btG6QA3GjBFj1PpRUvhSweqAzTK9p3DCzzp5
         fVshnHTsvXwznMVdUkU9tKJ2Cz708+JKkpkGpb7XTYCM83zhN5Tk9/NB3ogO1jCQeQ7A
         dXqnh2ejFlHr0UPjhlCuhRi3Mv+2XE1LXvRfzsVvr9+WrS0v5wfaxN66X5cRCJk0qsGM
         LpWmXdg76qmRR5GXXahuOHFWBy/tZq9Nl+cOATqF7kg0YWHEvLrWK6t0bW1fI5iLIQc2
         B1ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s190si1718027ywf.732.2018.01.23.00.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:25:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtty-0003wp-01
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:25:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfO-0007ys-KQ
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 03:10:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfN-0002Fi-Qn
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 03:10:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52498)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtfL-0002Do-JW; Tue, 23 Jan 2018 03:10:47 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C9D0413AAB;
	Tue, 23 Jan 2018 08:10:46 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E9B0D1E7;
	Tue, 23 Jan 2018 08:10:45 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:19 +0100
Message-Id: <1516694904-64879-21-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 23 Jan 2018 08:10:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 20/25] xtensa: cpu: add CPU_RESOLVING_TYPE
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UxXgzUUjdLqD

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/cpu.h       | 1 +
 tests/machine-none-test.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index d9404aa..23dbd45 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -500,6 +500,7 @@ void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
 
 #define XTENSA_CPU_TYPE_SUFFIX "-" TYPE_XTENSA_CPU
 #define XTENSA_CPU_TYPE_NAME(model) model XTENSA_CPU_TYPE_SUFFIX
+#define CPU_RESOLVING_TYPE TYPE_XTENSA_CPU
 
 #ifdef TARGET_WORDS_BIGENDIAN
 #define XTENSA_DEFAULT_CPU_MODEL "fsf"
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index a8a499e..a1e9980 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -51,6 +51,8 @@ static struct arch2cpu cpus_map[] = {
     { "sparc64", "Fujitsu Sparc64" },
     { "tricore", "tc1796" },
     { "unicore32", "UniCore-II" },
+    { "xtensa", "dc233c" },
+    { "xtensaeb", "fsf" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

