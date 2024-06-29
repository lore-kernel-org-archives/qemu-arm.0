Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp535403njm;
        Sat, 29 Jun 2024 05:51:14 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWZWIZMHA7ggq66YwpQ/VnjSX4HKKXpghMnMuCaaJh51cb31s4A6UMV0Y9CrzAs6ejYWROVjwf0/UZu8l+F3p2+2fp3d+qd
X-Google-Smtp-Source: AGHT+IFPEIl8e6BEjHJ5Zw6THMqR8yCR3QHCf8Y1PGGleMi5c9WkiqkMlCcS5U+y4z07M2RUVYnO
X-Received: by 2002:a05:620a:560d:b0:79d:67b4:e0af with SMTP id af79cd13be357-79d7ba13282mr109771085a.35.1719665474515;
        Sat, 29 Jun 2024 05:51:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1719665474; cv=pass;
        d=google.com; s=arc-20160816;
        b=yMS/DSDCDfzT5UaO9cy4epVQzapomnPJBPFMvlCRsUVtjLgEvMZbIEvJHzXdLdBb/w
         YVB9XLLWRW8acpRZLCuHKRsOM6QFRtfe2qt39xzFZWy6ap2B5M5ZRRqxAM6YndKKOHIR
         du3j5rWS5x2N4vU0G7UW0t+p71/rFKQ8uD/LITst8RCwawdTdDPDvk8B2vzSz6IKNYgm
         U9Gh6p0SUIDAxH+5fFMIKNiwUKVVO6wM3W9ghYxCsV98NgOtxv/LqXgLRjYwCMk0XBbK
         lE5HgS2ICzmV1U0CU2YsPpzuYRsuuDhA4g3O4OPWMsVYk/jU6A87gA1pRZyEdiJASaDP
         weMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :subject:date:from:dkim-signature;
        bh=p3Ff167L5PnEkX8Hjv5zeODUS2Rm0iaQ73J60qa2lyQ=;
        fh=8BatoeQXX6DQ52kLCj/lXD3eVoV/KR/akbMTIWcU4vg=;
        b=Zi9e5/66G5xU5fekhxgBs5ZTlj6c2s0FNAgrkqRMfuqU+RSK6yl9sg5GFFhvjg39wy
         NEXfaTsKzKV3mZbitcYytGCnOFVLhbaFSEqOmuplxlhqXTOPTZ2Wi+4Vk51M4dWRKS0W
         UYptpd35FLtGJ3mTk+GqlPxVAQZ6wSNdV/+AbGeyKDzeSe6ExKTaHt8YfVtQultdElCF
         E6ntiJ3tjOYvRLi0VK1yXa+lvHrdHrUDs24TnzamNUMEvAKR1LSONl4ETYOup6NoDJOC
         2cVkxYHk7yZO7qSEWMhw7Gn0blqBZsEnLo5njmQpqVYykzwutW7WUZsSkcr3t953Uv6x
         oVtg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="WK/frdcM";
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-20726-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-20726-alex.bennee=linaro.org@vger.kernel.org"
Return-Path: <kvm+bounces-20726-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id af79cd13be357-79d692f0664si419641085a.323.2024.06.29.05.51.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 05:51:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-20726-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="WK/frdcM";
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-20726-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-20726-alex.bennee=linaro.org@vger.kernel.org"
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DB061C211C0
	for <alex.bennee@linaro.org>; Sat, 29 Jun 2024 12:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BA179B87;
	Sat, 29 Jun 2024 12:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="WK/frdcM"
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706D72B9BE
	for <kvm@vger.kernel.org>; Sat, 29 Jun 2024 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719665469; cv=none; b=uJJBEX1N0N2Cq3B1Uyj2dgEM/FtYfD25Ifdcw+kbm0aBrw0ZqPKo5H91HwmtaCplh+YIFUCwix5d0Ph0dy151IFEO9JmspQX63JBwMJu4XiGiMLYC23X8tSLYP2nIjDRj+M+PLAjBA7YVV9Iyl0KxOulgqsAnpqh6HJDwaLtURk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719665469; c=relaxed/simple;
	bh=k1k49SjjRKkxjnR5y8yDGKczXWO64Oj5yo/dBj0CY+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IjVjefZSyzjaBN7THMq2ORwhUciImC+/SFDBtsch23IZIXDqoLcdYV9AOMxdlenAuu65G3GyjFxwbev+OSnz0pE/06Gem8gOjo4Ebj4MtfNl/7up5mhQK8I9nXPivtH6MiTDJ9jKR4ytLwkbRR9PwKUkc+50b3pVqVzfrnMyOlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=WK/frdcM; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-706a4a04891so1050962b3a.3
        for <kvm@vger.kernel.org>; Sat, 29 Jun 2024 05:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719665465; x=1720270265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3Ff167L5PnEkX8Hjv5zeODUS2Rm0iaQ73J60qa2lyQ=;
        b=WK/frdcMZeduuhrkeWkmgKdb7N0EUzWZxb0bKr14iiHh4fW3wEUmOzDr2bD10zCbkT
         DB21abUJkBpuw3mFIlfH8yyVuLhVohUzy2mPxJBoCJttZq8GWMzYZNzm/UfRqFZwha/j
         5QpsasRMCFB71n1yb5qOVTd8zG5aiwImJ7HRVHy+4Aqhcim9xwsJiyNYHlmuueSL9qLQ
         AlEPwxTMBW2O20rTljPR9PLxKELPXF2xutlJ+lvgxsROVsMxDokJ6mjih2SxTdHpcy+Q
         QR5p0aM5tFQG6G3uC3byYdyCrbj8F4nPvGmY3K3USOEHvgQ6qTg9M9MWc1hY35PCJixm
         bRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719665465; x=1720270265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3Ff167L5PnEkX8Hjv5zeODUS2Rm0iaQ73J60qa2lyQ=;
        b=P4eNAn+Q8FPFxUN9FsDvzTQmN6UVj4JnrKRz17NmQ94h2U5RMhvrjZqR3ZVfj+xFae
         YWuh5LWlPNogHeDgqRDMh3KvRj1WZTVK4RkAPJz4ccSFpFOMbThdbWd53aF/F5EBXnG3
         Uemgq85Y0ztsmSweGUOx779AD/Sd1wXxGsWJNS136VD6h2BzUIfX0VD6STfVUAcvKnHB
         OGQtTvN8L76C6l12RkB9Po5ILC8CXG+0gA24DtoR8zrUSW92FnOJISwBuTrLpKgKphFr
         Aokc/mNzQbWhSeeH6WvHQ/05EoJpuJVeJcURAA5FM7CMcDiONrEW+dtQUnUte192b17U
         vWLA==
