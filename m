Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp3992526njc;
        Sun, 25 May 2025 22:32:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlqbRt6plXi7WCkWNJvgVjLLKkfOG8mREx8oNKl+eeMdbzgD2gmzz91rvD9y59ATjQldI1zbqAFy/c7g==@linaro.org
X-Received: by 2002:a05:6102:943:b0:4df:93e0:fb8 with SMTP id ada2fe7eead31-4e4241f7e59mr5036893137.24.1748237523813;
        Sun, 25 May 2025 22:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748237523; cv=none;
        d=google.com; s=arc-20240605;
        b=ThlB95KXwNiYKtVb6Ksyhg8Hf4ZmmpN5QQGTwerbCnwwRn905BGjuyreOB2fQfSlvV
         MnSJhaqFiGBnBP4wDxZYaXUg28d3FIYJ/iWllDe1LqrmgPh6L2yIttHko7ITEfx0rh9B
         k/EY+6g5A6eWUBHdz/sqAg9W1kSiy97U0zdaBR3asrN57SWQM3r/4SpJZUTDyUwh5h+Q
         KSctcj/TB98nHJQicN8aP1okiO0U96mDVPGVCi8wGac98exKk/U9jW4JjrbIZKYUEPQW
         3vP9IcVZTcpSm+74IHrwSkMQnVtviBzoLjXWVSgI00mH46Sq9UI2CwGbNe0VfoId4UTH
         2l7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8BICU4b7QLdbhUSoTdVeRR8JtDxyaYap4Oi2QriTbDw=;
        fh=dz1v+RkPiL8F9qPlPL0Y4OBEeneUsheCnK/P2/IhF24=;
        b=UnzjarJ4JPAYx2O0LDxASmGzRuyyfkrFSo/9hYlcDPhy2zXrqNmXgF8KG2lMTJwHjZ
         QhMhIS6AKbjwUBwuEK33v2Pv82cq+toZDObEZpLnprseal1jewDOfrzxDidIMCLT9fWH
         kvJsR6fVdBmzRpaFAiPcSClTYZFVU+tfwS1KDaJXqeHJeEp4Db5SRozqx5Lu53SBxOAd
         IyybXlQveUHs9SSbNOjJhue+vJTbkCwRdARquxloYRc64oLPS23828OMq8Naa3lqbaTZ
         23r2NXSw96XUYstnuQEfTwElwHtBDe8KTEvRX/kmKOWX0Fh3mAPeBGKQYiOoi1Nu/BXp
         2ETA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kvhjHVJr;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ada2fe7eead31-4e458279a0bsor87693137.2.2025.05.25.22.32.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 25 May 2025 22:32:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kvhjHVJr;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748237523; x=1748842323; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BICU4b7QLdbhUSoTdVeRR8JtDxyaYap4Oi2QriTbDw=;
        b=kvhjHVJriO05UgW1hKg86y1cxtuxy2eupnbOlZwqNQDsChwSmRdp4/DeD5QaEnbZAV
         OhQgYYUf2pdHAKzK5kkG6hf3p29qo7vN7f0vXW5Ffd1V833T5ImdxKgyGt74ovELFcJK
         KXvfjREBNfRomzyKSf24x5hJXclbxrnjdbiijEPr1iZchD1OKylVFA8p/XKPmhqTDBZb
         RVgEo8ibquScL9osMl+6D2+cDf1cNY0zPBssIw6H2yx95rxvciAxtj1RxOBj+x8vXSvx
         OHs2YYHrUEIfwne3wzvZ6UNg2jRS3knUvpYBs6OsamJQlBzRjbtDAQrK69GkTbwNuaJ4
         hexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748237523; x=1748842323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BICU4b7QLdbhUSoTdVeRR8JtDxyaYap4Oi2QriTbDw=;
        b=WLazYw/L9yawZFzupSQE9vrvbn+rsu2mfJbXEAa3EUG0Daxngs4euwuUdpDOG0MGl5
         KH+B0quQPIaCDK179ymTMyVKMKgnPKFGfcR7oIXhETO/4fLa4ukEWD1/eDzFo+8isKUw
         DJjJEVA96+CKGJZ5iMODI4MhZEl2+LalcQHv6SFIOl4ZVLATzY8iNV0u+IC/Jdr1y4hS
         MJmcAz/rzCAqgOJaY8AXqFVC2585H8EUVpWgl4jvG+2srnubXF7Otns/ZuuSzBFH+rMX
         9Rr6OpqB8mVZy2ibFwbykC9kqWT1RNClY2aJlElYyFDc/vcQBdots/MD/uKWzV9xkC0K
         aHnA==
X-Forwarded-Encrypted: i=1; AJvYcCUKwgpWT61+MGGWNj5hiScCcr6+0+MippdErz4cRs1SSbD/4UNbvYNu4JneRXmypYgfvCYRJquPrOxHBw==@linaro.org
X-Gm-Message-State: AOJu0Yz9LOICRvqFBHIPDYJqRkOJ3v06zjpkIAjz9m/qIdw0zShB4OsC
	1dFW7pSDGRrzIj/AxDIYl+AJg13trHLTQtDBo5QTTLFRIpEzQTCInUJc5dhbfGmkliIgNw==
