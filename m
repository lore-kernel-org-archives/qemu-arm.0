Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8621CAC5BB
	for <qemu-arm@archiver.kernel.org>; Sat,  4 Oct 2025 20:02:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v58Rb-00014g-2d; Sat, 04 Oct 2025 16:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1v58RP-0000yY-Pb
 for qemu-arm@nongnu.org; Sat, 04 Oct 2025 16:01:17 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1v58RH-0006D5-E4
 for qemu-arm@nongnu.org; Sat, 04 Oct 2025 16:01:15 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-3307de086d8so3180261a91.2
 for <qemu-arm@nongnu.org>; Sat, 04 Oct 2025 13:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759608060; x=1760212860; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=Umtla3NytfKoUezBBfrxf8jHp6mLiJsfT6oOxEHYCmw=;
 b=PBNEuCymSUge7YJL7CUGfssftZ8FftVe2r91KHbbc7BjoQL3R2+3ph3N62s+2m01hm
 npz3z+ca/mzFI8YsKDBTl4BBr0drlRGIJfupy4EuDnCCwr9nHmQ7DLSiw453MGZMIgrU
 A4pTqrPm2f1PxFvfSHjt2RKK01sOZrJdGH/YUVn3+SGOXFW/5RqHsNvHV8KbnHzUIcQb
 vfcQzrMB3aM61CMauwdvFjd8hbtEdqGl5cNriusNdY5m84PYhtCJ7limpWb9irtnQ/03
 FmnT6eEb9hFArbqiS845isXV7BpnrKBy+9zU3B+IPywSSH4OBFyvHwpyfa1Eymn8INjk
 zysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759608060; x=1760212860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Umtla3NytfKoUezBBfrxf8jHp6mLiJsfT6oOxEHYCmw=;
 b=M7Wmc3FKTFtK+bkKv3+I8c8cpTZ70iW42GIeusg/klCNhE6aetObqFuIFO26FxCnSB
 m8qHhE3qmse/bPp5u+F1AOr/t2kBZz4124tDrzH+rlNJqYmUZLacFkzjL3QgJZ/AzXkD
 iN6ucl9Z9EzwLBSV4/nNWYSBofmMLnInOASAn+o9T1/5QC7h6NdFws3kCCd9aLlOtJuq
 7FT4ldcQ9wdoLTxDNa9ji2B6iLj1HDBLOhwdQmbPmFbsWASbFyAej5EmdMfdKGzGAeRx
 2MG01ODY9JHNWJXWDG1v4F5rHBcDwTJDh6W4uAt7ov12RWGWcVW833ni1Bz6mSFbD6Ic
 WV/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUetZPxhqIswvgkflbXx3kPiaiodioIDmEBYn9X2ueoCfJ7uJMXgupEhEUGguwBXEv+RWHmyoqPcg==@nongnu.org
X-Gm-Message-State: AOJu0YzvEpeWiB/aaRU8UnGZBh6ApqJjeqhlWzcUrHndf+P2u4MpM+9B
 E990DGxVdqayYIucgvUl9lti+KduqUf2o2Z1uiVSGlFBJqSBwvY0+wsi
X-Gm-Gg: ASbGncskTvaUhSUw6rWShnP/mYBhOrpI7CCUxYQO41eZZtygvh6jQI/7ZDgfNAPQ4mO
 P8lyaj9RBTI+3RrSnUZDDWTU5N0gLnuby3qfZYsRdRiMUjvvFh9uEpUWVX3uN+gq7/UZw+2jvlK
 WjOyd88TinR5nD0fwZLdkh/II4tw98VEpjzvkYa7ngvbMX/out4L27CHkklny5l9J+QneNcwNwP
 NkSJrfoDOc05SLvMGrnnjiBjhd05oLMJO4EknzYeHysybOTVc8us/zhe5CuiYXGr6ihnZ61TREA
 N6uPNSIM1oOdUqBDmCgKCqPIEG11VbdqcB36adFNpBXh6waIKnoScM+SbxDGpKBl4xEzwFt8Z4P
 OkvUzGuCYUvyAzOdvZrM664Y0z0IgMg9zCe9EFg7liOUWyIkaORJaP9Ri+MhKJyEr9WwL6hfg3Y
 3vOluS
X-Google-Smtp-Source: AGHT+IHkvWg22yPAslH2f1Hgpxg9/CWuEhsimvAiLd7jyCSW8bnaPPPZsUWsPgw+yLtP9tSYIEKhDw==
X-Received: by 2002:a17:90b:1c82:b0:339:bf9e:62a6 with SMTP id
 98e67ed59e1d1-339c278225fmr8882511a91.11.1759608060288; 
 Sat, 04 Oct 2025 13:01:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3399c0b328csm6178779a91.3.2025.10.04.13.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Oct 2025 13:00:59 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/4] Fix Ethernet interface support for microchip-icicle-kit
Date: Sat,  4 Oct 2025 13:00:45 -0700
Message-ID: <20251004200049.871646-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=groeck7@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The Microchip PolarFire SoC Icicle Kit supports two Ethernet interfaces.
The PHY on each may be connected to separate MDIO busses, or both may be
connected on the same MDIO bus using different PHY addresses. Add support
for it to the Cadence GEM emulation.

The Linux kernel checks the PCS disabled bit in the R_DESCONF register
to determine if SGMII is supported. If the bit is set, SGMII support is
disabled. Since the Microchip Icicle devicetree file configures SGMII
interface mode, enabling the Ethernet interfaces fails when booting
the Linux kernel. Add support for clearing the PCS disabled bit.

----------------------------------------------------------------
Guenter Roeck (4):
      hw/net/cadence_gem: Support two Ethernet interfaces connected to single MDIO bus
      hw/riscv: microchip_pfsoc: Connect Ethernet PHY channels
      hw/net/cadence_gem: Add pcs-enabled property
      microchip icicle: Enable PCS on Cadence Ethernet

 hw/net/cadence_gem.c         | 31 ++++++++++++++++++++++++-------
 hw/riscv/microchip_pfsoc.c   |  6 ++++++
 include/hw/net/cadence_gem.h |  4 ++++
 3 files changed, 34 insertions(+), 7 deletions(-)

