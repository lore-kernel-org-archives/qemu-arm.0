Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1955032lfc;
        Mon, 25 May 2020 04:41:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLJXvXS6ELD5Pvmh+swdjcHAGyV8vCuvWBDslywx5wttVsZhmqrPjrM1OuveLY7LpTZfqd
X-Received: by 2002:a25:6cc1:: with SMTP id h184mr7879708ybc.13.1590406905449;
        Mon, 25 May 2020 04:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590406905; cv=none;
        d=google.com; s=arc-20160816;
        b=dBNdXeCspPgXxgJlv2JXrziRJQ4UF09uk2MqOBivZY7cXcIbTaN2cY5H7qPEFNg2Fd
         UXXSUY8dCe4Z8cNt66hdBfxeqnNRsbrQPudIZ6ajoJtjz9wu4tDmCob4Y/hraSH/evN1
         Mukny1ykDMBtlhaOgRc0C0aCWfBZMOu8oBEUF3m/RLlfqZBWkQWJECVfrF6bywW3k1Ae
         dBd3VqTMI5gbCHBmxHiXQgQtoQdktZD1e+o0AFTkLSkunThJx/TlyjaqiaXRv/gCal4O
         phDiR0cDaMWzMHCPmBIQfE9KeAe2PV/unUkh4bFU0Xf5Dnqu3I9/4+SbRj9BplSKIzsY
         WGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=DQv8GKBjj6LZqAGDriHeQgmkcRknVcZhiondmKFdK/4=;
        b=P+ITOsK1js6XAwPsjdTF2g752skkMLLzU1RWcuCvn9IBAbqZD2JVmFbD/uNwHHG93q
         QoUz9jdWy+qRZpBqUuPR7yBu/z6yDKy7TdZSx0d41XoJV41SFPkq1dW/8ZP1sfOPD8S/
         tPy7vCGMVwNv0XcUumAgYcuf0STCxNMQBX4DwFf3bf7rMbD4Z9e8INXOOzpuv+Mgnlw3
         RnhHU19unghvcjc5hn8US/kif3F4I8EdQm/Z5A9i3DTA2xGfVlT3/Sfy5uDSODK3SieZ
         0VF8EMjpLkmJhUldMdUUuvpcKkHnwySpr2Ed9TQpKJdpD/NCAKy9COvxBHgXjpwinqNz
         5jXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JYPNdgR8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13si6214458ybj.72.2020.05.25.04.41.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 04:41:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JYPNdgR8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:51102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdBUG-0005cf-PR
	for alex.bennee@linaro.org; Mon, 25 May 2020 07:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdBU1-0005af-R1; Mon, 25 May 2020 07:41:30 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdBU0-00043I-45; Mon, 25 May 2020 07:41:29 -0400
Received: by mail-wm1-x32d.google.com with SMTP id u12so11574393wmd.3;
 Mon, 25 May 2020 04:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DQv8GKBjj6LZqAGDriHeQgmkcRknVcZhiondmKFdK/4=;
 b=JYPNdgR85z4NaNhoy+9z0OZHdggej2c8CZIt3d7/eQkllT0HzoG1P4epJStG3UjUNW
 UHSI4XIfaiEVzBQSFQgFTbonqRQQS3aMO6fPIxK8ZGn5R1sJYra9fFh4uAKBOkhRfx8/
 6IUGn649oVelBfvAfY5OEdT61seH7wPfaiF0lU3scncWaTgKzRfyQC8wEqrxw/NxG5dc
 6fy8bdtrXslYN8jQDpTCll9SHhWxkAlv30+P6yEKDk23O5pUlYsot3flXwNzX8PnxA5N
 d0vwc3HNcRdRFOTjVuUGgJZfHmLWTekiVck7QlnlEKplJ9+wsu8yHNSIH72Bn7/ZSQlv
 KP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DQv8GKBjj6LZqAGDriHeQgmkcRknVcZhiondmKFdK/4=;
 b=gMsejL35oyAckqZK0+j2SSQX4A5mUBT0356id4RSxAikLUl0IRUzy8GE/9ZnAllPZg
 o7XgKc6O5h7sz3VMUre6fipApeL4IunqGc3lCxN4TSb/Pfm6W5VecbiiWYVLa/VgXxeR
 19H5vJQJG6xRkAfrY/IBrFJ8aaPvFdTOT1BxlKMjftQumeq0xVuvjWUFhYTn8scEZirt
 hyEH3zZX9UpOfJjoDNAagwaCaLEsNZmHfYSKLAYYgMPVUSNyJk48R4k046CCLjxuAEPp
 AYaBwqEYZ/TSBkH/OtOrjwym3LdKP0QfPRXJ4IANazoPmku6h3eKoT8lub+8cb3lMqsD
 gP/A==
X-Gm-Message-State: AOAM5301rTiN0Ah63TTg6Z7bqDVdIs7bVkTJ6SMp88PgPINc7UuYMm4A
 3gvEqeIMwPIdk93gzsH389g7A5j5lUk=
X-Received: by 2002:a05:600c:4152:: with SMTP id
 h18mr1896455wmm.189.1590406885416; 
 Mon, 25 May 2020 04:41:25 -0700 (PDT)
Received: from localhost.localdomain (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id b132sm4936159wmh.3.2020.05.25.04.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 04:41:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/arm/pxa2xx: Logging cleanups
Date: Mon, 25 May 2020 13:41:21 +0200
Message-Id: <20200525114123.21317-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CHc1b9cJ9zCH

Last pair of trivial logging cleanup patches
from last week-end.

Philippe Mathieu-Daudé (2):
  hw/input/pxa2xx_keypad: Replace hw_error() by qemu_log_mask()
  hw/arm/pxa2xx: Replace printf() call by qemu_log_mask()

 hw/arm/pxa2xx.c          | 66 +++++++++++++++++++++++++++++-----------
 hw/display/pxa2xx_lcd.c  | 26 ++++++++--------
 hw/input/pxa2xx_keypad.c | 10 ++++--
 3 files changed, 70 insertions(+), 32 deletions(-)

-- 
2.21.3

