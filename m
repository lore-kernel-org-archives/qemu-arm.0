Received: by 2002:a05:7022:698c:b0:8b:e46e:3391 with SMTP id cj12csp64676dlb;
        Tue, 1 Oct 2024 00:04:23 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVS9Slcci/COmEcEzo9ylnkBHqznTSrt7mxmgrBmnJoU0SYdy7uKd9gdR5upvP7nkk0+WFNucDX5Bj62Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGb+lpLztC3ZS2WzL5qO3JQNkr7fK1Id3jopT1Gi39A3ESVE3NVItRV6DtsLz8gpZmI9iVw
X-Received: by 2002:a17:903:32c3:b0:20b:6f04:486a with SMTP id d9443c01a7336-20b6f044a6amr133534395ad.35.1727766263596;
        Tue, 01 Oct 2024 00:04:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727766263; cv=pass;
        d=google.com; s=arc-20240605;
        b=H2lcIFJ2+ITyMF+fLA90FnfGQecsgN0ew0vd9+9EyNLbqXdZ9Yx2xrXCY1XIuFg90T
         THOEs1myx0qRxuIXV0GF4msLo2/jmYdzwwolIydL0RXG9i+wiE+hg7F6TfvdPS5okZnk
         xuiAyQK+fVcm5Qkd56oardC8qXG9AGuMD9xsCsN7BaI4vHJixsI/FuErVEtGX86t4m6g
         txn5IezAwAFbhWxAok7hncvbyzU3VDBtGowi2xO9PwpSQf1bHNS9aaIbO6m60+zD1rL9
         v5QDn2uJl3ZcMST4A0JwXUKEdIoi8RM3oLqbTPEHnakYTRXN9PYYQuCpSkHILJamfH9p
         lCgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=fMFygYrzqXehNTe5XtoiBAQrrdAxUPN+PSgNRFNsPkM=;
        fh=rzGDMRJFBBrjbOaW7dLpUOdm+9c++WP8RCbD+hTQXmk=;
        b=D3YXwsOpx4+M0bMhAk5omzP19cGcOW8/BIan7L2py/PHGqlL4pnagwNUDkqchqaguk
         gOeAEuFzvsoaJmxSfAKIZu6XBul+9b6D9D0YKdVThoslRkfBdp9EG2UhxgC0OTT4XV8Y
         WSRdSJWs9oWdLytwybghP7R5/kEYYB8W+pVITfvSQNlu0+mt9jebcpatldzixFYFksH/
         wMGMXJyx7xAe24gfkB3J8aAW3a3rQBs2Tr5u5BlFzGHevFCZcJdAPANvzH0cP8Vy1Pde
         xV6xxhNYNncHge/nOscXZKAa5Rx/fQfxfQRIX3zabDy/FXQBcATgyiYmc73j155fLU7b
         dmgQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nX6vCR5R;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345351-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345351-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345351-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id d9443c01a7336-20b37e51a09si104206985ad.363.2024.10.01.00.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 00:04:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345351-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nX6vCR5R;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345351-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345351-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 818EFB22437
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 07:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0401BD017;
	Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nX6vCR5R"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1581BC9F9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766251; cv=none; b=k0gcAuqaSXoPKrUhBRfaVTuhD52lmkn0xrp+f3xPGBJP6ZmiLou9cR6vC57J0VGq5G0Rhj01Tzbqv2iciXuns5uDf6Iom6maIOhhnD72DvXdKLj0yj+OB5pLJ+6+c/1mQ2Uq63qzYH0TRRO+YG3Tai9tyaw8fH20xpZ3AwERSz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766251; c=relaxed/simple;
	bh=OPn+v+8+BveQRdEyioQUgXVoI5BFnHOQMXslK4VQRmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rsYS4HqfNm9gxtEAanw38heF1g8/A53z7BWdtj4h2vBlRNurJsJcmtO2VzA3T4kxAmc1J8KIfMCX/rk+r9QJPu8RVS3gMiBKbaZxzUVrnlEHL4/8ga1ACk/swjovM1iN+5EY+kqaV/nkrH5jYmv64Qbeu+VE5Q+y1/nv9faJUgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nX6vCR5R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3B5C4CECF;
	Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727766251;
	bh=OPn+v+8+BveQRdEyioQUgXVoI5BFnHOQMXslK4VQRmM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nX6vCR5Ry8sK/PUt1JzItEvx062H3XhEucp8Rhka53c8x/0JqWIT0p380FeK3XL4E
	 XkAKf1Blro7LrHPrnnqrsfDhhl1VNoesmb0VaT1+Eulwb1QDnrm6Ye3N7GItVRu5//
	 gnJPs2kh2+Oe62QjUNpu6TNn0n0w2HidemsIEhey2Mpwa9pMLuuoMqY7I7uRlF3jL9
	 Mg6rjW1khLrmC6kvCLrav/WgHdTIq1+ed29jDGlwAmSlw6yytDznnvYYg2e9edFoR2
	 +WgpkpdjTNYOUBh6Sj36+ZEnb8jQ/1VryyhkN3tIcIpqO0k57OSJpRdrvzA1MBipW0
	 gczzKdU5vfU8Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab@kernel.org>)
	id 1svWvY-00000001V0l-2CWy;
	Tue, 01 Oct 2024 09:04:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 06/15] acpi/ghes: Remove a duplicated out of bounds check
Date: Tue,  1 Oct 2024 09:03:43 +0200
Message-ID: <ccb2123649c35e0a268b9745e9b295c8208e92bd.1727766088.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1727766088.git.mchehab+huawei@kernel.org>
References: <cover.1727766088.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
X-TUID: nFvuMkJS3a3X

acpi_ghes_record_errors() has an assert() at the beginning
to ensure that source_id will be lower than
ACPI_GHES_ERROR_SOURCE_COUNT. Remove a duplicated check.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 29cd7e4d8171..5f67322bf0f2 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -404,9 +404,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
         return -1;
     }
 
-    if (source_id < ACPI_GHES_ERROR_SOURCE_COUNT) {
-        start_addr += source_id * sizeof(uint64_t);
-    }
+    start_addr += source_id * sizeof(uint64_t);
 
     cpu_physical_memory_read(start_addr, &error_block_addr,
                              sizeof(error_block_addr));
-- 
2.46.0

