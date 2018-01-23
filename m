Received: by 10.28.71.27 with SMTP id u27csp3772098wma;
        Tue, 23 Jan 2018 00:17:17 -0800 (PST)
X-Google-Smtp-Source: AH8x226VRV2zkYVO/UCBBw29Hg5G83Y7wYXzFULVhIbSwmixr6GKIA0c9t2O5Oren1GfT+w1ls8I
X-Received: by 10.129.53.19 with SMTP id c19mr1608298ywa.404.1516695437885;
        Tue, 23 Jan 2018 00:17:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695437; cv=none;
        d=google.com; s=arc-20160816;
        b=JYcfGhvw5XvCRz8A3sBCRdAONl1lFEzNJBYS7wJAynjxfwVxQYCqhHA2GhQe0gVY0P
         kvpqfviNPuuHioHAsGWRNRldbKQ1hLhNtl2JpKSwMqaYWIGUT1i+mk3BywPJ+RGJNRaM
         qP5x2xjKTkSUp7jQjBkvfoN6trrT+2lQ/tAUFChe6OnlvjtieSiOBNQdLxN8iDRA/QO+
         vTr3LH4a/ZU1LNUaIdE89V3TXbxUSK1rI7JN5NvC7QVoHT0vqKpBHHg+Zhvgmkmgd1WD
         JNSJCJkH1UpsLvZ2c/cnPAlYXDUobolX4w3XOs62qFDz+yaq7yG/vfqBtrQ2C1aMw/1P
         VM8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=o+pl9a5pKEN3/8hZAAphB+B0AMr6PTrxSJEm5OZd5oc=;
        b=X87jnIV2hPAGUZqpWX4lSaT+iDjq2Hvu+fN2ML5TGCb0hZWPo/K0AfbTAFhjErSZrV
         2sd7Hqef2CPqjzYMEtismfQecHfFsvgfEszavY9rR2xTZH8NpRqCYxhZ4AKi3vd3jcHK
         +9GjI1pgsc7F1A0gAHDzaXSO+Lh4IlQd1LzG9d7TBkvZ9fODpQmjV/iug3gpKMPXreDZ
         vjs2rbFrqN2FhdNmbgQbc7RxCHd+Wlvr00fisBb3tN27tiJgPQyAJTt210qfUKKtWt7S
         8MSjZn7Xt4yaR069Q0zO7nrjeJgtcm8qAqdPdlb5n/f6LmxKSkcVBcpKv6wpidBFUqJs
         NewQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n73si2291915yba.311.2018.01.23.00.17.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:17:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43867 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtld-00057L-60
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:17:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfC-0007gi-MY
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfB-00027a-St
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49578)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtfB-00026l-L1; Tue, 23 Jan 2018 03:10:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE1F24900C;
	Tue, 23 Jan 2018 08:10:36 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 21CE7D1E8;
	Tue, 23 Jan 2018 08:10:34 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:14 +0100
Message-Id: <1516694904-64879-16-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 23 Jan 2018 08:10:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 15/25] s390x: cpu: add CPU_RESOLVING_TYPE macro
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
	Alexander Graf <agraf@suse.de>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Fla2aH2la06

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Richard Henderson <rth@twiddle.net>
CC: Alexander Graf <agraf@suse.de>
CC: qemu-s390x@nongnu.org
---
 target/s390x/cpu.h        | 1 +
 tests/machine-none-test.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 1a8b6b9..b2121cb 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -731,6 +731,7 @@ void s390_set_qemu_cpu_model(uint16_t type, uint8_t gen, uint8_t ec_ga,
 
 #define S390_CPU_TYPE_SUFFIX "-" TYPE_S390_CPU
 #define S390_CPU_TYPE_NAME(name) (name S390_CPU_TYPE_SUFFIX)
+#define CPU_RESOLVING_TYPE TYPE_S390_CPU
 
 /* you can call this signal handler from your SIGBUS and SIGSEGV
    signal handlers to inform the virtual CPU of exceptions. non zero
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index 052b8c0..b3a346d 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -44,6 +44,7 @@ static struct arch2cpu cpus_map[] = {
     { "ppc", "604" },
     { "ppc64", "power8e_v2.1" },
     { "ppcemb", "440epb" },
+    { "s390x", "qemu" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

