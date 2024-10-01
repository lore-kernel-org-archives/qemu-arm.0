Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp473734njl;
        Tue, 1 Oct 2024 15:14:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWz5qNv85tKR0TSsq2SiZxcRT+Hr3WnwPcPU6j7rEmqI/TB4BBDil/Y2580B/UZSCOZOjnbtJaNgBhJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEZjztoxs+TFM2NwPlwfJeLyQGnGsBYlfNQ9qNd6B6nlTYZ2HCfarcGAQqHlZbHlb+lpr+l
X-Received: by 2002:a05:620a:4085:b0:7a9:b4c7:3e18 with SMTP id af79cd13be357-7ae626d3ff6mr168160185a.31.1727820894601;
        Tue, 01 Oct 2024 15:14:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727820894; cv=none;
        d=google.com; s=arc-20240605;
        b=OalOaID0FGSQNevYnvq09Ov3FxUV7kNZhfdU5/o42rmUE+rPOOHObGWg2yU0YJpvLY
         CNFE1q72NoewQyX5vMvQ300eeRpx4dqYFDKmSdm6mUppZCFepGZuC0GJjxn12okZGFOk
         DpjmZRKRzcyO5F2q+W+6BzC4ImpXhYKnO5+4HKOAP3sRmEgwXZNosjCtbiVUwjMTvuv7
         zPJDcUD1UfUC5N60/m4piYtqyLw6wmAeMwPdMi/V7iZEzBxZDbm09FP3W8oEWZbHi3Nh
         XZu4bfTZWryGXS+j6+UTcDqOBhCDzzYw/1HdsjGirE9hoLkavkGyCH7uRi+Ae9DMvm/C
         6/FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=7t5vPsaQKUnULYefu5NqEuv86jfTz+27PBzPn+ax9C4=;
        fh=DxaMxJE/OCBapet5cUYnrWuD15MNv09DgdlInaqNObk=;
        b=N/M07KZ3JpUW3qX3U9cElgAfxXD1P5+y04hhknyewloN5Uhw3QBCbyBrVD//TbTH71
         56aXiLAIHH7sBTX/q1AZC/vd1u1HmrD14TdbwsBm2rZtYmcuc9exhfUmfR9XMYqeBvq9
         0KiVZFAqE4tJ0bT8yoFFfuI+dL/rBBgmXnGrDzIfhyOY6lMQcMPfk6q/HZSmNAxuGPyM
         D3dGluGaENgNzeKLIxWsAsfTpGcwzxT1s9YDGBuLWmUF3/JicWJRnRq+F30wwU5C2kms
         g3n+fgW7p7nyzsfJMIV9vBcGIr3EAxfGWRwRCk8PQgOrbynaAA9KEOP89IZDdPBBYxZP
         O8dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=lriPBs3F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae41e67b34si832857685a.152.2024.10.01.15.14.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2024 15:14:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=lriPBs3F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svl8M-0006ji-7W; Tue, 01 Oct 2024 18:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1svl8J-0006hT-7P; Tue, 01 Oct 2024 18:14:15 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1svl8G-0002Un-Ai; Tue, 01 Oct 2024 18:14:14 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5389e24a4d1so6019199e87.3; 
 Tue, 01 Oct 2024 15:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727820848; x=1728425648; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7t5vPsaQKUnULYefu5NqEuv86jfTz+27PBzPn+ax9C4=;
 b=lriPBs3FltYYv6QFPbQLXcXabwzShi9dYrvBMTpEP6nacscjkihUNlWIwMTfPA2d93
 oNk+MpRZ1X/+pnM+ZR0Kc9E+tCjgBE0nVs0UKUIN5WzUitBv+S0qhgwJH8oPY4jTRpYv
 6QzZ12GLVVIvXTaWc9V/lHVjr2fbn6v93gIfc6RyqTl+kB9qqmEI79VWoiPzXqCfiyNf
 joTUssvR8fb8DNIuaMA2ZKBatl/vhUVjLbx+pbPnF98O7h+Qi4bv+WYT7BZEj6o6+Yyl
 SKfjJ8q/Poc/jDxFzcwtiMWmwf1LNxBoGhYE8LoIbSdUU1vmRCsnf9PPCcAPfs7vjSt0
 1suQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727820848; x=1728425648;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7t5vPsaQKUnULYefu5NqEuv86jfTz+27PBzPn+ax9C4=;
 b=WKDTq8Ao5OdElasqUZ0EiNJxmfX1xgowDqPNYvJkN4WWILU92okElu1WsmsvTFUlvQ
 S0w4Kh9C9Cy+t9p+rA85y8JMIdbcfNLFl2Ydy1Oue1KCJAVNB7bs7IhuJ3Gap/PFuOKO
 QDy0HzeayYLYXknrHlJqqXvTqjLjD4XIvso+Hiz2PO7EXVJjVjmJ/Po89/SsRELm2MMi
 k1jdNckReXip1kvpGi+kScok/99SMQtCFavaRE0OxOqtCYSBBxrnRRwpu1OUhogCbWta
 N5PnOvj4EtCvbw32yORJ/rtYoVVQoTW+sc6ULNtz7cgBapZvev+Yle8ek2ieRZJZPtVW
 NULQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg9EJW/ugqrmyqmQzqIJvyDWdmiWusO5Nsq1SXy6GYNV4FB4VkS+TLfpmDhz+R6Ayqj0YwVXjxrg==@nongnu.org
