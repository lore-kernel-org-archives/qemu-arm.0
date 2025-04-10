Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8125666njd;
        Wed, 9 Apr 2025 19:41:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdn7kS9px/svHFrmJIMGv9xw7iK5uXecv1XCEsxU8FKrnI+e4lVJFKNIubjvGjHsV4bQFr78BHtop8Tg==@linaro.org
X-Google-Smtp-Source: AGHT+IGNTtkfF7ESzOY7FZvttRKMSdKIRUlSqr4JHgm+McE/vWwNSIUa803WV1V+OkhewwhI/uYM
X-Received: by 2002:a05:6214:d4b:b0:6e6:698f:cb00 with SMTP id 6a1803df08f44-6f0e77db855mr8847286d6.42.1744252898656;
        Wed, 09 Apr 2025 19:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744252898; cv=none;
        d=google.com; s=arc-20240605;
        b=ifNZxGD9dShqAIfuOXYpwc+7f0VGAeuOsWMCb7MNamkvDwE2mCplZUKeVMhSL8BzBD
         HonnCKYmH6Ep/2XB88NlNtXzKAzZ4UKxJ6/IHYvrp4JYxkPeqaoAP31rXBczWrGIX556
         CfuUi3aRF8WwUFmSrdxL6AXE2YKpFrfs6BIikhTX7AgFrKgoQP4keInm/+tz1GKWmjKK
         WHpW5ktl3f/PTWq/zi6d70H8WGrNzy42BLnkhNBPUcLtN+q9GWzmOh/nf3SMX3Ip+0Cq
         zJrNvJkQliP9ElwKLn88IAJ0zMcW+Rvn9dEiPcTEgEj5KjNhjL1yQT68qsRVsNWMC23B
         BK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=3lHmOyRLMjfeCZ/wWGkjq/KCvdkcG/cXBZO0n4M3k5U=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=cwbY/iT9rYL5JUiI9Zr5wLmclf4BCJscZ8a7HBBhp3VOA6p24rM7p0geyj8qlrVCy8
         nRJr1T6Rviva10lrdxLiJMXhebB723aKMCdzx4ryfl2YnOTPH+p9ls1Td0atMNPadSUC
         FjX7H+MJbZ8aNcybG8ZdxvRLuDrPBc7LIBzUQ0J4jqxEu5f4f0M1pmz1Ti1uKoK0nT9h
         HqrbNWkYnu/zTOg5EHdhvCFYOAsxJ8JEPDdKjD5LR9t38i6Wb7rqJVYcsO82qEIXA89b
         2xKbTyND4NjakYKsUFCWJcUuUMP1iRsnSbDxMMSOMQSIJuxb3Ar2d/c9DlU8BNLehIy0
         PN0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0de9dd052si22183486d6.213.2025.04.09.19.41.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Apr 2025 19:41:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u2hpP-0001oF-8V; Wed, 09 Apr 2025 22:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2hpK-0001id-OW; Wed, 09 Apr 2025 22:39:39 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2hpI-00033O-Mv; Wed, 09 Apr 2025 22:39:37 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 10 Apr
 2025 10:38:59 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 10 Apr 2025 10:38:59 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v2 09/10] tests/functional/aspeed: Update AST2700 functional
 test to use vbootrom
Date: Thu, 10 Apr 2025 10:38:53 +0800
Message-ID: <20250410023856.500258-10-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410023856.500258-1-jamin_lin@aspeedtech.com>
References: <20250410023856.500258-1-jamin_lin@aspeedtech.com>
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
X-TUID: R10NyWs2zXJv

Refactor the AST2700 functional test to boot using the vbootrom image
instead of manually loading boot components with -device loader.
The boot ROM binary is now passed via the
-bios option, using the image located in pc-bios/ast27x0_bootrom.bin.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/functional/test_aarch64_aspeed.py | 38 +------------------------
 1 file changed, 1 insertion(+), 37 deletions(-)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index c25c966278..971f548534 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -36,43 +36,7 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
             'c1f4496aec06743c812a6e9a1a18d032f34d62f3ddb6956e924fef62aa2046a5')
 
     def start_ast2700_test(self, name):
-        num_cpu = 4
-        uboot_size = os.path.getsize(self.scratch_file(name,
-                                                       'u-boot-nodtb.bin'))
-        uboot_dtb_load_addr = hex(0x400000000 + uboot_size)
-
-        load_images_list = [
-            {
-                'addr': '0x400000000',
-                'file': self.scratch_file(name,
-                                          'u-boot-nodtb.bin')
-            },
-            {
-                'addr': str(uboot_dtb_load_addr),
-                'file': self.scratch_file(name, 'u-boot.dtb')
-            },
-            {
-                'addr': '0x430000000',
-                'file': self.scratch_file(name, 'bl31.bin')
-            },
-            {
-                'addr': '0x430080000',
-                'file': self.scratch_file(name, 'optee',
-                                          'tee-raw.bin')
-            }
-        ]
-
-        for load_image in load_images_list:
-            addr = load_image['addr']
-            file = load_image['file']
-            self.vm.add_args('-device',
-                             f'loader,force-raw=on,addr={addr},file={file}')
-
-        for i in range(num_cpu):
-            self.vm.add_args('-device',
-                             f'loader,addr=0x430000000,cpu-num={i}')
-
-        self.vm.add_args('-smp', str(num_cpu))
+        self.vm.add_args('-bios', 'ast27x0_bootrom.bin')
         self.vm.add_args('-device',
                          'tmp105,bus=aspeed.i2c.bus.1,address=0x4d,id=tmp-test')
         self.do_test_aarch64_aspeed_sdk_start(
-- 
2.43.0

