Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B641CCD4F3C
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 17:49:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPOZ2-0004s1-I0; Tue, 19 May 2026 13:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <williamdapinho@gmail.com>)
 id 1wPOYo-0004gM-BX
 for qemu-arm@nongnu.org; Tue, 19 May 2026 13:48:55 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <williamdapinho@gmail.com>)
 id 1wPOYk-0008My-8p
 for qemu-arm@nongnu.org; Tue, 19 May 2026 13:48:51 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-488b0046078so35590975e9.1
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 10:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779212927; x=1779817727; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/SBLz/jBkK5JwJeAidAiyw3zmoon26oOp3vH5EZYXkU=;
 b=RP9BlRBqBsZvNSFFh3oOyT5oHk7F7lI8oraIKZ7tZ6k/bFLMEwpr3xoHpo2lHbQVIK
 i5uYVNtbkOAd4IceklrNs+26Bxk+yIVDGcTms8vc11JfLtKWdM1rZ0K/rk1hqTb60ofh
 r3Yfx26q5+p7o0sIPkTl7bcVMIFv2zvecpVggDjy1MkwoWQyNdz4N8GbJERAGJ2a64Qy
 caIvCCwZkynttngqP3sYgIi+px8H56DI48atii9SGBtiOya2wwVAjKoBn0J1+LU7r9dq
 fa7VvEg2DpFk5QST4lZSxAT9IVNnEf81yjJOfH1+qdtoFmJAw4nkxMAfGv/V0nVxa3zt
 ljbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779212927; x=1779817727;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/SBLz/jBkK5JwJeAidAiyw3zmoon26oOp3vH5EZYXkU=;
 b=e6aYDn5lIyYvGkkxA1VYCkn437m6A3LJC6dpIK69XiSfAQ8LbL+vWxsbCZWo3zW5Ju
 spyc+EIWaclTVh4gry2BKdahjuWZ+3NDU8Lr8EJ1uBiooeUeo2yMEYQ+Mjv6np7M62ZJ
 GACN38bvarpK/wuBWiP5M7htokdV2vNQjv3PH0GOOg09fTnmI11aLCM7vYWZ98ZXMWUr
 /tX1q/sD9DbT13EmZbU2zYxWeWaE8FkK//SeDGo0mI2uzeUo2//868eADWPOPu+8spRV
 J+WQ2I3CvjaTppQSstva/fTJQxPSu+xC7cKdLyMrpymLAEEDL6jlcS92wJDyDxx/egqL
 PgDg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8q+LU9BgTLKEH4b63ztk3sw6abF0wohvUgzvj4fYW+uQRVu1Y9Ye9DpwPfwQlqqnLR+oVOn+3ZeA==@nongnu.org
X-Gm-Message-State: AOJu0YygOTk5VGGNTGNgn10zQMvhCjInx4sQ621CvQJEplXR+10eZvhz
 mDfGJ0XR2brqJNeGf+eALt1Mz0eu5Qa0tMpdW5kBKlfSE9pvTPUODCPK
X-Gm-Gg: Acq92OGrzlwvDmY6nfymWS3vZ+HQiZXdLC0+RUpf7EI4bXNYanzBqBnyiRc4X560i/v
 6lRf+Dn1gImNPN2znbAAvlzNnrAIiNTlH1HXTDuMl2zx/VwF2ioFOd8Rt0fXPcehpExusXsEOvo
 Ih58GaHY0ZdflMF2/Gz+TXqcJttoHH17yzbD/bb7UDXahr9ompP79tfZ5ZS5vYBETbtTuHHNc/n
 QKMr4/+3Yc/hCqZuefbDFxjrJBdJnxDIzCKdrid/ZMzzRxAoBGDWSvGhqq17LeurjcRwhwlXSOC
 Os491jDe1NWHUq36mMqAXI5yLuOu2YyNQbMX/XKhLbmgTErzidOfLIYU1MaQk4KwY80DhfJNp8z
 KDMEYFr+0JNe2qX/Qj7ztWBK8rbP79QW5szyroTlgLUUn6TzrZpbygaMF5CmkkHWtV5R4F3I8gF
 ovoQgDVSNg3CB0Qyp3RYiuIEkVFOuf5xVg
