Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EADBCD98C7
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 10:51:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ4uE-0000Sm-4T; Mon, 15 Jun 2026 06:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ4tn-0000QR-RB
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 06:50:38 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ4tk-0001SB-Rg
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 06:50:34 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso28343085e9.3
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 03:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781520631; x=1782125431; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=bElw+ObnrJANhvVaMpMY5W3cKHNMW4adXEFOoSTdva4=;
 b=cUVzOzHK1LpkIRp2YGOF6ur4gw9P9F46tUFLfawQm1v3MZqIu+iCDjVTfkaBnsIH/7
 Em4WoL8lySYtO/Ak6LNht9OcfxigCjIv3try8NjHRRvuFcPehq2lERyqqGi3QoBGU6GT
 42mxMcKrm7WZ2YJYhZYksO49uma0MRQWYcUzfLEX1hxTMUMTsGObpHhdt4fd8JnD6RQz
 J2qga0YbiC2dSyWgjn0ONz4Yfy8d9Cea+f2siWqo2E7NgY+tMNGxSLe+cUblbtn1YEZd
 DRkcFB80JkEBZQeUbRgqamv4Zvhk+eGkVUk0XScvcwMqAO62s8F+SNYq6/YQ0bhPwjlj
 1tEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781520631; x=1782125431;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bElw+ObnrJANhvVaMpMY5W3cKHNMW4adXEFOoSTdva4=;
 b=k3I5TQyE20nyj+o03rYX9Zsp+qn2BhxU28oQKkWMBybI8+iJsvu1i0KKj6+MSI84lj
 iFffVteaW/DakwPj/sInISVBphLe1WWn8WVbgJElxo7gVm9qma2QOENA8J7oA21ObmkD
 RXVOla6nfuKB/xGHh0Al7iQOEQnpLLZnHk4h8hbAwAE53EmywyiegQhAygMLncnH9oHh
 QdqWSQt9byZ7TcoTBKAp1HBaN3C6L1TQwcQ1r1i8KUEGgj7sqGRrKFrPhrh7ZQ0gVWm7
 u0j3mAFvivz1ccPiX8JQrXrj8xb9E0SJUHDzFnWSWcGNtlBWXZXQiheV2t0sePrrg7L5
 gkWQ==
X-Gm-Message-State: AOJu0YxOVGTg0oxufx+fwi53NQ1JKLnZdsaBnmbd0Cxvvz/IU0eQXNRN
 NHUJruDUuBtMjKvkIMJs1K4XtoqvvXwormuf2eIEbEnaj/ijn2K7ESEjeO3OrZpWFP7XLPkRICt
 IAQ7D
X-Gm-Gg: Acq92OE4kY/qb+HORMK7pglkJ2OkjPE3LrkWXP7Xy7c9pySAm3VwbIcA6QFw2kgxNUV
 KefUv1X7jx8dOkMnl6MUXzC+iItZ2Zlap1FyLikkQC4yqdGicFG26shEenbSd0ftxbkMPDnKYLY
 BQ5zGYKu8mhmalBvAkN60hI460TrkYZkuv0gUw1pMvDM2a+uIZticZp7OyMHDa5fFq/Yo3uPCDa
 KxMVPr0ha2Df84OB5flknTNURWlQnZ335xm1uCqy7GsnnEGm+BPH8KKyNYMf9Bwb1JKT/HUEJ3D
 YLcUXdXKvsWfLJ2nfDzGmJoh+c15QoIjsQyveWL1D83YKLsIRlyfHVenL/cjLwIBuo+T630UH1b
 eeMnp1uVGFqVo1WrNZGXTwFMWCkBpzQDdYiFR9XKWU9VlLugr6ZWgU5K+Lym5jzcruZ8IVWk0sB
 fBy3b3pvDHHfNYNHqSvtvA74YVkTs4VuLSPRiSCVzwi7dTDE+O3RH82HbjppjGoJU/gTRpO71Rm
 MpjYcFVrc4ilS7PYb5QoJu9kyJEg4alYP/Y2diy+vM=
X-Received: by 2002:a05:600c:c04b:10b0:490:be1e:6ce6 with SMTP id
 5b1f17b1804b1-490ec4d6ae3mr130077615e9.9.1781520630962; 
 Mon, 15 Jun 2026 03:50:30 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f263945sm33863674f8f.8.2026.06.15.03.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 03:50:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/5] arm: GICv5: minor fixes
Date: Mon, 15 Jun 2026 11:50:24 +0100
Message-ID: <20260615105029.2898872-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
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

This patchset has some fixes for minor GICv5 issues that I noticed
while I've been working on the GICv5 virtualization support:
 - 2 actual (but minor) bugs
 - the GICv5 spec now has a final URL we can cite
 - a minor cleanup of how we say "no pending interrupt"
 - the ICC_HAPR_EL1 register is removed in the latest version
   of the spec, so we can drop it from our implementation

thanks
-- PMM

Peter Maydell (5):
  arm/gicv5: Add URL to GICv5 specification
  target/arm: GICv5 cpuif: Recalculate IRQ/FIQ on ICC_PCR_EL1 write
  target/arm: GICv5 cpuif: Tag ICC_PPI_PRIORITYR<n> regs as
    ARM_CP_NO_RAW
  target/arm: GICv5 cpuif: Remove ICC_HAPR_EL1
  hw/intc/gicv5: Define and use GICV5_PENDING_IRQ_NONE

 hw/intc/arm_gicv5.c               | 11 +++++++----
 include/hw/intc/arm_gicv5_types.h |  4 ++++
 target/arm/tcg/gicv5-cpuif.c      | 29 ++++++++++-------------------
 3 files changed, 21 insertions(+), 23 deletions(-)

-- 
2.43.0


