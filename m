Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp485318lfy;
        Fri, 21 Aug 2020 10:29:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPgSLcZRCyTFwLVpQFvocDtzxxqSfgea6cW5FroK4f/xhzyvEBKvtJ2/2OIYfIEIi7JypN
X-Received: by 2002:a25:df41:: with SMTP id w62mr4850470ybg.117.1598030974934;
        Fri, 21 Aug 2020 10:29:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598030974; cv=none;
        d=google.com; s=arc-20160816;
        b=T4HkvlaV8jlz3pdmcQUUckOUEqhTA/lwiXz8dngYZhJOdJ1XLHJ8zC/EqSJX4PT9f2
         qStrhO4mI9LRT7TT/aZSvWpHU8f7d2AXEgigSJC0HXDlU3znDpuaizXrhBBU1p5oxiH1
         a09TsjIfKRZOplk/TxAaXRejrJkUO67j1yobQsREVeGMgeSotrpjj2D4RRLnEcT9cQi5
         /Ro7RnyFwsV/Hpje1nW+NXHbZlGrTsI20AyvfftXGMmexHZLd9IRuYw5oYO5zu7fQkFy
         EYppP6kkBmCAJEC/j0Bd9M3aWvoVjt6NBkgmGHTe6oCR2ypgODuo0A5u8QsbPZ2itvIS
         Vq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=8UmPEBqHrjvPs/KBLPT0a1bzj7Klv5TNoMNfuKZPiIs=;
        b=MIzgUDFkeFOmPcPAaIqiLu0DE0szEHz7fr67vF+TDc2+EfTrr1bGNZtrkGtaYy9C5F
         6vhInyjpC5+Sd04/wEytY1f41HqL6WX2StWjtkTVtMFZ0TxS868d04F4p0OUawrnjf8i
         /DDX/dLFHPATl7h6hhhbouM0UuExWZugC35CJNJ0g94e3KYmAllvh5jVYVDHydofeZ5w
         mnZYl1MdBi1YH0sDaV4gDtgmAMTVnAz/+hgsPzTJRcOWmeqYltcGzIKoZIgnJhM9T5Gj
         ot0pgLs77Le1TCC31G0ynYHE++UIafkuzkvYRLJVOfhbA+RVTj/l4Ty8EDvw3qhU5L6m
         zypw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sOpsBlDq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2si2949861ybk.87.2020.08.21.10.29.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 10:29:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sOpsBlDq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:39240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9Ar8-0000xT-5J
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 13:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Aqx-0000wt-QL; Fri, 21 Aug 2020 13:29:23 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Aqw-00018o-6j; Fri, 21 Aug 2020 13:29:23 -0400
Received: by mail-wr1-x429.google.com with SMTP id 88so2660855wrh.3;
 Fri, 21 Aug 2020 10:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8UmPEBqHrjvPs/KBLPT0a1bzj7Klv5TNoMNfuKZPiIs=;
 b=sOpsBlDqQGsQ/wTlUDCIX9W2uara5u8JoHg+Rxjn0lmOZyHLuWoy/k/053E/ZkD4OP
 EtrcK6qqNfPwy+8L2mkL5X7vNVef7q1bDe2aCk2EfmH1XaXDcLSaS6g0NxQ95plIDTE3
 YbO4YpzKDo3hw1sFYyyfOk5QGm+QF0Xvinbv6Ul+8EBKxls1YjbKV1NO5Zu2anlZgJ+5
 0xkfUAm1iCO9S+zylZjvx0MVmwVg9vykLbiPP8e0k7NbaVJTd7Ig7D9GuOytK17rsfn/
 GpMWFsUDsX9wTUJLjNmoNSP3gvcgttl3boxA0XpgMINvDfSNI9cs++L6yWC5PUNjC9p4
 v0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=8UmPEBqHrjvPs/KBLPT0a1bzj7Klv5TNoMNfuKZPiIs=;
 b=ob/GpG8L/OtNmifhpWuYbTVAp8zHDktZ+RdkiTFtw0Y+fKT8Tci5Olq+gydOzsCBqD
 e0jCCwqrqz/vnvLUirFZQb9kG3y8HNZBVtVRWe+horEjYQFSSuwt4opJv3hNWCo/iga0
 inHUCnZJRAs79mabu3hA94ebgwK56scrhoDyAAJo1Y+5xb638HxS01I75SSUoIhhZ4Aw
 E9ljN1isXBxLmCP6uAr5i7xCnaoV6h6EDr+YAcVeKTcMRUOHOmvJ7IXHMFlm/pyHz/HN
 skqnMkuHAW7RDEQwtHFtuuKnZ8tkLzuZJzjxI5qCKrlMucBqpnnQuJev1l3QZPtybiSp
 ZY6g==
