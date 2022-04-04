Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp296146lfu;
        Mon, 4 Apr 2022 08:58:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdBFiHPZRgD6GU2DFnJB/sPSLIA7cFOmHG8Y5jFkM72hhRip9/SJ6GT1SKEMjGS1tivGhh
X-Received: by 2002:a5b:f0b:0:b0:63c:bd4e:2b60 with SMTP id x11-20020a5b0f0b000000b0063cbd4e2b60mr401902ybr.473.1649087918620;
        Mon, 04 Apr 2022 08:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649087918; cv=none;
        d=google.com; s=arc-20160816;
        b=FTeouoEBn4XCSB4K3ztk8YwV54R11BZJQp8DNlobQvUViXYHH/aCSX6RROTNjddBgz
         oa5PLY2VhOyKJLgVoklbP+ZcZJ3JrQIUOAMe7UN8qm9IupLCsAPv4tlcuXTldgrg4X9o
         Z15zBeiDzh/FfwPtg0VWBTHHvWcWpu40FAhiBKy92Jw0fkgs8T0+71QQREcXsS+4/sC3
         G91xnglsf2lBXm47PicZERpEExNC8wtH9wlTkGjUXbQapXDA0kPeYlPAwHeg4tranxdq
         IfDTefpkAWQf7r+/ddfXEUmaB1P97JVQ2u4PU1cn2+5zBIf+pqNf7eDHcI6b3ezCeHM/
         VfXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mIrd28egp62k1mFtNr78iA48Ha8ZdXF7kaG1TYfY2Rg=;
        b=DBf0aK4J7+fna54Fbb7yhB183jMVXPeOwOEb7KQbYxZ0yCr3nmdxEB2IyhDMVARb9X
         lQzt1tWRmM6zYWrT558+QvgauJ5m2WJvia/NPKHeKcchaWnCfW8GLcHnNAkrQa4tTKzu
         U12895ULLiGdbGcAXUZfixuGO4ODWpKrgaYUAmNZX6uCsFoaDHZ8ECisnuVJI96JlLFK
         qXv4zp1vy75xvcct1wgeUd/TK6pKjMo47oZsT+a+kb+PWeZPjhjKfNPkN9cZXJcrtJX2
         iBeOuqYHMSYoN8t11bDT26WfJGaeuhBKLkqUCMvmvdBb8EqBZ5tnNjBjUOTktVgqGlT4
         PbnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HXxmeOdv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i202-20020a253bd3000000b0063da27b1982si5012047yba.583.2022.04.04.08.58.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 08:58:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HXxmeOdv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbP6E-0001f4-0U
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 11:58:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvI-00051y-HW
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 11:47:21 -0400
Received: from [2a00:1450:4864:20::42e] (port=36674
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvF-0000X6-Io
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 11:47:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u3so15188902wrg.3
 for <qemu-arm@nongnu.org>; Mon, 04 Apr 2022 08:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mIrd28egp62k1mFtNr78iA48Ha8ZdXF7kaG1TYfY2Rg=;
 b=HXxmeOdvMqanzstk4ToI9iI8rKSdvIjXcsSZCW1Nlz/aRpaMJvQUf+Qy5Cdi1GGA0u
 lZ3Vd0hPHMpFLw8e24gaFmDKsPzTy3J0LD77yc2cChlG3ye9cwhvp/quun36dSqlaZdm
 S9isS0UeRePmKaTJFbp8mQR9brxaUXTBlL7LHW2veoCn2OVX5af75STFxOcuEiBTK2G/
 fDndN2lKpgz22cjw/RVPHoCGK38L6q1hcUhWpPdsoKbFmnfbDoSsKsOvmxG9NiExHWlQ
 S84DhXr0rWoitX/yeGg0YuZU5ImxPeqlSUnWBfKM/NQ77XyDV46fXBSDwie8N8QFU9Ut
 TIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mIrd28egp62k1mFtNr78iA48Ha8ZdXF7kaG1TYfY2Rg=;
 b=1ITFTCLdjuqV1JxI07wI4Oh/Ovz3sL/T7B/lV4y1rQ9vOmJPwKCJtgrLfTLl3MMjoV
 3De5qZ0HXThSB/RCCmd7vegt/+AD+Ka/I5Of1R63kD9yR01PdbhiyHCYuJNxEK8w2rTI
 b3NxKyZ/RQCVpwcEWkTvPP+bqIxVrwpjcMks3Q4JO+UhdlrHU9Z1dG1KqUtew0zf73xj
 Vw8c11Pv/EWuB6m2yusgC3gi/qJeBUYuxzul/rXfik5XTp83gm4KhMWD+TP7rKDOLiVb
 4ISaR4mdsTYPCNMW4DoyL0gMd0EVDG97fvYNqYGE4YtnHPsqLHZtrXDbRzHH6KX0W5fd
 jyaA==
X-Gm-Message-State: AOAM532aIVsuKxqnkEnHEPrMFESp+nosXd87CgcGiKtI243FCGFBJ9XQ
 IO63EeVYFQJKd3tn8ncAhjy5dzQl2mviVw==
X-Received: by 2002:a5d:4288:0:b0:206:b7b:db7a with SMTP id
 k8-20020a5d4288000000b002060b7bdb7amr323899wrq.28.1649087235281; 
 Mon, 04 Apr 2022 08:47:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 15/18] hw/arm/exynos4210: Don't connect multiple lines
 to external GIC inputs
