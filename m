Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DA8CA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:47:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY31-0006nn-H7; Tue, 13 Oct 2026 04:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY2y-0006m9-UX
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:39:44 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY2x-0007Yh-7W
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:39:44 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48c4d870d54so1559196f8f.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880782; x=1792485582; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=iOOUVgrNaS2uLQpuE+4HLt5jLUXlLvr0Bv+5ciAHV1g=;
 b=YxMuGkqyBnkJBZFsltu5ar0lQ3MzgoQn0/YNBWeW5E5fLbh+WaxsTfGilqOxXjannm
 1e34Q0YgYQXSGN3bBWKv+aDLMzGvuP1+eNPSSo6QPMIbXnVziESc7QlId7u3f2fOcBKv
 BnRRn0ki21JHQH3JqV+NTakh8vGPXcCjTvD9WjRg8McNTtXKf8/5fvVQN18YJAvDCZ2b
 LroMbqZ96KEJ46tVQQOQPJvVsAzqywXfKhw1b/ek/D0HpW3xmTwmWOEP16YYAQW90x8X
 wupodgnnN8Dnnat/9sbNMrSEYmmSHch7W1uREr0e4V76OApIW5gRxyY4nSBD05ObaZsS
 oTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880782; x=1792485582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=iOOUVgrNaS2uLQpuE+4HLt5jLUXlLvr0Bv+5ciAHV1g=;
 b=B7EIAMrnUJ1Bn57qJm+Fc+q9dP9XYcwLjNc1aTf7GKyRaEh4gKNSC0d3ldEEP+f1nv
 JyPhgn6aUgbG1vLfFlboY1ETYs7PIWMh0GlLSFqhm/qrfVGJfiEUxZqxNtKeg2vorjW/
 j0WGNuyiR6XYnWch+gU8X/WPhmjtG2+U0Ua4zQCbPa+CGvveMPaYiXDCFc1y9G+OstoU
 GbHJPfjDDppy54+lnJp8CjYgIrUXxIFapaX9EB4UMWncCSK/tIm7Wr7kErOkJLh5QJ7z
 Ddbi1ReoFJpWBuFfHrc8lVORY/qbLpgo7wviBUhq52pCq3nnJoHCPU1a9pd1gqEoc69G
 Fdfg==
X-Gm-Message-State: AFq9FYLkwqR2mB1Jsj1sdP5fa9A8BMlvj+7dEVuOR3LASh5WKvy/I0YT
 X0FTfPb3HbYa4FsaBc693+v21Tmb+jeQlarMhuHb9Boy0NfHmEzYaPXJPiZcmiuG1iPrtRQWnzl
 bJaWUMaI=
X-Gm-Gg: AYBFou1s9cXF7Y1cPIqcCF5eD4w/EAeIu2+1Dbp1QhbJhAFjB1Dki6LUduV1DeF3lSP
 tbZQa+UYIbKvKqYwZOv6THo8iZ4AAZjY3kw2RUvyd60XCjaZKJR1jVvZ9sq0AqRVGuyIxROaBiz
 ZBg87WtfR4x7XFyD3hy5CcYNiqqC6uaB3/J/WpCMADGYdRgbFISsmulnS7+yhyz57V6TZZPVRJT
 pPeocUyfPrabA9Qqmr1CKWUXGnpfsh4b2O1FJ1wepL6CVhXbaWux2bNym+q8N/luOnmoTHkwB12
 jjsezx5t8Vkih54kNS65b79bNtJxsBGtBIok9d4UHCkGX/RhIU3Z7azUcK6pyKPFDixfmgjQ3hc
 gAxdoD7JgsNinNbp+zmk1i3wZyDu6JdzV7AjB1JkxJ8asQTUSYSf7YKrM+voj5SzYdVr68/3V8V
 l5hCyOmC/1wuCK0oTTX+b5ZVm+7g2sXEWIE3DzAmgYta/pVD8qrvlv4BomHGAHErDGtj+DLIOIM
 LsgXEbTBSmnk3TCTxs8nIMA98UuOQQsxfjBv2IkP+kR/8bit0P/XQwn0xh4xY352PdbuS+NbQi6
 IIwqMClkgMMgXg==
X-Received: by 2002:a05:600c:8218:b0:49f:ffdc:939d with SMTP id
 5b1f17b1804b1-4a18e49d9f5mr224228765e9.9.1791880780214; 
 Tue, 13 Oct 2026 01:39:40 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:39:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/86] hw/intc/arm_gicv5: Ignore low bits in IRS_IST_BASER.ADDR
Date: Tue, 13 Oct 2026 09:38:09 +0100
Message-ID: <20261013083933.1024405-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
index ebfb0878af3..3c50238634e 100644
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


