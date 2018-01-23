Received: by 10.28.71.27 with SMTP id u27csp3774682wma;
        Tue, 23 Jan 2018 00:20:52 -0800 (PST)
X-Google-Smtp-Source: AH8x226waMwXwzmpThGq1EQm2OvJ7lwo5nGTThAvjLBDZo6gwoKizElpmcrRu9vnulunxZq9UVZa
X-Received: by 10.37.201.196 with SMTP id z187mr1630152ybf.250.1516695652082;
        Tue, 23 Jan 2018 00:20:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695652; cv=none;
        d=google.com; s=arc-20160816;
        b=o5zFD8AILpJZVEooocFTDUoUSxtxv+J2kiSKIuUtULoAUF1MOZC0s/nxJjKOpX/Ldu
         MSerLhuTL1HII7mrN4hMvv5Tc8+ps3TSWF9AlZCWLW7AShzXRiavQdc7xLGT2blXV86l
         oe2buQgluSLXWhMP0FFuKCPcmnlve/wg+VT/gVA40QG8c9PexzmToelAiAyPTFHZpm/N
         vHE3kelU84gs4fq6P0WhEvXrMtEZMfsYMec0+AbvbO53TxPTvn3V5vJaAgY8tqw3fePG
         qz48hEhO5+TSlRsSxKjJLLYQ36Ngv36+yifmB1CDdHo7iAilHxLV+lpYuAsQI7gtP5xr
         I8aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=uJ8wPkhHKNVqBT+4h8EynMypQ4uz+D9kn7V1TX6LKMM=;
        b=dYbKhFw2o7XP7mAfIkip7N/ZYuBtB87RUbxyHUFoiF7RacV5dNoPsFqTuDuNRnn6vk
         Zf8HXMogVIcMXZONniorRlc+UX4ZCMMQ8oRBbSdODcj3nZhqN52IlSZAfRXzSJNmEzoH
         oCbW6MWWUl0iLpTRjrkZtrQTTMg88AdkIixgVNQWAt0aNR8Db0PG4DXvoae8vXlxdrmA
         WapqE944+FJnBYXQqU68Mz+zOOWy1Jr4VELaQkM6h28XYSIKtE8lTSgzqLUS2ZnnQqaM
         Q5Whd8Zz76VG4m73OOYHfXYU3xghVw4pMdiqcnMqMqM0B0OCjS5BNyNMSuhLfhgG86Di
         MY7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d7si869244ybk.405.2018.01.23.00.20.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:20:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtp5-0008FN-FD
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:20:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfB-0007eu-NV
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfA-000263-Hj
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52328)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtf9-000250-V5; Tue, 23 Jan 2018 03:10:36 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D090B3DE3F;
	Tue, 23 Jan 2018 08:10:34 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B69859CCB;
	Tue, 23 Jan 2018 08:10:32 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:13 +0100
Message-Id: <1516694904-64879-15-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 23 Jan 2018 08:10:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 14/25] ppc: cpu: add CPU_RESOLVING_TYPE macro
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
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fH6y+9/a3892

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Laurent Vivier <laurent@vivier.eu>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Alexander Graf <agraf@suse.de>
CC: qemu-ppc@nongnu.org
---
 target/ppc/cpu.h          | 1 +
 tests/machine-none-test.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 603a38c..d5f2f3d 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1380,6 +1380,7 @@ int ppc_dcr_write (ppc_dcr_t *dcr_env, int dcrn, uint32_t val);
 
 #define POWERPC_CPU_TYPE_SUFFIX "-" TYPE_POWERPC_CPU
 #define POWERPC_CPU_TYPE_NAME(model) model POWERPC_CPU_TYPE_SUFFIX
+#define CPU_RESOLVING_TYPE TYPE_POWERPC_CPU
 
 #define cpu_signal_handler cpu_ppc_signal_handler
 #define cpu_list ppc_cpu_list
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index 160aa13..052b8c0 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -41,6 +41,9 @@ static struct arch2cpu cpus_map[] = {
     { "moxie", "MoxieLite" },
     { "nios2", "FIXME" },
     { "or1k", "or1200" },
+    { "ppc", "604" },
+    { "ppc64", "power8e_v2.1" },
+    { "ppcemb", "440epb" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

