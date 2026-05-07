Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310B2CD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 19:48:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL4hm-0002pq-Rn; Thu, 07 May 2026 15:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wL4h9-0002kp-99
 for qemu-arm@nongnu.org; Thu, 07 May 2026 15:47:41 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wL4h5-000685-1k
 for qemu-arm@nongnu.org; Thu, 07 May 2026 15:47:36 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488ba840146so11455455e9.1
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 12:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778183250; x=1778788050; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x7QcIv9mPbYZ5I0wIG6iF/4vSbCk6U200D9ymfA5eZY=;
 b=ZHLPDDfIfUjL8wIeqqrWu6I7D0SJzlI5gGYNNP0k/rrRKehVuOWK9NVJz14LppNJqM
 urkaowK+Oc1j1rGb6+UZtHQqqhDeWk7gNExLbUUf1ssd31Ay8uug6dXLpJY904ZpSHPO
 h8vD8Bpg/GyUrp1lHctZ5JPPA2RuHpVmpkgf6M9eXW4DuDhq0H3RuEjFI1QL7nq8RA9p
 sNx0RoGKf2vUyvkhBh2EFU7B8UCixzlQ2MaeYiFQzBicoQ8duT0Ha0De/TlGRuaJEiGk
 SZJLQcTFYjBXIw6deyvRCBVA9q7VRaCVnOqgRxZpMPknssZ8gggWSBbYmIgMcQCtrQNR
 I/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778183250; x=1778788050;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x7QcIv9mPbYZ5I0wIG6iF/4vSbCk6U200D9ymfA5eZY=;
 b=BOtI/y9O8RBhoMpq2tEGkMGrmL7rcOeoaeY2kMk+JBF9mOTW4RA5x8y44YQmXWnu/5
 Ywg3C2K/HCaJngZa4UKbTocfGOKZNaF5hTsZ1CX1IzJwLPcDJon9cYk4VHXJEqLQPfSd
 /rOleTofdWM+91ycMEICNMfMQ8lS45XTpBibMPi42Rm/7zc/0hiaL135lHgolbxVho6v
 sV8V4lcUOee+k+zhwvIS8rC36rhMbw6tX2X3hKxEyjKol+ICD6eBdEaumJyDW2fbR2QE
 7ERjd/CJuKVjKe3fOIuMCpMZe6oizQJVTqEik6ZOsJkvp0qF26qA+mpfUc281gkPC7MO
 xK5Q==
X-Gm-Message-State: AOJu0YxUmioevDXYeeBWlINWdJ4aCss1pQsOuiHzdSGGSpQ3ubOJWx9X
 RKigk4YKtW7iYoSepLA/yhnIePPT3NpeetOCo5REblCH7piHHdTSz3q0zEZAiTJ8Z5xEDHlwfwf
 ERx31
X-Gm-Gg: AeBDieuX0d88sbP/TSS68a6BWJ3HZK6jYy/iovOJl1k+qwTeakfkMNK+bKJw8K9+iJR
 eKg06CNfCC848wWqP9sixwLPEytUs7mA6ITDkCUumCYZrjX9ZW/OEv8YyAD9v+Oz62DjOF9cXTG
 gOy6hsfgCTxlirYfTY1Pvu4YRw//nyLpo9EV+GIwlfH+0fvlNr9mg7Nr6FyNy/yUKgAEcAcZj3q
 h9h2BkIgzhOsk3ZZTMJFSG+rzHOjpE5/iovyNAuNJLgyEknOxmWtaUpw/iaRhjvCOiOvBuuIWF6
 nXGUlOztQNNLt2R6sY59fGAH0imHjw2Dnl/5MmaYv1YFK1iwuCNbfcK/XV11HmP43DX20VrFNIs
 wkQaiMr1i2ORHnSpNWSdFX1bmcaCHSHGieFJh2XooFoZu0zkn6rfIjEuH76r1v0QOfuYrWYcD6y
 hc/IMSRAwmlLA1hqGAUotHE1ol7+a5SHdOORtuKor3tkOwSDpBAa3QHa06tuX6spl3QkDjatr2B
 1F2b3QMR0ihc7zHGzji0g7rsbFV3zJxSY28AZYo9A==
X-Received: by 2002:a05:600c:8b0c:b0:48a:7a10:4f47 with SMTP id
 5b1f17b1804b1-48e51e0a620mr158685105e9.3.1778183250328; 
 Thu, 07 May 2026 12:47:30 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e65c145aasm958375e9.25.2026.05.07.12.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 12:47:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 0/6] target/arm: Fix functional test failures in KVM-only
 builds
Date: Thu,  7 May 2026 20:47:22 +0100
Message-ID: <20260507194728.2034696-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

If you build QEMU with --disable-tcg on an AArch64 system, some of the
"make check-functional" tests fail. This patchset fixes them.

The first patch fixes a bug in QEMU proper, where we broke the
"x-remote" machine because we forgot to mark it up as being
OK to expose in the qemu-system-arm and qemu-system-aarch64
binaries, the way we do for "none" and for all the actual Arm
machine types.

The rest are tweaks to the tests:
 * tests that run '-machine virt,virtualization=on' need to
   check for failure because the machine reports that the hypervisor
   can't support nested virt
 * tests that use a specific CPU type need to either be
   restricted to TCG-only, or else changed to use 'max' instead
   (since that's the only CPU that will work on both TCG and KVM)

thanks
-- PMM

Peter Maydell (6):
  hw/remote/machine.c: Mark x-remote machine as OK for AArch64 and
    AArch32
  tests/functional/test_virt_vbsa: Skip UEFI test if virtualization not
    supported
  tests/functional/test_kvm.py: Use -cpu max, not cortex-a72
  tests/functional/test_kvm.py: Skip if virtualization not supported
  tests/functional/test_hotplug_pci.py: Require TCG
  tests/functional/test_tuxrun: Restrict to TCG

 hw/remote/machine.c                          |  3 +++
 tests/functional/aarch64/test_hotplug_pci.py |  1 +
 tests/functional/aarch64/test_kvm.py         | 12 ++++++++++--
 tests/functional/aarch64/test_tuxrun.py      |  2 ++
 tests/functional/aarch64/test_virt_vbsa.py   | 10 +++++++++-
 5 files changed, 25 insertions(+), 3 deletions(-)

-- 
2.43.0


