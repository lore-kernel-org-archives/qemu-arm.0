Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp607687njc;
        Sun, 9 Mar 2025 06:56:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9qeLrbU9mMNEyXN/axg/qMmtxEqhiOj2iYrwxDpCZcZeLy66e8i84p1iVXaicuf4ToK977ELmekBrjg==@linaro.org
X-Google-Smtp-Source: AGHT+IEio8pqHpSaVExQnOisAIPp4MrXPD8+4NHgnCMBDBKczzHr0/JNNQMO86SkWDPJLEVOH2QC
X-Received: by 2002:a05:622a:1b8e:b0:476:8960:d1a3 with SMTP id d75a77b69052e-4768960d50emr7388981cf.14.1741528569309;
        Sun, 09 Mar 2025 06:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528569; cv=none;
        d=google.com; s=arc-20240605;
        b=MfN2yNMqukPr4bKbXnu+cRIXajj8X+yhb28rxjgQBnc55j5Nx2zwdOQKj6j96GMHhC
         etbS6HjyZYi6rLS8cTv+LXF9EFQ9M2Nge2NxtOxXIIEpCN5EN6TfI6qzvXcBcxNtnL/b
         djG1XOu+jBNFUG1t3iAkBYOMserHMxMVlkGRBdhAX1d6d69ZZz3eSl5JXfJrnZKKeWSa
         312SUAlvD9BUNDAe4ZNk99I75JquJ4VbSoMR75Hd1tmZKiIz/rHi8cyEZjtLLUqm2alB
         ahGUrdrEZNbsDXR67gP3glw+yLSN1gZXBEgZrP9z5EavID0LZE7gXBCvphhJNynfDJam
         DhMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=n7OVL8VkWQLMJC+JegLsoHvnR5XUfd0rVESFreOFj50=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=MfnZfwwF/m8MEa8wHEnyHHaOIfGQNW29xCNJ99+l6CmNFRoydWbVPz0O4ZzYg1fOCs
         ZWEDii8iGyBDIuwA79X7YPmINPGFSVWpr8TOOzwTswvZx+K0Ch6S3/UwXBXvQAuO4No/
         HdbWx8bpmdPXutkaGks5KIVM1ltnGemRAlpQmyEcp72p1LCoFTGg3FvAshpTsqV5txdH
         THDU04nOnlU4zGvBv5E/e9xIHWbTclvPU4UP34jHmzc2EKkUtgwGMFEC32ykNnSaj0Vb
         DijIztaJndSGTM+uXAAo3ocRUuFHonshDAXG7tfqla7YuLbGFtVaDUCU2q24aQrcP6a0
         59ig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dt2kx0xC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47678cdbb52si17719651cf.423.2025.03.09.06.56.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:56:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dt2kx0xC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1trH6Q-0004UO-NO; Sun, 09 Mar 2025 09:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH5q-0002im-C0
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:53:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH5o-0003zG-K4
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n7OVL8VkWQLMJC+JegLsoHvnR5XUfd0rVESFreOFj50=;
 b=Dt2kx0xCix3vTpMDsw7A9S5YfvfAARz9+tGPIP2iQMQ8iISKWLcejkKJ4e2ebbDNpElGWE
 ZGsMTFUjzYHfkCAyFI6pMGlOXi1YPWBPMODbfOmaWp/ucd6sVayznVf9DckkDX0CJfNIGB
 MUBBG/xPMy9FrN6u7WOjHcT7eSM4XKA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-341-o-2tuYTzOBKAfaYo7cbhkA-1; Sun,
 09 Mar 2025 09:53:20 -0400
X-MC-Unique: o-2tuYTzOBKAfaYo7cbhkA-1
X-Mimecast-MFC-AGG-ID: o-2tuYTzOBKAfaYo7cbhkA_1741528399
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8856C18004A9; Sun,  9 Mar 2025 13:53:19 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E2E7D1956094; Sun,  9 Mar 2025 13:53:17 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 42/46] tests/functional/aspeed: Introduce start_ast2700_test API
Date: Sun,  9 Mar 2025 14:51:26 +0100
Message-ID: <20250309135130.545764-43-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: FxKgyXZZegs0

From: Jamin Lin <jamin_lin@aspeedtech.com>

Added a new method "start_ast2700_test" to the "AST2x00MachineSDK" class and
this method centralizes the logic for starting the AST2700 test, making it
reusable for different test cases.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250307035945.3698802-26-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/test_aarch64_aspeed.py | 29 +++++++++++++------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index 9595498ace79..e1ad7fd4708c 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -31,33 +31,29 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
             'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.03/ast2700-default-obmc.tar.gz',
             '91225f50d255e2905ba8d8e0c80b71b9d157c3609770c7a740cd786370d85a77')
 
-    def test_aarch64_ast2700_evb_sdk_v09_03(self):
-        self.set_machine('ast2700-evb')
-
-        self.archive_extract(self.ASSET_SDK_V903_AST2700)
-
+    def start_ast2700_test(self, name):
         num_cpu = 4
-        uboot_size = os.path.getsize(self.scratch_file('ast2700-default',
+        uboot_size = os.path.getsize(self.scratch_file(name,
                                                        'u-boot-nodtb.bin'))
         uboot_dtb_load_addr = hex(0x400000000 + uboot_size)
 
         load_images_list = [
             {
                 'addr': '0x400000000',
-                'file': self.scratch_file('ast2700-default',
+                'file': self.scratch_file(name,
                                           'u-boot-nodtb.bin')
             },
             {
                 'addr': str(uboot_dtb_load_addr),
-                'file': self.scratch_file('ast2700-default', 'u-boot.dtb')
+                'file': self.scratch_file(name, 'u-boot.dtb')
             },
             {
                 'addr': '0x430000000',
-                'file': self.scratch_file('ast2700-default', 'bl31.bin')
+                'file': self.scratch_file(name, 'bl31.bin')
             },
             {
                 'addr': '0x430080000',
-                'file': self.scratch_file('ast2700-default', 'optee',
+                'file': self.scratch_file(name, 'optee',
                                           'tee-raw.bin')
             }
         ]
@@ -76,13 +72,12 @@ def test_aarch64_ast2700_evb_sdk_v09_03(self):
         self.vm.add_args('-device',
                          'tmp105,bus=aspeed.i2c.bus.1,address=0x4d,id=tmp-test')
         self.do_test_aarch64_aspeed_sdk_start(
-            self.scratch_file('ast2700-default', 'image-bmc'))
+            self.scratch_file(name, 'image-bmc'))
 
-        wait_for_console_pattern(self, 'ast2700-default login:')
+        wait_for_console_pattern(self, f'{name} login:')
 
         exec_command_and_wait_for_pattern(self, 'root', 'Password:')
-        exec_command_and_wait_for_pattern(self,
-            '0penBmc', 'root@ast2700-default:~#')
+        exec_command_and_wait_for_pattern(self, '0penBmc', f'root@{name}:~#')
 
         exec_command_and_wait_for_pattern(self,
             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-1/device/new_device ',
@@ -94,6 +89,12 @@ def test_aarch64_ast2700_evb_sdk_v09_03(self):
         exec_command_and_wait_for_pattern(self,
             'cat /sys/class/hwmon/hwmon20/temp1_input', '18000')
 
+    def test_aarch64_ast2700_evb_sdk_v09_03(self):
+        self.set_machine('ast2700-evb')
+
+        self.archive_extract(self.ASSET_SDK_V903_AST2700)
+        self.start_ast2700_test('ast2700-default')
+
 
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.48.1

