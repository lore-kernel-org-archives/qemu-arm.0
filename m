Received: by 10.28.71.27 with SMTP id u27csp3768950wma;
        Tue, 23 Jan 2018 00:13:26 -0800 (PST)
X-Google-Smtp-Source: AH8x225YAgf9WnMsjZ5tQuEiwTxvoJaMDVHolI7RzJsfJPxwJ7K7lRPpYw6pmrIic2KIzlh8He/T
X-Received: by 10.37.110.197 with SMTP id j188mr1613514ybc.23.1516695205964;
        Tue, 23 Jan 2018 00:13:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695205; cv=none;
        d=google.com; s=arc-20160816;
        b=DIEZtvtUhRWdu9O4xgFK9YvvkLJXE85yw8zvrCaE/2QpJSH9UYl6W0DKalCxsVlyue
         Gfw8sEEbWUlkSx+n8BGF8XOKGtaqkpP23h4I1AyGvMNyC959NvomDj9s61gc+FhHkiRQ
         E4eZWEYAv8Amiu7hy1yqpavjtzdlY3q7Cy2zklkH3NYLyP718cR9ACvSXzLyssZ6v4wu
         vzOyI2QUEVrYLzXhbaz/E4SILUDgsAkyLf45CxHEKcNqKpwCI6mK1QaOcrZWge5jMP3b
         Us5SESqj42rnCpJJ7rAmh543L9W1YguZSfTmLsaiZQo+ZmoIbLvuU9AVI4mk5dCTg5DV
         U0Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=DC4FInE5WMkOJ+ISc5XcxxG0E1DBO/buY1cWnByFsXw=;
        b=KpuXnDARQRKzh/k/qOAbjbowaWtL7224L65TZSKvetVojVPl/gwQIchaPzbeSYH9WF
         wF4yQwwhHlbyh40QXSHj7bChXxgEXJki6Z1YAIHB9E2xbjYXFMylqbarNRMB53Nuocd+
         FWc+FZ43MqJmp4wybWP2x3boB9T6juvCCnhkRNxzrtz5TfkU7PAEcji5Cv69A7tAJD79
         fXR5dMd27afqtK7GUBKDJzg9ddgco05AOn5qWYsnvG4kLn8H9t6U95ot+WdM+liHtkG6
         XrtjetSUWU7UMF835SCQXLsg3wDZdStz80qjO9tiEf89agIA1fJ9GWW7PO5YUk0AxfyF
         O/FA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d62si316728ybb.315.2018.01.23.00.13.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:13:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43825 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtht-0001Ib-At
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:13:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtez-0007Q7-LF
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 03:10:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtey-0001xh-CF
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 03:10:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36636)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtes-0001uK-7r; Tue, 23 Jan 2018 03:10:18 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 508598F885;
	Tue, 23 Jan 2018 08:10:17 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD5F29CCB;
	Tue, 23 Jan 2018 08:10:15 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:04 +0100
Message-Id: <1516694904-64879-6-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 23 Jan 2018 08:10:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 05/25] alpha: cpu: add CPU_RESOLVING_TYPE
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
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZHW4ee7iss+G

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Richard Henderson <rth@twiddle.net>
---
 target/alpha/cpu.h        | 1 +
 tests/machine-none-test.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 0a9ad35..21ed5d6 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -472,6 +472,7 @@ void alpha_translate_init(void);
 
 #define ALPHA_CPU_TYPE_SUFFIX "-" TYPE_ALPHA_CPU
 #define ALPHA_CPU_TYPE_NAME(model) model ALPHA_CPU_TYPE_SUFFIX
+#define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
 
 void alpha_cpu_list(FILE *f, fprintf_function cpu_fprintf);
 /* you can call this signal handler from your SIGBUS and SIGSEGV
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index 4b704fb..5d23ade 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -28,6 +28,7 @@ static struct arch2cpu cpus_map[] = {
     { "aarch64", "cortex-a15" },
     { "x86_64", "qemu64,apic-id=0" },
     { "i386", "qemu32,apic-id=0" },
+    { "alpha", "ev67" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

