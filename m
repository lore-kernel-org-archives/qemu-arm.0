Received: by 10.28.173.206 with SMTP id w197csp6803707wme;
        Thu, 18 Jan 2018 09:38:14 -0800 (PST)
X-Google-Smtp-Source: ACJfBovUkbXxlqKQOrjvwG3o85ICOFaykKiCwibMrsVVOJ5I+TQU1oTSDE7I3rURcyLTgGlxDyEV
X-Received: by 10.37.192.194 with SMTP id c185mr17470179ybf.133.1516297094495;
        Thu, 18 Jan 2018 09:38:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516297094; cv=none;
        d=google.com; s=arc-20160816;
        b=Dy6+qS+xfuGRELHIRvZCzAygZnf1wSzQL8Xd3+IqGX4PX6/PIOsrC4VSU5izazqHZa
         BcWk425aRXi6X7J2vOH7D1bdw8P5txFsu7xwEJklnA/YM3IYYI4QdV9kfw3Otsp9zmR0
         FKi2fTavxFmi+gCzojJ2hAZ2zVRIyHzU74U8v8Crn6DP3dJ48dTdx+nUfs1718ugwm83
         xckIrjJOuSjimlSQ57ytscN5oVZlD7LTdbeZvFJBIIr59dqifu/uAGjmKPwPXV8ZwEU1
         NioN0PF/X0AAcRnEbFJLZHT0yXO+sNTtIdXeUMvC5wYjsEdOdRjsQXuQNr8/ohsR15os
         /OZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=xNJLKfiQ+zyzDMxSHrk/BUEZXZ+SH5L83RZuWjHde5g=;
        b=L+ePVwxUgpnzwZ/eNXbpoBkRiKNwMHIw2MUYRZ/sm4TFSAOE8E4nwmS0kQccrB0GfH
         CYiZ6kFtuBWKraT9KfdcuOPD58dPdDoIgI/ZXOXSuv1lTkdu6d3wPDPAYSUd0kQTzz/5
         xcBnUrtslQKp22ljjKAmewGxvwFhkdLlxcV826OJsJapCa65dH8KSCdpy5rq7nD10l+G
         pGU1Nchms4FPCRKONZDwekQrqAoJCEluvG3RHSRVd7MTNei5ngDtVQGURgorlwnJeFZQ
         zUtgc3J0lCE/VrBJoajL+tYgWsbRlZUPrsOpsglicCbtI1slZ5UPPOwVATpTn1rSAYI0
         a8dg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v3si203058ybl.189.2018.01.18.09.38.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 09:38:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecE8j-0005lP-UN
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 12:38:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ecE6Z-0004SN-Ce
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 12:36:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ecE6W-0007y7-53
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 12:35:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36932)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1ecE6T-0007v7-R6; Thu, 18 Jan 2018 12:35:53 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E37BAC04B320;
	Thu, 18 Jan 2018 17:35:52 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9C8E78E7D;
	Thu, 18 Jan 2018 17:35:50 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 18 Jan 2018 18:34:00 +0100
Message-Id: <1516296842-136976-4-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516296842-136976-1-git-send-email-imammedo@redhat.com>
References: <1516296842-136976-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 18 Jan 2018 17:35:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v2 3/5] linux-user: prepare for switching to
 cpu_create() API
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AGow6oWldcAf

temporarily add #ifdef CPU_RESOLVING_TYPE in linux-user/main.c
so that  each target could gradually switch to cpu_create() and
not converted yet could continue to use cpu_init().

Once all targets are converted
    temporary ifdefs and cpu_init() API
will be removed

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 linux-user/main.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 450eb3c..d481e8c 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -44,6 +44,7 @@ static const char *argv0;
 static int gdbstub_port;
 static envlist_t *envlist;
 static const char *cpu_model;
+static const char *cpu_type;
 unsigned long mmap_min_addr;
 unsigned long guest_base;
 int have_guest_base;
@@ -3847,7 +3848,7 @@ void init_task_state(TaskState *ts)
 CPUArchState *cpu_copy(CPUArchState *env)
 {
     CPUState *cpu = ENV_GET_CPU(env);
-    CPUState *new_cpu = cpu_init(cpu_model);
+    CPUState *new_cpu = cpu_create(cpu_type);
     CPUArchState *new_env = new_cpu->env_ptr;
     CPUBreakpoint *bp;
     CPUWatchpoint *wp;
@@ -4362,7 +4363,17 @@ int main(int argc, char **argv, char **envp)
     tcg_exec_init(0);
     /* NOTE: we need to init the CPU at this stage to get
        qemu_host_page_size */
+
+#ifdef CPU_RESOLVING_TYPE
+    cpu_type = cpu_parse_cpu_model(CPU_RESOLVING_TYPE, cpu_model);
+    if (!cpu_type) {
+        exit(1);
+    }
+    cpu_create(cpu_type);
+#else
     cpu = cpu_init(cpu_model);
+    cpu_type = object_class_get_name(object_get_class(OBJECT(cpu)));
+#endif
     env = cpu->env_ptr;
     cpu_reset(cpu);
 
-- 
2.7.4

