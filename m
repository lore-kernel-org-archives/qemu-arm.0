Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp5010980njc;
        Fri, 8 Nov 2024 07:48:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXqy5YuohtTooTEP/ozvRWs0r1LHpfcTcd9THeTF1w9eUcM0nG+wBAjNnI41UGU1JoF8nbOarSw3TI0ag==@linaro.org
X-Google-Smtp-Source: AGHT+IFCX+sHqoFSaxKLnfl4AOPEVuzzWhkRwjBwQVxqDqALZE2C8YjMUWOaMqAWtZS5pMp6INpE
X-Received: by 2002:a05:620a:4007:b0:7af:d00b:9c79 with SMTP id af79cd13be357-7b33193ae27mr525353785a.31.1731080921864;
        Fri, 08 Nov 2024 07:48:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731080921; cv=none;
        d=google.com; s=arc-20240605;
        b=RmQwGOP8Gpl6egdwzFD3+EG9WMewpMR3suSTd787HlUrKuOuvF+1XAcsYDdZxo1jdi
         ZHBHF72I5avDftxxC39GmQrERQVkJ3u7T8apGf8oXKPQXWAt1wPVsPjdtulHbfB7J3UH
         GXu6J94IZD/bs2PtEP/dc9Tdh5wc8tVelB9PwUgknsmqNkturvu1n+00/wo8gIO8EQgd
         VsFVfH1PZjSEP4tdc2nOaWbbnhhcjkUFEKf7Sw+qml3OhX6h00cKBEbzbOlR3w45ak8e
         pAU7+fjiHN4rBclRK5X8q6czqiZEjO/RjzpiLFZkSbSUJwBQ5UwJsbZYBw+bMry8FnTc
         GPSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hbUeKq8wIPtd30sIyAicGmI1dVV7JgXeFSyihDqJX1Q=;
        fh=EQVqa0E0zA48Zg17izZw+WQdGhOVMngJyBs8+kGl7sQ=;
        b=abzpvGK0aa1pAK+B4hbQTIYEjHaUf/5RsLjOr90C7p9glGKf64XVnQV9IlxXYpGx22
         cki9RbO2QWuAeZV+9jjV6edLVWeqAvW3rH/JK7K3rpGjnhxC3+hADmDs5G0HG/wdW7Mn
         FQwzru06pOF+jSBwIpWW5ZqB26tRRexYqvrwQkjTK67h6yM/UMk5LEQCoJLfqLG0WQun
         p50g8EGEfEaPX7Uc4HlxD0aCeBFO8lmtS0ctOPwCbWcg/Uk2EjVJ61Ogl5/MReuq33dF
         TyCDCCMYGq6/sobQnCVPcokWRCwXRWx1q0B3wyyml2r9BrmCKf9rm2Z1V99mj5Kyqyz9
         Y9bQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fMTFArCM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3966bfb57si43743476d6.509.2024.11.08.07.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 07:48:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fMTFArCM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9RAl-00078i-BT; Fri, 08 Nov 2024 10:45:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9RAG-00061w-23
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:44:49 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9RAE-0005ko-6J
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:44:47 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43158625112so20595765e9.3
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 07:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731080685; x=1731685485; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hbUeKq8wIPtd30sIyAicGmI1dVV7JgXeFSyihDqJX1Q=;
 b=fMTFArCMC/c5BpX2L//HRC1RrQRnPoXekNRoil8CzrLBbXE4BFuueAmY7HO9wXcFes
 3QxmrefhOEHntpa12h5168hGLu4EyhMDzSoRU/PO65S6JPCGgRvEfpSZzErcMPevnT+J
 Agbn4Ea2gC96SI2c5VcgHoVaqVhvqx3MSgfZ2nhRNTWDOm3HDiExth7pqd5ewhRHVpMn
 T5XaSCTgf0aPTDfebHvXePSX7AD7O55JxdSq+oMdSEfuslfCSkVcdzYFWLdjVoLxBxEJ
 N9cG8oCwKnaQN4FA0AAeeIH9qVCrEDd+KHaiIUCtOL68m1j1IfeO+YhQYt4rZxBpzwzS
 F2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731080685; x=1731685485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hbUeKq8wIPtd30sIyAicGmI1dVV7JgXeFSyihDqJX1Q=;
 b=aqwgsDRaCQZ3sjIqlDj0yelqlqWCXFXqmKcjP4yGMiefx5AoZ57hTG4Na4F/0kz0Xx
 ALj/RjLaUJmonfUqSv2UcBX9tmU2xfAKvBhZ2DqBbNwwRCbUIWKxdB0eBUUHu4+8Khk1
 lDbmvEcZh35Q+ejm0fS6CNWbSq1RXn+ztPNQvjO1FEnGotEoWyvC/ZDhz6qU1NVskUuk
 uZs3hDAIkp01HySkyzGH91t6NUnZoVTPxGS2qd9fKs2nDuDO3sDMSsJMCfXtdT0XNdv3
 r9gRPyPqi/JmASgmtmSdcNOrD7GXNiMe7TaP11bHJWJsGeOSplRqxzFNWHJeojkWyt81
 attA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEsexSNnB3jfWD+BBkSM2lgWAp2nF6mQvU+xYcEnECHE07mBw/OGDXCxrtI/lYpw/QOwMWGOinsw==@nongnu.org
