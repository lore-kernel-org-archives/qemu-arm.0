Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4647802njc;
        Tue, 27 May 2025 00:43:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtC7PCtuG703tcSGZ6KyhOLJrF14M8LLz/2Vkq09s6yzsPacVWjfHLYqR/pmSwc0Sld1yn5sRW83MH0g==@linaro.org
X-Google-Smtp-Source: AGHT+IGb2f0slym+NsOiTexJZS6XJlbWTL+IRFFP4wWxtYcM8fUfgiYi/HJ/HHDlk95TRtVwFX1D
X-Received: by 2002:a05:622a:59c9:b0:494:b56f:b778 with SMTP id d75a77b69052e-49f46e43691mr190409311cf.21.1748331799110;
        Tue, 27 May 2025 00:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331799; cv=none;
        d=google.com; s=arc-20240605;
        b=As16a20OTgejuwDlBNk8e4gBezPxK3Bc8WGAYCMG5fR3riM+s/SfPtCkQeSt+bsLv8
         CyuKqRyg1uQDOZRUgGrzJC84i00R8MXLnbXeyUZa5FRuE7p1Fa1Tha9TNDHTWiKogUqh
         5skNYTKkPiADSjVXkYYdoPX9TeaItEd4Ox+YbXUXyjBctmq62bqHJtKBUFoOj6y+km3G
         Dpi8/cVxdM9cOcQZASQovB7qqPxfUXhLg/8EgqiZXPPcHIQJkKa5i98+helUR9Q5T+48
         BqYnWdimaIN80higtRsP/NwfpJDGzxL79evYV3xHHQEFbHBcvPhYWFeS5o3zqmLm8MDQ
         ty9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tF1iJUIKihbH7KCU/7khuSpxtgKzDnBPv3wHWLQfdvQ=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=WXPKilf3FflakI2HsqEpBx18iApjYEaMO7tBe4b5CXr5unjeeM5tqXNvSzGdH6CO0h
         ++IdxamhiraN6nWnZiDEYScNvIIWuVFByPVgXkeHjHdGkHXs7Y5AuMtZRNCGC6/Ko/wc
         jUsUMM99YtJyIecBMoeQP7ifxDxkai9feVQymyT6qnod9aYrVh+J974Bf42JUNgcxPYo
         QWFxkpknJQ94PbPk+zH6APX7/YQkgpVh9nQao8ACzQzi1mT5ggbGHgBv40lbKIHcN7cT
         7NUZjE46+Xj9cVw/3aeGvk75w+wmH2OibOXsa+po/opuEIWC6onCW815Cr/oCmMfhIl/
         8mOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OyYc4/Ro";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae597a7fsi262698021cf.555.2025.05.27.00.43.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:43:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OyYc4/Ro";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tF1iJUIKihbH7KCU/7khuSpxtgKzDnBPv3wHWLQfdvQ=;
	b=OyYc4/Ro8ykcRJ9oSY/H34UenlV9/5iNSY/eyIgL5pgXAC+baWb0b5ziaEicAeKlXpL4Cu
	bHczIOU/rOLlNC01BoDK/W4JmitdCBYW/xQSoqjIPgr+N3FRmAN0IiCBjPvPVPsD8Kqmvf
	S5ZcA/mRhrIgdu3PqAEPM5jenL6I7mk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-551--StOR5mQN4GsqnR0JKqBEw-1; Tue,
 27 May 2025 03:43:15 -0400
X-MC-Unique: -StOR5mQN4GsqnR0JKqBEw-1
X-Mimecast-MFC-AGG-ID: -StOR5mQN4GsqnR0JKqBEw_1748331793
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BCD931800258;
	Tue, 27 May 2025 07:43:13 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0E43019560AA;
	Tue, 27 May 2025 07:43:08 +0000 (UTC)
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
Subject: [PATCH v2 08/25] tests/qtest/bios-tables-test: Prepare for changes in the DSDT table
Date: Tue, 27 May 2025 09:40:10 +0200
Message-ID: <20250527074224.1197793-9-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: oAQqpojyWcT+

From: Gustavo Romero <gustavo.romero@linaro.org>

This commit adds DSDT blobs to the whilelist in the prospect to
allow changes in the GPEX _OSC method.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..abe00ad4ee 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/DSDT",
+"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
+"tests/data/acpi/aarch64/virt/DSDT.memhp",
+"tests/data/acpi/aarch64/virt/DSDT.pxb",
+"tests/data/acpi/aarch64/virt/DSDT.topology",
-- 
2.49.0
