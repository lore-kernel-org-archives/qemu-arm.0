Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1466807ejb;
        Tue, 14 Feb 2023 09:20:10 -0800 (PST)
X-Google-Smtp-Source: AK7set/iLxaKKvlCSexRsSMVm+KrDD61OVmJ37ecVvJkXogTg1n6o9TLFLbX1A1SQ9uyyEgHsGBC
X-Received: by 2002:a05:6214:e61:b0:56e:9f5d:87e3 with SMTP id jz1-20020a0562140e6100b0056e9f5d87e3mr5738391qvb.37.1676395209811;
        Tue, 14 Feb 2023 09:20:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676395209; cv=none;
        d=google.com; s=arc-20160816;
        b=RCDHh8mBJf6T0pKcDVOH8XaHQRKac2TLdY0mOMYcIsbzY1LyxeOTRdOyvGcTyjsAQ9
         FqWZF4kRWh7s9d392EwhGhjLOlPkq4Iw91lrusid78Ez+aan7GFbhUQSHa8U0Yep0LAh
         mUC6G2nUnqtbLzZfPLfN4WfxOuqwo6QFc3UUOW+idqlZZ8B0yvHuwyLcPL1/HDQDn91i
         lAMfvuCwG3xaijeINTugKBL165ZEjDmrvuGNfeeiplo0mjww8pwpPwvgoViQId4kyjig
         WUYI3BmF2lcgcmbqQ6cL/mXp6cbP5kRAG42hGpVjo2pco8tFYN/ld/DLKOLuMhbmhGjP
         YqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=QIfVUk0LpDiyhLJBQetHRn1WaKR3JgQ9bR7d+xHhoNE=;
        b=ZPIV6QlY+EXGegac1qNs2Key81ggyQYOjF/wjcEGBYBGsORIx9OtUhhKNyx+iU5l/P
         XhS7f03pFaqCePoCWgLvpRhVYmPH9BzpUcVlpuHO1GvIAdbKSAK7MJEEaVchJrNjMTno
         P44ZbyQM0k8EBWjE4jHDSmw9HkcphRTMRCyzohrGhcZROiJPcNWXV1A56Tkkm+bR2LIT
         b63dbjQw+RdaeYf2XwweOrA+FdkRNidFvBrPlXfFqsh4ZdXJ2A/wXQzefOoqXCSovGPy
         MmRslcqAB/7S/YAU7VOR/ErYAt5cHVI/SgityLfSpzQ4ByJz5nPjc1gxuTuChVczLO11
         FemA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8-20020a0cf488000000b0056e9aee2531si9185193qvm.231.2023.02.14.09.20.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 09:20:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyxO-0001lB-V3; Tue, 14 Feb 2023 12:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org>)
 id 1pRyxI-0001jD-IL; Tue, 14 Feb 2023 12:19:00 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org>)
 id 1pRyxG-0004rc-Rd; Tue, 14 Feb 2023 12:19:00 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PGSc01232z4x87;
 Wed, 15 Feb 2023 04:18:56 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGSbx2Vtqz4x82;
 Wed, 15 Feb 2023 04:18:53 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 4/8] tests/avocado/machine_aspeed.py: Add I2C slave tests
Date: Tue, 14 Feb 2023 18:18:26 +0100
Message-Id: <20230214171830.681594-5-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214171830.681594-1-clg@kaod.org>
References: <20230214171830.681594-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8DhtXx7ZlENm

Test extracted from :

  https://lists.nongnu.org/archive/html/qemu-devel/2022-06/msg00183.html

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index ddf05b3617..d2c57ccb7e 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -199,6 +199,8 @@ def test_arm_ast2600_evb_buildroot(self):
                          'tmp105,bus=aspeed.i2c.bus.3,address=0x4d,id=tmp-test');
         self.vm.add_args('-device',
                          'ds1338,bus=aspeed.i2c.bus.3,address=0x32');
+        self.vm.add_args('-device',
+                         'i2c-echo,bus=aspeed.i2c.bus.3,address=0x42');
         self.do_test_arm_aspeed_buildroot_start(image_path, '0xf00')
 
         exec_command_and_wait_for_pattern(self,
@@ -217,6 +219,14 @@ def test_arm_ast2600_evb_buildroot(self):
         year = time.strftime("%Y")
         exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
 
+        exec_command_and_wait_for_pattern(self,
+             'echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_device',
+             'i2c i2c-3: new_device: Instantiated device slave-24c02 at 0x64');
+        exec_command(self, 'i2cset -y 3 0x42 0x64 0x00 0xaa i');
+        time.sleep(0.1)
+        exec_command_and_wait_for_pattern(self,
+             'hexdump /sys/bus/i2c/devices/3-1064/slave-eeprom',
+             '0000000 ffaa ffff ffff ffff ffff ffff ffff ffff');
         self.do_test_arm_aspeed_buildroot_poweroff()
 
 
-- 
2.39.1

