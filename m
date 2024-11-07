Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3910285njc;
        Wed, 6 Nov 2024 17:23:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVDlR7cwWk5HkEx0JK/FcU9VtyudBl8+oEG7KpinLNcvsH1j40Qduwm/mdRXq6RYKkaiFOgY890iWVEyA==@linaro.org
X-Google-Smtp-Source: AGHT+IFielanH2jzKcOARkOxGneykXbnW5p8Wkl6Rq1Rih/mqP6GIswNgE9HjLyQNeP4Rnvu0gSX
X-Received: by 2002:a05:6102:3593:b0:4a5:b29f:34f with SMTP id ada2fe7eead31-4aad3c7b3edmr405659137.26.1730942604361;
        Wed, 06 Nov 2024 17:23:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730942604; cv=none;
        d=google.com; s=arc-20240605;
        b=Wpm0P5IEX5e+WWwKCm808a4t6df9uSJqMgY+t+JVImV8H+OBczQFp28yoKbudU+cU1
         iNvUiGOzskUIXsrRetIicsn+zpWXzOiAfRJSGYt0+k65R/GwkQz1nOiPLswI3DEKlZib
         X0AWp+8r0bQquqk+QSJgn4Pz6RZmoCME1v9PL1NodBuESrHjzAj+qS9PAYautrf8So6u
         Qv1CP9NyVFXmLJT3muuDSs/OVwEf9SUMGaJBYUm86JqOKcCHu0jLAYpLvqVxhe8YtcMC
         sqjzBDRd6EV1P5tFeGmjScLFjLxbzAqMV76/SQegN/Q/uvEcUT3VzMtm6mdQ9b/LOeqA
         5mew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=wdhQZu/6S1S85GJh6bxZsUcTXLrcn3y3RRI1Gj4BARU=;
        fh=K2TtO+UW+uiHSR/mtxY3YR+2Gm/2KPUcTs+4ckKcfJY=;
        b=WoWIHi5nEg2so2RhFByzKj/Qu5/MjFsZkw8nsTu18HdoKLodXIGxTasc7AQKCb9wSl
         W7lI8jjeHebI0AaDi79J1SIvisb7e42ZUFEzxkfGo4m6Via9UwReQ6gHMpYwJPCYhXtV
         2G8x53M7oOF4fLUux2r3ltvXX3wTIelEVu03cVNT6p3RhPmSzUD6GuIwZL+bVepzvZPP
         QzgAv+8sSLTTrKzeypBkmRXIKtKhh7e4e1Ck2OolIeizvRM9VCcmaGn2VBucjUdx5/A9
         ELSGb3Psna8mv7KTKmQvfX0dXTzxlLLPpZZMWUH65cQCCS6UBRfnzd5ArGFcunAiVhM8
         XDkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XiEJbZxJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ac3d72esi44077385a.81.2024.11.06.17.23.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2024 17:23:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XiEJbZxJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8rEF-0004eL-OU; Wed, 06 Nov 2024 20:22:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rEE-0004dE-3d
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:22:30 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rEC-00030j-Fk
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:22:29 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4315e9e9642so3992665e9.0
 for <qemu-arm@nongnu.org>; Wed, 06 Nov 2024 17:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730942546; x=1731547346; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wdhQZu/6S1S85GJh6bxZsUcTXLrcn3y3RRI1Gj4BARU=;
 b=XiEJbZxJtId4yvVuXNED6r6MEo0apIjt9bEwu3eY1pW1wgWIIsEkFpt/Vx3BwRp9Td
 5xOaBa1X5yzvmHQgAAlY0rIZui87T+U8cCIcKCq7YozHk5KPBUNhnPdr7VVz7uNe2Hcb
 IN8SdDoXdfAaDerou0fGhNZoXAhj5uI4OoGAKExNJ3Q0QL/KpRRld+1DNcJ8petqdVsY
 gE668GC/uBd+TdiSL6Zq6bsdj/D64CoYzQxgr7BwgJiC8Ez7g5zHlA7GzLhHzJqH0ttm
 2AQzhHNgMBNSIoEFL3PrJnOUVIKfO//ZHrGZlwWM4L/5OqbadAzJeX+gbVBiMmHlUpK4
 L2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730942546; x=1731547346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wdhQZu/6S1S85GJh6bxZsUcTXLrcn3y3RRI1Gj4BARU=;
 b=dwux4DqAMAtZ97w0SQiiME4F6MrTtqCn+GeD2sPsB1tWiw83U5DKwTdFBsTAjTCLHx
 OWZf5I6gnIP7pgnGAmWNkO4rzPRJuF4+vdgb7uwJLLP+FFfiYdbbOT/H12YtLGjmznFJ
 Lnskp1QKFQmWQyC3Rb2L1CTq3f8gExK7NfgvI5foqfcmlz7/GQ23QCwv0RVxfGU4kJoc
 G4H4Wv4oTuS28DRhDcQVKDf3wybBg8aTY2njNaQs98DHKZVBCyJJDJpqZyhQVhSgsnoD
 Q2JBCDib9hmLhrWPRBnsDO44ickrvYxw8XP7iRpw8fDW0TgUiaQhjioDlHDVPhAAesZD
 fZYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWAWnofrKx0RG7OQMbNHnP2IHF0YCqbihuNVp73uq0sAMfeyq4DX6BHe8AFoYcAhgToIcQ2xjDww==@nongnu.org
