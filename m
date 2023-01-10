Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3316442ejc;
        Tue, 10 Jan 2023 08:44:10 -0800 (PST)
X-Received: by 2002:a05:6000:501:b0:26b:8177:a5e6 with SMTP id a1-20020a056000050100b0026b8177a5e6mr41125424wrf.51.1673369050543;
        Tue, 10 Jan 2023 08:44:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369050; cv=none;
        d=google.com; s=arc-20160816;
        b=MQKUdNUMZl13jTWhVI0DBhTD4lLphXqKhFGWQTXtIQdFKiD7qx1K1Jy9lxKpULxayM
         TC3E2pskKPsqumeoNoyaIEu7b+tiUcAlHnnLmPfCYVoxg5m9iQoWo2cpxi/RW95hhg0q
         7zfiTn2xY3g0yU9eKl9N1VwQWvdOnkrTnGh+NODDa32OvGCzIz1oi5wtfioDMRROoA1q
         ZFCI/4A+8o3zAx5C7+z3U4tDwflalPtCwO916yLZm/IXQ1zxchttNJ1fLRjhZwf0x9t0
         OLidNv1RRNgZG66qy7d9Lp+81bUxVoTEC6KAEYiLCtNfTGRDbNmfxjJfFvaI2/ZOfiZu
         Wlag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=CPwog7s6qoO9BZW8ROM2vT1B0KSgnjrgal2QWFXh9rY=;
        b=qY70msN965gW3FGLs/T7RQ1E+0JK92KtCGA6BM9iIz0be8Mo/ESBVaJFJ/gwOTM30w
         WKRB/wUBBrbClTluunRQBwjhyES5yXqKh/7Kv8B4wV6nXkIpjnl5yIwDdiwt07FuGzmE
         CE6+1vxCYopiPF4mzry9SxV0sp2h8olVKJk14wewa8yuVcGoVqYO2yqpIjICWc9zyKCT
         Srw/AGl+a8JN6gf4vzP4NZ0/qJteXwmJ7945JAOEXeLkCKYg53eHWxpJ5b545yocwgax
         gSa4oFzE3VHTsv2du9G9z7EaISFPDjFXMveGeupV164XsKrdUyTbbdPnRFq6c0Lfkc3f
         g2eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AGJDF0/S";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h4-20020adfa4c4000000b00234bb2218adsor4484023wrb.51.2023.01.10.08.44.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:44:10 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AGJDF0/S";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CPwog7s6qoO9BZW8ROM2vT1B0KSgnjrgal2QWFXh9rY=;
        b=AGJDF0/SUFvufs1KEMv/KU+dp1USHFJlRTapZjtO7A2qyyMYd3LSwiz0z+CHHSGbok
         l0aaswSGgU12VI0HRB0ZVa9v8t5xDbrI2JT0o6xCfGqZI7RsmmlZno7ixVzwe6sJ1H6F
         OE/njecxvVUKH/pM0Tv5d0bKvCxCLL+jzato49dThhQCzSeQwz5Ewupx9Eu/U3sMgNBR
         d3+WWqmfh702tbR1qwTgkIVOgDVEHW64jPUp83jICNVeqnCKCjSoPiRV6iqkDpUCv1UH
         sSsVoHTLBmHhc26Bk/+cJ0dHTw1oGhy3kTguPsqt+w5MP5v35tytGIJDauHbrVN3qnvS
         g7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPwog7s6qoO9BZW8ROM2vT1B0KSgnjrgal2QWFXh9rY=;
        b=2ODXdyY3neN6/yXsvfhsKjWPZPpbSVLKxcPBYZHDVwp5zGktVhaB//i4N3GakXwOlh
         cFpzUn3X5Q1dpK0hpl/3MvlUzLgQC/sCRrP6UOF4NBoIE7CFOhyCEw5L+pZ2t/yyZQoJ
         L6/x0pE0iD49zWpPe0Zy8c7CinLvvRf3WLHPoRUCxCH+SPzlhixU76dA0VVPxNV0MSaA
         aFYbr6ws3CQGg5idgTc9zBM1HM6oVmw04LuYX3BpUkuVVQiXOIjFHSgRvQnJdJICrWFe
         Ka9DCwPq59ZLv61A00sTa0HLlaWBL3ZE6BUS41N5hZ9w2m8J0aXxu/gottl4ncchmIy3
         cm3A==
X-Gm-Message-State: AFqh2kods6z1psbbR0XKDxaxQOqvgUTaOkucpZHBNHsZguK0G9gbwTSo
	PlkFgs/wOeIdb2vlR8DN22puJ8C7
X-Google-Smtp-Source: AMrXdXujrrKV7oxT7ZtJAwu9boVQVIvovlhTXC0OmpCTNWW4WpL7amxPolhtBmYRXJp2JPlwlH2lqg==
X-Received: by 2002:a05:6000:148:b0:2bb:dc79:17dc with SMTP id r8-20020a056000014800b002bbdc7917dcmr7276080wrx.19.1673369050311;
        Tue, 10 Jan 2023 08:44:10 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id z18-20020a5d44d2000000b002368f6b56desm13995150wrr.18.2023.01.10.08.44.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jan 2023 08:44:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Antonio Caggiano <antonio.caggiano@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 00/18] hw/arm: Move various objects to softmmu_ss to build them once (part 1)
