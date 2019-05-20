Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp681503wrg;
        Mon, 20 May 2019 15:07:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWOzF62Ii4Qd5Mp3ZRONmD5naqgtKJeHhtGeGCITZg/S8R84mFM3Go0sb9jE6vCun1EXQ8
X-Received: by 2002:a17:906:6812:: with SMTP id k18mr4865258ejr.95.1558390023885;
        Mon, 20 May 2019 15:07:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558390023; cv=none;
        d=google.com; s=arc-20160816;
        b=PgcuzGd6qcxGPFDue33vkKFUIAyMSxWlf1chTxrfQw7w3d7SsDhvTfzWIwj2eCAQS+
         gNbgFfiiLY+Y67RyOxpE5OPx8Sp9sArEYGK0Y8U4fWjp41VUx7r2on1EZPp8yN/IiBe+
         rhUf0OgIiHL8tkQQRTyg4wNJpATJzdLQhbQS3EOb/UnoGvnsHAbnoH2tuFAsSspUE7Sk
         cHKImcb4zo2uXxcUTsG4ADYlIJdZcfcjzkQY5tJy63tmWN4Mitr6vE68tSoPgaL2EpDw
         0C9XnW0DcX88h9n3VS/yuX+bWbxOmAkTD0vqzj1bdeGXV93HZ3y1oyOslGowEkKzYZaY
         SYHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=RpBHMO/Gvr5r85Ip4+FKU+7BM1/SoeQOc8XHwm4/D0g=;
        b=uZhNsZKoZvGHJ0gbxIHMFHF7ZZIEFKAiNbceGR1ehFgDfnel4aNlsRV8zow1oWg4BK
         tvrPNMFk630ZPv2jmmxIE55vKgluuK0MTONiZ3LtuNN7Dk5cwGbpasGHNmvpti0Zj79/
         kaNZS3UI4r3ly3ym7BSnhcPrRnluL2ftsgiwZuZ6NYBdglOxY5w9tCnmyD8sDAymXEgW
         7wPYz1c03mnBgR8YNnfz9gjypEp3icyuZyyTfs1pZEMfDTegwnnqnulc+cnRQdo0eluE
         0ZqCRtvPGKXPUqeVj585+ZjKMlUuv5wPJwKb5Y8xSxl0HbTgp5IwJeneOEPq7eC+EX5l
         xaYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TSNh9kfK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o33si4939394edc.219.2019.05.20.15.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 15:07:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TSNh9kfK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:42687 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSqQw-00029N-PM
	for alex.bennee@linaro.org; Mon, 20 May 2019 18:07:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hSqQe-00026b-A3
	for qemu-arm@nongnu.org; Mon, 20 May 2019 18:06:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hSqQd-0007zE-6c
	for qemu-arm@nongnu.org; Mon, 20 May 2019 18:06:44 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41300)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hSqQa-0007wy-Kk; Mon, 20 May 2019 18:06:40 -0400
Received: by mail-wr1-x444.google.com with SMTP id g12so15977819wro.8;
	Mon, 20 May 2019 15:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RpBHMO/Gvr5r85Ip4+FKU+7BM1/SoeQOc8XHwm4/D0g=;
	b=TSNh9kfK2W24a9/vQGROiYNRLUY5Bym/pTjTsuWSJTWNks9wAt6zTNxoGz1rlGJj25
	dHy/ZUTUzuHq4UOZjaGXLM+o8X7CyKAZ2XyirfmbR9wSMPY0/becDhS8PJQDwGCeQrEd
	j8P38uWwjwXxMRc2fWvuZIWsSCDeyyE87uz+06jxN5Du18SZky3dikem+bdsNrZBYmh0
	5wV+nbhCN+knApE9WEKjQOPg8lHUseUO5FoZG0YmvtU+Xn2Q6aTsNzumhhUUKHmqFHjR
	rq47KLccsXEwTb5cUIOPeQKQZD2JR4Nb4SxlPQffFlqsb5S6RnNd5td5ulAH/fxEzSeL
	wpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=RpBHMO/Gvr5r85Ip4+FKU+7BM1/SoeQOc8XHwm4/D0g=;
	b=AUvx+TwFPvSWt7fxIcbKzQ0mwDg4LNmG5Q8trElaWXnNBDx/MgsT0e3Cw9VQO9suda
	RKoUa10G2phqu2mwHIN8Gw6sTG0i6ZcoQzYk6ZiyTGLnZ94lBTEwXxiy2doxb9YV37Xk
	Q4r0ascD2nPIS7GfdcvlFGSyNkSS+eRkXdivD8oYOjCBb89R+WaQnVh4UiFAPl+JcfjP
	v0yPlsSqIWQL5EjTL5laUTA0KeXFJXWPdsDp2OKgP3i9RtIWXctlEwk+JkrtJsFeaMkS
	VGV7qg6+E09rKF30Q+05Kyo1UDJvixoCC2chmaN0YU7DM6zy13fSJog6uCskTO6OqAx+
	NJXQ==
