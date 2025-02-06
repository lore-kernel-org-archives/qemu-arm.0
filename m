Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1524558njb;
        Thu, 6 Feb 2025 05:13:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUAXB9qJeKE6zXon4ACIzi5oMy6MHYMKImaYPrMMPDJEEu+zTLO3KKjBIsy0J9ci/92E/oa3/DlK9ZdSA==@linaro.org
X-Google-Smtp-Source: AGHT+IFw/WwKhLXhdq9UdelRDUXxSTcXqod8Z5dDFz9bDJheLyMqUBHeXSSJDs2rTtFasa65+vAH
X-Received: by 2002:a05:6214:ccb:b0:6d8:9062:6616 with SMTP id 6a1803df08f44-6e42fb044a0mr89512986d6.7.1738847588763;
        Thu, 06 Feb 2025 05:13:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738847588; cv=none;
        d=google.com; s=arc-20240605;
        b=GseIHdXzRsi5SOd6hsLphe+CAnk2CGUE4tUu1Oc6u+jxwVODHKboGagY0GXBynZfFR
         cdpgdE/ew/7Nk825cEkYNBDOp3aM442/k7Av9zjXyRcukSoRhxMOec4i+sLQ61ZeUftz
         aonpGVAH7wMXo9wHCvYCtRTsvldNMgYk5FSYy1yX6wAzhbuIYc8/nYH0mgCDUD854zXf
         JvkjFLjkf7j7oH8yKuvps61SzxHY6DKtdHHIiUYySSivRfyRDZpyGrWfAZu3mWwO1MeM
         j1/lTb0zCFD5hI8Nxm6sPNdQaYYu2So9Mmr/57ZRx+4STt5d0JefmThT+8oA0iGpGBEw
         q+UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YeunrBTdlxarEESrVvUOHeU40/m+EAzAKhgKeitt+so=;
        fh=7NsVx5R+L140HvZ0es4udPXCD2KdHoHcZm3kdyNBbE4=;
        b=VMvYRt5KFZExJkTHhi3PgcIx4rxBW084iQVzTLOj7VQHHVnaphQ7uj9NqPGY+nAAHv
         FxbrszThJ2grXMp3PBcWl9boXg6XMUM1TkbcR8fAn5nlnDn2drkLDMyR5T5Sk+1q5jY8
         YS3bNPb5VcGDIUveyhnQHdPkpKk/ZJpXI4s/3X43YF1GlBCv/iBD0sFqIM6J/YIkC8zR
         P/TtcuIWbvgEeFp3Btzu4DC8d7WA9YkhiffUdSHi77/j9UT9bSKOUEpOCmk3epfRa7d6
         EVJN0u767YcRBTD/8i/WJ3nJLJQ4edMo7YRIFW2keeJ/8I5qHK8GA/oNs2GtszZEagy4
         AOkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dss3fVcm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43ba2c8e7si11537176d6.45.2025.02.06.05.13.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 05:13:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dss3fVcm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg1gO-0006wj-LD; Thu, 06 Feb 2025 08:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fx-00066I-CM
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:12:14 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fv-0008II-FI
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:12:13 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4361c705434so6084475e9.3
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 05:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738847530; x=1739452330; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YeunrBTdlxarEESrVvUOHeU40/m+EAzAKhgKeitt+so=;
 b=dss3fVcmHATTQ1/Bp3Wb77WX4Mh7qATOZMRhrok0CI4Y63kkcplkBPlHxT7Y4UZEAH
 2ATEZeKct4xC3Ymnd3IN9oxiHR4I30xcVie3b0mnnZ/Nh/f+PYnIcxaJGSowRfuW0B20
 gFHJLjShQUbTr+D7b1F3oxfVfAxpFdU3knNPytt8s2b0G5fWM727/VkrbIwLmqyLxGFF
 AVC53Nf5QV4C+j1JAZdbU/6E3W1AVaL047E35LjdUJgnDH5R2YBApws8vf+uSxXq7ND9
 a7gygurW6PiBjBwaoQE90dI9pXCJXt1ccNdqplEOxsIX7lMdmrwtwprZh+Gj0Om+Pe7m
 cycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738847530; x=1739452330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YeunrBTdlxarEESrVvUOHeU40/m+EAzAKhgKeitt+so=;
 b=wmY9Q8jxv6To3xy16eoeclkFi7WKjPQ4gTsgNG4iwSM8ymHYxSWYq5W7tWISS+AmbT
 9P9qsqLja7dycHj6vKEjMVlJLxLL365HB3PE5olAeOhzb8SqRl0bQnO0NcJoPIju6oyQ
 ZZn9ZV7jr8rLvnOQ0D1HXGiK9Fqj67aqO6vGzoZP9i54z/0k95gNqAKlGERjt1LQH9CB
 aJxEdyItsSN4efo1tV00Pey//EUMEERWYqsOWfPyzt+XQvJ3/Ax/wKZKUeBdzMj1pKRL
 OqnnKcW3MlC+/lrjeiJad/IOfof/zB55bmLM8bKEEyFIYPvHDOJzyPHZRdCmcNFbsFVd
 QABg==
