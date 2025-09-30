Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEF9CCA470
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 11:57:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3YzB-0000Ur-Kw; Tue, 30 Sep 2025 07:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1v3Yz7-0000UC-OJ
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 07:57:34 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1v3Yz0-0001c2-PB
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 07:57:33 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so4240929f8f.0
 for <qemu-arm@nongnu.org>; Tue, 30 Sep 2025 04:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1759233442; x=1759838242; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OBxVX8/NLsjWLzZ2+6eEqS1I+f7z9kN4uZXMIhC5fJE=;
 b=KsmJmz5dEYXEnUIjQv4nySNv/YdNaWor0jFy6o11F1gQ9PTSoiBfFYf1ycvQYTC8Jx
 LireD8bFEBd1NHo2Sg6Da1xsC0zDBOm76F6QUukaptHbT5ODTbB13QyZmD+hXnnjxIQf
 F+dwPhWGA03r77TtJCvEX6KlTyUn4QgRyl+f4ztS7lYvIJFtlJVjbs7EPJwTSMwqT/t5
 MFxhSH2cuqcSTxn+D9+vXWXFgnpUaZLqRt+Yg/BRLwRDlVUd7qu1d1hIJnm97rj7flWn
 uqUgCSrLiLXnCASTCb0W4xTKGawEtwrEiXaK30rjX5ioXAMK1rKTvcZ+EzZAt7Dyom+m
 9lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759233442; x=1759838242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OBxVX8/NLsjWLzZ2+6eEqS1I+f7z9kN4uZXMIhC5fJE=;
 b=ZJD1qOoHQrT7wPTDRQJB+aEaBjArrwvYEAG1aTTvARNNvUVGHSV61dw6q8nN92WUrM
 Ku4bc0hP5lP//wlexeequSLW/DtmPqKsR5SwsRrOYvTSY6ojL01kTl2bPcmEHL+YCAa/
 k7f8nFW5yDsn2ofFcZlrzNj9EMnzD4BB7JKHDsMKun82R+U8IdO6+PmI22/EHyj4ojpT
 csND3EU9GAuptpUrA2PVNtC/zUDwOaE0mUYGT1GMAftgtmjHAN292vyH9GX6oE442spw
 Um/3GPIWd+oSmUJhXX3uIJ7T97bFA1z1wCVxTsa1tosBEi7z1cveoltQca6vCMCNxazU
 Hq0g==
X-Gm-Message-State: AOJu0YwE5tzdZ5lzcA2NWAo1qF5wVPdk9jMco0bAaCBc03PP1IIXnVaq
 0xDu7S0VqELQE4BfrzaxY15yzoYgiUQ9mhW5gtH/XcFQ1wIralr5CSTgy3Hj54fSCQ==
X-Gm-Gg: ASbGncsv0PjBzMYRDmjLpWimgssWnIlJiegTauIq01MGQ5dlhGrrd8NYUNXHNouyvd1
 dCFpfyL8pf2i/YZRNAOTWf6GhUTfGDqDmuUjM5NgYT9h7qB3pTJCALKCBLoW7cPybiKA2WqoPVy
 S4FkMGHR5+R4aCTSL+44tuJPOQ0xQfeImSIGPCaK+Rh0hSbNWhEiH1enr5b5az0AXFGThnr3uWm
 1YjO1/0jcEx32443j4Krgc+AUXCRetR22Kwz4xdOGObWiMRuX8dSgS0k9QgPAWJ5vTY3kT6N7Ul
 yoQ55AfGep3/IDpiLZnc40PjqMt4UmqAtc/++vhMxEk4O9l8p8yUF70qXjldIE35z4X/vDjBIvy
 1pmDoGHfewKaZHQC1zdt1unKSNE1e/Rbi6Svbs3pL8NPZxQPJ7r6f86qDB59tFDnMyjtv0vxjnf
 797s+KBNajyxT2mvxoUvJumtkTQOnljtfoaPo9ddhYWX0=
X-Google-Smtp-Source: AGHT+IFsHre1XLDBmGkYNLwXZIWJmlnqPOvWiUT8MFj8M39GRk/sUkh7w9dz4zkFsEWqfbQrNPaKPA==
X-Received: by 2002:a05:6000:1ac7:b0:3df:c5e3:55f8 with SMTP id
 ffacd0b85a97d-40e4c0e94c5mr19167508f8f.54.1759233442381; 
 Tue, 30 Sep 2025 04:57:22 -0700 (PDT)
Received: from chigot-Dell.telnowedge.local
 (lmontsouris-659-1-24-67.w81-250.abo.wanadoo.fr. [81.250.175.67])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc7d3780asm22448289f8f.52.2025.09.30.04.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 04:57:21 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com,
 alistair@alistair23.me,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH 2/3] hw/arm/xlnx-zynqmp: introduce helper to compute RPU number
Date: Tue, 30 Sep 2025 13:57:17 +0200
Message-Id: <20250930115718.437100-3-chigot@adacore.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930115718.437100-1-chigot@adacore.com>
References: <20250930115718.437100-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x431.google.com
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

This helper will avoid repeating the MIN/MAX formula everytime the
number of RPUs available is requested.

Signed-off-by: Clément Chigot <chigot@adacore.com>
---
 hw/arm/xlnx-zynqmp.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index d7adc070f8..3d8c46986e 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -207,14 +207,23 @@ static inline int arm_gic_ppi_index(int cpu_nr, int ppi_index)
     return XLNX_ZYNQMP_GIC_NUM_SPI_INTR + cpu_nr * GIC_INTERNAL + ppi_index;
 }
 
+static unsigned int xlnx_zynqmp_get_rpu_number(MachineState *ms)
+{
+    /*
+     * RPUs will be created only if "-smp" is higher than the maximum
+     * of APUs. Round it up to 0 to avoid dealing with negative values.
+     */
+    return MAX(0, MIN((int)(ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS),
+                      XLNX_ZYNQMP_NUM_RPU_CPUS));
+}
+
 static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
                                    const char *boot_cpu, Error **errp)
 {
     int i;
-    int num_rpus = MIN((int)(ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS),
-                       XLNX_ZYNQMP_NUM_RPU_CPUS);
+    int num_rpus = xlnx_zynqmp_get_rpu_number(ms);
 
-    if (num_rpus <= 0) {
+    if (!num_rpus) {
         /* Don't create rpu-cluster object if there's nothing to put in it */
         return;
     }
-- 
2.34.1


