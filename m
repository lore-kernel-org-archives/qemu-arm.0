Received: by 10.223.150.237 with SMTP id u100csp4139568wrb;
        Fri, 10 Nov 2017 11:54:08 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZIdd5LawMptBp/fiuaymgLqb6mXfvyZwB2gx828v7niECHxU43fxJVNPn5UDf9pjel2pAU
X-Received: by 10.37.175.67 with SMTP id c3mr1018807ybj.33.1510343648493;
        Fri, 10 Nov 2017 11:54:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510343648; cv=none;
        d=google.com; s=arc-20160816;
        b=nKDqtjKfXHUETtmS2mvdRmEOTnHO137FCs7vs9JJoOKr25WPfiZFJQ6r2j4SjY21NO
         nqUEJPXp6DWcI9XCXNqc1jlnjoign6uORa/AqeJIfJwQBf+2x5tyOkXkvOk1v1BIUd91
         CHj9aRTu/mmq1Lnogv9Z7kLgkzCeIRe4tx48MCeaEADpDoTEuia5nl9+Vekju4GZvf7j
         c1AF3tx65lIzm3Axl/9VjMnHrNiO+x6yXjQHV13aVY2tIpnWAn73pf+Qo8MLvAx7ZWy4
         JvrfWOVR7fBncMvOZChtmxP9nKpyTc9Ms4fOcw1x869Ss+nPI8M/I5pY9N1u49HwKS4K
         8IGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=GICqql91n8/XxF+zmvhStmbEqTisJhB0HxKda0g+MjY=;
        b=y1BJAdg51JLEFKvNvz9jqESSnGGDCi7t6dRtiM2G+3ccwpcbWWHdmTLYlaKRSdYHbR
         i7+0NrqltnLqa/dUB9I6wxSjtKrKpKHipfaRM+FTo55+75Cm/INZ5ujMPJfeA6DKj7hb
         sHhqOK2+OjveeqUvB1kmSpchBYVk9sB97PnQYM3tWuk8ksPxYW3LeYhZVoTWf4Q+rGO0
         NA9aeE726srB8BfJpP3rab9PcFP3vtf7vQiNMrwPzrhuHk+Z0bMuYxs/xkIQp3FVGRJi
         jR+LhSVAi4OLoxXO7N7g0DgXrFn9aEssjWqwZL3Hnvm/XZSpipRQXrgNqFXkNbaR6RPZ
         p8aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=lOMgzNX3;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=D4FbCn0K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d9si2252149ywd.141.2017.11.10.11.54.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Nov 2017 11:54:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=lOMgzNX3;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=D4FbCn0K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43238 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eDFNP-0005PX-UI
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 14:54:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eDFNA-0005Lj-41
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 14:53:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eDFN5-0006B2-BP
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 14:53:50 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:49123)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1eDFN5-0006Af-8g; Fri, 10 Nov 2017 14:53:47 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id C6BB02126E;
	Fri, 10 Nov 2017 14:53:46 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Fri, 10 Nov 2017 14:53:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=mesmtp; bh=GICqql91n8/XxF
	+zmvhStmbEqTisJhB0HxKda0g+MjY=; b=lOMgzNX3e1KJN1nnHCzr7xITvaW2YS
	cE6TRgb17uawKghqzIYLyu6ynpQNEylWWf/CJc3Uott/9Ke22M4KyL7NQ3D1BK5B
	9QSRPJjhSDn8wmP3gfysfYiOT9cPNdif3PHCym/pt84l6kKJpJ/uLDu4DDXSqG1s
	FBa7gJlnkCYQ8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=GICqql91n8/XxF+zmvhStmbEqTisJhB0HxKda0g+MjY=; b=D4FbCn0K
	PaZhF6rhkM4NZAlSeLBh+xXewvJVaJIHHWF5LbMsi2txL0THdzgA+mFDr7UscIqq
	vEUwMTPHZ9YY8PZ5BTfBk2rjpNP2+mUClfPf4quYPWNVbOfE/JD0CsmlCWFUXGBp
	cugZJBeC1kJYBMqTTRTfMTAqWoNTLECMWel3+sTi2fodPa/CZaEvto0Ky3lt4Yir
	T4jvC7OvdGVg3SXPzDpq4Y+sorfqIM/HlP0WJMm5mQ66gP85TH69QCA31pCFuI/H
	bap+nyTWSewDGkefPnJoGZZSSNgufLk56jPhPuGWqF2/ZTo3PIPHKNWALlzZ0pV2
	vNos6n9hpTNT1g==
X-ME-Sender: <xms:ygMGWvaexpHBDTspxe5HyaqpK_cftZYQps5XHTBV_-7GJ9utRofkGw>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9157624631;
	Fri, 10 Nov 2017 14:53:46 -0500 (EST)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Fri, 10 Nov 2017 14:53:42 -0500
Message-Id: <1510343626-25861-2-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510343626-25861-1-git-send-email-cota@braap.org>
References: <1510343626-25861-1-git-send-email-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: [Qemu-arm] [PATCH for 2.11 1/5] qom: move CPUClass.tcg_initialize
 to a global
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VUmDJU/geKwP

55c3cee ("qom: Introduce CPUClass.tcg_initialize", 2017-10-24)
introduces a per-CPUClass bool that we check so that the target CPU
is initialized for TCG only once. This works well except when
we end up creating more than one CPUClass, in which case we end
up incorrectly initializing TCG more than once, i.e. once for
each CPUClass.

This can be replicated with:
  $ aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -smp 6 \
      -global driver=xlnx,,zynqmp,property=has_rpu,value=on
In this case the class name of the "RPUs" is prefixed by "cortex-r5-",
whereas the "regular" CPUs are prefixed by "cortex-a53-". This
results in two CPUClass instances being created.

Fix it by introducing a static variable, so that only the first
target CPU being initialized will initialize the target-dependent
part of TCG, regardless of CPUClass instances.

Fixes: 55c3ceef61fcf06fc98ddc752b7cce788ce7680b
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 include/qom/cpu.h | 1 -
 exec.c            | 5 +++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index fa4b0c9..c2fa151 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -209,7 +209,6 @@ typedef struct CPUClass {
     /* Keep non-pointer data at the end to minimize holes.  */
     int gdb_num_core_regs;
     bool gdb_stop_before_watchpoint;
-    bool tcg_initialized;
 } CPUClass;
 
 #ifdef HOST_WORDS_BIGENDIAN
diff --git a/exec.c b/exec.c
index 97a24a8..8b579c0 100644
--- a/exec.c
+++ b/exec.c
@@ -792,11 +792,12 @@ void cpu_exec_initfn(CPUState *cpu)
 void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
+    static bool tcg_target_initialized;
 
     cpu_list_add(cpu);
 
-    if (tcg_enabled() && !cc->tcg_initialized) {
-        cc->tcg_initialized = true;
+    if (tcg_enabled() && !tcg_target_initialized) {
+        tcg_target_initialized = true;
         cc->tcg_initialize();
     }
 
-- 
2.7.4