X-Gm-Message-State: AOJu0YwevXkSjv5U3Twr7SZBcfgOL+89Sm5+nHWdqHZobBu4kAL3QfkS
 Fv4jf+bXs8//Fp7NQhJy2ELayF99wAy/j089yNFVjspLpq7kP6wvQk9ycDbOCAs=
X-Gm-Gg: ASbGnctol9sgycqv5bJtYNNuiTc1cl6IYln0XNBv4uta+I1mxPEgGrejecB2FF2I0KJ
 fLwJXpaMokwGV6VbPHyY60G6VrHzX9vdak5KsPhohbeQLJ8Gvm8Z1v9jjIgA4JKMZ96Ib/M1xxn
 bCR/rLf/0PZ0lMmz2lCNXL6d9DY+6IM5oOaA4S/FsYIw1sgMiZ3zCBKL/0auEEx19b0gduAOhsY
 36oCZMoIOo25hMRwruAE8an5uUWGPkBd91B8h2A4q4HhNcO2GCpjiePQfLYdQZBHNqJ29BYwwZo
 BwzeJldO4hMcrqSTFzx50sCQ5IQjZTBcLs4h3/68IwOIvhdlU5PKkLtjlThasBa33w==
X-Received: by 2002:a5d:64e5:0:b0:382:6f3:a20f with SMTP id
 ffacd0b85a97d-38db48a9dcemr5085557f8f.11.1738847529776; 
 Thu, 06 Feb 2025 05:12:09 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dcb0e92sm18665985e9.24.2025.02.06.05.12.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 06 Feb 2025 05:12:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 15/16] tests/functional: Have microblaze tests inherit
 common parent class
Date: Thu,  6 Feb 2025 14:10:51 +0100
Message-ID: <20250206131052.30207-16-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206131052.30207-1-philmd@linaro.org>
References: <20250206131052.30207-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: yO4gQ6EsTmT0

Have the MicroblazeMachine class being common to both
MicroblazeBigEndianMachine and MicroblazeLittleEndianMachine
classes. Move the xmaton and ballerina tests to the parent class.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 .../functional/test_microblaze_s3adsp1800.py  | 23 +++++++++++++++
 .../test_microblazeel_s3adsp1800.py           | 29 ++-----------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/tests/functional/test_microblaze_s3adsp1800.py b/tests/functional/test_microblaze_s3adsp1800.py
index c4226f49cf3..177c8a685bc 100755
--- a/tests/functional/test_microblaze_s3adsp1800.py
+++ b/tests/functional/test_microblaze_s3adsp1800.py
@@ -7,6 +7,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later. See the COPYING file in the top-level directory.
 
+from qemu_test import exec_command_and_wait_for_pattern
 from qemu_test import QemuSystemTest, Asset
 from qemu_test import wait_for_console_pattern
 
