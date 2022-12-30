Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4840439ejb;
        Fri, 30 Dec 2022 03:38:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuTABzJQOjifPFxoYJxVsBB+mjcx98LU+NEs4aLtJFwgQsChFSfr6dRpjkW8H1zB5O+Mtbu
X-Received: by 2002:ac8:13cb:0:b0:3a8:2e73:24c9 with SMTP id i11-20020ac813cb000000b003a82e7324c9mr43038213qtj.46.1672400335261;
        Fri, 30 Dec 2022 03:38:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672400335; cv=none;
        d=google.com; s=arc-20160816;
        b=C8VozmEt58ON36DEIPBTDUWHS1gxtWltfViv8XGOqJqWg/vbc5A7v3MXbMkTbeFNiS
         CCxsAl5fEJwvtwMsf3zmKbNSVIXom0uEFSuXGgFD/ngRhJ2a7rpiljKHuDUJQgr//B2a
         cjHZoAqFZyqMdBoPeOj+wSBYdkbRH/j9ZHi9F3+vlIk5ce/dr/CQQDZbDhMSdYFXrx5b
         Be2ARGQeJTkTS178pEju40gkXHQGljTU9XgvPujjcGCGJ+W5mt5TUFs1u9pxq3b3ajSO
         chSqvNxs4SWfoZa8EwiVnodfpdlJXscsmpH5VN1wULzchYUMP/7pJKCp1pdtxdVf9Hdx
         O21w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5mn36Svw49kff47DGBREJk9PPKNIMvzg29Q4dzWpTCM=;
        b=E30OXqB6xgErMHhIvsqJMMcOVN/0HluFNF/dGDqCubdzfei7Msyqn58T850qjjU/SK
         HV8wmPKCymNpDXNSsydB2wwDIRKq1nl5mz4gicsIDE54zjyc6EEfzAT35FtJC+mvhH0Y
         YXsPP55j4TnoxXkxUAEhUqZ2YAdVI6k29VWyT6qwEqHM6pPhjeNSW1P3HDxCTlMaQCaI
         rZNYIn2B4ZYbzalmI11OXiQ5Mxx5HwN0XFga/g6NIPnTxB74cS8dkTGKcAnk8iJdwGaN
         P22BoFbIOH1E0jkxj41Dou54VcrTlXnOW9AIx0aCO3bd7FeXlsoZBIFxagZnrol5cLDW
         2McA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zOjpkTE1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 78-20020a370a51000000b0070241642872si9369616qkk.317.2022.12.30.03.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Dec 2022 03:38:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zOjpkTE1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBDgK-00075m-BJ; Fri, 30 Dec 2022 06:36:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDgI-00072Y-Jw
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:36:10 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDgG-0003vX-9O
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:36:10 -0500
Received: by mail-wr1-x434.google.com with SMTP id y8so19652921wrl.13
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 03:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5mn36Svw49kff47DGBREJk9PPKNIMvzg29Q4dzWpTCM=;
 b=zOjpkTE1RHuFiExPiqca5OcD4tUipamF1/3/QfOdxqj8DlSuttdPbaNkbS3QhJwTDZ
 mo0FiAk0cANE0oy9SqHsldE32DD55ZVkh9okgq+lNmFH99BeJ2TVq57s/nEzbqWQbW6e
 7AZbXQ5k8/cV0v9MApSxYruJi3bxL95PcfK9DojarRQ8yaKmYvaLlViIQL1S2o9fNYRA
 3SYJfd1c3x4BDCRCZj1ODN8MXOqOj6LhqEU8UoHVAPUu5gTPSB1z29pp32Euwfooxgur
 +iKRZQPLeUjWkLNaPy+5Ym2RtXJvwVmLnBQcz9A57vt+pTcQ7WkrF0QOWZd6SzVoqjhe
 i3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5mn36Svw49kff47DGBREJk9PPKNIMvzg29Q4dzWpTCM=;
 b=MbRPhsA/TOuHc0kLD8IQAVm5fn3OarsbFi7728zDXDNo7sENvvYke+4hOL2PWQt7Ku
 dI6GFmQlFp+kfNp4FBAzlT9D+4X8plwWcgveKhJTu99qJWJT3me1mG7eZn/BNANClJ6p
 VfOAs2QsdQis9509Oe+nfnpLsT7jdkLvDoshlvEkFWpJ4iM2wPBM9FTX8tPvmxrV1USp
 DEZSHEbb7Oy9TrYX1aV23M939UOofmJu4CC1x2EtEHQFXAkHixbYAZluHCWTyR4sCI4N
 tIx7GTSDruqI0w4Fw+ur1gpIS8wrYSwnkb8WU5gCdJcaXACTktQEwlGJVXVNRjEbg6ax
 cXvg==
X-Gm-Message-State: AFqh2ko0uuxbxhURUml7LnYa/GDGn4+W+RPhqLerQ0jjNA3+IznHO5kn
 A3IZwsaHFO4hfvnB2t0UQuZud8QmHP3jNEra
