Received: by 2002:a05:6214:acc:0:0:0:0 with SMTP id g12csp1603212qvi;
        Thu, 22 Jul 2021 10:52:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYQ99bKWpQxdF3tu/hV+9UPIc2pmgB4txW0YiB36c8tDM0nLSC0W7RLHFC0KHl4yLntnC/
X-Received: by 2002:a25:b113:: with SMTP id g19mr121972ybj.42.1626976366572;
        Thu, 22 Jul 2021 10:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626976366; cv=none;
        d=google.com; s=arc-20160816;
        b=Mz8RmMJ5FQ//pFozaYUUzysBSsF7Ho3qifi3LCuyIj13/zvw532M9HxTXapE6btYL0
         rhk+hfdwdQb5SmiM6pdM96WpCk4vHcz17vgs7r3ArJsoZ26eKtS0JobXVn75wP0dkA+Z
         ourPVzbERKLrcGMkq2XceBtCgiYizS3IgMLVYv4YOGqu+zKnWBMNVcmi3q0BTEMeb6nH
         seX8oFlksaZ2NC2cZs6fps0HlFEWf1F0xMjI8Cn/9z3ebGBikWl5zQ9t6VgZZFM0KpDe
         FfqDOTq74qWDFoaLRRxknx5pD4Bt/zWeCjICHcvKXFBgB93nImisJMzWXbhnixu002YD
         N/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=/PJCdZ40T6nDf8PG37ox8Ljuo/uFhChZkU+VhN5NKrk=;
        b=eUGdo53/sDGInAZJ3la42AE7dn+gITIcB+ai2RZ5Pd4MJ4KLvc4ThD7Ji9Gc8K2TkB
         QE5CeBfqsWju72mT8Go73YcA8YKS6O8DBQmoSPauRtN3MfSb2YJYWTJswITGujl8oXVx
         TbTM4Lt/QDIv4NLgIaG3FlRnaCxequbgRVDfWyJzEu2ZzvBWVG3QYq7PGT3mMzRV1qO1
         Hi/5u09Sq1pJtq4DdkKFqZMWWLjsZ1glHf57ovBfvzr6tzk/XSGucr7VwVXoZmWw1Udl
         O6H3l7RtoN3ZAWRmezHE/gI39Lc2t0N5uNC0ANo6MtEghS7bPnIbXx7aJxYpdXOHcuaP
         r7AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AZUXdOGW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13si31559591ybh.51.2021.07.22.10.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jul 2021 10:52:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AZUXdOGW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6csI-0004Mv-2a
	for alex.bennee@linaro.org; Thu, 22 Jul 2021 13:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6cs7-0004Lp-6W
 for qemu-arm@nongnu.org; Thu, 22 Jul 2021 13:52:35 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6cs5-000208-Fb
 for qemu-arm@nongnu.org; Thu, 22 Jul 2021 13:52:34 -0400
Received: by mail-wr1-x432.google.com with SMTP id f9so6804133wrq.11
 for <qemu-arm@nongnu.org>; Thu, 22 Jul 2021 10:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/PJCdZ40T6nDf8PG37ox8Ljuo/uFhChZkU+VhN5NKrk=;
 b=AZUXdOGW+6xn3ONGv/H3LxoJDkjpdJuiWUGdtWxmSl7/04hCA7fSAAQecBwo5grP2G
 eCGHgoko8FYMsffHnT/MFSO43Kg/SpEL618LDJ8bl3BJHisdNDV0px3kvjZTWqYuYLcp
 aYfyP6264n7XB+yrv05huNMNxGy0nuM+iXQTzOrwMhH2YIIAmXfx6tSdY1NLFNXGiXce
 OMvE0ufEP2LWPU0MhbW6iWm659WB/edcg/smPz1u4L71dyEv5wb77tDiapyF+0qZXvPb
 35Ziup1LswQ3muxpAAXm78k9/zZ2icix6878R1HCaYrW8woZffRK1bUZH6ru+M0tEOgY
 2ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/PJCdZ40T6nDf8PG37ox8Ljuo/uFhChZkU+VhN5NKrk=;
 b=Fk8vC6KAty/O8PZuthsmhCGROriBVurdm0aqYsNxzcNyjhGRBlY9ljYmGDABDK11mR
 BNDsvp4VCjIAJfqERp01CLBWjUvzuTL04l9DMitNmH0eMtB6RPEx2hb2nvTrxLzKoJP1
 y1pHsn13Ttbejt1C4PmyIZS3GnyVVHm6Kw19FuKodIcGzx3Lk5Z6QmfY7yDkO1EviSWF
 5zwN4Ni+B4AaeE2gCWAJzT4xfUKUnjaGSpzIh+boVwDf5HbCZlxnT+KDKKlA0Yj/u+V9
 FKCMYensXw/lwLeWU6kK9YJzJywGY9cOLiwH9y9In8pxtv/85AvQTqpNj/S+X0jgEpzt
 QJyg==
X-Gm-Message-State: AOAM531TfuNH/FnxoYu6CDuG02TqRW9GOwue80xieTLVdHFzZQ8237Ob
 7XJa092dUtoaf8YHGUQOKB1dzXUtM2MFeg==
X-Received: by 2002:adf:f411:: with SMTP id g17mr1157510wro.160.1626976351863; 
 Thu, 22 Jul 2021 10:52:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s13sm30278651wrm.13.2021.07.22.10.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:52:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 0/3] docs: Document arm mainstone, kzm, imx25-pdk
Date: Thu, 22 Jul 2021 18:52:26 +0100
Message-Id: <20210722175229.29065-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DOp2R02C9Xv9

This patchset adds brief documentation for another set of Arm
boards. As usual, people familiar with these boards are welcome
to provide more detail for the docs -- I just did the minimum
"name the board and list emulated devices identified from a
quick scan through the source code".

(After this we still have 9 undocumented Arm machines.)

thanks
-- PMM

Peter Maydell (3):
  docs: Add documentation of Arm 'mainstone' board
  docs: Add documentation of Arm 'kzm' board
  docs: Add documentation of Arm 'imx25-pdk' board

 docs/system/arm/imx25-pdk.rst | 19 +++++++++++++++++++
 docs/system/arm/kzm.rst       | 18 ++++++++++++++++++
 docs/system/arm/mainstone.rst | 25 +++++++++++++++++++++++++
 docs/system/target-arm.rst    |  3 +++
 MAINTAINERS                   |  3 +++
 5 files changed, 68 insertions(+)
 create mode 100644 docs/system/arm/imx25-pdk.rst
 create mode 100644 docs/system/arm/kzm.rst
 create mode 100644 docs/system/arm/mainstone.rst

-- 
2.20.1

