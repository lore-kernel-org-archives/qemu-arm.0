Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BF7CA0FF7
	for <qemu-arm@archiver.kernel.org>; Thu, 28 Aug 2025 14:07:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1urdH3-0004eX-TK; Thu, 28 Aug 2025 10:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1urdEs-0003nf-IR
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 10:04:30 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1urdEq-0002sq-KY
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 10:04:30 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3c73d3ebff0so967076f8f.1
 for <qemu-arm@nongnu.org>; Thu, 28 Aug 2025 07:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756389866; x=1756994666; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=xiVFollxZQsjCjMToco6G/qNjvqu856G5dlynEUOU+U=;
 b=IWSPn4l5M/asjtjt1ZRa5dXEp5do8YBfSYEixfPWujXSJ3LpJnPhIjYEQdBdcEqj2v
 ud+WY1MIFu0BX4PFk7GKhw79rHPPk/VgWGw62QIJXnk6hlvbYH7yTxwkHhFzOzL1/EiG
 umcbtS8EM/Ec/cyKyNSHDpDnZuboRUgB/p1Wra1Kb69hzZpSDenjddnUrF6rOl8u0CxG
 DA6NzcvqG5+JUSh8gfUOPyZBEK+3RAsC6GiGQun7lMMK29iEIDRtZX0KSIQmkPap0VrE
 sjzSZDbO83SQIxIleAq8QyK8vZBaR9l7GgcNs1tgn5cZQSCdTpfS/n0T+EPDwE9rallZ
 m+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756389866; x=1756994666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xiVFollxZQsjCjMToco6G/qNjvqu856G5dlynEUOU+U=;
 b=PSeinEzx0xC9ROqgAM5+uqpM36iqB5Hpy6NU/o1q2Xg4shksOxVjy8521veTzMhelz
 3TFIjHEdrsUPrpk/i5WEizXSwINJ4W6kCZLKJL5f0di5SiDPdFAZE4j1FsVJRfk7gFWQ
 TXAjAzIhZUJYm1uADhq3nUqeo0kaEKYJJAVDU074Gb8xBRyqStepzl8dXtyZhQn6tQwG
 6r6A3sdYvcyRkALPLtnq0v9T4M81/v7bhVEbFkCYdybvHKpmfV7PqPjyiylwUICLdDj5
 CYYCsfQi2o0PQdqUGQWDWcAD0VLZUm2HPMmIeCyoWz8Co6MVDOSyxof0CFjJD3Apb3bn
 URbQ==
X-Gm-Message-State: AOJu0Yz9lJPYy99cIxueNfl0TNNIvZsr0Sks+08T1wsd4IvA0e9nbbDP
 hSvKjnlCT6Pd+dWbtmNk0R63UVT9Nx9jLTQKAzRa5bk2ojeILkfQ4kVRtbseayawfVBZdo3u8/O
 FbKOo
X-Gm-Gg: ASbGncv50KmQLrqmklgKQBaStQ+Neu9QcMpMi3LfdHQ+a4hnyEsJWCL/4sjPIZHw5tg
 r2t2S1reVBwdYVu6jGQB1SsG0De4sH6eVs4Ka81csvxQOCDnzlHi6FHEaEooiB+Daur5TezRC+a
 htkQ589WIE9z0nMjsdwjM2FlwgLZmSa+wH7DH4/zR8jqGwGQdbmfop6RAyC/CZ4Qad9M37BKfNm
 /o1TUwQPE8sERqLZsA5dUEI8fJaQfEi1C07s3Hq44c4vPnGtbcs6MQDPZNUoVHsESSLzaQknLrt
 ZaNbg/5xhXxoP8m0hIORIPg6Q89c/Mm4pwq2JTWuRc/ATXAJOvlQguyY2CCCDYqYuWvzN+jBT0r
 7eh1rMQUoooN+bzF496/Pqbjaxt/t5Oks/gd+9Wk=
X-Google-Smtp-Source: AGHT+IFAuZ0C8W9SFx4jySCnTtuGz/UubGW04BAXDycKs6v5amvzcGAP0AHC3KC2utSZI6S+naHbkw==
X-Received: by 2002:a05:6000:2485:b0:3b7:9703:d99f with SMTP id
 ffacd0b85a97d-3cbb15ca058mr8022648f8f.27.1756389865486; 
 Thu, 28 Aug 2025 07:04:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cce1724939sm6947712f8f.26.2025.08.28.07.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 07:04:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/5] target/arm: Remove deprecated pxa CPUs and xscale/iwmmxt
 code
Date: Thu, 28 Aug 2025 15:04:17 +0100
Message-ID: <20250828140422.3271703-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

This patchset removes the pxa* CPU family, which we deprecated for
the 10.0 release and can now drop in 10.2.  The diffstat should
illustrate the motivation for the deprecation: it lets us delete
thousands of lines of xscale/iwmmxt specific emulation code which we
don't think anybody was using, which was unmaintained and which we
had no test coverage for.

thanks
-- PMM

Peter Maydell (5):
  target/arm: Remove deprecated pxa CPU family
  target/arm: Remove XScale and iWMMXt translate.c code
  target/arm: Remove iwmmxt helper functions
  target/arm: Drop ARM_FEATURE_XSCALE handling
  target/arm: Drop ARM_FEATURE_IWMMXT handling

 docs/about/deprecated.rst       |   21 -
 docs/about/removed-features.rst |   14 +
 bsd-user/arm/target_arch_elf.h  |    1 -
 target/arm/cpu.h                |   29 -
 target/arm/tcg/helper.h         |   95 ---
 target/arm/tcg/translate.h      |    2 -
 linux-user/arm/elfload.c        |    1 -
 linux-user/arm/signal.c         |   67 --
 target/arm/cpu.c                |   21 -
 target/arm/helper.c             |   54 --
 target/arm/machine.c            |   21 -
 target/arm/ptw.c                |    7 +-
 target/arm/tcg/cpu32.c          |  163 ----
 target/arm/tcg/hflags.c         |   13 +-
 target/arm/tcg/iwmmxt_helper.c  |  672 ----------------
 target/arm/tcg/op_helper.c      |    6 -
 target/arm/tcg/translate.c      | 1324 +------------------------------
 target/arm/tcg/meson.build      |    2 -
 18 files changed, 24 insertions(+), 2489 deletions(-)
 delete mode 100644 target/arm/tcg/iwmmxt_helper.c

-- 
2.43.0


