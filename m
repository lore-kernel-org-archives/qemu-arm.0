Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FB7C88E6E
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 16:08:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x697Q-0003r1-G6; Mon, 14 Sep 2026 12:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x696d-00039b-DE
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 12:00:31 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x696b-0004d9-5V
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 12:00:30 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f633cd80so950949f8f.2
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 09:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789401627; x=1790006427; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=krib+ep6Ku4rcBL3FL/xOeC0nOLV1cZ4Dzi0yim0mVw=;
 b=T7CyLvJOJ0ZJ4wP+Z9U7AdJFbxwYR6z0VFeAn0UoviXhH0MZ1Zw1enJkp/AzK3mKju
 LgFnKj5SHLNZiKosDOqCsHUBXR0muqtQLDQ2pgBb8j/tdu5VNKe759dbshIwQpWF4/FN
 blDDOwiY778DHTwcXAsni1hJP6sJVbozox6ENHWuwCm1JXDD0nqVH8GoKoD/+yGgjf6H
 Y2gMvEUa4qT2VgnQSqNydAb3qyGnN8uBRJGHHF7DHlQ9a0s0jsBSBDg06mv/PTJUuFYM
 wXoQllK70d5PU66ylMKBSZJfOC4xvpxygQKki50Km0YCUt7e2UAxY1stmjkkF3xH8hbL
 FuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789401627; x=1790006427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=krib+ep6Ku4rcBL3FL/xOeC0nOLV1cZ4Dzi0yim0mVw=;
 b=R0OxXJl0Uz0Sb9ln4rb4i8tj4ktaxgCmlvhBXf8TR7Jiz0Rsaxf6UEMruCkICnAD4y
 FAgQHrCY6lbVabeyS8I2ASemJvEv2KgRJz07u5AchbBP7DtaY15AJZ3V8ssJga7E1aRA
 uYxIS0KDQeusp6axffFpoRjXh2fbKlJ/gzvG1r9sE3MndMJuKjablQ0pa1mClwHJ9WC3
 DHUntoszqtPsNgtIS3gmle6Ev13hc5xD9OnZ8Ai33HAKEdEssuz0ph751wYYpeR2dmKs
 ldl6CHIgHtYNw6oFKutzftkfu2PVHCgmCp6C2KZux+CPUfrpC8haZegVFgIfbHjftJRB
 /t5g==
X-Gm-Message-State: AFuF++mN4bkzJ+5V1+3ttFI5YsndkfKF/1UkL6XKINI3FqnysLKGvm6E
 m0wsdoSJENcj7tyeke6eEV69xjjHrnC4pDtnopj/f1nCJTliDamOUO0MQCA9g4hqKtA6t9FBh+s
 NxSTBj88=
X-Gm-Gg: AYBFou2qZ4pXqiaHvkKynbnYmZtuszM+6oDgUO9uYMTxIo43Tq2sBX07lLPnqI9ybo6
 XCUXalCb/ytZ/hVfVz7xusowtdO+OHJAWF4+Ysfq5CdC3r0wP2KgJr+mCEhRTFQaCKzbu+Aa3q4
 W5J0ljmuBaj3YZx8xRzNoB/yF5efD6M/duynB+jJV6NV+5mFEyrFHZgOntobyKd55eGdb/Tpr/T
 ydPlB2kECDUicfTMHcDye8njoPMXNJEVHf3zW0TRjTp/uydm3jXPrPNe/C6tJ8OKxEVUnIS3P1k
 Prw82ywe7Obn/Ukv8ZKbvUkThB70YtQu5AwthpedgONi/GErS12j12cQvNxenZe8Fr8OP6pV9Oy
 CTxnB33Uxevyd112mnqU6HBaAYd0yxls94S2m1PKc8UYdqztggh/d37vyBGKbPnC1coHZhM1qZ6
 sSL1k62SOtWDT4pLZNL6yqqJjFnGlO+9STpBpQw5vE56Dg5Taiv6bzPjLQGPzLaFIscsWPC6Ech
 D5/yPu6TYZPqIaNwpZLwNCdxkY+aaO3OPuLuwAsneCrw/fxY6g/Hm9YSbhecEwldg==
X-Received: by 2002:a05:6000:25f4:b0:486:f9ea:796f with SMTP id
 ffacd0b85a97d-48702b5b1efmr4142989f8f.41.1789401627045; 
 Mon, 14 Sep 2026 09:00:27 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb350686sm30797695f8f.27.2026.09.14.09.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 09:00:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] hw/intc/arm_gicv5: Use cached IRS_IST_BASER.VALID state
Date: Mon, 14 Sep 2026 17:00:15 +0100
Message-ID: <20260914160020.327787-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914160020.327787-1-peter.maydell@linaro.org>
References: <20260914160020.327787-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr2-x10.google.com
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

When the guest writes to IRS_IST_BASER we effectively cache the value
of the VALID bit in the GICv5ISTConfig valid field entry.  In a few
places we check whether the IST is valid by doing a bit extract on
the register value; switch those to look at cfg->structure instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index e477c805b43..c6914f7310c 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1223,8 +1223,7 @@ static void irs_map_l2_istr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
     uint64_t l1_iste;
     MemTxResult res;
 
-    if (!FIELD_EX64(cs->irs_ist_baser[domain], IRS_IST_BASER, VALID) ||
-        !cfg->structure) {
+    if (!cfg->valid || !cfg->structure) {
         /* WI if no IST set up or it is not 2-level */
         return;
     }
@@ -1294,7 +1293,7 @@ static void irs_ist_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
 {
     GICv5Common *cs = ARM_GICV5_COMMON(s);
 
-    if (FIELD_EX64(cs->irs_ist_baser[domain], IRS_IST_BASER, VALID)) {
+    if (s->phys_lpi_config[domain].valid) {
         /* If VALID is set, ADDR is RO and we can only update VALID */
         bool valid = FIELD_EX64(value, IRS_IST_BASER, VALID);
         if (valid) {
@@ -1604,7 +1603,7 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
                             deposit64(cs->irs_ist_baser[domain], 32, 32, data));
         return true;
     case A_IRS_IST_CFGR:
-        if (FIELD_EX64(cs->irs_ist_baser[domain], IRS_IST_BASER, VALID)) {
+        if (s->phys_lpi_config[domain].valid) {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "guest tried to write IRS_IST_CFGR for %s config frame "
                           "while IST_BASER.VALID set\n", domain_name[domain]);
-- 
2.43.0


