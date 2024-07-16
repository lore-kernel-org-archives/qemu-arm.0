Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp27953njk;
        Tue, 16 Jul 2024 01:28:50 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVyVi1dmOSThCjzM03OmDJz4wE0+Q1P+7NF2GIAyT6DJoOTxvCs8pHzTPjiiLEsxX9tZ3WraoVaDZRN2i6BW8AxtsuOiJMK
X-Google-Smtp-Source: AGHT+IHY/pfBHDm1F8fQ1mabNW/DIYvYbkdoLglijaCjJxbOeNf4c1exiqnA02RIta0aGiGsoVXs
X-Received: by 2002:a05:622a:144a:b0:445:320:d92f with SMTP id d75a77b69052e-44f7ace38dfmr19245601cf.26.1721118530163;
        Tue, 16 Jul 2024 01:28:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721118530; cv=pass;
        d=google.com; s=arc-20160816;
        b=hLhXnC+etWGVBeS2TLkPqxo79fyAhrZ7dfaJOTTHi52Mw841XADAnxu1GmmIIObnDp
         FS0oFHWqZru6RN4w7HAQ8SdgTOY2Bafe+VgTTEgaZqvJiys9Fcm6wlOqEOVbxDukAkSH
         7VBGNzUxuwV0AwMJB0dfxBRITfEYIiRYwvn/fQyV+u5C2ZaSt3rNTVzTe5wkgoqp7cUD
         MlwEaoyyetlwm6HekeRtvtBg9F9AoOO+7Z8XqGsEbpn6qmSJlpX18yrLjo4beYq+cxeA
         Yi0pxlH5BUZhUOaCK1Mht5hRINOb8dxEfGcYI1VYUzRzKvFQrYuvpSd4kCsG4IkB8Ae4
         xZUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :subject:date:from:dkim-signature;
        bh=1KxAC9/Pxe3NsDzOqPZpbEql5jfhTTEPjoaJwE6M8sE=;
        fh=bwDFLSyR5x5A6wTMSqtYMWRMGT30iY2MBwBrhRuQiCc=;
        b=Z3B5SCwNThXVycL7+P3pX8NEGsIoqv25blCTguCEsrCKF4tL5kUs5HFSteiDiEejVw
         UHWKV226XnhxOIZ46gFL1y2rb2dtki4FCVdaIDqhafxQaS4a6HfYyF+mg2SMo7/okYdk
         ZgJFw+4pYErxOKkIfBPmCHVJP/0xQeQJ4IJdv9QtGPBBQKP+vK74J14+SOl1t/K86peh
         th2DBjw/JMnwG2ztUge9oCtR/AqzQ54qhtby/aSaDiTTx+2m54EOcsf1pbuIp6C3uH9F
         wfmzxPBrcmDO4DLcCm9tmWwMnYc1IHKu0sx1aBiuDvqSifyWJ81urqYY+8OFFxKn5Wdj
         XOnQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=rdUBMAUG;
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-21692-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-21692-alex.bennee=linaro.org@vger.kernel.org"
Return-Path: <kvm+bounces-21692-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b81f19dsi69813621cf.612.2024.07.16.01.28.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 01:28:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-21692-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=rdUBMAUG;
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-21692-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-21692-alex.bennee=linaro.org@vger.kernel.org"
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D89331C21BB8
	for <alex.bennee@linaro.org>; Tue, 16 Jul 2024 08:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6D05337F;
	Tue, 16 Jul 2024 08:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="rdUBMAUG"
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352DE502B1
	for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 08:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721118521; cv=none; b=pCUwOzexA88H9TWlVCmFuGup2SH5D9B4F1ka9bobkYa62og1S2JnjoVuWskqUteSOxG1vXsTI/KBURjoMZMqZPWJY3c7vB5j1I3GlXnYW0r4sD3jpBgqzAwEvkkZnIJoyDHNBItabYKsCdXHK5VDAwUeUcjoOCSUxv/+Us00oFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721118521; c=relaxed/simple;
	bh=r4LklVSQBJdNnKbC3afcFb6NZPieSYOqMCDcO+aKjE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BCCkzuXEKwyNQ3+KtfBu1x49x1sNgVo/oZdNBATQ9NZi3bGkX5m8DyY3iXtpU0SP+lR68t+ZQe1XsKcrw/66jAZHSBkQtgkWOibCWtEftaMVOPaEMhBx87K+TyY1lr28KCPcE/9H31QtRbxSHRovDKXs6e0JzGV/N7quXjwTYfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=rdUBMAUG; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fbfb7cdb54so24450275ad.2
        for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 01:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1721118519; x=1721723319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1KxAC9/Pxe3NsDzOqPZpbEql5jfhTTEPjoaJwE6M8sE=;
        b=rdUBMAUGDbsHE0de72/LH5C8/rhD8Cjso8O9I6gCks/DmZIXks0eiFXnichdgRt0pH
         68NW0zPlgQZGEZXiloo4zMIsfffpji1o/XBQst2kIg845Ri1bnUzFPt+5r2YKQtV/8qH
         eog9owjxNKEeUhtLfGSv66rtrVGsTKxYJJWsGRilJsgtU4HyjTUjCVt0Lw/rY6WFDBZ0
         g0Kwk3JlaCUF+OudECdubUNZtfYEhKWUxsYgSc4YlW66kSo5tgKKPXXgtQPw3c4c3qnJ
         qXtS1GEXSClAasj2Fsti72e5keQu0CdAlU/ouhV/Czp4LTa4rkGAJhTKTiXSrWwZlROg
         Eg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721118519; x=1721723319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1KxAC9/Pxe3NsDzOqPZpbEql5jfhTTEPjoaJwE6M8sE=;
        b=oFngvcyneHbo0xTE4rX8NtM/mWcXbCwd0XU+zdiEVD+vBkNU0K/K/zh9dL8pmrAlf5
         K3lI1auWyrrevVgJRh37CmT6EpEFoq5flnvSaP1ggVWgvdQz3rx+hdsjrOX+/bw5fXYA
         ydWBewW/lHad7A5i5un6w3bj27R4cnt8MaMG/GDwbb6TXdZvNkYUFRt5Aq/8T/PJf6BV
         9B+KrOY0E349KMTsDgJm4B8Bc8caBDI627L0WKGbkKkZkF6ipmLvBXV5YQ3eoW4i47WU
         Du5lLofhPuo8lhY8Izo9sU8nOCwbnEzwh9IJBB40NvNngHvg7dR+P9484WsgS48c00S1
         pq5g==
