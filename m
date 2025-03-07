Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1939614njm;
        Thu, 6 Mar 2025 20:05:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUC8NWm8d9rtEGiRgNyT/ah9k2LqnaLPjgy7R9+JeV36gqY5apF5w8M7ZyjLajYlQYVNwf3I9/N7jF+8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFOA6/PxUHzFYq4oHZELeGlVgUJU6/jR9uMn5FZSqN6y7Gxt6gDuqpPhSV++4R1ggWLKZ4m
X-Received: by 2002:a05:620a:63c4:b0:7c0:a8a5:81b6 with SMTP id af79cd13be357-7c4e61b7094mr250753585a.39.1741320323010;
        Thu, 06 Mar 2025 20:05:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741320322; cv=none;
        d=google.com; s=arc-20240605;
        b=Dx3BQczwgOtNePtr3c/MUvGRFVEAV2ToK8z8SZlyYSQNVjwMCOdXuguvLnMieOAG/u
         m5fY/yN66N60sFTIez9tZ2frfl+Rd581O+8wwazFv4Ag3UEuo3DXS3NKBKkiN0QXttkJ
         lWM3yViufaYKG/6PwX1BFiT2m4i3mVct3uAdLooidiW/l5X5iXD3GIQaefcrg7AXtO2T
         ufWqgOki3EkUr8Om0ffilBAapKP7WcjKm1kGykO1oGWBfw0qYAf581otKOC0gpP+b2EZ
         ydkQgZZJd7nQC0Mp2swr3v3KiCZrnL/uQUsXKznBwVcHPbztxcQtAffpRMOmtae+cvYR
         ju7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=gfXJGQ403jYYSpAuAfyb1HoL254GgKQIpNdPyQjzLJ4=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=il8gcX6bmJjkiLIM0mhbsx1vsKh0NSO4Bi+eyZ66u7Kb+o8q8L4KanwqD5xdKA5nrS
         Wa0g+hEvKYXQl4CERJgQENt3O/zVHJ1k1fL2slFy6bYsdVv1XBwyvNP+moUYElFPEdjy
         1adbjdnXCXccuV14sybC8zknhSiVoUbSF6IYLuVLtj6uP5kI8UmKSXVMXsPNOnJr/qGu
         Y6NXmpg9nHrs48BC9kvdlzI+GUdGE7NBWvlfKPS6VbBXwSMtni7qIcIl9ziP++9zuxhX
         8TBDnS6a9FbKoFwhI/amTt8EhoVfWtyFMTav/rae3zzJbDeRPoOyuefHSMGiKfPS0ueJ
         FmPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e54ff35fsi277193585a.318.2025.03.06.20.05.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 20:05:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqOuz-0004KN-Mh; Thu, 06 Mar 2025 23:02:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOuQ-0002y9-DS; Thu, 06 Mar 2025 23:02:03 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOuO-00056A-OQ; Thu, 06 Mar 2025 23:02:02 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 7 Mar
 2025 11:59:55 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 7 Mar 2025 11:59:55 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v6 26/29] tests/functional/aspeed: Update temperature hwmon
 path
Date: Fri, 7 Mar 2025 11:59:35 +0800
Message-ID: <20250307035945.3698802-27-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
References: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: J9kmoATn6ZY0

Modified the temperature hwmon path to use a wildcard to handle different SDK
versions: "cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input".

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
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

