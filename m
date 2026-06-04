Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F805CD6E6E
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 23:51:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVHo5-0006c1-UM; Thu, 04 Jun 2026 19:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo5-0006bP-69
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:01 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo0-0007qJ-W2
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:00 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2bf18c30bb2so8857835ad.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 16:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780616934; x=1781221734; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1ucAWI2dxDtortHZVQXRcLQXl473GouZE2h5JHIbeoY=;
 b=yC1Sr4VBPfOVcr3Jq6DA4PdbYjdzE7eGW9PBKZO+TjpLv9g/Wdd8ae7rNebQiOsCpu
 zAdHSL5VzGNNaze+nYc5E3fDBqE5jjJ6GW4TOIkamQpQvdg/Aip4VigqDqw+9YJuzRV4
 gFVUyIi7ikY7pr44FubsuQCzX0OrEYdIOgZ3KkVUqYykmcpTQksTR9xTUQnDv2ILswRt
 Y6svltmKy1ez8vaQMwKNcVunoWjovS81qm1Cdj0OnjIqtV+oYuvH5q8V2ieLP22j5Izh
 m9Z0kUeHshivob6Szhh1OyiObpI10NiVZZJfIp1a/UdBR6ZWnRb8c97vDA1YUrw7RyYu
 U4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780616934; x=1781221734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ucAWI2dxDtortHZVQXRcLQXl473GouZE2h5JHIbeoY=;
 b=EW6kDv9Q/IchnKMJEOp53yD/1n9OPoJiqfQoavrfRYt7mI2eyAsrzAnUxK1YqTnkjq
 Ft5QDpBYAuTNzSr25MV4gwBNUtHzZiP9K7tZfnU8pS4bmQDVx16lJCRXjdMHZmxyweaS
 hA2iLN4dliVXhHtBFqnZqr0pfshDn0sCz/qw3PHEU2GpPG8XqcZHZssByUuijQ0PgZSv
 qpVpws/zIBXKjJ8MKNXVIYq6vK7WZH841WohlHRxEQ3FZyZAlXP8zJVN/eukXsDR02gO
 DCSVgRo+Q09FUsFBHFFPYqOsODYQa35isgm6RCdAojHn/KD+7U0+gGunAe6R90OxxR/L
 CE6Q==
X-Gm-Message-State: AOJu0YyXZO3YQz5pLv4rGt1c0RsyvN+d2k/pn4PPDKO7yL4HVmCmvtVe
 wh3BG0exaJnVt/Z1K355qU9Kcj76T3YyUAqyVqqFefbNU2Aih44Xte548ymOs9UdOX4=
X-Gm-Gg: Acq92OFcc+Wi5F0wpkt7nLBsb96MWfLYgNgAgbbmX0A7a4/rHuXHZ1Pmc+AK2u9z+oc
 7UsBsxdIOrwarMyDk10ehqTF5qECSkYi18dxpW9id/TjSp8FSPlJBZmPzSbiTTKlK/Tjgfb1tCv
 rs4jZNKUv/sRG7chq3cFVaOLfdM3l4ENJL01E+YtdQrBTqya7Eym5Zt+pvGjmmNnzYJ4isk5i0w
 eYl+qggcRD3drF1P0lZvl9blGzpQ1ke6j4c/qneb55KWzn/hXIYQMWE4upIZ3PBcdcNJduj3F+y
 zEOa1Ua/62k3ls8eGDR2ch8UFJUsMn+TdXEYfns+XtMRJSTPwmGtMBQ5eQFKYjO5fEry1/JYVny
 J0ievpBP7eH0wFfVgQfrvdZ7ELQcxRkqtObyH5utRUwFk31N0FETLAcv6jn0JtFzUsxqvdphskL
 7DArLFesqlbNQLhWOiPtAsZFN47nqXo/vQgt2611M=
X-Received: by 2002:a17:902:e790:b0:2bd:a5e:4c66 with SMTP id
 d9443c01a7336-2c1e823b3ebmr7536425ad.14.1780616933926; 
 Thu, 04 Jun 2026 16:48:53 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664950aesm66541465ad.69.2026.06.04.16.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:48:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/25] target/arm: Implement FEAT_SVE2p2
Date: Thu,  4 Jun 2026 16:48:27 -0700
Message-ID: <20260604234852.573178-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Based-on: 20260603032855.106930-1-richard.henderson@linaro.org
("[PATCH v9 00/45] target/arm: Implement FEAT_FP8")

Another batch of code on the way toward FEAT_SME2p2.


r~


Richard Henderson (25):
  target/arm: Add feature predicates for SVE2.2 and SME2.2
  target/arm: Rename sve unary predicated patterns
  target/arm: Enable zeroing in DO_ZPZ macros in sve_helper.c
  target/arm: Expand DO_ZPZ in translate-sve.c
  target/arm: Implement SVE integer unary operations (predicated,
    zeroing)
  target/arm: Implement SVE bitwise unary operations (predicated,
    zeroing)
  target/arm: Implement SVE reverse within elements (zeroing)
  target/arm: Implement SVE reverse doublewords (zeroing)
  target/arm: Implement SVE2 integer unary operations (predicated,
    zeroing)
  target/arm: Add data argument to do_frint_mode
  target/arm: Implement Floating-point round to integral value
    (predicated, zeroing)
  target/arm: Implement Floating-point convert (predicated, zeroing)
  target/arm: Implement Floating-point square root (predicated, zeroing)
  target/arm: Implement SCVTF, UCVTF (predicated, zeroing)
  target/arm: Implement FRINT{32,64}{X,Z}
  target/arm: Enable zeroing in DO_FCVT{N,L}T macros in sve_helper.c
  target/arm: Implement SVE floating-point convert (top, predicated,
    zeroing)
  target/arm: Implement floating-point log and convert to integer
    (zeroing)
  target/arm: Implement EXPAND
  target/arm: Generalize sve_compact_[sd]
  target/arm: Implement COMPACT for byte/halfword
  target/arm: Implement FIRSTP, LASTP
  target/arm: Enable FEAT_SVE2p2 for -cpu max
  target/arm: Implement FEAT_SSVE_AES
  target/arm: Use expand_pred_N for helper_sve_not_zpz_N

 target/arm/cpu-features.h        |  22 +-
 target/arm/tcg/helper-sve-defs.h |  19 +
 linux-user/aarch64/elfload.c     |   2 +
 target/arm/tcg/cpu64.c           |   3 +-
 target/arm/tcg/sve_helper.c      | 184 ++++++++--
 target/arm/tcg/translate-sve.c   | 576 ++++++++++++++++++++++++-------
 docs/system/arm/emulation.rst    |   2 +
 target/arm/tcg/sve.decode        | 267 +++++++++-----
 8 files changed, 841 insertions(+), 234 deletions(-)

-- 
2.43.0


