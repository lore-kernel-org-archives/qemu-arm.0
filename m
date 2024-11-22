Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5204807njc;
        Thu, 21 Nov 2024 23:33:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU6Rf7+KhQmbOarUaPsYTCzBMABQAfUXD6uzydI5e6svew9uklk68zrSLxQLfn9LctbOWZL2ZvPxiHW9Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGAtSOJaI2i5Ej2CpHnpLxNgPjV7ZJryLWtftcve6PZA3ost0mMVunIWTZv0/leLaBhCFnX
X-Received: by 2002:a05:620a:4448:b0:7ac:a077:6a3d with SMTP id af79cd13be357-7b5144e634fmr280568185a.10.1732260820277;
        Thu, 21 Nov 2024 23:33:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732260820; cv=none;
        d=google.com; s=arc-20240605;
        b=XLBNSG7GGRo/gdtgbEvpPGR+aeqL+b8cjtBeept0ywbwSp8WQjThtgCpxnLQ3j44C9
         5ixjIB6/BAU1ilmY4iVDlbVbHl2QUEA4IVNzwikEBSoqk+24svg2o2fmsZFyPlO22zQt
         JhL4XkoorJ2RmKOJui6M3OTO1T0twA9yJvzGTleEd4POPMN0kZpADW1gIScOSFwLveZ+
         fg+elBjE6ws4sgLYAoOdLDhPjMP48w8bGClFzy0QMX3degiL4TUBQDZCKPW6n2uuKn4X
         eGAc181CLpHHKoZLOD7I7Kx6L9Fgei8mxjYA1a5y3Q1YxthNydeeqdgW4jXRcrcDhs42
         3WgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GUXwaA4BCSEJyimsRFpqsk3xgO5A8rkDg+er7VoCEV8=;
        fh=09DwpQbNoPR2GB8WyOTSHX+5iSoy0YN8vLTWXRZQNFk=;
        b=dOZBtSdsXRnP9EjB7Y4HBUOBrlTj8CXivyV8LcruVEr+SiFvXFJFap9dwKInvwT2XT
         exQVfdLKwO4jkVTjkXwo5QPTXsOVI8Wn/Bh9uuX8YZewD7/Z9UyOq64pVSFFyUFYhEen
         E4ej9KZXMeNFf0rlFTAsYmPswHJLCgXsWDfjdS6jF+lGFhK8YEDD6PRavoXDj+FI5Ouk
         UVI0YqSOXWFh6LxmyjnRPZWbkuWFfLZs7xv4qO7Sdpz+D+OnWS7zZrfVtoS05vvFE72S
         WrnnQtEHG87YQhYAp1zdJTZf5hvWq5FhdvF8L4i9s2/yXJqN09P3Dt/g2wumM1KTsyq8
         PNhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c5DNeTo6;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <clg@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b5143be3fasi137443485a.698.2024.11.21.23.33.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 23:33:40 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c5DNeTo6;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732260819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GUXwaA4BCSEJyimsRFpqsk3xgO5A8rkDg+er7VoCEV8=;
	b=c5DNeTo6efKIrKT4hE74sACOnQLlL1u5jRdIk1voFQYwUXFgAY1hLhdIuVWv3b6dUDbZqG
	IQx+HrxckNeW+dOHUulJx0S/GXy7KQA5PACxIrOjqRvc42xFkVnXn37ylN6RB88j1qxoBK
	FAP06h10kyKj9pBwtMq3rUrm8zsWx7Y=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-22-llHJAn0-OEuGk5REe8-8ng-1; Fri,
 22 Nov 2024 02:33:36 -0500
X-MC-Unique: llHJAn0-OEuGk5REe8-8ng-1
X-Mimecast-MFC-AGG-ID: llHJAn0-OEuGk5REe8-8ng
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3CC6219560AF;
	Fri, 22 Nov 2024 07:33:34 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.14])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 26A5019560A3;
	Fri, 22 Nov 2024 07:33:30 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Troy Lee <leetroy@gmail.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v3 3/3] tests/functional: Remove sleep workarounds from Aspeed tests
