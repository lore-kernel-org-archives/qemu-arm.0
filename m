Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1355545njf;
        Tue, 3 Sep 2024 01:36:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaDGqWZrS1ikLiHkvwlxcbxGfgvizM1BA9NPahupVOqQzzsMooH/M4xuIVY9akx/3z4v1fgj4yngLwVw==@linaro.org
X-Google-Smtp-Source: AGHT+IGm7wwSB8M4H4TFI7OvbKLdgfBfOj2+ktXysQ4rxfH+4lsKKzDLRx4fTJ1Fr99zwXHJcHSd
X-Received: by 2002:a05:620a:1999:b0:7a2:32e:3c47 with SMTP id af79cd13be357-7a81d69d736mr1427793185a.34.1725352616144;
        Tue, 03 Sep 2024 01:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725352616; cv=none;
        d=google.com; s=arc-20160816;
        b=oYzKjR74VAyjfbilSda3TOXcyJ41nfTIyFJYCnGBTPXzKYaCB7kOxVTn1C66OQCeJJ
         7lLN2ay/yiGeLMg3SagYA7eLc5IIAS8cQLkyaXY0CmjdCRQiA1wMjULEiICCJR0/x7a7
         bwYZwVEAnsIF8vxXTQChXqWW52NLVzXhsyxkJiArMegiVuv54QTDQPsgEqCUb6+HZqEy
         Dm8IhvMxVpx816vJRvW6xTYxCrGYUtTIqZrxGVNEScLw5lG5fqBhu+0o5Fw6abCiBUDN
         0J6dHNWajQsHEQBH0TSCNzU3dBJFbCSkAjFlQWVE85ReFleAXZfVZNjhpuGlAm5zjuhB
         MHlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=h66VtST85Nslg/20nggQCt96gYEvk5JIW+A9DEgUp5k=;
        fh=sVs3p8gbptRv32z9lLYpJL2ORX7RrMh6U4eLBNuVM2U=;
        b=dfaR+zb9nuARWu91wGClPg3On+KA49kxlCO6yIXYcsRdmgV5cfhxBRSgQbAhBFHO/Z
         fZga9AS5GyYsj2qnJxmXbSX5sZkUIbi7fob4KrDvzKOBtc8UUttWq4f7jcw7AU31UMjG
         LFypLa9U3O5kNjzvDF3z5FoB6wFVbXRLE7JkBKABvqYTmEWqvWiudH/r0+UnWJpCm/5p
         na50SNFSpX+imUWxcic0FvZSOTGmbzT36HW+0dp7xio/QcTGE6eJmHAb1KbM6pdSO8cO
         ul0uqgbxa/0UYW6OOuAO0K5+VKrsOm0m88D38+dBrMkUIPrSDnI0uKB5Js4CMkRedVIJ
         2Amw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806c173dbsi956544685a.112.2024.09.03.01.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 01:36:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1slP1U-0005lk-Sf; Tue, 03 Sep 2024 04:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1slP1E-0004mX-Ct; Tue, 03 Sep 2024 04:36:08 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1slP1D-0008A7-01; Tue, 03 Sep 2024 04:36:08 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 3 Sep
 2024 16:35:31 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 3 Sep 2024 16:35:31 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v3 11/11] machine_aspeed.py: Update to test I2C for AST2700
Date: Tue, 3 Sep 2024 16:35:28 +0800
Message-ID: <20240903083528.2182190-12-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240903083528.2182190-1-jamin_lin@aspeedtech.com>
References: <20240903083528.2182190-1-jamin_lin@aspeedtech.com>
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
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: HkHAq4t0g+G8

Update test case to test lm75 temperature sensor.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/avocado/machine_aspeed.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index c0b01e8f1f..4e144bde91 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -433,9 +433,25 @@ def test_aarch64_ast2700_evb_sdk_v09_02(self):
                              f'loader,addr=0x430000000,cpu-num={i}')
 
         self.vm.add_args('-smp', str(num_cpu))
+        self.vm.add_args('-device',
+                         'tmp105,bus=aspeed.i2c.bus.1,address=0x4d,id=tmp-test')
         self.do_test_aarch64_aspeed_sdk_start(image_dir + 'image-bmc')
         self.wait_for_console_pattern('nodistro.0 ast2700-default ttyS12')
+
         self.ssh_connect('root', '0penBmc', False)
+        self.ssh_command('dmesg -c > /dev/null')
+
+        self.ssh_command_output_contains(
+            'echo lm75 0x4d > /sys/class/i2c-dev/i2c-1/device/new_device '
+            '&& dmesg -c',
+            'i2c i2c-1: new_device: Instantiated device lm75 at 0x4d');
+
+        self.ssh_command_output_contains(
+            'cat /sys/class/hwmon/hwmon20/temp1_input', '0')
+        self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
+                    property='temperature', value=18000)
+        self.ssh_command_output_contains(
+            'cat /sys/class/hwmon/hwmon20/temp1_input', '18000')
 
 class AST2x00MachineMMC(QemuSystemTest):
 
-- 
2.34.1

