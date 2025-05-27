Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4876940njc;
        Tue, 27 May 2025 08:03:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCErddc/sY/MDfymh87Wm2CBCyK2oK52AWn1yOSu8lCrOrVLLC4YLYQsEbS6q6WSk0i+gwb3nZyC5hHA==@linaro.org
X-Received: by 2002:a05:620a:254c:b0:7cd:4b5b:a210 with SMTP id af79cd13be357-7ceecc3a7e2mr1994314885a.47.1748358172964;
        Tue, 27 May 2025 08:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748358172; cv=none;
        d=google.com; s=arc-20240605;
        b=YaaUXTJSynQYUMyESRM1dDE9tQ2a+YdyniNWXQCCx+NYRPA6L29YFsDz3U6TOI5pRJ
         Kr53fu6Q1CUm4Ro/6ZfbGX2nIVbFStna2kBJfHM+xLJktlVBxwqbYFRBWBt58jNUQEHo
         CdCiICSdbKsETmV8nBUL8YYgT3y7iy0Ir5ZgGKb+lfYzKmQbo1mKesC8RYaMcc7s/zKX
         hEKtNqolBeGifd2ZZ1Ngr1jvch5Ao0PLa9Wv1pB8wwm395vzse5Z5aZGptEooFVaa/co
         9ax3hnrq+jpajf3ZBlZak1tFyFKAH58tszpVOpv36Yarjra1OF5m2fL+3CVjb2/gndDw
         oE2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RniEF1mf7TN4jF60DdYm0zWLKlVKKpJMW1uo5Rs5HEQ=;
        fh=qRCZztVsXnkcseW3WNLBWvDe4W7DLOj5OyPpkLOsYFk=;
        b=KqWpsryu4heNLexuZhaJNilDJMZ6uKzXZSjySRElgzS1KE0Mkwx/w8IMMwYZawvx9K
         dh8uNDDwSEHIxXd/w5l5wO6wOscZV6JeETfsjmoaxlX2Ov6Z3V9ZonR0XQZzdsI5w8T2
         kdX9tT97ROPMii0CzhrfOlTT0bjxW3sn8ETTxmrzHuEKSAqlEYOnANwh/gFA9oJ7kR6w
         NevwLyUMkH8E+ku8cxfkiR4jEl+nO95RVLPIvZd9DeJ0QvgpSthnoiGCao5VtfTX09KD
         SOuEIm3zTMc3zMEWYuQz6nPhfbn2Y2pHP2aZ5+Q90H1G7k9grVtntWmqR3+jCs3PlEKz
         vHGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u8UaCOxE;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a1e0cc1a2514c-87df12cd60asor567353241.8.2025.05.27.08.02.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 May 2025 08:02:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u8UaCOxE;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748358172; x=1748962972; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RniEF1mf7TN4jF60DdYm0zWLKlVKKpJMW1uo5Rs5HEQ=;
        b=u8UaCOxE2O8ilPXLOH5qi4JC56TFdXRgGJShnRv5kDJrqifC4zxQKj0//yYY3u6fJG
         Q7W6WrHhXgCowo6nB1GKYeG/ImofsO568uYf2to7x77Dqx+W99fx4t+s+ktPs6hH0sgZ
         kMGUp1dMQbxxCW+I2d41QAoNO2XbL0yyghXcYqaeyl3BjuwZ8+ARSiGCRi3LtSg2m8Fm
         LLjILn82YIZNxi1wV/gv2iHnJEFBqUSeshmq/Dswe0KCWvcCp2q3x1adAkiM5fwzZD0T
         TW7GtV0EUfa+1z1NqwT6fDDcuMb4XEvuhp2qwtL1Gzn0wm17vcvroj70C2Xxk0rLFunD
         J0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358172; x=1748962972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RniEF1mf7TN4jF60DdYm0zWLKlVKKpJMW1uo5Rs5HEQ=;
        b=q5PUATOWUXyU74HjjZdOaK0Dbd/lqUes4/4OCEgJswld+KGoJ9Bw+cJM2FREhPqESU
         HVdq+5qABYUrUwEH/GYjx8a9Kfcz6sm+0aTIiBhGBWh2WDeR7JNqOmUDVRreRFcxG7l/
         yPxjflq0T5kMYoW53Q5Q9myhoEXUv6Xxw31WsBcy//+nOO5j/B0RqxZGVxNvaMUcGQkB
         PqZJu3rBTu1IGhvczP7jrktAbo5zWYH7gpQVHaHNsYKguAJi9VBjkjjS8whdpuPjygw1
         xnI7H1nzlm1Rb7fNnSPeYyNUa9xIlPW0K+EaojEAYV4XYa8bLQlpI6KY0MuhpDFQi18j
         JD0A==
