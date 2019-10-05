Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1803751wrm;
        Sat, 5 Oct 2019 08:48:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqydneF1tmeW4vqK78FvupXiu0qHXdNWUk3c84uF8MWg48bHn59j0h7EqFhWOpWm1Rq3wCWB
X-Received: by 2002:a0c:b34a:: with SMTP id a10mr19764598qvf.195.1570290518370;
        Sat, 05 Oct 2019 08:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570290518; cv=none;
        d=google.com; s=arc-20160816;
        b=tJNfTfux+EB2qAUrH2JgIDYZwMJ/CoaUb+Hn5WGVi4zE2qAkNDtT+Ai6k2XOW88lZu
         mwN5tLJGmdeCOZUDoxXmtKl5gyHASV8B/HOkjOUFHMpWNjevkSnS3vE1zwGlVoN797nk
         JFSWLN92h4Bzwvi0UQIlm29hCU6BXVypS7csFyatt7hJdXCR1azl35QYsw2Tmmu1hgVw
         4qTlNlzDUVdeyps0tn/cp7AInZq46QAYL7Lhbm+cWXhQGFcfxZaNdxQo15jf7KI/1xpd
         oe8gvcWNQcFkbWVLgo0lsr/jXWJMGJLqRDFrHqcs5+Z+eMvmGo8HITubpEVa2z/Ryv4H
         dTrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=+KZkCjnpWsck0vFdcK+J/MedLmjgtJnly7P8Steiz+s=;
        b=rXqVMOsuuRCsuxp7wV0b0gUBjkDYPSOZB36z9+c5ehZ6lNgzAULfdpDO8WZdDkeNNS
         KBOK6VBDdHEO8F+XPOeJEVbBPPiuekpMRUyK7TbjWC9WyzHBeiq8/DFNqhWixI9vxgc6
         4umhfp98cn20a6z2bmXmZrmYvS4bTH5ciPpK7VIcHG8wejAeoLDFk0hHl2vyj7P3nbrl
         d0MjtWyonxFEIgWB+HZj3/h/PLD8iV2ysb9ZUnN7LXGhjmU3GdxgljkIHNw9JnTKzJIS
         7QP2IU7fFXAUixdip/adfP5SBlOHOkGE15dr/DuxWqDjpthGS0CeF8uYU7mG6Adim7kX
         iVZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Tz2OBEzn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v44si9050008qtj.96.2019.10.05.08.48.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Oct 2019 08:48:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Tz2OBEzn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGmIO-0008N7-Sp
	for alex.bennee@linaro.org; Sat, 05 Oct 2019 11:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46597)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iGmHo-0008KK-Ph
 for qemu-arm@nongnu.org; Sat, 05 Oct 2019 11:48:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iGmHn-0007zE-8c
 for qemu-arm@nongnu.org; Sat, 05 Oct 2019 11:48:00 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34422)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iGmHj-0007vr-Dm; Sat, 05 Oct 2019 11:47:55 -0400
Received: by mail-wr1-x444.google.com with SMTP id j11so4697848wrp.1;
 Sat, 05 Oct 2019 08:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+KZkCjnpWsck0vFdcK+J/MedLmjgtJnly7P8Steiz+s=;
 b=Tz2OBEznFhNeytBK64c7xOLNFyT6xWjSeKR/RSxfEHRIFkCQBXsHyqtWiILBWwA3lU
 GXshkZcYSomlj/2AdpzVQsDQ5NbkZ6A2hz9tuhHnro14QFMm1BPWhBpJTBIFC2WhUhtr
 SuxOOIOCj/IHhp4h915BQqbnnyERKqcYrrrpW27XDCZNhmONJCM92i88r0pVxUxNBO4T
 4u/nWyKBDRCAL8WfBxmy4KPFDprsdFFIVikg5Wye4sZgNMU/wrxDE1xkcMuikA1THrKA
 48XsCiOnjHWAvT0esQpvLNokuL+aBXSDAmkIBzjWSj+VWt3GXmw4XTufKN2FmSKxaNut
 UG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+KZkCjnpWsck0vFdcK+J/MedLmjgtJnly7P8Steiz+s=;
 b=Y0Kve6Btmf46g0gQecavx1DEDS4girCehDLP/ydD2tmizusczVoC5TIzn/quddUEiS
 Yhxc+ILFWWKzl4dZTSYjLTP6kCUg2mYKjKFlXuQ76q5xRW9bCGATgHSmdnGMAcmwL+wk
 UrjKO+x/N/IefyVHAPLJ4nUygIe5kLU/uDYXDVmGpNudWBkjuE5nhCnmbW6ITBM1WVlp
 xE/XLwd6vjdVRogaHDADPuictodisDWZyDcJpxt7W4lRhlQqLOKiR3l4fdCXQbKtp8LT
 ZLv0ukzE6br85BVUcT6OvVSFvxFy5IHVqQMOG6cwzgnqQIOjl5GPqc2fYH4SVYEVwGWs
 LwOQ==
