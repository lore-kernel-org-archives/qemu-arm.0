Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5200170njc;
        Tue, 27 May 2025 18:55:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIhZ/nKaItyWga+aeSMQ6i3EPRqtruLvKcPt8TWADzROWfS24BjdxSVC/QXyjFx3Kxn/S+r7wCCrVYTg==@linaro.org
X-Received: by 2002:a05:6102:390b:b0:4b6:d108:cac1 with SMTP id ada2fe7eead31-4e42408dc8fmr11438956137.9.1748397328961;
        Tue, 27 May 2025 18:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748397328; cv=none;
        d=google.com; s=arc-20240605;
        b=Bj6TdG5C+7KKaEEjE+33pqcchrWztMifRhkJ0ynlWPhgRY89K8HcbXY1w6HaDA2hv/
         CNEpZ7BEOcBSxkHBzxt2csi0OrqTeVxxEExBIbDkJarwllhSaElxG9dpdu62q+silwxb
         y9MHadOp2wIgXL/YFtIaI4zMTE2uj4YnzlZppTzMy7EmfODOgYMd6IgPuoMIlGQzjnut
         XekT5FZJaKL41ZfsC4sz5Mlf9qZoeL8E3nT7dr7V1UDvJ0+MjZH+9X+yu+36tMMQKADr
         /H4P5x7y++H9ZqI+9gZllB1B49kuwT8q8L3y2sTEpMP2o5yiizOwDy/yAaRPPzJPz3eh
         9hDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=ekdSO3MxkWEhWoItetIsPFvG7mQY8NVEEt05rbTMaZs=;
        fh=92oiY6lY0Xf5GqOlmERzr1c0EywRkSqQb6gJu0KOKio=;
        b=AKAgNeUJIHUhgxLOe4tNCieAM6vZCf5V+7FRjA/YTfI87UiMUTVAoalzJCySbeHSf9
         4sNFFA0F3XLWp5EtO+iw065Qt+Mw7AGGo9KKFcgmZslAPyANRy/aP1fHnqbTbSf/O42k
         daB7KdnKBqJbZV/ilAEN9ewNmaJpSgjnZ9qkDm3NRuD0EJ48QGLRj0i2mWqyy1Rpw4tE
         vh0VHwgQLx+QRmKrED1h2gsOF5dBMrl3d6Jbu+Abb8Zwohx4riDDKKzLm5EXbp0DKY2+
         9boIAyeQhXnqEtpAe2hSpnIf2nDnIdMJTy/7KunK22bXKMOr+Q14JjQovUGUBfMaAXyP
         1quw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WRcRZPsf;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 71dfb90a1353d-53066cc1520sor18972e0c.8.2025.05.27.18.55.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 May 2025 18:55:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WRcRZPsf;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748397328; x=1749002128; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ekdSO3MxkWEhWoItetIsPFvG7mQY8NVEEt05rbTMaZs=;
        b=WRcRZPsfn1M435xcGf5Je+/SNgJ5ciF6eg1knUC7nEl3JDqxLQgeZ5KYfexnpGZ4az
         d4agRhq8GdkkR2j7KHZrT3gfHVNexcCoE3sic4qA/TybmihF73AeUOatWd1dvxelgotQ
         Gmzyw/Rhdz0+qqqBRil3MevrqG/HPhVdPg285ByBHwLPh/OtbWlUsEuV5r/AhJNiYx/o
         hMeTEHCPP81f4j5MbdCMnhL2qTh2cGYIl3n71oSzhj0HdK24TiUlfGzmGYcO83kPBEt5
         fI93t6QEhkX9zReTTeWmUTu8Tji2b5viYUvbCXUHdR1DyYmoqQVyfbjZdZNcnXAAZCeM
         bBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748397328; x=1749002128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekdSO3MxkWEhWoItetIsPFvG7mQY8NVEEt05rbTMaZs=;
        b=n5eHr0ij83bvGGhgrioe9SUEtfv9oIwVLfllz99ACTqTTilb/8XIDuL76p4J3SJn5G
         NI5ZyZRSbzh/1dKdD1ViUbFFjDq/MgsZZlp0L+cyriqNhjP3sCy/0a63xWX9EE7F/p3o
         gdObjinq/2Qv4FGWsupw8I2HKY8GBngRbeoBpk8yVayCGkm4U4BvyM333vF4azVuXVkB
         fZiWKSgp3VwR04QmM9CEIaILSTAKidx0Aovm3POPWgevvB8Zvx0VJzR+TQiFAPPyI0Rd
         EO5kMXJEk5IhjYr7628aOFsxEqt/ugAYYfnRBJe72quveEkUU6J2xTGQE00ZzACjXlMn
         GwlA==
