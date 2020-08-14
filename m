Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp303340lfy;
        Fri, 14 Aug 2020 03:11:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB9J2c4/ZYT+v6BQAxA9Q+9mbqnuzfSunHsE2sa59OoIe6Bz/9DptOR8/+cNTzGCO2tlkZ
X-Received: by 2002:a25:4ed7:: with SMTP id c206mr2534031ybb.129.1597399862343;
        Fri, 14 Aug 2020 03:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597399862; cv=none;
        d=google.com; s=arc-20160816;
        b=w8PYR5hel8dSuC9s3ksJEQHFWaSPj4/SKsYBw3M0HpnUW283sGZX52ek5h8t92J0ct
         y8aq13iGbEAk65EIMk+KtxhThBYcTLHHHslcsgSMSLrEyyHrgw54ygmUVBCo9Hc40LKr
         6oH+46YRJlXW2Cheg+Pc2IhEAS89Q5N2ixNNfZHjpeg81t9JU06i7zhESWWV+MRflRp0
         zaeA+6zEQWADRI2CZUgzz8ixmRLF+0XuLvpbngyeawJE1x7ItY8P2Oaxp9YKEDWVzuF/
         Vc+S7Z52oc+J+QJ36H7puDD9cagtQeu5tE+MzijFXUJUme4LzPJVgMocFd4Ep+piqby2
         OrUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=b3tIdqOLTAFQUjEaio+gozzSgaZAGPhsq/Gr4fWRyyY=;
        b=PSBW1fVWhPFJ6LGBiQFYoNPoVeHRmXvFGyLHzzbmdNh3vRoBw3tT1kshIS80Ue6AHe
         XGKf5RNThFwAI+d/886cvzeWmA54AhLa4H2RcAPQmGfWJiu+M6ZrYqyTewbNxayj7W5M
         MN6f49Xzl1DnO1o/Ysv+SFX55TXxrkcCJ3NTgfyb8IIKeblLEmfyq/pPzE1gG5AoYpol
         HkBuvLXS3kPpWDAp+zexSSqI4UdzGJFILvb+nA15Wm7dd8TAqjcKvc+8b/2fxxvVZpDO
         8LnNnnJFXM9qZRYBQoOlN+8JhkMebaEBfqrDJ80CXhwjGDEfcrlZcN5KcIZJE+r6dxx0
         hhQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZKClri5d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w68si8149646ybe.37.2020.08.14.03.11.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 03:11:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZKClri5d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:40702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6Wft-0004Zn-Ll
	for alex.bennee@linaro.org; Fri, 14 Aug 2020 06:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k6VwH-0005Nr-4o; Fri, 14 Aug 2020 05:23:53 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k6VwF-0004KC-EC; Fri, 14 Aug 2020 05:23:52 -0400
Received: by mail-wr1-x442.google.com with SMTP id a5so7730745wrm.6;
 Fri, 14 Aug 2020 02:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b3tIdqOLTAFQUjEaio+gozzSgaZAGPhsq/Gr4fWRyyY=;
 b=ZKClri5dHqE26VrbHCuD7MSkbKm7LjSkUBk/svTUZFF69QmoKe2v9c289w1wU5wuEQ
 wfIqdL4V3UJqUU9vI7Ic5UNNNzxUL9Klyx4xqoXvWv42rdjfRqEyWEKdxhTPH+UpqQWt
 X0jbppj3iDy9pnbMwFr8qQPcCH/ngCivOJ/3Egio2PIF8hv9dBQEEz/FmMFIVlt0EnAE
 6pvu4wVEVcAoco8t/EhPiQhHnsb9Mrs8vewzRO+ekB9YP6AbUZsyDe6CxjCeNT642iux
 aVoUg4rEH5GDsqjedTf/8MeQJfyuRRpCJ6kqTwqnS7ElSwy06xn9YTXTtnqS5SjulpHl
 0gaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=b3tIdqOLTAFQUjEaio+gozzSgaZAGPhsq/Gr4fWRyyY=;
 b=kNhutieY5YwoFuhULx0wc4r1CsM12DVI8Mk66LhhgS4OV+bGq4iX2BV+x8VCW4BxfE
 42e30pPrNBvP+SQuvNiS/xiKYM2iq7F2gBjTxOuiSAy3/G50FkgZXYnuSiPRwvA7akhb
 5n49ILzyCeyyrCR43Ei1yS+alKGgTormFNI9ltuTTrY0SSsTavkyfOCnWpFp3ARmtt+G
 QZ9knxhwX0XGcsc03Y1PL9GL3dPW5WhJCgvNIK2t0EOiUwMRFsD1nyj1oRpWVAuKJb7S
 ++5Wt8ifg0YSeiQ8rbbCcpnSzBRbTW6zGkksNxxzwas7UTOAVEVzHpTlTJ8po4m4Z5CQ
 9WaA==
X-Gm-Message-State: AOAM5322ZNJyzj70PShHEDLCIK4YJ0LU2uohFCCPbWNYHsbWSjYpTNhR
 RqZz8n6bWmpTLQOG08trdezB7qNZWAs=
X-Received: by 2002:adf:ee06:: with SMTP id y6mr1877950wrn.225.1597397028624; 
 Fri, 14 Aug 2020 02:23:48 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id b11sm12889395wrq.32.2020.08.14.02.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 02:23:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] hw/sd: Use sdbus_read_data/sdbus_write_data for multiple
 bytes access
Date: Fri, 14 Aug 2020 11:23:39 +0200
Message-Id: <20200814092346.21825-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Mmm+nEeQRmP

Introduce sdbus_read_data() and sdbus_write_data() methods to
access multiple bytes on the data line of a SD bus.

I haven't named then sdbus_access_block() because I expect a
block to be a power of 2, while there is no such restriction
on the SD bus (think of SPI).

We can also simplify the bcm2835_sdhost and pl181 models, but
it is simpler to first let them use the Fifo32 API.

Based-on: <20200705204630.4133-1-f4bug@amsat.org>
"hw/sd: convert legacy SDHCI devices to the SDBus API"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg720136.html

Philippe Mathieu-Daudé (7):
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

 include/hw/sd/sd.h            | 56 ++++++++++++++++++++++++++++++++---
 include/hw/sd/sdcard_legacy.h |  4 +--
 hw/sd/allwinner-sdhost.c      | 24 +++++----------
 hw/sd/bcm2835_sdhost.c        |  4 +--
 hw/sd/core.c                  | 38 +++++++++++++++++++++---
 hw/sd/milkymist-memcard.c     | 14 ++++-----
 hw/sd/omap_mmc.c              |  8 ++---
 hw/sd/pl181.c                 |  4 +--
 hw/sd/pxa2xx_mmci.c           |  4 +--
 hw/sd/sd.c                    | 16 +++++-----
 hw/sd/sdhci.c                 | 46 ++++++++--------------------
 hw/sd/ssi-sd.c                |  2 +-
 12 files changed, 132 insertions(+), 88 deletions(-)

-- 
2.21.3