X-Received: by 2002:a05:600c:a30a:b0:48a:568f:ae8a with SMTP id
 5b1f17b1804b1-48fe5fda35fmr246912045e9.8.1779212926714; 
 Tue, 19 May 2026 10:48:46 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:4::])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fea52a0bfsm174471855e9.0.2026.05.19.10.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 10:48:46 -0700 (PDT)
From: William de Abreu Pinho <williamdapinho@gmail.com>
Subject: [PATCH v3 0/3] hw/arm/aspeed: add anacapa-bmc machine
Date: Tue, 19 May 2026 10:48:37 -0700
Message-Id: <20260519-add-anacapa-machine-v3-0-56c23993a20a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHWiDGoC/23OwQqDMAyA4VeRnpfRdtrOnfYeY4fYVg3MKu0oG
 +K7rwoDDx7/QL5kZtEFcpHdipkFlyjS6HNcTgUzPfrOAdncTHKpeCUEoLWAHg1OCAOanrwD02q
 uFTYcW2R5cwqupc+mPp65e4rvMXy3I0ms079XHXpJAIdaq8o43tSlVPduQHqdzTiw1Utyb9THh
 sxGqbnUV6Vt/m5vLMvyA+/pFR36AAAA
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 William de Abreu Pinho <williamdapinho@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=williamdapinho@gmail.com; helo=mail-wm1-x336.google.com
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

This series adds support for the Anacapa machine type.  The first patch
introduces FacebookAspeedTest and updates the existing Facebook machine
tests.  The second patch adds the machine model and functional tests.
The third patch adds the FRU EEPROM contents.

To: qemu-devel@nongnu.org
Cc: Cédric Le Goater <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Steven Lee <steven_lee@aspeedtech.com>
Cc: Troy Lee <leetroy@gmail.com>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: Kane Chen <kane_chen@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Changes in v3:
- Update docs/system/arm/aspeed.rst to add anacapa-bmc (suggested by
  Cédric Le Goater)
- Link to v2: https://lore.kernel.org/qemu-devel/20260519-add-anacapa-machine-v2-0-47027867d76a@gmail.com

Changes in v2:
- Split the functional test (FacebookAspeedTest) into a separate patch,
  also updating bletchley-bmc and catalina-bmc to use it.
- Link to v1: https://lore.kernel.org/qemu-devel/20260515-add-anacapa-machine-v1-0-9765ce0b9426@gmail.com

---
William de Abreu Pinho (3):
      tests/functional/aspeed: introduce FacebookAspeedTest
      hw/arm/aspeed: add anacapa-bmc machine
      hw/arm/aspeed: anacapa: add FRU EEPROM data

 docs/system/arm/aspeed.rst                    |   3 +-
 hw/arm/aspeed_ast2600_anacapa.c               | 362 ++++++++++++++++++++++++++
 hw/arm/meson.build                            |   1 +
 tests/functional/arm/meson.build              |   2 +
 tests/functional/arm/test_aspeed_anacapa.py   |  25 ++
 tests/functional/arm/test_aspeed_bletchley.py |   6 +-
 tests/functional/arm/test_aspeed_catalina.py  |   6 +-
 tests/functional/aspeed.py                    |   8 +
 8 files changed, 406 insertions(+), 7 deletions(-)
---
base-commit: ee7eb612be8f8886d48c1d0c1f1c65e495138f83
change-id: 20260511-add-anacapa-machine-cf7076ab0afa

Best regards,
-- 
William de Abreu Pinho <williamdapinho@gmail.com>


