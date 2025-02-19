Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1381870njb;
        Wed, 19 Feb 2025 06:24:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUvw8bI5il8+ZcKzr4XR+YyjEDpbnWfEtAaZHYQMQwvYq6RoTSezBzJR91iPJxxjH485qXfDVbZHmcScw==@linaro.org
X-Received: by 2002:a5d:5887:0:b0:38f:3b57:681e with SMTP id ffacd0b85a97d-38f3b576996mr12764203f8f.49.1739975055570;
        Wed, 19 Feb 2025 06:24:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739975055; cv=none;
        d=google.com; s=arc-20240605;
        b=CXj+62knzI44PwgElwfdtVdrx9IJYdO7pYl7dR3WEh0jsFxuZIFMKb3DMSlmqsj3u+
         oue8R2lQ3Z3GXqn4ysJHszfs8u1V+Hl24T/DEwbkSWZkNuupuQGVuEXJxlZbueiWdbl3
         KeAaYOmlO0P7/ZG6hDMQb6VKRRUOUAfsS2Oes2Xy5IRrB3V/znWggAl50d9ae+VQfopd
         +EZhSDDIoag4hNbcZyj4Vk03MWtimoVq1aChhmkYkmmWkrKtidvb+JGSiRRSQpQoswMp
         GP1oCXsSU8ECal2PcDIvpOwE8x9fkOprdf91ky+EN7A++KponmZptwVQId/6nlfANQ8F
         UsRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=2bXM2FM3uqWtmWOWElh2OEI9PyZko/TrtNoyq1yEV7A=;
        fh=78HvogL6z5wE3bGiCkY43pE7fdstQfy1BkJ4E6DoHnI=;
        b=c3itm//H92uhVDApjnfEDKnZZ26/oM2UT7ZGdiZeoUkSlvg6qjaKfO3EOz7RE2RCCi
         ND7FWnnqeJp/40FYtpka3TtkCV3wd87wFls0LAlQwHVSOpXbMlrT5IHDb8YZzp2Fhhpn
         YoC7gu+Ki6OTNd0sDYpfpGuSj8has7WWsH7+SKJk6eWL9BkPmzVuHqAaLUMJ15Ez2fSY
         IuCMN0ywa5kcqEcCEP3VHu6+ZqrTK6g72PX0aIl7Ybiw/nGoQtXM4Ip3HfrhdEx21vQ5
         L5ZVpZOvIypZP9M9UAHpJsiB2toDLuyLhvHzQCDb4cmarkDgjETMbIMrVLIKIgqMuD7k
         To9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tfx9bhJY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38f25900da9sor5151978f8f.1.2025.02.19.06.24.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Feb 2025 06:24:15 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tfx9bhJY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739975055; x=1740579855; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2bXM2FM3uqWtmWOWElh2OEI9PyZko/TrtNoyq1yEV7A=;
        b=tfx9bhJY9iRgsIklIIYOdWO0s+rfDZusEifRd9fgMDIhFCjkZ9ZvMBKqEAFlIlgSDp
         LRqmjfJ/kmjKWaTKxrO/hlGP7LJVAT0WVujhLrzOiDWruS1GMSafIpZGWk+bNaJrRSqc
         x8T2Q9dpv62iF9cYa8HnM2skF89oJFZWJnaVVn8/I0kx7VQJxo9kuksYPtJtzkFLqdQ5
         WmkyGNdsTOz4C5BRxjnA0xSRZZxnfuvqoGyAj/oFY30mEi77HEuss2hJ+B0UFzGEDpvv
         ihWibRIuA2/4z/HcMFEwFrHNkIUdz8gmbkfRxtL647K1rBEfthsCNBxLimHgvU8BAy20
         MIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739975055; x=1740579855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bXM2FM3uqWtmWOWElh2OEI9PyZko/TrtNoyq1yEV7A=;
        b=fXUlujlkKtFAsvTmWYvpQ1OZB2nEC/DU99eOJSNZgWMuVrpNkhaPUgK58nVt9+SXvy
         ux8IiX2jfGssTTiBHx+jEzXbO0oYLbJ54vW+AFoLitaQbGGHscI1flJ8kh2ha329LQFS
         kaX1X5fWPcsSA3lPGlA/gPRfRhPfMZgMc/iBkU0v+s5RCEKxsWibszB/5nPXTfCY+JoR
         Vm5XlYMPpZFNxfQe6ZkgDfAOghA9JG0OrTsOr0TfW0fi20z28zzebyEPFqXzLDej1Va8
         g08uGIDm4nSsMmO6GLvie4hvzVz7bERzp0C0SEbPs1zMm74SSg9P1goWrkjhEts9gDKc
         sZpw==
