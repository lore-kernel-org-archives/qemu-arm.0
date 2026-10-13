Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2066BCC6B13
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:41:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3z-0008UV-6v; Tue, 13 Oct 2026 04:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3h-0007m0-NN
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:29 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3f-0007wW-T8
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:29 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so22420295e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880826; x=1792485626; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=q/K/INR89Bv6VAIICicuXn9qF9wKrXQNAiWLKbQvRBc=;
 b=MDluzdadyBuLwKZdEPermr3tTnObLYdw+fw4SVDwqaRLg5GS27v9fRGgpdPuceGK/u
 ExfJLebZ/H6+R8tiDLNEcoueEnrqE/yMKaSd5dsG37La6BJzCqltw3JYmPhieW84499C
 bq8hDu6nXM2EaPZIIjWOz/01eqQ/YiPm6twggfXSes8egdHJ24lQ3dMLbVTd9/2nl/EU
 P4XaLYLjHlK+wL0dFR3ZH7GGlyHWWRsEzSUESN5BMgtzBduzBhUfwKHkU8gLkannLG59
 5FQbwC/7OUrLVJ9pK2szKl3wk1fzSSE/ILZaJeax8BZyPErFBXbaDhHq/r4T7gYLRdqV
 TF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880826; x=1792485626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=q/K/INR89Bv6VAIICicuXn9qF9wKrXQNAiWLKbQvRBc=;
 b=e99jAv5LO40CN5BniIB8jF8bBK1sr+f6GUSgbi9CbPfRnUIvg4q7cOTX9MNtoBAcnp
 zEkkrLoI9+o0twWznrrUUSrWZ0KXqjRFLVi3YhnEtjfahhuK2fvpnlye/AMUKgt9l5me
 FSQz8nDH7ynSIa6wUpQ+mgtCxNtLIH/ST/F3tbzlQWoJEi+pxnUb03O1f6J/urIjAGz+
 etlbiTgMm72gdAGbHyFifesAt27VVHpes7UlxkY6VFDPU8iAXbSdljowJQcKN/OcIDBe
 AsuMQV+XJ8oB0UTd5qsKWZYO4nVbNTnK07aswtPcRf+sXossnMvbLk6diBQasiraQF9T
 YyvA==
X-Gm-Message-State: AFq9FYJDYzUxnnX7n3LdzenJXp2lOP/9tYk0AvyZJgA50LcQEgc2kREj
 TlSVYkU1xHkOn4YvIVP0Sx6qNdaCy59Uk2WVt60hAbOL0Jsidooll5s6LErMRpgqUd4FKSkAhMC
 SvrUuZuc=
X-Gm-Gg: AYBFou2rUMjhFVEdHFeLM1AUDKqgWzNFBoojoPoSQ5U7N+cnLEi33AOiSP94QG5aMSl
 10tmY/AzvsqcdaM0OCPUAmzHWtcH4KJeo1RcbWocMHJvKnGhFZxZTGwaH3RWVf/dE13M7RYuj+h
 skws1JMFiViCUX2powamGsRTjd+zTdvv+5l8qK73nzneveVlwQDDG+RD0+Db0KBSNJyK9oNNH6M
 oeAyENf5am0HzOtPTjbiHd2/X+dZI3Yb8BIEwUsa6pv+PFJLb8rREF4x9vmqenAEm6PiYcQ4gA/
 hyGJM7/14YjpWv61k9Q7MgweNy/fG3aIZ1mjbDI1IVXiNnGeeOE6VfIDhIvUJdzdrzGd3Q6IbDC
 eYPT0GAKSBIAXxLCN3ju5HBXFksmySHn4e0DKRrnMMGQx1YdijTu1aaFeaLkrZ2YsP8Nov39hpl
 jb1WverhjPjlZwVyMJaYgmFLx0t7q0qgpD/QD9jdByySGT3eo5lWrqH5ZIFolD1JvLKTA60SU9P
 d2kDjrsQb6IrWEZsgoNbZnNLdy6fw9jh8WUYxVeS2VqkpbSFAcDtv84ubd8PSqgvuuFphLRDnMI
 6qNo
X-Received: by 2002:a05:600c:19cd:b0:4a1:80d8:aedb with SMTP id
 5b1f17b1804b1-4a18e49d9eamr229535035e9.11.1791880826322; 
 Tue, 13 Oct 2026 01:40:26 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 36/86] target/arm: GICv5 cpuif: ask the GIC for the virtual
 HPPI
Date: Tue, 13 Oct 2026 09:38:43 +0100
Message-ID: <20261013083933.1024405-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Now that we have an implementation of ICH_CONTEXTR_EL2 and the API to
the IRS provides a way to query the virtual HPPI candidate, we can
fix the TODO remark in gic_virt_hppi() by making the cpuif ask the
IRS for its virtual HPPI candidate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 2eb8184e329..cbe233c61bf 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -214,6 +214,19 @@ static GICv5PendingIrq gic_hppi(CPUARMState *env, GICv5Domain domain)
     return best;
 }
 
+static bool gic_get_irs_virt_hppi(CPUARMState *env)
+{
+    /*
+     * Return true if we should ask the IRS for its candidate virtual
+     * HPPI. We do this only if we have a resident VPE and are not
+     * ignoring IRS candidate HPPIs because of IRICHPPIDIS.
+     */
+    uint64_t ich_contextr_el2 = env->gicv5_cpuif.ich_contextr_el2;
+
+    return (ich_contextr_el2 & R_ICH_CONTEXTR_EL2_V_MASK) &&
+        !(ich_contextr_el2 & R_ICH_CONTEXTR_EL2_IRICHPPIDIS_MASK);
+}
+
 static GICv5PendingIrq gic_virt_hppi(CPUARMState *env)
 {
     /*
@@ -236,12 +249,14 @@ static GICv5PendingIrq gic_virt_hppi(CPUARMState *env)
         return GICV5_PENDING_IRQ_NONE;
     }
 
-    /*
-     * TODO: When we implement ICH_CONTEXTR_EL2, we need to check
-     * IRICHPPIDS and if it is 0 get the IRS candidate HPPI.  For now,
-     * set irs_hppi to "no candidate".
-     */
-    irs_hppi = GICV5_PENDING_IRQ_NONE;
+    if (gic_get_irs_virt_hppi(env)) {
+        GICv5Common *gic = gicv5_get_gic(env);
+        GICv5Domain domain = gicv5_logical_domain(env);
+
+        irs_hppi = gicv5_get_hppi(gic, domain, true, env->gicv5.cpuidx);
+    } else {
+        irs_hppi = GICV5_PENDING_IRQ_NONE;
+    }
 
     /*
      * If the best PPI and the best interrupt from the IRS have the
-- 
2.43.0


