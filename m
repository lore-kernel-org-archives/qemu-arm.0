Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp345421njc;
        Wed, 12 Feb 2025 19:40:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWL3PYn4sBcDOr4p65m2nnjrxz9wLUi+noU7CgLe055LYFnPoZIg2BY1wO/9CwKu1d8eNW89bOMpXITEA==@linaro.org
X-Google-Smtp-Source: AGHT+IHheaLEn6ooCZh7yaFcctsyZEUFz6FiLTEt/jVjbM1GcLrs2fr1V1+rTzMrUr4xVODmK7PP
X-Received: by 2002:a05:6214:482:b0:6d8:9002:bdd4 with SMTP id 6a1803df08f44-6e46edad931mr113166846d6.28.1739418028289;
        Wed, 12 Feb 2025 19:40:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739418028; cv=none;
        d=google.com; s=arc-20240605;
        b=EI5HHjPYcuUy0hucUlSTkWL6X55oTBlW5r8fktWIJG0R0Q8dQ+I4A8L1VgdK6ywQJu
         R3JeiMWeFQl/8F/0kD2qirBAJ2fOeVwCYP+WNUBqGaC1rETOTcERJmfdpSbM54P8IrU9
         F/KRh2Lncg17F/L86LI2gIOASHod2NZCReF6pvg98zeXo5LaeOldhwhgWnyKGmd9D3Ps
         wBb2Sqtjlc9Lyp45MBEva9f+/evfTdyC/Lr37bhPqTuoj/rejOLAb6qTxBGgiEWFG7Lv
         3AnDLiPgaT82MskFhhqsuyoJLAmLX/u0OyfowyCTkOoGiJdjsay6+KRZmzNf+P2n/KTd
         A31A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=OLtTH8q+MYsBOoi5df2tdT8mO6QXdhZUpJUEk1yHBIM=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=NuafiVfHaHF6qxe0z+EZ0/iv/n62NMSbp3XL13J+Sh8aYTj1GZp+LOZlWqoFyTUyFM
         TGF+KDz52YnhcgObnt+6LmKLxS+6lMp9vubglafnwMcJ3gHw24Ienq+0ide2mVtTNyXi
         P1Pbk3PeX1P6XQ58g56ic1Q4vN8uwdFPvEf1oQGmU1X610nUNmdK0AM4xsEHu/DZhUg8
         d4MjouE82Yh9I+w1jolvhtmoGplToToqB8dqnXi5CCY6qAbZQPehPM1x/rivNy98VEKW
         pQhNXOdZcpIzOUD0yYIquL8TIqfMPYjgFXqTluRAe4LIIqiA6+JCN7PZpgnp+Wv5FcFX
         kd7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9a215dsi5705696d6.195.2025.02.12.19.40.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 19:40:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tiQ2w-0002mu-Ht; Wed, 12 Feb 2025 22:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ2s-0002Z2-7z; Wed, 12 Feb 2025 22:37:46 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ2q-0000pw-O2; Wed, 12 Feb 2025 22:37:45 -0500
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
Subject: [PATCH v3 25/28] tests/functional/aspeed: Update test ASPEED SDK
 v09.05
Date: Thu, 13 Feb 2025 11:35:28 +0800
Message-ID: <20250213033531.3367697-26-jamin_lin@aspeedtech.com>
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RM/VZ+vLelIS

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/functional/test_aarch64_aspeed.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index aa817afa4e..788dd29a6d 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -89,11 +89,11 @@ def start_ast2700_test(self, name):
         exec_command_and_wait_for_pattern(self,
             'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', '18000')
 
-    def test_aarch64_ast2700_evb_sdk_v09_03(self):
+    def test_aarch64_ast2700_evb_sdk_v09_05(self):
         self.set_machine('ast2700-evb')
 
-        self.extra_aspeed_archive('v09.03', 'ast2700-default-obmc.tar.gz',
-            '91225f50d255e2905ba8d8e0c80b71b9d157c3609770c7a740cd786370d85a77')
+        self.extra_aspeed_archive('v09.05', 'ast2700-default-obmc.tar.gz',
+            'cfbbd1cce72f2a3b73b9080c41eecdadebb7077fba4f7806d72ac99f3e84b74a')
         self.start_ast2700_test('ast2700-default')
 
 
-- 
2.34.1

