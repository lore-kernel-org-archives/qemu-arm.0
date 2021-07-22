Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp6785lfc;
        Thu, 22 Jul 2021 11:10:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+iZWBEiWTgc8yZt6MaAh2vGeDiXKVzgriRYgdYVbEHZ7uFcniKBDPAdxa08/Eg4tSvk7S
X-Received: by 2002:a92:db4e:: with SMTP id w14mr760682ilq.188.1626977429128;
        Thu, 22 Jul 2021 11:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626977429; cv=none;
        d=google.com; s=arc-20160816;
        b=OJV+Jw+dQUXsCt5Vz2zuNVz0FxxgN9Hg7gATjj8UIw6qCwdc4ij0vQhb4Pm+XxU4lX
         06dwCw5FG12rNzAxHapl8t3JLQpsbaipUC1TvqHR2US/IQpMEWuB0uUeLBL4oCSD95VK
         aqLHWtjJvjgB3DGz9OCssOUaaJj4FXcb7IVOmQQpiTkEIZMUslSRuGC5d1MI4vYadm0W
         ugwWloR5i+GBUmbSVdAvYAGBKe7GfZhWAY7YxUS0dxLsVlOL2vWRNiCZzMIx4j1nMu4q
         ZUyaIw4fUL2DynUGl+LNyTIf2fQozI7fZIUKMct+uHYYVL1+8+4kkxTQEu3lP5wQ7R92
         6A7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=CXVfymAfVkltRwBq4Zm7LccAFojVqmx4XsEN39Q8M6I=;
        b=bx9kdGrlHcZcObVQn5oevSjHM5C7KLwyfG8oSPD0mmFE7LwiXpNk257eJXWGw2RQnJ
         kSb2QcNyneRV5dfClqOZx8cejcvAg1PNR5bkmh5wPsLYsckOGOSzWbZR6m+RnwbHZMwb
         qAlqXJv0CbvKkk275RYC3BhA+6s4BPzjSIkLGLeZHMP8h6A9D10DIg+29wIaaHoYZ8KK
         QLuU4rSQCKW3+b41CSXc7xpOqNkaPpMzus0PT6uFIHi8nq/FSDisUhG9r+cBG/kWyZtj
         R2zQ0gW+RLSCL73IA2l7y9oW2Ib6q2E3qtfB0X9CCnZ9oz2G/K6xTwp/xJcsOBYkpzhq
         FNQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aGL4tWAj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si32717805ilt.39.2021.07.22.11.10.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jul 2021 11:10:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aGL4tWAj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6d9H-00070H-4F
	for alex.bennee@linaro.org; Thu, 22 Jul 2021 14:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6d8u-0006x9-1g
 for qemu-arm@nongnu.org; Thu, 22 Jul 2021 14:09:56 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6d8s-0004zD-HR
 for qemu-arm@nongnu.org; Thu, 22 Jul 2021 14:09:55 -0400
Received: by mail-wr1-x42f.google.com with SMTP id f17so6863865wrt.6
 for <qemu-arm@nongnu.org>; Thu, 22 Jul 2021 11:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CXVfymAfVkltRwBq4Zm7LccAFojVqmx4XsEN39Q8M6I=;
 b=aGL4tWAj6qeKPYijZ4Kh9kGGACwBB5xNYfI9U32/KQbbDgaN2cBsoLs7Ax7tIDtnW5
 fRKZy4Q0cSbCrSusdGjQ/+0+Ri3Je1Xjl8uwVVgSA+O/ur9z/zCjF67oFEkR16CXsReN
 BhTYQ6/tTychaaiLhn+qEuOOORj+l63klTmKmQ7SUc+8auvKru2u/0pdBzKOPPGQ6OtJ
 7Onq8cytUGJWpn+2iHYEmi1E1FiG4WZ+Y2SH4oZjQpuZ5xge6hMaqHjoXjIQWgEkKbBL
 CCOkY2lKZhQo3a/BWH8KHoVS0OzXrxmKFT0QBpiREIs37s5HRxmJOcHr/Ob6JvzKPg4X
 MiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CXVfymAfVkltRwBq4Zm7LccAFojVqmx4XsEN39Q8M6I=;
 b=huXqsxD+7elkMuMHg0fQrTldGm3y1wGAUcnUUGQNXEHVSySexDERL94VjLISlZX5Ch
 6p4f1YirjAfqhcPOkA4sZozxcu/t23u46+vKZ3aDEu510NedRMizelmUWGyfYmAUFiu6
 NuKmimRY5U0X6KLCWO7ggzqFEhZg7zGr4rbxmNx4NSl6kI0jsei+K/Kne566+KJCKOUc
 CjS7CF3VXAYR1FUg2M8sO+VjCojmlNOVN4WjIj7ZYxn5q1aHu06zet95l92cG7FoSOg+
 ikWjBdk9sm5x/jV37g3BCHe2MLxLsOyw+M5lKOaREcqa73KaK79C3hX3EODGXoaLfVuL
 ZDeQ==
X-Gm-Message-State: AOAM533qcpqgFlWaY6yIoyrtLIke99Pl8ZCYpPXg2wFULMvpIDESgQSt
 Xf12WF5joVKyx6FDrVIqwg//xOTTrsP4XQ==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr1252819wrp.254.1626977392941; 
 Thu, 22 Jul 2021 11:09:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v15sm3394080wmj.39.2021.07.22.11.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 11:09:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Don't list Andrzej Zaborowski for various
 components
Date: Thu, 22 Jul 2021 19:09:51 +0100
Message-Id: <20210722180951.29802-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrzej Zaborowski <balrogg@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ys+xVsYZAGkC

Andrzej Zaborowski is listed as an "Odd Fixes" maintainer for the
nSeries, Palm and PXA2XX boards, as well as the "Maintained" status
Arm 32-bit TCG backend.

Andrzej's last email to qemu-devel was back in 2017, and the email
before that was all the way back in 2013.  We don't really need to
fill his email up with CCs on QEMU patches any more...

Remove Andrzej from the various boards sections (leaving them still
Odd Fixes with me as the backup patch reviewer).  Add Richard
Henderson as the maintainer for the Arm TCG backend, since removing
Andrzej would otherwise leave that section with no M: line at all.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Andrzej: if you're reading this, thanks for all the work you did
on QEMU back in the day; and if you do want to still be CCd on
patches let me know and I'll happily drop this MAINTAINERS update.

Richard: are you happy with (a) being listed for Arm TCG and
(b) it being "Maintained" status?
---
 MAINTAINERS | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4256ad1adbb..8c44a26bcce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -786,7 +786,6 @@ F: roms/vbootrom
 F: docs/system/arm/nuvoton.rst
 
 nSeries
-M: Andrzej Zaborowski <balrogg@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
@@ -804,7 +803,6 @@ F: tests/acceptance/machine_arm_n8x0.py
 F: docs/system/arm/nseries.rst
 
 Palm
-M: Andrzej Zaborowski <balrogg@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
@@ -837,7 +835,6 @@ F: include/hw/intc/realview_gic.h
 F: docs/system/arm/realview.rst
 
 PXA2XX
-M: Andrzej Zaborowski <balrogg@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
@@ -3037,7 +3034,7 @@ F: disas/arm-a64.cc
 F: disas/libvixl/
 
 ARM TCG target
-M: Andrzej Zaborowski <balrogg@gmail.com>
+M: Richard Henderson <richard.henderson@linaro.org>
 S: Maintained
 L: qemu-arm@nongnu.org
 F: tcg/arm/
-- 
2.20.1

