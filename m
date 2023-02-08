Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp133554ejb;
        Wed, 8 Feb 2023 15:55:01 -0800 (PST)
X-Google-Smtp-Source: AK7set/60MrYacTJZ4irsKmS8X5dzfgGHi6kGizOawP76wU5GcydmfFPR0zNa1XmMxy58+QyTftD
X-Received: by 2002:a05:622a:1a0d:b0:3b9:b42a:7fb5 with SMTP id f13-20020a05622a1a0d00b003b9b42a7fb5mr16585743qtb.56.1675900501323;
        Wed, 08 Feb 2023 15:55:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675900501; cv=none;
        d=google.com; s=arc-20160816;
        b=e74Q0LR+KXvUObPAFAjurGNLEAZOchvS1hdPjPlmI3V7pJAC6HEZCrI/n+mNJoomLB
         omNROomlFMiwjTwJWM2+/0npok/TO9RXjGa9EcchRrNrFeAmNexDM3SpPb6+ToRaiJ+h
         icl0Jiy0tShFtSvcL6PDGsjWO5NrBAHW7DZgLtZ7AzHzrGdM/tFU+JlDnRgQDyJynege
         8MJOlv8DTeL6KBz3oIWGFsfhRVyH9YnnyuWEugAfl4b/91AjMXHUM7Wy6ZlDYpKwpMXO
         feU9J+qVEvOcAWuKxnlSvdKnz9MbP0isk/QqxTmAyIRhdFiRMhzAUJYN49/hr6peq2PY
         2ooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=POZ93p9zftXIYOaqzhswzbaseGp2hKv+gLQb0c30ivU=;
        b=zSQeUwcsBp5ypZ6wyi5xv7GIPlJUP5/j5fT/J1a4Ixm1fVyKHszMZCS1eY93wIZRoa
         VMtGDKm5QLIVZVU7EezsWxpFkRt9NX1+RMHMszz2+GR3Klaai3lkctgeV8m89HzUVRyV
         3qJZLYcDuGh4Jz6neQEbON+NQUH1SgAQ1NWdEOu1in2TI2qK+8E6jlDroALd2kdMEJl8
         qu7kBSTCV83PXUwvZYMma3Iv1j/dhC32GWrRZ2Oh9Ayrzva6IZQGM+GhoTe4hJxXFjVo
         lhawgcQaGS5a1Q6N6a6pc+DMe67lEj+dZRGqjlYAcwCKvLb6+JuintWD8tYdWO2+JnJe
         dUmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=eMxRcRz5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq36-20020a05620a46a400b007332f66ca42si188162qkb.617.2023.02.08.15.55.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 15:55:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=eMxRcRz5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPuH0-0002SX-Hi; Wed, 08 Feb 2023 18:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3PTbkYwgKCGAUSF8MRQFEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--wuhaotsh.bounces.google.com>)
 id 1pPuGw-0002Rl-TI
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 18:54:44 -0500
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3PTbkYwgKCGAUSF8MRQFEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--wuhaotsh.bounces.google.com>)
 id 1pPuGu-0003U3-EW
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 18:54:42 -0500
Received: by mail-pg1-x549.google.com with SMTP id
 r126-20020a632b84000000b004393806c06eso249000pgr.4
 for <qemu-arm@nongnu.org>; Wed, 08 Feb 2023 15:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1675900477;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=POZ93p9zftXIYOaqzhswzbaseGp2hKv+gLQb0c30ivU=;
 b=eMxRcRz5w0igN4gCVMKKGqSVWA1/u77HGygsVDVfSjGarbxpSu+6KdryMUdz5O7uhk
 qznHFS5LnBmGAKTPnhZsOhMcYRl/peWjTL0Iki841mK71uGh/DV6C+5l50JzDrgebTAR
 Crx8X7nzoEd0xeuZXAcPEGQ/1tqaHbG7DoroWZvDMAShki94b3fXkTu0PdeqfLqKhRXN
 xBoiqpsanJxcZDOCCYR6q+t+evMKcG9k8ZJaLBnOC+YyRf8zk66sNfFYTM2y6LfANPQ0
 kDHVCc8Jbr3BwUSBm3Snq9kI0IopMa137bmal56lDb/duEGNKS9ts+1yvAXdofgWWug7
 kl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1675900477;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=POZ93p9zftXIYOaqzhswzbaseGp2hKv+gLQb0c30ivU=;
 b=2CDPpIGDgUHxyk1otmKdvBMCNiQGHlDDTLOOW0y0c00BFAZZcr52TnIhX1XsnEErd2
 uzd2XpWTHoERCgpnFJ4hCMwCyDmckObXQnqh8w30EagKINv12wAtALS0yw3FoWrl63Lb
 aWerqfDxs1mpTOFodasH38DFsd8sNsRH8Yg770QvPl2wYDMbOajErtWxngtrONTfOAVB
 fCQOU59uZgIHP5eARu9WVobxcq350/iWMgxof5GiKTvtN7STi5I4FfqxrSjUXj6lilna
 0JvyjVvkeDrhLNyweKoB/MyuowFk1VPSNEQ1af+bod3fBYY7rj9kZI0mBfjCATLgNA5T
 C5xw==
X-Gm-Message-State: AO0yUKXuJcT/sXidDni2mw/XEVnsRWw/+zlTMysmp5eMjV/t0zxT4TQh
 DD7TyhJ3FU7JuMudMV7QJk6maoIMqaLzOg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:1b83:0:b0:593:fa6a:b960 with SMTP id
 b125-20020a621b83000000b00593fa6ab960mr1998772pfb.48.1675900477078; Wed, 08
 Feb 2023 15:54:37 -0800 (PST)
Date: Wed,  8 Feb 2023 15:54:30 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230208235433.3989937-1-wuhaotsh@google.com>
Subject: [PATCH v3 0/3] Nuvoton Peripheral SPI (PSPI) Module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3PTbkYwgKCGAUSF8MRQFEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 7P3Jdr/fzsVL

This patch set adds peripheral SPI (PSPI) modules
to NPCM7XX SoCs. These modules can be used to
connect any SPI peripheral devices to the SoC.

This module will also be used in the next generation
NPCM8XX SoCs which haven't been merged yet.

-- Changes from v2 --
Change max_access_size to 2 to match the datasheet.

-- Changes from v1 --
A few minor updates for npcm-pspi.c according to
Phillipe Mathieu-Daude's review.

Thanks!

Hao Wu (3):
  MAINTAINERS: Add myself to maintainers and remove Havard
  hw/ssi: Add Nuvoton PSPI Module
  hw/arm: Attach PSPI module to NPCM7XX SoC

 MAINTAINERS                 |   8 +-
 docs/system/arm/nuvoton.rst |   2 +-
 hw/arm/npcm7xx.c            |  25 +++-
 hw/ssi/meson.build          |   2 +-
 hw/ssi/npcm_pspi.c          | 221 ++++++++++++++++++++++++++++++++++++
 hw/ssi/trace-events         |   5 +
 include/hw/arm/npcm7xx.h    |   2 +
 include/hw/ssi/npcm_pspi.h  |  53 +++++++++
 8 files changed, 310 insertions(+), 8 deletions(-)
 create mode 100644 hw/ssi/npcm_pspi.c
 create mode 100644 include/hw/ssi/npcm_pspi.h

-- 
2.39.1.519.gcb327c4b5f-goog

