Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77980CC6B08
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:49:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY8a-0007gq-M2; Tue, 13 Oct 2026 04:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4N-0000ss-79
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:11 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4K-0008Dg-E8
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:10 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a1688d7769so22528515e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880867; x=1792485667; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=X1axBU9YVOc4OpWrfbsWGttQLcfYQsseD9BVWGvayPE=;
 b=JbCNEkoDsQmB3y8wkn6GUT2iaZVUDabKb1nrTeB+hm4jQzMFWN6sE9XLs/VKQMLDgx
 JhHu9KkqsSxW4xjPkBleCXE3yk3lC9impc50EARm6qhb4SG29bW3xkgp+1PDKQ6+npEm
 YiuEGfXu4P0jgPzsCAK1a1aKcU18CLkO9Ex/+JGBNQGS+booUr3mFDyQSsTJ11XhV0w+
 ghaOwZVMNYoyyieXMxU0DJCUmMfcw79xuTz1W5bKmarMHECYLZvzPff/hjLQx1oPlolT
 SC36GhGIciyMbFMQ4cR4r7v6IDOAx16geAp9djkuzVewaC8PAHFcjDTrFWz/qLSbdeH1
 lySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880867; x=1792485667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=X1axBU9YVOc4OpWrfbsWGttQLcfYQsseD9BVWGvayPE=;
 b=PYk2U0+fo4keX8A/S/F534omzDHg75SD7bwfcJPkGyBMvax836WQ3qXWgETO9tnhQh
 cXlC+zUeGdjQ6qODTwL3skCdVDVAkYfcjH9xnB3T2h1Dh+3cqdV2ZFKaPR5hw4LgPoxK
 Cx+M3JQnaNebaZ+p+d/+UbX5NXg8fCBx4KNr3K+mj/r0pKqnwORGRcXdsBjAkIaa2GrA
 1Mp0qMOm1KEU9lX8KWRMaLhTperzH/mWe1w/hvlcEcvIM44+0IEd5kbrloz8EG7kLaX8
 AD4UeICBhPwb/4ZpJlmX5LpnEMfh0N0uUT9H908HHCMh6d2GZgkrKm0TRZA9twkzltKt
 iPDA==
X-Gm-Message-State: AFq9FYIuGUeCwvjoz8yUbPAN4oY8CEVe4uzk2WKT6fVqTt7RJpXLgPBz
 7hs8ulRcozH3W78IkxHcTsU62fAKqs+1QvrcxtK4xu2uekRmzq1OiRGfx0tQxxsaAGqmzB7SBua
 gyVVtD74=
X-Gm-Gg: AYBFou1Yxxz2SJenbuT4RJOEHiTpznMWUQ2Q1w4LbNx/4dWNi27qhaTYx/WsXwo2Bd1
 qNSAixBZXwSAbSnfj+mOmfitMhbyCTvjRpZCN99TwIDZzqVlymsTOHDwbYs88vGWt1r8It/qIvO
 wC8YDcASjRSC1+qPbD3PEuHIYGOlxkGq+2MSlZb+7iVI/HzLS0m1xeMbcv6VmSuNJ25n+pzoW4G
 ukiJtOvx9MZoljatHZizbcCcVyy7vNtm8RqWquUizyq2Gv30HK/rqbhfZfKx8t4YCC5h/ijXFPx
 GtVpFRy6QEwAlz+FXnSy6T8zEiFw5VXds1SYdmpXHf/leZPpz3b8dyGVj8ZRa7wkfOw7/cl+QbC
 4RMBV6p/jy5oPSP413H7229ytT1w2/x28TypY7iXgcvH4wcwDkfuoq2TX78N4z/Nsl7a1AkJzDv
 yOCU0cd3yAAUbsQPgIRVrCn/ajhkYg81bhVZFbHB4N+wyeRtMyt+mcbmxCRCctsEtaYk1kqnkJA
 N9Kt5CEM3blwTJkwbYS6XwUgALORh9GYqcaxHOYETMaFilUS9T3E+LG7p4QyH8oQhZbwExODpaJ
 1eA=
