Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4953028lfg;
        Tue, 2 Mar 2021 17:23:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVMP4vbPRQCDN34UPibHhyGIUUrVG3grQ3zDI9vKE+0I2TsZblmgl+VWHJYYvLj4OZ/Niy
X-Received: by 2002:a37:815:: with SMTP id 21mr4357365qki.188.1614734618276;
        Tue, 02 Mar 2021 17:23:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614734618; cv=none;
        d=google.com; s=arc-20160816;
        b=Wv36uLpQy0ZT+JN+HaGCZUAcwR/nUBs3BqkW11L8ya33k1G8msV9ScF3YpCGklUOVN
         uGA3L2W0LtUbzHiiEqWomIgz0Jo+1K4Td3+rd7mbVN+PVV8CW02AJASvAnp/OMa4s9oE
         c8Wr9IDC7uJxkmNkj/bDjDQDaJ97RrtbyfP0+uZ8pvLVVnJ4sJ1Dg/PBQw+JB4+7ZH+7
         WR2YoceG3KkegDS6EyhPSrqZQ5Ox8KE4djjraz8m3Dva0SXDZU1h+ibwFlmwYis/khyz
         4ACOLAdkznw5hgzo3AkEwMYpTsM6/fwWEOzkTy6hpbj5Q9UIpzwxPUFWv+3vBfkMpvao
         xcEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uM/kLAy3pF3zoZCkKG6MBBFV1LbwtvhEjhGFlqs5Mcg=;
        b=oXhbBFhKek89q5ObMInjZVcsJC+U3YJBdD728ADIyfHXJnYW+cZUSSZFRGOkhavvKx
         nu5W6qwc3/s/BjqqRDjbKNePaWlO/EPjVBRTAOqtuM2P30w/elvxQ+yr2AX0YTlWJqcn
         1+rBH/FoxMJ9LLEq/gu8TyJiKLHrWS6ai/4YKnkmuxO9JzNRWgOppYpm0Vrqa0vUILTb
         gyAa8tmaBLAJAU/T9XLDYPy7I7GeUX0WkGIIgNDlI7bgeSes/9aXXxE+CDgp4bw1NJ9T
         YAOnGJFRsqjB/aSxpTFtggGTMB09TPdDmJXt7+jZ23gHODaPLT6RNsBlg/AfiLBzWgMc
         zr7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UeHpv40F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si8102947qvn.131.2021.03.02.17.23.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 17:23:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UeHpv40F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHGEj-00089v-2k
	for alex.bennee@linaro.org; Tue, 02 Mar 2021 20:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHGDk-00088q-Gu; Tue, 02 Mar 2021 20:22:36 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:39143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHGDi-0003bN-Vh; Tue, 02 Mar 2021 20:22:36 -0500
Received: by mail-pg1-x532.google.com with SMTP id x29so6870800pgk.6;
 Tue, 02 Mar 2021 17:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uM/kLAy3pF3zoZCkKG6MBBFV1LbwtvhEjhGFlqs5Mcg=;
 b=UeHpv40FFU5Gyr9jspIA2JDTRqHI1TeBOtM6NsM/fYsbE+JrV8bZ8YG/4G3zDqCU3R
 mQYqRAtaWB3tEfLgIiU5OHwpa0FtJz+r+CbtrIdaqwXgL6h5XCkeNOkCaxcDK0bq8Wm2
 dLngNfHQ1S6ZYVf1IeKzae3oZWl0HDKkxN+n1JpGwIu5G2nTlEcTzV8pZsiXNJGt/8sp
 VvW3jMnrwwubCmOXkuza0Rc0C96xMJmBOHLpZFMZ9cgyaUATo0dvO2QEEY70IlYomsou
 eKJbZJRpiWb55INNjA06Bkbu9gliqNW4+VAEvYLxqZ8+q1/RWeH9ZZdQr5JaDAQUzMvs
 L+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uM/kLAy3pF3zoZCkKG6MBBFV1LbwtvhEjhGFlqs5Mcg=;
 b=TRc2Nh+OotGAtqhnVe+g9yXt3RqkrxP+KB4oiIwE2g7RxgqNwk2l5TYx91owI2DLY+
 BElICAgy+kCWZ+O4/tK/bkOHG2hm8dRUwZt6QQ/LDN1hpQ0KRpzbSTUTxC9KceLxIUQm
 cGAlxa2RmmAVtnsoZ2fEaKtXQKaysNIyK/W9Gus1FaInHqCAb0VR44D9t2Qs06xoeoqX
 r3ASVKFOvYRcQD5H2rfo0IsZP4rEherZtifTReX9CaadnFVi843WSK2B1WQ/zTe0sCvV
 Uvp2MjY/iuknCYy1V8hNgEcWF0sS4ZgBiEocd0aO+j7VrUbDKtY+jUnKxRwmhjtXxREA
 V4cw==
