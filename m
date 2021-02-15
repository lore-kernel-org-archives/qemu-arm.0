Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5552770lfc;
        Mon, 15 Feb 2021 03:53:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwX+IwIF0YLbyTRW72qDSsDZh/YwgqhW1HeG7nU+fXnglv2lWWjPu9D2uxfARmGi7GJTE6n
X-Received: by 2002:a25:b904:: with SMTP id x4mr20755751ybj.189.1613390018196;
        Mon, 15 Feb 2021 03:53:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613390018; cv=none;
        d=google.com; s=arc-20160816;
        b=FW2Dp+3FcBiE8Nq/Ob2gmQEmJx5IDlKOJWiiXVxyO/RMjnJfyQmsuVHW//OMKxEAqa
         cEagxgJUypHFxKuYXDjGehDdf+bXevHor98cvQnQZ/lkMV47PBHTESeXv0GYbX3g/h7Y
         rVsmPqmcTEL7Thp46SD3sExLuDmNe8lN1EWJHn1mw0pCL6ruc9EYISPxqP4OJF4JRlF4
         pROxflAJxOQk2rMIP+zIYoW7xHBKOh8cNC9BbbnxsBfONZhWmzZOVhP09DAAD8OG0teA
         wRl9lrTMSbxWievUwTmPpXT9gPlYSKW7iJtz2syQPpqxZz2EH3Ccjydf56b9iqYwSdRq
         6XDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=zKBxTWgyl2c0Ezu3w8Ywtxl02/Y89qRFPX4kamMcCvU=;
        b=Xzj9ma8bEU2bZqOl/Sj7Z2N7JsY+y/PzFjtFSf65Rql+YmSjQ0ONE5TE9DXvsfpfhg
         RWjhmoJ9PQXL1MlDYu9yozmFJwwMFulBB3kmwYLBQwEX8nOQNl1T5B0qPafd9dik/jux
         kjLLrRBXpAX7FWC4KqSA/UC+7F5J6XeMS6Gt3nibUyCtp3d6HuFFe2WiF+8jAkzsibc1
         BRN8jvbI4dHM/iai9EckOKO1MfwQI3fJx1ltX0oCm16tEackAijkYfBBABF0/MOPUTFf
         9BAm6t8/cqQAXAQ0CX/Qn69PDygGvsuU5ngZiz9wJKX5XCTtAlutlKy2Pfavmc/RFL0p
         jgGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RQNh6QOm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5si9014094ybb.35.2021.02.15.03.53.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 03:53:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RQNh6QOm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBcRd-0000iW-IN
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 06:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcPy-0006be-Sb
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:51:54 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcPx-0003ko-3c
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:51:54 -0500
Received: by mail-wr1-x433.google.com with SMTP id n8so8475066wrm.10
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 03:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zKBxTWgyl2c0Ezu3w8Ywtxl02/Y89qRFPX4kamMcCvU=;
 b=RQNh6QOmkr4lRQW3u7oQmOT68A+FVCCUin9ejKjaZHCAA0/SdKnXxOncbf0xRAJUw4
 RqDQTAN7tnMd6P+fChQ7uoIwRdfiNoS6VW1Nw1QIwa6bpVB/SxYE74gSCDhtQo4rVMvA
 CKCNNIwNbp8aXbb+U0bL/bwU14KOwni6hT+iJGXTgpDWccDJCT0v9kcmnCvWJet5d3lx
 8p3hARBkq+fVxQT3J4RLlvmKr3T1lVfsnpxAgjp9uEMKWO4STFTh7s4jdIiOhrfCPyt3
 ichDCMq5jlylAezosnM3uXlL9MfNJVCUeMVMDcs52IJMyN3etq5INLgH4pBcbXmi/Dq6
 8hYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zKBxTWgyl2c0Ezu3w8Ywtxl02/Y89qRFPX4kamMcCvU=;
 b=iOF7tw2psCNfmLbFLSnUQOjrbN4OMgzY8yYG2wTrNCUKbuwkoQNcS5MJIamBvymol+
 t/SXzS6sDPcWxz8j9i1V4ccglHGs8mgdDcrQt+1qm8ciy+2HR/W9BRVLTjoMdkHVSFoU
 /RAue6/HVzO+MdlYkIn07XGpbAexKWpiuST/Mu8Z6NmBtVvXKGWZRgMaYvJIew2yuZy1
 shNz23m2RO+F7cCa9sQ1sWldvQAK9nrlSTh18ETMecdqDyiqpPINcfqFfSzvDxlw3/3p
 yB/cTChTgHB/Sipv273j4OFwmPzDSMgrxym7uGs8Sv9fEDxTGmPoWjshmslBXo/AYcLO
 joMQ==
X-Gm-Message-State: AOAM531sHkQz0J65k4r3coSnM3NvFCKAf8sdCwgRpzt8Dgk6mP8YxJLg
 apqrYY/yFf3JPS3vNVt3xrmMDB+fIRs+8A==
