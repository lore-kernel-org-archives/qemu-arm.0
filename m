Received: by 10.28.71.27 with SMTP id u27csp1307121wma;
        Thu, 1 Feb 2018 09:30:51 -0800 (PST)
X-Google-Smtp-Source: AH8x224xH2KqsR3VQqi2oMmTmxgaws95pc46zRiGqnesTArV1UTxuGL5ZQP+v0U3wWaSPwUdMmxU
X-Received: by 10.37.46.72 with SMTP id b8mr25120121ybn.464.1517506251062;
        Thu, 01 Feb 2018 09:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517506251; cv=none;
        d=google.com; s=arc-20160816;
        b=fkM7de4dXQB4kOA2PqjtGIyU7qq+e2DVX89qLGGBzWqcihYSV2MLk4BBH79tnVADkm
         plFQtqUv1ICHYLbqNcuZ9+tbsgRbA/fuyTsTLRXW3WW+RxHCi4nlIx2xowWi9LnG+1pO
         pZ3e4gUVESH6O2tPMPEtyuYe2I0GeQJHY2ZzVGxyVlAGwb5tC/x5xDC33CyMEflwNXM3
         plhi69ZnkEeqnHyKA6XxOUZ8AnKt620vXur2ixAGksShTDtKi880KoYsC+4fwn/+CdB8
         tL2uwldj1yaIzID3FVu5lI+TbZuEMW1pe4ocxtm5/FVSwu73OqNIEbRa1e1XdiEHgVbh
         DNxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=NmIGxMwh4j5Zyi/dNZAspkVwALh0wwEVI9EBd+6rqRM=;
        b=FtteAByhl1adc/2AjjlE3jfiqOoQoNwdAjYM8ow/K2qEl2guQrEU0uIbHKJrtB9EJ0
         SqnShGxrccEVuTOA+qMFvxsigJL4WMjB97n9VzZU9mvJceOrmCMhfFc68HhlrbRcYHBJ
         ia7mL4UXx1cvi+iXNZmYBiHzBaTHEb4w+78C9ifQdB5jgHbpuKIkCE3YxEZQzhegR2F/
         MtFRuN5Xm4J5pyLdSZ+mFBTutNnLuosytttJnPUCJ3S8n9vEzWVdlfNUOCN8ke3aREtR
         ikYH020vLcH6lbcHMsohey84oFh4kSDaIrjf01URIpbaEgwspat9IYcxhlGLfN1y4QZE
         2Bvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l23si18758ywb.145.2018.02.01.09.30.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Feb 2018 09:30:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49721 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ehIhG-0004cx-Cy
	for alex.bennee@linaro.org; Thu, 01 Feb 2018 12:30:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ehIg8-0003Z5-4B
	for qemu-arm@nongnu.org; Thu, 01 Feb 2018 12:29:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ehIg3-0005ec-6y
	for qemu-arm@nongnu.org; Thu, 01 Feb 2018 12:29:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39628)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1ehIg3-0005eF-0o; Thu, 01 Feb 2018 12:29:35 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47F9CA3296;
	Thu,  1 Feb 2018 17:29:34 +0000 (UTC)
Received: from amd-seattle-09.khw.lab.eng.bos.redhat.com
	(amd-seattle-09.khw.lab.eng.bos.redhat.com [10.16.184.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D452E891DC;
	Thu,  1 Feb 2018 17:28:44 +0000 (UTC)
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Feb 2018 12:28:09 -0500
Message-Id: <1517506091-10396-2-git-send-email-wei@redhat.com>
In-Reply-To: <1517506091-10396-1-git-send-email-wei@redhat.com>
References: <1517506091-10396-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 01 Feb 2018 17:29:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/4] tests/boot-serial-test: Add support for the
 aarch64 virt machine
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4d4Wi7He8b6L

This patch adds a small binary kernel to test aarch64 virt machine's
UART.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 tests/Makefile.include   | 1 +
 tests/boot-serial-test.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index ca82e0c..ebdb151 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -367,6 +367,7 @@ gcov-files-arm-y += hw/timer/arm_mptimer.c
 check-qtest-arm-y += tests/boot-serial-test$(EXESUF)
 
 check-qtest-aarch64-y = tests/numa-test$(EXESUF)
+check-qtest-aarch64-y += tests/boot-serial-test$(EXESUF)
 
 check-qtest-microblazeel-y = $(check-qtest-microblaze-y)
 
diff --git a/tests/boot-serial-test.c b/tests/boot-serial-test.c
index 418c5b9..66f7a84 100644
--- a/tests/boot-serial-test.c
+++ b/tests/boot-serial-test.c
@@ -55,6 +55,13 @@ static const uint8_t bios_raspi2[] = {
     0x00, 0x10, 0x20, 0x3f,                 /* 0x3f201000 = UART0 base addr */
 };
 
+static const uint8_t kernel_aarch64[] = {
+    0x81, 0x0a, 0x80, 0x52,                 /* mov     w1, #0x54 */
+    0x02, 0x20, 0xa1, 0xd2,                 /* mov     x2, #0x9000000 */
+    0x41, 0x00, 0x00, 0x39,                 /* strb    w1, [x2] */
+    0xfd, 0xff, 0xff, 0x17,                 /* b       -12 (loop) */
+};
+
 typedef struct testdef {
     const char *arch;       /* Target architecture */
     const char *machine;    /* Name of the machine */
@@ -87,6 +94,8 @@ static testdef_t tests[] = {
       sizeof(kernel_plml605), kernel_plml605 },
     { "moxie", "moxiesim", "", "TT", sizeof(bios_moxiesim), 0, bios_moxiesim },
     { "arm", "raspi2", "", "TT", sizeof(bios_raspi2), 0, bios_raspi2 },
+    { "aarch64", "virt", "-cpu cortex-a57", "TT", sizeof(kernel_aarch64),
+      kernel_aarch64 },
 
     { NULL }
 };
-- 
1.8.3.1