X-Gm-Message-State: AOAM530zVpj2ANWtYZtyEAJxq3B9+0ewPGUTMs+iXt1H4BiBlrSvzHqD
 KNryp5mhCJVoKzTPtwbhrZI=
X-Received: by 2002:a62:7d17:0:b029:1ee:3bbe:fa5f with SMTP id
 y23-20020a627d170000b02901ee3bbefa5fmr830685pfc.67.1614734553153; 
 Tue, 02 Mar 2021 17:22:33 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id t19sm14135427pgj.8.2021.03.02.17.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 17:22:32 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 1/2] tests/acceptance: Test ast2400 and ast2500 machines
Date: Wed,  3 Mar 2021 11:52:16 +1030
Message-Id: <20210303012217.637737-2-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303012217.637737-1-joel@jms.id.au>
References: <20210303012217.637737-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dZMERF1Mqb6d

Test MTD images from the OpenBMC project on AST2400 and AST2500 SoCs
from ASPEED, by booting Palmetto and Romulus BMC machines.

The images are fetched from OpenBMC's release directory on github.

Co-developed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/acceptance/boot_linux_console.py | 46 ++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index eb012867997f..2f46a08fdc10 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -1048,6 +1048,52 @@ def test_arm_vexpressa9(self):
         self.vm.add_args('-dtb', self.workdir + '/day16/vexpress-v2p-ca9.dtb')
         self.do_test_advcal_2018('16', tar_hash, 'winter.zImage')
 
+    def test_arm_ast2400_palmetto_openbmc_v2_9_0(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:palmetto-bmc
+        """
+
+        image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
+                     'obmc-phosphor-image-palmetto.static.mtd')
+        image_hash = ('3e13bbbc28e424865dc42f35ad672b10f2e82cdb11846bb28fa625b48beafd0d')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        self.do_test_arm_aspeed(image_path)
+
+    def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:romulus-bmc
+        """
+
+        image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
+                     'obmc-phosphor-image-romulus.static.mtd')
+        image_hash = ('820341076803f1955bc31e647a512c79f9add4f5233d0697678bab4604c7bb25')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        self.do_test_arm_aspeed(image_path)
+
+    def do_test_arm_aspeed(self, image):
+        self.vm.set_console()
+        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
+                         '-net', 'nic')
+        self.vm.launch()
+
+        self.wait_for_console_pattern("U-Boot 2016.07")
+        self.wait_for_console_pattern("## Loading kernel from FIT Image at 20080000")
+        self.wait_for_console_pattern("Starting kernel ...")
+        self.wait_for_console_pattern("Booting Linux on physical CPU 0x0")
+        self.wait_for_console_pattern(
+                "aspeed-smc 1e620000.spi: read control register: 203b0641")
+        self.wait_for_console_pattern("ftgmac100 1e660000.ethernet eth0: irq ")
+        self.wait_for_console_pattern("systemd[1]: Set hostname to")
+        # This often takes longer than the 90s timeout
+        # self.wait_for_console_pattern("login:")
+        self.vm.shutdown()
+
     def test_m68k_mcf5208evb(self):
         """
         :avocado: tags=arch:m68k
-- 
2.30.1