X-Gm-Message-State: APjAAAWTurqpgf6IdrSFsaopgy2Q/+G5hLoMsjWKuuS7bEU3PaO0g3ey
 i3Ha8F5TBjloDqOfLg0wcsPBeQKFaDY=
X-Received: by 2002:adf:f64f:: with SMTP id x15mr16461725wrp.25.1570290471559; 
 Sat, 05 Oct 2019 08:47:51 -0700 (PDT)
Received: from localhost.localdomain (46.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.46])
 by smtp.gmail.com with ESMTPSA id o22sm24542294wra.96.2019.10.05.08.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2019 08:47:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] hw/arm/exynos4210: Add acceptance tests to the SMDKC210
 board
Date: Sat,  5 Oct 2019 17:47:43 +0200
Message-Id: <20191005154748.21718-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Basse?= <contact@fredericb.info>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Evgeny Voevodin <e.voevodin@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Dmitry Solodkiy <d.solodkiy@samsung.com>, Cleber Rosa <crosa@redhat.com>,
 Maksim Kozlov <m.kozlov@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yhy6Yas2vAcJ

Hi all,

Yesterday Peter Maydell asked on IRC if I had any working Exynos4
image. I looked at some old backuped notes and could boot Guenter
initrd with BusyBox.
I'll use this cover letter to share my notes, they might help to
have this board fully usable again.

This board is listed as "Odd Fixes". Since we have it covered, I
thought it was worthwhile to have it covered by tests to avoid
more regressions.

Frédéric Basse used this board last year:
https://fredericb.info/2018/03/emulating-exynos-4210-bootrom-in-qemu.html

I'll have a look a these particular commits he added:

- https://github.com/frederic/qemu-exynos-bootrom/commit/9be5c9f2253dbc04ee

   sd: add sd clock support to SDHC_CLKCON

- https://github.com/frederic/qemu-exynos-bootrom/commit/6f045949ee2fdec624

   sd: always reply to ACMD41 (SD_APP_OP_COND)

Guenter also carries on this patch:

- https://github.com/groeck/qemu/commit/0a80543cc910d

  hw/timer/exynos4210_mct: Initialize timer before starting it

  When booting a recent Linux kernel, the qemu message "Timer with period
  zero, disabling" is seen, apparently because a timer is started before
  being initialized.  Fix the problem by initializing the offending timer
  before starting it.

It might also be interesting to use Krzysztof's initramfs image:
https://github.com/krzk/tools/blob/master/run-qemu.sh#L29

The 1st test added works fine, however the 2nd (SD card) is not
reliable so it is disabled. We might need to adapt the ADMA patch
Igor sent once:
https://patchwork.ozlabs.org/patch/181854/

If you want to run the Avocado tests, you need these other patches
pending review:

- https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg06439.html
  "tests/boot_linux_console: Extract the gunzip() helper"

- https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg06438.html
  "python/qemu/machine: Allow to use other serial consoles than default"
  (only for the 2nd disabled test)

Regards,

Phil.

Based-on: 20190926173428.10713-16-f4bug@amsat.org

Philippe Mathieu-Daudé (5):
  tests/boot_linux_console: Add initrd test for the Exynos4210
  hw/sd/sdhci: Add a comment to distinct the i.MX eSDHC functions
  hw/sd/sdhci: Add dummy Samsung SDHCI controller
  hw/arm/exynos4210: Use the Samsung s3c SDHCI controller
  tests/boot_linux_console: Add sdcard test for the Exynos4210

 hw/arm/exynos4210.c                    |  2 +-
 hw/sd/sdhci.c                          | 68 +++++++++++++++++++-
 include/hw/sd/sdhci.h                  |  2 +
 tests/acceptance/boot_linux_console.py | 88 ++++++++++++++++++++++++++
 4 files changed, 158 insertions(+), 2 deletions(-)

-- 
2.20.1

