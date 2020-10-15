Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp733202lfa;
        Thu, 15 Oct 2020 09:35:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/hN7Bp0HkatkxacNtCdcVU1iyk3cqE+3NXoFDwpJ+Dg0vtoFo5WNKmjbJiOfb4d6InheD
X-Received: by 2002:a25:9c04:: with SMTP id c4mr6587567ybo.5.1602779719139;
        Thu, 15 Oct 2020 09:35:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602779719; cv=none;
        d=google.com; s=arc-20160816;
        b=VI+NaHsMDrALG6HDVW98lgofW3sRYXM4Mw5dOSffjVlq62Arcw53cdTkISeUxnAvNL
         DDo4KUtKmOyIXlj6UN3h1bqWb3MZdzg90E/cMXHr+X639KiSQRKzFExZORnlT9LiEDDN
         3IJg8vv2t+h/W9A1I8iCPjMV8hsYbRouIFsdaR+Umtsf5/AZkxgC3bin07FOOkmcPtkC
         ceepoAHvHzFXyGJ7AaZpXRRbiQbVERtJ9QX8TBI/A6Fuas9RhVkQGFBj3RQvtJVZpWaY
         0DMWW/RGYAxWd+dQZEaoaPW1uBwRbSsdPU7mPlAgQ68VfLRhdV1o8B9ndn0bmbWwIWdR
         VoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=rvSXNjT8JPxW0VVKue71MTZay/ve70nbX8RtpH+3VLM=;
        b=nqIMzuxBqkIAJ6LV6LXk5HzTxz+prQiy9Oo5DfJ/IVwBsfWTVZOPn9CcN2ZzKPD6ut
         +TGuFryJGPzKWH1m+7AvkaoW5ziIeB5TFIIBaPPOTPaL8MR8KTde+RzvjM8hn8e83aLZ
         IMWjkh7cgaOZpJ6z1y92HiT6p+YDEr727FNKHT4C5Xnaa62V0abnMT0bSNNYfQdQE1pe
         zqATRceIxHBpBhfSjK2WuVpGW81m62MCogjA9RLLMuZE2VTo2SVuTjGcewQHSwLj58hZ
         HiSDS2WaYi5PZng7zLnlWgD+hDVJQr5ckdy8BmedKQADWtGQ7kDKt7qDImsEzLNXhayq
         Uz7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TUAKsAX5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si3143804ybp.255.2020.10.15.09.35.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Oct 2020 09:35:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TUAKsAX5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kT6Dm-0006tD-Fl
	for alex.bennee@linaro.org; Thu, 15 Oct 2020 12:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kT6DX-0006rE-WB
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 12:35:04 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:39753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kT6DW-0007b8-6M
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 12:35:03 -0400
Received: by mail-qk1-x72f.google.com with SMTP id k9so2829596qki.6
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2020 09:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=rvSXNjT8JPxW0VVKue71MTZay/ve70nbX8RtpH+3VLM=;
 b=TUAKsAX5bbcEMVRLunbQLBfzVSXkzeoX1AzTIDch3q7SjDT9YNGhXy14743DGYK/kr
 CI9qItD6MsmwR3UNFTNewzF8mzMqNJY5+jh3Vul+zjRAxgueNj8wTSVMXLbKVX2RVBtg
 9rwB5hmjJNya9j1qQdHV2HZAgGbTxlDtV9Q0lFXN2ARzyssNYYJ+KVZb6GCqweCdO9P/
 /bRxecQ8s/WKHKrG5QwK3XC3CBd1aM9OVCQE486du3jiFLBQf12C8E2eRrrB2/kpUBPN
 bVwLtcUu+GposDOvlQnY3488nywwwB4ygt6xeFrkFFD9t/+q2Z5cxbPlRqGwNAtZuzmZ
 6DPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rvSXNjT8JPxW0VVKue71MTZay/ve70nbX8RtpH+3VLM=;
 b=KMHuESB83J+KhkjgQaeugNRiyVAZbBYK5YucpgnE3bo32neAp7d3zzssNroUGpeqTO
 A80evGLH1UZW1xeLCUcUFvHB71dMEg/YV2K/jEf38mvRUKLLN2Ddnbm3bQVYa6giW8/f
 lMyOo5bzNHb9phXc35VsvvcrloHsVTbggNP4WG74wftaSiKHJHxpBLX6n8TFTD27kXY1
 JJLrwChHt7XTFf/I8aAcQdpyLd8edzEad6I6LA9x24yWUn8DYkZ/YVx+q/oyFdgE0LzZ
 Z8+e+qMmI8kKfi3xgaUTq7maakx5LmPiWYzeKIggFwd9WldFgqC2Lzfh4nKvSlcEmFY0
 iCPA==
X-Gm-Message-State: AOAM5324t/Y/LnIBhWgy8cGDxSDIOwAWHCSenCY7xYeXKZNK9J3Z7JyX
 iFY3YvUV0o1vF/XUTLWUCoZzhQ==
X-Received: by 2002:a37:a312:: with SMTP id m18mr1875638qke.268.1602779700966; 
 Thu, 15 Oct 2020 09:35:00 -0700 (PDT)
Received: from localhost.localdomain
 (stsvon1503w-lp130-06-174-91-97-36.dsl.bell.ca. [174.91.97.36])
 by smtp.googlemail.com with ESMTPSA id s73sm1338373qke.71.2020.10.15.09.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 09:35:00 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v6 0/2] Add watchdog support for SbsaQemu
Date: Thu, 15 Oct 2020 12:34:57 -0400
Message-Id: <20201015163459.32298-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.18.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2LuHckniNYCE

This patch series adds watchdog timer support for SbsaQemu platform.

The watchdog timer has been implemented first based on the generic
watchdog timer specifications from ARM BSA v0.9 and then used 
in the SbsaQemu reference platform

Changes in v6:
- removed the fdt code for wdt as it has no significance in sbsa

Shashi Mallela (2):
  hw/watchdog: Implement SBSA watchdog device
  hw/arm/sbsa-ref: add SBSA watchdog device

 hw/arm/Kconfig                      |   1 +
 hw/arm/sbsa-ref.c                   |  24 ++
 hw/watchdog/Kconfig                 |   4 +
 hw/watchdog/meson.build             |   1 +
 hw/watchdog/wdt_sbsa_gwdt.c         | 346 ++++++++++++++++++++++++++++
 include/hw/watchdog/wdt_sbsa_gwdt.h |  70 ++++++
 6 files changed, 446 insertions(+)
 create mode 100644 hw/watchdog/wdt_sbsa_gwdt.c
 create mode 100644 include/hw/watchdog/wdt_sbsa_gwdt.h

-- 
2.18.4

