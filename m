Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17087606A329
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Nov 2026 17:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BMfVCHDH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOIHJ-00009Z-1x; Tue, 03 Nov 2026 12:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOIH9-000069-85
 for qemu-arm@nongnu.org; Tue, 03 Nov 2026 12:26:23 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOIH6-0006Q0-Lt
 for qemu-arm@nongnu.org; Tue, 03 Nov 2026 12:26:22 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a218c463d1so30157045e9.0
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2026 09:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793726779; x=1794331579; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=t7evk/PGY2aqSKb/cWcU+O9P2cepKPm4a8WtSjNhe3M=;
 b=BMfVCHDHBfzsYBaPF142daHbpW3/U9C2ixwwymmhrcDRI8A/jEPH/LZk6RiVRmDWEk
 MkTmn/8gm7J/MPZ7K/P5WWPkwqD8absx9S36kzubZ6GfSI2vNLDuR5yTZqoAOkg5Xp3d
 pu4QHy/jt4T6oOdmp+Ai4K0IA2oV0sNmCBwSCmE/cPU/q0ETKxVY7yVZZLzSefpl+rcW
 RIqEOByukU+FH4SO7pAFVohi7zDEPLc4E8L6p//XsGacbEYdfSl6UGYoL/y8WVgTI08N
 ejcZYP5glJJqIBuOVnSYIOz4e7mJLxng05QpLwwu0NZFw8RB2cyMw2ZCFD5z/3fc5HOk
 Cafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793726779; x=1794331579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=t7evk/PGY2aqSKb/cWcU+O9P2cepKPm4a8WtSjNhe3M=;
 b=lIVvD6q2lrKxxPtT4RmJKg4q4hCyZYPJbF8uGMXYliYqoCUSLJ7H2kTojiRTI8tAWU
 zO4yC6nvkfktV1xQo9rqHnLXfub8532C3rN5BfVX1dXKYhDh9b7IlB8m3pP/9/vxz+QY
 7rbNOAChScV85TRP9pETwe4eB33JeRWyTypbHtoedl2Hqf1gqRV8lqBu71B57jYAYj2B
 Eha8q6w5nbpc4Gz0X3B+yhjoKtyODFfzAAAVtfNFXM3RJFY57mveacKWqtL2sk6QETQB
 JsKlzxgD/IDzngT+/zOOSCj+OKtoSetCAskZrhDk3cHySsojer22Y4I/tPr7I7KlIgYR
 A4MQ==
X-Gm-Message-State: APuU4Z8K/3cnxMHjdaSfUOcKG5kAvjaE7zuJpWFB/BxisW82ZnHsQ98w
 h0xz4Rr9wRJM3aFXdvqZDdgez8V7FksWMaRIOGPWaDlTG+B5KIc2dVtG+U0CUZENClK94CP8Wjw
 4/PzXZys=
X-Gm-Gg: AYBFou3SghNW8+TBlWAOXAkp2etCjri4hM/Pz/YnScn7bUdjDCCRUhT8AJqulV3uq29
 LpN+7WkQVipf8B4f80qI6orrph1xzAw9Y5Qn1EIu8kG3UugdKn7XgpEmMg/0orJ/6H46tRYeaqR
 tXDyR4zrZHMmOkAlH01DMiwsonNgMmE7E8AdUOGDj3mnepIRfRQJnIjdc8ShnHfTpkauUd5+2wd
 jQOaiiYzyYNh0ugvJAwYxs5mr0QTTlDYidHsph/hoDIqC1qQJZkq/hbbBIeSMj2VbhZhtSfgeZn
 K4RAbjQESuAA9kzMmibbOczpCbmnofIe86dBZt7a0lPstZbBu00pTtChIooXD0sLd+4AZjmcvdj
 qwomtyVOmFbwI2Q+QD2LH6XTSiQEAMeV82Ur3dtDyEUlCUdgeRYa7dfnRrHhcA4vVRmzmIIDdB2
 Zv4aOTzwMwg4eAbXxgOysMhSKZBZ1jthCbf/WSsDWSqPVauhKXTUtt5u0L362XFrxc/vCEP+nI8
 RSRS7X+EGYjcDmTfSmIGspO8HQrVL2MIiheX0+VhZ1NLpqBi5duWkQ9QDg2sU2LRfplY75FPDmB
 7CBaZ8jF060cmfaWGQdC0jxaPkaZpILXQH3RM4ynVwef/x60aXpM37t/yVt2CTdQuL83ucYGzvn
 mV+aOn7pFl0xpDV00ckKR23CpfwRQKwzLjQ==
X-Received: by 2002:a05:600c:a11b:b0:4b2:3c81:d1 with SMTP id
 5b1f17b1804b1-4b23c810353mr76095235e9.5.1793726779360; 
 Tue, 03 Nov 2026 09:26:19 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac0950d533sm211082605e9.3.2026.11.03.09.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 09:26:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-11.2 1/4] hw/intc/arm_gicv5: Use cached
 IRS_IST_BASER.VALID state
Date: Tue,  3 Nov 2026 17:26:13 +0000
Message-ID: <20261103172616.2400758-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103172616.2400758-1-peter.maydell@linaro.org>
References: <20261103172616.2400758-1-peter.maydell@linaro.org>
X-Archived-By: <archiver.kernel.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the guest writes to IRS_IST_BASER we effectively cache the value
of the VALID bit in the GICv5ISTConfig valid field entry.  In a few
places we check whether the IST is valid by doing a bit extract on
the register value; switch those to look at cfg->structure instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 5d0a50ab6aa..d0a8574916b 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1222,8 +1222,7 @@ static void irs_map_l2_istr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
     uint64_t l1_iste;
     MemTxResult res;
 
-    if (!FIELD_EX64(cs->irs_ist_baser[domain], IRS_IST_BASER, VALID) ||
-        !cfg->structure) {
+    if (!cfg->valid || !cfg->structure) {
         /* WI if no IST set up or it is not 2-level */
         return;
     }
@@ -1293,7 +1292,7 @@ static void irs_ist_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
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


