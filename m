Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1432276ejj;
        Tue, 26 Mar 2024 08:45:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFEaTtMEqxVojP0XCaFK2lzAfL9riO/tzpxrQ3YgvAvbyCvnOfj7tf9Q3FlHnEgPSySXVEsFJetmhaIJXmoLpDZ1b3xQP4
X-Google-Smtp-Source: AGHT+IF5BWJcaizCSHQARXnZZAfCGeP+7E/kY4IZbbkqg3GscBvVHb1e0yTYYxRxScc/nAi3nB0k
X-Received: by 2002:a05:6808:1701:b0:3c2:616a:22 with SMTP id bc1-20020a056808170100b003c2616a0022mr10740850oib.55.1711467932169;
        Tue, 26 Mar 2024 08:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711467932; cv=none;
        d=google.com; s=arc-20160816;
        b=aa95FHDfdoVznMlx0zPFDLOKwv7yTJ/dQYrJ7L7m2/rHg8FTFpzdugQGsdrevQs2Gc
         ESg8C/e5Xqb7PVkU6gpVnFiK+PDCO/mlGmJs6EsaVDkxZbzqT8MvSR0sdl5IAodd27dA
         SLHti0kRKI9VeO9H8KefKvPQzSnsAHHjM22A7V/7UtUPcLixk49C3/tYd1uLcvFUQGwT
         VSBssw66jwszT0Y/Ox621UeJBMy1GH2M7/+2cPVqGdMW8t6l8PEMY08jARivLOHV9gqa
         HCMefCEJ04b3ow0eZIjef9Vylt64zWsV3/aG8D1n6v4vEIPDnL3TAhLXwJstINsneOhS
         DsYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=hn7lLwxhhf3gNG9hNhmhqHwHMzru6i5It7d/ZRKMp5c=;
        fh=mc4gOsX8ZopPHdUDDg78i1QqY75qACRVSvgtPpdhIeM=;
        b=PY1PhiIXvqvKBs7lL39EN/ZNuP9ufeHflSby8a6mA5kX/VuPN73hs6tVQEG3/NMnqr
         gc3IPZvzwgaggUe5EZtjAIzfY6LiLpaLudUN7RiJK0noSfMbWZK4ONWoQMfHDBOFbmY0
         UGolo5bEI0FLnzqWhYFVuF1MThdovUY2SIfNpJCyKhh9OIrCRRxzyvO6aS5iZtyaaeh8
         YF162SPMgTNMc+/ROQM4P6yOywsRNIw+hrdABgvJ0zsswMtjIOxyDOEk4e4e3NJqNtgU
         KKXew04rw5ocaNYhMUpzNqbXOSBy+DJ7MfRo6tJo6Xb5hj3fonTQlvIfeLQKL7nBjdu8
         /E2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yb5lMLhX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b10-20020ac87fca000000b0043175e5f530si847558qtk.711.2024.03.26.08.45.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 08:45:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yb5lMLhX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rp8zE-0003aN-Oo; Tue, 26 Mar 2024 11:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp8zA-0003YR-Lb
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 11:45:13 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp8z8-00013I-Qt
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 11:45:12 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d68cf90ec4so93860211fa.1
 for <qemu-arm@nongnu.org>; Tue, 26 Mar 2024 08:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711467909; x=1712072709; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hn7lLwxhhf3gNG9hNhmhqHwHMzru6i5It7d/ZRKMp5c=;
 b=Yb5lMLhXOiKn5VkpseRU65m2V2+9vB72Gq7NIpyoOd0vzxJydvcbsgZDZ8Tp9di5M4
 QyWICCpbJTOqd434AzBzLHiBf9qkZDmkWqCnsK2rUnaBmrNZ7i5urO2x7ZW4jLgx0Jh2
 xV0dhqjRwFIYCwc0mVk1VBDaf5QbAnHUtWDLDtlr4lXtZqtPtC0EjDhhByZ6Z5dhTM2d
 C8zwh22r+e9ayzvjwlC3+he10IbdY5zI37WDLzFR0wGFTFxF2H9z1GUjEAfpQ1aEtuS6
 wFYSBJHINrG32pOOCSdjVz4XRETqB+dmODdwx8qSLRXgcdZXbpNMF9Lt5O1dDotTMnKI
 3u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711467909; x=1712072709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hn7lLwxhhf3gNG9hNhmhqHwHMzru6i5It7d/ZRKMp5c=;
 b=RrauYdR2AcQYAhKxjrVV+8Ok12ZeAb/yKSsT4NfQDpMCdfMbw1dwk6F6fvaJBm+5om
 IxhMa+s4fwW4TJu973f0gCoXnvYOLJxnP9IsD+0NtLOSrhN7IAWM0p0suM6C++seG+f7
 kEIG7YNyK9UJgGCfrrSOtmzUhh6DhhW+EoAlvsjHYa6Vin0iON4VCNjpYj11kNVpbSMy
 C3ruJb/JI71WA93+ZgNU7HQq79vLOXDx5Va2gBzZzgBe0sExDeW9Z81ylrIWX4n3GTDF
 ZgTskyukJhb8wHK1F0Ew7rgajma12utxJhJWhibwiXpC86SikMbzyrQXrb52oBs/1MZ6
 WyMg==