X-Forwarded-Encrypted: i=1; AJvYcCVC4AFHyV0y7e3VBL9eoBIS3zx9tBNyp3+QTI+JtpJnqRuK2diweYj1qKDM0W4uuYzSuEZ0w98kfRVcjrtw2zhDX3aN
X-Gm-Message-State: AOJu0YwOGCl0/4Vt2LoNDIWptwbpteN8PtjPZHAD1WiXYm1cDCVa+V1f
	iuIy6Xo/AyP8nOng0u4IAQiirbUtRVFjBl5XGhw8VFkvVxwRyui1TUjGvphqlPY=
X-Received: by 2002:a05:6a20:78a6:b0:1bd:2f6:e400 with SMTP id adf61e73a8af0-1bef624626bmr760352637.47.1719665464771;
        Sat, 29 Jun 2024 05:51:04 -0700 (PDT)
Received: from localhost ([157.82.204.135])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fac1535b6esm31432145ad.156.2024.06.29.05.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 05:51:04 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 29 Jun 2024 21:50:33 +0900
Subject: [PATCH 2/3] target/arm: Always add pmu property
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240629-pmu-v1-2-7269123b88a4@daynix.com>
References: <20240629-pmu-v1-0-7269123b88a4@daynix.com>
In-Reply-To: <20240629-pmu-v1-0-7269123b88a4@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: qEs15ctSfj3F

kvm-steal-time and sve properties are added for KVM even if the
corresponding features are not available. Always add pmu property too.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 35fa281f1b98..0da72c12a5bd 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1770,9 +1770,10 @@ void arm_cpu_post_init(Object *obj)
 
     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
         cpu->has_pmu = true;
-        object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu);
     }
 
+    object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu);
+
     /*
      * Allow user to turn off VFP and Neon support, but only for TCG --
      * KVM does not currently allow us to lie to the guest about its

-- 
2.45.2

