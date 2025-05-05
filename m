Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2306671njj;
        Mon, 5 May 2025 02:11:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXE4Mvh8uLOVhVyVz4mMxKxG/gAWpxg9Qhom0EQI9YhgfZUZgifVy45ypGHuq6CMI/T5zgRtHMEX4tFRA==@linaro.org
X-Google-Smtp-Source: AGHT+IFp8YZBR4I1k1qdigLzxSm8ic3EWeJHFxgvx/57Mj0QkOTuJ/Qr3cVPolRU+ctuemFKd7tw
X-Received: by 2002:a05:600c:500b:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-441c48bdfb7mr47463525e9.11.1746436310743;
        Mon, 05 May 2025 02:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746436310; cv=none;
        d=google.com; s=arc-20240605;
        b=aQN0gGi3XBu/3YhF1g+aUsY01ureZ8b3EX1ZV1Mrbe1lhxYK66e8sJwE8m4H7B9qaN
         DDHGgSMN/vgwwIqYvTUaBGV/WVgxjNBmoEaqKEtT9e5yFmxKVLa/BTbpRKBQlp68+q6k
         ZMx0AMF2XHJAayj3wtsy9uzNDLtYAwOEk/z100vtMuOuzPFCWb2W5l8S60axlqxrpTdL
         KPRsu4iD7OZ+SL8bdh8lLzgh3Dzq/tP6904wGAXBGFgh10PUAVjDIAHwz8c/MdrTscF/
         y5M3fkpMFbfjKtGKcuNB+yebCJbP7991XTOKttvCq7PtYybJcc/gY9iwIshI7LsfejTf
         4vAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Z7ptATJRs5NNiqZ+tIY7JZlmTfT6bQj3fJoJPsG87Ck=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=cCpZzeRbGcGvUTJexN6y1E43HYdsTMPYusaGOyPaMv7Lfc9bZWUfxKnuxSshA2oViN
         vMuqmByVe37I6obwoW4B53faQGtjCAXmK9YJ9Ayt5BHRtcTkarMITWMqOmcLAAOlp7V3
         zOYmmEd6M86l2VScDmLaj7mAINy9Q8mq2X5YMXfwa258cfx204JQ4zkpC4qBzSdo7ioa
         OazcgParixCm1HOObHwlPZ1gdtqDWAFgqiVAUe7N1oEh4b3kz/Mk82mLClGACjlMpsi9
         QRLdmRbS/dqUmPIe7VpcqASN+EVt7mvOtxTyjf82MCbsouA5M1vwuivbS7QmelznLzrx
         dgKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gr1myGxm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-441b89e13eesi64937225e9.79.2025.05.05.02.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 02:11:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gr1myGxm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uBrpj-0001ha-3F; Mon, 05 May 2025 05:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrms-0006Et-OV
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:07:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrmo-0006Cv-LS
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746436012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z7ptATJRs5NNiqZ+tIY7JZlmTfT6bQj3fJoJPsG87Ck=;
 b=Gr1myGxmZaKJzrlJV3NvRu7/nqafT/s5V7AowDqyyFEOfGAWJXPZfAidLulpaprE3UdrTV
 Nh4c7oD1y9Xhl43KVw0gxEBev11k6AY3q8FIY1uijM5NaLOj2B/GqNgL3mJogtW+mEJIiE
 kizKEI43xBT3eMFFrxOK+S4r6pVmdZw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-532-iNSmkLLCMVmDOuB_Ho90Ww-1; Mon,
 05 May 2025 05:06:51 -0400
X-MC-Unique: iNSmkLLCMVmDOuB_Ho90Ww-1
X-Mimecast-MFC-AGG-ID: iNSmkLLCMVmDOuB_Ho90Ww_1746436010
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6B5DE1955DC6; Mon,  5 May 2025 09:06:50 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9CAB330001A2; Mon,  5 May 2025 09:06:48 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 04/23] tests/functional/aspeed: Update test ASPEED SDK v09.06
 for AST2600
Date: Mon,  5 May 2025 11:06:16 +0200
Message-ID: <20250505090635.778785-5-clg@redhat.com>
In-Reply-To: <20250505090635.778785-1-clg@redhat.com>
References: <20250505090635.778785-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
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
X-TUID: eXp3c/zEKEB+

From: Jamin Lin <jamin_lin@aspeedtech.com>

Update test for AST2600 production revision A3.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250423014008.147542-3-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/test_arm_aspeed_ast2600.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tests/functional/test_arm_aspeed_ast2600.py b/tests/functional/test_arm_aspeed_ast2600.py
index 5ef52f06595d..fdae4c939d8c 100755
--- a/tests/functional/test_arm_aspeed_ast2600.py
+++ b/tests/functional/test_arm_aspeed_ast2600.py
@@ -97,26 +97,27 @@ def test_arm_ast2600_evb_buildroot_tpm(self):
 
         self.do_test_arm_aspeed_buildroot_poweroff()
 
-    ASSET_SDK_V806_AST2600_A2 = Asset(
-        'https://github.com/AspeedTech-BMC/openbmc/releases/download/v08.06/ast2600-a2-obmc.tar.gz',
-        '9083506135f622d5e7351fcf7d4e1c7125cee5ba16141220c0ba88931f3681a4')
+    ASSET_SDK_V906_AST2600 = Asset(
+        'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.06/ast2600-default-obmc.tar.gz',
+        '768d76e247896ad78c154b9cff4f766da2ce65f217d620b286a4a03a8a4f68f5')
 
     def test_arm_ast2600_evb_sdk(self):
         self.set_machine('ast2600-evb')
 
-        self.archive_extract(self.ASSET_SDK_V806_AST2600_A2)
+        self.archive_extract(self.ASSET_SDK_V906_AST2600)
 
         self.vm.add_args('-device',
             'tmp105,bus=aspeed.i2c.bus.5,address=0x4d,id=tmp-test')
         self.vm.add_args('-device',
             'ds1338,bus=aspeed.i2c.bus.5,address=0x32')
         self.do_test_arm_aspeed_sdk_start(
-            self.scratch_file("ast2600-a2", "image-bmc"))
+            self.scratch_file("ast2600-default", "image-bmc"))
 
-        self.wait_for_console_pattern('ast2600-a2 login:')
+        self.wait_for_console_pattern('ast2600-default login:')
 
         exec_command_and_wait_for_pattern(self, 'root', 'Password:')
-        exec_command_and_wait_for_pattern(self, '0penBmc', 'root@ast2600-a2:~#')
+        exec_command_and_wait_for_pattern(self, '0penBmc',
+                                          'root@ast2600-default:~#')
 
         exec_command_and_wait_for_pattern(self,
             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device',
-- 
2.49.0

