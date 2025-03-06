Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1387785njm;
        Thu, 6 Mar 2025 02:42:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVjCcrgVVb/UmHT/I67+udxxWGwLROSX6Rdanf3hhNHalslJoGm0SUgoQf5H5G+lz4dzcalanf3wZna3A==@linaro.org
X-Google-Smtp-Source: AGHT+IHkkz9VVNyrm2VrVDNELo9TUc3lkWxSnxuYmD1yhGoslEIW7UI8zjbRhWR0lsSMwClXaG2A
X-Received: by 2002:ac8:5f46:0:b0:472:1399:2da7 with SMTP id d75a77b69052e-4750b448137mr88985581cf.17.1741257769332;
        Thu, 06 Mar 2025 02:42:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741257769; cv=none;
        d=google.com; s=arc-20240605;
        b=L/f+2BN94cM6RnwTOdeZb5bm+Js19oBxUOThWTU5Q0dijzzy4TDgTtBp0jZusQYdmz
         DJy7RGQxQQLJTZ2Kqdacp1L5OVIlNNXnIh/uCqmVq1ZZ7O4LUFewDqGwondUdgILEMXn
         eq3Vl/PmlzDLd8WOiHYOWIeEzXb4e3wnp+ZvvdFEmG0inwe2JgjSng/mAqKw+l1Lkj5m
         4AHo4koAzEh0xnZ6NB33s84rbhXGTYAyZ36OZAaxWeZBrkP67x30aJe0bvVOmNZ8LCtP
         KZo+39y77y9H5U8Gm6VhkiJ8QILi6UzF4Z4ox6R6/ad4/Txd6krBtFWjWdOFQdfjmh+7
         Bpog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=v4mu4vjkvuyvrhQ/exD+88VPmjBYSU9Pfx+gxxAQ6lk=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=SuaAJCQQe3G4Fxb+RIMF4ltXGh/cJh5CzyvWlVyxZajlYRKW8gtYZcxWOT3vmmVSpC
         uLJ4yKM4xE8lwhtMOhN96seA25UMHwQAGqJn0fH00SdRa3COlo3MQ1K5VBkpe4IY+1iM
         kMuO7fB+r8XO+EUIabIytH+tM0C6gBZ6GPRom3/GQcPXZDlVm8PIzJ+z/uBcfdVin9LS
         TNnfon8AfphV01QOhZoEYmz8ZR0Cc/rRaOSFAmdMhG24YNidx6fUDAdDWt4SI9n+b1Nm
         GaZi3MgZCyO0x/GHE+/wHsvyvNuRMlAcy1Rl4wwhvRci2XrAvHJ6PGmU24SIifX47l9A
         xM4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db23de0si9251671cf.465.2025.03.06.02.42.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 02:42:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tq8fY-000149-Ax; Thu, 06 Mar 2025 05:41:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8fK-0000OT-7J; Thu, 06 Mar 2025 05:41:23 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8fF-0000om-77; Thu, 06 Mar 2025 05:41:21 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Mar
 2025 18:38:56 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Mar 2025 18:38:56 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v5 26/29] tests/functional/aspeed: Update temperature hwmon
 path
Date: Thu, 6 Mar 2025 18:38:34 +0800
Message-ID: <20250306103846.429221-27-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
References: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YneVDvgkOJ03

Modified the temperature hwmon path to use a wildcard to handle different SDK
versions: "cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input".

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/functional/test_aarch64_aspeed.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index e1ad7fd470..07b0c7c1fd 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -83,11 +83,11 @@ def start_ast2700_test(self, name):
             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-1/device/new_device ',
             'i2c i2c-1: new_device: Instantiated device lm75 at 0x4d');
         exec_command_and_wait_for_pattern(self,
-            'cat /sys/class/hwmon/hwmon20/temp1_input', '0')
+            'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', '0')
         self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
                     property='temperature', value=18000)
         exec_command_and_wait_for_pattern(self,
-            'cat /sys/class/hwmon/hwmon20/temp1_input', '18000')
+            'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', '18000')
 
     def test_aarch64_ast2700_evb_sdk_v09_03(self):
         self.set_machine('ast2700-evb')
-- 
2.43.0