X-Forwarded-Encrypted: i=1; AJvYcCUHjT2/pl3mVcXHUIRVEYox5idGcwaEyhK/ohXY07bUIfXmMVjTaFzEEwo6KWDCYu6XZ2lr4UKC6AF5Aw==@linaro.org
X-Gm-Message-State: AOJu0Yx9UbAUymD4PjQpp1tE9fUvDXVgMwr+Z2Vge75EmzmVhWnHee3J
	75eeqZetZPdzA/oTfOPJgUwY+8MXf2OP0OI/s5FGS7xSmrzXi6UZo6PsJpcswwgPEpCBkw==
X-Gm-Gg: ASbGnct339e58PIliAigrCGyNmLDxPrionNVsXq9kfiq6I8i4p4n6d8z+XATdPiNmDN
	k06CNBND67/mKFYwi6CvQKb3g8yi8jJywnlBViwwQkjIJBiH6L0LFcq7oVL7syCHXpZDseZ7O0B
	Uru+B1MHxFs8Ij0ibxkLIpHXuqZ7AJRYrwC1V6BfH6hMaadbKetU3dF9EI0+oZGnvNcEmyfmp5+
	EW0qtUnmUysYKV2F9BYMMfrl6+W2mbp0r1cmrmAU9jN4nWgWH98lBd2tCy/1nFroCfyloctM2DB
	XSTFIwZaP0NlzuEuG6kORLtvEl/m7IG8cYexNwZCSXr0W817w5IFguXH1QckbQYFa4dzbHLDlv/
	TOJU62Y9R8OYXWaFVB/djuw==
X-Google-Smtp-Source: AGHT+IGq0QjeGsJxdYS+r7/yoJx30jpViyp2evfwLhnAAzs8MFXBXhMA3kTOKslpl4WAPVezC2V/fg==
X-Received: by 2002:a05:6122:2527:b0:530:65b3:4920 with SMTP id 71dfb90a1353d-53065b349f8mr413923e0c.5.1748397328493;
        Tue, 27 May 2025 18:55:28 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. (200-100-75-183.dial-up.telesp.net.br. [200.100.75.183])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53066864b70sm174242e0c.18.2025.05.27.18.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 18:55:27 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	eric.auger@redhat.com
Cc: qemu-arm@nongnu.org,
	thuth@redhat.com,
	alex.bennee@linaro.org,
	gustavo.romero@linaro.org
Subject: [PATCH REPOST] tests/functional/test_aarch64_hotplug_pci: Add test for ACPI PCI hotplug
Date: Wed, 28 May 2025 01:55:08 +0000
Message-Id: <20250528015508.1630804-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QLhhil1sS/Xn

Currently, test_aarch64_hotplug_pci only tests PCI hotplug using the
native PCI hotplug mechanism. Now that aarch64 supports PCI hotplug via
the ACPI mechanism it's time to support it in the test as well.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/functional/test_aarch64_hotplug_pci.py | 24 +++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/tests/functional/test_aarch64_hotplug_pci.py b/tests/functional/test_aarch64_hotplug_pci.py
index 2cf5c28b9f..ec8c7afe96 100755
--- a/tests/functional/test_aarch64_hotplug_pci.py
+++ b/tests/functional/test_aarch64_hotplug_pci.py
@@ -27,11 +27,26 @@ class HotplugPCI(LinuxKernelTest):
          '20230607+deb12u11/images/netboot/debian-installer/arm64/initrd.gz'),
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
