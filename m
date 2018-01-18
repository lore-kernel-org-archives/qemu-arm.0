Received: by 10.28.173.206 with SMTP id w197csp6801987wme;
        Thu, 18 Jan 2018 09:36:34 -0800 (PST)
X-Google-Smtp-Source: ACJfBotH8qv20vt34reO0VcfEh0KGpYsmR3TdUqjXvAE1DPMTDsNGQA9/GXhh8nXcsQ7TUkybwVB
X-Received: by 10.129.55.149 with SMTP id e143mr6529359ywa.55.1516296994166;
        Thu, 18 Jan 2018 09:36:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516296994; cv=none;
        d=google.com; s=arc-20160816;
        b=oondRu8u1ld6q9IGh7FRHxiZ0n1ZnQvI6G2VO5VD7mpUuSdCBNIKQakBrVq3jtJB5G
         v3xsu1c8aZCLM6K0/K2oA02lvb4VshvZb2HgguMXZl2nVXBPz0DeD7IzhXdquTzLfL/b
         dWQLUSLwXXY8vRYXvKWmA7ZwRX/J4MxNsRL+1KfDarBvIOLD+6Q/NCcESGo0V3TZ9jdL
         M+2IAXrqe1r6j85j73ByrtUQqLxsAx0u2PZrrgEmAJfxUwa9VM0dlX73zjbTtPXcw61I
         cAkhuIcGuUk4QALrNtZW0dRinzyXiPhrZ46HRjnkFyayfFVF6FJr65JdQRVODMSIjqEp
         aciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=jRJR9X/dg7wJgY01gLWQNXPBk7ymBYZy0tbt7lYISXU=;
        b=Mch1p9h2urCQVsNvhMnfkPmdJSnWo+bRVs/g5PxSTURljHzCLnDpAvpknaMDpxQbkS
         5cRkM0Dg6qrHjXfy8fpLTLZfk50UGk6Nha3yjJDI3XaiL8u7VliijYi1GPYeV39Nh/wb
         QSmySHint/VhZ01pQgNXg0RBmlzG7kjFbQuD+PYlx8RqC4/ZEO6iuPlOg+z0eRbz/yBw
         f6NgVRCX9Kef6jEaq8Q7x5D6bp4iT9PueFKWYp6k3b9aBy4kbxTeht5On8VOrqk+jRwy
         30ZzvvuBtR1AOZiQIKt/wZSMP3kGnyBYfq9m/rMqY8/gwSroxMGW2LeAVagTWJnIjLGF
         J/xw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w82si217068ybg.682.2018.01.18.09.36.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 09:36:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecE77-0004nT-JN
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 12:36:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ecE6Z-0004SL-C8
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 12:36:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ecE6X-0007zU-FC
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 12:35:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50320)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1ecE6X-0007yX-81; Thu, 18 Jan 2018 12:35:57 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 65056C0587C9;
	Thu, 18 Jan 2018 17:35:56 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E347278E7D;
	Thu, 18 Jan 2018 17:35:54 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 18 Jan 2018 18:34:02 +0100
Message-Id: <1516296842-136976-6-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516296842-136976-1-git-send-email-imammedo@redhat.com>
References: <1516296842-136976-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 18 Jan 2018 17:35:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 5/5] x86: cpu: add CPU_RESOLVING_TYPE macro
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ugsqP8+6OCYd

it will be used for providing to cpu name resolving class for
  cpu_parse_cpu_model(CPU_RESOLVING_TYPE, ...)
in null-machine.c and in linux-user/main.c

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 target/i386/cpu.h    | 3 +++
 tests/machine-none.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index f64e5ed..a1712fc 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1568,6 +1568,9 @@ uint64_t cpu_get_tsc(CPUX86State *env);
 #define TARGET_DEFAULT_CPU_TYPE X86_CPU_TYPE_NAME("qemu32")
 #endif
 
+/* used to get target's callback in cpu_parse_cpu_model() */
+#define CPU_RESOLVING_TYPE TYPE_X86_CPU
+
 #define cpu_signal_handler cpu_x86_signal_handler
 #define cpu_list x86_cpu_list
 
diff --git a/tests/machine-none.c b/tests/machine-none.c
index 7f64532..8a306ba 100644
--- a/tests/machine-none.c
+++ b/tests/machine-none.c
@@ -26,6 +26,8 @@ static struct arch2cpu cpus_map[] = {
     /* tested targets list */
     { "arm", "cortex-a15" },
     { "aarch64", "cortex-a15" },
+    { "x86_64", "qemu64,apic-id=0" },
+    { "i386", "qemu32,apic-id=0" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