X-Received: by 2002:adf:b611:: with SMTP id f17mr18118727wre.8.1613389911279; 
 Mon, 15 Feb 2021 03:51:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:51:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/24] hw/arm: New board model mps3-an524
Date: Mon, 15 Feb 2021 11:51:14 +0000
Message-Id: <20210215115138.20465-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A7L9C0OE54R/

This patchseries implements a new board model in the mps2/mps3 family,
based on Application Note AN524:
https://developer.arm.com/documentation/dai0524/latest/

v1->v2 changes (very minor):
 * renamed have-switches to has_switches
 * added missing initializations of num_leds and has_switches
   for new board model
Patches still needing review: 10 - 18, 20


Like the other MPS models, this board is an FPGA image; the AN524
image is based on the SSE-200, like the mps2-an521, but it is
for the MPS3 board rather than the MPS2+. The major differences
are QSPI flash and USB (which we don't model), and support for
2GB of RAM (which we do). Since the MPS3 is very similar to the
MPS2, I've implemented mps3-an524 as a subclass of TYPE_MPS2TZ_MACHINE,
sharing most of the code with mps2-an505 and mps2-an521.

The motivation for this model is two-fold:
 * Linaro's Zephyr team would like it, so they can test their
    code targeting the MPS3 on QEMU
 * It's a useful stepping-stone towards a future MPS family model
   which uses the SSE-300 and Cortex-M55. All the "make various bits
   of mps2-tz.c be driven by per-board data structures rather than
   hardcoding them" changes will be needed for that future board model.
   This way they can be code-reviewed now, rather than making the
   future patchseries even bigger (it will be pretty large even so,
   because of all the "implement SSE-300 model" patches).

thanks
-- PMM


Peter Maydell (24):
  hw/arm/mps2-tz: Make SYSCLK frequency board-specific
  hw/misc/mps2-scc: Support configurable number of OSCCLK values
  hw/arm/mps2-tz: Correct the OSCCLK settings for mps2-an505 and
    mps2-an511
  hw/arm/mps2-tz: Make the OSCCLK settings be configurable per-board
  hw/misc/mps2-fpgaio: Make number of LEDs configurable by board
  hw/misc/mps2-fpgaio: Support SWITCH register
  hw/arm/mps2-tz: Make FPGAIO switch and LED config per-board
  hw/arm/mps2-tz: Condition IRQ splitting on number of CPUs, not board
    type
  hw/arm/mps2-tz: Make number of IRQs board-specific
  hw/misc/mps2-scc: Implement CFG_REG5 and CFG_REG6 for MPS3 AN524
  hw/arm/mps2-tz: Correct wrong interrupt numbers for DMA and SPI
  hw/arm/mps2-tz: Allow PPCPortInfo structures to specify device
    interrupts
  hw/arm/mps2-tz: Move device IRQ info to data structures
  hw/arm/mps2-tz: Size the uart-irq-orgate based on the number of UARTs
  hw/arm/mps2-tz: Allow boards to have different PPCInfo data
  hw/arm/mps2-tz: Make RAM arrangement board-specific
  hw/arm/mps2-tz: Set MachineClass default_ram info from RAMInfo data
  hw/arm/mps2-tz: Support ROMs as well as RAMs
  hw/arm/mps2-tz: Get armv7m_load_kernel() size argument from RAMInfo
  hw/arm/mps2-tz: Add new mps3-an524 board
  hw/arm/mps2-tz: Stub out USB controller for mps3-an524
  hw/arm/mps2-tz: Provide PL031 RTC on mps3-an524
  docs/system/arm/mps2.rst: Document the new mps3-an524 board
  hw/arm/mps2: Update old infocenter.arm.com URLs

 docs/system/arm/mps2.rst         |  24 +-
 include/hw/arm/armsse.h          |   4 +-
 include/hw/misc/armsse-cpuid.h   |   2 +-
 include/hw/misc/armsse-mhu.h     |   2 +-
 include/hw/misc/iotkit-secctl.h  |   2 +-
 include/hw/misc/iotkit-sysctl.h  |   2 +-
 include/hw/misc/iotkit-sysinfo.h |   2 +-
 include/hw/misc/mps2-fpgaio.h    |   8 +-
 include/hw/misc/mps2-scc.h       |  10 +-
 hw/arm/mps2-tz.c                 | 632 +++++++++++++++++++++++++------
 hw/arm/mps2.c                    |   5 +
 hw/misc/armsse-cpuid.c           |   2 +-
 hw/misc/armsse-mhu.c             |   2 +-
 hw/misc/iotkit-sysctl.c          |   2 +-
 hw/misc/iotkit-sysinfo.c         |   2 +-
 hw/misc/mps2-fpgaio.c            |  43 ++-
 hw/misc/mps2-scc.c               |  93 ++++-
 17 files changed, 680 insertions(+), 157 deletions(-)

-- 
2.20.1

