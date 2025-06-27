Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp787705dye;
        Fri, 27 Jun 2025 02:56:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWI9+uGu3HikUVVCsKBv8D9sdN4igv6Wtz0qz/CJd59Ilm01Cd5NO7KwkQW9PIF+RvmqVPnFheQf3BCXQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEnlUPfD7062qYnoG16FtPXVbkW6o/T9+S1jjhuUnNnXeQDPVJD2yA6YAqisYW8BMoC5uKn
X-Received: by 2002:a05:620a:4623:b0:7c5:405e:e88f with SMTP id af79cd13be357-7d44391a285mr370939685a.21.1751018214948;
        Fri, 27 Jun 2025 02:56:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018214; cv=none;
        d=google.com; s=arc-20240605;
        b=KeUcQM4udpVTRiyP8bDwUVWW+iEOWa2pqHA46M21bTyGrDETC+7TBFEokwaEQKTsmf
         Ff24v4DqeClrfERfNd3mmB/qdjJWSeWYjnIKgQ+H0bz8SoC+02WKGDiBhv56Q+oK9Jya
         Ff+FWJDRAY/6ssAUDf/2uONE8Alyd4K4+T/5/PxvgL40DBfiYcUcdNYZFMaefpdn6hFR
         Fr2qdcG/XJzPFaU2jWHJhP3mS3F7UEYq1idyeckwwWGzaky9J5QzIKhiqMMmpN9Fy9X+
         8CmCscZa+fddSgew56PFLSPqJCH7Gg6TUxCVRO9kueXa07FiewoKjwsIUQkQJBkuKDR9
         qgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0BaxeOnHXIUQwuoJrhSzXIiwHPjpUaxWi3HguO7u80E=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=bDth3slITdUA4yz8KkfoBlvqjSzyiAzz6G/k+GoTAWy5XyqZ2OA1kIJi2gIsu67BMr
         FRZx8MJUp/jctLcTQnP3jJ1b8hqRH8123SFXzWN8eeizSW6jP/AVCfRD/1sMdOFRFTAr
         YY/dyBIrHTkfkfFFAK8e11OglUUV53+WHxiXakBa+4rE/+xpGL3tMqNcOaAAfMU3zTGc
         6HG7GFObfqHExmt0J5Whcnl1dIy6kfBe9v6QxmRfqMSt7w/XBuXQAB4yQubAngP5o5lC
         JMg94ajoIlbzjf1y0Ai4HxF5MX0F85JPTDP5Yegx92ZqK1hXoorVBuDo86i8NslmlrE7
         wUJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i6RO47v4;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc55a58dsi19264291cf.545.2025.06.27.02.56.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:56:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i6RO47v4;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0BaxeOnHXIUQwuoJrhSzXIiwHPjpUaxWi3HguO7u80E=;
	b=i6RO47v4IwdXmz8mFTowP1nlGzUd3e8ZFNacMiE/i/hIHB+W6KGOjGa7Vn7dBXOCc0FHDl
	tU/Pv8lvLWReqG3ZEII7/yWf6IxO4Uni+OnQfM37jLWYVjNnt2QRvp/XbgsU7BlVUBjNOj
	Vpv+KhP2Xf1fpD1E6rpbIj0xhnb3Lng=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-381-H_iS1RfMPtOSGEMibjXXnA-1; Fri,
 27 Jun 2025 05:56:50 -0400
X-MC-Unique: H_iS1RfMPtOSGEMibjXXnA-1
X-Mimecast-MFC-AGG-ID: H_iS1RfMPtOSGEMibjXXnA_1751018209
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 22B981809C8A;
	Fri, 27 Jun 2025 09:56:49 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0B1EA19560A7;
	Fri, 27 Jun 2025 09:56:43 +0000 (UTC)
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
Subject: [PATCH v4 04/32] tests/qtest/bios-tables-test: Prepare for changes in the DSDT table
Date: Fri, 27 Jun 2025 11:54:53 +0200
Message-ID: <20250627095620.3300028-5-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: ITDucPLyB+7a

From: Gustavo Romero <gustavo.romero@linaro.org>

This commit adds DSDT blobs to the whilelist in the prospect to
allow changes in the GPEX _OSC method.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>

---
v3 -> v4:
- add missed tests/data/acpi/riscv64/virt/DSDT

v2 -> v3:
- fix for microvm
---
 tests/qtest/bios-tables-test-allowed-diff.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..333e5acf63 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,8 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/DSDT",
+"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
+"tests/data/acpi/aarch64/virt/DSDT.memhp",
+"tests/data/acpi/aarch64/virt/DSDT.pxb",
+"tests/data/acpi/aarch64/virt/DSDT.topology",
+"tests/data/acpi/x86/microvm/DSDT.pcie",
+"tests/data/acpi/riscv64/virt/DSDT",
-- 
2.49.0
