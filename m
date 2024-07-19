Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp616704njc;
        Fri, 19 Jul 2024 11:10:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLUTrWRlemIgNd5Z+e4keIlFHgzKo1lkQp8VtmKEmzKUl3+pdDxn6WlE0ATTXr27Ghv+pjgh0e27OPTjVe64/6iBUQLZCn
X-Received: by 2002:adf:fe50:0:b0:362:5816:f134 with SMTP id ffacd0b85a97d-368315fe328mr4579303f8f.13.1721412645777;
        Fri, 19 Jul 2024 11:10:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721412645; cv=none;
        d=google.com; s=arc-20160816;
        b=k9bn1EIAG1Tkq1lK+GYppqGF9E5jkejA199C1LoubQQinil+JmfKhrKB1OSpcrNR/s
         BmV/oFZJvt9P4zgTSaJeNDoheXzsIC31h/DXmZfc7hCkPl/KAL1JCpYbeAo3TRuS5ZwJ
         +YVJ6gfKcBvFGoNmqQtpSUjFYtcbz6/6CG1PmwhflBFWhHCwFIsrQ0pI8pd4XGQI2VkY
         oEm3N1PGW1m3qb+9GmtElNtf2zyIYKmyv8ub+UwdILpR1S2gsUmeQWll+FLpqMWTdWdC
         cw/FXGstbtrxRScnj73uBnSg25n6fvzQSYBRwupen7pfN4bzWPLi+1nuAJPujbbobmDl
         uHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=tJQVf3BbDguAsYpbzIbV3goR+q4yFrTTHvQYqXEoamQ=;
        fh=cHJ1ZIcC3oDeKesvi2GZhEpGuxd8UczSUH+mRIrb79A=;
        b=tZ1Tpmes0pgYujPaKiktPZPvVJQUE9driBEDwYGAXrUcOXzkSQ1ejdrfrUOSlVXTun
         HPppVNGVIR4YpIa2sXVs/0JOv4kz/uFpniGMWMb0UScAHnq0liV1Wr9nVqPCbAyLMrnW
         +2d7RuDkwrUnRs91QDHx/vjYCsoGsNDMpxZBnALcacZfavQhGi1x0bgqdFYFRbYDkUhv
         F8WxMLPfvj0bOKFjHrtpuhFs9Q6sCb9kxHDAYyTJidwj+3O39Nts1PA9WeP224lXwulr
         GOI13sdiFdP3TgW2PD8JcqKlHOZnxqjnGUUjLvGuF8nRWWf8PpVZ1YB3w7a+iX2kl4kp
         MiVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pbIv9Al4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36878695e47sor489385f8f.2.2024.07.19.11.10.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 11:10:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pbIv9Al4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721412645; x=1722017445; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tJQVf3BbDguAsYpbzIbV3goR+q4yFrTTHvQYqXEoamQ=;
        b=pbIv9Al49VUA+Eek4qGH5Z0YiaMT6snGqS5VqTykBfgKI0NV2anLMB+ZbySTKvUSZL
         dkb5nvcZCmhD+R1y+zZLFivWrEwi918ImSPE7+AzqdF6oHY87Sj1KprMQxyRMvRntKV6
         1Zu1wPVIsat2j2WlaQddozlovl8Lit4TNMljOBl0GwHWEJFm6qoSYPifLsinCgb+a71n
         dBIGu/0qr8X0A+E6OMgGicLzXFaBdi/7fMKuXNV9sPxn0NQheuPjDA6mE/9IYOzwpMRt
         78vsDthRaa9c/N128YwqVuiVqXdYjZFBLzA4SsfVg4kNwNrzdtu4NcAFldJs2Qrj+uYK
         B2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412645; x=1722017445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJQVf3BbDguAsYpbzIbV3goR+q4yFrTTHvQYqXEoamQ=;
        b=Q3iPqHyd95C8hgTxXV36FtRWiWlfpMoiVdkmSlM+sBzZmAsmviOYa4Ow/8NkC9ULMs
         bYCJJUWoT4DyPghbBHwDeJxS3UbaVEavODhHVmNjSWqWG7/Q5p+l1yOmuZ1IjFaCkUbn
         DRFxaNL964O6+TccN6YV9ScrXhqjhMubAydQZz2cs5kbQyR1Rb+2skCDc6k67gDzKj2s
         ylMK/5fABVJcxSJPOJFyoKUNi9FGR1r7VK7db6EcLDuAyAmBZuLVY4y0iWHZqI2yeW7m
         JtcjAJiaqGob0Hf2SLPeExLD9Tl3QVZbUy7vfe92j1gKVZD7/IF+NCsoD4mExSGtDIBD
         ZQ8g==
