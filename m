Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp603205njc;
        Tue, 21 Jan 2025 23:10:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVKxgJw9/UjZArolbP3kes+ZKEXSrDbPlElADLa8MOdj9JSXq8Z0NTfVYSHxjZdh2ygt/YWqDyUBBpQyA==@linaro.org
X-Google-Smtp-Source: AGHT+IEaIVDDYtD5sjxr7VwSXRaM/GojG6shPgZlrDi6QOuvBxeyJ0+ZB4jsMn0z4qhgubsOwNan
X-Received: by 2002:a05:6214:194f:b0:6d8:7ccf:b692 with SMTP id 6a1803df08f44-6e1b21732afmr276016576d6.11.1737529835633;
        Tue, 21 Jan 2025 23:10:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737529835; cv=none;
        d=google.com; s=arc-20240605;
        b=OKh9BeJCBcieyoOntmLCSDuHG7IFYtpvD5BPy4LyeIqQvz4vCcnss3jWemisLbQTc2
         TR4vJHJlzHHDAr58SRCealgCNS0/ng1QGh56Hx2Kl5xWE9dFmkHYeVO+lAYObmlS88mr
         lCww3JJq8rR5Iq54sb1Iwh63p+5fiWRwH8osr4HpPjE9DmMXJ51D9aUA2ebMAtn595yS
         ArCT1DuEBx69N4QzwlR01dc1xVLdLJK0cug97+EHYJXMinaTWTjLXwm1Tsn4QWANpFUZ
         tdCsEIg7SPHViStR+dOtpJJCKKOu7eF90BimhsE/PHkS8481Jzn6+K1/6jA4yvkImBb4
         QyPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Y1Mjmej+NWbtF9Rf0A/n1OqduglKw4V57isPbqGzMY8=;
        fh=CQ3JhhEpLx6WUtQxwLyuUdUASVLLkjylcjrkyER1RTM=;
        b=j+zP5kK9Zh8bkrWDQd0dIAvzMJmG7WnYCRlfI3xBqeac7ISWgSQeqM/W1jk4V7czo5
         aqX4q5OWfu1AFnFd2mE08+QRKTGf+7mCqf5a4F5qOqvev+ovb5ycMl4mM6RwcCvLtRJe
         sEwtZ1SuQs0FfchUbHdwirtigkegxYco51oJIMwbtGncIJjBU+ptMc9q5OJXaFCiKmBo
         AwqotmFJYqwZvng9HtepUhn+j2nWhMJ8XVFY+axGM5u6TOVUCBxRKPoSerq7XY5YMexX
         T8xRTLQF/FZARCuSAJr2ZQcgeR8y+v10q/DkSe5pwHWZuxh6l8+aQzPCovvuLwx8LQxO
         SXew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GEUWL9mD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afcd960csi137689706d6.195.2025.01.21.23.10.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 23:10:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GEUWL9mD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taUs7-0005Lv-7q; Wed, 22 Jan 2025 02:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taUs3-0005Jt-Nl
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 02:09:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taUs1-0008Qw-Q6
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 02:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737529788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1Mjmej+NWbtF9Rf0A/n1OqduglKw4V57isPbqGzMY8=;
 b=GEUWL9mDSqDRyWOGnWovLnt0q76oqQh8Y+sNMUd+2t3DOzBloZXHf42uAWiV6zwu6iOhp/
 pWZ0jUNT1Zpb6umOi2u5GZ8srCj79O7sgJP4f/kV2EwrtwiROoM7s5jZLok1bpON/43YnR
 1xEfheutHI9paGwq1pM4/1eyzVcq0qg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-225-ojttCmFEN6SI1hlgSjrwqg-1; Wed,
 22 Jan 2025 02:09:43 -0500
X-MC-Unique: ojttCmFEN6SI1hlgSjrwqg-1
X-Mimecast-MFC-AGG-ID: ojttCmFEN6SI1hlgSjrwqg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B2456195605A; Wed, 22 Jan 2025 07:09:41 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.154])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 98A533003E7F; Wed, 22 Jan 2025 07:09:39 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 8/9] test/functional: Update buildroot images to 2024.11
Date: Wed, 22 Jan 2025 08:09:08 +0100
Message-ID: <20250122070909.1138598-9-clg@redhat.com>
In-Reply-To: <20250122070909.1138598-1-clg@redhat.com>
References: <20250122070909.1138598-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: qnrBKyKSrMec

