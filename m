Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2867224wru;
        Fri, 20 Jul 2018 07:57:16 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfhcxpwiGpFUGot+yF6Juyl3m6HpAqaIzCvKmtgFr8RODiAI60keMgaPerpETmzfKFswrp+
X-Received: by 2002:a0c:9493:: with SMTP id j19-v6mr2071444qvj.79.1532098636736;
        Fri, 20 Jul 2018 07:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532098636; cv=none;
        d=google.com; s=arc-20160816;
        b=Ci29pWmVHmY6xl2v31pCWyAixC3/GWQN7PjJ87/ojjXExyz05Kj1uc7vS45PlETxae
         R1ImQcgdufqcRZNhmjSWDzeXdVDA29pekQX/kqamOCObYxxTe3X8mBkCCnRfecNo+fUB
         qkk8K+k6Nchi/1QnjddWNzSzkKoWhdeKcqMScbod3eWlRK5Ha54R89wmqBazTRoSicWP
         y+QC+/2qdzOzh1s4TnEHF10dIiyM6dNAzn30y8fMtudj1gWPb+UhukD6bGbFVAz61ZZi
         uDY2zO+T4wunH+lreIrzvXP5kNrc+Z6go/eWzBQ59pOJFZKEMqKU3TUar92hpgfpXEM+
         fxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=RFl8l79qU4oIvWIw5ES3OnlNvJ7zXUjz8FZzD/LMAH8=;
        b=pFmj/jCVMBNl2+oyIaa1ZQ/HfIjxqsG1Q3I2GcsXROBHpbCsjWYVJMTmQsk6jzdGaS
         aIIavCN8xAw5dC53+Gh94AzdAmTCyZXp2O+efkU24iBU2zPY0k52ude/Ty5GpZZWhzAm
         b0MKlZNuQv8g+ciiiMMjxOF6oxFXp9AfH5gd1oL6hE4eVFPx5vhZ2XB0nb47s01D0VQq
         wZM8tbNCMdfmRZevu+/aLLQXrnAbEyludHVB9KGJOlxoVSmMtRtcT91F0bpSs9gQUjEX
         EEwqRbv16WSfni0SrOU0efsI6/4qr2DQN8x+XY+njx/dPoZ2agHqGHBd5IBwo1ckeTWP
         ee1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c186-v6si1058437qkd.125.2018.07.20.07.57.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jul 2018 07:57:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48495 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgWqH-0000TQ-TW
	for alex.bennee@linaro.org; Fri, 20 Jul 2018 10:57:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fgWq2-0000SL-8v
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 10:56:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fgWq1-0005zu-Ga
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 10:56:58 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43636)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fgWq1-0005xz-8U; Fri, 20 Jul 2018 10:56:57 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fgWpv-00050y-Dz; Fri, 20 Jul 2018 15:56:51 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 20 Jul 2018 15:56:47 +0100
Message-Id: <20180720145647.8810-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180720145647.8810-1-peter.maydell@linaro.org>
References: <20180720145647.8810-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 4/4] target/arm: Implement tailchaining for M
 profile cores
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
X-TUID: 0PGi4YeR/LIC

Tailchaining is an optimization in handling of exception return
for M-profile cores: if we are about to pop the exception stack
for an exception return, but there is a pending exception which
is higher priority than the priority we are returning to, then
instead of unstacking and then immediately taking the exception
and stacking registers again, we can chain to the pending
exception without unstacking and stacking.

For v6M and v7M it is IMPDEF whether tailchaining happens for pending
exceptions; for v8M this is architecturally required.  Implement it
in QEMU for all M-profile cores, since in practice v6M and v7M
hardware implementations generally do have it.

(We were already doing tailchaining for derived exceptions which
happened during exception return, like the validity checks and
stack access failures; these have always been required to be
tailchained for all versions of the architecture.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ff947416c9d..c9e9f95051c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7162,6 +7162,22 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         return;
     }
 
+    /*
+     * Tailchaining: if there is currently a pending exception that
+     * is high enough priority to preempt execution at the level we're
+     * about to return to, then just directly take that exception now,
+     * avoiding an unstack-and-then-stack. Note that now we have
+     * deactivated the previous exception by calling armv7m_nvic_complete_irq()
+     * our current execution priority is already the execution priority we are
+     * returning to -- none of the state we would unstack or set based on
+     * the EXCRET value affects it.
+     */
+    if (armv7m_nvic_can_take_pending_exception(env->nvic)) {
+        qemu_log_mask(CPU_LOG_INT, "...tailchaining to pending exception\n");
+        v7m_exception_taken(cpu, excret, true, false);
+        return;
+    }
+
     switch_v7m_security_state(env, return_to_secure);
 
     {
-- 
2.17.1