X-Gm-Message-State: AOJu0Yzm/mqfvPILSWHksX3tZ32BXpCSBuREkwIEU2wUrd3e1AO7Oz8h
 HBLg726uM0F2ZmKCbQw8m6tjGHzYJik9bE5LsDPe5OHg0yoaRLYSxYTAjFEhHrs=
X-Received: by 2002:a05:600c:1c98:b0:426:6edf:6597 with SMTP id
 5b1f17b1804b1-432b750a358mr28190085e9.19.1731080684756; 
 Fri, 08 Nov 2024 07:44:44 -0800 (PST)
Received: from localhost.localdomain ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05c26e3sm75094025e9.33.2024.11.08.07.44.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Nov 2024 07:44:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 17/17] tests/functional: Add microblaze cross-endianness
 tests
Date: Fri,  8 Nov 2024 15:43:17 +0000
Message-ID: <20241108154317.12129-18-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241108154317.12129-1-philmd@linaro.org>
References: <20241108154317.12129-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 47ZQxf4bEwB6

Copy/paste the current tests, but call the opposite endianness
machines, testing:
- petalogix-s3adsp1800-le machine (little-endian CPU) on the
  qemu-system-microblaze binary (big-endian)
- petalogix-s3adsp1800-be machine (big-endian CPU) on the
  qemu-system-microblazeel binary (little-endian).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 .../functional/test_microblaze_s3adsp1800.py  | 21 +++++++++++++++++++
 .../test_microblazeel_s3adsp1800.py           | 19 +++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/tests/functional/test_microblaze_s3adsp1800.py b/tests/functional/test_microblaze_s3adsp1800.py
index 2b2f782270..7f5e8b6024 100755
--- a/tests/functional/test_microblaze_s3adsp1800.py
+++ b/tests/functional/test_microblaze_s3adsp1800.py
@@ -36,5 +36,26 @@ def test_microblaze_s3adsp1800_be(self):
         # message, that's why we don't test for a later string here. This
         # needs some investigation by a microblaze wizard one day...
 
+    ASSET_IMAGE_LE = Asset(
+        ('http://www.qemu-advent-calendar.org/2023/download/day13.tar.gz'),
+        'b9b3d43c5dd79db88ada495cc6e0d1f591153fe41355e925d791fbf44de50c22')
+
+    def test_microblaze_s3adsp1800_le(self):
+        self.require_netdev('user')
+        self.set_machine('petalogix-s3adsp1800-le')
+        file_path = self.ASSET_IMAGE_LE.fetch()
+        archive_extract(file_path, self.workdir)
+        self.vm.set_console()
+        self.vm.add_args('-kernel', self.workdir + '/day13/xmaton.bin')
+        self.vm.add_args('-nic', 'user,tftp=' + self.workdir + '/day13/')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'QEMU Advent Calendar 2023')
+        time.sleep(0.1)
+        exec_command(self, 'root')
+        time.sleep(0.1)
+        exec_command_and_wait_for_pattern(self,
+                'tftp -g -r xmaton.png 10.0.2.2 ; md5sum xmaton.png',
+                '821cd3cab8efd16ad6ee5acc3642a8ea')
+
 if __name__ == '__main__':
     QemuSystemTest.main()
diff --git a/tests/functional/test_microblazeel_s3adsp1800.py b/tests/functional/test_microblazeel_s3adsp1800.py
index 1aee5149fb..60543009ba 100755
--- a/tests/functional/test_microblazeel_s3adsp1800.py
+++ b/tests/functional/test_microblazeel_s3adsp1800.py
@@ -38,5 +38,24 @@ def test_microblazeel_s3adsp1800_le(self):
                 'tftp -g -r xmaton.png 10.0.2.2 ; md5sum xmaton.png',
                 '821cd3cab8efd16ad6ee5acc3642a8ea')
 
+    ASSET_IMAGE_BE = Asset(
+        ('https://qemu-advcal.gitlab.io/qac-best-of-multiarch/download/'
+         'day17.tar.xz'),
+        '3ba7439dfbea7af4876662c97f8e1f0cdad9231fc166e4861d17042489270057')
+
+    def test_microblazeel_s3adsp1800_be(self):
+        self.set_machine('petalogix-s3adsp1800-be')
+        file_path = self.ASSET_IMAGE_BE.fetch()
+        archive_extract(file_path, self.workdir)
+        self.vm.set_console()
+        self.vm.add_args('-kernel', self.workdir + '/day17/ballerina.bin')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'This architecture does not have '
+                                       'kernel memory protection')
+        # Note:
+        # The kernel sometimes gets stuck after the "This architecture ..."
+        # message, that's why we don't test for a later string here. This
+        # needs some investigation by a microblaze wizard one day...
+
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.45.2

