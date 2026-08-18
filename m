Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55653C5DF74
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Aug 2026 00:27:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ww7f2-0002Ga-0s; Mon, 17 Aug 2026 20:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1ww7f0-0002GK-TJ
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 20:26:35 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1ww7ez-0004Gk-Ec
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 20:26:34 -0400
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-4ab47c40e7eso2712980b6e.3
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 17:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787012791; x=1787617591; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=9/yfjQTPEtrC9StG3ocPwJnsJPDokp/jOBq4p+yXhWE=;
 b=X1vXIy+RcXfnGqf4InClTTDtDC/HZwrRWHkVy1+698wzVB+poA+W+OHrOFzhR18uir
 ss6C9Su9REkJWjzc49Nciouqqyp81yNrmNV+qPK6GF6KaiHltXTo4xLcpJ2lvUy7lM0Q
 +QN+0jeiQjSGW4La+F1bay8FyxxnUSG8TExbPeorqP7jOjEPKCdR5xBrif3FkaxVSX3v
 xCnM/3E0GU7bGuRTGCesnWLotcnCXxT4T366nOPmt7L6xbWSaWmX7NFfPEv0mxXcWtA2
 hW5Nc3MlhCI+jImFlA3sov7rEe41G7J3z40T/0CboZE31ZBrWtZ/kae+kaX9G+YGroyf
 /CVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787012791; x=1787617591;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9/yfjQTPEtrC9StG3ocPwJnsJPDokp/jOBq4p+yXhWE=;
 b=ZaIWKfFSxD01FnCagXpTsa6XBDICFnOAAoodU59u9VMmzn6Li4/f/mH4crLz0DPpq5
 MuPlHKstYkfWHtlWjPxv8MNlSQf9rV0c0dOJbzkTK0XLUdrg5BP1nVQtxcJGtIVu7Pd3
 K/fYdTjGBt0XONeaGiIxbFWAjVSd+sdHDsp6eewoV9nuWb0NJUkSVn/0MkNElBNr07S/
 xHf30mq8WxIUrk2mjK9apdugMU4c+4Dg80tXzlZIobpHbj4Ufiurh12VTv2mZOrRczb3
 SoYJ+ZkRnEK20ZqozK+KnLGSZ8uBMz+EWjgt/d8m+3Eqt8werIOFxvl/sFl64xgQWcix
 OCsQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqgkx8DoFTxhWuV+BlPJ240sebTfvJPSvIv5T1mzG1VBLZyhfFsJg6XVi5jOGxadgY6+4gUZIynJA==@nongnu.org
X-Gm-Message-State: AOJu0YwGPcPGipNTteeW/4RYMFhajhesqz8JPOG9YPrP62rWoPjY6hov
 ccMSoMHk9B0FveXH0cptKDO3Del9ZHStEPAhALsUF0IQsuIGPl15C1A9
X-Gm-Gg: AR+sD13s8q23dxpJFg7NrioE9UZOsfGK7xCqYPQhwGr327JamEew96N7m65WckpQYNh
 GfDsTXTj+CtZbSiNkesi5pXdCG3CcmBtox/gTxQOBDcMtOYLjG7FHo2llWla7V5Y5YyvdnaPbUv
 D/UXz5ID92ExxBUaNoV8dfUhbvuvw3VL2XYSGW9WA6mza9eCcNxzEm+jxJjFm7b48ATJsCjhzSX
 rg7HAwtUAfMj6/lGsco3AUrkhKFTdJ7RKhtBGwpbNpbGFs7vjxKYUtKtDcW9JEVAezMopI2FhzN
 G5ID3PxTwuRhukiv+m4vH6qQdQpkZC6xeTfEDys3zBpJWhyhc0IfCeuf7zEGiQf0AOWFReK/SjZ
 WxvcQ3d4Svoa4+RgIV/Cf4GFlDJdHZUOrSvYm35XMu3yUmwxnRLuJe1/bp9rSnkpACFzD/zi002
 JeBcXbCtfQoPcG1cXADLLYLQFpcG/EL6m5SCLkrO1iG2Vp0YjKIKiEQzv2JOZwCVozjJryY2exf
 B8WXu0W7H8=
X-Received: by 2002:a05:6808:5142:b0:4a4:a693:9d87 with SMTP id
 5614622812f47-4b297517839mr4579257b6e.5.1787012791534; 
 Mon, 17 Aug 2026 17:26:31 -0700 (PDT)
Received: from LAPTOP-86EU4LQA.home.local ([23.124.244.239])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4b2960dfc9bsm1715165b6e.14.2026.08.17.17.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 17:26:30 -0700 (PDT)
From: Simon Xu <simonxhy0404@gmail.com>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Simon Xu <simonxhy0404@gmail.com>
Subject: [PATCH v3 0/9] arm: add Cortex-M85, SSE-310, and mps3-an555
Date: Mon, 17 Aug 2026 19:26:20 -0500
Message-ID: <20260818002629.172827-1-simonxhy0404@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=simonxhy0404@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

This patch series aims to add the Arm Cortex-M85 CPU, SSE-310 Subsystem,
and mps3-an555 FPGA board.

v2 -> v3
    Removed ppuintstat variable in iotkit-sysctl
    Moved add GPIOALT2 register patch before add mps3-an555 patch
    Add gpioalt2 state field to new vmstate subsection for migration
    Rebased onto master which includes bug fixes to existing models
        in armsse.c and mps2-tz.c
    Patches 1, 3, 8 still needs review

Signed-off-by: Simon Xu <simonxhy0404@gmail.com>

Simon Xu (9):
  target/arm/tcg/cpu-v7m.c: add cortex-m85 model
  hw/arm/armsse: add Arm Corstone SSE-310
  hw/misc/iotkit-sysctl.c: add SSE-310 support
  hw/misc/iotkit-secctl.c: fix AHB secure read
  hw/misc/iotkit-secctl.c: add SSE-310 support
  hw/misc/iotkit-secctl.c: use GNU C case ranges
  hw/misc/iotkit-sysinfo.c: add SSE-310 support
  hw/misc/mps2-fpgaio.c: add GPIOALT2 register
  hw/arm/mps2-tz.c add Arm mps3-an555 board

 docs/system/arm/mps2.rst        |   6 +-
 hw/arm/armsse.c                 | 208 +++++++++++++++++++++++++++++++-
 hw/arm/mps2-tz.c                | 162 ++++++++++++++++++++++++-
 hw/misc/iotkit-secctl.c         | 132 ++++++--------------
 hw/misc/iotkit-sysctl.c         |  88 ++++++++++++--
 hw/misc/iotkit-sysinfo.c        |  22 +++-
 hw/misc/mps2-fpgaio.c           |  35 ++++++
 include/hw/arm/armsse-version.h |   2 +
 include/hw/arm/armsse.h         |   9 +-
 include/hw/misc/mps2-fpgaio.h   |   2 +
 target/arm/tcg/cpu-v7m.c        |  41 +++++++
 11 files changed, 587 insertions(+), 120 deletions(-)

-- 
2.53.0


