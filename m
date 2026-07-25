Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CDAC531FC
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Jul 2026 01:26:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnRA2-0004xC-25; Fri, 24 Jul 2026 21:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnRA1-0004wv-6h
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 21:26:41 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnR9z-0006Ez-Al
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 21:26:40 -0400
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-5c2c96286f0so391745e0c.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 18:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784942798; x=1785547598; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FR7smJVQCziDacT+pYW4DAUI7Sa7Mloc02pZ0ckbuCs=;
 b=NoEepBycx8iRl5CMX7Op0N5CxbxDIWL4uxE2roXvnmTbAe6i6Y9GpbzYF4+oVMFmdp
 GHTZQbRuiVce/LzNIhgdisSlVPnJxKpjn4dctLK4SLzzRqXUlbjlvOSrZPlGk8bz/AqB
 YoMd1mWB24HD0pedOQD+S2rchxhrIpS0QewD6Wy2aOJxnJ1uHGWw6+HIdyYY06UtGd3f
 OaQY9Ps9zaxKUoqR69kA1UVmA8Rlu1+VOyH/adxgX4TET5fgN4SuDFmSLhSi9W/9VYWF
 xB/AWPJEpTZ4I8P3FdSLOIuo0q2TFjJsJxn/Ceyjv36o2PEJ3+iUzlw603uaNFk+teIp
 iX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784942798; x=1785547598;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FR7smJVQCziDacT+pYW4DAUI7Sa7Mloc02pZ0ckbuCs=;
 b=WSaUpCGnbuk2MvS3mfvLBMpQeb1woUYWOryM88NwPJiQyfjM0Kv+jIyCoANY07mhX+
 5euQW9w5RUZpb+NLy1Cf6ynZTXkzUDFfGVI81vPJnv7+ODuiz4WKAOkQHOAZmBCcnFwp
 WO9cqvLupc/g2VsivxNRR/IoekDNVWAF0AuLYyS6HjU/VeXCYIenvp/UabHYiN1sk//+
 gmYKTdmWADfTbtbRORxa7pY/gmUg9vKz2B+rQ5YveEMspjVOIohrT4ZYzzIBbtyiEWhV
 6AQws2dquc7g7FpCzP8tBD+3Aff3qj9PYpfjFjZ0aI9bbAOXkCWNFz+CiDE0lktakkkQ
 3qbQ==
X-Gm-Message-State: AOJu0YwvNwtcmDUBUvr9/4YNl+gymm4Mant1fEehpMCw9Yw99Cnkargd
 RaVHEtlNWSqjremNJoFmAk9nqkVQgPBqhZ5S9S7BgQN5zMBOEPY3RT3c
X-Gm-Gg: AR+sD12HS2spMmZn6N49DqnZWqb4MevDK+WjELhKsjDMwkotQB7sQcIjUXMqfn2UE26
 LZA8RvSUUVBL6UbGxKyvB2ABtObiHvt7Bs95dEoY3l3JuE0e87xCBWe+Rs+eyt+cEmnc9MGRrY9
 d+rINCfASSWqlxLoYRwbk7hUdwXk/G/I12ZIL/MjUhTogbARiTvxGEhgclmG8YgtS3VtSqT6DEZ
 DFc5VjV/EOLgFc6wLLvbPBb70nUurX4fUy0/SIYhuAx9nGqjMLHtkUqk+/wfiXF8Yh1E6HHzhMm
 eYFJw5t394+Gg26uWM1hul9c+B9dyUh7BJ/LqnCgpKcPfptXo2ChnlxSeVP/dE1zO3CnMTYPeSO
 KVylt2fdnzwVOho9Usf+xr+bO+Az4YjsZHdZKaSWn5wW4Q6muFnsDr7B5esEPsRcEaiDbECOLPi
 AlYMPdr0VJ6f0kHca/IDxHEq40x+y/wt/fgPqUdrm9U3o=
X-Received: by 2002:a05:6122:4b8a:b0:5bf:ab99:ea92 with SMTP id
 71dfb90a1353d-5c306e11c69mr403557e0c.12.1784942798185; 
 Fri, 24 Jul 2026 18:26:38 -0700 (PDT)
