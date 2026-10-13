Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F7FCC6B08
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:48:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY8k-0008LS-2u; Tue, 13 Oct 2026 04:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4Q-00016j-3V
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:14 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4N-0008Es-DA
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:13 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a1688d7769so22528995e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880870; x=1792485670; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=/MPD1vW8lp0kAxOSWh/UtStGkkrI/a03RZQPymBCy+4=;
 b=actH3kyTyQKYEJ+wsipulIB/diBA4edL2hJO9wsuwzOuSGMdCBzLEA9idHv8DKwWPE
 Mu4246fIxWSoqTUDYnHPfcJqNA7HNWFs6jXL8yYNKjNLjqfad8EI9G2CEibkkb7nlF9u
 pduXqVz6y1sX7e1U0CLM1wWcBVJeRCI/Xx86abhQenYRtdUXRS4j9jd+wLjc1lGoXqGX
 Pf4scRMnO2OcxlojIrQsqeuHyfKsueqmWJ4clflreXhPdAyZvWJAaEU3l6Tmd5RLvP47
 0Phg2qWe56WhN9cV3QuliHKVdrnkkGDMzE7P+z5/l7dyXwEbBbeuQ4MFIc3Jt/UVCfq9
 YqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880870; x=1792485670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=/MPD1vW8lp0kAxOSWh/UtStGkkrI/a03RZQPymBCy+4=;
 b=dQvwoNli6MbYh6LFehFANSc8WDaeSIqsPrHW/eXdxFw/uXxAwO3cUg85YlpRhVmEIV
 W2AW+vaKl1Iqy4l2QSh5fY0Rhdvd3upQGBHEay0yp4afYHVSit71gsE9WXFNY0gnA7fj
 cpoZm5OifsSWOSZN76lvGkPSl1uwghFmyEMK3nFslSLdwrYtYJUnY/gDdHvTUD4CjA81
 yCivG8hCCGJP/lPNpagzzputZXbZIK/VATKPUNx/7w4uMf7gfyWwJ8coM9vx6Ix/2ErW
 QI/zkQXcucGfZgjLJ1YIrU7j4QuV08rfnNZTS4pWwfdGSd6OMRsrmWINXPvQLF0lb3XL
 oTbw==
X-Gm-Message-State: AFq9FYJuhUfF/IRxXKuFERV3tdZM9KuK1/7LQzFRYrjzpV2tLnjP92oO
 DiWItK4/pmac4tNuUZ0Rj1g91Xhx2YkpLl6J4PB0bS4X2suEsT4nL62yB9GPQ5WPoriu9bm9Tj6
 SZChSxOc=
X-Gm-Gg: AYBFou2JrpacekV4ppmdeLoEg8jGEzFCj5zmnjp85p/19nk5ujM8+qSviOA2UJrqD/N
 5cdMButQHukrPBpNddeto7iTHc5+xedJfWhS/VSUeHbFds2WkxeqWGCYoMDGnLveeZZ3yJHMjL5
 KpeTNOm+4ILQaJKCAVRDH3w6969+2RQR6VGbnGjkLBgOod9Ox+S7pRqImsK0PXSUoWnvJ8OmllG
 OKSHst6LzKTJvzptPLbJLf7s3EbxOzMtwAuvQOc3B0s39ZjrYyXNZrm5KJ1+z3xrdBnYwH5XKwr
 W40FSaK1o932YN9XmhNbR0NIJCIgpXEoeRAuxhVgPRBM/ETr/4stAFKU19PFw8AFWnC+iS2g+eX
 tB9bgK2PPndHjseviJSdJGb5h4bF7tpsIiF1SMd5z+DilHDF6acdxgYPLtgqoQvNzUOmAgSyGJC
 D6y13XWSmizg4L0HPPR/bvJRCq2OYm8fgx1rALSYKeFJTEWnkhgjj7N+hLeZ18T+JDWLdZ0eUvw
 XOUtEXJV4dQqeedcufjRfXNpO0JdQNxN2eWt7d+acF8ETCdF9PMk4PNItRB8OntB+I471BtdK1l
 ioQ=
