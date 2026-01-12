Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96206C9EC94
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 14:57:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfJJi-0007k6-Rv; Mon, 12 Jan 2026 09:54:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJc-0007c1-7y
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:44 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJX-0001V3-UU
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:42 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b87003e998bso265324466b.1
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 06:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768229678; x=1768834478; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VFgA0VYu8L2qZdFtLSG59wFQUG2ZdcKw/tAAwdRTa1c=;
 b=gqtdL9FIpzsbyywjd+94uEzSl3JmqEftPIrV4wSKfljzl+126omcgHJu1PN9oZ2ON/
 PxKid8LVRPsHBdTC1g26uBBvia9u+XavqZiQUXzvcRLh27ldPk+9JDAZ2MLzNdz2mF19
 ivdXxyZoh7RZ06f1Oufuw0jMZfOs2hXxpjovDN1YAHgIMCnyDm3NSeA1ST0tQ6zbQEWN
 5q48RYLZc56ph5A1ZEzrk6nnVRxnmKk9lHUqFzJOUOtw7E2W9OL1RzZI3xpbImd6w8hm
 op0ZKs0YDpm3F/5Nj4l3lPQctsyNu7XdqhVplcFZy0bNrpvQKRRbi1euUxttQ6IyzAfa
 7B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768229678; x=1768834478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VFgA0VYu8L2qZdFtLSG59wFQUG2ZdcKw/tAAwdRTa1c=;
 b=NxpCwdyuz0Ye8dPy1wIbSEF5rZLDCVhaq+EM5V88nZZX+T9oMviGv/9Djcpx4RO36q
 aCzs+BXmukA3iVggAdbRSZOPLRe0/EHHoPNt92DNwyQ0gieeawNLuaMI9ApG3Ja4aSpX
 GWX0DCNtC1hz53yJ+DmG67stEVVTN2fzGCf4IcOwjSwD5XRfdeQUK3Kb4rwkHRnxFl8T
 WAbDrIlJ/+oQd5IyFg1mRTx0MFaZupTi2jmUCDV4zRt1sSG51ECfhX4EMo194Mc0dMYg
 UhuHzjIgSyKMP7k3zOCK4jjjL2HhV6Jt+xR2LI7x+O23tuReGy4HGiohooa5YNclyAG/
 4Wdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqKj18wtG9DcY5InIZ+J3hUbyyWOERax4ndRAekFg01AZRBWPqtSEwWS7Sb1Pn5YmccS+cL6TUIA==@nongnu.org
X-Gm-Message-State: AOJu0Yz4+VaXn0oR4V7fq11C8Xzru+hMi+kSn2KE3tDcP/7m0P0TQuSZ
 Wa2y+Zq8lOub78ejHvqUZqAnR+d7elHz+ZU0IfpfhApNex6SBd7Zxkct
X-Gm-Gg: AY/fxX7qTjZMNH6NWc2BXT0creAbc6y5bxiAOsvM8wGRo86/ggmkt/D+DBggvWXHceT
 x1xmY51l1Zb1clQzkng2K7Dt7en6ER+OwQBu8Qvf60Vvvu9iBedTtswlxZV5MFOd0mWWX1hGYyU
 YtcpomvkMa/budDgCCbkh6re4nCX6glCRr27nxWAydtQu7tM7H8HV0d0ZL3B314QkF/yo9bIqCt
 bEOW9882O/fXVkGDZwimw9yXTZ4zHZ0Vja4DrtsYkh1uPFnNFyj7iFo3scUTb8bRhsDYYnUV4TV
 fvJegyspsgFxe7jp5RVnEDgbzzQtTBILWbPD3dQnwgyhWz2TT4E1WpQP+IKiGEy6L7EIo9vLyi9
 0bh+NZWMBu1wyn0I0FAaZFSecihWLZe/ZGd1QaMg6bFjOlMHP+gKVa8hxf/2bMuha3jxOqAa9ed
 vqO5nCR8zcQidZXnGjGKoY1q+gA7lzGKabC8xQrF6rbRLG5UvkbsgjoEEnrkQNgXfR6xPpTSH+
