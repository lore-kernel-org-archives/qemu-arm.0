Received: by 10.223.172.38 with SMTP id v35csp5564101wrc;
        Mon, 11 Sep 2017 06:55:18 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD9As9+Uq8kkXkU0Horz1FYZyuYURf+1bhjCZAYXdSL7HQh3Bm2/xMi0vB7IripwE9Ct6Jr
X-Received: by 10.237.60.50 with SMTP id t47mr4513997qte.49.1505138118521;
        Mon, 11 Sep 2017 06:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505138118; cv=none;
        d=google.com; s=arc-20160816;
        b=SKwANUM/bkrQhEjhsAYRw7AscJjvl7aa6yBzSTFsRLK9crRYaBwbmKyeMeJSr0wNN6
         DSMUQgHkd8rc/Whr0Z9ImrfZGUmRmRLvGBgB6CiZKJyAwBFfCvKSsGqDmok2OyjtUbRF
         RkiAW5JkMg91f7dVQt94SK4av7I6BIZdDs48ksT7/QNnmHV2VKjcpOYZUaiEKVU2RUS2
         aOvM8t6MJGFI+m+dm5GG1soNv4V/daOMK/qF/oU6+pwH89b1H9Zd/vHV6AXZEKW5eDZE
         CLwu4TrFZKdDLZCx54ZRYNHogaZzfuiIJoZJ+Lrj6qVFowKFygcDB1wc3XaLTD6BJgAO
         FT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=JWlZA0idTGOrOFxfvK6PWXZIQM8oXWoz2jdBs7Gmu4U=;
        b=wx1DI4VLvBTuEFDKJ+GTXsV6e27BNK1zo3rt/FUFie5rKee3x0xTXvNdQvJJCmnxtM
         cnKHilcAgFXz/ZE7UA8loc+hDPHNeiTu+3VT/WMN3W2pYMhFDOUkRnD3rLhh/wiUN6E/
         bUWptzoj2J3strdQ9RsaRUIfQdS8OrGDJAhODJYSTctmDe1dcNdADtpmvgGS9qeGgfdP
         iN6z5vKEpnlOT/LKBq8SyPcBRVV4dqkffs8ww5bQhLtKBrNdvHfB+L4gal6QEHjHNgNl
         ksqFLjhg3fiGGF/jWjWL3rw3Ss3eh8kjizVl6dv1n5VVHiDlLUxt5AxJl4sRbhL57qDn
         pXuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p15si9672892qtg.223.2017.09.11.06.55.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 06:55:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57923 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drPBE-0004ou-6I
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 09:55:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drP8A-0001k8-O1
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 09:52:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drP86-0002ES-TB
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 09:52:06 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37238)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drP86-00023m-NY; Mon, 11 Sep 2017 09:52:02 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drP7s-0007me-8q; Mon, 11 Sep 2017 14:51:48 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 11 Sep 2017 14:52:08 +0100
Message-Id: <1505137930-13255-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 5/7] target/arm: Remove unnecessary '|
 0xf0000000' from do_v7m_exception_exit()
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 49YROok2QJYU

In do_v7m_exception_exit(), there's no need to force the high 4
bits of 'type' to 1 when calling v7m_exception_taken(), because
we know that they're always 1 or we could not have got to this
"handle return to magic exception return address" code. Remove
the unnecessary ORs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1741e0d..fdd5cc6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6306,7 +6306,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
          */
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
-        v7m_exception_taken(cpu, type | 0xf0000000);
+        v7m_exception_taken(cpu, type);
         qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
                       "stackframe: failed exception return integrity check\n");
         return;
@@ -6348,7 +6348,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
         v7m_push_stack(cpu);
-        v7m_exception_taken(cpu, type | 0xf0000000);
+        v7m_exception_taken(cpu, type);
         qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on new stackframe: "
                       "failed exception return integrity check\n");
         return;
-- 
2.7.4

