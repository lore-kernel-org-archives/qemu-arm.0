Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2869487wru;
        Fri, 20 Jul 2018 07:59:47 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfTAFCvaoKuHZE1AWHgr2S4jhBvjSEoJBdMcD8EZ16FapadokUDb3xEBZuSp3cmuMitzwaS
X-Received: by 2002:ac8:196c:: with SMTP id g41-v6mr2298867qtk.277.1532098787560;
        Fri, 20 Jul 2018 07:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532098787; cv=none;
        d=google.com; s=arc-20160816;
        b=Qq0WkMRzAXCiJlyMSaOeYmQfdXlWZL9aPFxtfgo6Rzo2/fpq1AFXpbwpKWNgBEC3pj
         uSAlx97qlP9ae/yN15R8MtopSel2uriuiwtgkltqeq3nIJNXVqzPQyxu7vAPb8WF7cvT
         pJTMuFar2El5RvJ5tg51HKgTfY87nSCfuMJ9jC7JfUJEREjuEFZPtGtI74JRNb05XsA0
         fm/CAOtTmhg3SNqBzgx0Cyu8mjoxQsZj1q/vRuNMGAKT16vOC3mgiwnDdDYZ0WjyTgkD
         r4dqAkdoerb9iwJgGcyhhZaImXMlbXCr+pEliMYuIYtcwazDo7AcYqsOvAt/uPg2Vyy7
         az8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=pPfLpPjjjcrIFy2BWsE26kLJE9K7emJqbc7xKjwL1zE=;
        b=zWb50bN7ydUydqL3iRhkoWsyEAYj7j6lR6BQfP40R0SWQOG5a35EsKlHbH0qyr0Du0
         t+R3zGEBUyhi/2hIODhKynlOKRG+/Qomd891TynaCLxr+247db0SArez9YEaDi/gHdO1
         wGd7WG/v3Cn3dbr3zESSL/PQd3UYHnST2mwciop5+/7atVEIbWDh5LdFkwZakonK0jwI
         4ppiwihytuTyujPhk1FoZMf+aXzbojrXegG2kMGMgOPeUQ9Zj3GcFwTOo5objeDdQ01b
         HhhUBMgrMAKowdfHfqzUnaPvN2nVBMnIhU3hPQrjPS/QvVwLHvTPPeBomrUuq1ZIZaFY
         Bu6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z21-v6si1981041qki.188.2018.07.20.07.59.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jul 2018 07:59:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48506 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgWsl-0001pf-1D
	for alex.bennee@linaro.org; Fri, 20 Jul 2018 10:59:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fgWq5-0000UI-S3
	for qemu-devel@nongnu.org; Fri, 20 Jul 2018 10:57:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fgWq4-00062n-RW
	for qemu-devel@nongnu.org; Fri, 20 Jul 2018 10:57:01 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43636)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fgWq2-0005xz-8P; Fri, 20 Jul 2018 10:56:58 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fgWpu-00050T-NO; Fri, 20 Jul 2018 15:56:50 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 20 Jul 2018 15:56:46 +0100
Message-Id: <20180720145647.8810-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180720145647.8810-1-peter.maydell@linaro.org>
References: <20180720145647.8810-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 3/4] target/arm: Restore M-profile
 CONTROL.SPSEL before any tailchaining
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NLqnsHV43zt9

On exception return for M-profile, we must restore the CONTROL.SPSEL
bit from the EXCRET value before we do any kind of tailchaining,
including for the derived exceptions on integrity check failures.
Otherwise we will give the guest an incorrect EXCRET.SPSEL value on
exception entry for the tailchained exception.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index efcadfc7fa9..ff947416c9d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7131,6 +7131,16 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         }
     }
 
+    /*
+     * Set CONTROL.SPSEL from excret.SPSEL. Since we're still in
+     * Handler mode (and will be until we write the new XPSR.Interrupt
+     * field) this does not switch around the current stack pointer.
+     * We must do this before we do any kind of tailchaining, including
+     * for the derived exceptions on integrity check failures, or we will
+     * give the guest an incorrect EXCRET.SPSEL value on exception entry.
+     */
+    write_v7m_control_spsel_for_secstate(env, return_to_sp_process, exc_secure);
+
     if (sfault) {
         env->v7m.sfsr |= R_V7M_SFSR_INVER_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
@@ -7152,12 +7162,6 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         return;
     }
 
-    /* Set CONTROL.SPSEL from excret.SPSEL. Since we're still in
-     * Handler mode (and will be until we write the new XPSR.Interrupt
-     * field) this does not switch around the current stack pointer.
-     */
-    write_v7m_control_spsel_for_secstate(env, return_to_sp_process, exc_secure);
-
     switch_v7m_security_state(env, return_to_secure);
 
     {
-- 
2.17.1

