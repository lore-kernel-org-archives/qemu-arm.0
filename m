Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99875CA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:49:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY4O-00010P-QL; Tue, 13 Oct 2026 04:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3T-00079z-Os
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:16 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3M-0007pu-J1
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:15 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso30872945e9.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880807; x=1792485607; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=B1w6uxY/LEmMclAoc4yxHiksAryvWTTi6k+Zr0LKKAc=;
 b=GCcG4gJz+49AB+wk5seIVt04U0JAupgbwBHNjGyeCRk1zxseTyWRH8028s+EGUdAnQ
 bTSrvzkhbWtipqJmbFPvnoVrEt0PQJ639zwVMQnriJW0ZpPGcB9H6Mlf1QtDNO52JXz8
 paN3oBom5bfIHe9223drrp8HVlugXZ5IholX57BTepsOyLqLzfDMTlRjh/gb0CP7lPyk
 /ormPfB+EtLdPPzGAx6ptJ09oDeUsNueeadtIK90pWjaN2av8sPUHW2fmJ19U3XtPRB9
 4CHDkZAN3YFs0oUY5SXC/0+hg/iPab9b5otuwRVuyf4xqbthmEgQFKo1WwyVWw9D+HDQ
 KXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880807; x=1792485607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=B1w6uxY/LEmMclAoc4yxHiksAryvWTTi6k+Zr0LKKAc=;
 b=nyshD91LHguXyGn2rU7drnGYdKLGJubw9lHiXAcUxOouZGFKstc8dNSIyC49Sktcue
 jKToGemDsi2q18ExZFBqLs4BC/SJasowlht3OwV2xTEMPggksU1NsksLV+X9lKKcZtqp
 pRgWj8jY/rz+MpvjPGxeX8Gjbb34d91J70oaOlRKBDgbOcch6N8ZeHJRx4FoEXG7SJeA
 vOssvTGES1IqvAM3kjRN2bHD1Hmk4Oev6EMOkyb7bc5NVN5cvlvi/7/o+CADRd/hA14C
 o50lgO8tOlep5TZHpAr1/9i3SluX2/HZhLKKZVdmSbJcRQm4TrqR3c7iWEKMuHX5iD29
 D5pA==
X-Gm-Message-State: AFq9FYK+gexze1oMQCcekLcNSZ5u1P/PAjS7092hbB30EXeow2WezBfg
 XMPdxmqu3IC+AO4vWj8lFMNPRjFVsBA0FPeC2sY7fJiNUypPgtX/WYX7c8g+9MdV4pSPnVTenUo
 zaLf/GKg=
X-Gm-Gg: AYBFou1Y7xTpacLKxax4z7GTl+U+eziH4TZnNtbGG0AtW6fNqaNn9okMS5+kcL4foVy
 Dx16EezXh7ghNHlScj1vhpoZfcQ81sXi6Bovj0CD1BlXd1ShJr+3GU5WECT+ymmRAlZS792DgA7
 W9J4wQhYPYmYKZHpuVKl8UJdBItLiDWAG4TA9t4o4MoCH+kEGCpmOT99niqHjR3aAbkkVILSqCh
 OxW5f+jRKQfQnhhZz6KhOkK5+0lRjhmSjXKI95JiQb56gYfIyRYqHjPiUKB3BldssnoymWcxAVT
 Bj0xd6bqRebF3sjMm0vG5rGtXlGExN0AerXyialJAk3n/pSLXRhVn1ae2EXZLJUFkxGRfXZkDYL
 w1Tzrhv2n6QvJXWN9MkXz65qPxyvLa6ZqVGeFyeGRSAw9K33zFaJCGgDCur/4CKcU8PwT73EMU3
 8q1Yb0dAEw+RCgwnfflaDlaQPFX5ZAfkgIWIB9YkXTDZhgUtAFW489NjrjUF4W6W3v524feSjcr
 UPODnIkFHwu9P+CCFmntYmLI3GxAoxOR88eahVYICLEWnkh+dsWZJiB/90yc8fyNgXq2d6LXATl
 0kY=
X-Received: by 2002:a05:600c:8216:b0:49d:34:420d with SMTP id
 5b1f17b1804b1-4a18e4b0465mr233700905e9.20.1791880806655; 
 Tue, 13 Oct 2026 01:40:06 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 23/86] target/arm: GICv5 cpuif: Implement ICV_APR_EL1
Date: Tue, 13 Oct 2026 09:38:30 +0100
Message-ID: <20261013083933.1024405-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Implement the redirection of the ICC_APR_EL1 encoding to the
hypervisor guest's view ICV_APR_EL1; the data for this is stored in
the ICH_APR_EL2 register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 93141c751e4..b183c8a6e79 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -99,6 +99,17 @@ static bool gicv5_legacy_enabled(CPUARMState *env)
     return false;
 }
 
+static bool gicv5_icv_access(CPUARMState *env)
+{
+    /*
+     * Return true if ICC_*_EL1 accesses should redirect to ICV_*_EL1
+     * (i.e. we are in a hypervisor guest). Note that unlike GICv3 we
+     * don't need to care about HCR_FMO. See I_XVDWC.
+     */
+    return arm_current_el(env) == 1 && (arm_hcr_el2_eff(env) & HCR_IMO) &&
+            !gicv5_legacy_enabled(env);
+}
+
 static GICv5Domain gicv5_logical_domain(CPUARMState *env)
 {
     /*
@@ -522,16 +533,25 @@ static void gic_icc_apr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * With an architectural 5 bits of priority, this register has 32
      * non-RES0 bits
      */
-    GICv5Domain domain = gicv5_logical_domain(env);
     value &= 0xffffffff;
-    env->gicv5_cpuif.icc_apr[domain] = value;
-    gicv5_update_irq_fiq(env);
+
+    if (gicv5_icv_access(env)) {
+        env->gicv5_cpuif.ich_apr_el2 = value;
+    } else {
+        GICv5Domain domain = gicv5_logical_domain(env);
+        env->gicv5_cpuif.icc_apr[domain] = value;
+        gicv5_update_irq_fiq(env);
+    }
 }
 
 static uint64_t gic_icc_apr_el1_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    GICv5Domain domain = gicv5_logical_domain(env);
-    return env->gicv5_cpuif.icc_apr[domain];
+    if (gicv5_icv_access(env)) {
+        return env->gicv5_cpuif.ich_apr_el2;
+    } else {
+        GICv5Domain domain = gicv5_logical_domain(env);
+        return env->gicv5_cpuif.icc_apr[domain];
+    }
 }
 
 static void gic_icc_apr_el1_reset(CPUARMState *env, const ARMCPRegInfo *ri)
-- 
2.43.0


