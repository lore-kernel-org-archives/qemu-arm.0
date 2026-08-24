Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E04C5DF94
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 10:30:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyRuv-00038L-Oe; Mon, 24 Aug 2026 06:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wyRuc-00033q-AZ
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 06:28:18 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wyRua-0001qA-A3
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 06:28:17 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4956869750eso18619945e9.2
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 03:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787567294; x=1788172094; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=aQngANFmgRclvGCJWhrJN0pPqpqgEwxPZ5cj+oiSFi0=;
 b=bgm/NRjY+/0TABiyVSpsW6K52jUXhd584aa7tHW9lblCUFMhTj9L0VyPKtpV5e0AFD
 igEw/0mREjlr+vPO319Vc+quERylWqjlfR0iN6GAUo/eymbpk7CtQUDy/VkH8LopqwWc
 qh4vnuPv8eWFG3UfNRjtP1tGKyEO+1qjG1vWd3dgGB42TrcH76ngCeQn3sIzqRT74+eS
 gZN1WwydyGGxQrTPQNrrdFE+pwQDcVd4HVCWTjQgWihF11ffSI2LfrP0hfs4d1g7jJM2
 Hp5Ar2wyL+kAIfHDL1Qc0dBTjtJ+HMBjgGGF4PsCTEmb54TOOQy3VqJ3zLmpV5Vnfdcv
 aUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787567294; x=1788172094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=aQngANFmgRclvGCJWhrJN0pPqpqgEwxPZ5cj+oiSFi0=;
 b=Ij0t8/+xlpOjU3WIigWM9y2+2erqA17/5bPVyOJyZGKMtQsK3lUHf9ApDS45JCwH/R
 cyVNOOOto2f5EXBaSHkb9/WcI6SIgw4zPSUpdAhsS8Ts03t20GO/2hNA4r0t8Y3F3NHW
 UjehN5KQ9c2GwxsEndQ2HPkh50E0GUVF7MyhGN2G9WGAmV6f5KWjzXG88vNQu6dLaX++
 hpgXkzDDUtbq/FZ4yuHho/ByOIX2H0YV82+Lxnm0xNbrdJSLaP9g0FzXndwyFiSypjQM
 H1sLVfXPwCOgTns9lFbm6fhGQT0badLsoxLCkQA48HgXuwpZRt61RmXfarLbuV5fleUM
 4jLA==
X-Gm-Message-State: AFuF++kLLshGrHVyl3CQtiPXx7WO0HuDKZb7RO3Bb+A3DQF/JGCh3iAG
 /1BjvZtPD+zPVry+fozccnYZyHanDxBS1vQRujB/KCNLFhwdbMKXWhGnBF8RKOBaQ5a4W6N0Y2v
 TUVW09rc=
X-Gm-Gg: AR+sD12L8VanGMlVjmttRJN+3GVkP0l2ls8jj5R58mEv1eQrr9OOrRYBrq6Of3q9ntL
 zexhmY/nnTouLJcuen/tElQy83BixxjKRVCi7QDBIjTDeKuXbtgLbHlQwj+oxkPmYiqIw0ITTFJ
 hbEnw8UirtbzuQtRcjg/HOfio3/4+Ubgfr04lezUbtuLFmgFzeHZ4yhhEdRVpumOUZ2pnh8K1vh
 21qpxqeQYHJs6KyWH4o9TdppSRd3gHbhPZOsjK3C0CP+x5C9ABEZY1rbLgDw9bc05x8KjllcVj/
 lXLJgFBu0MuglF8yklYPgDffuGw7qEOL1Aej3EIJIruAVpzi1XFkww51bPSAvG5XRllTQMqBkgZ
 ZSpepfsGmxcQZtI7a6FeXyC2E2LGRnoZ1jpklzAzL2ASMJvwPFce0NeVO8R+FcQLko/9oCXO12r
 xRPIc9AxjxlB1LlG6PaLH8LDjO0JRz8800fwP78Uqde2U40UXtaUGGNzaXxdt3HbwwPK3rLqXeT
 NAvIeSJVkDI96qHUNm83IHztGZ6SxKGUrNIP6/+QRKByU3jNCMPd0PM+sfKdN+56mldUw==
X-Received: by 2002:a05:600c:5394:b0:499:516b:83d5 with SMTP id
 5b1f17b1804b1-499c19e9734mr180882725e9.11.1787567294006; 
 Mon, 24 Aug 2026 03:28:14 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499c355e6d1sm77730095e9.6.2026.08.24.03.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 03:28:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/6] hw/intc/arm_gicv5: Use cached IRS_IST_BASER.VALID state
Date: Mon, 24 Aug 2026 11:28:03 +0100
Message-ID: <20260824102805.639072-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824102805.639072-1-peter.maydell@linaro.org>
References: <20260824102805.639072-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

When the guest writes to IRS_IST_BASER we effectively cache the value
of the VALID bit in the GICv5ISTConfig valid field entry.  In a few
places we check whether the IST is valid by doing a bit extract on
the register value; switch those to look at cfg->structure instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 7480c12413b..8ffb2a49020 100644
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


