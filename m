Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901FDCC6B10
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:49:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY6A-0003aR-9u; Tue, 13 Oct 2026 04:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4B-0000Lt-At
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:59 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY49-00086j-96
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:59 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a018dc1f98so21198585e9.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880856; x=1792485656; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=ssQOKL4yIVf/4dvvQm7DObQY0a7iM7G4sOvZS6fl620=;
 b=IgQZtzhque9JHBcSC8AyxFUfkDXgrZyskzAFdOTkqLVvcmJbUPG12HCQcNtSVsuEhH
 tT53uPllwb7uhhTb/5vVmLmLXkv4sHevccBHHWXByVvCWabyQkHsEFVPoU52nsT1Sy4H
 UuVazVw4Qup2lv/LQXWAQ3fY5Crba5RX2KT+WJo2EyZgIHielt6FG5WOJ7MxGXNeKfZ3
 xBa8HK8RK7G3aeMVzs4rEk/Y+T5p7aB25uMvWW5bAxUWdf0CL5fiFxlAyA/ikvui+X2B
 fkeSMMFPxo/+/K2D+1KWAcLXJcmzoJZsiVcN6+FBwfTz6P3rq/YwaPhxqoyOwxPaPREp
 gwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880856; x=1792485656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=ssQOKL4yIVf/4dvvQm7DObQY0a7iM7G4sOvZS6fl620=;
 b=EtrDlNjBeVDwF/rEoubMW3nqJHvCSxTJs6xgfXXlbPZkC1DN6hTKqiH0ZNpPsgeqXQ
 NgLMichS/0A9cBFJnMdmhzTYaEO2VLMeGPsDLDI0/OukCLn6pqF1THPt4SCOpiQEVkhR
 ZhQZla9rixQMhqoyTqPBIW2l1QFtNsmJLBSszXouAIhvbeSzfrBXDzELj9rOOdx8rsg4
 wILtvSXxscXt4ctayyNK4uDc32w2kv10B6a0j17gn/O4Q7ocYWoTYu7yjfjivNbfVyE4
 usRGEY9HVV/mVMJnwEO1KZofRGicoO9F4fSgFZjDLX0TOpiJLhyLn6eOM5luUU5GzPOd
 cDkQ==
X-Gm-Message-State: AFq9FYJYJN1aG5hw2NL9bUQmIQIDOblK7exgVq4dMXg7x1FDk1r0b1lF
 LHZziNehC0OxHA7rP/6Pf+sbo63vRfNJQu31HoZWjB3Dc1kpvpR7hfwseUBfJbkt9tK7vHYy0DV
 jtCUbeW4=
X-Gm-Gg: AYBFou0Wt/nCfBEavNDt8kFRTKL3LkDv7Dj9C08U0ElaWP00wfS23qJFq8Etk62RYyP
 nf55plEWYqypZhLE8xWhIYU14s6CKIBvK2BI0KRd6tmI3zlvGqIAuS4F8imrjX75I+GPuUfsUM7
 nMnHAJETjTgdEZ61V5xb9zHVh09gqpFZ+os7GICv3iPfXiDZoOBy/7zJWEstBIod3FFrXSZHVRw
 g98/X5sIWbJeUyKpHadnUvzKehcsoOYkOXH7MlqkJFXqje4nHbT73np1mAEIKIeXl9qudgYuZO+
 gjj9ew2zWy1ImKTorf5m7RlCg98Ompl9y5z5M2hVZofa67OZTaG5PWAjKeXLOd0rKnHLftAtIIF
 eFZzGo745YGo04Aw6Y2VkkgKrir8TJT8NUMqU/kfxA4ilo+8x7J2h4sHivWF06U7G6HMmUSDA35
 HBah4v5bzX5C8fQ53MPFh34ijtcgjhelv6qumJw057JS1i3krSGv5+swxPrvo9cL7vwNrvbPCep
 GjFRr6//ktNssCqbDy2ysX8ZMcrM7qxGcPWsPA08y/JT1Z14UxP32Uor5SKUz+GlaUHe4ykZXJO
 6VQ=
X-Received: by 2002:a05:600c:4e8a:b0:4a1:78dd:dd28 with SMTP id
 5b1f17b1804b1-4a18e4d2b31mr235366395e9.27.1791880855762; 
 Tue, 13 Oct 2026 01:40:55 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 61/86] hw/intc/arm_gicv5: Factor out "make an L2 IST valid"
 function
Date: Tue, 13 Oct 2026 09:39:08 +0100
Message-ID: <20261013083933.1024405-62-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

irs_map_l2_istr_write() makes the L2 IST for a specified interrupt
valid by finding the L1 ISTE and setting its valid bit. For
virtualization, we want to do something similar for the ISTs
used for virtual LPIs and SPIs. Factor out the "do the work"
part of the function from the specifics of the IRS_MAP_L2_ISTR
register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 1d6f2767d02..3fac52012b1 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1096,11 +1096,8 @@ static void initialize_ist_config(GICv5Common *cs, GICv5Domain domain,
     cfg->valid = true;
 }
 
-static void irs_map_l2_istr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
+static void map_l2_istr(GICv5Common *cs, GICv5ISTConfig *cfg, uint32_t intid)
 {
-    GICv5Common *cs = ARM_GICV5_COMMON(s);
-    GICv5ISTConfig *cfg = &s->phys_lpi_config[domain];
-    uint32_t intid = FIELD_EX32(value, IRS_MAP_L2_ISTR, ID);
     hwaddr l1_addr;
     uint64_t l1_iste;
     MemTxResult res;
@@ -1138,6 +1135,15 @@ txfail:
                   "physical address 0x" HWADDR_FMT_plx "\n", intid, l1_addr);
 }
 
+static void irs_map_l2_istr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
+{
+    GICv5Common *cs = ARM_GICV5_COMMON(s);
+    GICv5ISTConfig *cfg = &s->phys_lpi_config[domain];
+    uint32_t intid = FIELD_EX32(value, IRS_MAP_L2_ISTR, ID);
+
+    map_l2_istr(cs, cfg, intid);
+}
+
 bool gicv5_set_resident(GICv5Common *cs, GICv5Domain domain, bool valid,
                         uint32_t vpeid, bool db, uint8_t dbpm, uint32_t vmid,
                         uint32_t cpuidx)
-- 
2.43.0


