Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1449824lfb;
        Mon, 6 Jun 2022 08:25:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydkGib2EPSpUl3Tkpq0Hu2CnXKL5MLIyUlNCo3yLDDCt7cdRR2E5M7SCNM8cZduWG+8j4S
X-Received: by 2002:a05:622a:1054:b0:304:eacb:eee7 with SMTP id f20-20020a05622a105400b00304eacbeee7mr5338953qte.483.1654529106370;
        Mon, 06 Jun 2022 08:25:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654529106; cv=none;
        d=google.com; s=arc-20160816;
        b=pQgbvVWCk0t0D+bJ4bvQcDBz1sxcZGnEOv421kZsF71hv8gLZJ6eHQ1N69oPyIoZ0C
         WeYmRDkD55aVb/epuiDwnVtbN6a/vf09OxxxaMB2GCOwp83p89mkNBazCYMgA9B5rsKb
         Q4oGvZ6Xqpe2NGgEbPcjbOSS30SZjsOaVSqYgKnZiaI3D0gt465o84Wf527UVamaZyD5
         8vs85WbStZaPN7lyD1uhyQGDGxMEXebhBgFwf0SbQLwAzORqKZ0axP7uSzsuvdIVFusa
         ehvkXPsZVFEio2tnHQAWB4cGONtYrXTTSx0gNRZECHRvzRBj1eDMaFO6qL0+lPxEoGcs
         CCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=JkUYRAxk/s8NPyAqSEvMLEVMeJewYLFSHY+LpwZ7axI=;
        b=GOG2RbaqeuGkj0fMeiF632KB6nRdDpNlZJGc1ViySpmzaFHZK9dF0IVwaFtG5mDUlu
         n0unoO2YztRb52DlUW7+WCNXx/wOSSEeG8MNhxH17sqBA8lGOAcIesGUX4SFtPTL28Al
         GSUimc3PyG/oj6zAQAm92WNLTqj8gC9Y8DK40DR5zlAbIre1gcp4xC1V/9rX9AHeRaO5
         mYl23RsXXPnGnGJ6/JkETIBYiJDMXRZyIsP+H+k10aEuM+lZCoklFLmHICRMt6/X+yq6
         rKFvAbsswFD6RiygoYa8IjJ4Hq9GrOZUy6QrV+1rDupXtJwJz56k8HjRXVCMPBdU6WGz
         rfMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp37-20020a05622a1ba500b002f3ddac43a7si1832850qtb.578.2022.06.06.08.25.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 08:25:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyEbJ-0005DG-S4
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 11:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyELk-0006G3-2w; Mon, 06 Jun 2022 11:09:01 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:33747
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyELh-00068y-RB; Mon, 06 Jun 2022 11:08:59 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LGxhk3lZMz4xZZ;
 Tue,  7 Jun 2022 01:08:54 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LGxhd1Nfvz4xZY;
 Tue,  7 Jun 2022 01:08:48 +1000 (AEST)
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
Subject: [PATCH 11/21] test/avocado/machine_aspeed.py: Add an I2C RTC test
Date: Mon,  6 Jun 2022 17:07:22 +0200
Message-Id: <20220606150732.2282041-12-clg@kaod.org>
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jpGRiR/kfAaU

Add a RTC device on bus 15 and check that the ouput of the hwclock
command matches the current year.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index a3b4b9e5093c..28b8a4c8124b 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -136,10 +136,18 @@ def test_arm_ast2600_evb_builroot(self):
 
         self.vm.add_args('-device',
                          'tmp423,bus=aspeed.i2c.bus.15,address=0x4c');
+        self.vm.add_args('-device',
+                         'ds1338,bus=aspeed.i2c.bus.15,address=0x32');
         self.do_test_arm_aspeed_buidroot_start(image_path, '0xf00')
         exec_command_and_wait_for_pattern(self,
                                           'i2cget -y 15 0x4c 0xff', '0x23');
         exec_command_and_wait_for_pattern(self,
                                           'i2cget -y 15 0x4c 0xfe', '0x55');
 
+        exec_command_and_wait_for_pattern(self,
+             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-15/device/new_device',
+             'i2c i2c-15: new_device: Instantiated device ds1307 at 0x32');
+        year = time.strftime("%Y")
+        exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
+
         self.do_test_arm_aspeed_buidroot_poweroff()
-- 
2.35.3