Date: Mon,  4 Apr 2022 16:46:55 +0100
Message-Id: <20220404154658.565020-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X/Fr/nKN2r2b

The combiner_grp_to_gic_id[] array includes the EXT_GIC_ID_MCT_G0
and EXT_GIC_ID_MCT_G1 multiple times. This means that we will
connect multiple IRQs up to the same external GIC input, which
is not permitted. We do the same thing in the code in
exynos4210_init_board_irqs() because the conditionals selecting
an irq_id in the first loop match multiple interrupt IDs.

Overall we do this for interrupt IDs
(1, 4), (12, 4), (35, 4), (51, 4), (53, 4) for EXT_GIC_ID_MCT_G0
and
(1, 5), (12, 5), (35, 5), (51, 5), (53, 5) for EXT_GIC_ID_MCT_G1

These correspond to the cases for the multi-core timer that we are
wiring up to multiple inputs on the combiner in
exynos4210_combiner_get_gpioin().  That code already deals with all
these interrupt IDs being the same input source, so we don't need to
connect the external GIC interrupt for any of them except the first
(1, 4) and (1, 5). Remove the array entries and conditionals which
were incorrectly causing us to wire up extra lines.

This bug didn't cause any visible effects, because we only connect
up a device to the "primary" ID values (1, 4) and (1, 5), so the
extra lines would never be set to a level.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/exynos4210.h |  2 +-
 hw/arm/exynos4210.c         | 12 +++++-------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index f58ee0f2686..7da3eddea5f 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -77,7 +77,7 @@
  * one for every non-zero entry in combiner_grp_to_gic_id[].
  * We'll assert in exynos4210_init_board_irqs() if this is wrong.
  */
-#define EXYNOS4210_NUM_SPLITTERS (EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ + 60)
+#define EXYNOS4210_NUM_SPLITTERS (EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ + 54)
 
 typedef struct Exynos4210Irq {
     qemu_irq int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 962d6d0ac2a..39e334e0773 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -231,7 +231,7 @@ combiner_grp_to_gic_id[64 - EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] = {
     /* int combiner group 34 */
     { EXT_GIC_ID_ONENAND_AUDI, EXT_GIC_ID_NFC },
     /* int combiner group 35 */
-    { 0, 0, 0, EXT_GIC_ID_MCT_L1, EXT_GIC_ID_MCT_G0, EXT_GIC_ID_MCT_G1 },
+    { 0, 0, 0, EXT_GIC_ID_MCT_L1 },
     /* int combiner group 36 */
     { EXT_GIC_ID_MIXER },
     /* int combiner group 37 */
@@ -240,11 +240,11 @@ combiner_grp_to_gic_id[64 - EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] = {
     /* groups 38-50 */
     { }, { }, { }, { }, { }, { }, { }, { }, { }, { }, { }, { }, { },
     /* int combiner group 51 */
-    { EXT_GIC_ID_MCT_L0, 0, 0, 0, EXT_GIC_ID_MCT_G0, EXT_GIC_ID_MCT_G1 },
+    { EXT_GIC_ID_MCT_L0 },
     /* group 52 */
     { },
     /* int combiner group 53 */
-    { EXT_GIC_ID_WDT, 0, 0, 0, EXT_GIC_ID_MCT_G0, EXT_GIC_ID_MCT_G1 },
+    { EXT_GIC_ID_WDT },
     /* groups 54-63 */
     { }, { }, { }, { }, { }, { }, { }, { }, { }, { }
 };
@@ -268,13 +268,11 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
 
     for (n = 0; n < EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ; n++) {
         irq_id = 0;
-        if (n == EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 4) ||
-                n == EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 4)) {
+        if (n == EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 4)) {
             /* MCT_G0 is passed to External GIC */
             irq_id = EXT_GIC_ID_MCT_G0;
         }
-        if (n == EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 5) ||
-                n == EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 5)) {
+        if (n == EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 5)) {
             /* MCT_G1 is passed to External and GIC */
             irq_id = EXT_GIC_ID_MCT_G1;
         }
-- 
2.25.1

