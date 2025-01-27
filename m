Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2319437njk;
        Mon, 27 Jan 2025 01:44:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXMKfTZPLoC8Rxc92sAYcvZMyvyxQqrKm3o7RErbi4FnT9jue87bamMQml2pOD+BPrYJau1Y/W4rgDlpw==@linaro.org
X-Google-Smtp-Source: AGHT+IEtBsb6cdEyT+wqfuPA7RYaLG4MtZebW6rkKAm2GTQdWVPgTqzZqVb25/xP+GwFx9a2QJd/
X-Received: by 2002:a05:620a:24cc:b0:7b6:d8da:90a3 with SMTP id af79cd13be357-7be6327c4f3mr6268564385a.44.1737971098288;
        Mon, 27 Jan 2025 01:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737971098; cv=none;
        d=google.com; s=arc-20240605;
        b=KCCBn7R63FHlfbd7s7ZQHsAtmt33Atq5/t5PaXEaa8wjgbgzgMnho04yx0hmiz/eoC
         RunLgrsCC3Zj9au20l80ExNGIs08gfrXvmALStuf9oibGoHTKnPiLlVRjQ3XZLQ+OyJR
         DOedCO98gSNRyMZGF/CFbjMoVQEoEWk7dG4K8/la+de9X6Q2CD3XZlGFpuyVVJPCi/s9
         xvHoeD708DqM5AKd50xAH3l32Aj45/D0sMi79Yuch/lL7UdHvxHPXFp3B+QLlySEMS9N
         Qcmqmhmj+vYH2m2t7iBeieWnYZUycfb6UgXRxIny37pV/ooLWT3l6EoPs1HRvGOuJgGo
         v4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MYFFX2avdRONuETFtnjg8dK8m+riW2xGtzskxvThhqA=;
        fh=HCNC18ZglV+EO+6QG3xAPXXwS303incvJlEkcuytr8w=;
        b=fckRip7jodCYgQ3GcGTXEg073ADuwxp63RynaFI7JA3IvGam+bI9WsNApML3lNFHIH
         z+u1zaD9z3e4uWTIulB4Ffzj5xBFus0uEbfcHUTbcx9dYgo+jfd4uq8G7j3NL5KuUxYv
         DvmpHZUyXGW64scwl5q5ev/Z7f7VOdN0GoDWbVa/Ul9yUQcP3opj9peQ/axYVbkyEXap
         5XfaRdRBR88dVPD/3ZYCTHjutmDbJPsvK7vZMiB7ppDCMOwZ16LAckc3t1kbkX961awT
         2ayL+PGRNKCyB1uG3yb30jcDAclesQux/MBLcG1AgMop3++6SEScoBRbRxzzwwE3W6l0
         tNwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wf2qrajb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af2b7f5si911665285a.644.2025.01.27.01.44.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 01:44:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wf2qrajb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcLfI-000771-UD; Mon, 27 Jan 2025 04:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLeO-0006SW-KA
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 04:43:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLeL-0005Sj-8U
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 04:43:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737970999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MYFFX2avdRONuETFtnjg8dK8m+riW2xGtzskxvThhqA=;
 b=Wf2qrajb/RPXDB0Ge9S5OIiAy0jwPUx+BN68uxX3ZdatvUNPDAqS4jVaCgNM1P8yAUXvLf
 2+g8Sl0KVzT+vVxcnZGBe7R4DIIXRmF2lxAR9D9W5rb9y6PpwiXjiiC/5eVN6K1DHk0zyE
 68zL0192bYZH7vBiUZ+0azRM9xjZYPk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-255-gksnzM6EPMSyDtdH_QvXGw-1; Mon,
 27 Jan 2025 04:43:13 -0500
X-MC-Unique: gksnzM6EPMSyDtdH_QvXGw-1
X-Mimecast-MFC-AGG-ID: gksnzM6EPMSyDtdH_QvXGw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 40C8F1801F10; Mon, 27 Jan 2025 09:43:12 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.63])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 84B4A18008C8; Mon, 27 Jan 2025 09:43:05 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PULL 08/12] test/functional: Update buildroot images to 2024.11
Date: Mon, 27 Jan 2025 10:42:35 +0100
Message-ID: <20250127094239.636526-9-clg@redhat.com>
In-Reply-To: <20250127094239.636526-1-clg@redhat.com>
References: <20250127094239.636526-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: hR1Xkz9Eyjlq

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

Reviewed-by: Jamin Lin <jamin_lin@aspeedtech.com>
Link: https://lore.kernel.org/qemu-devel/20250122070909.1138598-9-clg@redhat.com
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