X-Gm-Message-State: APjAAAW9+J+kfJR4xSYYkNO4fUNWeKxj94KbpTnyVq7++qlFQUiaGUAT
	pLMiNOLeHs+n3Uj/rKb1vWWTy7c0fZg=
X-Received: by 2002:a5d:4211:: with SMTP id n17mr500695wrq.131.1558389999544; 
	Mon, 20 May 2019 15:06:39 -0700 (PDT)
Received: from x1.local (228.red-83-52-173.dynamicip.rima-tde.net.
	[83.52.173.228]) by smtp.gmail.com with ESMTPSA id
	y40sm35462259wrd.96.2019.05.20.15.06.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 15:06:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Date: Tue, 21 May 2019 00:06:35 +0200
Message-Id: <20190520220635.10961-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190520220635.10961-1-f4bug@amsat.org>
References: <20190520220635.10961-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 2/2] BootLinuxConsoleTest: Test the SmartFusion2
 board
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Caio Carrara <ccarrara@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HeoIuZnwDYjC

Similar to the x86_64/pc test, it boots a Linux kernel on an
Emcraft board and verify the serial is working.

If ARM is a target being built, "make check-acceptance" will
automatically include this test by the use of the "arch:arm" tags.

Alternatively, this test can be run using:

  $ avocado run -t arch:arm tests/acceptance
  $ avocado run -t machine:emcraft-sf2 tests/acceptance

Based on the recommended test setup from Subbaraya Sundeep:
https://lists.gnu.org/archive/html/qemu-devel/2017-05/msg03810.html

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index f593f3858e..844cb80bb5 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -178,6 +178,33 @@ class BootLinuxConsole(Test):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def test_arm_emcraft_sf2(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:emcraft-sf2
+        :avocado: tags=endian:little
+        """
+        uboot_url = ('https://raw.githubusercontent.com/'
+                     'Subbaraya-Sundeep/qemu-test-binaries/'
+                     'fa030bd77a014a0b8e360d3b7011df89283a2f0b/u-boot')
+        uboot_hash = 'abba5d9c24cdd2d49cdc2a8aa92976cf20737eff'
+        uboot_path = self.fetch_asset(uboot_url, asset_hash=uboot_hash)
+        spi_url = ('https://raw.githubusercontent.com/'
+                   'Subbaraya-Sundeep/qemu-test-binaries/'
+                   'fa030bd77a014a0b8e360d3b7011df89283a2f0b/spi.bin')
+        spi_hash = '85f698329d38de63aea6e884a86fbde70890a78a'
+        spi_path = self.fetch_asset(spi_url, asset_hash=spi_hash)
+
+        self.vm.set_machine('emcraft-sf2')
+        self.vm.set_console()
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE
+        self.vm.add_args('-kernel', uboot_path,
+                         '-append', kernel_command_line,
+                         '-drive', 'file=' + spi_path + ',if=mtd,format=raw',
+                         '-no-reboot')
+        self.vm.launch()
+        self.wait_for_console_pattern('init started: BusyBox')
+
     def test_s390x_s390_ccw_virtio(self):
         """
         :avocado: tags=arch:s390x
-- 
2.19.1

