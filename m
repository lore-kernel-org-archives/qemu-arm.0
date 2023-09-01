Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp497090ejc;
        Fri, 1 Sep 2023 02:45:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwczAJ6MeMmb2se1EqzX1tFeUJIjvIv+T9p/ZWhqw54Do8lCxj8qe9sgLxapmFKUp7vYFi
X-Received: by 2002:a05:622a:5193:b0:411:fa39:c340 with SMTP id ex19-20020a05622a519300b00411fa39c340mr2184695qtb.17.1693561551036;
        Fri, 01 Sep 2023 02:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561551; cv=none;
        d=google.com; s=arc-20160816;
        b=kFzLCTsljc7IsfzRffw4CQl0okdMSyhIgSXNBQTvUl74hpoWrURidj5hBB9cJhxnfd
         rGqXINKe3ib0U1Cy9KV3iUQd8Fl6EiJH5/tzWkz8jEAzZCDl+Rh65oVYxc1IYuMMuzuG
         bqIuFKxYPnaGWPtI63xqaqTVlfIwBci6GOm+zOb0LWJBAWGX3ih81FozTUetxx5kbhAc
         8+/1rykTF7t6J4XG6UNh6qK8rXo3NTHdV17KozilQhDJecIxNS0vD1Q0dC5F49zKTd76
         O5n2b8tj0+l1yYq9mubgVnTDBYusEzpOHMLvwCEpPXgYudwVONBcoz7lUT/tYrn+PCsJ
         mXmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=r9W7WJjpqG/Y6Z1wvy6YFZgrIfTMPMaCiUm11YrHTzs=;
        fh=mvgX9fHDajzR32GFB0oGHVCpUskYzLFjgR7dhiEaFlU=;
        b=ajg6YFnrePGehkxQH30nrBVa3ad566fCm3v571Si3SXVvBg7/CiI7X1kfPQNp74r7w
         QL2ru82aMmU1hJIPvKh5+eiTa/CV/O3snFsggGJECbvEHPUpwRtCKweJWig7c7AIUJnd
         pPEuJ677UYj9VNDoDhGJmEWSzRLTT643S0H7QdCwLUqnd0AVOmIaH6EBomV8Z9L5Qdyg
         tjXy/Hd6qgw160uA+OhjlPoyfB8Kk7PqbY0rUGpiEjyKkGq4wQoUxIETlopcCILoSWUS
         tYKK7ofo90lOk2Pf48tSXiiAcUd2debH5cnFGqRZKYy2uV5ck7gbiB6r5wFqjx38rwDG
         4S6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3-20020a05622a004300b00410a640d410si2003645qtw.594.2023.09.01.02.45.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 02:45:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qc0fn-0001OF-Lb; Fri, 01 Sep 2023 05:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0fl-0001NY-Rf; Fri, 01 Sep 2023 05:42:37 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0fi-0002t1-KS; Fri, 01 Sep 2023 05:42:37 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY3X26CZz4x3j;
 Fri,  1 Sep 2023 19:42:32 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY3V5Z2cz4wxW;
 Fri,  1 Sep 2023 19:42:30 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Subject: [PULL 05/26] tests/avocado/machine_aspeed.py: Update SDK images
Date: Fri,  1 Sep 2023 11:41:53 +0200
Message-ID: <20230901094214.296918-6-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901094214.296918-1-clg@kaod.org>
References: <20230901094214.296918-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=SnXb=ER=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: E683jmr36TI8

Switch to the latest v8.06 release which introduces interesting
changes for the AST2600 I2C and I3C models. Also take the AST2600 A2
images instead of the default since QEMU tries to model The AST2600 A3
SoC.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 724ee72c0208..90f1b7cb77a1 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -316,8 +316,8 @@ def test_arm_ast2500_evb_sdk(self):
         """
 
         image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
-                     'download/v08.01/ast2500-default-obmc.tar.gz')
-        image_hash = ('5375f82b4c43a79427909342a1e18b4e48bd663e38466862145d27bb358796fd')
+                     'download/v08.06/ast2500-default-obmc.tar.gz')
+        image_hash = ('e1755f3cadff69190438c688d52dd0f0d399b70a1e14b1d3d5540fc4851d38ca')
         image_path = self.fetch_asset(image_url, asset_hash=image_hash,
                                       algorithm='sha256')
         archive.extract(image_path, self.workdir)
@@ -334,8 +334,8 @@ def test_arm_ast2600_evb_sdk(self):
         """
 
         image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
-                     'download/v08.01/ast2600-default-obmc.tar.gz')
-        image_hash = ('f12ef15e8c1f03a214df3b91c814515c5e2b2f56119021398c1dbdd626817d15')
+                     'download/v08.06/ast2600-a2-obmc.tar.gz')
+        image_hash = ('9083506135f622d5e7351fcf7d4e1c7125cee5ba16141220c0ba88931f3681a4')
         image_path = self.fetch_asset(image_url, asset_hash=image_hash,
                                       algorithm='sha256')
         archive.extract(image_path, self.workdir)
@@ -345,8 +345,8 @@ def test_arm_ast2600_evb_sdk(self):
         self.vm.add_args('-device',
                          'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
         self.do_test_arm_aspeed_sdk_start(
-            self.workdir + '/ast2600-default/image-bmc')
-        self.wait_for_console_pattern('nodistro.0 ast2600-default ttyS4')
+            self.workdir + '/ast2600-a2/image-bmc')
+        self.wait_for_console_pattern('nodistro.0 ast2600-a2 ttyS4')
 
         self.ssh_connect('root', '0penBmc', False)
         self.ssh_command('dmesg -c > /dev/null')
-- 
2.41.0

