Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8B1C88E6E
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 16:08:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x697Q-0003qn-Dz; Mon, 14 Sep 2026 12:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x696a-00031J-L1
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 12:00:28 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x696X-0004cK-DB
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 12:00:27 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4843378fb37so1032505f8f.3
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 09:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789401623; x=1790006423; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=TifGTPPkGOKDLGobPWLql5F+xJCFO44YItkMr2umQYs=;
 b=GS3Sm2Rzas8SOHoRoShwOKyC+9qWvXyMbobA1YI7qKVQyG05Ga+dNYu7oRhO6vFU3I
 +J+t+pRwejy4kTOSyCO51A5IGwL3uc+j9gJllSkJ2/85rVAhwAPZEeruVkLRKHNhXV3q
 FmpaZYlGBWTfAvtLzXzii5FIoOKNsafTMKu/RMr8HmPLpVO+RHqlGdIjnr58lBq6a1Cd
 KDCh4YLPsBGuesJP06WddPnnIO2icF4+tZnD/AZV604bONw6Sc0U5EYk9cfCLukIs7GS
 2+4antHgDX77xgYJEPTGmce/pUhOBwzqnUUm/pSM3V2/AeITlUyn1EjqzrrOt80gk7GN
 6ANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789401623; x=1790006423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=TifGTPPkGOKDLGobPWLql5F+xJCFO44YItkMr2umQYs=;
 b=Dy0YoZRPuWSQKiCZUiK2B6aCnthwu2bx1fqWBgrui+Dlu3Qdh2NUeERO9kPw/nkbft
 SyMJHqaaYKwBdEoBKnNBiN4tBm4vVaAlD0MRWU3WCb+Qnt5UO7CY/3UYccuSwtfBOLwY
 7zIGsSCZ1M1wfumhzKtWp2ILDfayf4LqG+K69LGB9OeY+nfazEKdYQtG06f/VNwtLX3F
 nd3lPNT45Z8uytUa2XFkBzccaeINLpxBaASkU1wppxg8KoFnm+XMs0+jFrRA81AopbGA
 rA2YGRso4BWznxQab80cSwLEY7czjJDm/o3R6URJf9zdOhonjg7s7NiNzbyn99Q+EFvy
 VN7g==
X-Gm-Message-State: AFuF++n/CAIQUfsBG6ArZEB07yvcCkorc+zy4bq8exOaD71RKRi4k+ZF
 SNSHGuP7PeEohMVQIDXPthahfMDVCF0WGPFz0bEMtXW4RJRwerwD7eiI4RMpnXNzbvcGgggeYmv
 WphmBAGw=
X-Gm-Gg: AYBFou2/lfP+psEW6Kd7MKM8Mg3fsitDNXkgt4VlBIad3sjAqe4jfnVCPZLAPVtYz1k
 O5xJnAFHklLBFQVTuj+HO90eBlG/uGcoJaG7DsVLbe4+kQIhyod78T82A2xZeaD45EukeOJKTny
 DwDNJnu2dmLvqa9ulz1hvswQzpUgYZh3dLLxzBXDdNumRPlYRiIvDBaJT+epvODsJSL0DKaSAAg
 nnkijbf/RjUAv5lJdn7KBCWmZGKIU8CDVMV08RBAfUmPjT0bVgv6dQFY7giYyoGVraHj3HAVCTJ
 4xKVNZRzmAbfpbtBeYKriyOuKKJMqJS6KSTY3M/9vO2RvRE5wN22gwGw90pi7GCEukRmtA++XU9
 HontEQcx2v0q3l8naNlhI8FijK5wWguPY/MUwyGcC0gU2fbn9h2TQYwdfE3929Z/z6G/8SNk6nT
 dbRY2i4dPAbJ86OfBW7VldULLNX2MIFT9m+pDJ5zDZEn/6WwSOOw64Q2buV1TXNcxgiufLhDoyW
 J0LS6dY+X6KsTSedffDPbSZvthfa5oP87FUV6FKWcWsB1/dzFlr+/4LQfTi7xjHdjWjymNA7b/s
 QVXz
