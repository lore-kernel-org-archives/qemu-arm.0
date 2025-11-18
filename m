Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672CBCEE34D
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Nov 2025 20:08:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vLRzC-0004KN-4X; Tue, 18 Nov 2025 15:07:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vLRzB-0004GU-1J
 for qemu-arm@nongnu.org; Tue, 18 Nov 2025 15:07:33 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vLRz9-0007XM-GB
 for qemu-arm@nongnu.org; Tue, 18 Nov 2025 15:07:32 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42b3ad51fecso4300894f8f.1
 for <qemu-arm@nongnu.org>; Tue, 18 Nov 2025 12:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763496450; x=1764101250; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IOXcWSlncfaiePwDCOSbYusFR5OMNF5qhOoJv5z9fxA=;
 b=Z0L/vJKNzL3XH3EolXWnE8kigG8bnNqcbE2Xrs5A5gbHOP3yQKYUWI+u1AERYSU5BR
 wuvIjryWdDcXxn2MsUy5udyZ6M3UIQT+mjm/Gyn/TMEXZd4VnqG40J4UZLYMiI3a5kWv
 9fmxTzdZunqRJpvEewKk5Ax+AbiKcnR4T/795l9IGc4NQ1x15/LvrfD4iAlbiv0ZIZWt
 ErazTSB05b1FymLogXV+xVcOQcdRR4GKXNWzj1Mud7waDzhQ2JHj4/PgdnX9YFXYVzPF
 g2cyHbUPkpgj+7Ip2Xr3b+lUMxseCzer2t2bWiD1H3xhpTP9b2G7+0cbUHcWhY5dNWk4
 ksdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763496450; x=1764101250;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IOXcWSlncfaiePwDCOSbYusFR5OMNF5qhOoJv5z9fxA=;
 b=j0wskfVAxT+IaN+3WpzQ2NZ855ItIUoJLE/G6GFp4LojHajoAkqzGntYvfVCTklpuS
 emrq52tRRxawaglXlBif9eS3dvwi8ilT93Gq5tiw2nBp99p0Q8MmQ04E7sqmYbrJbI6b
 m2gc4v0O0PPdAVsYGy+51oDPWdRJqv1a1GiRv4WpJZyhXnFonLaLIwj/AYkNANSmdeE0
 HDK3hjlc+hYSpgmeM0fvMc5dluoZKp++D+vtIt5BLve0dl6+Q4PhcQN9FRxv/tzLTRTW
 bmSM7M2egk1xz9h2CrBFtX8YkcxfN9eec4ubV4UNpfJCrVBqRGhvhNy3dRbEZFqQl7jX
 xkqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/IRfMWSEI36pqNBVRJXI3MoFMpXKxaODra5SI3HqSxftLoc1UUTSnHAHHZrGas8sXNzfV4ekXfA==@nongnu.org
X-Gm-Message-State: AOJu0Yx7l54lLjKQ3IgRTuFfeWz4CO9/vD4HKYTP9qkFEoN0QaeABOf3
 55lbZOnvRJLvMmHI3QKs+BxnZSIlG9VbArSAvqfHGVHpOl+pGNfzDLXn
X-Gm-Gg: ASbGncskLKrK5p/d94Dw4PNnInOBGWPzzXtFupV/xPoOstpHCr2nGoNkAGZS8MEyzkY
 BUpFxPx9HRz2ZeRn4N1LPVQ98x///xdQZe/OLJwwpb5aRtVfWEs/wFRw62lMf+7rz3XqEgYOOJb
 8Km+LTKYhxL3zteteOnyn/v+6s1H3Bnp+UHjUSu7SdwrlJ9vA8rvzdMobto4s6n6etUtQbkgcsE
 hFZWFLEaEc38CfoukfA5zDiVzKtAiVPxRvYQ9qCUGE82LPqgPL1qgqKk9u4c9JwrMyJDyVCbn4E
 GkJVam87ftyE+YcUWWjlMgrCtwjhlwU9v8WAATqP/EVPrVNCHr3CYVSNJ+z9BVWT6i7XcXJTtpg
 ZPd5IO6Mj7g/lL2ITlCtqbS3ICZLfFJ56MYu/gQ83gB2OH88JamYYA2oEzOQ7GJf6uiVU+bBCtd
 0DsXkt4ERKlvXXpi1bz4qvFw0QSzhVCiw/owNfIKoaG4Jd5rCyXeBAovxN3cBo+1MJAUJqRLAC+
 RCqMiGJ
X-Google-Smtp-Source: AGHT+IFUqqgPen06RaVgSnd4AeLYArEgG3IxRCPcMwn+xaDPXZl+8v8/Z5T1WM7S0FAcRX77sv6x8A==
X-Received: by 2002:a05:6000:228a:b0:42b:36f4:cd24 with SMTP id
 ffacd0b85a97d-42b593495bemr17324372f8f.24.1763496449699; 
 Tue, 18 Nov 2025 12:07:29 -0800 (PST)
Received: from archlinux (dynamic-089-012-208-201.89.12.pool.telefonica.de.
 [89.12.208.201]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e7ae2dsm34210336f8f.5.2025.11.18.12.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:07:29 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH] hw/arm/Kconfig: Exclude imx8mp-evk machine from KVM-only build
Date: Tue, 18 Nov 2025 21:07:52 +0100
Message-ID: <20251118200752.39950-1-shentey@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Fixes make check failures on an aarch64 host:
  qemu-system-aarch64: unknown type 'arm-gicv3'

Reported-by: Cornelia Huck <cohuck@redhat.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0cdeb60f1f..7877506384 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -623,7 +623,7 @@ config FSL_IMX8MP_EVK
     bool
     default y
     depends on AARCH64
-    depends on TCG || KVM
+    depends on TCG
     select FSL_IMX8MP
 
 config ARM_SMMUV3
-- 
2.52.0


