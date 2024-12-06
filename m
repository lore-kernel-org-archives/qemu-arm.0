Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1013287njb;
        Fri, 6 Dec 2024 09:21:40 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWEcCBgfwSXGWh7Yae5Gi4W4rFiPZ9BbKSXYXAvx6NyVC5r/mhV+yA4za8yMU1xfYcQEKifojr4Ok91mw==@linaro.org
X-Google-Smtp-Source: AGHT+IEm8m7hVWxo+EAUVivZ5Ti7KEhUAiW6breR6LgaA12U1SWcXQckJmQvUI1LwnxVG6iHRVTp
X-Received: by 2002:a05:6a00:14c7:b0:724:5aac:173f with SMTP id d2e1a72fcca58-725b80fe7e2mr6779051b3a.8.1733505700040;
        Fri, 06 Dec 2024 09:21:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733505700; cv=pass;
        d=google.com; s=arc-20240605;
        b=dsSpqpS15uyBf+hq40EY5itz4hGiZ6arnnUvDlJjANP++AgcdYEJvTj09CFcsxqjK5
         k+7c7fFgD6k3cAK2fct/eWr8pvtiG0kpoDud4a5f5U48Rs0wFQoXCkWw4e52It99tyxB
         06k03qTw4okbd4RVPhxdNgCk0cr0W1K4MKIXjKIkZyCcbmvxquzScbeXD/kYWFpX9of1
         lZ0bHkIum+Mk0ebLc7FjaCaKW+hao43yFpHlLCIgB8mnw1DgHsqhKBFrjGE4P0bzXDNT
         OTi1SmyiuiH3irkJo8ATrU3WN43x49JjDrY7qdJfs0dHrPFqSRdbLRQVa110aNHMvxex
         fo4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=YtxYoWu+4rN8OxAnb3Z+UNJ6ZOdQdZn+0UcOBTQ3+1c=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=kTNAomZ1nEwQ1HH6AgtOuIZ0pEJ+ZVQISkKT47xdmhT3qE/ITPIGfSNyW1cY4+psRI
         wDRbfS9rCNivt88sZsOZHH+8CZ3gVhIFaZGyl6BP+sY47iIPoHcjUZtaXN9HxbPHHlsK
         V0z3M/6wYjuUKilBJsmwPfudKI7cj0VfHhalKXywa6wj5d49Jtui4STCkGSNrJUcyabQ
         pVaNkPpApbPAo/QAhs7xP16fRnL2Vj15CzQ6nh1CCpjEdjIY2x3/rkztWazVRE1PEnGV
         pWtFaiB5KoWQupxpWn3nDNYDVDxQvoYQuQ+gIsSSq/BdFFmmCNmP+/UF94g2mvw+92Ul
         +5IA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=BemPkb2V;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435383-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435383-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435383-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d2e1a72fcca58-725a2c8787bsi3787836b3a.170.2024.12.06.09.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:21:40 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435383-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=BemPkb2V;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435383-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435383-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9809528776F
	for <alex.bennee@linaro.org>; Fri,  6 Dec 2024 17:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25631203D4F;
	Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BemPkb2V"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D052D1FFC71
	for <linux-kernel@vger.kernel.org>; Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505687; cv=none; b=pTQ7GzjT1CLaNUCtjHyVoVbmMGbJnoNjSmPRICIimQxldaYPST+c6ijbL7GdRWwbe41YDjzXBiFry2uw1JW6PdWoUPXRGLQOCv0NTgd/ywftbS/n2zrD/6cuiwYpcaODCdbTI4jNoqrBDnGQHql6YX7aHfbPyDaqq+lvRur686w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505687; c=relaxed/simple;
	bh=eHzu+EU4m8NcCuLnBw09R60FqjsOIt1ZAi+wk2Q1yIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=trPo58nDcgZg4ix6VClbHDfipfUStvT+jEWwSKU5fHrpqFBHV10FBIJC9sgqc/q2I5Q7Vkd6y+JDAUaOERMBuYSCTzluvNaUnZp2OvjsnXV9FJTWtprPexUrwaUhbRzxArn0xoKRtda6x6cXaDVouLLKznFekHy6g+ynSKZkxFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BemPkb2V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D3AC4CEE3;
	Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733505687;
	bh=eHzu+EU4m8NcCuLnBw09R60FqjsOIt1ZAi+wk2Q1yIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BemPkb2V2X7J3OCc1Cj+Vyh/4IRYSnwqsBO8lSEjpQ4q1iXP5tNR+zDuNXXNT2vJ3
	 kPO3NTiZt+vjclekyrwDy9Ef+f3PT7huxaOGCZxaX4q3f3RNJCBL/AvZcr3+W2KfzA
	 IbMoXIDAzu7XTo5/CHQEHZeBer6l6hJH8AY5ogG9uRCs2m9u/lOsZeX95Apnr8KSG+
	 mkjfqLJVO/IJkjUHshGFfU80pdCXn1KN8jz0e+Qi3NSaQ+aaFjrfn9K4cJGY+FjDiU
	 sf0h6o/z5eMaY+D7BuWAQZBHn2onvunCWTGXSLe4OvP8+0w1rrXnI1AY/bJvEdBi1C
	 55xYJbTR217+Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJc17-00000005RK2-2r5a;
	Fri, 06 Dec 2024 18:21:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/31] acpi/ghes: don't check if physical_address is not zero
Date: Fri,  6 Dec 2024 18:12:30 +0100
Message-ID: <6f9ff1f1c044fb8f40c9014cc9e40b97f1a4898d.1733504943.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733504943.git.mchehab+huawei@kernel.org>
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: PtawLv1XexvS

The 'physical_address' value is a faulty page. As such, 0 is
as valid as any other value.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index edc74c38bf8a..a3dffd78b012 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -400,10 +400,6 @@ int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
 
     start_addr = le64_to_cpu(ags->ghes_addr_le);
 
-    if (!physical_address) {
-        return -1;
-    }
-
     start_addr += source_id * sizeof(uint64_t);
 
     cpu_physical_memory_read(start_addr, &error_block_addr,
-- 
2.47.1