X-Received: by 2002:a05:6000:1785:b0:485:8a46:b3c4 with SMTP id
 ffacd0b85a97d-48702b5e64bmr3846156f8f.44.1789401623451; 
 Mon, 14 Sep 2026 09:00:23 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb350686sm30797695f8f.27.2026.09.14.09.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 09:00:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] hw/intc/arm_gicv5: Ignore low bits in
 IRS_IST_BASER.ADDR
Date: Mon, 14 Sep 2026 17:00:12 +0100
Message-ID: <20260914160020.327787-2-peter.maydell@linaro.org>
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

The IRS_IST_BASER.ADDR documentation says:

For IRS_IST_CFGR.STRUCTURE = 0:
 Bits[N:0] of the resulting address are 0 where N depends on the ISTSZ
 and LPI_ID_BITS fields in IRS_IST_CFGR as follows:
    N = Max(5, (ISTSZ + 1) + LPI_ID_BITS)
For IRS_IST_CFGR.STRUCTURE = 1:

 Bits[N:0] of the resulting address are 0 where N depends on L2SZ,
 ISTSZ, and LPI_ID_BITS in IRS_IST_CFGR as follows:
    N = Max(5, LPI_ID_BITS - ((10 - ISTSZ) + (2 * L2SZ)) + 2)

This enforces that the IST is aligned to the size of the IST table,
or to a 64-byte boundary if the table is smaller than 64 bytes, even
if the guest programs the low bits in the ADDR field to specify an
insufficiently aligned address.

We were missing this check, and instead trusted the guest-provided
address to be sufficiently aligned already; add the alignment
enforcement.

The GICv5 spec defines the masking to be used with the expressions
quoted above, which work with the raw field values from the
IRS_IST_CFGR register; these simplify down to some straightforward
expressions based on the sanitized values we've already extracted
form those fields.  You can get to the expressions we use here either
by working through the simplification of the GIC spec expressions, or
from first principles (the number of bits needed for the size of the
table in bytes is the number of bits that index it plus the number of
bits specifying the size of an individual table entry).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 08878193dfc..34c3ee90d43 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1313,6 +1313,7 @@ static void irs_ist_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
          */
         GICv5ISTConfig *cfg = &s->phys_lpi_config[domain];
         uint8_t istbits, l2bits, l2_idx_bits;
+        int tableszbits;
         uint8_t id_bits = FIELD_EX64(cs->irs_ist_cfgr[domain],
                                      IRS_IST_CFGR, LPI_ID_BITS);
         id_bits = MIN(MAX(id_bits, QEMU_GICV5_MIN_LPI_ID_BITS), QEMU_GICV5_ID_BITS);
@@ -1359,6 +1360,33 @@ static void irs_ist_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
         cfg->l2_idx_bits = l2_idx_bits;
         cfg->structure = FIELD_EX64(cs->irs_ist_cfgr[domain],
                                     IRS_IST_CFGR, STRUCTURE);
+
+        /*
+         * Bits [N:0] of the base addr are ignored, to enforce that in a
+         * 1-level IST it is aligned to the size of the ISTE array,
+         * and in a 2-level IST it is aligned to the size of the L1 table.
+         * The spec defines N in terms of the raw L2SZ, ISTSZ and LPI_ID_BITS
+         * fields, but we have already sanitized these to
+         *  istbits = ISTSZ + 2
+         *  l2bits = (L2SZ * 2) + 12
+         *  id_bits = LPI_ID_BITS
+         * We have also already enforced the "bottom 6 bits are 0" via
+         * R_IRS_IST_BASER_ADDR_MASK, so can skip the Max() operation.
+         * We want tableszbits == the number of bits to zero, which is N + 1.
+         */
+        if (cfg->structure) {
+            /*
+             * L1 table is indexed by the (id_bits - l2_idx_bits) bits in
+             * the ID, so has 2^(id_bits - l2_idx_bits) entries, and each
+             * entry is 8 bytes == 2^3.
+             */
+            tableszbits = id_bits - l2_idx_bits + 3;
+        } else {
+            /* table has 2^id_bits entries of 2^istbits size each */
+            tableszbits = id_bits + istbits;
+        }
+        cfg->base &= ~MAKE_64BIT_MASK(0, tableszbits);
+
         if (!cfg->lpi_cache) {
             /*
              * Keys are GINT_TO_POINTER(intid), so we want the g_direct_hash
-- 
2.43.0