X-Forwarded-Encrypted: i=1; AJvYcCXHmUsCDM/mHOwSZt9FVKv5MZHrXTEgmm3w4pQ3+9+6W/QXHubJkZkHDO4RfYpZJ0MWzAZ799sN95n+6g==@linaro.org
X-Gm-Message-State: AOJu0YwQJJSxJd/6I8uuc7HbIU35NLQWwaV4asmJn6Qj7gg5jfJzdx2D
	qJHn8+8Uwqo7F1mG0tOFsznaublUYeQXFrDyluzWlfqJNnMa9n/NyzdBSjyCCJZTWq63o/ZgYOE
	8bz1DGtNsGg==
X-Gm-Gg: ASbGncszohXC2amUW4ztpk5KXrQwlWZ41gGAewMbZwRhGiR9wkZxGFRmW0XEI7312CN
	agB9gcy3w3P2QDC9MBwO0ERgFXPQxzefmKMXFwcyNOzdaeWspB6u61QZnRhZa3T0MjVYJzK0zoH
	Gkv2TtG0qcV5G10QpcK/sXW4gTCNdXR/qW29JyHmeQqmgaKmEezqTj0r++JUlOf8q7VsAoyBFlv
	8p2CKZz+T0jJAAGv1Aubbv/vqc/n7peTv6+9y+4tQn4Lh9W0eJyqa91dA+f0Raj+NxO7flXKPY3
	Da0cig+oiMus1mBaILW9fkZOMMMnGi/mLCx7NO9bGzc1cdcJe3aqBmTYQVEPvvOfQnE82zFioJS
	yAiE1aYoRDzfnhRAAHD0UJg==
X-Google-Smtp-Source: AGHT+IEamKsspQzXxNvrx0hfrbFiwI9Yy1dIhoMMXDOZHKjNKDNxlne+0y+H39wK8Qh/YB1E5p1ejQ==
X-Received: by 2002:a05:6102:3590:b0:4cb:5d6c:9946 with SMTP id ada2fe7eead31-4e4240a654cmr10360291137.10.1748358172339;
        Tue, 27 May 2025 08:02:52 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. (200-100-75-183.dial-up.telesp.net.br. [200.100.75.183])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e51e94c9c2sm2189649137.23.2025.05.27.08.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:02:51 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	eric.auger@redhat.com
Cc: qemu-arm@nongnu.org,
	thuth@redhat.com,
	gustavo.romero@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH 2/2] tests/functional/test_aarch64_hotplug_pci: Add test for ACPI PCI hotplug
Date: Tue, 27 May 2025 15:02:29 +0000
Message-Id: <20250527150229.1617074-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527150229.1617074-1-gustavo.romero@linaro.org>
References: <20250527150229.1617074-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HRh47LrsL84T

Currently, test_aarch64_hotplug_pci only tests PCI hotplug using the
native PCI hotplug mechanism. Now that aarch64 supports PCI hotplug via
the ACPI mechanism it's time to support it in the test as well.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/functional/test_aarch64_hotplug_pci.py | 24 +++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/tests/functional/test_aarch64_hotplug_pci.py b/tests/functional/test_aarch64_hotplug_pci.py
index bb2c121503..862bb6746b 100755
--- a/tests/functional/test_aarch64_hotplug_pci.py
+++ b/tests/functional/test_aarch64_hotplug_pci.py
@@ -27,11 +27,26 @@ class HotplugPCI(LinuxKernelTest):
          'current/images/netboot/debian-installer/arm64/initrd.gz'),
         '9f817f76951f3237bca8216bee35267bfb826815687f4b2fcdd5e6c2a917790c')
 
-    def test_hotplug_pci(self):
+    def run_vm_and_test_hotplug_pci(self, use_acpi_pci_hotplug=False):
+        """
+        Run an aarch64 VM and test the PCI hotplug mechanism by plugging and
+        unplugging a PCI network adapter to the VM. Proper plug and unplug of
+        the adapter is verified by checking if the network device is correctly
+        added and removed in Linux.
+
+        Parameters
+        ----------
+        use_acpi_pci_hotplug : bool
+            If true the ACPI PCI hotplug mechanim is used, otherwise the
+            Native PCIe Hotplug mechanism is used.
+        """
+
+        acpi_pci_hotplug = "on" if use_acpi_pci_hotplug else "off"
 
         self.set_machine('virt')
         self.vm.add_args('-m', '512M')
         self.vm.add_args('-cpu', 'cortex-a57')
+        self.vm.add_args('-machine', f"acpi-pcihp={acpi_pci_hotplug}")
         self.vm.add_args('-append',
                          'console=ttyAMA0,115200 init=/bin/sh')
         self.vm.add_args('-device',
@@ -70,5 +85,12 @@ def test_hotplug_pci(self):
                                           'ls -l /sys/class/net | wc -l',
                                           '2')
 
+    def test_native_pci_hotplug(self):
+        self.run_vm_and_test_hotplug_pci(use_acpi_pci_hotplug=False)
+
+    def test_acpi_pci_hotplug(self):
+        self.run_vm_and_test_hotplug_pci(use_acpi_pci_hotplug=True)
+
+
 if __name__ == '__main__':
     LinuxKernelTest.main()
-- 
2.34.1
