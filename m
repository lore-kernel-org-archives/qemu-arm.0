Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315B7CD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 13:48:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKz4N-0007o5-Rl; Thu, 07 May 2026 09:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wKz4M-0007no-L8
 for qemu-arm@nongnu.org; Thu, 07 May 2026 09:47:14 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wKz4L-0004RU-54
 for qemu-arm@nongnu.org; Thu, 07 May 2026 09:47:14 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so5667815e9.3
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 06:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778161631; x=1778766431; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OYM0ceOmVLY8micd18GQNUk/LrS4y/oDCZHHn4KjKz8=;
 b=deyZQISmYG/MvfXpSsi32f5C6WjmufTID552UcZXp5cudykPK54HrNpz31+f31PoxL
 vagesHwM2EM4oOTwTJm07NXfzRS+o1MZqw/QnjIJP1RDx91CRBg/mT2Fp1eZGOV+L+Dj
 TRJqcaCSAkjrw9XRZPzXPt6EV4qwSz3jopbDfjcZsO3/NOeFTDK1NYi7Tb0ODYxstFQD
 WblKdibuyqolXXTaZ+empyiDqDX2CH9wRoDAR7asH3nm4B8joiMG2DxjihJsI2NNYtZL
 7q9ZNNHPpWdVUwXF0YTILAq2+F3W8kATx1d6xx5KvfxPjR1R1oKgpB80MC+pXXYSyZpb
 LwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778161631; x=1778766431;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OYM0ceOmVLY8micd18GQNUk/LrS4y/oDCZHHn4KjKz8=;
 b=SQ6QGH/FGdwRJyeYpHWEscv/MdM0qA/knkjaXYb748xMBtu7I8zk276hnukmbfzJFW
 C974VGlKF1C7pb3/43DeIbLiyMbFUCdvjM1YP70+xpoptVk10IDDSQhPL3iKyMZ45u5T
 iu3cHhOEU8cVTOE+MSp9ZxOLEzLTlqcE/UWWwBBtS7ZtKD+P8jM/FggYZrG1M4tt6pvg
 6q9uEqbi7c2Kyyf9LMQL//qkldxYIi2xhRmtCatPifjBsFCx6TMbZz4KrYE1oHq0OXRs
 c9bL/ruMbJ9SWmuZu79ozpAnPsoLI7AFE2zoMriINXCIbC6+7u1DkRMnwR2gdcN76rDM
 Wtlg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/CAoxyw5Q3ZFRE15QDmS3LFRhYi08LO6T/l/wy/mqAOB0e5bhnNH1/GbyPFo3NNgxARyMOr6Xygw==@nongnu.org
X-Gm-Message-State: AOJu0YzV8p5+I4q0nf8Lm/miOxjFCT+PE4iQpT4fIS+IESuVRrmqdm4D
 0vOMkx00txUj+l8ZLB13OlRhBSYucTt4SklsGrT0vEjhuPiR/PAutF8dJ3wQr+Ix3P0+g1E1Wpa
 7MQHbsmA=
X-Gm-Gg: AeBDievnly+kvQN0SpUD2QmY1jzCCqzGlirTA1gL9EWV+iDBDZkxGdpqh6/52X6+s/Z
 wdf/T4UZ+RImmm+6TULcJzFiNZFePUn10Atj8xcxLqbdaU6H4hW7lg/Egr35xZ8y5pFythOi/kB
 SV3Fku/OwR/ZJqsW1qS21BPqQd/H+r3QBbv3GOwyOWly9uf0oQW1CZB3sintmWPNj/jl+dr1ZDw
 /yVlUWIXUHnWc5UnhaLcgtKc2WyaLfFN1mdcFUXdElWq3PlGGlFFvYubpqY1RvdtZBLS9Uca/SC
 HSKSKruMTWKYb+V+lPghNc/Y9rGfkjtCcmQShErkEh1ZOtAeewO0nF3TeBs93q/y8wAv450iTmp
 GdijuVVg7l+KDCUcK9zkh2uCOPpbccOeufUTcqBkJPQkRN6q09sU6puN8LdPXrzL+kAfLuK7io2
 SgU5NxtZZCjlH3gmkQXhF6qcy8IIgdRPnWDtZmIMDVacE+EGmCvsw+zVcsrQaJ/R7icSSO5PNtq
 2i0xypO4zQ=
X-Received: by 2002:a05:600c:3f18:b0:48e:5990:9698 with SMTP id
 5b1f17b1804b1-48e5990978bmr88364155e9.24.1778161631254; 
 Thu, 07 May 2026 06:47:11 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e538aaa0fsm153929075e9.7.2026.05.07.06.47.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 07 May 2026 06:47:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] target/arm: Extract IDAU interface to its own unit
Date: Thu,  7 May 2026 15:47:07 +0200
Message-ID: <20260507134709.70507-1-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Trivial series moving TYPE_IDAU_INTERFACE to its
own unit, and moving its header under the tcg/ namespace.

Philippe Mathieu-Daudé (2):
  target/arm: Rename Aarch64-specific methods
  target/arm: Extract IDAU interface to its own unit

 include/hw/arm/armv7m.h     |  2 +-
 include/hw/misc/tz-msc.h    |  2 +-
 target/arm/internals.h      |  8 ++++----
 target/arm/{ => tcg}/idau.h |  0
 hw/arm/armv7m.c             |  2 +-
 target/arm/cpu.c            | 10 +++++-----
 target/arm/cpu32-stubs.c    |  8 ++++----
 target/arm/cpu64.c          | 12 ++++++------
 target/arm/ptw.c            |  2 +-
 target/arm/tcg/cpu32.c      |  8 --------
 target/arm/tcg/idau.c       | 20 ++++++++++++++++++++
 target/arm/tcg/meson.build  |  1 +
 12 files changed, 44 insertions(+), 31 deletions(-)
 rename target/arm/{ => tcg}/idau.h (100%)
 create mode 100644 target/arm/tcg/idau.c

-- 
2.53.0


