Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F187CD4F57
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 10:36:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPHo8-0005Aj-Cl; Tue, 19 May 2026 06:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <williamdapinho@gmail.com>)
 id 1wPHo7-0005Ab-DW
 for qemu-arm@nongnu.org; Tue, 19 May 2026 06:36:15 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <williamdapinho@gmail.com>)
 id 1wPHo5-0005sW-DU
 for qemu-arm@nongnu.org; Tue, 19 May 2026 06:36:15 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488b3f8fa2bso34852535e9.1
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 03:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779186971; x=1779791771; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7y9tRwO+0lSOO4TaJoPdAdG3p2FWJzmWaZsdLD7jsEU=;
 b=CvZCd3Ryk3xzDrxzYb10CpYoh5FW06Evxwi+/R58iSWB+Lq2/4GQChYHndal4uFuDF
 1VjhTVkP79Kjjc+s2fQszR3cNk7K/hYru9/ezYfju394Xgt3UTQLr8BQahcb5tGIk0IZ
 +cW8HZjw8BzBppLP1hhN+YbPYT7ezHX+EeVhxAqw28RZPIoqrOzmz88hqDUtUtGU28r4
 ODWmCQrJ027ioc/EgDYfHzrYgwFW38h1xVD6aQXGEQzEE8/vIkUAkUJ+S3eJRelMcem7
 U4ehjwtad+MEawtXotzgeTrP0Wh8xP6vtSEPXZj0MAkTi/hTy416Y0wNvuIent4zWDIP
 srBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779186971; x=1779791771;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7y9tRwO+0lSOO4TaJoPdAdG3p2FWJzmWaZsdLD7jsEU=;
 b=JBeY+y9Fk2+dgvPHISZLUnqsO4k2UO/017M9Rhkqyy8iTW9Xi1Y3lOns9gZ0tMiz7S
 CD/ZxPuz8oasTbO1hS5jzmkYTcPIjoaIPUL5QcGDf1gEA/b3jVyKcBM3w8NiTYa3e/hx
 Z3Le3NU6OPHhyK+SezRerv37BQ2MLZwuzSB7B0gNl6qEXUQi6ZXinvunyyLsnHrDgnVZ
 wvo4izqZsdgp3y1js4PjW8b+lk7UpxsYGXKV6UvbBBcguixcnF+QFprTDpmhx178618i
 gdYYxEfpkom1jlPN+ZA6E9v9IA3h7J+pB7JP7X99+RqEE1jpvtxx+6K6TiKzoCTFIrAX
 4Oyw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/7vkdWwghrJJ7x2RwdSJtWLSBqqBI2cgHm9eYuB9z/hgLW1JYxnW628Che+qdm3QjBcuITUssxVQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywa7DTPjNA8fZt3xoPC6BviDTVSMXSRdqv3uOyjBz5S19SYrO0A
 O5ysmY2dG6pljLvQ7lMbM3FZPWTrzrg+jUHZdfoLpsfwjXQWw10wP1Nj
X-Gm-Gg: Acq92OE4BySc1Yw1gQ9iJrXrSP0PrnoXmJpILJWM6d6cPZOQJY19CLb0Ir2wzY5TJzL
 Guoz5a1Rs+hZhN8EN1LHvOowsDjswRblFfBqwkVQqWi1bdnukVxreP5kEanLecyZQiYJ6h4lxmr
 mIdTbhrdQVBcs/0cO2ZJMrMVyRtSG+yUIsKPc8OUf9jpc0Jfvef+mcoZ/9d9sMm9dK6SFnh0SAc
 YaJW5QsuuiiixEeKm6v1KOF4NbhdGt9NknqAfcr/loIzJ4V9gYjOVuCQ+X4yziJRVl+MIgAQr37
 zQ0VCxSP8TDbW0v4YdZbCg3Mn0wMC/6URwiSXFFWt/p5L+tnv8jVh61kdD+HmEEIpRDVe0+QOpZ
 VNRQf2G3MLPYVkaUL71i8hIUUPLfGD+/nmp5iERZrW5d+N1CTxLAocZTmwWGuR99EGhh9u43rzl
 9PJyrFEzIcTC5qr5u6e7gs0g==
X-Received: by 2002:a05:600c:a406:b0:489:32b:ac0b with SMTP id
 5b1f17b1804b1-48fe4fa1902mr228931695e9.6.1779186970772; 
 Tue, 19 May 2026 03:36:10 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:1::])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5ab52a6sm315450985e9.10.2026.05.19.03.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 03:36:09 -0700 (PDT)
From: William de Abreu Pinho <williamdapinho@gmail.com>
Subject: [PATCH v2 0/3] hw/arm/aspeed: add anacapa-bmc machine
Date: Tue, 19 May 2026 03:36:02 -0700
Message-Id: <20260519-add-anacapa-machine-v2-0-47027867d76a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABM9DGoC/22NQQqDMBBFryKz7pQk1Ihd9R7FxZhMdKBGSYq0i
 HdvKnTX5Xvw398gcxLOcK02SLxKljkWMKcK3EhxYBRfGIwyVtVaI3mPFMnRQjiRGyUyutCoxlK
 vKBCU5ZI4yOuo3rvCo+TnnN7Hyaq/9ter//ZWjQrbxtaOVd9ejL0NE8nj7OYJun3fP91ilq+2A
 AAA
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, William de Abreu Pinho <williamdapinho@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=williamdapinho@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: William de Abreu Pinho <williamdapinho@gmail.com>
---
Changes in v2:
- Split the functional test (FacebookAspeedTest) into a separate patch,
  also updating bletchley-bmc and catalina-bmc to use it.
- Link to v1: https://lore.kernel.org/qemu-devel/20260515-add-anacapa-machine-v1-0-9765ce0b9426@gmail.com

---
William de Abreu Pinho (3):
      tests/functional/aspeed: introduce FacebookAspeedTest
      hw/arm/aspeed: add anacapa-bmc machine
      hw/arm/aspeed: anacapa: add FRU EEPROM data

 hw/arm/aspeed_ast2600_anacapa.c               | 362 ++++++++++++++++++++++++++
 hw/arm/meson.build                            |   1 +
 tests/functional/arm/meson.build              |   2 +
 tests/functional/arm/test_aspeed_anacapa.py   |  25 ++
 tests/functional/arm/test_aspeed_bletchley.py |   6 +-
 tests/functional/arm/test_aspeed_catalina.py  |   6 +-
 tests/functional/aspeed.py                    |   8 +
 7 files changed, 404 insertions(+), 6 deletions(-)
---
base-commit: ee7eb612be8f8886d48c1d0c1f1c65e495138f83
change-id: 20260511-add-anacapa-machine-cf7076ab0afa

Best regards,
-- 
William de Abreu Pinho <williamdapinho@gmail.com>


