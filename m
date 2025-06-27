Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp788407dye;
        Fri, 27 Jun 2025 02:59:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMMENxsXLqiPC12xuMV6Q5wJVmqekVvPF3LbzWH0nh5m1+o6Qc7JXYpGpVEKf7e7BBQHFx0JaSjqRroQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGKNh1yza8MQA52XVzg05H3jevA1jrRbwHOsCQVmodcI49TYKDvpXDO5jktDlu4i94qc9/8
X-Received: by 2002:a05:620a:9d8:b0:7c5:4278:d15e with SMTP id af79cd13be357-7d443994f2amr275558785a.33.1751018344703;
        Fri, 27 Jun 2025 02:59:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018344; cv=none;
        d=google.com; s=arc-20240605;
        b=J9ItcxiwjcmGaq/Kfg69NrpprtxRjdukC2nns3D3FYxF/5BcDo7/YVcfepL6P9JfCY
         7DbzHoODrlknY7c6PAc1bp3QlczCoIiojESiGBQGLRppfTgIWBB57DliO2zxbTxFcZ22
         jGyC/v+bOaiO/kKGhbQyPM1eOumJvQObi7S5lVLrDdiq0lfpG41UdAoJkZMu22Q+3hhl
         AqxdH5TryvqGViuhlTf1kllW5jYPbYm7MJvNtodupMs5VblxsLOsf3/3Swy4njjtwV7T
         QlOHmDEduJJ2+Mo4+fvp+iFvtaw+yz2FNbA5VqMRl6CMQZfF+6SG7KR+SHxxTeXf/jJD
         DeEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=g7aV5kYUD3FMHdr5gwVD7bRiMIzO9kLW9pomDugGafM=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=CvSA+YQtXG1XB5qwVOZ7vjTwz2zdGCiaPsk3GyKF/qfsxdh+fR/E2foHSY+nu/WHN5
         a2gZiBhnQ1wWNGw+VCQ2b+ik+B418LY+H35WmrFQLuLFbLCoBDdZe42COOayYy8rmQXC
         Pbs6XqMek0r0QHrh1yHwGrB5AtBw09+Fo5JLCwSDgHzyYRF68QmgKdruKAGkKjxqjA3/
         OiMODdHdLrqe3flpfRd2uUj5R9A+vDYHXhp9zGvw86Xs67H2/gb3r6yNNZK8NymQ19Z1
         CCBU3UHGuP4j5F1YRasSlltYIFr1pChiNgaBVAg8FVkPKsHo8YBsYhxsVFwgWt7/MM35
         qTBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="H/2BaRc5";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d44324e16bsi199325285a.379.2025.06.27.02.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:59:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="H/2BaRc5";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g7aV5kYUD3FMHdr5gwVD7bRiMIzO9kLW9pomDugGafM=;
	b=H/2BaRc5e2vXRmeuuwXsO+TlFcAjKzIDf27sATs6bOniZlq+2GMTcURyLcF+aOdd1FeGjp
	JNQ5cHCB4er9gNUGD1YrnC1bw2VjL1AaIBE/4sGde/nGrCEu6wn3P1tftYmkPe4HtVRDrU
	o/oV5ewiiFAjEMiL373UytrzZuF3vmA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-113-6NdjrTPTNdOZcOQ7swWITA-1; Fri,
 27 Jun 2025 05:59:01 -0400
X-MC-Unique: 6NdjrTPTNdOZcOQ7swWITA-1
X-Mimecast-MFC-AGG-ID: 6NdjrTPTNdOZcOQ7swWITA_1751018340
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3CC7B18011F9;
	Fri, 27 Jun 2025 09:59:00 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A8AE219560A7;
	Fri, 27 Jun 2025 09:58:55 +0000 (UTC)
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
Subject: [PATCH v4 30/32] tests/qtest/bios-tables-test: Prepare for addition of acpi pci hp tests
Date: Fri, 27 Jun 2025 11:55:19 +0200
Message-ID: <20250627095620.3300028-31-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 8iafgtOxPWpN

From: Gustavo Romero <gustavo.romero@linaro.org>

Soon we will introduce new tests related to ACPI PCI hotplug and
acpi-index that will use a new reference blob:

tests/data/acpi/aarch64/virt/DSDT.acpipcihp
tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3 -> v4:
- switch Sign-off's (Jonathan)
---
 tests/qtest/bios-tables-test-allowed-diff.h      | 2 ++
 tests/data/acpi/aarch64/virt/DSDT.acpipcihp      | 0
 tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex | 0
 3 files changed, 2 insertions(+)
 create mode 100644 tests/data/acpi/aarch64/virt/DSDT.acpipcihp
 create mode 100644 tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..02f4f0b29f 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/DSDT.acpipcihp",
+"tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex",
diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpipcihp b/tests/data/acpi/aarch64/virt/DSDT.acpipcihp
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex b/tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.49.0
