Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp452986njb;
        Thu, 4 Jul 2024 01:31:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWiBkFD72B/ZyrwA5YlweNYFl+RzeND3irIALf5pVp/MDA0a2xnINAjWTCPQ2FOfTwhS4aY/at2WYtLxbH71HPcL+iozQnL
X-Google-Smtp-Source: AGHT+IFZHiCDpZSPfM+whCMWYMA88N6Co9k6oNHAA/HJsF7cmr0DL3euPFl2gt2i6DiQZkDsXZYN
X-Received: by 2002:a05:6214:ca1:b0:6b0:9479:cdc9 with SMTP id 6a1803df08f44-6b5ed03d663mr10223236d6.49.1720081889021;
        Thu, 04 Jul 2024 01:31:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720081889; cv=none;
        d=google.com; s=arc-20160816;
        b=M3AGmYaV5mQ/NUYLgpInzwksY7ZPdM9ErhiqxSWuRqN3C/gCyVnz/Ut1A0qfVTRFUM
         frUR9nyIclslnD8y/PIrUCNNMsT0ZlF3H09zOPGlf01U8VafWrhSamcDNCOcHAUScmlH
         P62BL4j6ZvCsXu78VWNFsqYq3rhNjWs5lPXRguN+DXpYkMvNtHeGZWmhSPz25Q0wi+Ul
         b6N+6mob2SpByHf5S2koImK9D/k72Y9RqDoeUx4XcVVRrVqPdsD7xK5IHLg/rYvufyT3
         bFPQZ530EGa2+/ORvVyu/qS5kOTLKUoC+X7gRBhLwRWzdb7A6XpJUrh248+ctnlyKqRG
         seWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=2eq2yjSHksG5vDNVtxDkQFQZuA9Tl4G7r0KKo7YCfb8=;
        fh=Vva0SnTfFpZ62XWQNW5X4TL2jFj5cBikmg9Gp1PrOrY=;
        b=sCF0xXS85FWKrVbYhYxPPeH7AbzY2rwQDwqwxHmlZ3tDhqjZt2tuefbspv+cTTKPcg
         z1tIHRlg+/Kxzim00gQuEUnVoVrrX4bXv1ps/ri4neX5OdtOPcHFqls5lnKEw3+EyBkq
         cM4mvtd/6pFhQCYRbt/ZKQlm6EO2sb9T7tCi8em3BslUV9wYcBPC+J9BLEQ8jc3DQqLz
         aVffihW+jeiBWq9JyOmycqM5CCaAovG6Z0t9MvlFjkFoOOs8BQa3/eMh35MBSg7fPR8Z
         KTXYpTaZ4meS5TCWmC4zmdOq9wg8tlefzwW47TvF2cI1H5M/M/SUklThEAfzDeKEZnOp
         D7bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b5e3ac7345si27564286d6.24.2024.07.04.01.31.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 01:31:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sPHs6-0001hN-18; Thu, 04 Jul 2024 04:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sPHrL-00017W-5c; Thu, 04 Jul 2024 04:30:38 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sPHr0-0002HT-UC; Thu, 04 Jul 2024 04:30:30 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 4 Jul
 2024 16:29:24 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 4 Jul 2024 16:29:24 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>, "open list:Block layer core"
 <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 8/8] machine_aspeed.py: update to test network for AST2700
Date: Thu, 4 Jul 2024 16:29:22 +0800
Message-ID: <20240704082922.1464317-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240704082922.1464317-1-jamin_lin@aspeedtech.com>
References: <20240704082922.1464317-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ua4u6q0YIiQA

Update test case to test network connection via SSH.

Test command:
```
cd build
pyvenv/bin/avocado run ../qemu/tests/avocado/machine_aspeed.py:AST2x00MachineSDK.test_aarch64_ast2700_evb_sdk_v09_02
```

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/avocado/machine_aspeed.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 13fe128fc9..f66ad38d35 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -313,14 +313,14 @@ def do_test_arm_aspeed_sdk_start(self, image):
 
     def do_test_aarch64_aspeed_sdk_start(self, image):
         self.vm.set_console()
-        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw')
+        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
+                         '-net', 'nic', '-net', 'user,hostfwd=:127.0.0.1:0-:22')
 
         self.vm.launch()
 
         self.wait_for_console_pattern('U-Boot 2023.10')
         self.wait_for_console_pattern('## Loading kernel from FIT Image')
         self.wait_for_console_pattern('Starting kernel ...')
-        self.wait_for_console_pattern("systemd[1]: Hostname set to")
 
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
 
@@ -436,4 +436,6 @@ def test_aarch64_ast2700_evb_sdk_v09_02(self):
 
         self.vm.add_args('-smp', str(num_cpu))
         self.do_test_aarch64_aspeed_sdk_start(image_dir + 'image-bmc')
+        self.wait_for_console_pattern('nodistro.0 ast2700-default ttyS12')
+        self.ssh_connect('root', '0penBmc', False)
 
-- 
2.34.1

