Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB25C531C9
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Jul 2026 14:41:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wo02c-0003CT-Lt; Sun, 26 Jul 2026 10:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wo02Z-00036m-J8
 for qemu-arm@nongnu.org; Sun, 26 Jul 2026 10:41:19 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wo02X-000515-Ve
 for qemu-arm@nongnu.org; Sun, 26 Jul 2026 10:41:19 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-74d55dac06eso915017137.3
 for <qemu-arm@nongnu.org>; Sun, 26 Jul 2026 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785076877; x=1785681677; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=def94g1ZgIpxexyd5K9cV/aLU41QcCQ1hBKGNGZuG60=;
 b=b7bx8qPh2t1WeKRIlBuT3JXx3zjUpegkEEB1svuJhP72TkpFKOfk/F7I0BvBcF0bVG
 4vJZXiMasPQAxMoJMGfyTDt9UGM6t04bT87uG1HWT458Zuv3P08UDFowQMggiBa4tMJ7
 nsf1fREZFaoHamkzEkPeRCOOw37fod/ogAo6FotsAVhCya3lalbXG5VaSwtdPui8UXxD
 L5yVk2qOIyZGp1HEcsLKr0FYrujpc+t/KJnD4anJsiEccVhNsrWkalaraSwbTl+Fi69/
 rcNLuevTQHw3gDlyxWPJliEdsi4w6FzKhRT4lzhbXAe525O1VAw44uJqHMlfIBwdEAF8
 kaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785076877; x=1785681677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=def94g1ZgIpxexyd5K9cV/aLU41QcCQ1hBKGNGZuG60=;
 b=EWwcj+ZmmRSbFhN23kXDLK/755miYyitwQS7n5wOq3yQYD6JI3AypjR94vdgAWE6Ok
 PGBQmj5AHFNRi/RhfxL/vWbxsENtyQcJ+LGGoYNcIjIgD9oa7xeY2BdBZKWOFbtdOO+G
 GhEwcXNayxYeiFvglnV/2rqZbQXHUyAGTnS1ls/+hp9tGX8u1LThuCQU6BsnbQTVFPBD
 V6iBG8ADGTEsoB/OtpL5ryHHADiGD6/ZJhzAza/hr5r6uJfok+ufMCzWRVntZeaOPO+M
 ETBZkPxgUXn9QILA2pxPGM1R+VarGAUS3IBHQeltfOwDu7PLyG2PGOxGFeDxqpEMHUhx
 Mh6w==
X-Forwarded-Encrypted: i=1;
 AHgh+RohtueiyLIKVf2/QO7C3KsdiTGLpdeNYYIzQd8hBMN9gGrQX7/LXuoxZxvbUYn1QsXS/6JCHSoDeg==@nongnu.org
X-Gm-Message-State: AOJu0YyIGDWtwTFQXrlp6vxIq7ZUGwkeahcaiO1jKi5O8RUdC6Qo0fhL
 SBl6NQsv4Ng8cFXRrV/K8R2ks5rGN7Fcr6AB3M2lnmREoTLkwEsMYjno3tzpSg==
X-Gm-Gg: AR+sD10Q5P9kXvsyiBO13H4wdF/4pGBA3MHGi9KhpXFIN5y3C+Bw0zm8Ml5AvORPTNW
 ZsRnV/xFktNJQzoaDriajqRn2gk7IlQrFPO3TvavE+xvZxXWGmEY4ZsJidg14K36kd14CRt0cTE
 3NZxXOGHfcTQh1imheYLPQRZVC/+kWeQx20dcfUA9w49JuKhc2WsB85DJnV6Nz/5EjUl5VEhrJm
 0PXJ+cIzd2Bw9tRfUEOvXVyeb6FztjXe3/dsfOZL6R2QeGV6qXZzUzYWD/IbCYULRCFGmquHGwa
 CzcHhSAnl6P2W16h4/p9+8aZbVkRaEO6HrQ3WGb48ZAy9KBttvBi9vxRKobL+SVzsJTJtZfJHqh
 as8f2wgKmuWE0JlBfhmD9sAFfQB9IkzNo6myD1XlxoxKosXovGFKktyqzyjHLfoKly5Xkk3eF00
 giksvoB21qnwF4QJSmiQX1hwW1YuAFz3xR
