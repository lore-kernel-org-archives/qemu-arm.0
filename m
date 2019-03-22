Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp904838wrx;
        Fri, 22 Mar 2019 09:35:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxrMnjNs0Za291zjwnNBPjGKWBOW/bhnVrSraCTP02X3Oq4kafEF9mRpkyXCkJbZKbLjnIX
X-Received: by 2002:a25:d0cc:: with SMTP id h195mr8877141ybg.305.1553272527730;
        Fri, 22 Mar 2019 09:35:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553272527; cv=none;
        d=google.com; s=arc-20160816;
        b=oXTYV0Aq5bXjsCoyWLRAkEgHAFZDTvQzYiD2yOvmJCvA+zu8l60mJSVpqagjojYUjm
         XwlxIbyiRJfFqvztEgAin3rjYYR3sP9daVMgvS5ElqYxUl0Kwh8jV/R04vC9B48oDCnZ
         GdzEgmiuZoJHNZyHN472KrT9nxTvCS8cKlMnClDsUGb3O5I9uqlK1s6oHqEKm2istP9Q
         qF5nLnduLKBHPj4u4eX14LRldxvCtsrTJ4Zn4jvjjrckbDk/1O9Dl8HHFR+Nt/McivDP
         T+bgodzpAU5Z5Co0ozYsOVT5FX9suUf2JKsrI6TjExhb1KSUAwPDkfv0obCxNqrHSDw4
         VC8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=au0kwUW8US4MMogjAY+ZdiBcaOrSek+dafq1Ph4Q2lA=;
        b=kZu44NSv538whllDLIvEnSXhPKZZiwkXn24qee7GgiZ2fNgGGkD3/k13HhCfijpv5L
         MtlX0QIkSzGr8Oc42D6FHLm7h5EAksvnEAMvitxpysCV+YsPGOediCgfkGSzJm6owniW
         62l5f/l26Dz68FWRLj2aMg05NyPzGL3WwYecdZfbegL+s3LCz1KG2iwbRKO1u9QJpDOX
         UWN1FwQyaKjsL8dLJIQq19052WRFZxYW+EKIpiU2clNNsh2XOSQOw4o5vrWnO35BeYdO
         44O/8iSI5xuGZ9YZ9IpQlwDt2HwNVyNWHIzHB0IqbKGFkbwbf23KuOXb8ivaTDWCbuD2
         +U9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j138si4834736ybj.405.2019.03.22.09.35.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Mar 2019 09:35:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h7N8h-0005BQ-5M
	for alex.bennee@linaro.org; Fri, 22 Mar 2019 12:35:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1h7N3v-0000mo-LO
	for qemu-arm@nongnu.org; Fri, 22 Mar 2019 12:30:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1h7N3m-0005Bp-JB
	for qemu-arm@nongnu.org; Fri, 22 Mar 2019 12:30:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36024)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1h7N3k-00057f-FP; Fri, 22 Mar 2019 12:30:20 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7802688302;
	Fri, 22 Mar 2019 16:23:40 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 50AC25D9CC;
	Fri, 22 Mar 2019 16:23:39 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 22 Mar 2019 17:23:33 +0100
Message-Id: <20190322162333.17159-4-drjones@redhat.com>
In-Reply-To: <20190322162333.17159-1-drjones@redhat.com>
References: <20190322162333.17159-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 22 Mar 2019 16:23:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 3/3] target/arm: make pmccntr_op_start/finish
 static
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
Cc: peter.maydell@linaro.org, aaron@os.amperecomputing.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sWSKwH2tKqAT

These functions are not used outside helper.c

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu.h    | 11 -----------
 target/arm/helper.c |  4 ++--
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5f23c621325c..d4d2836923df 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -992,17 +992,6 @@ static inline bool is_a64(CPUARMState *env)
 int cpu_arm_signal_handler(int host_signum, void *pinfo,
                            void *puc);
 
-/**
- * pmccntr_op_start/finish
- * @env: CPUARMState
- *
- * Convert the counter in the PMCCNTR between its delta form (the typical mode
- * when it's enabled) and the guest-visible value. These two calls must always
- * surround any action which might affect the counter.
- */
-void pmccntr_op_start(CPUARMState *env);
-void pmccntr_op_finish(CPUARMState *env);
-
 /**
  * pmu_op_start/finish
  * @env: CPUARMState
diff --git a/target/arm/helper.c b/target/arm/helper.c
index fc73488f6cc0..a36f4b3d6997 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1337,7 +1337,7 @@ static void pmu_update_irq(CPUARMState *env)
  * etc. can be done logically. This is essentially a no-op if the counter is
  * not enabled at the time of the call.
  */
-void pmccntr_op_start(CPUARMState *env)
+static void pmccntr_op_start(CPUARMState *env)
 {
     uint64_t cycles = cycles_get_count(env);
 
@@ -1367,7 +1367,7 @@ void pmccntr_op_start(CPUARMState *env)
  * guest-visible count. A call to pmccntr_op_finish should follow every call to
  * pmccntr_op_start.
  */
-void pmccntr_op_finish(CPUARMState *env)
+static void pmccntr_op_finish(CPUARMState *env)
 {
     if (pmu_counter_enabled(env, 31)) {
 #ifndef CONFIG_USER_ONLY
-- 
2.17.2