X-Received: by 2002:adf:fc07:0:b0:288:ebd8:dc1f with SMTP id
 i7-20020adffc07000000b00288ebd8dc1fmr5110501wrr.55.1672400167252; 
 Fri, 30 Dec 2022 03:36:07 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a5d414a000000b0024242111a27sm20631548wrq.75.2022.12.30.03.36.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Dec 2022 03:36:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 11/11] tests/avocado: Test Aspeed Zephyr SDK v00.01.08 on
 AST1030 board
Date: Fri, 30 Dec 2022 12:35:04 +0100
Message-Id: <20221230113504.37032-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113504.37032-1-philmd@linaro.org>
References: <20221230113504.37032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kbNGkgUtf0it

Add a very quick test that runs some commands in a Zephyr shell:

  $ tests/venv/bin/avocado --show=app,console run -t os:zephyr tests/avocado
  (2/2) tests/avocado/machine_aspeed.py:AST1030Machine.test_ast1030_zephyros_1_07:
  console: *** Booting Zephyr OS build v00.01.07  ***
  console: ast1030_evb demo
  console: SOC: AST1030-A1
  console: uart:~$ kernel stacks
  console: 0x36910 wdt_background (real size 1024):	unused 988	usage 36 / 1024 (3 %)
  console: 0x36ad8 shell_uart (real size 4096):	unused 3084	usage 1012 / 4096 (24 %)
  console: 0x2edb8 ADC0       (real size 400):	unused 260	usage 140 / 400 (35 %)
  console: 0x2f0f0 ADC1       (real size 400):	unused 260	usage 140 / 400 (35 %)
  console: 0x3b098 sysworkq   (real size 1024):	unused 860	usage 164 / 1024 (16 %)
  console: 0x36cc0 usbdworkq  (real size 1024):	unused 860	usage 164 / 1024 (16 %)
  console: 0x36bd8 usbworkq   (real size 1024):	unused 860	usage 164 / 1024 (16 %)
  console: 0x36a10 logging    (real size 768):	unused 548	usage 220 / 768 (28 %)
  console: 0x36ef8 idle 00    (real size 320):	unused 268	usage 52 / 320 (16 %)
  console: 0x47800 IRQ 00     (real size 2048):	unused 1504	usage 544 / 2048 (26 %)
  console: uart:~$ otp info scu
  console: SCU     BIT   reg_protect     Description
  console: ____________________________________________________________________
  console: 0x500   0x0   0x0             Disable ARM CM4 CPU boot (TXD5)
  console: 0x500   0x1   0x0            /Reserved
  console: 0x500   0x2   0x0            \ "
  console: 0x500   0x3   0x0             Address offset of single chip ABR mode
  console: 0x500   0x4   0x0            /Reserved
  console: 0x500   0x5   0x0            | "
  console: 0x500   0x6   0x0            | "
  console: 0x500   0x7   0x0            | "
  console: 0x500   0x8   0x0            | "
  console: 0x500   0x9   0x0            | "
  console: 0x500   0xA   0x0            | "
  console: 0x500   0xB   0x0            | "
  console: 0x500   0xC   0x0            | "
  console: 0x500   0xD   0x0            | "
  console: 0x500   0xE   0x0            | "
  console: 0x500   0xF   0x0            | "
  console: 0x500   0x10  0x0            \ "
  console: 0x500   0x11  0x0             Disabl3 ARM JTAG debug
  console: 0x500   0x12  0x0            /Reserved
  console: 0x500   0x13  0x0            | "
  console: 0x500   0x14  0x0            | "
  console: 0x500   0x15  0x0            | "
  console: 0x500   0x16  0x0            | "
  console: 0x500   0x17  0x0            | "
  console: 0x500   0x18  0x0            | "
  console: 0x500   0x19  0x0            | "
  console: 0x500   0x1A  0x0            | "
  console: 0x500   0x1B  0x0            | "
  console: 0x500   0x1C  0x0            | "
  console: 0x500   0x1D  0x0            | "
  console: 0x500   0x1E  0x0            | "
  console: 0x500   0x1F  0x0            \ "
  console: 0x510   0x0   0x0            /Reserved
  console: 0x510   0x1   0x0            | "
  console: 0x510   0x2   0x0            | "
  console: 0x510   0x3   0x0            \ "
  console: 0x510   0x4   0x0             Disable debug interfaces
  console: 0x510   0x5   0x0            /Reserved
  console: 0x510   0x6   0x0            | "
  console: 0x510   0x7   0x0            \ "
  console: 0x510   0x8   0x0             Enable boot from Uart5 by Pin Strap
  console: 0x510   0x9   0x0            /Reserved
  console: 0x510   0xA   0x0            \ "
  console: 0x510   0xB   0x0             Enable boot SPI ABR
  console: 0x510   0xC   0x0             Boot SPI ABR Mode
  console: 0x510   0xD   0x0            /Boot SPI flash size
  console: 0x510   0xE   0x0            | "
  console: 0x510   0xF   0x0            \ "
  console: 0x510   0x10  0x0            /Reserved
  console: 0x510   0x11  0x0            | "
  console: 0x510   0x12  0x0            | "
  console: 0x510   0x13  0x0            | "
  console: 0x510   0x14  0x0            | "
  console: 0x510   0x15  0x0            \ "
  console: 0x510   0x16  0x0             Enable boot SPI auxiliary control pins
  console: 0x510   0x19  0x0            /Reserved
  console: 0x510   0x1A  0x0            | "
  console: 0x510   0x1B  0x0            | "
  console: 0x510   0x1C  0x0            | "
  console: 0x510   0x1D  0x0            | "
  console: 0x510   0x1E  0x0            | "
  console: 0x510   0x1F  0x0            \ "
  console: 0x510   0x1E  0x0             Enable dedicate GPIO strap pins
  console: 0x510   0x1F  0x0             Enable Secure Boot by Pin Strap
  console: uart:~$ hwinfo devid
  console: Length: 8
  console: ID: 0x0000018000000180
  console: uart:~$ crypto aes256_cbc_vault
  console: aes256_cbc vault key 1
  console: Was waiting for:
  console: 6b c1 be e2 2e 40 9f 96 e9 3d 7e 11 73 93 17 2a
  console: ae 2d 8a 57 1e 03 ac 9c 9e b7 6f ac 45 af 8e 51
  console: 30 c8 1c 46 a3 5c e4 11 e5 fb c1 19 1a 0a 52 ef
  console: f6 9f 24 45 df 4f 9b 17 ad 2b 41 7b e6 6c 37 10
  console: But got:
  console: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  console: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  console: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  console: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  console: uart:~$ random get
  console: 0x862460d
  console: uart:~$ i2c scan I2C_0
  console: 0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
  console: 00:             -- -- -- -- -- -- -- -- -- -- -- --
  console: 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  console: 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  console: 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  console: 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  console: 50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  console: 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  console: 70: -- -- -- -- -- -- -- --
  console: 1 devices found on I2C_0
  console: uart:~$ kernel uptime
  console: Uptime: 9897 ms
  console: uart:~$ kernel reboot warm
  console: *** Booting Zephyr OS build v00.01.07  ***
  PASS (1.08 s)

