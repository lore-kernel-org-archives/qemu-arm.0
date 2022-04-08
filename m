Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp400042lfq;
        Fri, 8 Apr 2022 07:39:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEwzEoHVdsnWR5KJYXZ6WCQqrUz+FWHG+vIM1HeHfoxpY/bFUd38vhhE8spD3jReLG+zoB
X-Received: by 2002:a25:ce84:0:b0:63d:cece:fc6c with SMTP id x126-20020a25ce84000000b0063dcecefc6cmr14319881ybe.286.1649428785043;
        Fri, 08 Apr 2022 07:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649428785; cv=none;
        d=google.com; s=arc-20160816;
        b=cDCExWmkwX+CxBSktkggl0yXbifYP4Vcqwk42TwxGOInMV7W/9/nwPaPaT8sdN8Sql
         o1SzjyZxYXT8WzjnUQI5d46sx21R9To/34tzL69e2OBTR2sVjLKj/n9tQ7IOW6oJOTJ7
         P8UAbjmn2tfif32H2CSHDnOT1Rf1KZYU2xmx/PtHMr9cINxSnEL9Ka4ijaiU6d5qh5VB
         njufx0zBSEoPrn/hXXEB732NnQLK8y1Z75b4D1/lS9ygH0yz/LZgIZQxSyxliMVL1SkX
         Unn5Bk5KYbt6vHbDegDkWV6FWaSL44PGVVpFImcHpP0CL4EXJIsNW3U2RUhl5sblNv6k
         1fyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+omF+kOgFeDIOatldLPHb3t7gwzCgkn9rUffahPiAzQ=;
        b=D6iTc6I5xmPkzJxjmiH5rhMBffe+CKS1hQt3aAdNHwv2v6ec9iX6CAF+9Pb85UV+FL
         /+hsQVvcKyuGzIQN4D2iBchyFz11oyYEC9EyW872IQqeoNA0kKLjL9hJB2w18Eqe1Ru4
         nJUE1y1FZWp1Pm/QgTVlDQ1bmIhb3wzPw67MOovHT3eTULJieR5qhkklS+Z3jeAMN0e3
         1/J/vLHKJNmj3+n3kxekMNoO+HC6yjrLy3WLyc18rYYhHal+8hFYPY2maA3UELUXn//P
         oeQ7a2DEC4gDZckmM6h/Qq1JtL+/1yCBBz/ZJVQ/wev4K0Kufu7B/VcTBYf2CtUQX3vO
         4foQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZjSC53qA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s78-20020a252c51000000b006411a46a7b5si100611ybs.633.2022.04.08.07.39.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:39:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZjSC53qA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpm4-00036r-D8
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPW-0007A0-NR
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:26 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPS-0002PG-Jb
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:24 -0400
Received: by mail-wr1-x433.google.com with SMTP id r13so13047748wrr.9
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+omF+kOgFeDIOatldLPHb3t7gwzCgkn9rUffahPiAzQ=;
 b=ZjSC53qAsJbRwlVwtiYBqqzVDMWef3YSZvRGUNnFi5Ez/EcTlROrwYYm1uD/13PQ7y
 V/z3m1TeS/1msYwLnsamLUEd1JV+qhGbpFBxo7snU46cqbXBr2fzWirRN4Y0xJpx9JGX
 Uod0lQwOrAa5J6HvxApH/8sqZNi+QwVKFK6V5RXfQVLuVV2W4OKShZ5KNDdDosvO6XpB
 E4JGyGi3qd6AFfaKmnHGoMkl9OsMJjQd3fT8N7QbExGvuZ344yVH1YMyP+rUgZ9ITsEC
 qzaOcMcMBdpGO8+iIgOap595MPqQZHKYYPv0OGiUudJ8FbI3TNrrQGgTlzpSvooMgYAK
 nRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+omF+kOgFeDIOatldLPHb3t7gwzCgkn9rUffahPiAzQ=;
 b=0TYy1JVoQ1iD4SyzwFfujCdi3ZXzzlfa8zczZqxTYAYg3wLAxExlwqQcpB+CMT46bu
 5eODfGUl1RM2R5dHceanwMv1b/os3KzCEoXL63dctFfgtL42nal0THlGzjezotxYiUW+
 b1LP8QpWp9Qcn9oqH26K0pN+yxmGrVdW3QP/jrWw1eEufHcEF2ePb2XFqUeCmbw7HkaM
 XKXNkuNslvv6I0OQjipbk8WWQ1LHI7Iux1oLcc6zJ8HCNwXfivu0N2El4FRBZpr2+NCZ
 thv4smqzwNT+Lgu7lJeWgomWXy/HrURem2JFAWL65/k3zJQpyDU/jTTA+01xqoV/uddN
 /70g==