@@ -20,6 +21,10 @@ class MicroblazeMachine(QemuSystemTest):
          'day17.tar.xz'),
         '3ba7439dfbea7af4876662c97f8e1f0cdad9231fc166e4861d17042489270057')
 
+    ASSET_IMAGE_LE = Asset(
+        ('http://www.qemu-advent-calendar.org/2023/download/day13.tar.gz'),
+        'b9b3d43c5dd79db88ada495cc6e0d1f591153fe41355e925d791fbf44de50c22')
+
     def do_ballerina_be_test(self, machine):
         self.set_machine(machine)
         self.archive_extract(self.ASSET_IMAGE_BE)
@@ -34,6 +39,24 @@ def do_ballerina_be_test(self, machine):
         # message, that's why we don't test for a later string here. This
         # needs some investigation by a microblaze wizard one day...
 
+    def do_xmaton_le_test(self, machine):
+        self.require_netdev('user')
+        self.set_machine(machine)
+        self.archive_extract(self.ASSET_IMAGE_LE)
+        self.vm.set_console()
+        self.vm.add_args('-kernel', self.scratch_file('day13', 'xmaton.bin'))
+        tftproot = self.scratch_file('day13')
+        self.vm.add_args('-nic', f'user,tftp={tftproot}')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'QEMU Advent Calendar 2023')
+        wait_for_console_pattern(self, 'buildroot login:')
+        exec_command_and_wait_for_pattern(self, 'root', '#')
+        exec_command_and_wait_for_pattern(self,
+                'tftp -g -r xmaton.png 10.0.2.2 ; md5sum xmaton.png',
+                '821cd3cab8efd16ad6ee5acc3642a8ea')
+
+class MicroblazeBigEndianMachine(MicroblazeMachine):
+
     def test_microblaze_s3adsp1800_legacy_be(self):
         self.do_ballerina_be_test('petalogix-s3adsp1800')
 
diff --git a/tests/functional/test_microblazeel_s3adsp1800.py b/tests/functional/test_microblazeel_s3adsp1800.py
index 60aab4a45e8..56645bd0bb2 100755
--- a/tests/functional/test_microblazeel_s3adsp1800.py
+++ b/tests/functional/test_microblazeel_s3adsp1800.py
@@ -7,34 +7,11 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later. See the COPYING file in the top-level directory.
 
-from qemu_test import exec_command_and_wait_for_pattern
-from qemu_test import QemuSystemTest, Asset
-from qemu_test import wait_for_console_pattern
+from qemu_test import QemuSystemTest
 
+from test_microblaze_s3adsp1800 import MicroblazeMachine
 
-class MicroblazeelMachine(QemuSystemTest):
-
-    timeout = 90
-
-    ASSET_IMAGE_LE = Asset(
-        ('http://www.qemu-advent-calendar.org/2023/download/day13.tar.gz'),
-        'b9b3d43c5dd79db88ada495cc6e0d1f591153fe41355e925d791fbf44de50c22')
-
-    def do_xmaton_le_test(self, machine):
-        self.require_netdev('user')
-        self.set_machine(machine)
-        self.archive_extract(self.ASSET_IMAGE_LE)
-        self.vm.set_console()
-        self.vm.add_args('-kernel', self.scratch_file('day13', 'xmaton.bin'))
-        tftproot = self.scratch_file('day13')
-        self.vm.add_args('-nic', f'user,tftp={tftproot}')
-        self.vm.launch()
-        wait_for_console_pattern(self, 'QEMU Advent Calendar 2023')
-        wait_for_console_pattern(self, 'buildroot login:')
-        exec_command_and_wait_for_pattern(self, 'root', '#')
-        exec_command_and_wait_for_pattern(self,
-                'tftp -g -r xmaton.png 10.0.2.2 ; md5sum xmaton.png',
-                '821cd3cab8efd16ad6ee5acc3642a8ea')
+class MicroblazeLittleEndianMachine(MicroblazeMachine):
 
     def test_microblaze_s3adsp1800_legacy_le(self):
         self.do_xmaton_le_test('petalogix-s3adsp1800')
-- 
2.47.1

