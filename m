Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp304666njc;
        Mon, 19 May 2025 23:43:53 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWUC99Ifb4Vl5xOQ+4bqBJ8sbEO0T54x0XeS+NnyWrl29WNkWFbXPtVoQPeUaF1MRJj8DTFt4jWFt/TTQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFLK2CUYyY7v/yIoHfUn4wV+ynybtNicEFxEinPRZ3DvrFqrncjs7D4qIPyfXjMPqTIyNbF
X-Received: by 2002:a05:6a00:9186:b0:742:4770:bfbb with SMTP id d2e1a72fcca58-742a98a3213mr21127845b3a.18.1747723433358;
        Mon, 19 May 2025 23:43:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1747723433; cv=pass;
        d=google.com; s=arc-20240605;
        b=QZ+FmUolVJMc6IrQAF1Ff2KddAAHoyvCRMAiqrFYpSybwybqS3BnupbhFtXH2QR6Wr
         C8Un+XuvZAjv9PJGGwXA8w474o+T/KqlhGXPYi3mR6YyLWD6c2vQR/O/Yphl7XHzby3E
         gn09GXEcbUCOL5ncMTpYm9El9+81sTMtNWTsYdW8GGFksJAl4KWRsrv/v8gJrYoG/Y2z
         ff6hjyfTA08Nwlt7UU6iSdWihA1gti+Mgq9HPuh4MpXUjpo2DFAjSJGEE1i2NETe1IoL
         vvJrggCjcwEfoVRlj7ICKsWqq1iaUsCwk297dOnFpRE+uFcKCO6M/V+MTkyAwdUcBX1p
         ACwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=hM8KsqvVktOTEz85d8mYvg0nzuEJXwhwywzTGIsm7Iw=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=aWkf3Pxgt3yIBpLFY/z/lll3r7sY1FbYwVtC1lT64UwhoWkFGZv12+pSIxcu7OPM5F
         K7U4/CGl72xrKFP5zCTWbLR3CZs7zQA2L0qPuzwJFNderaail3g4oWbDpA+I3ssWJ4jL
         wNKgiGe4ZP25vjoOxtL5M9GkLuXh1OnNvI0IRGzMUGFUoaDzPfS9P+qKED1KuHyamqfu
         kBZXLZAtmuihFTrEU72M2qfUkdEsbLcVBHCv/syL+w9A8GHvzdO6S3XgmaKbXfFlCL5J
         H+9ZfqW6GuLZxqYiv4Y69VAmUp6oEzbunbpv1gC44TSJ3oNppPDJpNmw29AkYUX1UHy4
         dkTQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=KLKb6LBx;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655021-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655021-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-655021-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d2e1a72fcca58-742a97c9f0esi12494467b3a.177.2025.05.19.23.43.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:43:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-655021-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=KLKb6LBx;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655021-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655021-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 262A13AF40F
	for <alex.bennee@linaro.org>; Tue, 20 May 2025 06:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C698325F961;
	Tue, 20 May 2025 06:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLKb6LBx"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12D125D207
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723316; cv=none; b=ES3g768fPSLnRKZvbFd7RoS6uKIEkt4omN5/TddXpDDgWnvFcnvKS7LLZuefqkUm1Ot82wctBmDOFWMtq9hWwutzcqZIDRvOBUXeWQ+VSwBIA9EuyaOG4jP5kFvcGiOuRm0GgW2F4hpq9PhAwDd9BWO+hRkJgdJ0cTZjGamLDMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723316; c=relaxed/simple;
	bh=IADrYFANwdNZ1rY1HT52KolBlScr6ckE6a5syaX5oVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZ7cUsoJnqRy6DqJ10WiDydYPHxqTi72Kjm33muR2TYFhJeHaMvV4tjaPo6bLWFCy2NeOf9ijLIEaKQhX9utOYfCX3zMt10cuR/8eAAQ3MOuIsA6FgeAWVyMQNxm5tJXWxWokium6NLvA5bp+L3SdJKWBD76sXDqv3ij9lG8lWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLKb6LBx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206AAC113D0;
	Tue, 20 May 2025 06:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747723316;
	bh=IADrYFANwdNZ1rY1HT52KolBlScr6ckE6a5syaX5oVY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KLKb6LBx9+wa0kdXu9DUcgc1FxvFFGfjcLsFERtpvIswEDUtCpd7wFO6X04E+7rNI
	 WVKNvEBC1CemouxWpUuyIYSXCGQBe7Zw082peTrq7LnDHNv7wRE7GVc5nzsS4/JQut
	 9aD+gUkqMOlp0iDptZjYvSekY4azAH/xA6vRhg63BCHE8UN7q2569MtVv5IIJRfvkD
	 xkL0vi7sK0IxSrH96yJPcoqIK6Vo81sjtWxcTrXj3GQVJT11V9LhXM2sk0TYixbVVj
	 3OpBJNLTOK2zwpHRuducqpLAx/XGU6OmDeyaoEBGvnm7GudrWOzQI3CLeJDzpDBm2E
	 4aWiHjwqwAk9w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHGfh-00000005qtA-33Xg;
	Tue, 20 May 2025 08:41:53 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 03/20] tests/acpi: virt: update HEST file with its current data
Date: Tue, 20 May 2025 08:41:22 +0200
Message-ID: <a98a8eaad20d0674d880cd2925d66c29f5c6e757.1747722973.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747722973.git.mchehab+huawei@kernel.org>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: hfUqIpwy94yH

Now that HEST table is checked for aarch64, add the current
firmware file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/data/acpi/aarch64/virt/HEST           | Bin 0 -> 132 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 2 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/aarch64/virt/HEST b/tests/data/acpi/aarch64/virt/HEST
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..4c5d8c5b5da5b3241f93cd0839e94272bf6b1486 100644
GIT binary patch
literal 132
zcmeZp4Gw8xU|?W;<mB({5v<@85#X$#prF9Wz`y`vgJ=-uVqjqS|DS;o#%Ew*U|?_n
dk++-~7#J8hWI!Yi09DHYRr~Kh1c1x}0RY>66afGL

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 39901c58d647..dfb8523c8bf4 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/aarch64/virt/HEST",
-- 
2.49.0