X-Received: by 2002:a05:600c:4e43:b0:4a0:1f90:594b with SMTP id
 5b1f17b1804b1-4a18e4b67e1mr211450245e9.22.1791880869818; 
 Tue, 13 Oct 2026 01:41:09 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:41:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 73/86] hw/intc/arm_gicv5: Handle virtual=true in
 gicv5_set_target()
Date: Tue, 13 Oct 2026 09:39:20 +0100
Message-ID: <20261013083933.1024405-74-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Support virtual=true in gicv5_set_target().  This is basically the
same approach as for the other gicv5_set_*() functions, with the
slight wrinkle that we will need to update the vHPPI for both the old
IAFFID and the new one, and that the comments and handling for (lack
of) 1-of-N routing apply equally to virtual interrupts as to physical
ones.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index c07122fe6e4..7c68fd6cc2e 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -644,6 +644,7 @@ DEF_SET_FIELD_FOR_IST(priority, uint8_t, PRIORITY)
 DEF_SET_FIELD_FOR_IST(enabled, bool, ENABLE)
 DEF_SET_FIELD_FOR_IST(handling, bool, HM)
 DEF_SET_FIELD_FOR_IST(pending, bool, PENDING)
+DEF_SET_FIELD_FOR_IST(target, uint32_t, IAFFID)
 
 void gicv5_set_priority(GICv5Common *cs, uint32_t id, uint8_t priority,
                         GICv5Domain domain, GICv5IntType type, bool virtual,
@@ -878,11 +879,6 @@ void gicv5_set_target(GICv5Common *cs, uint32_t id, uint32_t iaffid,
 
     trace_gicv5_set_target(domain_name[domain], inttype_name(type), virtual,
                            id, iaffid, irm);
-    if (virtual) {
-        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_target: tried to set "
-                      "target of a virtual interrupt\n");
-        return;
-    }
     if (irm != GICV5_TARGETED) {
         qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_target: tried to set "
                       "1-of-N routing\n");
@@ -893,24 +889,32 @@ void gicv5_set_target(GICv5Common *cs, uint32_t id, uint32_t iaffid,
          */
     }
 
+    /*
+     * For QEMU we do not implement 1-of-N routing, and so L2_ISTE.IRM
+     * is RES0.  We never read it, and we can skip explicitly writing
+     * it to zero: it's sufficient to update L2_ISTE.IAFFID alone via
+     * set_target_for_ist().
+     */
+
+    if (virtual) {
+        const GICv5ISTConfig *cfg = ist_for_vint(s, cs, domain, type, cpuidx);
+
+        if (!set_target_for_ist(cs, cfg, id, iaffid, &old_iaffid)) {
+            return;
+        }
+        irs_recalc_vhppi(s, s->res_vpe[cpuidx]->vmte, old_iaffid);
+        irs_recalc_vhppi(s, s->res_vpe[cpuidx]->vmte, iaffid);
+        return;
+    }
+
     switch (type) {
     case GICV5_LPI:
     {
         const GICv5ISTConfig *cfg = &s->phys_lpi_config[domain];
-        L2_ISTE_Handle h;
-        uint32_t *l2_iste_p = get_l2_iste(cs, cfg, id, &h);
 
-        if (!l2_iste_p) {
+        if (!set_target_for_ist(cs, cfg, id, iaffid, &old_iaffid)) {
             return;
         }
-        /*
-         * For QEMU we do not implement 1-of-N routing, and so
-         * L2_ISTE.IRM is RES0.  We never read it, and we can skip
-         * explicitly writing it to zero here.
-         */
-        old_iaffid = FIELD_EX32(*l2_iste_p, L2_ISTE, IAFFID);
-        *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, IAFFID, iaffid);
-        put_l2_iste(cs, cfg, &h);
         break;
     }
     case GICV5_SPI:
-- 
2.43.0


