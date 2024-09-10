Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1208722njb;
        Tue, 10 Sep 2024 02:49:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0ENbaT+Y96izCQ2h2bQ/rp23auN0eXxkEKC1lb8csgmPCaQoIuPjSY+8xMp6zxIjVSm0KqXpu26LUGw==@linaro.org
X-Google-Smtp-Source: AGHT+IFnVwxY3Tar+WC8tnbwEdAc6YWgtT0EdH1VApHy79XugKC4ZwYOUFm2qXEPTpTOGz/jGguy
X-Received: by 2002:a0c:f40d:0:b0:6c5:50be:dd74 with SMTP id 6a1803df08f44-6c550bedda9mr46800826d6.45.1725961756533;
        Tue, 10 Sep 2024 02:49:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725961756; cv=none;
        d=google.com; s=arc-20240605;
        b=BwKEJah+U+IkWtgyHN36vPDewB0k/cEfKyZCYGt81RE2NK2gNNk86Ol1jX40xVUIIL
         2GCr5qH7TB0irqHrmIKMkBQLXpBXTvWNeQpXcEfDBz626MAWU/6LLjI6R1mdUcbRT94L
         oYeEHkLuvH9gtpTb6R/C8BOs8pqh/gSGxCMOcOLS5q7Da7YU1pkH9xVzu+sYhrT7CSJX
         qcznp42MjJb2zA2X43N53Y+dyC0crSiB2D2pYx/u5+PrrLJg1v7holarykDued5v9lGZ
         bdhijYWKO+Ju+Y7JaCVsqlT+xSZeEiS2EfJKZnwxygVCa5JNApKBCcks6zMaoTBo1d8b
         i17A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from;
        bh=ykFlWs59B+usHDbjiUZFc6+GeW4CzsvA8BW42ybZ7k4=;
        fh=2XNni5tFqqNsYuVOJGxzVTMSzHzZnaSMOOPrr5cXMU4=;
        b=iX38mK7jRGfci2GYNJ6frIjGAA3/oyz6PLyKZ8JocXh/3ZfNaTaZP/LcKIXKXbMrTO
         b3GnyIniF0/knRNevt7pPDvCdsUljefs4JiDh2qY/NXacf7/hjNJoABreRQMX5l4Sijy
         YTnhSVDBiHWsK2jxD0kPx6cjHFg47nL6N1NA9AptrJ58FFg2FWXGC5GRuUJZBXEe6bxv
         cCOdbk0s6lsCnPd5YYdhioCC0hAM+voGCs2ExAk6y+oq6IQ+0CXY5wv/ZgadBUmMyNoD
         Om2sMMpZ8KqpC+RFCK9oiBkG+nDrM1bLlXrbkdEjiGm0OG3xpv7drg4IjGvNTxaKn6Mi
         DcpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c5348ca2besi75128886d6.562.2024.09.10.02.49.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2024 02:49:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1snxUE-0006az-TB; Tue, 10 Sep 2024 05:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1snxUD-0006VN-4E; Tue, 10 Sep 2024 05:48:37 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1snxUB-0000MN-DB; Tue, 10 Sep 2024 05:48:36 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 59F5A260C04;
 Tue, 10 Sep 2024 11:48:33 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id djff2q77UvON; Tue, 10 Sep 2024 11:48:31 +0200 (CEST)
Received: from applejack.lan (83.11.24.101.ipv4.supernova.orange.pl
 [83.11.24.101])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id D5436260A95;
 Tue, 10 Sep 2024 11:48:29 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Tue, 10 Sep 2024 11:48:09 +0200
Subject: [PATCH v5 2/4] tests: add FreeBSD tests for aarch64/sbsa-ref
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240910-b4-move-to-freebsd-v5-2-0fb66d803c93@linaro.org>
References: <20240910-b4-move-to-freebsd-v5-0-0fb66d803c93@linaro.org>
In-Reply-To: <20240910-b4-move-to-freebsd-v5-0-0fb66d803c93@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: b4 0.14.0
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
X-TUID: qhyjAUxYfxtr

FreeBSD has longer support cycle for stable release (14.x EoL in 2028)
than OpenBSD (7.3 we use is already EoL). Also bugfixes are backported
so we can stay on 14.x for longer.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/functional/test_aarch64_sbsaref.py | 43 +++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/tests/functional/test_aarch64_sbsaref.py b/tests/functional/test_aarch64_sbsaref.py
index 528882f4fa..89d0b9587a 100755
--- a/tests/functional/test_aarch64_sbsaref.py
+++ b/tests/functional/test_aarch64_sbsaref.py
@@ -1,6 +1,6 @@
 #!/usr/bin/env python3
 #
-# Functional test that boots a Linux kernel and checks the console
+# Functional test that boots a kernel and checks the console
 #
 # SPDX-FileCopyrightText: 2023-2024 Linaro Ltd.
 # SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
@@ -184,5 +184,46 @@ def test_sbsaref_openbsd73_max(self):
         self.boot_openbsd73("max")
 
 
+    ASSET_FREEBSD_ISO = Asset(
+        ('https://download.freebsd.org/releases/arm64/aarch64/ISO-IMAGES/'
+         '14.1/FreeBSD-14.1-RELEASE-arm64-aarch64-bootonly.iso'),
+        '44cdbae275ef1bb6dab1d5fbb59473d4f741e1c8ea8a80fd9e906b531d6ad461')
+
+    # This tests the whole boot chain from EFI to Userspace
+    # We only boot a whole OS for the current top level CPU and GIC
+    # Other test profiles should use more minimal boots
+    def boot_freebsd14(self, cpu=None):
+        self.fetch_firmware()
+
+        img_path = self.ASSET_FREEBSD_ISO.fetch()
+
+        self.vm.set_console()
+        self.vm.add_args(
+            "-drive", f"file={img_path},format=raw,snapshot=on",
+        )
+        if cpu:
+            self.vm.add_args("-cpu", cpu)
+
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Welcome to FreeBSD!')
+
+    def test_sbsaref_freebsd14_cortex_a57(self):
+        self.boot_freebsd14("cortex-a57")
+
+    def test_sbsaref_freebsd14_default_cpu(self):
+        self.boot_freebsd14()
+
+    def test_sbsaref_freebsd14_max_pauth_off(self):
+        self.boot_freebsd14("max,pauth=off")
+
+    @skipUnless(os.getenv('QEMU_TEST_TIMEOUT_EXPECTED'), 'Test might timeout')
+    def test_sbsaref_freebsd14_max_pauth_impdef(self):
+        self.boot_freebsd14("max,pauth-impdef=on")
+
+    @skipUnless(os.getenv('QEMU_TEST_TIMEOUT_EXPECTED'), 'Test might timeout')
+    def test_sbsaref_freebsd14_max(self):
+        self.boot_freebsd14("max")
+
+
 if __name__ == '__main__':
     QemuSystemTest.main()

-- 
2.46.0