X-Forwarded-Encrypted: i=1; AJvYcCWnMTe0rjSqCuOCDuBjPW9ypv5432Mbmhxi6ECL1yEV6dxYiHpG+lh0hnb2e8/ezNHaDDXzUxvqavk31w==@linaro.org
X-Gm-Message-State: AOJu0Yyf1HVKAgCzA28vJqZhXjPOZbmy4p70lUIqP1uOoJ4yQpGMt+bj
	5HId52UguHfTEtaFL6ywbazUI5mbOJ12ij5BwCkMCPn7DUwAice4hwlhMR+WJSxfbA==
X-Gm-Gg: ASbGncv5M4IF/Fs9Pf8Ksed6czvWXR1GjK99P/qDn1QG36zsJ2mdiWORb936BZl+Gne
	ORo2jfc4r9GCr/bBVODKuWlZLPPODngG3a0MzdkTyqMAqLWLiVuiZ4fYZQWLyHxlnWbQSScMSx1
	QimRy4OQpBwMW7R0ZA1B+QNVJ+PWiAf12zZ1REIpOJfny8VGZbTiUcNGAUMBoSmqQ2sTvuj8fuj
	jPUiLFgQ/641neIYjvDGXQe0I36asklJOlTBnHXrIe7v6tWS/6DLtUtwZh07/Et5gUlD/IRa5YD
	FQ18CI5qUHyufFdtKMi4Q6RZGOHM1LLRqvbF6iiXcrekc4WbZ9rUYdCygGy8YWeL/w==
X-Google-Smtp-Source: AGHT+IH2mIeEyEDNzSmMKUzcoIIO10ZgIHVAabz05fRr9/XBi5aY1cEVgmc+n5ZJs4XpwHEsZVU5dw==
X-Received: by 2002:a5d:64a3:0:b0:38f:50bd:ad11 with SMTP id ffacd0b85a97d-38f50bdadd5mr6329613f8f.5.1739975054947;
        Wed, 19 Feb 2025 06:24:14 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f2591570esm18217888f8f.59.2025.02.19.06.24.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Feb 2025 06:24:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>
Subject: [RFC PATCH] tests/functional: Generic method to check required devices availability
Date: Wed, 19 Feb 2025 15:24:12 +0100
Message-ID: <20250219142412.77536-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ykns+b06P4VX

Not all binaries contain the same set of devices. Since some
tests depend on specific devices, we need to check their
availability in the binary.

QemuSystemTest::require_device() allows for system tests to
explicitly check for a particular device. Add a similar
check_required_devices() method which check all devices
requested on the command line. If a device is missing, the
test is skipped.

Example running test_aarch64_virt.py on macOS:

  ok 1 test_aarch64_virt.Aarch64VirtMachine.test_aarch64_virt_with_gpu # SKIP no support for device virtio-gpu-gl-pci

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Just an idea to see if we can avoid manual require_device() calls.
However not having a device in binary might also be a bug, so RFC...
---
 python/qemu/machine/machine.py         | 10 ++++++++++
 tests/functional/qemu_test/testcase.py |  8 ++++++++
 tests/functional/test_aarch64_virt.py  |  2 ++
 3 files changed, 20 insertions(+)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index ebb58d5b68c..ff1ff066823 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -468,6 +468,16 @@ def launch(self) -> None:
             # that exception. However, we still want to clean up.
             raise
 
+    def get_command_arguments(self, command) -> List[str]:
+        """
+        Return a list of arguments used with one kind of command
+        """
+        args = []
+        for index, element in enumerate(self._args):
+            if element == command:
+                args += [self._args[index + 1]]
+        return args
+
     def _launch(self) -> None:
         """
         Launch the VM and establish a QMP connection
diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
index 869f3949fe9..7e3288f452c 100644
--- a/tests/functional/qemu_test/testcase.py
+++ b/tests/functional/qemu_test/testcase.py
@@ -335,6 +335,14 @@ def require_device(self, devicename):
         if help.find(devicename) < 0:
             self.skipTest('no support for device ' + devicename)
 
+    def check_required_devices(self):
+        """
+        Check the devices requested on the command line are available
+        in the binary. To be used before the VM launch() call.
+        """
+        for device in self.vm.get_command_arguments('-device'):
+            self.require_device(device.split(',')[0])
+
     def _new_vm(self, name, *args):
         vm = QEMUMachine(self.qemu_bin,
                          name=name,
diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
index 95f5ce8b4c0..589680a44c5 100755
--- a/tests/functional/test_aarch64_virt.py
+++ b/tests/functional/test_aarch64_virt.py
@@ -180,6 +180,8 @@ def test_aarch64_virt_with_gpu(self):
                          f"file.filename={image_path}")
         self.vm.add_args("-snapshot")
 
+        self.check_required_devices()
+
         try:
             self.vm.launch()
         except VMLaunchFailure as excp:
-- 
2.47.1
