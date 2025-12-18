Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD38BD6E2CC
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Dec 2025 18:19:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWIaJ-0006OM-IF; Thu, 18 Dec 2025 13:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWIZy-0006NI-Ho
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 13:18:25 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWIZs-0002xQ-Jp
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 13:18:20 -0500
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so6105025e9.2
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 10:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766081894; x=1766686694; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dw4q2naf2RC86eEOqnqVmtV2ZylVV7dCJMCaQlNiUTI=;
 b=WTElRp1LJ+wUfftgpajnndb1Q6hyDi8gXhatIXsV4Xxr53xuIVdQasX/d9TILlf6DG
 RD3MrauZP04VUvyLANb2NxacKZocnLeYfQ4eCfEH3SYA77S0ShTWuSQw0/iAE+z1CK6l
 k9TlGbNxGJlw++IfuMsx+f9kbQPwpsyuU5Qxi4wgPjcU5eF1UYxnccpxWs1+p2/H4RoJ
 MC0KvVrkXZMmpWuJCtWeQacES5SJ4hm6p6hWJt2L/dCteREO0RsvnFyI0g1zcVo61tYY
 b3FRAO6zIeHcgiFEFDqR70yxePbvE5buZoKHN4iB/6zIDzLg8gEkRAPckJXAUvcXAs1V
 M0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766081894; x=1766686694;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dw4q2naf2RC86eEOqnqVmtV2ZylVV7dCJMCaQlNiUTI=;
 b=gGJcxF0qTxjOTSvh9cV0dqtNaausX/2VA6emSizkAIEkPiJY2vDBRPlHlYyFj2LF6W
 UlzyWAVFl1sWI9Xdd3at+4Pcd44E35RNP8s5fCn/LqiLf1xJFp9RadblrWzL6yqOjDQS
 UxbUFHSL2hSZGCMs1ScPErkSk6Ns9RoRmKavi9NPMf2F5EGyEyBqN7In9FsbAlo6bQIW
 ngiDs6LmJ+V50FxlYsjKGV/o+Ay2ucbE/j6T8xo3ajEAlpRqGFZbZpExkm7IRZAnJvTs
 ueCDV2ExEU4mmcueb21OSUavnByK9gzAzbUGoEjD0rIVqAqlQHeX2+aS9Rwis/ITRsVR
 7ung==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNwX/4ArO8YMSWupmz50qQHJWExDUGHGdUi7kMD4giATumLHSjlLvfNiec33i1CfNM3z4Rh9U0oA==@nongnu.org
X-Gm-Message-State: AOJu0YxeKvIIoWKXSJRGXGPPre0n8zIIVX6LKSwrjqIigifMAjrPfqw+
 Lv1E3bpWPgCSbeRZAS5QBjLm5go8eIkFzDBLSqRRe2vWuxM3Zf7El1o2Ai1m6PXb9qA=
X-Gm-Gg: AY/fxX7Lmo+db2jLjh/s2NRfeqa72LHtsbrEtuOUZ0Km4SPc2NjF/QmZBNodkL3BdmW
 oIMuK6hy1CZ/u2v7TKOfm/2EDRi7OIlK5qfVK6LmoPlKkndN5+63s1RtfoxK9fVM7QUwqLT6RfD
 UZBwwmXDTA71NqbR3Zit/oMTi2iTfNsfYJe0S6ktTlvaXeb0PEe/DfSmmjfmq68qAaaLetXdx9D
 A4sd+0EF46bF3fOXj3tfDT9/89aqyI19pKSE2rDk76fCau2wBQ6FB8wtB4KAvgUFBfbtE+mQ6Gc
 gYRaLtw4UdfYZX3by2Z8WYPCuMaJdSiB84BBAG/KwGaBy7RUz3PqH6BBOK5LNKVpEKtTKXmENeP
 L+W9ftifCBvZmraIa4ar6Yka+gTyAL08gR681hDYm++Olac0GAVNrlPtKfK5Y/rtJnDSt40cedx
 pPJPgREbmm7VaZPLtgBwz5RpDgjKDyFI3E/I92+3eNK6UDPl9K3tr6X9kDZNUa
X-Google-Smtp-Source: AGHT+IFt3I/PPxUr2BEmKrZ7ygpqyt2KZOxFv9uczbyIybgLHrJfKrapY8KpeMlDkyMUJ89/CJOvFA==
X-Received: by 2002:a05:600c:3b9d:b0:459:db7b:988e with SMTP id
 5b1f17b1804b1-47d19555e07mr1067575e9.13.1766081894494; 
 Thu, 18 Dec 2025 10:18:14 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa64cesm200859f8f.35.2025.12.18.10.18.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 18 Dec 2025 10:18:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-rust@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/6] hw: Preparatory cleanups previous to remove
 DEVICE_NATIVE_ENDIAN
Date: Thu, 18 Dec 2025 19:18:05 +0100
Message-ID: <20251218181812.58363-1-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x342.google.com
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

We want to remove the bogus DEVICE_NATIVE_ENDIAN definition,
by making it explicit (either big or little).

I'll follow with one series for each architecture. These
devices seem used by more than one, so I took them apart.

Also remove from rust API ASAP.

Philippe Mathieu-Daudé (6):
  hw/char/serial: Let compiler pick serial_mm_ops[] array length
  hw/net/opencores: Clarify MMIO read/write handlers expect 32-bit
    access
  hw/display/ati: Access host memory as little-endian
  hw/timer/hpet: Mark implementation as being little-endian
  hw/char/pl011: Mark implementation as being little-endian
  rust/system: Stop exposing bogus DEVICE_NATIVE_ENDIAN symbol

 hw/char/pl011.c                  |  2 +-
 hw/char/serial-mm.c              |  2 +-
 hw/display/ati_2d.c              |  2 +-
 hw/net/opencores_eth.c           | 15 +++++++++------
 hw/timer/hpet.c                  |  2 +-
 rust/hw/char/pl011/src/device.rs |  2 +-
 rust/hw/timer/hpet/src/device.rs |  2 +-
 rust/system/src/memory.rs        |  6 ------
 8 files changed, 15 insertions(+), 18 deletions(-)

-- 
2.52.0