X-Gm-Message-State: AOJu0YzNQaYvwqXAn1L9LPCc07TjDcZTKvZUaOvfyHWe9gCzI9VC+JLE
 iESByOmk0aJx/BneflucGXw7I5ogNP3wt3jj6DpUK5LuJAbuyxYNkk3gU+hfI/Q=
X-Received: by 2002:a05:600c:3b1b:b0:431:5aea:964 with SMTP id
 5b1f17b1804b1-432b14d23demr1445415e9.19.1730942545954; 
 Wed, 06 Nov 2024 17:22:25 -0800 (PST)
Received: from localhost.localdomain ([154.14.63.34])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa73886bsm41882585e9.39.2024.11.06.17.22.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 06 Nov 2024 17:22:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, devel@lists.libvirt.org,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/16] hw/microblaze: Allow running cross-endian vCPUs
Date: Thu,  7 Nov 2024 01:22:06 +0000
Message-ID: <20241107012223.94337-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: f3Fq4ZpntNvV

Since v1:
- Make device endianness configurable (Edgar)
- Convert more Xilinx devices
- Avoid preprocessor #if (Richard)
- Add R-b tags

Make machines endianness-agnostic, allowing to run a big-endian vCPU
on the little-endian 'qemu-system-microblazeel' binary, and a little
endian one on the big-endian 'qemu-system-microblaze' binary.

Tests added, following combinations covered:
- little-endian vCPU using little-endian binary (in-tree)
- little-endian vCPU using big-endian binary (new)
- big-endian vCPU using little-endian binary (new)
- big-endian vCPU using big-endian binary (in-tree)

To make a target endian-agnostic we need to remove the MO_TE uses.
In order to do that, we propagate the MemOp from earlier in the
call stack, or we extract it from the vCPU env (on MicroBlaze the
CPU endianness is exposed by the 'ENDI' bit).

Next step: Look at unifying binaries.

Please review,

Phil.

Philippe Mathieu-Daudé (16):
  hw/microblaze: Restrict MemoryRegionOps are implemented as 32-bit
  hw/microblaze: Propagate CPU endianness to microblaze_load_kernel()
  hw/intc/xilinx_intc: Make device endianness configurable
  RFC hw/net/xilinx_ethlite: Simplify by having configurable endianness
  RFC hw/timer/xilinx_timer: Allow down to 8-bit memory access
  hw/timer/xilinx_timer: Make device endianness configurable
  hw/char/xilinx_uartlite: Make device endianness configurable
  hw/ssi/xilinx_spi: Make device endianness configurable
  hw/ssi/xilinx_spips: Make device endianness configurable
  target/microblaze: Explode MO_TExx -> MO_TE | MO_xx
  target/microblaze: Set MO_TE once in do_load() / do_store()
  target/microblaze: Introduce mo_endian() helper
  target/microblaze: Consider endianness while translating code
  hw/microblaze: Support various endianness for s3adsp1800 machines
  tests/functional: Explicit endianness of microblaze assets
  tests/functional: Add microblaze cross-endianness tests

 hw/microblaze/boot.h                          |  4 +-
 include/hw/ssi/xilinx_spips.h                 |  1 +
 target/microblaze/cpu.h                       |  7 +++
 hw/arm/xilinx_zynq.c                          |  1 +
 hw/arm/xlnx-zynqmp.c                          |  4 ++
 hw/char/xilinx_uartlite.c                     | 40 +++++++++----
 hw/intc/xilinx_intc.c                         | 59 +++++++++++++++----
 hw/microblaze/boot.c                          |  8 +--
 hw/microblaze/petalogix_ml605_mmu.c           |  4 +-
 hw/microblaze/petalogix_s3adsp1800_mmu.c      | 59 ++++++++++++++++---
 hw/microblaze/xlnx-zynqmp-pmu.c               |  2 +-
 hw/net/xilinx_ethlite.c                       | 52 ++++++++++++----
 hw/ppc/virtex_ml507.c                         |  1 +
 hw/ssi/xilinx_spi.c                           | 29 ++++++---
 hw/ssi/xilinx_spips.c                         | 46 +++++++++++----
 hw/timer/xilinx_timer.c                       | 42 ++++++++++---
 target/microblaze/translate.c                 | 49 +++++++++------
 .../functional/test_microblaze_s3adsp1800.py  | 27 ++++++++-
 .../test_microblazeel_s3adsp1800.py           | 25 +++++++-
 19 files changed, 358 insertions(+), 102 deletions(-)

-- 
2.45.2

