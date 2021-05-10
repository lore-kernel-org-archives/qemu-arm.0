Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3050987lfg;
        Mon, 10 May 2021 08:00:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIM8/fSNTovBoBAsa3gG1J1qcFEO+mVAqDgchCvJ4O6Ui37ueU54frntDc4EIz2TyGkt4U
X-Received: by 2002:a05:6638:134c:: with SMTP id u12mr22210751jad.5.1620658837670;
        Mon, 10 May 2021 08:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620658837; cv=none;
        d=google.com; s=arc-20160816;
        b=x4r2I+25DdxfoBOYhmF6v/lOZM4f8hgq/jFEdCsIXEpYZj4wMq0ZW/JyGjMS+D26my
         Ajig1oKbtaTRLOJB+JevyNVor6bN9spi2EFqse85DKpXon+Mh8pLG/BLKO3nemRe5D6D
         kllBrtXcOc/pUfyX1cjC/NLmyCyDXCdbmpxfU091OLQGaOcumpFaQ6hdMZGULDgffq6l
         3Wxv4BnZLL0LKq6C+APKCXdO8s1lukUsmaq07AmVr03m62FwArjD5AqxcucnAI38hu0D
         Y0wJimwO0vYkh4mLh+6H2FsxvrGicjNOIjkM8A1Bom7fU3SzaDTT1TPKF+WUnKc9gQea
         jO5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=K/FNff2LAuvSwfSN8kNH1SIRafomx8yjd+eXfYkv1a0=;
        b=MnmGxeMRpjETyBJvgHiLyGRamnqINjD0QsUQR7p5OJV5+j4M/CfhO9kjU7M0QdzvKQ
         Eggt9au6VBAg1ojJYapOt87IT1dv0LzaDO45GLQLBiIggt9bCW7HdK8YVoB1X+GMBQeD
         ztTypet95lhOogqJtCdmfKEDrehyAUE3lauf16mX3xgginGsGcAauSr3IobcA/EcJ+4g
         akOjpJ/5yFeqDrlgtXnLi27h5iRDgioNJXQFyH44J644rQUYFfHaojyuauZHba54TWuB
         CO7RtWgFh+qp8SS82u2ENSvzEZEtxKeQPMP1tV2L9vHyXof3uAw2p+oXrz+bu2PN267s
         LdqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y4O8BTsX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si9222358ilt.116.2021.05.10.08.00.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 May 2021 08:00:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y4O8BTsX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lg7Of-0001HE-0q
	for alex.bennee@linaro.org; Mon, 10 May 2021 11:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg7OT-0001Dz-Vs
 for qemu-arm@nongnu.org; Mon, 10 May 2021 11:00:26 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg7OO-0004u1-Ms
 for qemu-arm@nongnu.org; Mon, 10 May 2021 11:00:25 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d11so16960111wrw.8
 for <qemu-arm@nongnu.org>; Mon, 10 May 2021 08:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K/FNff2LAuvSwfSN8kNH1SIRafomx8yjd+eXfYkv1a0=;
 b=y4O8BTsXHQwap60+p6j11NiScwk73IhhFX+F0vVFLwqQzU06QwwIo8+4Tf+idppOdn
 0sOj6JG3HDeQ6DY5XnnIf19X2v1uQBUaY3Q7xi+3RtnrjtBIMEADRcqPRVqUOFsL6mhS
 s0qxjuXPNoD9vbSRzOOHH4u+iJQtAB6hctqHlg6vWQc3h22O+ZGvY+j02l5zPJbzk/wE
 oyz1boXrW553tjIQcDMzHCUU5tTg6iC9Xi1bjYreJC9yr4PuqeSiJpVTHzXXF2jlKO7r
 hMJNdKapK+FexCcwTxA8vZaaoZxsa1kD52l8JcgRZXgsdGtzxoEw0+nk5tzXuQ220QsN
 Kk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K/FNff2LAuvSwfSN8kNH1SIRafomx8yjd+eXfYkv1a0=;
 b=tt7Y1CfWDq5yUzF+tZAknPH8njJPWmz+kcVYuufUdjm4Z0WqKP3jG8agNuhM3+xBQv
 J2jUznSEscHLMpUzhbX6MhneG3vwzRt8zwGTr5vXS2fFWVuquE/obMQ8pdR5D/RTK6qH
 chCxyJq3BrAGDDJnfARd9TTYUj8pj+sdjHLDc9LHK3LrDDzybvZ/zlJ8OzRwJM3Sh3J/
 25Lo5hCoZ7ExZovJeB1KEnYKc9xCLuI3TuQ1h3RpK5/odEYxEbxnT5dyfbu+6velWnm6
 4G3z+tut+jzY/9GblCWPT0IOsMiVvCS04JQBGWy7uMQ788hGevPHGWFAwZvrR0k5Ysth
 B/5A==
