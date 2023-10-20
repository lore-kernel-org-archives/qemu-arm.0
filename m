Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1204385ejb;
        Fri, 20 Oct 2023 06:03:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHhrWZ/lmWAk7Hy4Iy494zWRA97wYG9D/RdrkvT21IC+FC2ChG2tIXN5rCXcGhrcWwadM6
X-Received: by 2002:a0c:9ccf:0:b0:66d:968d:ac06 with SMTP id j15-20020a0c9ccf000000b0066d968dac06mr1520401qvf.33.1697807030767;
        Fri, 20 Oct 2023 06:03:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697807030; cv=none;
        d=google.com; s=arc-20160816;
        b=DNKIFe59dOsIAbJCx6QMDCLujjXjOiff9Wmm/aH6WA6mffKTaMXTCp8LpFzTT9JwCy
         DQaZt5TxcnmaUwqCO+M/OasvKufEKZ+Ma8FG98JLrwQNCiSzUB7cZr5BUnexw9IqXB6k
         1UA8wVdCIGpc1KamzcCyUiuzqP3lZ23bqZXg8JoVqqUiCJVb9l7m/ePWwQ7hksKjZ2xB
         JHId1WCOCYTNJNs9cNOQ3AARqW8rAFk5MtgZocRo2qXpuGLufI4ZgDX8MnJEJEZumt4K
         h7GAjYcxF2nGUdNGV2aWF1O7b+G4dGcK3gUUVQWfQL9frYd/2vsBsdx1HJY0Y/DtFkXC
         pevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=SDBJ3mrLth7e5T3Pd/8WVxgBRrRT5m1C71LOIXG9CdU=;
        fh=QWGggua+3ufs1S3QlzhTWcDhlhc7bBCtXi/Y+/UuB8A=;
        b=EQjnwL3vpoDw6RxmeJ4lgeUtocL6z0x9/2RfwyUQJljrY1mDRT1ed/ax4NL9KprjSO
         xyTAkK6JeEBxgBabVVd3ORya0Dh4bTS+SlqpYffOVfL2ac+Wv/Bd9NQOAdOEdBbHID4D
         DTqDOz5jM39drv6BlTvt8po07QzQEp0+wYfZ1OtJP2DNancwqZifRIREzVxDK6R42nNa
         CAZeSWRCzaZ9jBc6uWyCabmsXmNA4voVhzWiKkxVeSOAfEm9lgm9PhLG5v3Ns/qC0X4P
         7AvDYRLL5P61+5cda1kkmmpPwnxud06+a5dGVugWJRnjJNhbqhNQPYb66AQHsvQXjnr5
         1xug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tYEth7sA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ct11-20020a056214178b00b0064721fc915fsi1303005qvb.161.2023.10.20.06.03.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 06:03:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tYEth7sA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtpAD-0000E8-DV; Fri, 20 Oct 2023 09:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtpAB-0000Dh-Vz
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:03:40 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtpA9-0005F7-87
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:03:39 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-538e8eca9c1so1075120a12.3
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 06:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697807014; x=1698411814; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SDBJ3mrLth7e5T3Pd/8WVxgBRrRT5m1C71LOIXG9CdU=;
 b=tYEth7sA0ihQKgYkpASSUOJqsKR8mZhSSrWLTbGaHJWVTpFfLSYxv7UkToH/EVmm0F
 ZNx2M1Tf6/QvMsmTQzPS5hlHCJkjk904US5Wuno3WKJXT+E+msbTCWDTK1MRvifpgPY6
 OPgMfM16bEYM9tOUgLXcu+sfNAH/kvPmFIFeTnbT1pyNSH+OoHg9CKn49OwBqUnspZBe
 N11RlVmVu4843Gta6SFvh+oLtUPU4mNDnb5M1YLZsd4yKo1mYK3EFMwzNhJ/B3IDCwjj
 Ib9kCy7sDP0w91zUFB1o00icVBTt6zGAB98PMvCE/w4MGJue7yxCBLoSm1Oh0+JXJ6A8
 Gz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697807014; x=1698411814;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SDBJ3mrLth7e5T3Pd/8WVxgBRrRT5m1C71LOIXG9CdU=;
 b=Ax1cLTx0EOW/3lVOCHUWK0iNfxN++Tt0N/lYIMqTh+/zu5FtNWfTNwffjjxQKaEC4I
 Yvg27JienlXrBYcNPDMf6qn2KuEVp61VJtZvn5aIoYkVarPbNU4pglSov3d6+Pjkzx19
 zmvudJKzOEqYTJRfrEGZ2xhmrEAfRaj8IaZzPc7tm0FhJJBBGUK1p7XdU8WMSI3FaEps
 mFIMWeA/dB8uys/IDiKG+xMFZWsaZrYDdueAArlYDnGNmPsVzQIId9ZD0njsbGqpm0qp
 258EjAPreCVPVwAMBKjtO9tY05mOJPQHsm5W9ncpRws+hUiJLEc2LxRKm2NbrZ1KOgLn
 0f2g==
X-Gm-Message-State: AOJu0Yxy2gaNk3RDJV3a0W/oRaVp80iap7id75wOwY7Ipf07gjbDI4W2
 L+lkJXy1brA53H07fFU35kGtMg==
X-Received: by 2002:a05:6402:26d4:b0:53d:e1d9:a11 with SMTP id
 x20-20020a05640226d400b0053de1d90a11mr1666469edd.35.1697807014109; 
 Fri, 20 Oct 2023 06:03:34 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 bx14-20020a0564020b4e00b0052ff9bae873sm1415053edb.5.2023.10.20.06.03.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 06:03:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/9] hw/arm/pxa2xx: SysBus/QDev fixes
Date: Fri, 20 Oct 2023 15:03:21 +0200
Message-ID: <20231020130331.50048-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: 5CKG8CiqzG54

Missing review: 6-9

Hi,

Extracted from a bigger series which enforce QDev state machine
(qdev instance must be realized before external API is used on
it).

While here, pxa2xx i2c/intc devices received some qdev fondness.

Since v3:
- Added Thomas R-b tags

Since v2:
- Fixed i2c_init_bus() call in pxa2xx_i2c_init() (new patch)

Philippe Mathieu-Daudé (9):
  hw/sd/pxa2xx: Realize sysbus device before accessing it
  hw/sd/pxa2xx: Do not open-code sysbus_create_simple()
  hw/pcmcia/pxa2xx: Realize sysbus device before accessing it
  hw/pcmcia/pxa2xx: Do not open-code sysbus_create_simple()
  hw/pcmcia/pxa2xx: Inline pxa2xx_pcmcia_init()
  hw/intc/pxa2xx: Convert to Resettable interface
  hw/intc/pxa2xx: Pass CPU reference using QOM link property
  hw/intc/pxa2xx: Factor pxa2xx_pic_realize() out of pxa2xx_pic_init()
  hw/arm/pxa2xx: Realize PXA2XX_I2C device before accessing it

 include/hw/arm/pxa.h |  2 --
 hw/arm/pxa2xx.c      | 17 +++++++++++------
 hw/arm/pxa2xx_pic.c  | 38 +++++++++++++++++++++++++++++---------
 hw/pcmcia/pxa2xx.c   | 15 ---------------
 hw/sd/pxa2xx_mmci.c  |  7 +------
 5 files changed, 41 insertions(+), 38 deletions(-)

-- 
2.41.0

