Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp709338ejc;
        Sat, 11 Mar 2023 06:41:55 -0800 (PST)
X-Google-Smtp-Source: AK7set/r6Oj8ic0UyQg52razZEeqKsxJNd4fZ3TaGzj0DX4Vqoas466t1LESYO4HjQNEHfbqSYpL
X-Received: by 2002:a05:622a:60f:b0:3bf:b89a:64b6 with SMTP id z15-20020a05622a060f00b003bfb89a64b6mr54313510qta.34.1678545714927;
        Sat, 11 Mar 2023 06:41:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678545714; cv=none;
        d=google.com; s=arc-20160816;
        b=H/10RT4IQ0fozIr7f1dkeW/YBZvkyVleqqFz67Wr9jxigxc4j76mjua32J/Ep3hUet
         yhpmozu5XquJkyJVLRYXCNV5Y09CT7Dyl3jAR/egsfOzE/LclCD8gZ8fKf6ZjR3hkweU
         08+5k8kz7HutHGmGUsjREB8H1Y1Cju5RydTg+QifF7p54H1u1equraLzz5H51h/qJDDU
         p/X7t050EbRcdIkFBZmPi6iBdTj0RTbjK5pk17RYDuJjFU4E/OL/3Zxk5yKXtICxMXxL
         fBE8z6bdQf+7qIv8bKZxOi7huubXp/un+FD/YyZfyxN05J5OlVnyHamzhVckVMPmAuUf
         6rhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=q42whdHGBFMGEBTgoImAuCBpVtWDDVbnXWNrP012RZw=;
        b=YsDgYD3/UH16wh6Q3osVwl9miQjPb7aegbFgWLmXKcnB/K3Bd273QYZJVo4kWwRRGh
         48WodDjzU4vu9l3hBby0H0v4rv/2sk28kPH3h2Ve/xTm82CtUYy7mEnY9dB5r77SDcxt
         uVTyAHzEhqMnMvDoeguec3FXB8ttHv1RxzTJXYlTvDx0s7h6WRwsDmPNmtP8QWbihd8k
         McNrVOMt2HOa3ifvNHIZGRg1UFLyWnWrzJ7eq6QTCB/eyFJSRKs5Jc7MuA/a6+oL3xXQ
         nVPAlUorCa3YsrKmSiv4iC6uN9fsqoFm2iqWFpIGVAWFNQhXDqRGvGxuP5OQzE/ybbfE
         KXrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mm1A2R5K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20-20020ac85bd4000000b003bfb0f0b695si1839344qtb.742.2023.03.11.06.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Mar 2023 06:41:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mm1A2R5K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pb0Pr-0003yM-Os; Sat, 11 Mar 2023 09:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pb0Po-0003y7-RK; Sat, 11 Mar 2023 09:41:46 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pb0Pm-0002lW-GY; Sat, 11 Mar 2023 09:41:44 -0500
Received: by mail-lf1-x132.google.com with SMTP id s22so10316132lfi.9;
 Sat, 11 Mar 2023 06:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678545700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q42whdHGBFMGEBTgoImAuCBpVtWDDVbnXWNrP012RZw=;
 b=Mm1A2R5KsEi01wPD+OEEsTT1BGPEba2Kn/AWOenH2nt50jGQZpQuEbI70RKLzpx4bV
 +xmuMa4XFLLEFhpybFGLjcOaWyyhOs0eJ4YOgCxP3plkeXAyWKvKCbNtyyyLsRQcQvd2
 St5RvWnqCt6SuB0N89u08JObAszyOa+uwGRsuyqNB0FNYxGkuXhql6HjOgVgI7a+bpOz
 M7mOqxRck/mvnEfpg+tPVaXILsugRW9uUCZHASTqNi9sv03+aZ7djQzq1MFDAedBmuAg
 Reo3nF9PejKo+OTSXPaVkNo7aKNhtmCvdTpmDdEB9CWz9K/Cc8aXxynkf9eczbupZqUm
 MAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678545700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q42whdHGBFMGEBTgoImAuCBpVtWDDVbnXWNrP012RZw=;
 b=WdpTQoSziy9vPRBv2E0T4Cm3Fenu+6hm490aPV2eILz37sznGMpaILSZVgpi05Vzzs
 UdCTlekC4wbtObSQrg01+WvQzPZeRsK+PIr3yJ67e/Wn9tKK2imcZWzwliA5TzioPQtL
 pXG3kx5Kmit7zC6gUL8+yIeGHu4QZ2o5TTbkp04ISFYkG9fa2ogr2TTxCGeg9klX82v9
 3+Cnd74oNaBtfco2REICl6By9Vfx2PTubLN4QdIqkh+Cxvhn6sx8EbErixb6T9ICFvpO
 Q+L6zTGnvIIWLuvyV8yOGUWIKr9zOITukVyLRNahuAc10LU3FTMqL1cReqryRo0wd3sq
 KCBg==
X-Gm-Message-State: AO0yUKW6p+S99W2vY94Tf1D2mMXlJAOGOrFWnm49xmUMR2JpIKKQoKI9
 HYS8x+vUCClYGz4a0LxS3+g=
X-Received: by 2002:ac2:5edb:0:b0:4b5:9e70:ca6e with SMTP id
 d27-20020ac25edb000000b004b59e70ca6emr1827806lfq.17.1678545700320; 
 Sat, 11 Mar 2023 06:41:40 -0800 (PST)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 g15-20020a19ee0f000000b004d887e0e9edsm333320lfb.168.2023.03.11.06.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 06:41:40 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH 0/4] Basic Allwinner WDT emulation
Date: Sat, 11 Mar 2023 15:41:07 +0100
Message-Id: <20230311144111.30468-1-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x132.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Kf9nXezV4g2F

This patch set introduces basic emulation of Allwinner WDT.
Since WDT in both A10 and H3 is part of Timer module, the WDT
functionality is added as an overlay in the memory map.

The focus was to enable reboot functionality, so WDT interrupt handling
is not covered in this patch set.

With these patches the `reboot` command can be used for both Cubieboard
and Orangepi-PC in order to restart the system.

Also, Cubieboard avocado tests have been improved to include reboot
steps as well.


Strahinja Jankovic (4):
  hw/watchdog: Allwinner WDT emulation for system reset
  hw/arm: Add WDT to Allwinner-A10 and Cubieboard
  hw/arm: Add WDT to Allwinner-H3 and Orangepi-PC
  tests/avocado: Add reboot tests to Cubieboard

 docs/system/arm/cubieboard.rst      |   1 +
 docs/system/arm/orangepi.rst        |   1 +
 hw/arm/Kconfig                      |   2 +
 hw/arm/allwinner-a10.c              |   7 +
 hw/arm/allwinner-h3.c               |   8 +
 hw/watchdog/Kconfig                 |   4 +
 hw/watchdog/allwinner-wdt.c         | 428 ++++++++++++++++++++++++++++
 hw/watchdog/meson.build             |   1 +
 hw/watchdog/trace-events            |   7 +
 include/hw/arm/allwinner-a10.h      |   2 +
 include/hw/arm/allwinner-h3.h       |   5 +-
 include/hw/watchdog/allwinner-wdt.h | 123 ++++++++
 tests/avocado/boot_linux_console.py |  15 +-
 13 files changed, 600 insertions(+), 4 deletions(-)
 create mode 100644 hw/watchdog/allwinner-wdt.c
 create mode 100644 include/hw/watchdog/allwinner-wdt.h

-- 
2.30.2

