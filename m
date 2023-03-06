Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4393286ejc;
        Mon, 6 Mar 2023 00:47:18 -0800 (PST)
X-Google-Smtp-Source: AK7set8Gaa7cxE9aAfGZoy679+j7Rqq6Kpi+24ltME2JBjm5E407vsxbiUwMQety0slQ5QdE20U8
X-Received: by 2002:a05:6214:21a2:b0:568:89e3:c5ca with SMTP id t2-20020a05621421a200b0056889e3c5camr17183105qvc.13.1678092438184;
        Mon, 06 Mar 2023 00:47:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678092438; cv=none;
        d=google.com; s=arc-20160816;
        b=QZE2Q2PBX/W9RZNfA954y+dm8TucGRdpxVcxzjBWHPGfkKhzsljJ1UEcOqYvZ7C11P
         r2Z/EgOgbP4xAsWzI2+/JnN7pUmOr+JE0zjVpWjgg2fS29lPcbhKPAMpKL3JeierWmXw
         lTlrVWNkCqmAQuDGEcJOCXnJy+lqpjuEKICzIha6vCWf+KDnLwWrVkX7DhvfS1/vswOb
         eytFW0xhmcoRVbJxXaQaimzyiNf9HuwYJJ8Ux9NN32DeuVSTvMevbCLXFj+YX6JJo4H4
         Rm4BwgZwXcTcM/JqICFwMwRAkqYjn8vAysKVSGj0BnSi8ESYuiYj2u4tUaapQDDGBtzy
         IDig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Tu4fLVUa5CKH9yGWFtuNR/Tn/c+l+6gsZNxsu/a/pnc=;
        b=MVUFU8a7iEqMn0WQP720AHreu5jrokBTTiAcVZ2HP/w6ERlCoP9vcpJRtaKe3X9Wnj
         Tx66S3jXb0qzhEY199RllI0NqBxeyry7eTKo4tO3WTCZ57Gz09vvYHwiIg+AdUw99t3A
         uFh/Ht+294yYctziiSaisAe3xeSpuezKnThUcZdTSk29G48xZk/48HkZoQPGe/NXiqal
         HsdLbDHqQsemadSRXBsNattv5c97f67hSv+/lGQCuX5J2Wo9d5FA4Gf2hkmM/qxQSM9U
         0Kl5v+nk6DPjubpGggWhzQVqX0hotZ1gI46gpK9U1DAyoEw3kECvxJqNgInCDTZj5h2e
         wduA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ByIlNLDw;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id o191-20020a3741c8000000b0071d18e31edesi6263859qka.166.2023.03.06.00.47.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 00:47:18 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ByIlNLDw;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678092437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tu4fLVUa5CKH9yGWFtuNR/Tn/c+l+6gsZNxsu/a/pnc=;
	b=ByIlNLDwb6LDeAYU+vUZHPccOcfthy0mS9BpjFlsIrHH8CXMd58EPcbp7MM/QO7o8/Mild
	TLoa86NJ13xrie3btLLnWHZYhSmyrncL/SegN+/whM49QdsCzIXJg8009GTL9rJrfSA3V+
	QbwoWyCpvIgS9HdeYh80k7Qft3gN3Zs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-cbgnrg-hNoiPEn6lO3Smbg-1; Mon, 06 Mar 2023 03:47:14 -0500
X-MC-Unique: cbgnrg-hNoiPEn6lO3Smbg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54444185A7A4;
	Mon,  6 Mar 2023 08:47:13 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF4AC440DE;
	Mon,  6 Mar 2023 08:47:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Daniel Berrange <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH v4 4/5] docs/about/deprecated: Deprecate 32-bit arm hosts for system emulation
Date: Mon,  6 Mar 2023 09:46:57 +0100
Message-Id: <20230306084658.29709-5-thuth@redhat.com>
In-Reply-To: <20230306084658.29709-1-thuth@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: hGA8NR69Edjp

For running QEMU in system emulation mode, the user needs a rather
strong host system, i.e. not only an embedded low-frequency controller.
All recent beefy arm host machines should support 64-bit now, it's
unlikely that anybody is still seriously using QEMU on a 32-bit arm
CPU, so we deprecate the 32-bit arm hosts here to finally save use
some time and precious CI minutes.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index c4fcc6b33c..f0de517dc2 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -220,6 +220,15 @@ be an effective use of its limited resources, and thus intends to discontinue
 it. Since all recent x86 hardware from the past >10 years is capable of the
 64-bit x86 extensions, a corresponding 64-bit OS should be used instead.
 
+System emulation on 32-bit arm hosts (since 8.0)
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+Since QEMU needs a strong host machine for running full system emulation, and
+all recent powerful arm hosts support 64-bit, the QEMU project deprecates the
+support for running any system emulation on 32-bit arm hosts in general. Use
+64-bit arm hosts for system emulation instead. (Note: "user" mode emulation
+continuous to be supported on 32-bit arm hosts, too)
+
 
 QEMU API (QAPI) events
 ----------------------
-- 
2.31.1
