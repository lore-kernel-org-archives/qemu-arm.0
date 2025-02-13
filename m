Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp345588njc;
        Wed, 12 Feb 2025 19:41:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUTZvCXT5eKQN0vd8nV/kJcFWzhYKWpPdcGJf6plkv+MpSkhxoktqeAZL5X9tRsu+DsnY3ldNY+IlB77w==@linaro.org
X-Google-Smtp-Source: AGHT+IHTIjuRlfC6PLjkJv3gMGWG7OuXoOILScS+XGuDmcTIVx32UCD4wdVmHev0BBH8p9B/LRHR
X-Received: by 2002:a05:6214:c4:b0:6e6:5d61:4f01 with SMTP id 6a1803df08f44-6e65d614fccmr15154706d6.8.1739418066016;
        Wed, 12 Feb 2025 19:41:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739418066; cv=none;
        d=google.com; s=arc-20240605;
        b=Rz2gDPfOmccg5NTJoop/zJfPgGAwkciKiN/nsNsXjVSCVKO4Im0bPEMesh5WC8Pv1I
         qqYJ7Euz0D3RzeZjz3DDGzUSUc3F5zcfN9WQZD1JKXjcFLwbOqBCWA3trEEjByj8zmiM
         lZiuUTjaHgWWk9R4alOuJlB9eR09zW3W+FKFB6lGvfOvayR9H6RJRwZjRIwvWX2fZ9fF
         cOfPxVy8XMDYR9lJRdQb2kdxWJkDGw9RlHuo43NKYbGxvQXoenVesE3KUFflT/jjsSnU
         A0NzM3k52KIPMkN7DHsSVBe6hTWtTt7Nx762xvW5VD67CyQDOdyUPjvMqEodEDynF4nq
         da0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=b/StkJifPwpUku1pqeQARw90SClcHk4gn7AogZRqQjI=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=K2NT4J43/0jEpdNvQC75s/XjaBbrEmWbOfZRX7a8/hROZsOqR5awmmREZ9L9Ca0WW4
         tllx9MGY3TI12HD5GbnO3+fI5EQNxuxHuhnsdPJkAyAxCS96AoYi60BihiLaHcbAy9/9
         L5jalKjXrSe4IB9xEuQRzLXJzdStUIRPlfiUnJJCljWoJtPIxwS9q+UqNSNtEGMRTaeW
         ptVs3Eo4j3vn6LwKTNag/U6Mzog+mjsVbojCG69B5D736vVsUVfauQgGaJ1Rn4GsGU3z
         ynO7P2pU8yBM6vLAZyA/OKYa4eOtVw7KUpFcKJMLqEFKBv1S6pkxekLkYH6HBq1YK69X
         s96A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d734491si6105766d6.38.2025.02.12.19.41.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 19:41:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiQ2z-0002yZ-Fq; Wed, 12 Feb 2025 22:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ2u-0002kQ-Ky; Wed, 12 Feb 2025 22:37:49 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ2t-0000pw-AO; Wed, 12 Feb 2025 22:37:48 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Feb
 2025 11:35:41 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Feb 2025 11:35:41 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 26/28] tests/functional/aspeed: Renamed test case and
 machine for AST2700 A0
Date: Thu, 13 Feb 2025 11:35:29 +0800
Message-ID: <20250213033531.3367697-27-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
References: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: Gy7fZ+f5GYib

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/functional/test_aarch64_aspeed.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index 788dd29a6d..ad2774be15 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -89,12 +89,12 @@ def start_ast2700_test(self, name):
         exec_command_and_wait_for_pattern(self,
             'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', '18000')
 
-    def test_aarch64_ast2700_evb_sdk_v09_05(self):
-        self.set_machine('ast2700-evb')
+    def test_aarch64_ast2700a0_evb_sdk_v09_05(self):
+        self.set_machine('ast2700a0-evb')
 
-        self.extra_aspeed_archive('v09.05', 'ast2700-default-obmc.tar.gz',
+        self.extra_aspeed_archive('v09.05', 'ast2700-a0-default-obmc.tar.gz',
             'cfbbd1cce72f2a3b73b9080c41eecdadebb7077fba4f7806d72ac99f3e84b74a')
-        self.start_ast2700_test('ast2700-default')
+        self.start_ast2700_test('ast2700-a0-default')
 
 
 if __name__ == '__main__':
-- 
2.34.1

