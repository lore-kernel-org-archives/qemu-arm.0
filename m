Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp3992558njc;
        Sun, 25 May 2025 22:32:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFIcHUzWn1oPdMrDfT0Lsdx+/TWkBc9Ipt1A4wY2JwDip1JK6q+YrAYfNRcV0PC56hDMgYtlImlHJqWw==@linaro.org
X-Received: by 2002:a05:6102:2ac1:b0:4df:9281:5ec3 with SMTP id ada2fe7eead31-4e423d6eaaemr6107776137.2.1748237529763;
        Sun, 25 May 2025 22:32:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748237529; cv=none;
        d=google.com; s=arc-20240605;
        b=eRGvmee+9xV5akaefwfRuLS3znDQT9OqoR38hoinjhbTlSQCkqJmrSC+U5q5DQxAPy
         IH3WoT78JMikFLmQihRRA26zF11b/Z6b9BS/Eq+t6cNiJnXWg1hoHcl5ZO7fQwNuT3JJ
         jYqtSXjrx3fVw4W6Ec5kUTAu5BiiqWeHpoEey0w0KSpS9mF3QfZoPGqakQhddLSwc7T0
         mziMCLSljuarPNdeAu2dtRTn0mUb6FTx7ikjJyZwrP0IsUjpKgcIZPJqPDlWhYqsLB9P
         UXoO6OaSw4+jOfRWxVq3PBKd1Os6vg+DeDvGUf8bPiJyQg2WEf4OW0fpgQ7Rjs4BgSeh
         l0gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JiA6hOZT8dbZS3oxbupOyToDge/JikBtR/d7vAGhdTw=;
        fh=96FJ1ykYoMeFn3cMP6lg04G4XGCF2XH5EimOwkn9uIs=;
        b=ZHX7mGgSNuy0MasMg5q3gTowLXWqYkAI2+8WTEAyVxeZqNNoVssjNZfjQWCuiFAkrE
         OAnNmbIkJWWpIqSZfkHSvL3ZsftSqrtFmu6kSFZ8nqqXU9DCQiFlaSP9T/0wS+vFjFIN
         IFajRhDfygmC8gpELZ5as81t+Ui143j3h7YuDdq7S4XFVu9zd7PmRbfrA2raN90gyDo2
         qomv7ss5IgLktSGkhs2id5NstAj6ssBDFO99lanYReTQF2xbFpiNqMir7n5L0ixZnFs6
         e3yST+NnRi4K6X8beyv2ZndtGP632FlpIOUGxdcnNT7jXwESabZe7O+igLEk/38SDT4W
         ISnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TUH5xLF9;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ada2fe7eead31-4e300665125sor2009324137.5.2025.05.25.22.32.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 25 May 2025 22:32:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TUH5xLF9;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748237529; x=1748842329; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiA6hOZT8dbZS3oxbupOyToDge/JikBtR/d7vAGhdTw=;
        b=TUH5xLF90g5m9UJbkkc1IcX3tAdRYF/RFS0+9c0kKHgjo++DV7v57G1ZzfOY+wonln
         x196h0erCnYoMVYFKtyLZ8opudC2CP24BltPq+P5oof0Z+0UXwWvsWzpeQsWsfC9cYY+
         7RTvKLnZpYlvn/jQuaQDkim+feZGAnENU+c8gqBcvr/ERF8xD0B92woTPhZf+n1qQzUB
         ZqsJ6Kz9KIn1kIGeYxd7Pufc135JLT1RWjlOrqLkkrbPPzK6PwqeL+npzjf5FhlaRXxv
         rrmSdacGl48YB+BwS82viNuIlkvasHVQSYM7pj4ApLlVH4xUT2As9Ymf031R1EID4CuI
         o1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748237529; x=1748842329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiA6hOZT8dbZS3oxbupOyToDge/JikBtR/d7vAGhdTw=;
        b=Wv/2Efl2KuqX6bCUkXSrpPVAUOv6R1Dit/i8YlMiGTnc8uvlcvjzIas/Q7VRCeMhPu
         TT9v7eBLrRhZIx91hPbimVVUWXEnmoCioTI/AdtvaIqO+Ad8YCAV0STYfDS8XZ4xkmhD
         THqobo2fWCi3frh8mmCG4X8Gi6C2PKj2Dz75eCKaR+k7sGtEEYGC9UwgNuVxb2fWmae/
         7/6t1rzWJyrXsl0GB8Qmvv16QZ/nMZBu6dlRppdkAl8+zgM5VH0PBhskFWeYgSAKSC5d
         KKFfgjG6q6diKMXDoWZsjpqPQFsfx/SaJTBl904191Y72wzH3XGBX7rF2oBgn8cTA4ft
         jU8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW19gURl4J8eyuY3DuoTfGuGBEtHAsKLeSwpha1xWaJDRB+lMtrQa88+kLfc+Gxx/OM6FNKgaInstkViA==@linaro.org
