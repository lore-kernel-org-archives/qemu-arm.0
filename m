Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2955380njc;
        Tue, 25 Mar 2025 15:44:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCMgnRErQ2J/C1sUG0TwmY6lvYafO/kKwOJ6a+MvBK4TgTX7pfP6hVf9WdCgnEgSmsBaOZVCdKVfw14Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGIEDiYt7rKg8hKcXBNuuuejxadHyDDCZkxSi/HKocfvIcENvx6I9aqlXO3JWjnWNzJwozE
X-Received: by 2002:a05:6214:2a49:b0:6d8:8fdd:9791 with SMTP id 6a1803df08f44-6eb3f2f5c52mr282457436d6.25.1742942649949;
        Tue, 25 Mar 2025 15:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742942649; cv=none;
        d=google.com; s=arc-20240605;
        b=B7B64OPR7fmJNXsAAL83A3T/1NGQ+YFOqW+gJw24HjLgJ2mVmdjVmy9FNSjMPg5Ods
         mEquFMdhomqM+Xhv11tvpfMttnjRgtlRFGT/e/R0ItqsiJ35TxF6WqMpgXO4YQYZ39lD
         /oUXspLwc06f4ACzwk+h6JgVAJ4qaCHMMY4RWvrBDY8NgoeD0Z3stARrsm2imL1b2QUc
         yX3TM6xVC//C7rMySoHgtcU1K2j64E/8mcvhdLul5nH2/Qgm1uMboyJGyyDKXO7O6Q+r
         mHDwZoa7rbVhz5+7tsudqw0llgLPUwDl49Vlvm8xHV428HkY6lC4azR2WL7dX596N1Y/
         APGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Eqseea59F60LhLSYlLeLzcWV1Hj125jM/6Dr/ONihS0=;
        fh=vA/RGQGKk10Gqo5s738uPAuvGOeSzQiYrBm962AfRuM=;
        b=SWqVRMYWgaJprLnk3IuTMqiBnq/RP0KoREdJOdDyc+TR+EMLUvmIxTrF1wIXJ8vE4t
         3ehZnsE9zwkoz7gidmMTxp8tLYrbVv0Noqy8sbYB3UlWd22o7FgS3kRumLbLdiqrlwzQ
         XHwU5qvz7zURz7xvcxecgypAKk3ilsfYAA4dBdj7sU+f6+AqQOSSOr3B4LBSrIulvClF
         E/ZkJ0OL1YzpYwDtg9zQpl8++HZUv0FdYKSVingqNMGsZjodTA4XVFMxG/M5e1UeDCMe
         50xEn3VqCC73bbj5IHUIHwz6HgOIwTZuBa4dlaY8ungG13LCvLAp9pvMsvXIrbp+38wF
         T7YA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T0cFc6vw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3ef48d46si106682116d6.43.2025.03.25.15.44.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Mar 2025 15:44:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T0cFc6vw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txCzR-0000Xs-1M; Tue, 25 Mar 2025 18:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txCzO-0000WQ-Dv
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:43:18 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txCzL-0006sx-01
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:43:17 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39ac8e7688aso1030808f8f.2
 for <qemu-arm@nongnu.org>; Tue, 25 Mar 2025 15:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742942593; x=1743547393; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Eqseea59F60LhLSYlLeLzcWV1Hj125jM/6Dr/ONihS0=;
 b=T0cFc6vwKndGVMArWnTsOdBoV2ET0CnBH8dvOgPeMKk/drIFv9KaE/pTXxCeAqU0qq
 daFQQEiUoW4YivWsJakGDTk/HG+F5hw/pgEsvLzIkzWT+J0G2DYReThhhiOyONhzqN7Z
 L5n00UctaeQ0ywCJLaccbMPexO0OzwkBWN8N1JxQl4B45luDDb9ixWgGSPdTvxAVX1Pi
 3QkNhE7zKpvuYLdhGKSrDW0r/L8+9MeYSHx6iLCM14tOeKeV25Omb8XrLffnPDMQNL1d
 671m3Px2mdtwEszp5EV1H/HB7VApfeF8/mF+YbnuIAKME7AyTo8VFFs1ybVr41sn7IQc
 YkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742942593; x=1743547393;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Eqseea59F60LhLSYlLeLzcWV1Hj125jM/6Dr/ONihS0=;
 b=DAGPaAD8J+p7xD1TqQ8ujRXHfr9ZGKHX0Khnm6xpHOIuZJ+U0GRLFRJTmpyT4/xmr3
 ApaidfkK+EsV4ZF4rtONBtzHWeXeAdkjuvcU96Zbj/dG91FLRNGzp2S+fPISe9Y3IdwM
 kc2dQMu6oRtm8dBpyooRtJEjh+nDvih+q7lbN/C2k/TY4UasZ/igjRqz5lHw52OmSJC3
 aW3pG/NObNiAw35SUiWTE5omLJY8IfiIth4sGqq5cu4CDrsV0lgzxQ5x6WqOlCgfYLyS
 gVg/DSuYRDPj3zFuiTMoF/7jok0zvWdfwZEd57mcPfUIRy5h8wuTFTgMzrVlCmNpqV+/
 D0HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt0kPOTYzWWg3FTxR8G0uQ0U8rqUOQFpIrzzoYXArgKgRFu5fzM8bGQMKhc1EP6a2jQ4+Fb1Z5TQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxyx3INf+gvb27AoH2kkaCooESwbJTaim0ostSGO20EctnHNErC
 ns6bIRT3zAs0NPtWIuFVuQoDNe2SFX6VQ46HJZLfo/CimDsK6X3N7+4Thk+lbQ4=