X-Gm-Message-State: AOJu0YyXDN/QuZdxY/q7X0T+1nndvXDR6ecXPUUp2iULwu2un1Biy2sX
 FEk6mFH9DXmQpeesS/enHtXqZu5+fOxYwXg3P4wkKclUnht3jbfapunA9H60qavxkJf7Zjizzt7
 Z
X-Received: by 2002:a2e:834e:0:b0:2d4:3c32:814d with SMTP id
 l14-20020a2e834e000000b002d43c32814dmr1302990ljh.26.1711467908686; 
 Tue, 26 Mar 2024 08:45:08 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.229])
 by smtp.gmail.com with ESMTPSA id
 fb13-20020a05600c520d00b0041490a19e13sm1084314wmb.7.2024.03.26.08.45.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Mar 2024 08:45:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 00/13] Misc HW patches for 2024-03-26
Date: Tue, 26 Mar 2024 16:44:51 +0100
Message-ID: <20240326154505.8300-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: SBItvJtUz53O

The following changes since commit 096ae430a7b5a704af4cd94dca7200d6cb069991:

  Merge tag 'pull-qapi-2024-03-26' of https://repo.or.cz/qemu/armbru into staging (2024-03-26 09:50:21 +0000)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/hw-misc-20240326

for you to fetch changes up to ccebb9ae352eea63cb1491cb829e4cd0f7576f1c:

  ui/cocoa: Use NSTrackingInVisibleRect (2024-03-26 14:32:54 +0100)

A pair of "WARNING: line over 80 characters" are ignored (82 chars).

----------------------------------------------------------------
Misc HW patch queue

[hw]
- Do not silently overwrite 'io_timeout' property in scsi-generic (Lorenz)
- Propagate period when enabling a clock in stm32l4x5 mux (Arnaud, Phil)
- Add missing smbios_get_table_legacy() stub (Igor)
- Append a space in gpa2hva() HMP error message (Yao)
- Fix compiler warning in 'execlog' plugin (Yao)

[target]
- i386: Enable page walking from MMIO memory (Gregory, Jonathan)
- tricore: Use correct string format in cpu_tlb_fill (Phil)

[docs]
- Fix formatting in amigang.rst (Zoltan)

[ui]
- Fix cocoa regression in platform fullscreen toggling (Akihiko)

----------------------------------------------------------------

Akihiko Odaki (3):
  ui/cocoa: Fix aspect ratio
  ui/cocoa: Resize window after toggling zoom-to-fit
  ui/cocoa: Use NSTrackingInVisibleRect

Arnaud Minier (1):
  hw/misc/stm32l4x5_rcc: Propagate period when enabling a clock

BALATON Zoltan (1):
  docs/system/ppc/amigang.rst: Fix formatting

Gregory Price (1):
  target/i386/tcg: Enable page walking from MMIO memory

Igor Mammedov (1):
  hw/smbios: add stub for smbios_get_table_legacy()

Lorenz Brun (1):
  hw/scsi/scsi-generic: Fix io_timeout property not applying

Philippe Mathieu-Daudé (3):
  target/tricore/helper: Use correct string format in cpu_tlb_fill()
  hw/clock: Let clock_set_mul_div() return a boolean value
  hw/misc/stm32l4x5_rcc: Inline clock_update() in clock_mux_update()

Yao Xingtao (2):
  monitor/hmp-cmds-target: Append a space in error message in gpa2hva()
  contrib/plugins/execlog: Fix compiler warning

 docs/devel/clocks.rst                |  4 ++
 docs/system/ppc/amigang.rst          |  4 +-
 include/hw/clock.h                   |  4 +-
 contrib/plugins/execlog.c            | 24 +++++++-
 hw/core/clock.c                      |  8 ++-
 hw/misc/stm32l4x5_rcc.c              |  9 ++-
 hw/scsi/scsi-generic.c               |  1 -
 hw/smbios/smbios_legacy_stub.c       |  5 ++
 monitor/hmp-cmds-target.c            |  2 +-
 target/i386/tcg/sysemu/excp_helper.c | 57 +++++++++---------
 target/tricore/helper.c              |  4 +-
 ui/cocoa.m                           | 90 +++++++++++++++++-----------
 12 files changed, 137 insertions(+), 75 deletions(-)

-- 
2.41.0

