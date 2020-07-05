Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4333648lfm;
        Sun, 5 Jul 2020 13:46:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1hWwSjMy0L8nYkeZPpHQT7owhWWOngMjEjlEFo6KHu0bkJCZ3efQbyNsv8LPLvopHfzyO
X-Received: by 2002:a25:3342:: with SMTP id z63mr70472352ybz.200.1593982006123;
        Sun, 05 Jul 2020 13:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593982006; cv=none;
        d=google.com; s=arc-20160816;
        b=BEiXU0l0+jzx/BYvFMBuIH159y1TV01K6jPUBpCb3pt2Zl083wLWdEfOvTc7rhLxPU
         S7+VkXl+d3M6k6HuvnF08gzV1APfqZ52VeXYWhQ8MBUb0J3Uis/1Q1wKGNRE2uGoVIwG
         /VUjokOCFsRQHnrIbEfq9He2K3ZTQ7nB+Wyz141YTjC+Ounwz/6Di/YoF2p59eqodiqq
         EeQb62eTqysv/Uk308z7JzwEYVbpH9qrsk3vgdOhUpRK4LlhkWMUe5GTj/inR/i9AGfo
         QqMwFEYHqwAoAU6rlPPRTosOCGLwDq99ygNo4/zNVl8TuFKgN6lfBqdEV/aFbli4Efbh
         iCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=XBuQglOOkSD4rvB1yjoy6tQdHV+J8DDgBaFdgoDUM+Y=;
        b=SJulxiFIp9dBykScz5xhMitaIz+JQOBjGK6S9iSk57GaNtQRMXHPDwSQR84GBQixFX
         QtCVH0wZe6xkI7LkZqneOeplX8vldFK6/+Rd7eL7VIhrrFr2MV4CmbMT2xlcKX55tgdw
         4vVpkGSGl+FTCiWLaD8gqxdw85qUUqv3gImVkzLecQZcP9rxiMXW5Swm9nLGLLzH/5/a
         uew7OL64fity4kvo6S9Y8ccrBEd7ho8RtqlUQy8ZYlYaZOuusyimGc8Wobmaxy6pKfI8
         VHiqvgoMbvfjZQvCVaizwtddahMPMTyvjzUdS2X1pSF2xk+AjBJKlwd+o19ZSfE6WGmu
         ZAbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=goSiZVEE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v194si3298337ybv.151.2020.07.05.13.46.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 13:46:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=goSiZVEE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsBXB-0004N8-7t
	for alex.bennee@linaro.org; Sun, 05 Jul 2020 16:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsBX2-0004Lu-7c; Sun, 05 Jul 2020 16:46:36 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsBX0-0000oi-LA; Sun, 05 Jul 2020 16:46:35 -0400
Received: by mail-wm1-x344.google.com with SMTP id 17so39527170wmo.1;
 Sun, 05 Jul 2020 13:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XBuQglOOkSD4rvB1yjoy6tQdHV+J8DDgBaFdgoDUM+Y=;
 b=goSiZVEEpUhU3NXShsBkLEQF3d+mD72E42OPwh+u4E48N47Pn84olvuTrIs9rKmqJm
 p/sGj5sFb5eO/TFnY/XFLi/KwruTQU+LDDHpNdekn2io+B24lHKokdROagtKM7kGn9tS
 PIrrREsCcuiLDjqqHD6eamSvI4yFJn5/Yd/rncaPcxa+KlYnqVAz8d1YsekHFhoBmzoc
 caKojzq3KX9RyflZFWCEsizPo1f9LKBEgLloaTracreIHMs3aLrO4wiH5pOrT8V6eBB3
 n0kf969w/d7r0Rnz3dC2pF6Hn2I8LTVwo2CbiZb8OjWn28lXihMdtaB0pQCr69EhBkgc
 EdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=XBuQglOOkSD4rvB1yjoy6tQdHV+J8DDgBaFdgoDUM+Y=;
 b=O1P2m3psbG1hDqvqZjuKpzBa4rugAiirp3UVGLuHEl6unYBz6oZ6JV2Ux+u23C4Nmy
 xMTzrEUsWbjvs0Lz90984hLtZ2gjqepRZj6nrCGS3O4rcUPKq9ty6lHqWIFXrIp0L5yW
 PshouhAg5+mmUuPDQKyVIJNT6N4TfWn4zRf0Fxm81BLOrkC2q9Fpq2X2eh5dBRvyiOJ8
 MWn4xdWc+9ohaRNHXLdeJCFmU3B2PbhEoDCOKNR0wJviH8wF4/KXPGSCRNEwEk3TbT00
 urktOoT+72YIHk1cm2B3e5NcAUsM5Bno3hYK0N5hgKrkVXZw1S4vNJrU6PJsvjrklDVY
 gaLA==
