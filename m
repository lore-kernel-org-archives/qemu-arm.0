Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1464562lfb;
        Mon, 6 Jun 2022 08:47:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4tR81ZGXihk3WwaOLR2WHo6+Snf6mzn3lu/6FaKcdQIHI8aAsgYVFmo3PLJHLfKMRXoPS
X-Received: by 2002:a37:6c2:0:b0:6a6:a7ed:35d9 with SMTP id 185-20020a3706c2000000b006a6a7ed35d9mr9374751qkg.775.1654530446116;
        Mon, 06 Jun 2022 08:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654530446; cv=none;
        d=google.com; s=arc-20160816;
        b=JevHb4QXLwiJOsocptmTmp8l1WisRV8h7mT/BxWnzY9U6v2EacA0KJ6ukx1dL5+JIb
         FRo9B3kcdmp1a4tlvrh0waJxvQQe0VzdO11mcUEeRZzhSQJGyfKZCkKmTRUl3ZWeBMcd
         4UVRt9u5qUBl6kxyYj3ZJmzZEiPRk8TbpTKshkcuRsTnb91ZBoyEqlxqjKrla4qwcG/F
         L3K/w0QLt5GupggkMpXbDYQ/be+jg098VrYKhYPkUtZO/tFChmB+IAAbgYyyRjcahklg
         IWncoyi/tPKJNkrgEaCbUIgm66qUbuMAJLf4pF2tLZOKLbAuHICb/OjMmBgfNuI0b+aO
         +KGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=p9BO7a371cYiEw4PCxPneJ4mq8RS8hJ2wSbiNnxb1AY=;
        b=vjjZFtAuSMiImJ+OVUgx8AG6Js5WQcl2isFR0EIijhkOe4EpqL26yE+LiEpyFoTlZb
         MKtdgiH6wywI30WqGIMgCAfzuJiVtaKsTER1pC5mzGBYzDAo2bjU1kD3PIYYDFfxP7F7
         kuAzkyhZgnqOansSiEGSguAX3bx3ZiwD3V+oDFW4xRklQ1W6rDKj7/Mw4tfER9EPrMx/
         UOn5C7UV+RI2Y1ev7aj5G5ZjBA6J/BtpFnWO0/onE+H6VANR1PTb5uK3P8SBX+pZN5Rw
         hLVgBkRHWPy0k1RUIp+tmyDeIvLYlYp0z8pqKZ0prXDCBaQc7yRiJWTEfC+2yq2U6vCK
         dpXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v67-20020a37dc46000000b006a5f76b4302si7350393qki.567.2022.06.06.08.47.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 08:47:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyEwv-0007QM-JT
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 11:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyELc-00066p-Mu; Mon, 06 Jun 2022 11:08:54 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:43157
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyELb-00068Y-1P; Mon, 06 Jun 2022 11:08:52 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LGxhc4sPZz4xZg;
 Tue,  7 Jun 2022 01:08:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LGxhW2YR8z4xZY;
 Tue,  7 Jun 2022 01:08:43 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Klaus Jensen <k.jensen@samsung.com>, Peter Delevoryas <pdel@fb.com>,
 Corey Minyard <cminyard@mvista.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 10/21] test/avocado/machine_aspeed.py: Add I2C tests to
 ast2600-evb
Date: Mon,  6 Jun 2022 17:07:21 +0200
Message-Id: <20220606150732.2282041-11-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606150732.2282041-1-clg@kaod.org>
References: <20220606150732.2282041-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NR/oxSSH17jl

Add a temperature tmp423 sensor device on bus 15 and check that the
device and manufacturer id registers contain the expected values.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 5374e7fad17a..a3b4b9e5093c 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -134,5 +134,12 @@ def test_arm_ast2600_evb_builroot(self):
         image_path = self.fetch_asset(image_url, asset_hash=image_hash,
                                       algorithm='sha256')
 
+        self.vm.add_args('-device',
+                         'tmp423,bus=aspeed.i2c.bus.15,address=0x4c');
         self.do_test_arm_aspeed_buidroot_start(image_path, '0xf00')
+        exec_command_and_wait_for_pattern(self,
+                                          'i2cget -y 15 0x4c 0xff', '0x23');
+        exec_command_and_wait_for_pattern(self,
+                                          'i2cget -y 15 0x4c 0xfe', '0x55');
+
         self.do_test_arm_aspeed_buidroot_poweroff()
-- 
2.35.3