X-Gm-Message-State: AOAM530CgaG/OagnzKlED0OH9me6J5cA94C9WLjOzHze41n9qKTo9MPc
 kw7/M2LPogaszSiDERG8H37ATA==
X-Received: by 2002:a5d:53c8:0:b0:206:1c8e:2a4b with SMTP id
 a8-20020a5d53c8000000b002061c8e2a4bmr14517171wrw.370.1649427381168; 
 Fri, 08 Apr 2022 07:16:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 30/41] hw/intc/arm_gicv3_redist: Factor out "update bit in
 pending table" code
Date: Fri,  8 Apr 2022 15:15:39 +0100
Message-Id: <20220408141550.1271295-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7FT4nA/qjLSv

Factor out the code which sets a single bit in an LPI pending table.
We're going to need this for handling vLPI tables, not just the
physical LPI table.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_redist.c | 49 +++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index bfdde36a206..64e5d96ac36 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -145,6 +145,34 @@ static void update_for_all_lpis(GICv3CPUState *cs, uint64_t ptbase,
     }
 }
 
+/**
+ * set_lpi_pending_bit: Set or clear pending bit for an LPI
+ *
+ * @cs: GICv3CPUState
+ * @ptbase: physical address of LPI Pending table
+ * @irq: LPI to change pending state for
+ * @level: 0 to clear pending state, 1 to set
+ *
+ * Returns true if we needed to do something, false if the pending bit
+ * was already at @level.
+ */
+static bool set_pending_table_bit(GICv3CPUState *cs, uint64_t ptbase,
+                                  int irq, int level)
+{
+    AddressSpace *as = &cs->gic->dma_as;
+    uint64_t addr = ptbase + irq / 8;
+    uint8_t pend;
+
+    address_space_read(as, addr, MEMTXATTRS_UNSPECIFIED, &pend, 1);
+    if (extract32(pend, irq % 8, 1) == level) {
+        /* Bit already at requested state, no action required */
+        return false;
+    }
+    pend = deposit32(pend, irq % 8, 1, level ? 1 : 0);
+    address_space_write(as, addr, MEMTXATTRS_UNSPECIFIED, &pend, 1);
+    return true;
+}
+
 static uint8_t gicr_read_ipriorityr(GICv3CPUState *cs, MemTxAttrs attrs,
                                     int irq)
 {
@@ -809,30 +837,13 @@ void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level)
      * This function updates the pending bit in lpi pending table for
      * the irq being activated or deactivated.
      */
-    AddressSpace *as = &cs->gic->dma_as;
     uint64_t lpipt_baddr;
-    bool ispend = false;
-    uint8_t pend;
 
-    /*
-     * get the bit value corresponding to this irq in the
-     * lpi pending table
-     */
     lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
-
-    address_space_read(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
-                       MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
-
-    ispend = extract32(pend, irq % 8, 1);
-
-    /* no change in the value of pending bit, return */
-    if (ispend == level) {
+    if (!set_pending_table_bit(cs, lpipt_baddr, irq, level)) {
+        /* no change in the value of pending bit, return */
         return;
     }
-    pend = deposit32(pend, irq % 8, 1, level ? 1 : 0);
-
-    address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
-                        MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
 
     /*
      * check if this LPI is better than the current hpplpi, if yes
-- 
2.25.1