X-Gm-Message-State: AOAM533jATec+bIMzM8lMOYgTHUqFsPh/kuiWRSxlebnR0Q6DKK/YGc/
 U9MhNR3QNZG2LO57jG+LOxxVm/nFWcA=
X-Received: by 2002:adf:bc4b:: with SMTP id a11mr3412280wrh.381.1598030959115; 
 Fri, 21 Aug 2020 10:29:19 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 32sm5315471wrn.86.2020.08.21.10.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 10:29:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/23] SD/MMC patches for 2020-08-21
Date: Fri, 21 Aug 2020 19:28:53 +0200
Message-Id: <20200821172916.1260954-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qg6IWFFrgXhd

The following changes since commit d6f83a72a7db94a3ede9f5cc4fb39f9c8e89f954:

  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/acceptance-testing=
-20200812' into staging (2020-08-21 14:51:43 +0100)

are available in the Git repository at:

  https://gitlab.com/philmd/qemu.git tags/sd-next-20200821

for you to fetch changes up to 6d2d4069c47e23b9e3913f9c8204fd0edcb99fb3:

  hw/sd: Correct the maximum size of a Standard Capacity SD Memory Card (2020=
-08-21 16:49:22 +0200)

----------------------------------------------------------------
SD/MMC patches

- Convert legacy SD host controller to the SDBus API
- Move legacy API to a separate "sdcard_legacy.h" header
- Introduce methods to access multiple bytes on SDBus data lines
- Fix 'switch function' group location
- Fix SDSC maximum card size (2GB)

CI jobs result:
  https://gitlab.com/philmd/qemu/-/pipelines/180605963
----------------------------------------------------------------

Alistair Francis (1):
  hw/sd/pl181: Replace fprintf(stderr, "*\n") with error_report()

Bin Meng (2):
  hw/sd: Fix incorrect populated function switch status data structure
  hw/sd: Correct the maximum size of a Standard Capacity SD Memory Card

Philippe Mathieu-Daud=C3=A9 (20):
  hw/sd/pxa2xx_mmci: Do not create SD card within the SD host controller
  hw/sd/pxa2xx_mmci: Trivial simplification
  hw/lm32/milkymist: Un-inline milkymist_memcard_create()
  hw/sd/milkymist: Create the SDBus at init()
  hw/sd/milkymist: Do not create SD card within the SD host controller
  hw/sd/pl181: Rename pl181_send_command() as pl181_do_command()
  hw/sd/pl181: Add TODO to use Fifo32 API
  hw/sd/pl181: Use named GPIOs
  hw/sd/pl181: Expose a SDBus and connect the SDCard to it
  hw/sd/pl181: Do not create SD card within the SD host controller
  hw/sd/pl181: Replace disabled fprintf()s by trace events
  hw/sd/sdcard: Make sd_data_ready() static
  hw/sd: Move sdcard legacy API to 'hw/sd/sdcard_legacy.h'
  hw/sd: Rename read/write_data() as read/write_byte()
  hw/sd: Rename sdbus_write_data() as sdbus_write_byte()
  hw/sd: Rename sdbus_read_data() as sdbus_read_byte()
  hw/sd: Add sdbus_write_data() to write multiples bytes on the data
    line
  hw/sd: Use sdbus_write_data() instead of sdbus_write_byte when
    possible
  hw/sd: Add sdbus_read_data() to read multiples bytes on the data line
  hw/sd: Use sdbus_read_data() instead of sdbus_read_byte() when
    possible

 hw/lm32/milkymist-hw.h        |  11 ----
 include/hw/arm/pxa.h          |   3 +-
 include/hw/sd/sd.h            |  73 +++++++++++++++-------
 include/hw/sd/sdcard_legacy.h |  50 +++++++++++++++
 hw/arm/integratorcp.c         |  17 +++++-
 hw/arm/pxa2xx.c               |  39 +++++++++---
 hw/arm/realview.c             |  16 ++++-
 hw/arm/versatilepb.c          |  26 +++++++-
 hw/arm/vexpress.c             |  15 ++++-
 hw/lm32/milkymist.c           |  24 ++++++++
 hw/sd/allwinner-sdhost.c      |  24 +++-----
 hw/sd/bcm2835_sdhost.c        |   4 +-
 hw/sd/core.c                  |  38 ++++++++++--
 hw/sd/milkymist-memcard.c     |  71 ++++++++++++----------
 hw/sd/omap_mmc.c              |  10 +--
 hw/sd/pl181.c                 | 111 +++++++++++++++++++---------------
 hw/sd/pxa2xx_mmci.c           |  19 ++----
 hw/sd/sd.c                    |  28 +++++----
 hw/sd/sdhci.c                 |  46 ++++----------
 hw/sd/ssi-sd.c                |   2 +-
 hw/sd/trace-events            |  10 +++
 21 files changed, 415 insertions(+), 222 deletions(-)
 create mode 100644 include/hw/sd/sdcard_legacy.h

--=20
2.26.2