X-Gm-Message-State: AOJu0YyYr03HzlCPPL3EJP//p7WhtauzDi4QlKCxIDx7UlzaOj+y2lp/
	W2haPiiNxaoJHt9Xo73yepZbeT/mY8PsJ0zZ2y4J8+8MVg2lbs7I9v0CLPJj7LV67B6HGg==
X-Gm-Gg: ASbGncsGEwz17DnVv9GN4CjjdWyA8znc4ud1AhiCZZjW774eoxpIyYRLZWBs6Cbhxru
	TA2/CSqZcGLRrwHwEUpNtkHLzzB39Pm2tuS3RdIBvqpPypvMe/kCAwKir6pwFnUN9+x16uAhhKN
	rFXwAtmn9fFGsboFlOUDAFqqwvHCaI7go7+4miWFk/vjW8Uk40/YPpuly3RZO8Tk75o2VZo0YnZ
	5uMfcjCj8Z5+OUhFVXTuet4ZkCLqoBB7HI+3Eox51i4p60iMkq+IoypCiRNDorsK6M/hxpgVnkr
	gS8YFJNbpIfYIA+Wpk6GuqYiOm18s84vSjowwQnZ1HW1n8Oev/nY6VI5wH1J3aVRRz06FZR0Qcp
	oXqYb8jndMKN5o9W6T0nB9w==
X-Google-Smtp-Source: AGHT+IFN2lNK4zSXYTc+V8vX1GgVatJUToP0HcuvBCW3JIvZvNKnE0F9IyZPW+yKJjIbkdNmYKJk2w==
X-Received: by 2002:a05:6102:4407:b0:4e2:82b1:efe0 with SMTP id ada2fe7eead31-4e423d6eda2mr4871280137.1.1748237529338;
        Sun, 25 May 2025 22:32:09 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. (200-100-75-183.dial-up.telesp.net.br. [200.100.75.183])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e454da4378sm784310137.17.2025.05.25.22.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 22:32:08 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	eric.auger@redhat.com
Cc: qemu-arm@nongnu.org,
	thuth@redhat.com,
	gustavo.romero@linaro.org,
	alex.bennee@linaro.org,
	mst@redhat.com,
	imammedo@redhat.com
Subject: [PATCH 4/5] tests/qtest/bios-tables-test: Add aarch64 ACPI PCI hotplug test
Date: Mon, 26 May 2025 05:31:22 +0000
Message-Id: <20250526053123.1434204-5-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526053123.1434204-1-gustavo.romero@linaro.org>
References: <20250526053123.1434204-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: yDCH6AArZegZ

Add a test to verify that the aarch64 'virt' machine correctly generates
the ACPI tables and AML code for PCI device hotplug.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/data/acpi/aarch64/virt/DSDT.acpipcihp |  0
 tests/qtest/bios-tables-test-allowed-diff.h |  1 +
 tests/qtest/bios-tables-test.c              | 32 +++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 tests/data/acpi/aarch64/virt/DSDT.acpipcihp

diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpipcihp b/tests/data/acpi/aarch64/virt/DSDT.acpipcihp
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..dc3ab24d05 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/DSDT.acpipcihp",
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 216941dbb5..1bf45bc6e3 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1643,6 +1643,37 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
 
 }
 
+static void test_acpi_aarch64_virt_pci_hotplug(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .arch = "aarch64",
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 512ULL * 1024 * 1024,
+        .variant = ".acpipcihp",
+    };
+
+   test_acpi_one(" -machine acpi-pcihp=on"
+                 " -cpu cortex-a57"
+                 " -m 512M"
+                 /*
+                  * We just pick address=0x04 for the root port to avoid
+                  * collisions with other PCI devices on the root bus (pcie.0).
+                  * It could be any other value that doesn't collide.
+                  *
+                  * The 'chassis' and 'slot' options equal to 1 have no special
+                  * meaning here, could be any integer, but we set them to known
+                  * values to keep the test consistent.
+                  */
+                 " -device pcie-root-port,bus=pcie.0,chassis=1,slot=1,addr=0x04.0x00",
+                 &data);
+
+    free_test_data(&data);
+}
+
 static void test_acpi_microvm_prepare(test_data *data)
 {
     data->machine = "microvm";
@@ -2584,6 +2615,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/virt/numamem",
                            test_acpi_aarch64_virt_tcg_numamem);
             qtest_add_func("acpi/virt/memhp", test_acpi_aarch64_virt_tcg_memhp);
+            qtest_add_func("acpi/virt/pcihp", test_acpi_aarch64_virt_pci_hotplug);
             qtest_add_func("acpi/virt/pxb", test_acpi_aarch64_virt_tcg_pxb);
             qtest_add_func("acpi/virt/oem-fields",
                            test_acpi_aarch64_virt_oem_fields);
-- 
2.34.1
