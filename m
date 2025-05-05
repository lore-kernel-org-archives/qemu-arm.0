Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2305487njj;
        Mon, 5 May 2025 02:08:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWP68TFXESV6Jyhc6W1kuxcRJtAVJB2eBFeQpJFidBQhrGwW/U4VLhH69SD5AJZKt44Y2wKvlGpWGiXKQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHhHWYXoJb/0yTTawcgc469EmJAeGIGu0pH7eWGRXb31edjy9LL+ynIdPL1h5KoMgb5tRoP
X-Received: by 2002:a05:6000:401f:b0:3a0:825a:cf8a with SMTP id ffacd0b85a97d-3a098469f5fmr9490763f8f.26.1746436137173;
        Mon, 05 May 2025 02:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746436137; cv=none;
        d=google.com; s=arc-20240605;
        b=URa8xglibcTJ/WpzxNM8ylZXOZAZXT+oa4ds113m6AliI3KBJkxUlolBnD6A6+vT4x
         R1APMDdmjMYr4Sh3uOmhU3ccBTrGLWwTL68++xZG4r5cfyk+rKE+Zi+apd/xvWi32XCz
         VhJLOdYVvsMAWC58BjpgfaydsS/I5AshaWMtd6hLZuF8oD+s3GipJHRWB9NNixCEvpe1
         S0qugkTS5OTYr8yjYPDCAx6wGlm6i5ZykZ2uspmqwuX/ReRQXNoYEzpT5gHXJjITTORy
         58BVFyxW1EWv323GHW3ddVuZZ+tjrvwf2qzEk8XZn/ZmzhhkReHxI8XEfQyYRIU7ipLo
         /vBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XDVkzVZ1B1n3U7H9pr5qGu8jCOew/f8iA464QHLV+mg=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=QZpjC61Q0oLi0B4EjBMkfXUj5S7yZkMUW8h7rL8SVyg6Rr/iha/jbFFuwy2jRqvHuN
         oC4m+ixh5nH0NekOUvv7cQtBkDlHDj8py6z2gIrMX4dCWUo9QvtuUbGPE53Jgnk/Uop3
         eyzeBtjoMBs4jexyBalVz00aCOZiUT2wTwAnr2H9tEm0+4BRkBerFHM/2krNhYK2Y04L
         uTFGHp/Ok1+TDsFD8iPoZOnC35eLPq/u3vzY+UiMnHOlhNW5/bv1yZGdurusG3k0a771
         k3nX33aNb+TfDofvNNKupvb7rrwHeXijfq2md4WKvn8OrFmsS07aTzzFFrdmlnJsGdu8
         UYJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ACxlrjal;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a099b16df2si5020554f8f.809.2025.05.05.02.08.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 02:08:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ACxlrjal;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uBrno-0000NT-T9; Mon, 05 May 2025 05:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrnG-0007SV-Ac
 for qemu-devel@nongnu.org; Mon, 05 May 2025 05:07:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrnD-0006K7-FT
 for qemu-devel@nongnu.org; Mon, 05 May 2025 05:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746436038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XDVkzVZ1B1n3U7H9pr5qGu8jCOew/f8iA464QHLV+mg=;
 b=ACxlrjalK42TVPHITyAuxBdv+2/vtYjfNzx6HyXcMXO6GSRvINdmHwm4+SEGPhuPik7RBt
 Pv5nW7irNDTapKRwk2ltH3eNZiNRwtzA86/CCTOomN7Kli9txn8krlpfPqbyaFNKatmbwa
 53rO0quXkSfuI3XTaJ7Np/v1mvHhtSM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-277-aqOzqw7IOZ-PkutpwEyOug-1; Mon,
 05 May 2025 05:07:16 -0400
X-MC-Unique: aqOzqw7IOZ-PkutpwEyOug-1
X-Mimecast-MFC-AGG-ID: aqOzqw7IOZ-PkutpwEyOug_1746436035
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 667F519560B4; Mon,  5 May 2025 09:07:15 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C151430002C5; Mon,  5 May 2025 09:07:13 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 12/23] tests/functional/aspeed: Add to test vbootrom for AST2700
Date: Mon,  5 May 2025 11:06:24 +0200
Message-ID: <20250505090635.778785-13-clg@redhat.com>
In-Reply-To: <20250505090635.778785-1-clg@redhat.com>
References: <20250505090635.778785-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: YIaRT3aqNtJl

From: Jamin Lin <jamin_lin@aspeedtech.com>

Add the AST2700 functional test to boot using the vbootrom image
instead of manually loading boot components with -device loader.
The boot ROM binary is now passed via the
-bios option, using the image located in pc-bios/ast27x0_bootrom.bin.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250424075135.3715128-5-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/test_aarch64_aspeed.py | 26 +++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index 1e1f3f9ecece..d02dc7991c1a 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -25,6 +25,18 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
 
         self.vm.launch()
 
+    def verify_vbootrom_firmware_flow(self):
+        wait_for_console_pattern(self, 'Found valid FIT image')
+        wait_for_console_pattern(self, '[uboot] loading')
+        wait_for_console_pattern(self, 'done')
+        wait_for_console_pattern(self, '[fdt] loading')
+        wait_for_console_pattern(self, 'done')
+        wait_for_console_pattern(self, '[tee] loading')
+        wait_for_console_pattern(self, 'done')
+        wait_for_console_pattern(self, '[atf] loading')
+        wait_for_console_pattern(self, 'done')
+        wait_for_console_pattern(self, 'Jumping to BL31 (Trusted Firmware-A)')
+
     def verify_openbmc_boot_and_login(self, name):
         wait_for_console_pattern(self, 'U-Boot 2023.10')
         wait_for_console_pattern(self, '## Loading kernel from FIT Image')
@@ -94,6 +106,11 @@ def start_ast2700_test(self, name):
         self.do_test_aarch64_aspeed_sdk_start(
             self.scratch_file(name, 'image-bmc'))
 
+    def start_ast2700_test_vbootrom(self, name):
+        self.vm.add_args('-bios', 'ast27x0_bootrom.bin')
+        self.do_test_aarch64_aspeed_sdk_start(
+                self.scratch_file(name, 'image-bmc'))
+
     def test_aarch64_ast2700_evb_sdk_v09_06(self):
         self.set_machine('ast2700-evb')
 
@@ -110,5 +127,14 @@ def test_aarch64_ast2700a1_evb_sdk_v09_06(self):
         self.verify_openbmc_boot_and_login('ast2700-default')
         self.do_ast2700_i2c_test()
 
+    def test_aarch64_ast2700a1_evb_sdk_vbootrom_v09_06(self):
+        self.set_machine('ast2700a1-evb')
+
+        self.archive_extract(self.ASSET_SDK_V906_AST2700A1)
+        self.start_ast2700_test_vbootrom('ast2700-default')
+        self.verify_vbootrom_firmware_flow()
+        self.verify_openbmc_boot_and_login('ast2700-default')
+        self.do_ast2700_i2c_test()
+
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.49.0

