Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3828CE8D6B
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 15:42:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vL1Mm-00082h-PB; Mon, 17 Nov 2025 10:42:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vL1Mf-0007zl-PX
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 10:42:02 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vL1Mc-00069N-La
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 10:42:00 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47758595eecso25067585e9.0
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 07:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763394116; x=1763998916; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xYeIl3mtcWUCJeVXRBw8qX4nIcjFSObNWJG++fEgW+4=;
 b=FM9jtyqi2CR1Jv5BldYrfS8W2sJJW673psLYvgT91w2cEstCf/IfN642rFZzGYGblO
 eHcYpnm7L4OfVUeGtTIW5FXwUMT5bZYcLJ+ONMqIb6UQ1vGdQNXQatcZjARwY3z3i/Al
 qWAIBISCbReFd8bR9AuQNEk2iqWvrcTH/4x9puKSWL3FvmpU7/vLFMCGOmFlRF831nym
 RBom90SD++Z8y0lnpgZeXgBJtwo6HFg3Y3iTZRQjS2x5HcuK67ktdqYT+2mXmScI3iSk
 rjvOBt0+ePfv9r8oOamRPwW3iEmItHQ6KtR8j3ydaKc1ByqKawOnTnqiilILpCw1eLRW
 I7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763394116; x=1763998916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xYeIl3mtcWUCJeVXRBw8qX4nIcjFSObNWJG++fEgW+4=;
 b=BJ5FMNGn8FZrJPa6K2L+hS+XIwL4WbIizTHLgN0xY7lt7USd4vyduHPp0RjyEihI6P
 Ks6BMeqmAS2yuZmCD4J+V0fKQ73tUWiOiVPuNW3GQXMqhzyuq84CktQ7ih5xc6j9FFk8
 qaEUJSL2EXqm7aVnIUxTJBKulAvdmjK03D7pOxKF4XzmYZpNLcqkNLUYUecJbf3u8gGm
 ObgQJ7aFxb8C0KdmVhCkbm/VzVbGF9TBPg8sEOgjI2CfP30/pT8sfO3XZ34+55hyYVpg
 /lKjf6WCKi0VaRXdDr2ytk92qEgfsysbWpO9ZMNV9aUSe07eyk3heROIR6UCcdA776eq
 B3Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsBBWinUft+bjrH+7M4ZL7XyDDnLtgWcatLSnPodKyRuWP2jLwhyI1apCsReOyAsLGelGmK7eTTg==@nongnu.org
X-Gm-Message-State: AOJu0YwNYeBPI/ytZR+vzNpkT2AJ2uLYy5/A+Ee1NDm+IeCtWSRVC7Io
 yotHwROlj1fegTjHLn6aeJdQhGWMPfjSsFTHx9H32vZIEtXw8sti3wFTewCiFHW1k3g=
X-Gm-Gg: ASbGncueVLXHVr4lVUYl64Wrsz5OQzJjKx1TteULcMsNAAYvrLTvVIBgT1lGsHklbFp
 ukSqiCKRNyPX3opBKo/GAXfBRuEpxeJz19edGc4u0dY6rWnVrOt18CmqFwxbZfd5PMoBNBa9ibW
 o+0BzWS0WBjHhlmG/ly7KOuGUA+x+/Cn1J3PJRDcwfa2pY6g9depQdpZFbn90xSaDbOgsHoorMw
 i1Xooi1pxvOVDx9hqZPvJpuOc/0+gw7d5EizifL/IIUxMKRJ3rsws95HyffM4GRvUP/aPmXzXW2
 nZAoO59jJrpQZRcte5+eCoFGVlUrLFnQVjyZsY/m0PJWFh/ipQtof/viy5UA3I+XvzT2MyWSSSu
 5a6DRG8TymrnJ/fv9NUESaKDqjj38tZRNl4AeEB1venTC13VxXkSZYvWBV6zGPPGwiJQHYMIsLQ
 kzm+khstecFm6P4+SZT/JtsBHnfqPYqGhojn0bnRqslA4kO7SI/A==
X-Google-Smtp-Source: AGHT+IHAIFOWTLVJ0JjdatGPqaRU28JD/MLlFroeORzmoKsKYRcTfVUHjfkhYhIhD/a5PvOqOPH9wA==
X-Received: by 2002:a05:6000:64a:b0:42b:47da:c318 with SMTP id
 ffacd0b85a97d-42b593737d4mr10604706f8f.52.1763394116571; 
 Mon, 17 Nov 2025 07:41:56 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42c97745f79sm12620833f8f.23.2025.11.17.07.41.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 17 Nov 2025 07:41:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH-for-10.2 0/2] tcg: Remove support for 32-bit arm hosts
Date: Mon, 17 Nov 2025 16:41:52 +0100
Message-ID: <20251117154154.79090-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

32-bit hosts are deprecated since QEMU v10.0.0; we already
removed support for MIPS and PPC hosts. Time for ARM removal.

Based-on: <20251117140420.62193-1-philmd@linaro.org>
          "roms: Do not try to build EDK2 for 32-bit ARM on Fedora"
Based-on: <20251117153756.78830-1-philmd@linaro.org>
          "docs: Mention 32-bit PPC host as removed"

Philippe Mathieu-Daudé (2):
  gitlab: Stop cross-testing for 32-bit ARM hosts
  buildsys: Remove support for 32-bit ARM hosts

 MAINTAINERS                                   |    6 -
 docs/about/removed-features.rst               |    4 +-
 configure                                     |   39 -
 meson.build                                   |    5 +-
 linux-user/include/host/arm/host-signal.h     |   43 -
 tcg/arm/tcg-target-con-set.h                  |   47 -
 tcg/arm/tcg-target-con-str.h                  |   26 -
 tcg/arm/tcg-target-has.h                      |   73 -
 tcg/arm/tcg-target-mo.h                       |   13 -
 tcg/arm/tcg-target-reg-bits.h                 |   12 -
 tcg/arm/tcg-target.h                          |   73 -
 tcg/arm/tcg-target-opc.h.inc                  |   16 -
 tcg/arm/tcg-target.c.inc                      | 3489 -----------------
 .gitlab-ci.d/container-cross.yml              |    6 -
 .gitlab-ci.d/crossbuilds.yml                  |    7 -
 common-user/host/arm/safe-syscall.inc.S       |  108 -
 python/qemu/utils/accel.py                    |    1 -
 roms/edk2-build.py                            |    4 -
 .../dockerfiles/debian-armhf-cross.docker     |  188 -
 tests/docker/dockerfiles/debian-bootstrap.pre |    5 +-
 tests/lcitool/refresh                         |    5 -
 21 files changed, 4 insertions(+), 4166 deletions(-)
 delete mode 100644 linux-user/include/host/arm/host-signal.h
 delete mode 100644 tcg/arm/tcg-target-con-set.h
 delete mode 100644 tcg/arm/tcg-target-con-str.h
 delete mode 100644 tcg/arm/tcg-target-has.h
 delete mode 100644 tcg/arm/tcg-target-mo.h
 delete mode 100644 tcg/arm/tcg-target-reg-bits.h
 delete mode 100644 tcg/arm/tcg-target.h
 delete mode 100644 tcg/arm/tcg-target-opc.h.inc
 delete mode 100644 tcg/arm/tcg-target.c.inc
 delete mode 100644 common-user/host/arm/safe-syscall.inc.S
 delete mode 100644 tests/docker/dockerfiles/debian-armhf-cross.docker

-- 
2.51.0