The main changes compared to upstream 2024.11 buildroot are

- bumped Linux to version 6.11.11 with a custom config
- changed U-Boot to OpenBMC branch for more support
- included extra target packages

See branch [1] for more details.

There is a slight output change when powering off the machine,
the console now contains :

    reboot: Power off not available: System halted

Adjust accordingly the expect string in
do_test_arm_aspeed_buildroot_poweroff().

[1] https://github.com/legoater/buildroot/commits/aspeed-2024.11

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/aspeed.py                  | 2 +-
 tests/functional/test_arm_aspeed_ast2500.py | 8 ++++----
 tests/functional/test_arm_aspeed_ast2600.py | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/functional/aspeed.py b/tests/functional/aspeed.py
index 62f50bab7a33..b52358bb8c61 100644
--- a/tests/functional/aspeed.py
+++ b/tests/functional/aspeed.py
@@ -42,7 +42,7 @@ def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'
 
     def do_test_arm_aspeed_buildroot_poweroff(self):
         exec_command_and_wait_for_pattern(self, 'poweroff',
-                                          'reboot: System halted');
+                                          'System halted');
 
     def do_test_arm_aspeed_sdk_start(self, image):
         self.require_netdev('user')
diff --git a/tests/functional/test_arm_aspeed_ast2500.py b/tests/functional/test_arm_aspeed_ast2500.py
index 743fc46eb29e..1ffba6c9953d 100755
--- a/tests/functional/test_arm_aspeed_ast2500.py
+++ b/tests/functional/test_arm_aspeed_ast2500.py
@@ -11,15 +11,15 @@
 
 class AST2500Machine(AspeedTest):
 
-    ASSET_BR2_202311_AST2500_FLASH = Asset(
+    ASSET_BR2_202411_AST2500_FLASH = Asset(
         ('https://github.com/legoater/qemu-aspeed-boot/raw/master/'
-         'images/ast2500-evb/buildroot-2023.11/flash.img'),
-        'c23db6160cf77d0258397eb2051162c8473a56c441417c52a91ba217186e715f')
+         'images/ast2500-evb/buildroot-2024.11/flash.img'),
+        '641e6906c18c0f19a2aeb48099d66d4771929c361001d554d0d45c667413e13a')
 
     def test_arm_ast2500_evb_buildroot(self):
         self.set_machine('ast2500-evb')
 
-        image_path = self.ASSET_BR2_202311_AST2500_FLASH.fetch()
+        image_path = self.ASSET_BR2_202411_AST2500_FLASH.fetch()
 
         self.vm.add_args('-device',
                          'tmp105,bus=aspeed.i2c.bus.3,address=0x4d,id=tmp-test');
diff --git a/tests/functional/test_arm_aspeed_ast2600.py b/tests/functional/test_arm_aspeed_ast2600.py
index 21640123ee81..6ae4ed636ac3 100755
--- a/tests/functional/test_arm_aspeed_ast2600.py
+++ b/tests/functional/test_arm_aspeed_ast2600.py
@@ -16,15 +16,15 @@
 
 class AST2600Machine(AspeedTest):
 
-    ASSET_BR2_202311_AST2600_FLASH = Asset(
+    ASSET_BR2_202411_AST2600_FLASH = Asset(
         ('https://github.com/legoater/qemu-aspeed-boot/raw/master/'
-         'images/ast2600-evb/buildroot-2023.11/flash.img'),
-        'b62808daef48b438d0728ee07662290490ecfa65987bb91294cafb1bb7ad1a68')
+         'images/ast2600-evb/buildroot-2024.11/flash.img'),
+        '4bb2f3dfdea31199b51d66b42f686dc5374c144a7346fdc650194a5578b73609')
 
     def test_arm_ast2600_evb_buildroot(self):
         self.set_machine('ast2600-evb')
 
-        image_path = self.ASSET_BR2_202311_AST2600_FLASH.fetch()
+        image_path = self.ASSET_BR2_202411_AST2600_FLASH.fetch()
 
         self.vm.add_args('-device',
                          'tmp105,bus=aspeed.i2c.bus.3,address=0x4d,id=tmp-test');
-- 
2.48.1

