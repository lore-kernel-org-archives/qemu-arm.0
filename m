Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5275307lfa;
        Wed, 9 Jun 2021 03:59:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLSnz6ilanuuabD5AdeKbt1/Mopn3BRaz8drd27Dn0yz1GeKRKZivMU3pq+IgzU0l6e6Eh
X-Received: by 2002:a02:2547:: with SMTP id g68mr16351569jag.24.1623236344308;
        Wed, 09 Jun 2021 03:59:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623236344; cv=none;
        d=google.com; s=arc-20160816;
        b=Lj0wAkSZbnTzlQ+HRCNFivRVZj1zppaXUh7AEbeDuoTOfEAJPecVqLoC3Cbsp5Yiw8
         b/nXeWFkknRnJINx2wkkzwEMJ7fape1MsEqyVmDH9+D52WDBGK6Jzh0gbI1zPWIZml4d
         vw2ylLjo5p++XeQ3xxCSlXgg115GTvTQDGEkZY8jyR0z21jEKicUwpbNrr8nka4YeFhr
         5ITANyZIv29ZBEaYRpv3+9Y0guT4JsL2X3spJrKiYHblh68GSrcSfPBBP6ckMSgZmr+Z
         kCDKPa7qE1AWG56jB2QxNHV/SuptgBxUaCe/tjYlLdzSavxAkKGSNKsZEw/wa+E1/ewU
         9xUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=CCOGy3zXThddL4G6l9Ox6Sa5E5r6AVgDtO7P9RWNneg=;
        b=RBeRen3bFshURw3u/g5dt2piu5DjmeQ8JdIHJbMV+OQHzRCeodC+C+/N8zPSX+vNws
         0KEkeQ85JN6ZnHIgMsdRRtKuUKVFAaqNaU6VsyZN558E68ge7AMqLCwbvcvND3WmJekC
         BaVOasjpsfyKvoOkzVXRb/T4nKgGU5sGeq3IIcc64bMYPGvFzh5/P/EKjgifbXLNY27e
         J+9eD0ECuvxQMexEGgHGPPBFviPGZHQ0Y25b6tHMuFw561Y2AqD6dnIds9etSbRvmmq2
         XVTAgDqKZRoRpCgl/7f9f2JJ+KBG/dyxmcTV6TnD2kXPD4IgCVjp/4zOKWeAuaCroXfp
         6AbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XYeKP9vn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si2776192iok.45.2021.06.09.03.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 03:59:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XYeKP9vn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqvvL-0006De-4t
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 06:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lqvum-0006DQ-Dt; Wed, 09 Jun 2021 06:58:28 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lqvuj-0006oa-L8; Wed, 09 Jun 2021 06:58:27 -0400
Received: by mail-pf1-x431.google.com with SMTP id m7so5180946pfa.10;
 Wed, 09 Jun 2021 03:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CCOGy3zXThddL4G6l9Ox6Sa5E5r6AVgDtO7P9RWNneg=;
 b=XYeKP9vnS0ydxt4JzGD5/oMAS8ZLO1nDYUekg6BnJUrNVxOU3+R40pfeuFy/ILgoex
 wPl03CHwD10JPvTPLx0JNk34Uf3JE8Npedex893/3D9p5fU2qmhlqTeTYnIyAAVxrkfY
 vVvCew9vrosHlbBzg/qolu5wy/pP4zhQQNdsC3E2sxfxEbIaN7nVLC2/g/ZqtFKQ+E7d
 suQIconUsraQw6UKB6f19pwU/yCiMzeZ24y6y5R19pBfy7SzvndOGJOcwdiyR9maOTBd
 C0PgdRo2pdqGaGcjcrsmttnRMlbx4nNeSU3O0/22oyXfr5enqF3+EgGaKm2LqKMulIWB
 +bxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CCOGy3zXThddL4G6l9Ox6Sa5E5r6AVgDtO7P9RWNneg=;
 b=VVn3tdPYTjWsWTmNOs/fuy1YNlsG/hRX9ELUTS9XIN/BVrVApdSCG9nZNuvfcBh7eu
 wkobIgTGzripjO9kImWVEf5+w7MVdsnABdZJvxubTCaAkx9Mx+qr18oHqedC6mgwE5NZ
 3BXkzAVfxcFmSdHCFAaF/yRYKVlx4/kUsxpKTBO5Iztnkkeo735W79xNANpnQaXoq7iE
 WK2SR58KJ6HZtADEHDxoiE3m910EMEZg2MmJ+YeNp428W+SNxJyJRzXvxGkco7OAmPq0
 BEXQTi8wgmIVxP2gfJtiTvigOkpMhEX+IyfJ7CfcSSk48cb9d+6Ldl1w3c9FNZDrdQwW
 1pKg==
X-Gm-Message-State: AOAM530Zh6rEXNZBUxJi9fnRtZN2SveW8EhQ7nWSkO4jZzkjdgmR569y
 HBq2ra06gVuJpYP1nCZiCSY=
X-Received: by 2002:a63:62c2:: with SMTP id w185mr3319047pgb.76.1623236303442; 
 Wed, 09 Jun 2021 03:58:23 -0700 (PDT)
Received: from voyager.lan ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id c3sm12866923pfl.42.2021.06.09.03.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:58:22 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/2] hw/misc: DPS310 temp and pressure sensor model
Date: Wed,  9 Jun 2021 20:28:00 +0930
Message-Id: <20210609105802.17015-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KxOcjDbh5jjW

This is a model for the Infineon DPS310 temperature and barometric
pressure sensor.

Joel Stanley (2):
  hw/misc: Add Infineon DPS310 sensor model
  arm/aspeed: Add DPS310 to Witherspoon and Rainier

 hw/arm/aspeed.c     |   4 +-
 hw/misc/dps310.c    | 357 ++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/Kconfig      |   1 +
 hw/misc/Kconfig     |   4 +
 hw/misc/meson.build |   1 +
 5 files changed, 365 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/dps310.c

-- 
2.30.2