X-Gm-Message-State: AOAM5305l++A8X5JoYNGq2a9aK4jYC5pUNp5xfjTkJbO3asNSG7ZGMwr
 u5td2jSoEXIbraEhc5/NC4DrXTxU8pZfzw==
X-Received: by 2002:adf:fa4c:: with SMTP id y12mr31165040wrr.393.1620658819088; 
 Mon, 10 May 2021 08:00:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p10sm22499619wrr.58.2021.05.10.08.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 08:00:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic
Date: Mon, 10 May 2021 16:00:16 +0100
Message-Id: <20210510150016.24910-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Chan Kim <ckim@etri.re.kr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aijB98kmgREV

In icc_eoir_write() we assume that we can identify the group of the
IRQ being completed based purely on which register is being written
to and the current CPU state, and that "CPU state matches group
indicated by register" is the only necessary access check.

This isn't correct: if the CPU is not in Secure state then EOIR1 will
only complete Group 1 NS IRQs, but if the CPU is in EL3 it can
complete both Group 1 S and Group 1 NS IRQs.  (The pseudocode
ICC_EOIR1_EL1 makes this clear.) We were also missing the logic to
prevent EOIR0 writes completing G0 IRQs when they should not.

Rearrange the logic to first identify the group of the current
highest priority interrupt and then look at whether we should
complete it or ignore the access based on which register was accessed
and the state of the CPU.  The resulting behavioural change is:
 * EL3 can now complete G1NS interrupts
 * G0 interrupt completion is now ignored if the GIC
   and the CPU have the security extension enabled and
   the CPU is not secure

Reported-by: Chan Kim <ckim@etri.re.kr>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 48 ++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 43ef1d7a840..81f94c7f4ad 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1307,27 +1307,16 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
     GICv3CPUState *cs = icc_cs_from_env(env);
     int irq = value & 0xffffff;
     int grp;
+    bool is_eoir0 = ri->crm == 8;
 
-    if (icv_access(env, ri->crm == 8 ? HCR_FMO : HCR_IMO)) {
+    if (icv_access(env, is_eoir0 ? HCR_FMO : HCR_IMO)) {
         icv_eoir_write(env, ri, value);
         return;
     }
 
-    trace_gicv3_icc_eoir_write(ri->crm == 8 ? 0 : 1,
+    trace_gicv3_icc_eoir_write(is_eoir0 ? 0 : 1,
                                gicv3_redist_affid(cs), value);
 
-    if (ri->crm == 8) {
-        /* EOIR0 */
-        grp = GICV3_G0;
-    } else {
-        /* EOIR1 */
-        if (arm_is_secure(env)) {
-            grp = GICV3_G1;
-        } else {
-            grp = GICV3_G1NS;
-        }
-    }
-
     if (irq >= cs->gic->num_irq) {
         /* This handles two cases:
          * 1. If software writes the ID of a spurious interrupt [ie 1020-1023]
@@ -1340,8 +1329,35 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
         return;
     }
 
-    if (icc_highest_active_group(cs) != grp) {
-        return;
+    grp = icc_highest_active_group(cs);
+    switch (grp) {
+    case GICV3_G0:
+        if (!is_eoir0) {
+            return;
+        }
+        if (!(cs->gic->gicd_ctlr & GICD_CTLR_DS)
+            && arm_feature(env, ARM_FEATURE_EL3) && !arm_is_secure(env)) {
+            return;
+        }
+        break;
+    case GICV3_G1:
+        if (is_eoir0) {
+            return;
+        }
+        if (!arm_is_secure(env)) {
+            return;
+        }
+        break;
+    case GICV3_G1NS:
+        if (is_eoir0) {
+            return;
+        }
+        if (!arm_is_el3_or_mon(env) && arm_is_secure(env)) {
+            return;
+        }
+        break;
+    default:
+        g_assert_not_reached();
     }
 
     icc_drop_prio(cs, grp);
-- 
2.20.1