X-Received: by 2002:a05:6102:4194:b0:631:2973:5c2c with SMTP id
 ada2fe7eead31-75040abd835mr3374524137.21.1785076876830; 
 Sun, 26 Jul 2026 07:41:16 -0700 (PDT)
Received: from localhost.localdomain ([146.71.8.128])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-7503436f542sm3682735137.4.2026.07.26.07.41.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 26 Jul 2026 07:41:16 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH 2/2] tests/functional/aarch64: add raspi4b full-RAM regression
 test
Date: Sun, 26 Jul 2026 10:41:12 -0400
Message-ID: <20260726144112.56321-3-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260726144112.56321-1-marcelomanzo@gmail.com>
References: <20260726144112.56321-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=marcelomanzo@gmail.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Guards against the bug fixed in the previous commit: boots raspi4b's
default 2 GiB configuration and checks that the guest actually sees
close to that (>1.9M kB), not the ~921 MiB the bug left it capped at.
Deliberately checks a threshold rather than the exact byte count of
either figure, since the precise number depends on how this specific
pinned kernel accounts for its own early reservations; the threshold
is comfortably between the two (943524 kB broken, 1905824 kB fixed,
confirmed by hand against this exact kernel/initrd).

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 tests/functional/aarch64/test_raspi4.py | 51 +++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/functional/aarch64/test_raspi4.py b/tests/functional/aarch64/test_raspi4.py
index 35ba6c24f7..55903e93d3 100755
--- a/tests/functional/aarch64/test_raspi4.py
+++ b/tests/functional/aarch64/test_raspi4.py
@@ -154,6 +154,57 @@ def test_arm_raspi4_rng_thermal(self):
         exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
 
 
+    def test_arm_raspi4_full_ram(self):
+        kernel_path = self.archive_extract(self.ASSET_KERNEL_20190215,
+                                           member='boot/kernel8.img')
+        dtb_path = self.archive_extract(self.ASSET_KERNEL_20190215,
+                                        member='boot/bcm2711-rpi-4-b.dtb')
+        initrd_path = self.uncompress(self.ASSET_INITRD)
+
+        self.set_machine('raspi4b')
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'earlycon=pl011,mmio32,0xfe201000 ' +
+                               'console=ttyAMA0,115200 ' +
+                               'panic=-1 noreboot ' +
+                               'dwc_otg.fiq_fsm_enable=0')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_command_line,
+                         '-no-reboot')
+        self.vm.launch()
+        self.wait_for_console_pattern('Boot successful.')
+
+        # raspi4b's default machine RAM is 2 GiB, but raspi4_modify_dtb()
+        # used to compare the wrong field when deciding whether to add a
+        # second memory node above the 1 GiB peripheral hole (it checked
+        # the boot-loader's kernel/initrd-loading RAM budget, which is
+        # itself always capped to at most 1 GiB, rather than the board's
+        # actual total RAM) -- so that second node was never added for any
+        # raspi4b configuration, and the guest never saw more than ~1 GiB
+        # regardless of the machine's nominal RAM size. With the bug,
+        # MemTotal here is 943524 kB; fixed, it is 1905824 kB. Guard
+        # against a regression back to the ~1 GiB figure without hardcoding
+        # the exact byte count of either, which depends on how this
+        # specific pinned kernel accounts for its own reservations.
+        mem_total_kb = None
+        cmd_output = exec_command_and_wait_for_pattern(
+            self, 'cat /proc/meminfo', 'MemAvailable')
+        for line in cmd_output.decode('ascii', errors='replace').splitlines():
+            if line.startswith('MemTotal:'):
+                mem_total_kb = int(line.split()[1])
+                break
+        self.assertIsNotNone(mem_total_kb, 'MemTotal line not found')
+        self.assertGreater(mem_total_kb, 1900000,
+                           'guest RAM (%d kB) is far below the ~1.9 GiB '
+                           'expected for a 2 GiB raspi4b -- the second '
+                           'memory node above the 1 GiB peripheral hole '
+                           'is probably not being added' % mem_total_kb)
+
+        exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
+
+
     def test_arm_raspi4_pcie(self):
         kernel_path = self.archive_extract(self.ASSET_KERNEL_20190215,
                                            member='boot/kernel8.img')
-- 
2.47.1