Received: from localhost.localdomain ([146.71.8.128])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-97774c388d7sm1092856241.1.2026.07.24.18.26.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Jul 2026 18:26:37 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH 0/5] hw/arm/raspi4b: RNG200 and thermal sensor
Date: Fri, 24 Jul 2026 21:26:30 -0400
Message-ID: <20260725012635.4925-1-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=marcelomanzo@gmail.com; helo=mail-vk1-xa30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This is a follow-up to the "hw/arm/raspi4b: working PCIe and GENET
(real networking)" series I sent earlier [1], carrying forward two
more patches from the same stalled Sergey Kambalin series (patchwork
series 829638, [2]): the RNG200 hardware random number generator and
the dummy thermal sensor for BCM2711/raspi4b. These are the last two
devices raspi4b's DTB was masking out (the mask array,
nodes_to_remove[] in raspi4_modify_dtb(), is fully empty after this
series and goes away with it -- GENET, PCIe, RNG200, and the thermal
sensor were the only four entries it ever had).

Same porting approach as the previous series: patches 1 and 3 are
Kambalin's original code carried forward with his authorship and
Signed-off-by kept, adapted only for API drift since 2024 (headers
moved under hw/core/, class_init()'s const void *data, the
Resettable phases API, Property[] losing its
DEFINE_PROP_END_OF_LIST() sentinel, and fifo8_pop_buf() gaining a
caller-supplied destination buffer -- adapted
bcm2838_rng200_read_fifo_data() to the new copying API this code
originally used the now-legacy fifo8_pop_bufptr() form of). No
functional changes. Patches 2 and 4 wire the devices into the SoC.
Patch 5 adds a functional test.

Unlike the GENET/PCIe series, there were no real bugs to find here --
these are much smaller, mostly self-contained register models (the
RNG has a FIFO and a ptimer for periodic entropy generation, but no
DMA/checksum/link-state machinery to get subtly wrong), and testing
confirmed them working on the first pass: the guest probes both
("iproc-rng200 fe104000.rng: hwrng registered" and a working
thermal_zone reporting the expected fixed 25C), /dev/hwrng yields
real random bytes, and the new functional test
(test_arm_raspi4_rng_thermal) checks exactly that.

checkpatch.pl is clean (0 errors) across the series; note it also
caught two real issues in Kambalin's original code while I had it
open for the API-drift adaptation -- an old-style license-boilerplate
header instead of SPDX-License-Identifier in bcm2838_rng200.{c,h}
and bcm2838_thermal.h, and one brace-placement/whitespace nit -- both
fixed in the same patches.
tests/functional/aarch64/test_raspi4.py's other three tests
(including the GENET one from the previous series) still pass.

[1] https://patchwork.kernel.org/project/qemu-devel/cover/20260725004219.66222-1-marcelomanzo@gmail.com/
[2] https://patchwork.kernel.org/project/qemu-devel/cover/20240226000259.2752893-1-sergey.kambalin@auriga.com/

Marcelo Manzo (3):
  hw/arm/bcm2838: enable BCM2838 RNG200
  hw/arm/bcm2838: enable BCM2838 thermal sensor
  tests/functional/aarch64: add raspi4b RNG200/thermal test

Sergey Kambalin (2):
  hw/misc/bcm2838_rng200: add BCM2838 RNG200
  hw/misc/bcm2838_thermal: add BCM2838 thermal sensor

 hw/arm/bcm2838.c                        |   4 +
 hw/arm/bcm2838_peripherals.c            |  28 ++
 hw/arm/raspi4b.c                        |  19 --
 hw/misc/bcm2838_rng200.c                | 406 ++++++++++++++++++++++++
 hw/misc/bcm2838_thermal.c               |  98 ++++++
 hw/misc/meson.build                     |   2 +
 hw/misc/trace-events                    |  10 +
 include/hw/arm/bcm2838_peripherals.h    |   4 +
 include/hw/misc/bcm2838_rng200.h        |  42 +++
 include/hw/misc/bcm2838_thermal.h       |  23 ++
 tests/functional/aarch64/test_raspi4.py |  32 ++
 11 files changed, 649 insertions(+), 19 deletions(-)
 create mode 100644 hw/misc/bcm2838_rng200.c
 create mode 100644 hw/misc/bcm2838_thermal.c
 create mode 100644 include/hw/misc/bcm2838_rng200.h
 create mode 100644 include/hw/misc/bcm2838_thermal.h

-- 
2.47.1


