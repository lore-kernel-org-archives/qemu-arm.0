Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2220015njd;
        Tue, 22 Apr 2025 02:16:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdawXctRVBNkmrKhtIJCAg+HFxTdjl8rMwURUXUtr9aSPPc9ji5ejM3BeWOQsvywE+j8VScN/bVrCyLA==@linaro.org
X-Google-Smtp-Source: AGHT+IGPjHKevWs+36T0v0HWLeLcrqLVqPHZ+VI0aPaBnx7PnsqF4xzTV8NW0gqZRU1GT1IXLS3A
X-Received: by 2002:a05:6214:508b:b0:6e4:3455:eba3 with SMTP id 6a1803df08f44-6f2c4d8d61bmr224559316d6.6.1745313377050;
        Tue, 22 Apr 2025 02:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745313377; cv=none;
        d=google.com; s=arc-20240605;
        b=FEBqk5cIVN+20yP6UsOJ4XJ7amptkUTIlo0dZCP8s+FoPKlAz18JlBhoKpqoGDutVq
         TTfdOyBYkNTjkVNIUyt7XQDahysIeca5EcJdbmbWEMSfMBG6RKDwfeFU27NAqtegBfdV
         PKyvpbG70IbfGvaXOXHWiLClPa4kJ4GCpxS6zujkQ+vINUr+p2Sd1gF6ZhfMGkxs2Wz1
         2c2WYNBCVhMgCqkdu47nHeYJfvi3h/Gb3wvRHIZQi0Rm3t3w53e/s+IF423hbMoGxLDy
         +Ei6vbwJassCw6pCrVyQhd9M1unQ6rIEmOYKagFC/n2XwxzJmja51FMNnxMDuXtgKZ2B
         8pBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=YdAGH6Y7hB4xP4tDDyvOQsAzamPUBLt8HdQpJQZLB4c=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=Qq3TeA8SSlthzIM5cqebJlzXFsC+hJ5JUv33yW1sG7IRWnz3Cr1HNr38H+sxWD80kt
         ppLkXaGtZXsHnCHzL80F1Ck9BJAwO8XSpYpKHGAyCTW3V+ZkUQ5wEX7qK0ai9sf/Z3zf
         NeHgxo8GHLZhQyK/amL4vQqAF82XHtfqBQswg8usNusbTxkwqd3wB6rZWFx3qDIcU91d
         i53CRtIEIXZMFDDvbdHYqlUUv/kKLXSQZY53b3XwRhjtUr3Lmc0pp1nTt8I+c2NL8s0L
         hiXhrR47qxkpWQENM7qYPmowHgUy9W6f5JP02va8qxt7myg92amw1WbCiuKKT5pD6dPN
         5o8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f2c2c43329si102514936d6.511.2025.04.22.02.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 02:16:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u79j5-0006j5-61; Tue, 22 Apr 2025 05:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u79im-0006fV-PM; Tue, 22 Apr 2025 05:15:22 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u79ik-0006zm-Fo; Tue, 22 Apr 2025 05:15:16 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 22 Apr
 2025 17:15:05 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 22 Apr 2025 17:15:05 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 1/3] tests/functional/aspeed: Update test ASPEED SDK v09.06
 for AST2500
Date: Tue, 22 Apr 2025 17:15:01 +0800
Message-ID: <20250422091504.3666464-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422091504.3666464-1-jamin_lin@aspeedtech.com>
References: <20250422091504.3666464-1-jamin_lin@aspeedtech.com>
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
X-TUID: +KaRbhd1D/F/

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/functional/test_arm_aspeed_ast2500.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_arm_aspeed_ast2500.py b/tests/functional/test_arm_aspeed_ast2500.py
index 1ffba6c995..90f3940e2a 100755
--- a/tests/functional/test_arm_aspeed_ast2500.py
+++ b/tests/functional/test_arm_aspeed_ast2500.py
@@ -38,14 +38,14 @@ def test_arm_ast2500_evb_buildroot(self):
 
         self.do_test_arm_aspeed_buildroot_poweroff()
 
-    ASSET_SDK_V806_AST2500 = Asset(
-        'https://github.com/AspeedTech-BMC/openbmc/releases/download/v08.06/ast2500-default-obmc.tar.gz',
-        'e1755f3cadff69190438c688d52dd0f0d399b70a1e14b1d3d5540fc4851d38ca')
+    ASSET_SDK_V906_AST2500 = Asset(
+        'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.06/ast2500-default-obmc.tar.gz',
+        '542db84645b4efd8aed50385d7f4dd1caff379a987032311cfa7b563a3addb2a')
 
     def test_arm_ast2500_evb_sdk(self):
         self.set_machine('ast2500-evb')
 
-        self.archive_extract(self.ASSET_SDK_V806_AST2500)
+        self.archive_extract(self.ASSET_SDK_V906_AST2500)
 
         self.do_test_arm_aspeed_sdk_start(
             self.scratch_file("ast2500-default", "image-bmc"))
-- 
2.43.0

