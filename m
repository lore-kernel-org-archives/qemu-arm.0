Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452F6CC6B10
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:45:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY33-0006pI-C1; Tue, 13 Oct 2026 04:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY30-0006n8-Ac
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:39:46 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY2y-0007Yw-5Q
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:39:45 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48b042c0759so1997473f8f.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880782; x=1792485582; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=9Vj/WyrTKsX+7lendkR52TtR2J1V9h9JXeBCl8flLS8=;
 b=Tqww0j8K7ajZ62Kslu0le83xYKHxhRvWBXq7un8iZYTQ3dJYE3M7QpsIqa/QoN0Xuz
 SRGbDZtq/coImPR/sUtouEURFFntZeDWohdS2gulzki2WdcskdULYiHTxYxZ3ueany+A
 fKNVj/LkcWiuPptYzyQT5FykqAOa+sJdCft4edkLZ3E9hldngUiimSYPnVPmX7KrbIHO
 wPZuBMsY1xylAu1cZOo0CZ1sHDkvKdNf1yRu7vy29g8SGzDM8USpsm0AtBTkW5Oticu9
 /VhkjUTpbzd7E3clgMts3gagz8HQaYuzrWc3/ODhDvAgMbjdDmGqi3ccOVMnBwjIAM9U
 pqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880782; x=1792485582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=9Vj/WyrTKsX+7lendkR52TtR2J1V9h9JXeBCl8flLS8=;
 b=IkgETTt4bVPapfIN6T8P0plhcuZMGF7MgURyZljRUGtBj01/9teEAjmsp2jG3g+B1y
 7/hxGgqolVxzK+tYXhBEzA7t0E+yg3EHGNhM9fdA49msMBputK6WpSE2t/zxipWfL8ZY
 Nsj7cLVRyomirbSNGU8qyNysl/E7ffQUNeb4GYc3mf/Y1Y7Ihtp2FZtl7S6B90ycIwne
 I9fOBGs32CTpwFoEvkGsNrw1oUyxDn7guwlYggFNUTPUH8iGZEf24A7FzIA7jDqn0dVp
 VTwli7laWaQRLD/vLovSgCZAYJsxofX9L97QVwjbVQNV9X49+pxzh+o3D/yGI+yHwzMX
 I45w==
X-Gm-Message-State: AFq9FYJDIsSJj+RoE+zngJD69VALgUsCSLoSHchT7BX4tCAhQtuB0Y4s
 RDzal3Tdb/YzpMfSATDsei033bDooBnDFbveDUJU8cupaPK5t6rSMPSvIH4KqoV51CdORFUyQOp
 75KHm36o=
X-Gm-Gg: AYBFou2Vtw7aZAHpBoTF3vje1ouCug/8aW9tlVzUwkcNocM7+DnkbrLVeFhuOrfB5DI
 D14cbWxKjAJXnkQttCq5azEcDM0pIBQgRzEs1gEWAbGDt2jzyJt9V0gAhziH0S6+3xbsI3t0FWC
 9Ga98j8Y9WlfrJq2dd/Pf437mKy8fohAUWU3Qc4AMEG3WX+DyWAoqCHao3Thb/8d5oipVDLm9hg
 hPUI9vNWHhOiun+cayK0SX/L8TyvGQiNNRgfwaD5HBHQQpxy7YQshS376cBWz30wM5UIgXjkNh6
 e2HBTiHX/HhyhCwVhiyRA7UeM3ILz67Mj/PeotUs624U2EV0T1NfekPvASI4EmWrwWoiwQpCpML
 8oFX695movi/QN3ZnU5my+lqPOLXGbjB9hYD4ZDH4lyY2mqSPNgbzwl60HCAhHOhS8wOnllZZP9
 dtUqC46oaGA5i+Mo//IeNkE/JFrPeqsRM0HShMt23lZixsXye4Q/dogEJUBA6zEMiMZwL3+dgJa
 0pDNmdSqTJp7Q3FtLM7lbZF3P4IZ6P/XjfIvSLZujPPAJPxuTt/ht/1ma1ivVhNECgSNM8wh0cx
 +IE=
X-Received: by 2002:a05:600c:3b87:b0:4a0:1b15:8852 with SMTP id
 5b1f17b1804b1-4a18e4a977fmr291437115e9.16.1791880782604; 
 Tue, 13 Oct 2026 01:39:42 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:39:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/86] hw/intc/arm_gicv5: Ignore low bits in L1_ISTE.L2_ADDR
Date: Tue, 13 Oct 2026 09:38:10 +0100
Message-ID: <20261013083933.1024405-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
index 3c50238634e..2b08f8feec2 100644
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


