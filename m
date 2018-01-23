Received: by 10.28.71.27 with SMTP id u27csp3774635wma;
        Tue, 23 Jan 2018 00:20:48 -0800 (PST)
X-Google-Smtp-Source: AH8x224rZxmMReigUH5ZGVDx3uXQq2u/PwMnPp5l/gru1rgPnZ7J+l1RSJVZRSzZdvmTyb8hglnu
X-Received: by 10.129.44.215 with SMTP id s206mr1542115yws.361.1516695648864;
        Tue, 23 Jan 2018 00:20:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695648; cv=none;
        d=google.com; s=arc-20160816;
        b=deXoIEEHVQ7dvuheV6w5yCgRezea6UiFGsvk9liFoWlmj2gPkaNd03866Y0DREKKEY
         Tkb4xcpFdtoDbSll72MnMEoqps/9+0n6rQ4zfuXqiAsNoO2h6h/tqC/wSfkadHQ7XZAm
         yjm8Z3I6p9in5IuT+xZ6pqaThuTBej/ghxgzQtC5vFJU7Ieu+hZQBgjLJE5GlBY5wg8R
         h+JjedTOpKW9xcyUVspPJB/JV3Y69F5RCRio7d/ZH8LD1xKfyZG19qAF28sB5uODx/IS
         DzQCnv7fU8rlpaaxv8TGrj/IdVcWEGlFuuTsZL0p2SjiMYyOLfKJv4Fo98mSMGk6niex
         FGZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=MP5tYAdVzWZdI2OiE4LRLB9AwDylU889hAfjLYafmM8=;
        b=Z/JlSh7V/MPAd9G/65H7KmdhQLXQDFDuQU392QRLMdbxdNqIXQwe1jq7GoruVa6jSS
         +YZHqlRWh5luJmiixfrYwJaEk+J9D7ZYn0t1kjqvNLdiAR7JW9hMoRs50WIwa80IN1oA
         8o+D0usZHOc/wuft6cTwt3CcY2ZO4s448XTKfM02krxwQykB8jCjBs8P9IO11sd24C0L
         yfYWSgF26AGJUayWhqFeqi5a4gO47kOf+IgUKEcrrc1P8alI+0FByz6k/H3CJlCeaiQ5
         bj76t9ekEYxRgT67dvQFpMEgXYj6nLlbOyx+PJ2nG4rnn5ik2VEdqj3i3pKj1WCImq+U
         uQ+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h2si2444629ywa.668.2018.01.23.00.20.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:20:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43903 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtp2-0007uc-7G
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:20:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfN-0007xh-T3
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 03:10:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfM-0002F4-R8
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 03:10:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52478)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtfK-0002CO-1x; Tue, 23 Jan 2018 03:10:46 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05BD6552C7;
	Tue, 23 Jan 2018 08:10:45 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0D2FD1E7;
	Tue, 23 Jan 2018 08:10:42 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:18 +0100
Message-Id: <1516694904-64879-20-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 23 Jan 2018 08:10:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 19/25] unicore32: cpu: add
 CPU_RESOLVING_TYPE macro
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
	Guan Xuetao <gxt@mprc.pku.edu.cn>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xge1ymQs+oV3

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Laurent Vivier <laurent@vivier.eu>
CC: Guan Xuetao <gxt@mprc.pku.edu.cn>
---
 target/unicore32/cpu.h    | 1 +
 tests/machine-none-test.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/unicore32/cpu.h b/target/unicore32/cpu.h
index 3dc6fbc..9644b07 100644
--- a/target/unicore32/cpu.h
+++ b/target/unicore32/cpu.h
@@ -169,6 +169,7 @@ static inline int cpu_mmu_index(CPUUniCore32State *env, bool ifetch)
 
 #define UNICORE32_CPU_TYPE_SUFFIX "-" TYPE_UNICORE32_CPU
 #define UNICORE32_CPU_TYPE_NAME(model) model UNICORE32_CPU_TYPE_SUFFIX
+#define CPU_RESOLVING_TYPE TYPE_UNICORE32_CPU
 
 static inline void cpu_get_tb_cpu_state(CPUUniCore32State *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index 0430b06..a8a499e 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -50,6 +50,7 @@ static struct arch2cpu cpus_map[] = {
     { "sparc", "LEON2" },
     { "sparc64", "Fujitsu Sparc64" },
     { "tricore", "tc1796" },
+    { "unicore32", "UniCore-II" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

