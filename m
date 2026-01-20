Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BAFCA5FD8
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 18:04:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viG5F-00073p-PX; Tue, 20 Jan 2026 13:04:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viG4w-0006bD-F9
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 13:03:52 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viG4u-0000TA-7S
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 13:03:46 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-430fbb6012bso4860302f8f.1
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 10:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768932223; x=1769537023; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ObhW9j7iVZMnL/DYXgdUoxnMKmIHFreb1e5ON17wdqw=;
 b=wy/1oUeWbCVCqnd1xtFdhH44aUZV3aucseai9wiuMsSjHxkzPvJPiMEybKmbGV1tr5
 qfIztmlY1GLht78ZfbIgd3Q212+LY3U7kgeNVAYDRE+rwIyMO3ojYslcb7f/tgNq2HHL
 irVKRZCkqUkLRpVYHIXPYWVFxUQDoSXyJU7gIz2AGCp2Zyk09y1/dSchBBzZCTLtG52g
 SSPsfXUYi21iel9a6td3ts+eoqTILWZECWft5pwvhhTIzrqWLXaWZ1d4KxPEKl/h39oR
 H2Y6u3sxWOT96LvyWiINgUEEfaaj9MOgtaAMZzGid4FmN7g6d/OQeADW6ZgJKWlC/g6d
 Ldmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768932223; x=1769537023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ObhW9j7iVZMnL/DYXgdUoxnMKmIHFreb1e5ON17wdqw=;
 b=L9KIbWqPW3yuQan4VZsIOb/OqWhjlYEUVRtkUN6O1GByEIBz2IzT7D+Iz2gB+DDxZJ
 0cmxjT98MJPtMiTYbi9t74MfBQ+1TbdDeVLjnj2J9yZ4s4ZLWuTHlWkMRbiFkujvyiP2
 +zYab9vWPaqTzxNuz3QkF8Si2Cg9X4vsTba5n1HV/HLzuTn7Fpf8Bdoc5jfRQpmeumTt
 TvhqbaE5PMZtjiffB1zjd8zLtxk16KTEtTjX3W7H1PlTJWCZtplusLSp8hvB4hmRa0DC
 /QF1rO8ntLDIJIdDc5smkMuFS3AIT0r26j/sWC960i7xhnpE0N0GNgrPN5jKvg48DZJG
 zKSw==
X-Gm-Message-State: AOJu0Yzv41+zIm3NEDYjdywtE0hlCIPMO0hkutu7hZ7Ym61CpJKgL6mW
 /W+9LAx256pPPnOc7m1SUqjSh2NjG/fAOwUeKQXMBPKk4VEjRdoNXGpgQ6SF0IoR13hFguqqcDn
 NBmsQqQo=
X-Gm-Gg: AZuq6aL5PZ43PNid46V7c6EfzWd+aKOPRgCEdzNUQjb3Uy3CplLwHxY4zmyJCXs72dZ
 IyzUrYWbvtABlaPeynI4wCu932gfvRibvODgtAq2PBBEG+sLKnUKJ0Q7AZMYgNWLRgjeAZg8MHh
 EjAfLA7rVUiYDgEdyGNhOhFfCWvUEgi7xsJGz6GEgXsL5TDSzywt9ggvuoy4+x3u+ajSB/HH0lM
 4Rr3yxRvD7rrSkq2Tfv8RzaFyBZZF3cEl8EJFWzIdImafe/wWUp8K0gYWyV2lmRJMKgtWkAULgW
 Vr9z1KI4ypR2alFo7dmxfeNnEyOfFz05TsnrpevxKm2Nflmep/K2+M/xFv9znsHvLuQrOOxuDoI
 dSVhIhb6MRLtvdz7xTjFyU0a7E0XQ79Tp9e6Ev4h52bWqysnRAo0xlkNBdSB94kLR3vu0IWIEMk
 Xo/BO4Bgh7NG98ySrwI25kdORnpS2CVycv45j08aZtUlfff2QAZ/PB
X-Received: by 2002:a05:6000:26d2:b0:431:1d4:3a71 with SMTP id
 ffacd0b85a97d-4358fef5f11mr4599198f8f.27.1768932221167; 
 Tue, 20 Jan 2026 10:03:41 -0800 (PST)
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk.
 [81.2.115.146]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996cf58sm31310889f8f.22.2026.01.20.10.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 10:03:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [RFC PATCH 0/4] hw/arm/virt: Deprecate 'its', introduce 'msi'
Date: Tue, 20 Jan 2026 18:03:35 +0000
Message-ID: <20260120180339.1416328-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

This patchset is an RFC sketch of cleaning up the logic that we
have for selecting the MSI controller, so we can add the handling
for "hvf and whpx give you a GICv3 without an ITS" in a
hopefully clear manner.

thanks
-- PMM

Peter Maydell (4):
  hw/arm/virt: Clean up MSI controller selection logic
  hw/arm/virt: Don't use vms->tcg_its in create_gic()
  hw/arm/virt: Drop VirtMachineState::tcg_its
  hw/arm/virt: new "msi" property

 docs/system/arm/virt.rst |  21 +++++++-
 hw/arm/virt.c            | 108 +++++++++++++++++++++++++++++++++------
 include/hw/arm/virt.h    |   2 +-
 3 files changed, 114 insertions(+), 17 deletions(-)

-- 
2.47.3


