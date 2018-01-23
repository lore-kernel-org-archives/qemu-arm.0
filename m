Received: by 10.28.71.27 with SMTP id u27csp3769933wma;
        Tue, 23 Jan 2018 00:14:43 -0800 (PST)
X-Google-Smtp-Source: AH8x224zKk5yEI8zFgLslLALFDZNTEJUccIaC63uZfTnW1RBoj4m54oJupupXgBn7Ka5ZYmm01+C
X-Received: by 10.37.44.85 with SMTP id s82mr1593878ybs.248.1516695283594;
        Tue, 23 Jan 2018 00:14:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695283; cv=none;
        d=google.com; s=arc-20160816;
        b=Zqf2T9llXJ6jenInSKMClcrx/NRSm6sjSexk4dEduR6hBazhJgTqFchKcIEkNU/RV8
         YxezieymuRKbksXHCHAfQ03Kh41jdXqTnzYTZ4cQxnjSaPNx1pTzaCUXtgCWkkWfpK3N
         57IVdMDGajMpHcd9TO5zgrBqekmLtbCF/pR81COjthyUZEakSm7nR/kYEdyVKONTek+c
         TBYmf1WmIMoC4UjL0bPKqLkDyFISUslMjOYpVuT5PFIqvyJ1ZS0iWijgQilfupShTFJF
         Z9biOgfrFpij8U9QA17SrL16OL2xM1NaF3SdWYUT25s2MLaNLkIeNSoaSd2gVYmOISv/
         1Uhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=+uE3hkiTWH0WD6nMFXKEakIyo7uwQnREBUQsSYO61oc=;
        b=N89FJu6ahLwlqD5Nc5Vp6yNUlGXOH/yNAnK9nr2VHJ1K8DFiss51C02r7IppxxB8/M
         Wo4eF4s21iDqCIhn2VsfevzlIcl4EtQIwHpQAfu1tYwbYPSpiyJ4Pmax7IcYf2Zwpadd
         3iyie7OmKhraRpC6mMRbqBxTF46/iLEgko1s1gTjyYf+EAO76/o497Btm63Dx3j8uv4J
         gy1XYpAvpDZ59/IoK5+jndtu7uchXURzmdDHMcUW1N/uGA/kgqfY/55S4O8706vLgFLF
         PsdbnqRQNHnqEq6MuYIwa4zElLHlE/OzyE7hnUcHcyss6bVHg32nUfv4G2jImcpw80z1
         jKKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w188si3935389ywc.570.2018.01.23.00.14.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:14:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43838 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtj9-0002ec-0E
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:14:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfA-0007d1-EC
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 03:10:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtf9-00024k-6d
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 03:10:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49454)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtf3-000214-BI; Tue, 23 Jan 2018 03:10:29 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EAE04E90B;
	Tue, 23 Jan 2018 08:10:28 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 189C663F94;
	Tue, 23 Jan 2018 08:10:26 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:10 +0100
Message-Id: <1516694904-64879-12-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 23 Jan 2018 08:10:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 11/25] moxie: cpu: add CPU_RESOLVING_TYPE
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Anthony Green <green@moxielogic.com>,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uFGPqaU08obx

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Anthony Green <green@moxielogic.com>
---
 target/moxie/cpu.h        | 1 +
 tests/machine-none-test.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
index d37e6a5..3f94a5a 100644
--- a/target/moxie/cpu.h
+++ b/target/moxie/cpu.h
@@ -124,6 +124,7 @@ int cpu_moxie_signal_handler(int host_signum, void *pinfo,
 
 #define MOXIE_CPU_TYPE_SUFFIX "-" TYPE_MOXIE_CPU
 #define MOXIE_CPU_TYPE_NAME(model) model MOXIE_CPU_TYPE_SUFFIX
+#define CPU_RESOLVING_TYPE TYPE_MOXIE_CPU
 
 #define cpu_signal_handler cpu_moxie_signal_handler
 
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index 9bc6a06..c15a857 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -38,6 +38,7 @@ static struct arch2cpu cpus_map[] = {
     { "mipsel", "4Kc" },
     { "mips64", "20Kc" },
     { "mips64el", "20Kc" },
+    { "moxie", "MoxieLite" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

