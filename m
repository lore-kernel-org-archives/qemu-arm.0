Received: by 10.28.71.27 with SMTP id u27csp3779105wma;
        Tue, 23 Jan 2018 00:26:55 -0800 (PST)
X-Google-Smtp-Source: AH8x226iui30IKMRARqIhu2o0dSjTwo1fkxxXXJueNfIVfocR6KlmZSBzyqMwwfkERcocZvlEpFO
X-Received: by 10.37.223.70 with SMTP id w67mr1663894ybg.382.1516696014911;
        Tue, 23 Jan 2018 00:26:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516696014; cv=none;
        d=google.com; s=arc-20160816;
        b=VmWjigX5KUUKY9p5jnCkCv8SKvlDMxVgCV+OCtNVT8BEbUntDXsEBR/iooTyo+cDS2
         p3vyr7NBQ4fU/Ic1hpglr2IXPdC/YhNEDUQxSXEcww6l23CcqceMI+GMFiB/78w3BgDr
         pjabi0iTmoMyV9Rk9xYFmsKIC+aowf5ml0/QFiD9FV4ECwy3yBqS0HDTWXwGivWnIEwE
         7b6nhWGQvonp2nimoI+bJ9DwTv/cjMVMFRGurQkrmBJRSREiJ0lWS0nH5c93bHZutaBK
         be1nPkE/q3FRGypVLK+9ddYFNak2iqoJUwnpb2bLn/oXtuo0hQExZ+3dbY+yam1RZ6vn
         HVjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=pMzkzv/4suYKAxlOSM8mXg6eGhQnDfnn/mXh7wfkAEc=;
        b=ZbJIpkv1cNfxsrQm4feVau9zw0w7PXAFUYbkrdwsmdP6tkAZZIB2dn9UWiQIm+Q0B+
         42mc/z/RLhDgLNDVW+XHaSqYnwW7tFHeBhczOsTTMBZ1l+hdaDWBCgzYq50Kecq5adSX
         5eG922QKO76TcbCk5r6hr+h77YH+/grm3LaHCvvCGzei/33ecMot2CJHud+lU++L8+D6
         w29x8X0ZP7toOw6isppN8oh12UhhymbdFRj+5+SbzfNKPDfMW41TiiAH+OfIknQmlhRk
         MADfxiLKg4IeaXQ3WBi45Cui5jOQuHaBBMxuhOmGhQD0G7wyDjPCIQZ/AlEZBpZe7hmx
         9DPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c9si2328266ybj.370.2018.01.23.00.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:26:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtuw-00054W-Al
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:26:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtf9-0007bT-6Z
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtf7-000248-FE
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49508)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtf7-00023j-74; Tue, 23 Jan 2018 03:10:33 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D7264E90B;
	Tue, 23 Jan 2018 08:10:32 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC8009CCB;
	Tue, 23 Jan 2018 08:10:30 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:12 +0100
Message-Id: <1516694904-64879-14-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 23 Jan 2018 08:10:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 13/25] openrisc: cpu: add CPU_RESOLVING_TYPE
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
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Stafford Horne <shorne@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tBbtjWFoJ50b

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Stafford Horne <shorne@gmail.com>
---
 target/openrisc/cpu.h     | 1 +
 tests/machine-none-test.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index cc22dc8..9b32ea4 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -394,6 +394,7 @@ int cpu_openrisc_get_phys_data(OpenRISCCPU *cpu,
 
 #define OPENRISC_CPU_TYPE_SUFFIX "-" TYPE_OPENRISC_CPU
 #define OPENRISC_CPU_TYPE_NAME(model) model OPENRISC_CPU_TYPE_SUFFIX
+#define CPU_RESOLVING_TYPE TYPE_OPENRISC_CPU
 
 #include "exec/cpu-all.h"
 
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index c6ad495..160aa13 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -40,6 +40,7 @@ static struct arch2cpu cpus_map[] = {
     { "mips64el", "20Kc" },
     { "moxie", "MoxieLite" },
     { "nios2", "FIXME" },
+    { "or1k", "or1200" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

