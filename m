Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741541njc;
        Mon, 16 Jun 2025 02:51:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUvucm57SW8nwkF2/Vb0zYqx/aU3ZHSSZF7RO6caIizZmSFIeIf/HOhiSuyBmsfWUF9Vvnicfic8jMV7w==@linaro.org
X-Google-Smtp-Source: AGHT+IH9eqf1SRqqrJ0YAnJcuj6U23HYXrzyr731rYtWFiKX5VyisBjW3yfthSceM6hzQP7XAgfI
X-Received: by 2002:a05:622a:180b:b0:4a7:1402:3b0 with SMTP id d75a77b69052e-4a73c484a1cmr144315081cf.1.1750067498813;
        Mon, 16 Jun 2025 02:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067498; cv=none;
        d=google.com; s=arc-20240605;
        b=NG3QxGQ0o9reGrEpOGYv999tyR/i1MZHLEtzMS59kLBNs9jCmzaUH4UEVL7Vnr6Tl/
         S8aRKCDzPSdtAGkzb2Z82Sw2F2RV85+3q7VPCJUWZP9XB0kKLDGhsfRqGBkdm4Abb9Hr
         R/eS8MWmxph5N+kdIe+yQGLSg/7+sQxxuakUA8QxSAGiZKNiXjAOMtBrzkL84QfVkV+1
         AJivtVhwAj2RX3qOIYVhRm2vs4Fk/eNvUxg0B417dDvis/PwSlAykBkRNMVWfTiFBxte
         GrhgWYVDG3M0rNGp6UW997Jflvgx7pKRWc4595CLi3SlzKrC79DU5GjajkGSELgGMpYq
         EVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dGYAmK9CoBY9STCFmQcTFqo2Pa+hCuB3YNHCOpaO8mI=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=Mpe3JzKQpzn+Dea/fikDKqECagIyoipGnw6PmMvB7D04N8+xkRdvhvnH3jcaBrLdJU
         5ZHTMrHUrYnDtMFvl1TTfxMMwIr94e3kSbG2/kbH343pPPEjj2dZOe61cMNhPDTsE+rj
         SdUMINrpAUQJTAqwCQ1jVmvg2sh3corGauNRIjNU+BqbA8XiAxirx1CByOh2v3YSxHC0
         y+9Yo2duKvpiVSDbRVBq1IHMYOgj753/SvVlhl17BWnNc/IkuNh7hspEwoLIBJ/BCM9X
         DQVoBg6ufe3Un9Rr9RYTCIWSjOtgtezVVAPdljnSgxsiX91tfYEeb/5bFtvDBZ23xYte
         s1nA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bLSF+ZBa;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2b8f90si98215731cf.124.2025.06.16.02.51.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:51:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bLSF+ZBa;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGYAmK9CoBY9STCFmQcTFqo2Pa+hCuB3YNHCOpaO8mI=;
	b=bLSF+ZBajqoFdcGGHig8S0k4Em4xJVq+rS3h0OLEDeinRsjXAPyl1+AUFj+65RHBCL8+Vp
	cZ/BcDMkbRj/Kw9kmVD5vIVrGOAzsCZA0wJoSA6JnTKtdKQivIdjlzJzdpt74a3uJnw2Dv
	BKkUo413SeCWQu6t5tCTm7JBr1ZvrYE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589-EroQ7FfvNqSDD9JaE9GuRQ-1; Mon,
 16 Jun 2025 05:51:36 -0400
X-MC-Unique: EroQ7FfvNqSDD9JaE9GuRQ-1
X-Mimecast-MFC-AGG-ID: EroQ7FfvNqSDD9JaE9GuRQ_1750067495
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D941819560A3;
	Mon, 16 Jun 2025 09:51:34 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 78D4F19560A3;
	Mon, 16 Jun 2025 09:51:30 +0000 (UTC)
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
Subject: [PATCH v3 27/29] tests/qtest/bios-tables-test: Prepare for addition of acpi pci hp tests
Date: Mon, 16 Jun 2025 11:46:56 +0200
Message-ID: <20250616094903.885753-28-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: T7e9a2Tmyc8C

From: Gustavo Romero <gustavo.romero@linaro.org>

Soon we will introduce a new test related to ACPI PCI hotplug that
will use a new reference blob:

tests/data/acpi/aarch64/virt/DSDT.acpipcihp

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 tests/data/acpi/aarch64/virt/DSDT.acpipcihp | 0
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/aarch64/virt/DSDT.acpipcihp

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..dc3ab24d05 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/DSDT.acpipcihp",
diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpipcihp b/tests/data/acpi/aarch64/virt/DSDT.acpipcihp
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.49.0
