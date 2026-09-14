Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E6CC88E72
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 16:01:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x696e-0003BB-5i; Mon, 14 Sep 2026 12:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x696a-000319-Ah
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 12:00:28 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x696X-0004cR-Tx
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 12:00:27 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4843e397f74so2089130f8f.1
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 09:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789401624; x=1790006424; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=QaixVAXZvjT9gFneZWDufUXIFchBE7kGOyICDN3WKug=;
 b=fDHirERLWMczUt2p+ioRbtrG3QWTF98y2LeTo4TTmMcm6hsgL+61hd+30L1GRvEQHt
 T08CntykEl7gMcDYpaTy2LCxVDuPJgxxhp6wWPwrWZvE8qYKuoZA7jzz0cIY/Pi/xOJR
 +tc/geF8buCjNPwHy3AE1HscbdOfkcCfNuMQG3ocYJz8UOKi+OyfZpN6KRcMcNugbvsq
 c0kWZHszrUY5XgQycxGglTIxBJyb80M77Wo7Ok8sY7HIrb4I7ubVwgs07psC0HckQ/qc
 QV1/JDHR63yu7ppYzsZ3owzWJwTqBkSaOAT+azKcf1vysleH0PCg3hrase2DU7PiV9DQ
 WReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789401624; x=1790006424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=QaixVAXZvjT9gFneZWDufUXIFchBE7kGOyICDN3WKug=;
 b=QnS3Lb+z6J1Xhrss9Hg3J72xIhE2T3pnYqMuNOxyQdP/t/wDeLmflZN6qj18esZu8F
 /GxdgCT1Wvt0TN4G7teuLPJ91XRNnhI5Gzc3K1vxK6JE/53p0qZgO595FhoOGLc3whhC
 HGGWnC7MncVCIIarTtg+/l0/iFaQCf83RBTPDfr9MGyF2B/1jkmRCYxGax0nrO39HC/k
 9bo2TuNZyQbkNHxGRNwDCyB24N1cm9iy5Vd1G8nTjrCljE/Gafp+4yghZ1uaF3nQefeI
 uWHvCj9MzUIZUG7y2RdpgulPsgSCA5mo+LQwWsipfuJ6+0k1mnhrJTsM7gR5Ip3NLETt
 17lQ==
X-Gm-Message-State: AFuF++lSICBO2wmZLxrJj4mBDyLzm4WMnnxN58vf+SlhwsNpHCrgsGAl
 inTRa5+wGzHNO5cuS+3ywLjuCptUbyZzfJzqMfuzc7zfz0NY/lJYMNVjaC+JL2OOT9EZwzolw9o
 pfIXK9nA=
X-Gm-Gg: AYBFou2DU7Yr/FxAocLAbBfunNbiEVSaXP3ru4jjKAZLASCnrQZVdc/O9qs6MTWwaJM
 BHNnKV17mcPcAfqrbCFCXTMxL2T/pYmryi8CJttRDCKJbvVbIfZJB4b9Jy1m414jjsr8aHCu68n
 lxy6yRWZ4vwJiwDGwoSwW/leCeC2iQcB4oOOg97408IdYxdBXBH8xcVs+21ZvNeLRhsbNU+R+rT
 chMq35V2+lzo7FLxigGytvveYdw3J+D4qh5rxH6dV3y7XcapA11992+2w8okkupN4e8UhYqkbUN
 5CaR1B+P9V5mp/fqiGgWA5Uk/0q61hB7zvvcal9Grm0moIDTcQ+pYN+h4cGue3XcF7+HBOlUziS
 n0ILv3IZxabcDmGsxybV3+HKuVJssKGibyVdMkWiMIiVpzE7uudtAvdMbLkl289AK+JHJ/7QKkH
 361DhjJx8mqp/fcKDu1orsMZBZ4KwUyQykq6BMECo4vFUrSWewrGnPDqXoliDL06jyRZgoQxCXP
 RIuYA30XbVqMF/kqYnF3BjCQZgDezwvMEXv7DM91F1f0oC3BZ/tbZGjsqmBaSgr2Ag6F9A34rf2
 UMRJ
X-Received: by 2002:adf:e186:0:b0:486:fde2:7d32 with SMTP id
 ffacd0b85a97d-487057fb3c4mr155002f8f.0.1789401624302; 
 Mon, 14 Sep 2026 09:00:24 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb350686sm30797695f8f.27.2026.09.14.09.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 09:00:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/9] hw/intc/arm_gicv5: Ignore low bits in L1_ISTE.L2_ADDR
Date: Mon, 14 Sep 2026 17:00:13 +0100
Message-ID: <20260914160020.327787-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914160020.327787-1-peter.maydell@linaro.org>
References: <20260914160020.327787-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

The GICv5 spec defines that an L2 IST is always aligned to its size,
by stating that bits [N:0] of the address are 0 where
    N = 11 + (2 * L2SZ)

We were missing this check, and only aligning by applying
R_L1_ISTE_L2_ADDR_MASK, so we would only enforce 4K alignment even if
the L2 IST was 16K or 64K.

Add the missing masking of low bits.  We already needed to calculate
the number of bits needed to index each byte in the L2 table, so add
it to the GICv5ISTConfig to save having to re-calculate it later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c         | 6 ++++++
 include/hw/intc/arm_gicv5.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 34c3ee90d43..124816d864c 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -595,6 +595,11 @@ static bool get_l2_iste_addr(GICv5Common *cs, const GICv5ISTConfig *cfg,
             return false;
         }
         l2_base = l1_iste & R_L1_ISTE_L2_ADDR_MASK;
+        /*
+         * The effective base address of the L2 table is always
+         * aligned to the size of the L2 table.
+         */
+        l2_base &= ~MAKE_64BIT_MASK(0, cfg->l2bits);
         id = extract32(id, 0, cfg->l2_idx_bits);
     } else {
         /* 1-level table */
@@ -1358,6 +1363,7 @@ static void irs_ist_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
         cfg->id_bits = id_bits;
         cfg->istsz = 1 << istbits;
         cfg->l2_idx_bits = l2_idx_bits;
+        cfg->l2bits = l2bits;
         cfg->structure = FIELD_EX64(cs->irs_ist_cfgr[domain],
                                     IRS_IST_CFGR, STRUCTURE);
 
diff --git a/include/hw/intc/arm_gicv5.h b/include/hw/intc/arm_gicv5.h
index b8baf003ad6..d763a7939c7 100644
--- a/include/hw/intc/arm_gicv5.h
+++ b/include/hw/intc/arm_gicv5.h
@@ -23,6 +23,7 @@ typedef struct GICv5ISTConfig {
     uint8_t id_bits; /* number of bits in an ID for this table */
     uint8_t l2_idx_bits; /* number of ID bits that index into L2 table */
     uint8_t istsz; /* L2 ISTE size in bytes */
+    uint8_t l2bits; /* bits needed to index L2 table in bytes */
     bool structure; /* true if using 2-level table */
     bool valid; /* true if this table is valid and usable */
     /* This caches IST information about pending LPIs */
-- 
2.43.0