X-Gm-Gg: ASbGncvwwxwD61DGH2rLP2gq7r676AZefTCi3X0h6SfRfcyb4q5Gv+Nu/jy3tzr9em3
 vClb5j3rJarPNmfcPHGWCW32xmeZgLB861KUXX5bQOfUiZx7puIfVt8M0VKm96oVfstuxSDPH2g
 WEJ33vUgwPHvhNLqZ9rzasLavFuWsYi6srjuTuUeVbjOG6QJJcFFls5pPuN9YSqxhse9zt7txQo
 17NHZcFHSK3olz4Zrh2s2n8mWBcXHt6hiHhLo4KICpZEbFwHwTzQiipzmzj6pivLC2pW4oMCnWy
 MAWTDERAdLYe6J9PCcjV1xgEj3bmA7fVMFGk6bO52I5kLJHKw7eSxT8+rC9yOOdfliSENw1nNau
 mHG2KbzIkaxAJZGhGHQM=
X-Received: by 2002:a5d:47a5:0:b0:391:3d97:bd33 with SMTP id
 ffacd0b85a97d-3997f8f9fb9mr17440490f8f.13.1742942592870; 
 Tue, 25 Mar 2025 15:43:12 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fceb780sm167151185e9.4.2025.03.25.15.43.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Mar 2025 15:43:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Glenn Miles <milesg@linux.ibm.com>, Samuel Tardieu <sam@rfc1149.net>,
 qemu-block@nongnu.org, Patrick Leis <venture@google.com>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH-for-10.0 00/12] hw: Categorize few devices and add their
 descriptions
Date: Tue, 25 Mar 2025 23:42:58 +0100
Message-ID: <20250325224310.8785-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: BO3lLVUTH11Y

Few devices are user-creatable but miss a description,
and sometimes are not categorized (or mis-categorized).

Some, being qdev and not sysbus, are automatically
user-creatable, but are part of SoC.

Fix that.

Philippe Mathieu-Daudé (12):
  hw/audio/wm8750: Categorize and add description
  hw/block/m25p80: Categorize and add description
  hw/display/dm163: Add description
  hw/dma/i82374: Categorize and add description
  hw/gpio/pca9552: Categorize and add description
  hw/i2c/pca954x: Categorize and add description
  hw/misc/axp2xx: Categorize and add description
  hw/misc/pll: Do not expose as user-creatable
  hw/nvram/xlnx-efuse: Do not expose as user-creatable
  hw/rtc: Categorize and add description
  hw/sensor/temp: Categorize and add description
  hw/s390x/zpci: Re-categorize as BRIDGE

 hw/audio/wm8750.c        | 2 ++
 hw/block/m25p80.c        | 2 ++
 hw/display/dm163.c       | 2 +-
 hw/dma/i82374.c          | 2 ++
 hw/gpio/pca9552.c        | 2 ++
 hw/i2c/i2c_mux_pca954x.c | 8 +++++++-
 hw/misc/axp2xx.c         | 5 +++++
 hw/misc/bcm2835_cprman.c | 8 ++++++++
 hw/misc/npcm_clk.c       | 6 ++++++
 hw/misc/stm32l4x5_rcc.c  | 4 ++++
 hw/nvram/xlnx-efuse.c    | 2 ++
 hw/rtc/ds1338.c          | 2 ++
 hw/rtc/m41t80.c          | 2 ++
 hw/rtc/rs5c372.c         | 2 ++
 hw/s390x/s390-pci-bus.c  | 2 +-
 hw/sensor/dps310.c       | 2 ++
 hw/sensor/emc141x.c      | 6 ++++++
 hw/sensor/tmp105.c       | 2 ++
 hw/sensor/tmp421.c       | 4 ++++
 19 files changed, 62 insertions(+), 3 deletions(-)

-- 
2.47.1

