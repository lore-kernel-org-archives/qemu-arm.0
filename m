Received: by 10.28.173.206 with SMTP id w197csp6801765wme;
        Thu, 18 Jan 2018 09:36:21 -0800 (PST)
X-Google-Smtp-Source: ACJfBotV2LP7hGQQr6JimxAInQMbCsWNhhOJSeKyFSveZKQBUnsqOkk4gm/uwDVifPthD16GxEv8
X-Received: by 10.37.172.85 with SMTP id r21mr13339326ybd.95.1516296981276;
        Thu, 18 Jan 2018 09:36:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516296981; cv=none;
        d=google.com; s=arc-20160816;
        b=HFnuJntVrslbqD4HoiSL7gBsV1habUqkkaTHx2DWkSj6mbxFcfbxvnyy68z0vgIDi4
         ZIvKSLaAxt6iWNXrCBxY17NpNSq2ncThCImnWkgfy3PhFPZVMh+TxK/Q0kAqssQnUAiy
         86sSNYv1ehRYHIWYyv/6KWz/7qtb+WZ18mK4pRCo34QMGixofpoTGesKemcRKehkFdge
         kCqXExhZ/nZcKDcTa7pJE4hNe8MraGk3N9HaSD5Fv2O3mdQnYKBzKH+/9i52z8RlqL7Z
         P/NSnQ8X34PhCg6PZyFeyyTJM0kf7KlnBg5SjkH/Rw8Br3fBJzladqI7LaonlgdEDlFR
         mXWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Q84VwEEZMoNZDqh6SWp/09stj1PPlOPI1KxeyXKM5O4=;
        b=mjRMvkTUY2qCFZKL7OKrxMI9IZNJVseQ/W4O6/u87TdGfPDi9bR4YQPRIVl1p2HwBp
         PkNWyPn0F6C5FerGXe60xJKVLKj5taOK+pWj9QtxxLKn/7BQDFtVjrKZ/YEeRJv9ERoQ
         Kz8p8BzHz1Zgn0cNd6hb0HQNV2YpsJoRH62q2gR5XxRmuJElE0Gv/B3Omzho1KzYgeWo
         Ge0k/pdVz6Gl8tYT+klvk1qlPqOp+ICTLUfGY9UIC3bj5xylyBwn+dxB+8kTllyuECjV
         VFXFGUnY6RZl5Hvk9YKFWviTxObKKG9e6r1LHVp1zZeAuH3X1S9vWEv/+5awzQSD+udd
         WrRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u35si209003ybd.818.2018.01.18.09.36.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 09:36:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43745 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecE6u-0004aR-Fz
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 12:36:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ecE6W-0004PC-VV
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 12:35:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ecE6V-0007xc-PX
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 12:35:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:6504)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1ecE6V-0007ws-JE; Thu, 18 Jan 2018 12:35:55 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0E215117D;
	Thu, 18 Jan 2018 17:35:54 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 35A2178E7D;
	Thu, 18 Jan 2018 17:35:53 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 18 Jan 2018 18:34:01 +0100
Message-Id: <1516296842-136976-5-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516296842-136976-1-git-send-email-imammedo@redhat.com>
References: <1516296842-136976-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 18 Jan 2018 17:35:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 4/5] arm: cpu: add CPU_RESOLVING_TYPE macro
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
X-TUID: PDNZ9mn86jQ/

it will be used for providing to cpu name resolving class for
  cpu_parse_cpu_model(CPU_RESOLVING_TYPE, ...)
in null-machine.c and in linux-user/main.c

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 target/arm/cpu.h     | 3 +++
 linux-user/main.c    | 2 --
 tests/machine-none.c | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9631670..e2c7f08 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2172,6 +2172,9 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
 #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
 #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
 
+/* used to get target's callback in cpu_parse_cpu_model() */
+#define CPU_RESOLVING_TYPE TYPE_ARM_CPU
+
 #define cpu_signal_handler cpu_arm_signal_handler
 #define cpu_list arm_cpu_list
 
diff --git a/linux-user/main.c b/linux-user/main.c
index d481e8c..bcf2e55 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -4326,8 +4326,6 @@ int main(int argc, char **argv, char **envp)
 #else
         cpu_model = "qemu32";
 #endif
-#elif defined(TARGET_ARM)
-        cpu_model = "any";
 #elif defined(TARGET_UNICORE32)
         cpu_model = "any";
 #elif defined(TARGET_M68K)
diff --git a/tests/machine-none.c b/tests/machine-none.c
index d16c283..7f64532 100644
--- a/tests/machine-none.c
+++ b/tests/machine-none.c
@@ -24,6 +24,8 @@ struct arch2cpu {
 
 static struct arch2cpu cpus_map[] = {
     /* tested targets list */
+    { "arm", "cortex-a15" },
+    { "aarch64", "cortex-a15" },
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.7.4

