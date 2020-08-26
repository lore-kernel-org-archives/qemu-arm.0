Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp799925lfc;
        Wed, 26 Aug 2020 07:20:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrePY6tuTzeHaxo8OjbyXxNqlVItvMO4CTisFccfmS8CihNmb0cPwdP7LwYFN0VnVcGuiO
X-Received: by 2002:a25:e045:: with SMTP id x66mr22715722ybg.372.1598451648802;
        Wed, 26 Aug 2020 07:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598451648; cv=none;
        d=google.com; s=arc-20160816;
        b=gA3SqGcKHdBDVfTv7dGlmql2oqdL4MgEoUeLzhtYQ+WERvcK/TYSG5QSk7HYLny7iA
         7tYTw6+BopV5RSgMEXcpXWXAJlD1sUJ2CVD9R2UDF+Z8VvHB12gMmvtAfplypKiPK9R2
         sSzejiMDc9cOKgdbYUstgEYQU5qK25G7yZsdKR45TJ84qAWFzKPeXVPc8tF6FNQAttae
         +roBhowqlKaaxc03SeQQaftDUMCJiXN3BFj0nNFgcux2sCHa+x5y/0YWPP3sxzknW/XB
         RU9ZAF1kzeLSuiWGG0caGIQt/ZKT4Yul0b8jamb8rHpQTm43y9U9CgPb7Xzgc6D5MmjO
         J90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=xLa6iW2a9vdfZQ+4WCOodX8y0oiavSuYPUAbM3Vgv0g=;
        b=JEv9JiCvI6Ga4AvKNuACqf/I2/chcac4fgOXbYSbkglAMDwouLcKtzqkAok10Ibfb4
         YKhciHb6i0iQZ9W/YJPz1MuiWNtoaIAu/AqXYrTVOtwa2Gzkcf3ttv6uzd2kD/l/LOpK
         69NODQpj4UzNNTOdtU1M6jQ/WzWnK7MgeUNEQyOkKM3mRAV3AGrlNtz2+tBg5RZgThUt
         u+qOcD1MM/LQ/f5DWTw0XSEzZ5PZ+Ni9jhACMTeSAU/hFHoB/laSo6OYfY7JIVLW/efb
         qBmUE8Jk+HJ2AxX09YVqumKvE43TChtg6sBr2VkxVau3j01lh7ADB18lp8dWPetyMJBy
         jgMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Y2VSgrw6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si2305194ybd.439.2020.08.26.07.20.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 07:20:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Y2VSgrw6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAwIC-00041W-5k
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 10:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kAwHS-0002iV-Mc
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 10:20:02 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kAwHQ-0003rP-K7
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 10:20:02 -0400
Received: by mail-wr1-x431.google.com with SMTP id 2so1971291wrj.10
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2020 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xLa6iW2a9vdfZQ+4WCOodX8y0oiavSuYPUAbM3Vgv0g=;
 b=Y2VSgrw6RUwTcqr0DSzyYkCbjltHQ6aq4EfbIXQDmyFkhHiFwDDNMFXBIFQreXGGJb
 KVj0qzv1VlE2SiqRSuTFxhtwy95WompwT4RJtc6uMXtJVICWKCXn8sOqrqclRQAF7CXO
 wOKa51xm5YM5mKxnoApoj3j9lwZ2/Ssud5s4L5YqN0UiN5rLZpo+1+nyXYBfY7/XSCG0
 WEtHB54rM4RG85PULOTSMCwNspkaSTgkFxVbOkupWDKHRxwSlR4nnGwGzX5BzQR3EtDp
 wPiPLSp1EvIzXNQzwdDrSd6iU5nON0WUBLpLqgUeeLd+1pczrAOogbA4DY5SLEda9y4u
 eJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xLa6iW2a9vdfZQ+4WCOodX8y0oiavSuYPUAbM3Vgv0g=;
 b=aVsWSMf+CJkxUkdQcWcxllq94tVduw/5pTMXUjNV2FO7OE37SLe2bxYAdEkKLhHqIA
 FoIYfn3VRFsjb8BcKfoq0o0Y1+Jbffciu+3w6qoMZU+HVx3P+8mLC7jklEEles4kt2Mz
 BeL9E7K4NqWetebEUFW3dp/qbHq3EdAJxgxQ4Lq6QvaiidUx46p1SHZJQGek8SZA5tO8
 QvzRSybwXbGhGJAo7AoeR1nP/fGMMiZmoZcnqP+VhV/A1Awg1MakdDojGQ1lJjnA/Jtl
 p4lQo613YzrWUdPh57+JF4I/Jyio592WKjvYHbhSNT1G425fnvl33I/TaAcB3BbytmTK
 WWXQ==
X-Gm-Message-State: AOAM530oQ2u7XtUhXmuhNdmtOb7wz3v8jrW28SMRODw4vN+g4Uz8kDjp
 P4Y6PWcZSoWKN2xu6vew/A1OxV7UMJfa2s6i6F9hcB4Ssb3qWkoe2y+Iy5mkSdtINIzsXfb4j1n
 JW4bwiiaXpr3J1wo/k9AD/rp7tLcVCbKGUdhkoLGujDpQOVsDHR1BNlRmJL/PaujCK6yv8Q==
X-Received: by 2002:adf:f08a:: with SMTP id n10mr16673709wro.351.1598451598432; 
 Wed, 26 Aug 2020 07:19:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id n7sm6604411wrs.2.2020.08.26.07.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 07:19:57 -0700 (PDT)
From: Graeme Gregory <graeme@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 0/2] Add an embedded controller to sbsa-ref machine
Date: Wed, 26 Aug 2020 15:19:50 +0100
Message-Id: <20200826141952.136164-1-graeme@nuviainc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=graeme@nuviainc.com; helo=mail-wr1-x431.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: edN6hOZZF5Im

This series is to an add embedded controller to the sbsa-ref machine
so that PSCI can communicate platform power states to the platform
which in this case is QEMU.

v1->v2
 - broke out the EC itself as hw/misc/sbsa_ec.c as seperate patch
 - applied review comments to date


