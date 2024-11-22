Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5243819njc;
        Fri, 22 Nov 2024 01:03:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUymF+nWplST8FAaNqUKPmHpSjqutYKdChembY7c5zKTu1UQxcbpoI60lQPvCZmAya9tYcXNC7ZfGLzYg==@linaro.org
X-Google-Smtp-Source: AGHT+IFh3h3WAiYmILXUxFyqJP1qXVxJn7xLZlLBZAjz+HDM4h21ULb/QpbsK2p21ykJ/4QzMI64
X-Received: by 2002:a05:6102:c92:b0:4ad:5097:4869 with SMTP id ada2fe7eead31-4addcedb90emr2311936137.22.1732266236865;
        Fri, 22 Nov 2024 01:03:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732266236; cv=none;
        d=google.com; s=arc-20240605;
        b=PmaYF21ABNoDCVdBYUq+5Lo2hP3UJvDHck0eiCpO14kWbheLQTs1i0jC2vJp6goFEK
         RUG+ZjeEt0l+/gXJcfl+UtMz598jJeMyMZuNnbJp8brKf9ren3xpoYB7xJ2aSjxIHylA
         XtEnyO3luUT72/wopqg4Q3aXPrLDJQQ84LWsUTerPwRYnMDKRaOFLyO8cSrt8VetD0uN
         aBhbh9N6DbdhHM3Hm6AbLM+3SYlm63S02vC2Zexl3EVsNCDi1l5sb2YJJbMcJBLonOeG
         ALx9M50j2yARx81DYI4VVytXepMUv9eUiocREwtnQeMHvmAtXaiHp8s4D95P3sOlRROJ
         usNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AEdTdU1lhXJOgfSyKgRXx6S/CtX7ExjPrIh2nkyJ8gg=;
        fh=09DwpQbNoPR2GB8WyOTSHX+5iSoy0YN8vLTWXRZQNFk=;
        b=Dguet2d4fZPnw26+BwUSnmFBdXgabR5SRh+ivVGu+EDOSAEzws5Fp0HmurN/3k4MGk
         w4b8xocNfA4kw6kT1p1JEfZFLshZYdlH9kbbh1qkFwbw9iAzlxXrvY+MzkbhL1rdyYp/
         s0I+JGikIThInJPOmzTUXg2k212rkAuIRBMgDiQyIxPmpPb+jGOqFEoLwvHsByQ5XTgu
         DFaT1tN8aVJbEMPGXTijBiaa+zEPCvKHSIBsVVs1Pn6dq+pKp1sRWVcp7axsNy05Vb8L
         yp/BZk44pJ/BbxfIH3khR+yjxcFTWBdSIQk9oGGtVzYNQv45kD3r+f7FXSFcjssk5M45
         +7cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YRdu0cGv;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <clg@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4adda67d98esi520999137.261.2024.11.22.01.03.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:03:56 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YRdu0cGv;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732266236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AEdTdU1lhXJOgfSyKgRXx6S/CtX7ExjPrIh2nkyJ8gg=;
	b=YRdu0cGvcVM83weqXFePgzxHETGO7OUmdiELGspNtRh94ryLEWRmEIu4q0+IonXa91UgM0
	gUXjga55Su53Cj/E1pplo4G9Txpj7yekORuljmuaBHJ5NA+H0yCfy/CzXg2Fqw3FaKmcgL
	Xhu6hDk/K1U0ZJyt9pJRKz7I9AMMbwk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-445-l3EqK1N4OJC1y_Kq9Nk0mg-1; Fri,
 22 Nov 2024 04:03:52 -0500
X-MC-Unique: l3EqK1N4OJC1y_Kq9Nk0mg-1
X-Mimecast-MFC-AGG-ID: l3EqK1N4OJC1y_Kq9Nk0mg
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3D65319560A3;
	Fri, 22 Nov 2024 09:03:50 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.14])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CDF081955E99;
	Fri, 22 Nov 2024 09:03:46 +0000 (UTC)
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
Subject: [PATCH v4 3/3] tests/functional: Remove sleep workarounds from Aspeed tests
Date: Fri, 22 Nov 2024 10:03:22 +0100
Message-ID: <20241122090322.1934697-4-clg@redhat.com>
In-Reply-To: <20241122090322.1934697-1-clg@redhat.com>
References: <20241122090322.1934697-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: fpb9NELVIkXn

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
index c2c152229b78..d88170ac2415 100755
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
