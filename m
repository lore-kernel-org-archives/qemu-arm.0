Received: by 10.28.71.27 with SMTP id u27csp3766803wma;
        Tue, 23 Jan 2018 00:10:42 -0800 (PST)
X-Google-Smtp-Source: AH8x227TBmxId4vPQzsH6KAV/JYcN+saoSobJAYPRgWouTs4UbRYTz0/BkZBcszHeVpDmBODiB39
X-Received: by 10.129.159.17 with SMTP id w17mr1636374ywg.23.1516695042894;
        Tue, 23 Jan 2018 00:10:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695042; cv=none;
        d=google.com; s=arc-20160816;
        b=vCPCTmaecRV6p9Iu1Bn2OTYh8AoerN/AHt21QFGI8k15c+4gKLF7hXDo07NHKst+aQ
         KfxFoPQPyKb2KycWjiykt943vgI0bKp2YCBqq71rgpVybwnqmv8O8w+ZNk/Oo7u4F7G0
         vABgDGM8se0Y/0Qg/HVz5GpiqsBG4SbMmsbo6BkCap7YmpJ6LLx2BqER1nL+ffPmSRup
         lSZt2p2XMzK4eCUKd2UOEt/xzKp0vusZ/yDUW5LUju13NscEH4cIvVLSk+shA7E97fMy
         qZgFjjDM0Ov78TmXeU4uXbzQDgOvMBSt3bLW1h79p5pblkUi1QWQAsqHW6kxkVSc91wm
         qtdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=dE5kta7DJxhd40cNhFLlDdh4ZMy6N5tXXdXxDb5jqVw=;
        b=zmgFwGLtH8AVCzzE1Uli3G26MlgOrl2bE9n9xTYsBp9+eisH5uE6CELsPJoQXhw0bg
         XrYYaAORg5TX2o+0MK60En9+BqADsmI/z+FRij1DxapsgTdb9CsOsLcogKo3N8ZxAG87
         hmcllkGR+UXEDfg9wHgm8jAXgv4v2xA2EDdjxgAHGYu0mtygiFNh00KBeex5KGUVW4EW
         Qs8bLg6FqwiqiFzk4n77OQ5NQF4sAEj4qSJ+C7YWlvnNpT5WrzcgZNObuw9+wPW8vRtQ
         D6Iao3MFphvp+M2NXf2mCcCIjDaNSLQgegALf35ec7jmhRY/xRfBe9rLpwTJRZH7jHXE
         Y7RA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u135si1713911ywu.191.2018.01.23.00.10.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:10:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43799 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtfG-0007TA-5I
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:10:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtey-0007Ot-D3
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtet-0001w2-Vw
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35964)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtet-0001vb-Qy; Tue, 23 Jan 2018 03:10:19 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1945E7653B;
	Tue, 23 Jan 2018 08:10:19 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 979459CCB;
	Tue, 23 Jan 2018 08:10:17 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:05 +0100
Message-Id: <1516694904-64879-7-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 23 Jan 2018 08:10:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 06/25] cris: cpu: add CPU_RESOLVING_TYPE macro
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
X-TUID: +T1ucnxd9Uvo

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
---
 target/cris/cpu.h         | 1 +
 tests/machine-none-test.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index b64fa35..1a27653 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -271,6 +271,7 @@ enum {
 
 #define CRIS_CPU_TYPE_SUFFIX "-" TYPE_CRIS_CPU
 #define CRIS_CPU_TYPE_NAME(name) (name CRIS_CPU_TYPE_SUFFIX)
+#define CPU_RESOLVING_TYPE TYPE_CRIS_CPU
 
 #define cpu_signal_handler cpu_cris_signal_handler
 
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index 5d23ade..68f7a30 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -29,6 +29,7 @@ static struct arch2cpu cpus_map[] = {
     { "x86_64", "qemu64,apic-id=0" },
     { "i386", "qemu32,apic-id=0" },
     { "alpha", "ev67" },
+    { "cris", "crisv32" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