X-Google-Smtp-Source: AGHT+IHIg1ku7OTq2gU3v/l4VTJ6T+C0jaYK7M9bhoHnEwBV5Q3wdRQEehiZ3YcHcYHqRi7SDLn4TQ==
X-Received: by 2002:a17:906:8a65:b0:b87:8c1:1ea5 with SMTP id
 a640c23a62f3a-b8708c120femr408800966b.5.1768229677697; 
 Mon, 12 Jan 2026 06:54:37 -0800 (PST)
Received: from archlinux (dynamic-077-188-226-222.77.188.pool.telefonica.de.
 [77.188.226.222]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8731f0718asm37387966b.67.2026.01.12.06.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 06:54:37 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 00/14] Freescale SDHCI Fixes
Date: Mon, 12 Jan 2026 15:54:04 +0100
Message-ID: <20260112145418.220506-1-shentey@gmail.com>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This series splits TYPE_IMX_USDHC into three device models which fixes issu=
es=0D
in the ppce500 and some i.MX machines. In particular, it introduces uSDHC's=
=0D
predecessor eSDHC in big and little endian variants. Once the eSDHCs are=0D
split off, uSDHC emulation is improved which is a stepping stone towards=0D
running u-boot on the i.MX8MP (not implemented yet).=0D
=0D
In a way this series picks up previous efforts:=0D
* https://lore.kernel.org/qemu-devel/20250310000620.70120-14-philmd@linaro.=
org=0D
* https://lore.kernel.org/qemu-devel/20250310000620.70120-15-philmd@linaro.=
org=0D
=0D
There is quite some code churn involved to fix all the issues addressed in=
=0D
this series. Let me know if you have any better ideas to achieve the same.=
=0D
=0D
Best regards,=0D
Bernhard=0D
=0D
Testing done:=0D
* make check=0D
* Boot https://www.qemu-advent-calendar.org/2018/download/day19.tar.xz in=0D
ppce500=0D
* Boot guest in imx8mp-evk=0D
=0D
Bernhard Beschow (14):=0D
  hw/sd/sdhci: Fix TYPE_IMX_USDHC to implement sd-spec-version 3 by=0D
    default=0D
  hw/arm/fsl-imx6: Remove now redundant setting of "sd-spec-version"=0D
    property=0D
  hw/arm/fsl-imx6: Fix naming of SDHCI related constants and attributes=0D
  hw/arm/fsl-imx25: Apply missing reset quirk=0D
  Revert "hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*"=0D
  hw/sd/sdhci: Consolidate eSDHC constants=0D
  hw/sd/sdhci: Rename usdhc_ functions=0D
  hw/sd/sdhci: Add TYPE_FSL_ESDHC_BE=0D
  hw/ppc/e500: Use TYPE_FSL_ESDHC_BE=0D
  hw/arm/fsl-imx25: Extract TYPE_FSL_ESDHC_LE=0D
  hw/sd/sdhci: Remove endianness property=0D
  hw/sd/sdhci: Add uSDHC-specific quirk=0D
  hw/sd/sdhci: Remove vendor property=0D
  hw/sd/trace-events: Remove redundant "SWITCH " command name=0D
=0D
 hw/sd/sdhci-internal.h    |   3 -=0D
 include/hw/arm/fsl-imx6.h |   4 +-=0D
 include/hw/sd/sdhci.h     |   8 +-=0D
 hw/arm/fsl-imx25.c        |   5 +-=0D
 hw/arm/fsl-imx6.c         |  18 ++--=0D
 hw/ppc/e500.c             |  10 +-=0D
 hw/sd/sdhci.c             | 201 ++++++++++++++++++++++++--------------=0D
 hw/sd/trace-events        |   2 +-=0D
 8 files changed, 146 insertions(+), 105 deletions(-)=0D
=0D
-- =0D
2.52.0=0D
=0D