X-Gm-Gg: ASbGnctkyL67v9UAUG6zBfgOOJA9E71V+RfahrWuAxqCNy5vRQjQ+X44A8v7sh9cvXJ
	KAjvdrEu9Qk/H6sLB2Od/rwpysOaPy3zvS9yXzNkw1DWc/ObeXzLYGHtm1W4EVOCqL/h5nJhkaa
	JW+PWCQKWfdn09ZKw5i8ZefPGGFeqymnDsY01YyE4ehTlvSKGSWxd+sMh7ESeI4b8TokX9xZlTw
	W82QXedTqzPYdpUXCmi1Xff63klO3EYhsjbRhwyBalpEarGVHRs3T7AQT6z8gGmbibJA1EIuOdK
	F5H1rWs1IRGYiebnix9J8jpcg9p7JDBTVPy6rLu4kR4S+5HSYjxdd7ahAUY18Tv0rxuhjMeSjHz
	yJ1z6U06bG+gbirIX9OQ9zIYBokFFLyiG
X-Google-Smtp-Source: AGHT+IFLT89ZZ/LgA2ugxIyY2m5X3Ne9b8navUdNxLGD0pktr2W0XQyI8xR/4omQb//PVn07GRQrfw==
X-Received: by 2002:a05:6102:6c4:b0:4bb:d45c:7f4b with SMTP id ada2fe7eead31-4e4240f9b9amr5989646137.11.1748237523455;
        Sun, 25 May 2025 22:32:03 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. (200-100-75-183.dial-up.telesp.net.br. [200.100.75.183])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e454da4378sm784310137.17.2025.05.25.22.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 22:32:02 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	eric.auger@redhat.com
Cc: qemu-arm@nongnu.org,
	thuth@redhat.com,
	gustavo.romero@linaro.org,
	alex.bennee@linaro.org,
	mst@redhat.com,
	imammedo@redhat.com
Subject: [PATCH 2/5] tests/qtest/bios-tables-test: Keep ACPI PCI hotplug off
Date: Mon, 26 May 2025 05:31:20 +0000
Message-Id: <20250526053123.1434204-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526053123.1434204-1-gustavo.romero@linaro.org>
References: <20250526053123.1434204-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bJzM4NTpwoDH

ACPI PCI hotplug is now turned on by default so we need to change the
existing tests to keep it off. However, even setting the ACPI PCI
hotplug off in the existing tests, there will be changes in the ACPI
tables because the _OSC method was modified, hence in the next patch of
this series the blobs are updated accordingly.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/qtest/bios-tables-test.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0a333ec435..216941dbb5 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1626,7 +1626,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
     };
 
     data.variant = ".memhp";
-    test_acpi_one(" -machine nvdimm=on"
+    test_acpi_one(" -machine nvdimm=on,acpi-pcihp=off"
                   " -cpu cortex-a57"
                   " -m 256M,slots=3,maxmem=1G"
                   " -object memory-backend-ram,id=ram0,size=128M"
@@ -1775,7 +1775,8 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
      * to solve the conflicts.
      */
     data.variant = ".pxb";
-    test_acpi_one(" -device pcie-root-port,chassis=1,id=pci.1"
+    test_acpi_one(" -machine acpi-pcihp=off"
+                  " -device pcie-root-port,chassis=1,id=pci.1"
                   " -device virtio-scsi-pci,id=scsi0,bus=pci.1"
                   " -drive file="
                   "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
@@ -1846,7 +1847,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
 
     data.variant = ".acpihmatvirt";
 
-    test_acpi_one(" -machine hmat=on"
+    test_acpi_one(" -machine hmat=on,acpi-pcihp=off"
                   " -cpu cortex-a57"
                   " -smp 4,sockets=2"
                   " -m 384M"
@@ -2123,6 +2124,7 @@ static void test_acpi_aarch64_virt_tcg(void)
     data.smbios_cpu_max_speed = 2900;
     data.smbios_cpu_curr_speed = 2700;
     test_acpi_one("-cpu cortex-a57 "
+                  "-machine acpi-pcihp=off "
                   "-smbios type=4,max-speed=2900,current-speed=2700", &data);
     free_test_data(&data);
 }
@@ -2142,6 +2144,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
     };
 
     test_acpi_one("-cpu cortex-a57 "
+                  "-machine acpi-pcihp=off "
                   "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
     free_test_data(&data);
 }
@@ -2227,6 +2230,7 @@ static void test_acpi_aarch64_virt_viot(void)
     };
 
     test_acpi_one("-cpu cortex-a57 "
+                  "-machine acpi-pcihp=off "
                   "-device virtio-iommu-pci", &data);
     free_test_data(&data);
 }
-- 
2.34.1
