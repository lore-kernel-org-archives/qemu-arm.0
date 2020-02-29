Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1317330lfg;
        Fri, 28 Feb 2020 17:28:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqxiaAzVBIjHLEJT3HzATPRJp40kEyo/AygXHq1tTNSOWnLcPWgBMKWpYb2D7aovsQRmFemL
X-Received: by 2002:a05:620a:621:: with SMTP id 1mr6917339qkv.115.1582939714945;
        Fri, 28 Feb 2020 17:28:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582939714; cv=none;
        d=google.com; s=arc-20160816;
        b=AO+AgJLwYogb3Zl8PwkS06yTnnfi3KdhqbIoQbVIIzJXMxNHljmIMCZFodH+aItmbz
         HEDPVxgu2MM1FiH2+FRb+P97j34bzT0l54XQExP42aN/F17iyKROvtY8Kys7NpNIIIuf
         TuMyLDsmHO4XwbQBFIa152YWfjeewARInbHvlaeB9dqpAUHdTDFV83sqFZic2mjMyAXK
         Q6vXQSG0Gf90mNA6F3VGjktOnKGBIp5zPnVnpOvYeAyKCQBPK2cbv256ZXmhSej/BuxO
         KxIBNYgZ0bl/gP/7QJ3yBuw98Q2Vb+syUl0rnTaYTEVsMQbDFiTGVobtRZREUCos4R4M
         msbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=NIwyaFC2Y+T01ApiS+7Vr1E7LRIA76ZwzglT2YIUDQQ=;
        b=S1k2iU8nrqVgcOXCDtoBzqbmUMp+UfomQa1th2w51CjwN5fBsbFQNn/F6mnEZNN1pI
         8Z4qPCOdTD/PRCVMWiT9H51vKuc3cHjkaJnWYDjkc367YHz5Ud6dWxNNV8jDhNvN1bW0
         XrFANhl8KdQmf/vGvetqyAsVGYfB5NSBElqkf7N0W04CLmrFrKnlxz/rNtw6h7dp9kWI
         dQDjL+gWN6CdROMYJZZRSfoei2FkmnD7GGpF0IlP52gf5WZ+JcqVJKKHt0JtWr+x45DY
         oXaKA0h2y4UgFcKGWUudjYR2zNy2oAjSQregaoUf+ddAIyuwJxK2CjI+BHZbGMcQIByl
         /1hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HHcmzm0v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22si2240339qkk.299.2020.02.28.17.28.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 17:28:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HHcmzm0v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7qvh-0004jU-UP
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 20:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36894)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvR-0004ix-Q1
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvQ-0005xF-Dd
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:17 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:40038)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7qvQ-0005wS-6p
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:16 -0500
Received: by mail-pl1-x641.google.com with SMTP id y1so1905208plp.7
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 17:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NIwyaFC2Y+T01ApiS+7Vr1E7LRIA76ZwzglT2YIUDQQ=;
 b=HHcmzm0vWqT25PAnzMhzksW1lARVaWQu7Es1jrgKl5hgbc70jK1VlhrQo7BoYVwC5/
 hC/ojSi2QRBsmyQlAldsqE2Rw9xCoBh1UCfHxJah3uayd/kEOkXid2i5qOPMdNljfQvr
 ZSy0k+gydTI+ShXy9/4sIgpOB7X/B8whyUSDZPTvEO14uMgh5Fe53/vK92MS0W0xZFlr
 BchZuCEVBuLQMMMQCR5woViVhFI03hh43f1hZywVmLWASqA4ojy5CrxqbDugLzrZJlfZ
 B7Zhb1Y3XwCdAs8xSbkUBZ3lbvfSVHn3JIrBshSkRs4gC98Lt2P3ABSKxBJ3ICSC2LtS
 hJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NIwyaFC2Y+T01ApiS+7Vr1E7LRIA76ZwzglT2YIUDQQ=;
 b=lAAa7G+03/zwC7yM/PuqKoM22csuGFWhDO37X+HA3SF1D+rFuDcJd7sTGHbx0ewkUR
 66+ETA4VrUNUbFy6yiiozjW4qRAixl2KuRnbxvpOYgorPo2vWNnoc47vZDikBiHPaZQt
 UWoAApQUngIwQXQkdnXZzX3r8Zdt3usKA1AbZBM6z08U1TbnaYCJq8nOlPYdipF1/+Yl
 cPTnHMChgxEhlnfJPNs5/pbyTORjvYbkJvigQlSyoMiLkr7ek8WM65Z+KAxVnm6KLE7J
 ULUh+fwlz/ljPC6DeJy7T0YdJHGkpHSF3a60qehsrW2NUrnycLBVCIweCr2cHsEMKGXk
 +tfQ==
X-Gm-Message-State: APjAAAU4ooikgRehoWnXjqkY3eoROagUjk2zbwaet5TEwpjem0gMyNUn
 G6kf+/NVkCOkMabSWQAeEP6rPyxnHbs=
X-Received: by 2002:a17:90a:d350:: with SMTP id
 i16mr7694558pjx.38.1582939694747; 
 Fri, 28 Feb 2020 17:28:14 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id r3sm4606313pfq.126.2020.02.28.17.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 17:28:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/12] target/arm: Honor more HCR_EL2 traps
Date: Fri, 28 Feb 2020 17:27:59 -0800
Message-Id: <20200229012811.24129-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iQToRMT34n4t

Changes for v5:
  * Patch 1 was broken for aa32.  Not just the masking vs the "other"
    32-bit register that Peter noticed, but more explicitly in that
    "ri" was dereferenced as NULL -- hcr_write{high,low} did not pass
    along the structure.  Oops.

    Break out a new helper that is passed a starting mask, which is
    used to preserve bits from the "other" 32-bit register.

    Check the aa64 isar registers only if aarch64 is enabled.

  * Add HCR bits from armv8.6.
  * Remove EL2 & EL3 from user-only.

  * Mask hcr_el2 bits that are res0 in aa32.
    This didn't work at first because we weren't configuring SCR_RW
    for user-only, so aarch64-linux-user thought EL2 was aa32, which
    disabled pauth.  Rather than find other corner cases like this,
    I think it makes more sense for user-only to only contend with EL1.

Patches 1-5, 12 require review.


r~


Richard Henderson (12):
  target/arm: Improve masking of HCR/HCR2 RES0 bits
  target/arm: Add HCR_EL2 bit definitions from ARMv8.6
  target/arm: Disable has_el2 and has_el3 for user-only
  target/arm: Remove EL2 and EL3 setup from user-only
  target/arm: Improve masking in arm_hcr_el2_eff
  target/arm: Honor the HCR_EL2.{TVM,TRVM} bits
  target/arm: Honor the HCR_EL2.TSW bit
  target/arm: Honor the HCR_EL2.TACR bit
  target/arm: Honor the HCR_EL2.TPCP bit
  target/arm: Honor the HCR_EL2.TPU bit
  target/arm: Honor the HCR_EL2.TTLB bit
  tests/tcg/aarch64: Add newline in pauth-1 printf

 target/arm/cpu.h            |   7 +
 target/arm/cpu.c            |  12 +-
 target/arm/helper.c         | 358 +++++++++++++++++++++++++-----------
 tests/tcg/aarch64/pauth-1.c |   2 +-
 4 files changed, 262 insertions(+), 117 deletions(-)

-- 
2.20.1

