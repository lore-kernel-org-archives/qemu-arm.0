Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7310969njc;
        Tue, 12 Nov 2024 05:03:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX+kYeMEe8gIAng/NU8/8tE8W8F+/GpgN3rV5KiNcKpCSeGUiefXrxLTTwD0tYQfHF3RwgmLjsx8IHT8g==@linaro.org
X-Google-Smtp-Source: AGHT+IHi9cg9OOM3/hCetHRO/wN/9oj0BaM4KJsp5o68dLV+I3PPfpdx/H5G4bl3QaawfY9Q0w8x
X-Received: by 2002:a05:6000:1845:b0:374:c4e2:3ca7 with SMTP id ffacd0b85a97d-381f1865142mr13386241f8f.5.1731416629817;
        Tue, 12 Nov 2024 05:03:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731416629; cv=none;
        d=google.com; s=arc-20240605;
        b=QO1jz7otk3h/uV3gR8wt0Dh8MrxFGG25HVokP1x0ZVvDGlyqXtBZ2VFHoeW0bLTK3U
         cgCtTpFgl2fDgwT2ow+NHpiRSIS7H7I4t17Vl7AGB3QmcxpPyVwjHgiQPAWhuqWzFdWq
         /hOhXhxAnprV2gfdzPT9Anb+07jHQ5NdwsONqIyB+rrEF+aa6mbEEjkK6jVfVy41syPc
         9Zj+ydqH3PVXBcGAZ+jmvgTKDC6RAJyGGU0mjHQLNmYCd7BeuJcYAG55OpOjpSHpSL+m
         vfHw79tw007GDWh9eEToHGvqXtkg7B1KaPv6DRBWkFVjQSqvrZxnpifXK9rZ9CXaR2io
         ntZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CdNytmE3XCTAx20+S9L0FY8+04SNGcsl/WVxV7Mts1M=;
        fh=36XeOeSnsB5LbZUpSpyTPSVUP6DQSW+xMm0rZH0YiK4=;
        b=ICiCAdvz1xpseJ1t0WbWPmRTTZ3ra6C8pAZIbcrQcbmOPN2PCmQevYyaRYAEChuscR
         sCzML5rrCL6BN5Kh/0N1tpZgA860NkiaD9uVq3G75lLFQD8eI6v0znG/CYkI5hhmIo9i
         GBITgBa5X8TOaLdm78spGBDAnmcb1iMMVZT78rgdQS/1rkYs62zJH6dewXSkiV/QES6N
         R4Sz9mjxzDaYifvG8KNGyUK32DBTfmwamabR3imG4px4KDb5iAKK/grPh7hzBDY71BSV
         egwAms5ef2hFXX84ek3WO6qjamtHUtfcKSKbAvICxQI3QCjGeXhHaAdvd4i4zwNrDJuG
         e5Og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h8QEWVGz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-381eda30402si8507929f8f.974.2024.11.12.05.03.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 05:03:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h8QEWVGz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAqYY-0005i2-VP; Tue, 12 Nov 2024 08:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tAqYD-0005ds-Rr
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 08:03:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tAqYA-0003is-GF
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 08:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731416597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CdNytmE3XCTAx20+S9L0FY8+04SNGcsl/WVxV7Mts1M=;
 b=h8QEWVGzyUV7Eh7SvlLATau/XzJBznot/BD4eOnGlkJRKZKxRdEmW0fEhBD1NIxduPz2Yz
 70aPqYlCK1nwm3Nh+ZnHlYpRDQybREveVo0W5C2JaJSS61q7jSZqUvZcCSHKaRcyNqND58
 XVYvCXeuifodf6nQOZECStZuqCA4tdY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-249-Iqb4bFOrMYegiL1olF61_g-1; Tue,
 12 Nov 2024 08:03:14 -0500
X-MC-Unique: Iqb4bFOrMYegiL1olF61_g-1
X-Mimecast-MFC-AGG-ID: Iqb4bFOrMYegiL1olF61_g
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 68DA01955BC9; Tue, 12 Nov 2024 13:03:12 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.193.48])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F3CD51956054; Tue, 12 Nov 2024 13:03:08 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2 4/4] tests/functional: Remove sleep workarounds from Aspeed
 tests
Date: Tue, 12 Nov 2024 14:02:46 +0100
Message-ID: <20241112130246.970281-5-clg@redhat.com>
In-Reply-To: <20241112130246.970281-1-clg@redhat.com>
References: <20241112130246.970281-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.671,
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
X-TUID: Q288+0OZrv9M

These were introduced in the avocado tests to workaround read issues
when interacting with console. They are no longer necessary and we can
use the expected  "login:" string now.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/test_arm_aspeed.py | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/tests/functional/test_arm_aspeed.py b/tests/functional/test_arm_aspeed.py
index 7644ecbae750..2c9009f686fd 100755
--- a/tests/functional/test_arm_aspeed.py
+++ b/tests/functional/test_arm_aspeed.py
@@ -136,10 +136,8 @@ def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'
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
@@ -158,7 +156,7 @@ def test_arm_ast2500_evb_buildroot(self):
         self.vm.add_args('-device',
                          'tmp105,bus=aspeed.i2c.bus.3,address=0x4d,id=tmp-test');
         self.do_test_arm_aspeed_buildroot_start(image_path, '0x0',
-                                                'Aspeed AST2500 EVB')
+                                                'ast2500-evb login:')
 
         exec_command_and_wait_for_pattern(self,
              'echo lm75 0x4d > /sys/class/i2c-dev/i2c-3/device/new_device',
@@ -188,7 +186,8 @@ def test_arm_ast2600_evb_buildroot(self):
                          'ds1338,bus=aspeed.i2c.bus.3,address=0x32');
         self.vm.add_args('-device',
                          'i2c-echo,bus=aspeed.i2c.bus.3,address=0x42');
-        self.do_test_arm_aspeed_buildroot_start(image_path, '0xf00', 'Aspeed AST2600 EVB')
+        self.do_test_arm_aspeed_buildroot_start(image_path, '0xf00',
+                                                'ast2600-evb login:')
 
         exec_command_and_wait_for_pattern(self,
              'echo lm75 0x4d > /sys/class/i2c-dev/i2c-3/device/new_device',
@@ -210,7 +209,6 @@ def test_arm_ast2600_evb_buildroot(self):
              'echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_device',
              'i2c i2c-3: new_device: Instantiated device slave-24c02 at 0x64');
         exec_command(self, 'i2cset -y 3 0x42 0x64 0x00 0xaa i');
-        time.sleep(0.1)
         exec_command_and_wait_for_pattern(self,
              'hexdump /sys/bus/i2c/devices/3-1064/slave-eeprom',
              '0000000 ffaa ffff ffff ffff ffff ffff ffff ffff');
-- 
2.47.0

