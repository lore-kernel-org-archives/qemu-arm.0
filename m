Received: by 10.223.150.237 with SMTP id u100csp3024673wrb;
        Mon, 6 Nov 2017 12:13:55 -0800 (PST)
X-Google-Smtp-Source: ABhQp+SUkoRzMy9n7/7XIdhpGhoHFPtd2yEi4naU3rIvJ52lOOwDBhuqDVyTOOUSaHbOsDtoc5Dm
X-Received: by 10.37.135.9 with SMTP id a9mr10395831ybl.3.1509999235056;
        Mon, 06 Nov 2017 12:13:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509999235; cv=none;
        d=google.com; s=arc-20160816;
        b=sfL9H22L/KrtkzzX3vJPy/IyIqXzVH+jGmIOtOiglpm3qVajnZy+h8ecZ7nfcIIPJ2
         SuXg4CTrtH6BIrfKW8pT46klpxnYlFNCF8wKuYHH7KnmLshamLxNKtBkiTBCeqDJT8Gv
         u/lMnkrGcMkp65gGccJcD8UTuXPFPkYHmxeg9P8Gya2uPeCP5bbKmi01CNEWOYGd0yXD
         2eCCFNq4Ll9IMVsg8WUSnwh4EdQPH/aheVUucxTZsAZL+n21X2sOJnhqoWrTrT+VzU1U
         D4R4OEbYLwVEdNnT0TGi6FWEEOwKYFh7slTt0sx08MAEumoPWJu6Be8EnvsYsoWTEekC
         Jtyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=hpHLb5KJ09xsKPzv00vdilMG/C4sqCdvthnOJoOC+a8=;
        b=zkgOHhGq69aG82gKrgAwWUc8Bf0ySm6LdUNQ5lfHyOKUjx61oZfpZUp/SDaVRoKBkT
         ERqV/tYoT98gJXdOcTeXwgjEoWOdbinqNkA6EHIdsSD3SKBu4rpRNnz6LXqRPrnWrMgJ
         VVlWl6wQFw9ZhmRaxxswzC1BFCd0fsbTHefAIJU4IFSJSnD5F1dnlUwhf8uRyNVLTdsE
         5mYuS7FoozOFfmXgGYjbY4XmEAx0jKmKMGiR9vmlR4EBJIy4tcyrQVAiYWg1g6Xy0rpz
         ptJftAt5sjTnqejlTcGNrDfbn7qZDDricBy5P5es603fgiW+eH+LbX5I3FTb5GuXQCIZ
         a2HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=ee2tGTjj;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=OWsSkSEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u6si2708450ybk.607.2017.11.06.12.13.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 12:13:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=ee2tGTjj;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=OWsSkSEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBnmM-00023Z-ET
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 15:13:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eBnm7-0001yl-P1
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 15:13:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eBnm4-00052K-HZ
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 15:13:39 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:36705)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1eBnm4-00051K-4n; Mon, 06 Nov 2017 15:13:36 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 5B4B120D1F;
	Mon,  6 Nov 2017 15:13:33 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Mon, 06 Nov 2017 15:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=hpHLb5KJ09xsKPzv00vdilMG/C4sqCdvthnOJoOC+a8=; b=ee2tG
	TjjqW9fIS7lyCWIVs5HYlrGaD9vwTX8d1pO8SZnL1ELmeBErIzi7oJMv+pi1hPhA
	HVKmClGGSY0nzhzMJ8Rx1wa6Dw9j9OidvPMuEL4MH8oDKvrMDMuEHqBDDYrCAExj
	PsDX/DSBsNOTkDEFv8MoZVbx/9ZteSVlh5dmN4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=hpHLb5KJ09xsKPzv00vdilMG/C4sq
	CdvthnOJoOC+a8=; b=OWsSkSECG7ZuRZChBNDhXBnD5L+HCBeo7Io1sWW+F4q7d
	AgC4jWhgvNPoEDmwMk08PB0ctrYejTEPOvNDSODa+1pddoos5OIUVXSvmTnaZ/Fq
	7LsHQQdmnudaBJzxgXyzdPkzxzNxJXsHqgPPlZpPw9F5IEmMoAUwG9ixvplMFadc
	iUsCQDN47T7axzz2Zdte9mgHNuU7sgSL7YFWBz1u/fVQtHcjGIUEYRkEL0Lg6BHx
	O6vWNxW/HNZMWDBQDp9dHYNTZGcvJjsJGqxfslzD4zV96mwShcYdCqgcTquiEOdL
	WSjXD06A4wp2kMXL3AmJiK2YQRuAQhzbFACBFVqBg==
X-ME-Sender: <xms:bcIAWqwF2_X-ghr9yOU9Zz564kXY1U2t8tTQdlw4KH3H9MJCB0U9gg>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 135F724E82;
	Mon,  6 Nov 2017 15:13:33 -0500 (EST)
Date: Mon, 6 Nov 2017 15:13:32 -0500
From: "Emilio G. Cota" <cota@braap.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20171106201332.GA2152@flamenco>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
	<20171103185610.GA3907@flamenco>
	<20171103200233.GI3111@localhost.localdomain>
	<20171103222407.GA22411@flamenco>
	<20171106141022.GO3111@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171106141022.GO3111@localhost.localdomain>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [PATCH] hw: add .min_cpus and .default_cpus fields
 to machine_class
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
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NgJkfchPLjhy

On Mon, Nov 06, 2017 at 12:10:22 -0200, Eduardo Habkost wrote:
> IMO, initialization state doesn't belong to CPUClass.  We already
> have a single accelerator object in MachineState::accelerator,
> and tcg_initialized could be moved to a AccelState::initialized
> field.

I don't know how to cleanly get AccelState from a CPUClass pointer
(as I said I'm not familiar with object code / qom) -- suggestions
welcome! The best I could come up in the limited time I have for
this is to use a static bool, as shown below.


---8<---

Subject: [PATCH] qom: move CPUClass.tcg_initialize to a global

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
 exec.c            | 5 +++--
 include/qom/cpu.h | 1 -
 2 files changed, 3 insertions(+), 3 deletions(-)

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
-- 
2.7.4

