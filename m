Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp813473njg;
        Wed, 26 Feb 2025 02:49:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVUVoDDcYDWA5Vwlo/yEum4X47twXJ7dGMxTmTLfkhFJ72b4RxpUqm6IyTyQgFhvNzCrY08ShfrYHetrg==@linaro.org
X-Google-Smtp-Source: AGHT+IG+SzFschVyyM+ddFk1xSuMtRSYe3BBdlLihXLdY8e4Pkj9S+TtYRICCexRAU/kCSDvxyMY
X-Received: by 2002:a05:620a:470d:b0:7c0:8452:7955 with SMTP id af79cd13be357-7c247fe23fdmr467176885a.50.1740566944012;
        Wed, 26 Feb 2025 02:49:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740566944; cv=none;
        d=google.com; s=arc-20240605;
        b=RKo1gmr3bj076F1/9FwziqxDB0fFf4ZbaMajClCRVFWvB3PHDkzU4jNL0wDKrv0/5V
         x4fr5qnGMnDDr2nN0ghKztlkOJl/KaJL1mkm6xY2YtYHXPM9MgbcuRzzPnKZtQnH9LsA
         RWDGbRVhOHAeidqoCC9zvPxrbOF7wThuneYhS9+1k9abgaAukaaSWtlD/sQ4nlXL8Gst
         nka41qYTQ/SoJQ+EhdlAF/d4v/MuvlH9uaN7UcQtkZVzE3sGH9vAPwazjacYsiNCCb0A
         tAepzir1NAG45pye7592I3aKYJs5LUkk5b7lsU16TnTsvzxa3LKhyr01HCjOirB70C3i
         E3VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Bv4KGNzaRNdltTomx4xPiNEFg+nRE++rpyehasEsyDM=;
        fh=1OmMLtlHRnnOukQVo+dDoLD8Fyg7stHzFszvvcBOnfw=;
        b=F7PO68gDMH9bHVldLLb82FowrkddmZ8gX4IF+9ONlG119KE03vgymrBSed8q6i9RSJ
         KJ5NSLveUsN0Pgr0csUuTzZmauQ9HPdsUBednwGFr4CB5sRzRTJ0InUmdtXIhgyFxmy6
         a4iNTf0DtWnSGK8BKdDTx7tVZFM0Bhl+kBCaAYxr9nq9eeLJqgCu553k/7MVOJEuGUra
         Nwx46LVy1yqXkNNvaNoyWWpxDkKLLyKV3juThDnSFYw58gUuFj23eqYdJvrKNSPqu9+G
         KDwLq75d3U77mvox3H6rA9CmQY+I5gRKSqBqiAOHRw0uQbu2bK9lVUi2sxPZEEoK7oti
         oEBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LhOx4pTW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c235897si348423185a.32.2025.02.26.02.49.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2025 02:49:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LhOx4pTW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnEyB-00044s-9f; Wed, 26 Feb 2025 05:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tnEy6-00044J-6y
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 05:48:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tnEy3-0005xq-5r
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 05:48:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740566920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bv4KGNzaRNdltTomx4xPiNEFg+nRE++rpyehasEsyDM=;
 b=LhOx4pTWWUQ/zeajU76B6cKoWulFKB41M5p3SgGINbZIl0eiLfXptJ0BWmTYiyKyHDkNoX
 tgte85RfpWg2WjWO/pI/66MfLTf8Lx1dE96GPsECV0A9hp7f0ad5KfKuRlYZRsV+iPjQll
 rqiCUePag37ahw9krwRNv5EqZIxBseg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-597-_VdysMRKP_CUQIqdeo3XpQ-1; Wed,
 26 Feb 2025 05:48:37 -0500
X-MC-Unique: _VdysMRKP_CUQIqdeo3XpQ-1
X-Mimecast-MFC-AGG-ID: _VdysMRKP_CUQIqdeo3XpQ_1740566916
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 65C54193578F; Wed, 26 Feb 2025 10:48:36 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.224.144])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E516E1800359; Wed, 26 Feb 2025 10:48:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Subject: [PATCH] tests/functional/test_arm_sx1: Check whether the serial
 console is working
Date: Wed, 26 Feb 2025 11:48:33 +0100
Message-ID: <20250226104833.1176253-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: PSB3rOQLZUtW

The kernel that is used in the sx1 test prints the usual Linux log
onto the serial console, but this test currently ignores it. To
make sure that the serial device is working properly, let's check
for some strings in the output here.

While we're at it, also add the test to the corresponding section
in the MAINTAINERS file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Based-on: <20250221140640.786341-1-peter.maydell@linaro.org>

 MAINTAINERS                      | 1 +
 tests/functional/test_arm_sx1.py | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 05ec99adfd0..098daea6f24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2000,6 +2000,7 @@ S: Maintained
 F: hw/*/omap*
 F: include/hw/arm/omap.h
 F: docs/system/arm/sx1.rst
+F: tests/functional/test_arm_sx1.py
 
 IPack
 M: Alberto Garcia <berto@igalia.com>
diff --git a/tests/functional/test_arm_sx1.py b/tests/functional/test_arm_sx1.py
index 4dd1e1859fa..25800b388c9 100755
--- a/tests/functional/test_arm_sx1.py
+++ b/tests/functional/test_arm_sx1.py
@@ -43,7 +43,8 @@ def test_arm_sx1_initrd(self):
         self.vm.add_args('-append', f'kunit.enable=0 rdinit=/sbin/init {self.CONSOLE_ARGS}')
         self.vm.add_args('-no-reboot')
         self.launch_kernel(zimage_path,
-                           initrd=initrd_path)
+                           initrd=initrd_path,
+                           wait_for='Boot successful')
         self.vm.wait(timeout=120)
 
     def test_arm_sx1_sd(self):
@@ -54,7 +55,7 @@ def test_arm_sx1_sd(self):
         self.vm.add_args('-no-reboot')
         self.vm.add_args('-snapshot')
         self.vm.add_args('-drive', f'format=raw,if=sd,file={sd_fs_path}')
-        self.launch_kernel(zimage_path)
+        self.launch_kernel(zimage_path, wait_for='Boot successful')
         self.vm.wait(timeout=120)
 
     def test_arm_sx1_flash(self):
@@ -65,7 +66,7 @@ def test_arm_sx1_flash(self):
         self.vm.add_args('-no-reboot')
         self.vm.add_args('-snapshot')
         self.vm.add_args('-drive', f'format=raw,if=pflash,file={flash_path}')
-        self.launch_kernel(zimage_path)
+        self.launch_kernel(zimage_path, wait_for='Boot successful')
         self.vm.wait(timeout=120)
 
 if __name__ == '__main__':
-- 
2.48.1

