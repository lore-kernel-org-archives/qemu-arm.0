Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B61CCD4F21
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 20:36:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMtoS-0002UU-5o; Tue, 12 May 2026 16:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMtoC-0002NY-Mg
 for qemu-arm@nongnu.org; Tue, 12 May 2026 16:34:35 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMto8-0002MX-1o
 for qemu-arm@nongnu.org; Tue, 12 May 2026 16:34:27 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-48e82c23840so24437765e9.3
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 13:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778618061; x=1779222861; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zpCSnTZDy0cXLQEkLxVTYXKV5hdeLG4LMCu3JIo7jKo=;
 b=fCi8qTsDK4l53mtZy+aR/88SQCY0AeUVI/aKpkmYFQi0z+4byPA1Z2QsSYhzIgYXTQ
 LWFqNavFp6kWcWelwajsUiO/L01JbOj4UPEElrUaVU0iljG/l/2olctuBsez9HusLvtV
 Z4vBSBHKF76kdk8JOQZEX83YoDThb4bEOgBj6Kb8kiaAnZtBVlZh8sPXnnQGbEE4aAVU
 UNevaPhfiVhwrnmUbcBPaeq3maWyCNjvyim5xHqCnfuV5jr6QicKcWBDSLmF+rnykmMc
 ivP0Vmwa6nTrzicTNtTxMxDopAcWalV8AN9CEtuiAU/qFHkH0HSSGiN7ZjUlqatYPWor
 0VkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778618061; x=1779222861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zpCSnTZDy0cXLQEkLxVTYXKV5hdeLG4LMCu3JIo7jKo=;
 b=Oyyjw5GjCUGSN2xCMaMkfDXYIGwJViTyvgMpD6KNPR4GwlNk/oaYZ3sAYtEA0u5+Td
 WU6cxDRsfqxnhcRrCVZsPl4TOXTySnezYr1Qjg99UttCo8E8RIOHXh+TYZHUT1o+0P5u
 XhsnTAViLdOpYaPejlb/Qeg+r2X43FDX/x4q1L5QBOGg+AvkHlgDr2MJ2eZmD5PVivn8
 pt+Ui5lEnjn7JXq/N93eIxYKF0dtTe346f3qtEm9Lrnyyuj0/LfeKivLehgUpwe7CsHQ
 A8G8Xvrf57eFRhDdLEMJFbf55ju3YMIhhULuEg6BFEqX7kseowFJqQvPlI3gBA73PFvF
 GdgQ==
X-Gm-Message-State: AOJu0YzWyvdV4fHpp/RnFZVgprPi97zqoAWzsDA8hSa5Z7dv+Ryo5ZOC
 yiCXKPYQ/8sc9BOzRvTZAilnYhap50MqNRXVSrNY9BU0r/NhwFn30fvjCPcm/VJ8csuW+31F7i7
 613H+
X-Gm-Gg: Acq92OHbloAta9tFJ1kVbThuJHCYOqA5gLS17t6nboTSeG7hfHbuOSCi+9cSN1h28gl
 AfkqvGgoXWj+EkVp0BfneoHy2GJLc2QRPgIFW/fhpwiQi0ClGU5rVjLJT3/+qVwXfWLke8EnBGr
 wXbZSt+Jgb3Yz6vgbyg8TH1RZUuQqePzh+ADeYpYlVWFMzADzYZMe8/Bvn/Z1am+nVUxdYOZyTZ
 QRvYDoYNVXv5ugYmSCyK8xvGHe1ZjcwcYZF21MTlY9dTkJorao6OnkANcsJc3c5ynXePK4+Ckav
 CjSnsIxswZ8O5QOyg5hIIeDNHtOkH1yNCeFgUabAf2ixqSOfO+Qo5wI6zSI0ZZygzHUQXpvuzMp
 dR6DFeI44JJXC+D3kR7sb4OJ3ovt05SIYaRJRRb2QNVjdxItONC0L1PpB33ArWsRvkDTWx8BdIZ
 pItHk7BspWi7p6h4ogkRpmp667aqwIx8oyrAjhwUkYIUDe+CvWl9dLIVAA5CrE2ptx2Fozi06pe
 rX0+329lPKEHKJYcp7aESKSaeKSDZU=
X-Received: by 2002:a05:600c:a15:b0:48e:89f9:9408 with SMTP id
 5b1f17b1804b1-48fc9a3864emr4780115e9.20.1778618060817; 
 Tue, 12 May 2026 13:34:20 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d69d0bsm16350635e9.13.2026.05.12.13.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 13:34:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/12] hw/arm/omap: Remove stray unused prototype
Date: Tue, 12 May 2026 21:34:05 +0100
Message-ID: <20260512203414.3633237-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512203414.3633237-1-peter.maydell@linaro.org>
References: <20260512203414.3633237-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

When we removed the support for most of the OMAP SoCs, we missed
deleting a function prototype that was for a function defined in
removed code.  Delete it now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/omap.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index dc63323210..96a52d280c 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -338,10 +338,6 @@ struct soc_dma_s *omap_dma_init(hwaddr base, qemu_irq *irqs,
                 MemoryRegion *sysmem,
                 qemu_irq lcd_irq, struct omap_mpu_state_s *mpu, omap_clk clk,
                 enum omap_dma_model model);
-struct soc_dma_s *omap_dma4_init(hwaddr base, qemu_irq *irqs,
-                MemoryRegion *sysmem,
-                struct omap_mpu_state_s *mpu, int fifo,
-                int chans, omap_clk iclk, omap_clk fclk);
 void omap_dma_reset(struct soc_dma_s *s);
 
 struct dma_irq_map {
-- 
2.43.0