X-Gm-Message-State: AOAM533FUqhCOUJQQBLwcCsD0x3EKm+fmGRR5WZnV26VAG2n7LmWlXfw
 206V/5Ie9waMk/lZzw0/xoEX2wGl5yE=
X-Received: by 2002:a1c:6102:: with SMTP id v2mr47642077wmb.6.1593981992765;
 Sun, 05 Jul 2020 13:46:32 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id g144sm51397817wme.2.2020.07.05.13.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 13:46:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/10] hw/sd: convert legacy SDHCI devices to the SDBus API
Date: Sun,  5 Jul 2020 22:46:20 +0200
Message-Id: <20200705204630.4133-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zlm20d4h6DfG

Hi,

Since v3:
- rebased (was from Feb 2018)
- use named GPIOs
- addressed Peter review comment (adding TYPE_PL181_BUS object)
- convert DPRINF to trace events

Since v2:
- pl181: remove legacy sd_set_cb() (Peter)

Since v1:
- rebased on /master (Peter sdcard reset() patches)
- fix milkymist-mmc from previous seris using instance_init (Michael Walle)

This series convert 3 devices using the legacy SDCard API to the SDBus API:
- milkymist-mmc
- pl181
- ssi-sd

Then move the legacy API to a separate header "sdcard_legacy.h".

Now the OMAP MMC is the last device using the legacy API, but need to get
QOM'ified first.

Regards,

Phil.

v3: https://www.mail-archive.com/qemu-devel@nongnu.org/msg514645.html

Alistair Francis (1):
  hw/sd/pl181: Replace fprintf(stderr, "*\n") with error_report()

Philippe Mathieu-Daudé (9):
  hw/sd/pl181: Rename pl181_send_command() as pl181_do_command()
  hw/sd/pl181: Add TODO to use Fifo32 API
  hw/arm/versatilepb: Comment to remember some IRQs lines are left
    unwired
  hw/sd/pl181: Use named GPIOs
  hw/sd/pl181: Expose a SDBus and connect the SDCard to it
  hw/sd/pl181: Do not create SD card within the SDHCI controller
  hw/sd/pl181: Replace disabled fprintf()s by trace events
  hw/sd/sdcard: make sd_data_ready() static
  hw/sd: move sdcard legacy API to 'hw/sd/sdcard_legacy.h'

 include/hw/sd/sd.h            |  17 ------
 include/hw/sd/sdcard_legacy.h |  50 +++++++++++++++
 hw/arm/integratorcp.c         |  17 +++++-
 hw/arm/realview.c             |  16 ++++-
 hw/arm/versatilepb.c          |  28 ++++++++-
 hw/arm/vexpress.c             |  15 ++++-
 hw/sd/omap_mmc.c              |   2 +-
 hw/sd/pl181.c                 | 111 +++++++++++++++++++---------------
 hw/sd/sd.c                    |   3 +-
 hw/sd/trace-events            |  10 +++
 10 files changed, 193 insertions(+), 76 deletions(-)
 create mode 100644 include/hw/sd/sdcard_legacy.h

-- 
2.21.3

