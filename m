Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp505856dyc;
        Thu, 3 Jul 2025 05:39:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVliKc6/vt3BmDZ5ZFZZkvTDfjWFPMXMB9SnV28t9EJ16JRJU1uJIEqrZ01jhbdzhnGuudZfL2jjq/BcA==@linaro.org
X-Google-Smtp-Source: AGHT+IF8ornAewuOclAkeXA9no6EDZbYbKq/1taxFFtUQuwzeh+a4U6e1bRjOWuOg8Yt385HN6Wk
X-Received: by 2002:a05:622a:2446:b0:4a7:937:4620 with SMTP id d75a77b69052e-4a98aadc67amr24989691cf.1.1751546351578;
        Thu, 03 Jul 2025 05:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546351; cv=none;
        d=google.com; s=arc-20240605;
        b=gczj8mH9DwZbLKQv2vfxcmRRqVZSOMmvzvafB5RJO4YCC/F0qcRS+4G3FSvTHueZON
         8rFcEzcUnKtuD2f/Szq0CvcxWdUJm7KSf4N3vVkA+hziWfJWhOoGy4voofMZVxHG1BC4
         SCN3E+hKSSGpaVFWvktnld6R0aWyW4eOpzxcYX05R8KY6QfQeNAQdvXNvtlriHXRe2lU
         m7iGKpvzC8t1XdwlQJegv/becOcooxK1BeuJSkKdYYvRYfOibzFhEJsF2xvTS9FS5G1J
         UwPptbLZ7ifwb1AlRBdziKt12vNrIfI4yJJcvXuKsny7JNmhLN2bU84opSYJvNFdHpp7
         ECXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xtOaETdT+OzB8/uzWs2qQJyGrnSrz5iPJehNwGXOQHw=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=CIARvgzSccr9DztDHANPIKHZoMnWjIk3ylrBj6F48F2ouUYlwnFCFgQwafGJmguiN/
         XfpMk5qFsgXGeEgVyRBXj8UPzca6CS+j9J8vlkaQ55O5WlpT5HvB7RtKWHMtXtIzgne4
         mKBqgqt/q6EeRz8Up5bCrgT6vFw2Zon9g4ZKN/XUCgPQ32z/B0hZaTX1nPoVord32zjw
         YG3WBTlFYTgF81Z4t36g8ENq2juyR1V+NrkL8FWuYge0gtqd7lWnfAHgnc4JfJtzPIeb
         V3m0UUHr48lWkbuZ5L2JYKRdLHq6wGJq89Tobu9cnoyy8C4TpKhy3/xiKtNgNYMI3JIH
         s7tQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Drtw5v9e;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d44322818asi1380070385a.206.2025.07.03.05.39.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:39:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Drtw5v9e;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xtOaETdT+OzB8/uzWs2qQJyGrnSrz5iPJehNwGXOQHw=;
	b=Drtw5v9egekJd3luB6SvJhbVwYl18GpQl6gZp0HeUOtkre2ASD7I7avoSXEuPyufeVwYQl
	tLZlJJtdpLaWFp74TBu+Z/kU5T7DEAGfrizFf4w39a3N8zoTUwbEml2sWTw7UyvTDYCqmO
	u0U+ngKSAIb5c4tu8//fZX08pUyJ8AY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-JHG7LUgnNhGG7rxeiYBP3w-1; Thu,
 03 Jul 2025 08:39:08 -0400
X-MC-Unique: JHG7LUgnNhGG7rxeiYBP3w-1
X-Mimecast-MFC-AGG-ID: JHG7LUgnNhGG7rxeiYBP3w_1751546346
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7150180028F;
	Thu,  3 Jul 2025 12:39:06 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2BDCD180045B;
	Thu,  3 Jul 2025 12:39:01 +0000 (UTC)
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
Subject: [PATCH v5 17/36] qtest/bios-tables-test: Prepare for fixing the aarch64 viot test
Date: Thu,  3 Jul 2025 14:35:17 +0200
Message-ID: <20250703123728.414386-18-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: +aAuRzA9l0J9

The test misses a variant and this puts the mess on subsequent
rebuild-expected-aml.sh where a first DSDT reference blob is
overriden by another one.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 tests/data/acpi/aarch64/virt/DSDT.viot      | 0
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/aarch64/virt/DSDT.viot

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..7a74beab3d 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/DSDT.viot",
diff --git a/tests/data/acpi/aarch64/virt/DSDT.viot b/tests/data/acpi/aarch64/virt/DSDT.viot
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.49.0
