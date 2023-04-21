Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1065276ejm;
        Fri, 21 Apr 2023 04:05:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zhz08TNQRWcaHl/jvj60ZsaMux1kUGmME9EXbF0BhWQtOJYjHyvfIorRkx+chlM3ZgOXgI
X-Received: by 2002:ac8:4e45:0:b0:3a8:a84:7ffa with SMTP id e5-20020ac84e45000000b003a80a847ffamr6844972qtw.57.1682075135006;
        Fri, 21 Apr 2023 04:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682075134; cv=none;
        d=google.com; s=arc-20160816;
        b=XymfM+q0BN0JYB6agLODwFb72Fa1afaVcJsid9qY/4gcaNWZ53Ui1VlsxBJCo/HQRE
         twmbwb6376qPvOiVSVN5Klv2UARcUjB4mQSpKEqpF4hup0eUKHZGrOfnRgtlQHNEKnPy
         22qxyRyPBlytZsUrnjzqHl3Xv8XUq0Q6+SpxeTxanwHfLo9AjiWnHovDw0KMj7lgAyPc
         eNbkjZCkFeLSjiAvAXHM5ipY43SPi9BcSxPPVRT6N/0NNpWQZcLdPUuCUYL9WpezIIwL
         JCSFPKeoE6MalTLbvUjYH5IHHQ/JDiija3OMHlLQ0ZtgRQBX7uKnLEXV5ZT+tredAer+
         HLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IMghzdjRgtHPl4/82SMBCKCRF67om7COoladNibMiXw=;
        b=HmaZoyI9ZP3mGNslACDM4Xlo7cpEfz7Fzx6KHzPH3gdMuZU67kfkKl2Tk00H1RZ0GD
         uHF6B4+oiKIYMLB/tEj7sAx9t2tNTCmNh7LFai5Js6n9nlaBWMpu7Dsn+1XIoO2kDJDv
         ouK1AitXjevbJhXvckQYUEP5zePY/deC8e/IUHMzcTa4PUK9iwuqrtYcg34g/Kb8rRKL
         9NesB/JslUlYUxy2WM4BXlnhbkT2dUPYKz+tqPdzC3RIgZKw23U2kQKcAzAP5lzv+jxO
         rXFr08BXPAzTE0Sg4kml1hJQjtgjDdseaEnEVyP9fHg8BTcrNCN0xNpbhIvIJNyrYUoa
         8o+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c6mUDZZm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13-20020a05620a056d00b0074e003ec0e6si2506084qkp.706.2023.04.21.04.05.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 04:05:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c6mUDZZm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppoYa-0002eZ-MZ; Fri, 21 Apr 2023 07:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppoYZ-0002dy-J1
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 07:03:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppoYX-0002HQ-U3
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 07:03:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682075037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IMghzdjRgtHPl4/82SMBCKCRF67om7COoladNibMiXw=;
 b=c6mUDZZmLKZ60mgfeBmcaHYEO7VI8D4zgviOpyB5TNvTZZUwsUX3BpURW0WVUZSx6eU0yc
 IdkSnKrIa/sLnCv2D+J3othHkBoEJINQLwRJyJ6LGEum0cvmDuaDTqA78V3pDysvreR2Va
 GZ4KZ1GPqg6g3qiG21ENmKS324zA8Hk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-YkW6_nWXNxSC85yVBCUqpg-1; Fri, 21 Apr 2023 07:03:54 -0400
X-MC-Unique: YkW6_nWXNxSC85yVBCUqpg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72AE4185A78B;
 Fri, 21 Apr 2023 11:03:53 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DCD8140EBF4;
 Fri, 21 Apr 2023 11:03:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Subject: [PATCH 2/3] tests/avocado/machine_aspeed: Fix the broken
 ast2[56]00_evb_sdk tests
Date: Fri, 21 Apr 2023 13:03:44 +0200
Message-Id: <20230421110345.1294131-3-thuth@redhat.com>
In-Reply-To: <20230421110345.1294131-1-thuth@redhat.com>
References: <20230421110345.1294131-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: tNVvRPYjdXud

