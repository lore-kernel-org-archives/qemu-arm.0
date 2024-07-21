Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1307384njc;
        Sun, 21 Jul 2024 01:15:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxyEB8Wrv4PUx5H28gQnPITGcEyQOFUIjkGA1qdsy81lfLXQ6NcsOpRcX+jDohLqkWeIfB2pTmP+u0UX+9iKqwZ3FyNVEA
X-Google-Smtp-Source: AGHT+IFfqUsbtWGUPwF6jrWbgRgwsCbuITfwif7dY58nh+yYOzaPcKLF3XBazQMtI/RonHu0l5i5
X-Received: by 2002:a05:620a:269a:b0:79d:569a:6997 with SMTP id af79cd13be357-7a1a13c69c9mr449714085a.70.1721549720018;
        Sun, 21 Jul 2024 01:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721549720; cv=none;
        d=google.com; s=arc-20160816;
        b=aSTzGxoX/TWgkq0GVc37+VyBSRuODG5ab+WyqfogQWueB+RNSzVqt7jtUuF6/NT6Ig
         w2MbNNTPHZ4EJ042vLKLKrxaG801DH/uA5aevtFAWTnV7TmkT/6JRdxQMzbYdo54G4ai
         DLSQ4y+n6ZcqQUbRPWCl1hf2Q1zH1eMcDaJeJwtPZ6GkkE2A7LkUfpyTELeKmnTDokji
         ciI6KiAbl3bglZ1Q792gD+z4neeTAzSuY3GjBowiyLOl7pYg4ZXp1Bf2CiumYAxDBOan
         +8CuxA8rIJmcH1hwcUxGlMoWAATEH4+LAQs9TiRiLb6eyx/QSpILbnPdpJwY+3uM/H1F
         EhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=1wzLzCscshtHDHvwyRkvpGP6+NyNsPtsxpc3wvfrY6I=;
        fh=//RUmME8FDhHHOy0et2Cqja/I65gKN6UBnwN7MzepaQ=;
        b=yF3nz4ClZ5YaBpurPq5mifPOqXME3ScT84LXbhdrHvIKiuiY4rWLHG+rg9DKewauXu
         K+LkZqMS65wcbd3OauI7Km2wX441XPrXqoOekWxxb9vK3ULKtEaV2UL+fbIMxsgGBJua
         QaDxSVedlCkv/PrsV2bfJryHEcwINe5AOBMj7QW/27cjwnRmingwVqZhFC3HsSr5dCYK
         MR3EQXs6PL4nIVARMoAhRhDp+QGQ8v8nC6cigcBufnrIX+MUigEMZrxjX9HLF44MO6R+
         oj6lA5dk5M/WZesiSePhbMdt7zDn07gvVfnpJngLp44luMdlx5jDbp1yuv6ueCWcQpsN
         DJ7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jT1yu9BT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a19904c05esi535872885a.301.2024.07.21.01.15.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2024 01:15:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jT1yu9BT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVRiP-0000yW-Ql; Sun, 21 Jul 2024 04:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRhw-0000hu-KG
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRhu-0001MX-Sr
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721549651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1wzLzCscshtHDHvwyRkvpGP6+NyNsPtsxpc3wvfrY6I=;
 b=jT1yu9BTX6t8xOEUWSWvVpmzut+8G2suAZUhjnNd4IJVZl9i9R1m3WOBSfyGCby9zg4FEh
 tF8fJ/N/xpAG0SpPvJZaqxknitUdR7uKCf1FH4xFeuTXwqToHYlRENwxAXerPOoWK3bRB4
 kJsmpTLFx48hjTY/fQYjiwZOiYsY3oo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-691-7MH9mvo-OQ2H-ZvmPpALRg-1; Sun,
 21 Jul 2024 04:14:06 -0400
X-MC-Unique: 7MH9mvo-OQ2H-ZvmPpALRg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D662B19560A1; Sun, 21 Jul 2024 08:14:05 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.37])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 222651955D47; Sun, 21 Jul 2024 08:14:03 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 00/15] aspeed queue
Date: Sun, 21 Jul 2024 10:13:46 +0200
Message-ID: <20240721081401.425588-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: t1cO16GPTG3N

The following changes since commit a87a7c449e532130d4fa8faa391ff7e1f04ed660:

  Merge tag 'pull-loongarch-20240719' of https://gitlab.com/gaosong/qemu into staging (2024-07-19 16:28:28 +1000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20240721

for you to fetch changes up to 4db1c16441923fc152142ae4bcc1cba23064cb8b:

  aspeed: fix coding style (2024-07-21 07:46:38 +0200)

----------------------------------------------------------------
aspeed queue:

* SMC model fix (Coverity)
* AST2600 boot for eMMC support and test
* AST2700 ADC model
* I2C model changes preparing AST2700 I2C support

----------------------------------------------------------------
Cédric Le Goater (10):
      aspeed/smc: Fix possible integer overflow
      aspeed: Change type of eMMC device
      aspeed: Load eMMC first boot area as a boot rom
      aspeed/scu: Add boot-from-eMMC HW strapping bit for AST2600 SoC
      aspeed: Introduce a AspeedSoCClass 'boot_from_emmc' handler
      aspeed: Tune eMMC device properties to reflect HW strapping
      aspeed: Add boot-from-eMMC HW strapping bit to rainier-bmc machine
      aspeed: Introduce a 'hw_strap1' machine attribute
      aspeed: Introduce a 'boot-emmc' machine option
      tests/avocado/machine_aspeed.py: Add eMMC boot tests

Jamin Lin (5):
      aspeed/adc: Add AST2700 support
      aspeed/soc: support ADC for AST2700
      hw/i2c/aspeed: support to set the different memory size
      hw/i2c/aspeed: rename the I2C class pool attribute to share_pool
      aspeed: fix coding style

 docs/system/arm/aspeed.rst      |  2 +
 include/hw/adc/aspeed_adc.h     |  1 +
 include/hw/arm/aspeed_soc.h     |  1 +
 include/hw/i2c/aspeed_i2c.h     |  6 +--
 include/hw/misc/aspeed_scu.h    |  4 ++
 hw/adc/aspeed_adc.c             | 16 ++++++++
 hw/arm/aspeed.c                 | 83 +++++++++++++++++++++++++++++++++--------
 hw/arm/aspeed_ast2600.c         |  8 ++++
 hw/arm/aspeed_ast27x0.c         | 12 ++++++
 hw/arm/aspeed_soc_common.c      |  7 ++++
 hw/i2c/aspeed_i2c.c             | 45 ++++++++++++----------
 hw/ssi/aspeed_smc.c             |  3 +-
 tests/avocado/machine_aspeed.py | 39 +++++++++++++++++++
 13 files changed, 188 insertions(+), 39 deletions(-)