Date: Tue, 10 Jan 2023 17:43:48 +0100
Message-Id: <20230110164406.94366-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: ukW1KqKn3vde

Hi,

This series unifies various objects from libqemu-arm-softmmu.fa.p
and libqemu-aarch64-softmmu.fa.p into libcommon.fa.p.

So instead of building each object twice, one for 32-bit ARM ARM
and another for 64-bit Aarch64, hardware-related objects are built
once.

Part #1 is the low hanging fruits :) Also I cut the series under
20 patches to ease review digestion.

The overall logic is to only access ARMCPU as opaque pointer when
possible. This way we don't depend on the (target/arm/) "cpu.h"
header which contains target-specific definitions and forces units
to be added in Meson's arm_ss[] specific source set.

In order to reduce use of "target/arm/cpu.h" by hardware units,
we split the hardware-facing definitions in the new "hw/arm/cpu.h"
header.

Finally, instead of using object_initialize() on the full ARMCPU
variable, we use object_new(TYPE ARM_CPU). Since QOM types are
registered with their class/instance size, we don't need to provide
sizeof(ARMCPU) to allocate the object.

Please review,

Phil.

Based-on: <20230109115316.2235-1-philmd@linaro.org>
          "hw/arm: Cleanups before pflash refactor"

Philippe Mathieu-Daudé (18):
  hw/arm: Move various units to softmmu_ss[]
  hw/arm/boot: Include missing 'exec/cpu-all.h' header
  target/arm/cpregs: Include missing 'target/arm/cpu.h' header
  hw/arm: Use full "target/arm/cpu.h" path to include target's "cpu.h"
  target/arm: Move CPU QOM type definitions to "hw/arm/cpu.h"
  target/arm: Move CPU definitions consumed by HW model to
    "hw/arm/cpu.h"
  hw/arm: Move more units to softmmu_ss[]
  hw/arm: Move units to softmmu[] by replacing "{target ->
    hw}/arm/cpu.h"
  hw/arm/armv7m: Remove 'target/arm/cpu.h' from NVIC header
  hw/arm: Move various armv7m-related units to softmmu_ss[]
  hw/arm/digic: Remove unnecessary target_long use
  hw/arm/digic: Replace object_initialize(ARMCPU) by object_new(ARMCPU)
  hw/arm/fsl-imx: Correct GPIO/GPT index in QOM tree
  hw/arm/fsl-imx25: Replace object_initialize(ARMCPU) by object_new()
  hw/arm/fsl-imx31: Replace object_initialize(ARMCPU) by object_new()
  hw/arm/fsl-imx7: Replace object_initialize(ARMCPU) by object_new()
  hw/arm/fsl-imx6: Replace object_initialize(ARMCPU) by object_new()
  hw/arm/allwinner: Replace object_initialize(ARMCPU) by object_new()

 hw/arm/allwinner-a10.c         | 10 ++--
 hw/arm/allwinner-h3.c          | 14 +++---
 hw/arm/armv7m.c                |  2 +
 hw/arm/boot.c                  |  1 +
 hw/arm/collie.c                |  1 -
 hw/arm/cubieboard.c            |  2 +-
 hw/arm/digic.c                 |  7 +--
 hw/arm/digic_boards.c          |  2 +-
 hw/arm/fsl-imx25.c             |  9 ++--
 hw/arm/fsl-imx31.c             |  9 ++--
 hw/arm/fsl-imx6.c              | 14 +++---
 hw/arm/fsl-imx6ul.c            | 12 ++---
 hw/arm/fsl-imx7.c              | 10 ++--
 hw/arm/gumstix.c               |  1 -
 hw/arm/highbank.c              |  2 +-
 hw/arm/imx25_pdk.c             |  2 +-
 hw/arm/integratorcp.c          |  2 +-
 hw/arm/kzm.c                   |  2 +-
 hw/arm/mainstone.c             |  2 +-
 hw/arm/mcimx6ul-evk.c          |  2 +-
 hw/arm/mcimx7d-sabre.c         |  2 +-
 hw/arm/meson.build             | 83 ++++++++++++++++++----------------
 hw/arm/musicpal.c              |  2 +-
 hw/arm/omap_sx1.c              |  1 -
 hw/arm/palm.c                  |  2 +-
 hw/arm/sabrelite.c             |  2 +-
 hw/arm/spitz.c                 |  2 +-
 hw/arm/strongarm.c             |  2 +-
 hw/arm/z2.c                    |  1 -
 include/hw/arm/allwinner-a10.h |  4 +-
 include/hw/arm/allwinner-h3.h  |  4 +-
 include/hw/arm/cpu.h           | 77 +++++++++++++++++++++++++++++++
 include/hw/arm/digic.h         |  4 +-
 include/hw/arm/fsl-imx25.h     |  4 +-
 include/hw/arm/fsl-imx31.h     |  4 +-
 include/hw/arm/fsl-imx6.h      |  4 +-
 include/hw/arm/fsl-imx6ul.h    |  4 +-
 include/hw/arm/fsl-imx7.h      |  4 +-
 include/hw/intc/armv7m_nvic.h  |  2 +-
 target/arm/cpregs.h            |  2 +
 target/arm/cpu-qom.h           | 28 +-----------
 target/arm/cpu.h               | 42 ++---------------
 42 files changed, 205 insertions(+), 181 deletions(-)
 create mode 100644 include/hw/arm/cpu.h

-- 
2.38.1
