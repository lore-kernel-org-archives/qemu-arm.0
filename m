Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp505890dyc;
        Thu, 3 Jul 2025 05:39:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxYjT0nAyQrssG8b9d9OPw/WwjS0emX7+xZ+1ABjO0vEyk/afl60L5PxMBkUF23XuB9CId4WL5FrbH4A==@linaro.org
X-Google-Smtp-Source: AGHT+IHZS7hZfh5iuMVSCrqwjhlZkbdW2VCElcix0+XMxo+yY1xqbldPS+t3QjupmIuPTbl2pJsV
X-Received: by 2002:a05:6214:767:b0:702:b28b:d4c2 with SMTP id 6a1803df08f44-702bcbf5c5emr47929886d6.17.1751546354736;
        Thu, 03 Jul 2025 05:39:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546354; cv=none;
        d=google.com; s=arc-20240605;
        b=ZbtHfuTYnnf8c2G73NhGj6WXqH9++V2V5l3ap5pdpdWON+A3DnVJpx4aAL1c8jxiMg
         rSUTPORIM1hyD2vHWXhWmKw6R3N7QO1Gp4bJna37UtBKNRXMtrnqyGzdyQxIC0bg19GM
         UGeZymiq7Vipk0I73KBQTnpPYIPC/pczLtPTrDCMEs9ecr0pknhyxRRiuWh4SkXJK1SM
         1N1wF+NHetKHrdtP0wwaFiy3h7RZ8ovUAsiRVLYSL/EedGhk49nECZq5VolAOffBDx35
         qodEhhcMbTG7KwCuN5h48TPp1aVsBbRAe87lJdQ0sZIeBbP+/p+4V40pcMDIZ4vwpG97
         e6Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ns1XXIuT329ysuanSNEKOHp3b7TMKq7oF90LOXpUnIE=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=F7VLtLTWX6+oFx4/nKpCQp0fz/eZfv7CyOGWxcmIHmcpNqT0mOyxshtk82O/xemRhh
         t3yZ5R16mzQirDicuXkMvQ3GpfGKj076kQTCdmCyCT8u8nTNYWcD244dSdnYTYgKxmR4
         c4f8TYv8MKsPGb4FM6q9pOskr8UoB/p5eOGmrImfldxsoC22U8MUWUMofYlYTf4rGlIT
         CLq90ilafcVA7NKD+NOkkgjjlJi+vE7RSyJG1R+yAeaYKDQSKJFga76QRSFqnZfrDsYZ
         H1MkV0Cv3t6Zh0Eyen40KoU7OH6oSIdw53cXmpRCtYs70MSL7kugSqpWxThyjVTF3fZF
         FXxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c0TbGflh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d44327df25si1451525385a.482.2025.07.03.05.39.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:39:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c0TbGflh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ns1XXIuT329ysuanSNEKOHp3b7TMKq7oF90LOXpUnIE=;
	b=c0TbGflhXGhMkZfBc3lIfJL1uwOn0JYGbr+9EDMPZwhTI32/cFax14hEgkz5aW7YODvplh
	5lqKr5bWUvTTuWpRQDXihlaTuj6Lk98FayACL18beiuTNctGrjqPGpo07jvbOvKHYg2R6Q
	T6qtYQnzUL+8hiI9Bn59iTu/BheDPZQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-88-rkDMllXtOcWVCqK4g6-yqQ-1; Thu,
 03 Jul 2025 08:39:13 -0400
X-MC-Unique: rkDMllXtOcWVCqK4g6-yqQ-1
X-Mimecast-MFC-AGG-ID: rkDMllXtOcWVCqK4g6-yqQ_1751546351
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 99D0E1801207;
	Thu,  3 Jul 2025 12:39:11 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 37271180045B;
	Thu,  3 Jul 2025 12:39:06 +0000 (UTC)
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
Subject: [PATCH v5 18/36] qtest/bios-tables-test: Add a variant to the aarch64 viot test
Date: Thu,  3 Jul 2025 14:35:18 +0200
Message-ID: <20250703123728.414386-19-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: Mdu0TT1FV7Hf

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/bios-tables-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 4dbc07ec5e..357bcefd37 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2237,6 +2237,7 @@ static void test_acpi_aarch64_virt_viot(void)
     test_data data = {
         .machine = "virt",
         .arch = "aarch64",
+        .variant = ".viot",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
-- 
2.49.0