Date: Fri, 22 Nov 2024 08:33:09 +0100
Message-ID: <20241122073309.1897944-4-clg@redhat.com>
In-Reply-To: <20241122073309.1897944-1-clg@redhat.com>
References: <20241122073309.1897944-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: NQw9gAYItALy

These were introduced in the avocado tests to workaround read issues
when interacting with console. They are no longer necessary and we can
use the expected "login:" string or the command prompt now. Drop the
last use of exec_command.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/functional/test_arm_aspeed.py | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/tests/functional/test_arm_aspeed.py b/tests/functional/test_arm_aspeed.py
index 7644ecbae750..758737f6c24d 100755
--- a/tests/functional/test_arm_aspeed.py
+++ b/tests/functional/test_arm_aspeed.py
@@ -14,7 +14,6 @@
 from qemu_test import LinuxKernelTest, Asset
 from qemu_test import exec_command_and_wait_for_pattern
 from qemu_test import interrupt_interactive_console_until_pattern
-from qemu_test import exec_command
 from qemu_test import has_cmd
 from qemu_test.utils import archive_extract
 from zipfile import ZipFile
@@ -136,10 +135,8 @@ def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'
         self.wait_for_console_pattern('lease of 10.0.2.15')
         # the line before login:
         self.wait_for_console_pattern(pattern)
-        time.sleep(0.1)
-        exec_command(self, 'root')
-        time.sleep(0.1)
-        exec_command(self, "passw0rd")
+        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
+        exec_command_and_wait_for_pattern(self, 'passw0rd', '#')
 
     def do_test_arm_aspeed_buildroot_poweroff(self):
         exec_command_and_wait_for_pattern(self, 'poweroff',
@@ -158,7 +155,7 @@ def test_arm_ast2500_evb_buildroot(self):
         self.vm.add_args('-device',
                          'tmp105,bus=aspeed.i2c.bus.3,address=0x4d,id=tmp-test');
         self.do_test_arm_aspeed_buildroot_start(image_path, '0x0',
-                                                'Aspeed AST2500 EVB')
+                                                'ast2500-evb login:')
 
         exec_command_and_wait_for_pattern(self,
              'echo lm75 0x4d > /sys/class/i2c-dev/i2c-3/device/new_device',
@@ -188,7 +185,8 @@ def test_arm_ast2600_evb_buildroot(self):
                          'ds1338,bus=aspeed.i2c.bus.3,address=0x32');
         self.vm.add_args('-device',
                          'i2c-echo,bus=aspeed.i2c.bus.3,address=0x42');
-        self.do_test_arm_aspeed_buildroot_start(image_path, '0xf00', 'Aspeed AST2600 EVB')
+        self.do_test_arm_aspeed_buildroot_start(image_path, '0xf00',
+                                                'ast2600-evb login:')
 
         exec_command_and_wait_for_pattern(self,
              'echo lm75 0x4d > /sys/class/i2c-dev/i2c-3/device/new_device',
@@ -209,8 +207,8 @@ def test_arm_ast2600_evb_buildroot(self):
         exec_command_and_wait_for_pattern(self,
              'echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_device',
              'i2c i2c-3: new_device: Instantiated device slave-24c02 at 0x64');
-        exec_command(self, 'i2cset -y 3 0x42 0x64 0x00 0xaa i');
-        time.sleep(0.1)
+        exec_command_and_wait_for_pattern(self,
+             'i2cset -y 3 0x42 0x64 0x00 0xaa i', '#');
         exec_command_and_wait_for_pattern(self,
              'hexdump /sys/bus/i2c/devices/3-1064/slave-eeprom',
              '0000000 ffaa ffff ffff ffff ffff ffff ffff ffff');
-- 
2.47.0