X-Forwarded-Encrypted: i=1; AJvYcCXmQq2zu5XVMzWfb9twqVUewFQdEhbuVaVKwDRJ9gztDhMGKzniTwyj0x1GwaeRlROPaHyQ8mKFnNCNDFqYIU+mVl7O
X-Gm-Message-State: AOJu0Yx1vZig7uI0/P3SOjOZARbwixjxJsUaP9pJnwjBOpqxEQ4PoDkk
	NyauZ0D6gQ2YEBw0R0W7bi3g/ZmCZnSt7e0SHnWIDXsXrKzQI/D8m6uHPaVq3pM=
X-Received: by 2002:a17:903:234e:b0:1fb:b35:2fcb with SMTP id d9443c01a7336-1fc3d92d0c7mr11461215ad.2.1721118519582;
        Tue, 16 Jul 2024 01:28:39 -0700 (PDT)
Received: from localhost ([157.82.128.7])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fc0bb6ffdesm54720525ad.53.2024.07.16.01.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 01:28:39 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Tue, 16 Jul 2024 17:28:17 +0900
Subject: [PATCH v2 5/5] target/arm/kvm: Report PMU unavailability
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240716-pmu-v2-5-f3e3e4b2d3d5@daynix.com>
References: <20240716-pmu-v2-0-f3e3e4b2d3d5@daynix.com>
In-Reply-To: <20240716-pmu-v2-0-f3e3e4b2d3d5@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: s7LZrd692ZRN

target/arm/kvm.c checked PMU availability but claimed PMU is
available even if it is not. In fact, Asahi Linux supports KVM but lacks
PMU support. Only advertise PMU availability only when it is really
available.

Fixes: dc40d45ebd8e ("target/arm/kvm: Move kvm_arm_get_host_cpu_features and unexport")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 70f79eda33cd..b20a35052f41 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -280,6 +280,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     if (kvm_arm_pmu_supported()) {
         init.features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
         pmu_supported = true;
+        features |= 1ULL << ARM_FEATURE_PMU;
     }
 
     if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
@@ -448,7 +449,6 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     features |= 1ULL << ARM_FEATURE_V8;
     features |= 1ULL << ARM_FEATURE_NEON;
     features |= 1ULL << ARM_FEATURE_AARCH64;
-    features |= 1ULL << ARM_FEATURE_PMU;
     features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
 
     ahcf->features = features;

-- 
2.45.2

