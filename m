Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp701455ejj;
        Mon, 25 Mar 2024 06:33:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVqMWzvSs5yBqWBfcLM1jqVF+ZP3OgIO6+yaV7jTvp5mgFuYYEY4ax962AfQbMp5Xm6dW5MWUpOHzPZzWAQQx+Bjc/eDiid
X-Google-Smtp-Source: AGHT+IGcR8CVsIEISM6uBa9/kuFHqbo8T3TeQQuX/UtlumXscHhyjDn+4Vx0mBiXtUrYuwFG+2zj
X-Received: by 2002:a05:620a:9c7:b0:789:dd47:2ea2 with SMTP id y7-20020a05620a09c700b00789dd472ea2mr7919494qky.66.1711373603782;
        Mon, 25 Mar 2024 06:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711373603; cv=none;
        d=google.com; s=arc-20160816;
        b=uZMkWOEoye5OiyKFEar+tkuEBw3QknntmPW7k9xf4BfHgxJCEB/T28PyZW1t6EnBNQ
         yYWrUBOE7Uu/VHgClR4Q0TRm+LZSWiBkuR6lnThBHHRSdbUr37Q7IZUrA+3InXENYFeZ
         7BcOu+rbZVFIG9BaeTt6k6GNNWS390WnYjeORzdlSCZT/N2obv3MDY8ilyuKkMD+eTLH
         Q6qaK98mo8SX2dxUxajSsN5hmFuZ6u4RUr4PdRcrmhN9AWZs417Htd9Zhofch46Gjhv2
         4yCtGz1DmT7JBOa09d74rMuw8xYM83qMhEv/gxqsdjypuFdz2TJQARHDtK7wdVnCX9Ze
         cscw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=mCxNPNDuz72bEraA+KHzlReHJxE9cKV4qETiCw6TYOw=;
        fh=g+V9zXfbPjmDPKlQY5AwJoLz1eLSgNCfgFBeZnVpYu0=;
        b=ITDIcRLaDdcNTCfwMxeVJXbGCdQxL4+RusexjJ5QIzfsVB0casqHpP+OriVW4NiAIR
         bDMmNuJF5sSAM96CZmLpus+ypEBip7V7eUR3V5l17rjAvnWkXTxHNw6LJMU0pbirdsU4
         aDDx9bxLpY0v+HORpWq+uLb+g+vpeZvypS3jymFgl+p8gqouVIKLHPvuq2IWFf6mxQki
         D69EzIp4i82fDfL8r8FRwQSzlekHRzD1x/kcSMwtqi0zgCQnGaPMzIS8VvlpuUpyJPje
         sRNlVFaGlb2l5b7hhs0NpQflgMhZTRdcbI0ff/c/c5eJsCrvSLpcmm8nebHUtDZQNfgC
         mSkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lZrWSbKL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15-20020a05620a146f00b007887d6a5044si5327285qkl.277.2024.03.25.06.33.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 06:33:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lZrWSbKL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rokRr-0002Uz-Uc; Mon, 25 Mar 2024 09:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rokRn-0002TJ-Jg
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 09:33:10 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rokRk-0007Jc-8K
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 09:33:06 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-414859830f2so9018555e9.0
 for <qemu-arm@nongnu.org>; Mon, 25 Mar 2024 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711373582; x=1711978382; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mCxNPNDuz72bEraA+KHzlReHJxE9cKV4qETiCw6TYOw=;
 b=lZrWSbKLVfF7/Ol5Xa1dz4GpM0WyOBcI6UkOz2ff1Noqi4RIV0bWS3Ip3gjn7jTqYN
 IplkwURHGl6hnMuSlmK/tc2OYN112211BIbG3OrkqKr2BLx/VrQTJoHpWBEnPszHCKs3
 2eXLiwLqGsUZ/HRA4y89uvmh59lZ9Pd9GCOW3HJwF0D7evRcCgnLY035++cFQn/GCMYU
 W8BeqyJG7i/ncSxOkYJ0CmbzqD4lG44MTiULGjlGlFeYJt/5PuLb7JzolBMFlPLBz20j
 U0WF/aA8MgUL3Qv5bh+EGtGgShVUaLVy+Wrbk9oTo9uxBPBlalTocUYzYcMgUaiv3s9v
 0wBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711373582; x=1711978382;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mCxNPNDuz72bEraA+KHzlReHJxE9cKV4qETiCw6TYOw=;
 b=Z2zoslzkqTrilCLahinoo0cB8HjUib5IrhTuoxb2spxAB9jV2wy/kACVgobsgT1+aL
 wvipRzIYg6JAEcfJmy4RMT0zLmzhAzy8Xbw7MHmsbtClt2sVBwebr/ZBY7Q3Mdztxh3t
 6t0ZyBZVynLG4AoyXvG+rQ8hgv7WJ0DQ9r3gbcLJEcA6MVie9pKyaIR4YidasXBaFwh1
 ySvDO4cS+wD3sXIAR8iPh1sY+gdpHpNJHPJ6tHGkfBmQtl4VfZG02xhCQDbX+ko6pyRq
 3Opi4xPz/VKydTBI3Acvqz3dfdTlMynjPlayBPLzl1AklqvB5rZXAZ93DIS+Axb9snfV
 VjRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0b8mcSdeTTFIDPas8+QdlAJTO4XlWfmpfLiF503DgIXSSIxZl8CKac/kzjz6bUfv/9gR1Ze9yCt6ix6nYFl2Gw/Ls
