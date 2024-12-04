Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp24335njb;
        Tue, 3 Dec 2024 23:43:46 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUN1BQtEKYlN4JHeCgLnjrW+gz+2912KgP84nxR7Tb22aQ1L+N7V3N/a8xklHmsscqdFaORC/zxkJJ5fg==@linaro.org
X-Google-Smtp-Source: AGHT+IF9H5txTeQwQfaU7tsM1J2FQO7sjIU13CJMZkkyb+gxFxxPDzpevsEOJvMpCvEnLOvbgjH8
X-Received: by 2002:a17:90b:3907:b0:2ea:5dea:eb0a with SMTP id 98e67ed59e1d1-2ef011e3840mr6684513a91.4.1733298225880;
        Tue, 03 Dec 2024 23:43:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733298225; cv=pass;
        d=google.com; s=arc-20240605;
        b=LP2WwLGEG1J73nbAF+HOVgWR8agMeOm8lqd572B3yiuc0U8Q5JluNy2pN8pC93+yCx
         XCH7rSOLGAhf5pzUwTKLA8QggTVASL9I8ZeqzBqFLLdPBKr5ypR1b1LlXgrZMMRu2LnN
         KEMQzPwRHLSjKlcOkbUdsko9sHorOXiOOTxQHD+plL6uu59XY9YCYH0WvAz+FTkynFPA
         kESAFPklcPvs2+9ddTXovWXvHCj3Vk9ffaFrTfJbgI7qKN1kf66Nw2vyeCGZpERVd9/U
         tCyGYgYRTzLqFTDRNaXQUwfZsR7KgZtUlDr0twqoDyE8dnJ15qRPSKLD232Uyoqty4TL
         uGOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=XEvUNAZwMl+serfch6Ko+6iEzS0pfm8mQp9pv7pqH1s=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=ZLhfd6gtF6Ao9AZXlq8p0DIXUVd4XWx2iCVpob/g7mzO5OokqVgGOCv9+x2v3D45Sq
         joGunu7/K/JLi+J05RRGYna4M8niyQIaw0Ji68cDu4uloYaaw1mTjXtYLFJ/LisiSTYd
         LdITnNPF/nLKX0DVkGAwDvlysnXbKeC2Nb6Ou1Iz37uXn7YdKv2Fp1djjAsgML1/PO7k
         TVsDXm2ej32V4do55nd+u/8ZBPlduXC8AYjaz9q3UFRL1kF/0BvqxVzZkWnQFzJj5s3x
         +l5aCIQt98DLf+Qf/dl8ZnsNhDu7Op+x+Ti45qFdHDMy//7LuQlJ6PMyS3CfABm2i6Vm
         6S/Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=AJb+FyFM;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-430669-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-430669-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-430669-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2ef270a8133si1116235a91.168.2024.12.03.23.43.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 23:43:45 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-430669-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=AJb+FyFM;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-430669-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-430669-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73B29285C97
	for <alex.bennee@linaro.org>; Wed,  4 Dec 2024 07:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79D3192D6C;
	Wed,  4 Dec 2024 07:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJb+FyFM"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB71818E75A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Dec 2024 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733298153; cv=none; b=RKwt6h1rXj05NOIOZjbUUMZUpF0RLih1oAaD/eVtKzbFdUabwxUPLrFnSBb4PWQ+paaVPitA6xoJoPSPISOtfcya7/TseNQZru5JALMONXBBjhgIx8cWYkc2q1ZI+Xzj4KReq9ZzgxRknUnsMoTAwJGzXcY8eGuz3IFBvXuzn80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733298153; c=relaxed/simple;
	bh=xKr5K1TW0pYorJXNz1Ksgf7p26nCCQVwbb66JoUnk8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iHk1PlP89hzTbn0x3OsRz0nztPIWj7b06/w3gfbbKQBdNjJP0a5HMFtLQXyjxxUCzuV8QFG1RMLRupJbrAFfAxmEoVtf4iIeW+O1Jo2XMlAvtk8arK/ls5vgZYXIXPQsJqG9fuZ7FptcTEvYDhANeZHOnBPt18jzGrlgAKyigQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJb+FyFM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1408BC4CEE8;
	Wed,  4 Dec 2024 07:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733298153;
	bh=xKr5K1TW0pYorJXNz1Ksgf7p26nCCQVwbb66JoUnk8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AJb+FyFMhbW4wtXckB9r/3Jrr1JZ2l2UyfBxBNzNFLE4AN118IU/Lkk7lXHo+oLT8
	 PzBexZjWcyPlYq8oTNDLBCtTtze9DEf4zsKFdJ8glRFMWEszQl426dD2pCy0Sum4BP
	 AazDt338RWog+J4kCkQm45YoFlq14mT3noEenF6fefbgG4h0G7lezRwucJLXu8/OHO
	 KMVvDFRftS8h6JX0//I/jUm8fMinNSLv4958QQY7r1vr2WD5ILKkCVIvcc8cPuprXj
	 KqJlNAX5VmdhqOy0nyjx5ijlRnbqQOSp9Qf44kTDLDfU/glPXivznc5euYpAKVxkIz
	 udDDeNfo0H8lg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tIk1n-00000004KjA-0ad9;
	Wed, 04 Dec 2024 08:42:31 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 08/16] acpi/ghes: don't check if physical_address is not zero
Date: Wed,  4 Dec 2024 08:41:16 +0100
Message-ID: <95c0fa3fc2969daf3b6bc1f007733f11b715a465.1733297707.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733297707.git.mchehab+huawei@kernel.org>
References: <cover.1733297707.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: vMMhcMa4BORC

The 'physical_address' value is a faulty page. As such, 0 is
as valid as any other value.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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

