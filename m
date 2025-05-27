Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4648273njc;
        Tue, 27 May 2025 00:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVc+J1C2nhqYfY2I119ux1RlFq5J32rOyEh6dUUNcZXWnAEKx1gqfsQJWj4dbFCgN6KXL7ZR+VikO7VfA==@linaro.org
X-Google-Smtp-Source: AGHT+IF1/Kg2xK7CtbfCQwKUL+JOXCwa87Mg4qBn4kkAwVp9uqJS2HgYaHcxpetqGVhzB2GRECGy
X-Received: by 2002:ac8:5c95:0:b0:494:a436:e610 with SMTP id d75a77b69052e-49f46d3188amr223563581cf.13.1748331880223;
        Tue, 27 May 2025 00:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331880; cv=none;
        d=google.com; s=arc-20240605;
        b=VszIbwAHQc9N3vS/xmmi3S7Mv9JGK4FFqoWXLKvyS1eCMxEBDeroNL5vWhMQZysOF6
         ILwCJK0m9NpyAVABDjU39EHFuHwSABX5D/EQ4DF3WMv/0ls4kz36V/REr6tIXnUFZ2YA
         AWPgdMyAZ2G0fSwnhQbHSAlQomKJW/K8ooMBteqFWkDgIGcC7GQMbjz9DAqgmwALoOzP
         vl0aosQXjRBWYvhxegId4WBxbybf0SQP/P/+PMt/fxESkkOk9rVrmOUrw93o2BQ2YLKb
         JHUxvVsg87oW244cpVVbJQVjhtT5BedWBflK4+BEyTpatw06z7wGVFNNOF7WD29nHE6S
         mNsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NjrLUtJ/wTeOeGDQFHs3hbhXToVFKVogEjfIEHIOlwI=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=W6n2/MDTlvQ9dYntBGnnOEc2UJLpURtwlA1O9eWL75koQ2I3tYmnsS3zIJjZv2fJVI
         PLng9U6kXFQDuw4xXz9MhwmlxAHjOVRoN3zY0OHtML5QhQoyoq0k/Fq05HGpJrPHBJWE
         wCzYrz0ukPsITCBoKfEm+zJJ500v7opllVJStrFjC34dvcxUC3YzzFf3TG75VsFmMVdM
         F2KHTMPez2EuFpsGwGGPVP6TdAU5fF8tMAuPkLIHO9kSnH3hvfVSBDwYmQAXoHMfsYya
         ij5bgwwMWbCo8BT6NHPcLNtAiWTnZnoulSb7bPJo0oVYp4SRPVkVekdQlgJNReElc3YU
         4uvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GE6NCWei;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae57c10bsi255151951cf.442.2025.05.27.00.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:44:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GE6NCWei;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NjrLUtJ/wTeOeGDQFHs3hbhXToVFKVogEjfIEHIOlwI=;
	b=GE6NCWeiv4xFtXeMInkLJcUiAq8FE+eOjPtOdOVMcEQ9MKn0awYVVOXX10i1wjuG1FYlUd
	DAOsNicD/pctomKHVSrbWvFo0BN+ojOFb2DjROK6UqPd5pOB0NBIbX3m0Qc/z8weRVK+5I
	o1j8mzscC5bcT6dv1ezKn7z5gII1w7M=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-166-sZS2cBcbO5mCSNgA5ZM2Ug-1; Tue,
 27 May 2025 03:44:36 -0400
X-MC-Unique: sZS2cBcbO5mCSNgA5ZM2Ug-1
X-Mimecast-MFC-AGG-ID: sZS2cBcbO5mCSNgA5ZM2Ug_1748331874
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9618D1800115;
	Tue, 27 May 2025 07:44:34 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3C91019560AA;
	Tue, 27 May 2025 07:44:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 24/25] tests/qtest/bios-tables-test: Keep ACPI PCI hotplug off
Date: Tue, 27 May 2025 09:40:26 +0200
Message-ID: <20250527074224.1197793-25-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: KxGi/S/YJolv

From: Gustavo Romero <gustavo.romero@linaro.org>

ACPI PCI hotplug is now turned on by default so we need to change the
existing tests to keep it off. However, even setting the ACPI PCI
hotplug off in the existing tests, there will be changes in the ACPI
tables because the _OSC method was modified, hence in the next patch of
this series the blobs are updated accordingly.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

[Eric] also added acpi-pcihp=off to test_acpi_aarch64_virt_tcg_numamem
---
 tests/qtest/bios-tables-test.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0a333ec435..6379dba714 100644
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
@@ -1747,7 +1747,8 @@ static void test_acpi_aarch64_virt_tcg_numamem(void)
     };
 
     data.variant = ".numamem";
-    test_acpi_one(" -cpu cortex-a57"
+    test_acpi_one(" -machine acpi-pcihp=off"
+                  " -cpu cortex-a57"
                   " -object memory-backend-ram,id=ram0,size=128M"
                   " -numa node,memdev=ram0",
                   &data);
@@ -1775,7 +1776,8 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
      * to solve the conflicts.
      */
     data.variant = ".pxb";
-    test_acpi_one(" -device pcie-root-port,chassis=1,id=pci.1"
+    test_acpi_one(" -machine acpi-pcihp=off"
+                  " -device pcie-root-port,chassis=1,id=pci.1"
                   " -device virtio-scsi-pci,id=scsi0,bus=pci.1"
                   " -drive file="
                   "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
@@ -1846,7 +1848,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
 
     data.variant = ".acpihmatvirt";
 
-    test_acpi_one(" -machine hmat=on"
+    test_acpi_one(" -machine hmat=on,acpi-pcihp=off"
                   " -cpu cortex-a57"
                   " -smp 4,sockets=2"
                   " -m 384M"
@@ -2123,6 +2125,7 @@ static void test_acpi_aarch64_virt_tcg(void)
     data.smbios_cpu_max_speed = 2900;
     data.smbios_cpu_curr_speed = 2700;
     test_acpi_one("-cpu cortex-a57 "
+                  "-machine acpi-pcihp=off "
                   "-smbios type=4,max-speed=2900,current-speed=2700", &data);
     free_test_data(&data);
 }
@@ -2142,6 +2145,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
     };
 
     test_acpi_one("-cpu cortex-a57 "
+                  "-machine acpi-pcihp=off "
                   "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
     free_test_data(&data);
 }
@@ -2227,6 +2231,7 @@ static void test_acpi_aarch64_virt_viot(void)
     };
 
     test_acpi_one("-cpu cortex-a57 "
+                  "-machine acpi-pcihp=off "
                   "-device virtio-iommu-pci", &data);
     free_test_data(&data);
 }
-- 
2.49.0