X-Gm-Message-State: AOJu0YxebZTEqlB26O67Jlq0ew3aVitks/zJjKrnuewcVBfz/ZQ/AA6x
 TGoWVqBYHP7/Jbk9aY2xgNnLBWiR9GffjKdf0+MJe1itJUb4myDeZ403S/gtVm0=
X-Received: by 2002:a05:600c:35d2:b0:414:ff4:5957 with SMTP id
 r18-20020a05600c35d200b004140ff45957mr4398058wmq.5.1711373582156; 
 Mon, 25 Mar 2024 06:33:02 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.208.214])
 by smtp.gmail.com with ESMTPSA id
 ay4-20020a5d6f04000000b0033e48db23bdsm9640652wrb.100.2024.03.25.06.33.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Mar 2024 06:33:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Damien Hedde <damien.hedde@dahe.fr>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0? v2 0/8] hw/clock: Propagate clock changes when
 STM32L4X5 MUX is updated
Date: Mon, 25 Mar 2024 14:32:50 +0100
Message-ID: <20240325133259.57235-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: BtC1w9QHNjAI

Since v1:
- Rework API to only propagate when both clock_set
  and clock_set_mul_div modified the clock params
  (Peter & Luc).
- Use that in zynq_slcr.

Per https://www.qemu.org/docs/master/devel/clocks.html#clock-multiplier-and-divider-settings:

  Note that clock_set_mul_div() does not automatically call
  clock_propagate(). If you make a runtime change to the
  multiplier or divider you must call clock_propagate() yourself.

Fix what we forgot to do that in recent commit ec7d83acbd
("hw/misc/stm32l4x5_rcc: Add an internal clock multiplexer object")

Arnaud Minier (1):
  hw/misc/stm32l4x5_rcc: Propagate period when enabling a clock

Philippe Mathieu-Daudé (7):
  hw/clock: Have clock_set_mul_div() return early when nothing to change
  hw/clock: Pass optional &bool argument to clock_set()
  hw/clock: Pass optional &bool argument to clock_set_ns()
  hw/clock: Pass optional &bool argument to clock_set_hz()
  hw/clock: Pass optional &bool argument to clock_set_mul_div()
  hw/misc/stm32l4x5_rcc: Inline clock_update() in clock_mux_update()
  hw/misc/zynq_slcr: Only propagate clock changes when necessary

 docs/devel/clocks.rst      |  6 +++++-
 include/hw/clock.h         | 21 +++++++++++---------
 hw/arm/aspeed.c            |  2 +-
 hw/arm/fby35.c             |  2 +-
 hw/arm/mps2-tz.c           |  4 ++--
 hw/arm/mps2.c              |  4 ++--
 hw/arm/mps3r.c             |  2 +-
 hw/arm/msf2-soc.c          |  2 +-
 hw/arm/msf2-som.c          |  2 +-
 hw/arm/musca.c             |  4 ++--
 hw/arm/netduino2.c         |  2 +-
 hw/arm/netduinoplus2.c     |  2 +-
 hw/arm/nrf51_soc.c         |  2 +-
 hw/arm/olimex-stm32-h405.c |  2 +-
 hw/arm/stellaris.c         |  2 +-
 hw/arm/stm32f100_soc.c     |  2 +-
 hw/arm/stm32f205_soc.c     |  2 +-
 hw/arm/stm32f405_soc.c     |  2 +-
 hw/arm/stm32vldiscovery.c  |  2 +-
 hw/arm/xilinx_zynq.c       |  2 +-
 hw/char/cadence_uart.c     |  4 ++--
 hw/core/clock.c            | 19 +++++++++++++++----
 hw/misc/bcm2835_cprman.c   |  2 +-
 hw/misc/stm32l4x5_rcc.c    |  9 +++++++--
 hw/misc/zynq_slcr.c        | 39 +++++++++++++++++++++++++-------------
 25 files changed, 89 insertions(+), 53 deletions(-)

-- 
2.41.0

