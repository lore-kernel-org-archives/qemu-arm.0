Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp506568dyc;
        Thu, 3 Jul 2025 05:40:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW//hAQ63mUVQFXjjvAtU+Cs0KGuUN9cdQYtN2rNuJJ4Z25+5u68aM6sAQX+hPaQ++xj/R/3ptcn41Egw==@linaro.org
X-Google-Smtp-Source: AGHT+IFqp2hPeyE8ZNkRqAf1EQ2+wkudrRZbc0QoYKR2Wb9C7M8el2Qc9/MgAb+yDLri3wOHHpXB
X-Received: by 2002:ac8:5a0f:0:b0:4a4:30e7:776 with SMTP id d75a77b69052e-4a97691a19emr115683011cf.14.1751546434350;
        Thu, 03 Jul 2025 05:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546434; cv=none;
        d=google.com; s=arc-20240605;
        b=DtQA/6cAGhUvMrhc+bphOpDarT2Lesm+Da3uGMTYkhElV7oRWVyYK/1df8wJTbrUGW
         ui7dXrs0OaJ7zYiDb1GF/DAmRPzUjfjbkXQ7X3Bg7cvRMupvIzZX1IyT3x8jCefl6Tqr
         n5EpU2gp4ZrY4HaqP0CheftoAxiZuyWlMoqp8myvXc7dsPCJPLiHAznsI3NxSjKjiYrI
         GNGWMeVyjGP71FXb0aTWGFGehFvvmuTJffIAHRqoJXTlgnxVEdThmvi+aBsGhQhILQ81
         yo5jGb04QMz2ITPme0AZVaeWqxURhM/+mIGfBXKxfIguNhOOQzpOjKRkUj5p0Z6ELlXR
         veoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KsfUkLon/+WAZ1K8J1yMGAMyGCY2Z1dhM4JRzV9aVSE=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=POJ+yjctPZOods7LMLXmmPgoX7nDKYIJ50N2rdW9dJZa+wu3jZ/0zl/hEqOj1280OD
         cdUiEPe6aWTwmU/nLzB/9P8haa2ukHpg+mlC2VLcyA+vWNNvLIPgEb9UeWQCqsH5yM0c
         v/80mtPtuK8daMjO2kNpnKwnaYtductCghr9xhYtkfnHPQy+3dR07ZX/WYa7kIc1tJUU
         MmXDPXvmUFO1YGhRYNFgkTotUqIRhes/vdKMq+lZHPpnw5g+6rkDowobgB5THNtHVn01
         LNxoXFGkdgLhpF8U4uNzIM7hIYsM7LkaajQUT/3MBs3RS8SGcWHmrCbuyR0fbe1WQsi8
         EZuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JNeuAcgP;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc0ffc0bsi158206631cf.25.2025.07.03.05.40.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:40:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JNeuAcgP;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KsfUkLon/+WAZ1K8J1yMGAMyGCY2Z1dhM4JRzV9aVSE=;
	b=JNeuAcgPUXXQ6erxb/4E31G0krwp6xisL9PvxXyfC804YVWqaeF20LuGeRPOj503riU5Im
	2g4WyNVYuOye5/rApE3hVzVOWEt+vPPvR1kPqg48EngXobgQKRXnhYCypB5a4iG9JmT0if
	UgjS/Gi8OfrgjIYOrGWgLxJpmoHu87E=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-W0Nb-Q2JP12wPRUbdXJ3vQ-1; Thu,
 03 Jul 2025 08:40:30 -0400
X-MC-Unique: W0Nb-Q2JP12wPRUbdXJ3vQ-1
X-Mimecast-MFC-AGG-ID: W0Nb-Q2JP12wPRUbdXJ3vQ_1751546429
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E52619560AD;
	Thu,  3 Jul 2025 12:40:29 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CAA66180045B;
	Thu,  3 Jul 2025 12:40:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	Jonathan.Cameron@huawei.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v5 33/36] tests/qtest/bios-tables-test: Prepare for addition of acpi pci hp tests
Date: Thu,  3 Jul 2025 14:35:33 +0200
Message-ID: <20250703123728.414386-34-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: lG/Sy1XtgPTV

From: Gustavo Romero <gustavo.romero@linaro.org>

Soon we will introduce new tests related to ACPI PCI hotplug and
acpi-index that will use a new reference blob:

tests/data/acpi/aarch64/virt/DSDT.acpipcihp
tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

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