X-Gm-Message-State: AOJu0YyrOrwUDfSKGhbeUx48fhuVjKkX1wJYzhjNJkgn3cF+jbXjJF30
 NlAOWB8J5R5OALD4Aj1dyi3gnojl0/TBUHY9YzhhNWZjD3zBk9T0
X-Received: by 2002:a05:6512:3084:b0:537:a745:3e with SMTP id
 2adb3069b0e04-539a0795be3mr537840e87.45.1727820847819; 
 Tue, 01 Oct 2024 15:14:07 -0700 (PDT)
Received: from penguin.lxd (c-d17271d5.018-186-73746f22.bbcust.telenor.se.
 [213.113.114.209]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53992ca4683sm964813e87.124.2024.10.01.15.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 15:14:07 -0700 (PDT)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v2 0/2] Allwinner A10 SPI controller emulation
Date: Wed,  2 Oct 2024 00:13:47 +0200
Message-Id: <20241001221349.8319-1-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x131.google.com
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
X-TUID: vNoODDdwcmPa

This patch set introduces the SPI controller emulation for Allwinner A10
SoC and Cubieboard.

Only master-mode functionality of the SPI controller is implemented.

Since U-Boot and Linux SPI drivers for Allwinner A10 perform only
byte-wide CPU access to the transmit and receive registers of the
controller, the emulated controller does not implement DMA handling,
and supports only byte-wide access to transmit and receive registers
(half-word and word access will be treated as byte access).

* diff from v1:

- split patch into two parts, one implementing the peripheral and
  another for integrating peripheral into Allwinner A10 description
- fixed issue with CS level handling when channel is not selected (idle
  mode); this was discovered when CS level handling was converted to a
  separate function
- updated read and write register handling to log error when byte and
  half-word access not aligned to 4-byte boundary is performed
- updated SPDX license tags for both header and c files
- various minor fixes suggested in review

Strahinja Jankovic (2):
  hw/ssi: Allwinner A10 SPI emulation
  {hw/arm,docs/system/arm}: Add SPI to Allwinner A10

 docs/system/arm/cubieboard.rst     |   1 +
 hw/arm/Kconfig                     |   1 +
 hw/arm/allwinner-a10.c             |   8 +
 hw/ssi/Kconfig                     |   4 +
 hw/ssi/allwinner-a10-spi.c         | 561 +++++++++++++++++++++++++++++
 hw/ssi/meson.build                 |   1 +
 hw/ssi/trace-events                |  10 +
 include/hw/arm/allwinner-a10.h     |   2 +
 include/hw/ssi/allwinner-a10-spi.h |  57 +++
 9 files changed, 645 insertions(+)
 create mode 100644 hw/ssi/allwinner-a10-spi.c
 create mode 100644 include/hw/ssi/allwinner-a10-spi.h

-- 
2.39.5