X-Received: by 2002:a05:600c:8708:b0:4a1:7b05:3a6d with SMTP id
 5b1f17b1804b1-4a18e49881amr215760495e9.8.1791880866972; 
 Tue, 13 Oct 2026 01:41:06 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:41:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 71/86] hw/intc/arm_gicv5: Handle virtual=true for setting
 enabled, pending, handling
Date: Tue, 13 Oct 2026 09:39:18 +0100
Message-ID: <20261013083933.1024405-72-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Add virtual=true support to gicv5_set_enabled() and
gicv5_set_handling(), in the same way we already did for
gicv5_set_priority().

Note that changing the handling mode doesn't affect interrupt
prioritization, so we don't need to recalculate the vHPPI for that.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index e460d7957fb..1bb649cf4f1 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -641,6 +641,8 @@ static const GICv5ISTConfig *ist_for_vint(GICv5 *s,
     }
 
 DEF_SET_FIELD_FOR_IST(priority, uint8_t, PRIORITY)
+DEF_SET_FIELD_FOR_IST(enabled, bool, ENABLE)
+DEF_SET_FIELD_FOR_IST(handling, bool, HM)
 
 void gicv5_set_priority(GICv5Common *cs, uint32_t id, uint8_t priority,
                         GICv5Domain domain, GICv5IntType type, bool virtual,
@@ -707,8 +709,12 @@ void gicv5_set_enabled(GICv5Common *cs, uint32_t id, bool enabled,
     trace_gicv5_set_enabled(domain_name[domain], inttype_name(type), virtual,
                             id, enabled);
     if (virtual) {
-        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_enabled: tried to set "
-                      "enable state of a virtual interrupt\n");
+        const GICv5ISTConfig *cfg = ist_for_vint(s, cs, domain, type, cpuidx);
+
+        if (!set_enabled_for_ist(cs, cfg, id, enabled, &iaffid)) {
+            return;
+        }
+        irs_recalc_vhppi(s, s->res_vpe[cpuidx]->vmte, iaffid);
         return;
     }
 
@@ -716,15 +722,10 @@ void gicv5_set_enabled(GICv5Common *cs, uint32_t id, bool enabled,
     case GICV5_LPI:
     {
         const GICv5ISTConfig *cfg = &s->phys_lpi_config[domain];
-        L2_ISTE_Handle h;
-        uint32_t *l2_iste_p = get_l2_iste(cs, cfg, id, &h);
 
-        if (!l2_iste_p) {
+        if (!set_enabled_for_ist(cs, cfg, id, enabled, &iaffid)) {
             return;
         }
-        *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, ENABLE, enabled);
-        iaffid = FIELD_EX32(*l2_iste_p, L2_ISTE, IAFFID);
-        put_l2_iste(cs, cfg, &h);
         break;
     }
     case GICV5_SPI:
@@ -812,8 +813,11 @@ void gicv5_set_handling(GICv5Common *cs, uint32_t id,
     trace_gicv5_set_handling(domain_name[domain], inttype_name(type), virtual,
                             id, handling);
     if (virtual) {
-        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_handling: tried to set "
-                      "handling mode of a virtual interrupt\n");
+        const GICv5ISTConfig *cfg = ist_for_vint(s, cs, domain, type, cpuidx);
+
+        if (!set_handling_for_ist(cs, cfg, id, handling, NULL)) {
+            return;
+        }
         return;
     }
 
@@ -821,14 +825,10 @@ void gicv5_set_handling(GICv5Common *cs, uint32_t id,
     case GICV5_LPI:
     {
         const GICv5ISTConfig *cfg = &s->phys_lpi_config[domain];
-        L2_ISTE_Handle h;
-        uint32_t *l2_iste_p = get_l2_iste(cs, cfg, id, &h);
 
-        if (!l2_iste_p) {
+        if (!set_handling_for_ist(cs, cfg, id, handling, NULL)) {
             return;
         }
-        *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, HM, handling);
-        put_l2_iste(cs, cfg, &h);
         break;
     }
     case GICV5_SPI:
-- 
2.43.0