test_arm_ast2500_evb_sdk and test_arm_ast2600_evb_sdk are currently
failing. The problem is that they are trying to look for the login
prompt that does not have a newline at the end - but the logic in
_console_interaction() only handles full lines. It used to work by
accident in the past since there were sometimes kernel (warning and
error) messages popping up that finally provided a newline character
in the output, but since the tests have been changed to run with the
"quiet" kernel parameter, this is not working anymore.

To make this work reliably, we must not look for the "login:" prompt,
but have to use some text ending with a newline instead. And in the
ast2600 test, switch to ssh instead of trying to log into the serial
console - this works much more reliable and also has the benefit of
excercising the network interface here a little bit, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/machine_aspeed.py | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index d2c57ccb7e..c9515bafa1 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -8,6 +8,7 @@
 import time
 import os
 
+from avocado_qemu import LinuxSSHMixIn
 from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 from avocado_qemu import exec_command
@@ -230,7 +231,7 @@ def test_arm_ast2600_evb_buildroot(self):
         self.do_test_arm_aspeed_buildroot_poweroff()
 
 
-class AST2x00MachineSDK(QemuSystemTest):
+class AST2x00MachineSDK(QemuSystemTest, LinuxSSHMixIn):
 
     EXTRA_BOOTARGS = (
         'quiet '
@@ -257,7 +258,7 @@ def do_test_arm_aspeed_sdk_start(self, image):
         self.require_netdev('user')
         self.vm.set_console()
         self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
-                         '-net', 'nic', '-net', 'user')
+                         '-net', 'nic', '-net', 'user,hostfwd=:127.0.0.1:0-:22')
         self.vm.launch()
 
         self.wait_for_console_pattern('U-Boot 2019.04')
@@ -285,7 +286,7 @@ def test_arm_ast2500_evb_sdk(self):
 
         self.do_test_arm_aspeed_sdk_start(
             self.workdir + '/ast2500-default/image-bmc')
-        self.wait_for_console_pattern('ast2500-default login:')
+        self.wait_for_console_pattern('nodistro.0 ast2500-default ttyS4')
 
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_arm_ast2600_evb_sdk(self):
@@ -305,24 +306,28 @@ def test_arm_ast2600_evb_sdk(self):
                          'tmp105,bus=aspeed.i2c.bus.5,address=0x4d,id=tmp-test');
         self.vm.add_args('-device',
                          'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
+        self.log.info('going to starrt *******')
         self.do_test_arm_aspeed_sdk_start(
             self.workdir + '/ast2600-default/image-bmc')
-        self.wait_for_console_pattern('ast2600-default login:')
-        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
-        exec_command_and_wait_for_pattern(self, '0penBmc', 'root@ast2600-default:~#')
+        self.wait_for_console_pattern('nodistro.0 ast2600-default ttyS4')
 
-        exec_command_and_wait_for_pattern(self,
-             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device',
+        self.ssh_connect('root', '0penBmc', False)
+        self.ssh_command('dmesg -c > /dev/null')
+
+        self.ssh_command_output_contains(
+             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device ; '
+             'dmesg -c',
              'i2c i2c-5: new_device: Instantiated device lm75 at 0x4d');
-        exec_command_and_wait_for_pattern(self,
+        self.ssh_command_output_contains(
                              'cat /sys/class/hwmon/hwmon19/temp1_input', '0')
         self.vm.command('qom-set', path='/machine/peripheral/tmp-test',
                         property='temperature', value=18000);
-        exec_command_and_wait_for_pattern(self,
+        self.ssh_command_output_contains(
                              'cat /sys/class/hwmon/hwmon19/temp1_input', '18000')
 
-        exec_command_and_wait_for_pattern(self,
-             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-5/device/new_device',
+        self.ssh_command_output_contains(
+             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-5/device/new_device ; '
+             'dmesg -c',
              'i2c i2c-5: new_device: Instantiated device ds1307 at 0x32');
         year = time.strftime("%Y")
-        exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
+        self.ssh_command_output_contains('/sbin/hwclock -f /dev/rtc1', year);
-- 
2.31.1

