Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5183075ejb;
        Tue, 7 Feb 2023 02:10:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+V0k91mVYm4xUQ00pSQRSU0bkClxrTaiJPykcX85VXjxzDgoBhLnfowIBQ6oFRyHSBCApq
X-Received: by 2002:a05:6214:dcd:b0:53a:5812:1434 with SMTP id 13-20020a0562140dcd00b0053a58121434mr4734053qvt.16.1675764649600;
        Tue, 07 Feb 2023 02:10:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675764649; cv=none;
        d=google.com; s=arc-20160816;
        b=tX3Z/PhGC+lW9l+xAc659Omc41i0j4e1tcVVmihA9VWceZt3RCq6UCe+WUrMcZbslk
         C3pSeoLsFEcntQ+4UWwi3QtSe02le5v0kMsb95D/Fh21o9YYuqL9JICueJlXZTBTZWk6
         loYpfntRQOuBR4/dvjbchK+wwD6fORF6EvWJU5h5zvKiybb5yMJbEPmsRvM2bQZivvNp
         S/GQUwd2NBQa2pY91Ze2mEzjqMftfBEq4LBgP3ecUnfn/1MUMB5vLHMft7x1/OeStGRG
         kfYUcujBbEc7NEHK4ubafbyD524tYenOXy+ALbvnzQbfzMvOWM0A0a+hgZgqTFt9p7in
         W5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=i5RdrGYMwBUwMtxng4chWxr4r8k1YfBTRbuE5+Xq5pY=;
        b=ieYLh3MIpMIYQBK9rQMsC337jAd86m1tQybcCFP2kubMAQ89TIhckhGhj3rKDYgQTI
         hq9YHG9WLJMxB6gkMbGP0ZNxSeDHDP9GrGOBz3IdO5tfoYxeKw47JTZa8GHTE6ly9cS6
         nc9qre2nNAO2gWQS/S9p6LgVGZHc+g8czc02dlUeYKNmPOi0K0N10ma5xAMxQJqM1KWC
         itRXDmNhFo+RWkI3viU7uLVfyo6j+i18270gM4j4L4SJFYGsGZmf72qEdw0KQngsTToz
         Z510EAVItXrPxV6Jon6brtxSp2JjS5cMNbgDVtdwlWKl8kTnIKEKKE5EppvjU716029G
         vQRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1-20020a378e01000000b0070655ddd307si10158038qkd.688.2023.02.07.02.10.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 02:10:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKu9-0000bm-Jw; Tue, 07 Feb 2023 05:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtb-0000RL-Ay; Tue, 07 Feb 2023 05:08:20 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtZ-0002OQ-Ed; Tue, 07 Feb 2023 05:08:15 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zNB1t18z4xyj;
 Tue,  7 Feb 2023 21:08:10 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zN83Z7Vz4xwl;
 Tue,  7 Feb 2023 21:08:08 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Subject: [PULL 07/25] tests/avocado/machine_aspeed.py: update buildroot tests
Date: Tue,  7 Feb 2023 11:07:26 +0100
Message-Id: <20230207100744.698694-8-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=a43c=6D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 7lQp+BgRmZIT

Use buildroot 2022.11 based images plus some customization :

  - Linux version is bumped to 6.0.9 and kernel is built with a custom
    config similar to what OpenBMC provides.
  - U-Boot is switched to the one provided by OpenBMC for better support.
  - defconfigs includes more target tools for dev.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20230119123449.531826-7-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 1fc385e1c8..773b1ff3a9 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -123,8 +123,8 @@ def test_arm_ast2500_evb_buildroot(self):
         """
 
         image_url = ('https://github.com/legoater/qemu-aspeed-boot/raw/master/'
-                     'images/ast2500-evb/buildroot-2022.05/flash.img')
-        image_hash = ('549db6e9d8cdaf4367af21c36385a68bb465779c18b5e37094fc7343decccd3f')
+                     'images/ast2500-evb/buildroot-2022.11-2-g15d3648df9/flash.img')
+        image_hash = ('f96d11db521fe7a2787745e9e391225deeeec3318ee0fc07c8b799b8833dd474')
         image_path = self.fetch_asset(image_url, asset_hash=image_hash,
                                       algorithm='sha256')
 
@@ -151,8 +151,8 @@ def test_arm_ast2600_evb_buildroot(self):
         """
 
         image_url = ('https://github.com/legoater/qemu-aspeed-boot/raw/master/'
-                     'images/ast2600-evb/buildroot-2022.05/flash.img')
-        image_hash = ('6cc9e7d128fd4fa1fd01c883af67593cae8072c3239a0b8b6ace857f3538a92d')
+                     'images/ast2600-evb/buildroot-2022.11-2-g15d3648df9/flash.img')
+        image_hash = ('e598d86e5ea79671ca8b59212a326c911bc8bea728dec1a1f5390d717a28bb8b')
         image_path = self.fetch_asset(image_url, asset_hash=image_hash,
                                       algorithm='sha256')
 
-- 
2.39.1