X-Forwarded-Encrypted: i=1; AJvYcCXK5qRCD5YpQ6r0xIsgfdtDiA6IItL/5zlxzfzkCP7TuNzgnNetSYi/XXuU1kLv57aN4SPpy7VTDilAX+YSi8AK3FTCVGUi
X-Gm-Message-State: AOJu0Yxn1cJ8LI3Q/gbfYsEFZd3FoDZWiRG4dSYk5EzAvfvEznsI30re
	xk0+2ulqk2lcg/fZVWhe/wR80w6AKUl/cTk8oYVBH3l8uA62zcTwFY5si/BtAim2ecF3V6PyNJy
	lxQ0=
X-Google-Smtp-Source: AGHT+IG8E8Crd22Mc4FAZy6qunBhAOnUZaKi+d46fEq8Tu+0dOO8BEjD5R/IpPnPiMKOzP1yJ8FS8g==
X-Received: by 2002:adf:e34c:0:b0:367:9279:c401 with SMTP id ffacd0b85a97d-3683165c8cfmr5506717f8f.34.1721412645178;
        Fri, 19 Jul 2024 11:10:45 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (52.170.88.92.rev.sfr.net. [92.88.170.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787cece3sm2224012f8f.69.2024.07.19.11.10.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 11:10:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Tong Ho <tong.ho@amd.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Philippe =?unknown-8bit?q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 00/16] hw/char/pl011: Implement TX (async) FIFO to avoid blocking the main loop
Date: Fri, 19 Jul 2024 20:10:25 +0200
Message-ID: <20240719181041.49545-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: gk8m2g8zsrbU

Hi,

This series add support for (async) FIFO on the transmit path
of the PL011 UART.

Last patch still broken (chars are emitted async),
still patches 1-11 could be merged for this release...

Since v4:
- Rebased (loopback)
- Addressed Richard & Juan migration comments
- Split in smaller patches

Since v3:
- Document migration bits (Alex, Richard)
- Just check FIFO is not empty in pl011_xmit_fifo_state_needed (rth)
- In pl011_xmit check TX enabled first, and ignore < 8-bit TX (rth)

Since v2:
- Added R-b tags
- Addressed Richard comments on migration

Since v1:
- Restrict pl011_ops[] impl access_size,
- Do not check transmitter is enabled (Peter),
- Addressed Alex's review comments,
- Simplified migration trying to care about backward compat,
  but still unsure...

Philippe Mathieu-Daudé (16):
  tests/avocado: Add 'device:pl011' tag to tests exercising PL011 UART
  hw/char/pl011: Remove unused 'readbuff' field
  hw/char/pl011: Move pl011_put_fifo() earlier
  hw/char/pl011: Move pl011_loopback_enabled|tx() around
  hw/char/pl011: Split RX/TX path of pl011_reset_fifo()
  hw/char/pl011: Extract pl011_write_txdata() from pl011_write()
  hw/char/pl011: Extract pl011_read_rxdata() from pl011_read()
  hw/char/pl011: Warn when using disabled transmitter
  tests/qtest: Update tests using PL011 UART
  hw/char/pl011: Check if receiver is enabled
  hw/char/pl011: Rename RX FIFO methods
  hw/char/pl011: Add transmit FIFO to PL011State
  hw/char/pl011: Introduce pl011_xmit() as GSource
  hw/char/pl011: Consider TX FIFO overrun error
  hw/char/pl011: Drain TX FIFO when no backend connected
  hw/char/pl011: Implement TX FIFO

 include/hw/char/pl011.h                  |   3 +-
 hw/char/pl011.c                          | 339 ++++++++++++++++-------
 tests/qtest/boot-serial-test.c           |  15 +-
 hw/char/trace-events                     |   9 +-
 tests/avocado/boot_linux.py              |   1 +
 tests/avocado/boot_linux_console.py      |   2 +
 tests/avocado/boot_xen.py                |   1 +
 tests/avocado/machine_aarch64_sbsaref.py |   1 +
 tests/avocado/machine_aarch64_virt.py    |   1 +
 tests/avocado/smmu.py                    |   1 +
 tests/avocado/tuxrun_baselines.py        |   5 +
 11 files changed, 277 insertions(+), 101 deletions(-)

-- 
2.41.0
