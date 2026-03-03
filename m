Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B33EDEBFC
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 22:24:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxY7z-0004eu-Bc; Tue, 03 Mar 2026 17:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxY7x-0004dj-CL
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 17:22:05 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxY7v-0002O4-PS
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 17:22:05 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so58239175e9.1
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 14:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772576522; x=1773181322; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hBAYrBu5b5PV8VflOnfTcSZipRKS1V1YBjEH3RbRbGc=;
 b=JciQsJsb8xslfaiT8seiwC9ue19rlE8HeQBppqBOEkOfXt4HNwvgubLCVrhdpOrvsU
 oR269gjZnRrX4PGSTeio85omNGQaeB7x6BYUJPz0Ckt7uxDGVx8DaAlQggn8Vwdq+gSS
 Ec44saSUz9vwlFJeegmenMX2YH6d24hU+iOnkJ3w+FwPGn/z6G021Qi/G0pxejk9v8xf
 QI5sJ2eBn90XqhX8hsmQ64TtsaeHLbYVP78CQ3TYyr9GYIjPM+3m+iLMf3rL4ZjIMMOc
 xltoVYxBYXbu2+XMo4EYYos9l+vh1pynIDa/jjBl+yHu+Nzvv0lOCA3aWB9NsYRGLVZf
 zdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772576522; x=1773181322;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hBAYrBu5b5PV8VflOnfTcSZipRKS1V1YBjEH3RbRbGc=;
 b=SI1MOy/8QuGccWYVsEYExl3gFXxCdRBui/2BBfSU6Ay6+7J6NC1nmLJHaDuxZHnPj8
 9EqXBc0tqsfsyWCtoz0AaAn4mtYjxmfYaVETAkwWEpXXguwOLaYOx6S3Tv3JJsNot/Mh
 QC7UCnlvSCJBQnJJ2WMoK2uowO1n9Xl8aAqvMt6WYMGrNYtcg8Vke+gXNxCu0ridc6mJ
 yF6c4Hr8T+rU8A2pFC9nYBR6PIe5Jv1JVIQ4VVfoBuxnCTGV9ZvpdBsa9TcPOrgirQUM
 7sa2s3pgIWXlTQSqN/VHsVnopFwav5r1dVRcVshQhs04N+/xFzOVimzX9hTnFbRRV8N/
 TvjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNwrSQk7J4dL0VsJt83iDaLxSIqwnXNWCr1kYac4PszzS/pmv3tHTUUV+akTZ+yjstpBN6kBj5xA==@nongnu.org
X-Gm-Message-State: AOJu0YyPHjzoZ/13h0DqQaFuR2DXbYVMxjxRBV/R5SlumrZ2s5JU0JHV
 CLXRZbwnn5b2ABV7jJWowG9Z3M/8h2gTGBGPKJI9WHV5zPw5T1iWKFPc
X-Gm-Gg: ATEYQzxR4ToVzWIAGeLFX+RPc8kmgoUVL0k8ed0oJiaq9O70LmAaqr7iF/hUe4M6u6d
 2MmfY7qXfo1ZBb8Lc+tS4V2QhYl/6zPxgS8+uPZy71MarLWHBFkYl3iAlNlxEHAr/S1mxLvE32O
 RrdMgX9sfdVMeJOeuSkz/v2vDqjsV8z65Yji29Yk2luUMgJek7PNU0MY2RJSui+2dTbZJGTdgur
 5P++g0iTt7TX2XCx29+pfJMEKoQAidocER3uREQJ29GXQLl1tWBJjq2NpDZwzjjyzwNomGDvTDq
 SAZI71EjZSpTyF0itYPcUOfuvfx5/Z5plWZR4AlRk1AVLnwOMyn5jmSMFHMy0Zmc7EO5RYzEgp/
 YK0CPsUPZbKS/Gs009dIk3hYq2FN+tQq1DpNV+9XT0rdGAKyBA8rVPzNxTLncNN5FOOoEs2rGWh
 ujaF8n1cocJE3AlGInoiofu+xJ2stVU5x5eLr6ktl2YO2noxEdz+8BJx6yuS5XVxApeshWucz4h
 wBxeavV1Y2z5VUcXkVuna/8s4EvJlA=
X-Received: by 2002:a05:600c:35c3:b0:47e:e2b8:66e6 with SMTP id
 5b1f17b1804b1-48513c752cbmr72537445e9.14.1772576521555; 
 Tue, 03 Mar 2026 14:22:01 -0800 (PST)
Received: from Provence
 (dynamic-2a02-3100-1c79-b600-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c79:b600:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485187c81adsm7577715e9.6.2026.03.03.14.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 14:22:01 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-arm@nongnu.org,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 00/13] TYPE_SERIAL cleanup
Date: Tue,  3 Mar 2026 23:21:30 +0100
Message-ID: <20260303222143.142741-1-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32f.google.com
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

This series consists of cosmetic changes around TYPE_SERIAL. The biggest change
is having it derive from TYPE_SYS_BUS_DEVICE which 1) eliminates usage of
qemu_{un,}register_reset() and 2) stops all its users from accessing private
data. The latter allows TYPE_SERIAL to be ported to Rust in the (near) future.

v2:
* Pick up R-b tags. Thanks!
* Ad patch to free consumers of TYPE_SERIAL from setting up MemoryRegionOps;
  configure via properties instead which should resolve odd code (Peter)
* Improve wording in one commit message (Peter)
* Sort patches by moving char/serial last
-> Keep "Avoid implicit conversion when tracing" untouched for now. Can be
  omitted if deemed inappropriate.

Testing done:
* Make check
* Boot mpc8544ds machine with Linux and interact with it on the serial console
* Boot q35 machine with Arch Linux and interact with it on the serial console

Bernhard Beschow (13):
  hw/arm/Kconfig: Fix serial selection for NPCM8XX
  hw/arm/aspeed_ast27x0-{ssp, tsp}: Do not access SerialMM internals
    directly
  util/fifo8: Make all read-only methods const-correct
  hw/char/serial: Remove explicit cast from void pointer
  hw/char/serial: Prefer fifo8 methods over open-coding
  hw/char/serial: Reuse fifo8_num_used()
  hw/char/serial: Remove stale comment
  hw/char/serial: Add constants for Line Control Register
  hw/char/serial: Remove redundant reset
  hw/char/serial: Avoid implicit conversion when tracing
  hw/char/serial: Keep MemoryRegionOps private
  hw/char/serial: Inherit from SysBusDevice
  hw/char/serial: Plug into reset framework

 include/hw/char/serial-mm.h |   3 -
 include/hw/char/serial.h    |   8 ++-
 include/qemu/fifo8.h        |  10 +--
 hw/arm/aspeed_ast27x0-ssp.c |   7 +-
 hw/arm/aspeed_ast27x0-tsp.c |   7 +-
 hw/char/diva-gsp.c          |  23 +++---
 hw/char/serial-isa.c        |  17 +++--
 hw/char/serial-mm.c         |  59 ++--------------
 hw/char/serial-pci-multi.c  |  23 +++---
 hw/char/serial-pci.c        |  11 ++-
 hw/char/serial.c            | 137 +++++++++++++++++++++++++-----------
 util/fifo8.c                |  10 +--
 hw/arm/Kconfig              |   2 +-
 hw/char/trace-events        |   4 +-
 14 files changed, 157 insertions(+), 164 deletions(-)

-- 
2.53.0


