Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp788056dye;
        Fri, 27 Jun 2025 02:57:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgwZWxcI0Z/aq+Ik7rxv75XLvd+Vy9GjfkNPsKA3j3BxnBksqgVO1WOxqs0Zk9x/0FQlWVryBgLSSslA==@linaro.org
X-Google-Smtp-Source: AGHT+IFIIQIEaautkErKjXf+6NrIKCrmPtuGIjNOMZRhftQKlkZZIcP9PNqJsv2HdBPvWtz8Reqq
X-Received: by 2002:a05:622a:246:b0:4a7:896:f2d3 with SMTP id d75a77b69052e-4a7fdac45d2mr35884391cf.0.1751018279393;
        Fri, 27 Jun 2025 02:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018279; cv=none;
        d=google.com; s=arc-20240605;
        b=MLFC5IWK7kbvp1xuBmfg5P4MxtYy8hE7j+Jd4fqnXaq6TwGmP4cpn8ves5gM+0PnpT
         3nwUHk2wh8clonJNF5ju3zPUtWiI4hVV5ffg+ByXVvrGQBk7BJ1w+UVrtsMd0Jiv0oQq
         FIg2MbKBGi0K9cqrosgyyc4H3Pkf2326jgfcNzUlXwk8dDBX5W7s06kky0d1/LmO3Tyr
         dLgVeKYPLFjphC9/cAIyT6esqOopXArMS59ho60gjP+EpqcIuU+sZuZRDGyPbnzHEzMx
         K7ayMay182TilUenDwwImoOogmP3y1s2h6wvvfYobMdLSODCS6uujo+XYtcpi3wqflmO
         DmSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ziOUa81RIwAE5bBty2NMnWKjPemISaPSgr17obqVeOs=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=EMyJdEON/O5h5eJLzlt+ShbBQi+p4LI0g71XpKN1eFIXDy3nvUMnAbBqE67/f+0WZO
         Axx6Bv0qFHXlt67l/RFljD3fCmqva9IU794xJUhhwL3EixncM0+gDr7XxV3m/W5mAQtg
         OU+1lJcxktMeNiRS+6j7XxfuRRvtO74ROvBiFgNutCWlBOgf2LmTcVmR6fZE4RlBkm+f
         DWn3QAFS5JWy8g2mZ+PEzNSFeGP+80/RGO1hBHQxgfeSwth75glmzXqr9kv5W9ey+EcZ
         ft52d2Z9DBNZsYS93U0GgYFcRvhsYp2yRnMU4Nx/YTxh+IOJ/Z06pUx1Zx87M6XMjCgL
         ssaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AYiGaACA;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc576deasi20336731cf.584.2025.06.27.02.57.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:57:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AYiGaACA;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ziOUa81RIwAE5bBty2NMnWKjPemISaPSgr17obqVeOs=;
	b=AYiGaACA4ApzMdP9VLzi9O/TYXZvjq9JQB1peJSiusq9u14lzltG89JtRMMnt2RGtFo9Bb
	EVOcTcHJF4MpibJoVIo5O86iLDfkQhxPOf9+8KuRb4amvKmIlL2kRgqlas762E/a0lkKB/
	AWo18ktm3fTmzx/vzPX7n2qqFUd70AA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-193-17N9FomzNi-RDhICP75HoA-1; Fri,
 27 Jun 2025 05:57:55 -0400
X-MC-Unique: 17N9FomzNi-RDhICP75HoA-1
X-Mimecast-MFC-AGG-ID: 17N9FomzNi-RDhICP75HoA_1751018274
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2A9AA1800290;
	Fri, 27 Jun 2025 09:57:54 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BC4CA19560A7;
	Fri, 27 Jun 2025 09:57:49 +0000 (UTC)
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
Subject: [PATCH v4 17/32] tests/qtest/bios-tables-test: Prepare for changes in the arm virt DSDT table
Date: Fri, 27 Jun 2025 11:55:06 +0200
Message-ID: <20250627095620.3300028-18-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: uFizVtwNBaZG

From: Gustavo Romero <gustavo.romero@linaro.org>

This commit adds DSDT blobs to the whilelist in the prospect to
allow changes in the arm virt DSDT method.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
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