Ref: https://github.com/AspeedTech-BMC/zephyr/releases/download/v00.01.07/Aspeed_Zephy_SDK_User_Guide_v00.01.07.pdf

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
---
 tests/avocado/machine_aspeed.py | 41 ++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 1fc385e1c8..11f5b17eb9 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -22,10 +22,11 @@ class AST1030Machine(QemuSystemTest):
 
     timeout = 10
 
-    def test_ast1030_zephyros(self):
+    def test_ast1030_zephyros_1_04(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:ast1030-evb
+        :avocado: tags=os:zephyr
         """
         tar_url = ('https://github.com/AspeedTech-BMC'
                    '/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip')
@@ -41,6 +42,44 @@ def test_ast1030_zephyros(self):
         exec_command_and_wait_for_pattern(self, "help",
                                           "Available commands")
 
+    def test_ast1030_zephyros_1_07(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:ast1030-evb
+        :avocado: tags=os:zephyr
+        """
+        tar_url = ('https://github.com/AspeedTech-BMC'
+                   '/zephyr/releases/download/v00.01.07/ast1030-evb-demo.zip')
+        tar_hash = '40ac87eabdcd3b3454ce5aad11fedc72a33ecda2'
+        tar_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        archive.extract(tar_path, self.workdir)
+        kernel_file = self.workdir + "/ast1030-evb-demo/zephyr.bin"
+        self.vm.set_console()
+        self.vm.add_args('-kernel', kernel_file,
+                         '-nographic')
+        self.vm.launch()
+        wait_for_console_pattern(self, "Booting Zephyr OS")
+        for shell_cmd in [
+                'kernel stacks',
+                'otp info conf',
+                'otp info scu',
+                'hwinfo devid',
+                'crypto aes256_cbc_vault',
+                'random get',
+                'jtag JTAG1 sw_xfer high TMS',
+                'adc ADC0 resolution 12',
+                'adc ADC0 read 42',
+                'adc ADC1 read 69',
+                'i2c scan I2C_0',
+                'i3c attach I3C_0',
+                'hash test',
+                'kernel uptime',
+                'kernel reboot warm',
+                'kernel uptime',
+                'kernel reboot cold',
+                'kernel uptime',
+        ]: exec_command_and_wait_for_pattern(self, shell_cmd, "uart:~$")
+
 class AST2x00Machine(QemuSystemTest):
 
     timeout = 90
-- 
2.38.1

