Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1740862njc;
        Mon, 16 Jun 2025 02:49:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4/dRgYdvmpZp9lY2aazMshyRClf89p56M7Yr/J7nHCxO4o5sUA5dyz/rJAysEQ96Z5JdlK/GDIVkaVg==@linaro.org
X-Google-Smtp-Source: AGHT+IEL062Xo/M+720lw9IH1ntqSFRqWofTEkRnxJu8poMlkeNhQImS9gwtVystJfCaXAWXqI++
X-Received: by 2002:ac8:7c4d:0:b0:476:980c:10a9 with SMTP id d75a77b69052e-4a73c4beb5dmr154849101cf.21.1750067385668;
        Mon, 16 Jun 2025 02:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067385; cv=none;
        d=google.com; s=arc-20240605;
        b=EVLkfVi/BB4c/n+yLQLBYyJEsjybLHnsUJ1Fdy6Ky/rs+DUkYR4J1Wih6baEolH25w
         4/6C5nFabSXIYJVHhBjnCp/PDRw3t9K0eZtIgEKqX8R5IO6L6q+6pzHaTndYt6JJEboh
         FiGHhoHUSSlEZ+wAJyp6Asi3hQCkvJTPp/k4UtXreIQRbkMVniDdGGvz/A2K2vL+/EhW
         7atWNOIJXjJ/GqtRCnHKd+ecf1q9u0IdAevQlZKpyqr79tJSBLOq8TEtzEpSAUbEV0ij
         lnv5jHCGN0IREjKHgXQPTR06nSLT02MbGwSSVm9vR70V4GupftzcyYSr1Kv72qpACN2S
         ym4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=c0ob/ge+2+9/MebFeYa5G8eVhUMyoDjj1cC3/UQUzpM=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=MSzLTAXqoOLCrW1WWdVjBvkHoUolf2RRIgC2meCuLe+8bry4yZJ5LZ30Qs9iCFNLNz
         c3A5fUpfjim3mMPZBytYmscDSrJGpZfVhwDFm1MKek1jUFOeuaf6CA3/xvgH41f9Dvre
         ct0XnF4SQPqQCitamWBHZAn1JEQZ6XgNAGtJNKB+WafxdL2YVtb8XnUEOUiJUs3uonk3
         J6+sEzbcZuv5JVDzD/GXdoJHpzT6H8JTMxEKJ3t4OnALz/6wfvgPWby+u21En0+TTNRr
         +25t+VDT6bT3dgLisn4omaqR+N+kLtWXT65D3iw/T4fDKrrU43qzH3FT+XZSYufSrfAs
         WkXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JTNF4jS3;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a47d283si92298651cf.283.2025.06.16.02.49.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:49:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JTNF4jS3;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c0ob/ge+2+9/MebFeYa5G8eVhUMyoDjj1cC3/UQUzpM=;
	b=JTNF4jS3aMsAUaKUyRKSgMzhPTR6zJxT9Z0kAQGmyjq/QFRJdN3qiSEeEkBiRdqpEExa4S
	b2Mugcpv6KwD3HvYD32T9BZKkObpNNK93El7u+hBqBg15VKeuK06upFp78kwyclmrDId3Y
	PWsqqO11NmSXJ0par6gYwLVj4U0Q3uk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-321-s2omJslSPm6ePLyeokSk3A-1; Mon,
 16 Jun 2025 05:49:42 -0400
X-MC-Unique: s2omJslSPm6ePLyeokSk3A-1
X-Mimecast-MFC-AGG-ID: s2omJslSPm6ePLyeokSk3A_1750067380
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A0F571956048;
	Mon, 16 Jun 2025 09:49:40 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4161C19560A3;
	Mon, 16 Jun 2025 09:49:35 +0000 (UTC)
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
Subject: [PATCH v3 05/29] tests/qtest/bios-tables-test: Prepare for changes in the DSDT table
Date: Mon, 16 Jun 2025 11:46:34 +0200
Message-ID: <20250616094903.885753-6-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: ELfVfRlm6C3l

From: Gustavo Romero <gustavo.romero@linaro.org>

This commit adds DSDT blobs to the whilelist in the prospect to
allow changes in the GPEX _OSC method.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- fox for microvm
---
 tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..75f057767e 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,7 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/DSDT",
+"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
+"tests/data/acpi/aarch64/virt/DSDT.memhp",
+"tests/data/acpi/aarch64/virt/DSDT.pxb",
+"tests/data/acpi/aarch64/virt/DSDT.topology",
+"tests/data/acpi/x86/microvm/DSDT.pcie",
-- 
2.49.0
