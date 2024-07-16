Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp27921njk;
        Tue, 16 Jul 2024 01:28:45 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCW0qIxZkX31DNChsaysrdiJNgOxioRftyOq1Hh39GNLJRZ6Wxh2FID2LXC50dp5usTC3s3zhvEdYOLF454vHa/hWGJO8mKl
X-Google-Smtp-Source: AGHT+IFq5T+tnzSyEomk7dPXmLHclgCgXd9s+iZxzQdXY2kB8jg1FsmSSg2LzfkokN+kzdYEdv4F
X-Received: by 2002:a05:6830:439f:b0:703:5db8:805 with SMTP id 46e09a7af769-708d99164c2mr1753481a34.4.1721118524982;
        Tue, 16 Jul 2024 01:28:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721118524; cv=pass;
        d=google.com; s=arc-20160816;
        b=x2gWnMJ//qgKGvilgMAIJKXY6wlk6QC9DpX9Rjmddqprdg2osMpTVM1vhkiSAT6f+w
         4sFNnL2iZRaHfIN/jNFm5R7OHNCwC+qw7z6cQGeaY6OWDX0n5ikI7HH+3cXpU80VcDyb
         Qj9vqWsfFXGOVNIgHhTEVmKlPS14i3X3ZfZXeKcohQdDuPMkirdt7qDF5RFnh9iCbXGS
         Zl1bbBR6z/uE4EAesbYtqHccrvF/nVk2bdJJfwtFrSv5ZKZ3TFqn8dbU5lzu4eaGmrrs
         HOuns8v/ltiYM8QjmCFePIAJI9DyLbHT/quZci5lILqTkw0E4PJ8K/ZkrSGGHHBF+OFU
         MGxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :subject:date:from:dkim-signature;
        bh=MzrJ2SIc0b0nCcptbEys+0+C2juhcCeb9eqlhLMneTY=;
        fh=AEnG3YJV9BOSERMPRvIRCfPQc/BtuNMEuZVa8LXVgpw=;
        b=RDUQnKtNHBnV/zNRbyWx0yrVhQtqQqmgUx0ZwjMgkz/sSBR77+QJIGq5vOiramxuYB
         EX4erPWSzSY9DPLXUsxqQow90hAJ2W0KCQnEO1cWq84AxWbLjosE5Mm65FlzifRhRXMu
         y+bFglHDlKGuzc5PVSeMxG0lzRQp9Uq4XUOLBOWWEVJuFZ17cu+sD3OXwaHTJb1yUug2
         y1/rtFxKbrmmSiORAkzdfA/kb4yw2AKMc2kiS6vG4PlpQ0TcXwllCruj65JTxYFbR4It
         q6niTpLh/q+X/LhR1C8vN6xZjfGwzj8xozpknDe9tdswS+lx0HlDKujdcUg+UC3uEaGV
         LuTA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=lGL4kPLZ;
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-21691-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-21691-alex.bennee=linaro.org@vger.kernel.org"
Return-Path: <kvm+bounces-21691-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-78e4384993fsi6985208a12.578.2024.07.16.01.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 01:28:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-21691-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=lGL4kPLZ;
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-21691-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-21691-alex.bennee=linaro.org@vger.kernel.org"
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74F2E28275C
	for <alex.bennee@linaro.org>; Tue, 16 Jul 2024 08:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B695D55887;
	Tue, 16 Jul 2024 08:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="lGL4kPLZ"
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A836502B1
	for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 08:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721118517; cv=none; b=BZXfpnuFh4GK3cZ0TyTlrGCeUNZuBQhFi1Cfwciuv41GBVMzI8k58uof3Qe/o9E48dz1czQHtHM51qrC/CoP/dipXtLiGJpkctvdyNJaulRTN2e7LdO8WqzRVW9NaRC0qAHg6+Z+DkOgIMdUn5tzSyocNyWzI3jnyEjF27R168U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721118517; c=relaxed/simple;
	bh=d13S3u6zvOUNam380BtLBXtLj2ddDqg65Tj7QN5dUj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X4/aW4qj64j12tKtLfJXwsB1m2WFopTiIeAys/pDiDxjwIcIrcjvOgqH5Qyj4WS4Zoa06CdqQ42x1Hlw9l9PmDFpx2ajZ+m9mKbF/d+9lZVMG5MRW73O2lHDmnyNasEjZC8zicjv0XeJmQqyEXwnziZaHfpqD4sQODF41camt6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=lGL4kPLZ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70b1207bc22so4388367b3a.3
        for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 01:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1721118515; x=1721723315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzrJ2SIc0b0nCcptbEys+0+C2juhcCeb9eqlhLMneTY=;
        b=lGL4kPLZZLAWoNicTjO8N2WRv1dDpsVaBCOY1OPmwl1qcHjxlJpjaFJvTFFl0tCtKc
         TTCm8YmVnbEzJecbmXNu0gnfRyomvXnkoAO3CoQ5utoiZ2ZYlobeVMwh5F3N+rOS2cvZ
         rpZJ3IoqyhKwoPg3853UA/ot7iHqtVI6y2Vu3JDPH4WGdRdxq4mBlMfXK3R4Cavu/LU/
         bGUF3Z2q6a0wwkHvIwaViqmAnzur+S5fuVw53oAhP2cjcAQXslbsE/h6OuTItpgxNIUr
         Pdjbc2ZJtvHrrJr2Gz4i7/PEB1fgQGPpPnehSHGnIKfjRqwvuy5IeOZnATOT5Q+nwvDM
         CGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721118515; x=1721723315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzrJ2SIc0b0nCcptbEys+0+C2juhcCeb9eqlhLMneTY=;
        b=YA59anZlSltZBoTDu5A5cujsuPnX+b3xKHdavKfBRJCLhCbd2dauQquMb+DK4z0jhL
         CHPbUnBlwAb3UTUr7fpgoBYPmE8ci6MA1P5whj6kY3xK1vK/l3LfUUXvlVlDJJD3VIqX
         Kr1w014PjZFehy9QAZAW818WsQMgQKB6NREXbFsKzVBlEzgbVd/e9Gy935xJ4OOKOYs2
         pQC9bLrukn0GDv/m1gM9g+iM5IWyt+6Hg2MuyEQj7tXtKUIP6oM8tF1ZwVqg1oAVRFyR
         VAyZOuIA/XiRNAidG84z+kXoxfUDsGRKwXPXQ/F60ILGmDwJkbuAc9KDrNBT75gavH8a
         /8FA==
X-Forwarded-Encrypted: i=1; AJvYcCU3zpxBM8MLWjWvnNpdve0/Fjzgfm2biwabnYgOqj7wv+iL3WZ/Nf+DKQK+x//OQzaC1EJOuBeX8JCYY9l9Yxfp4lfK
X-Gm-Message-State: AOJu0YyPswM4onNB0tnijmvQVhvIPcsBNn5OqB9wwVn4/Tk7b1L4z6vL
	VOEWqFO4JwDZy7oFzbuAF+E/Vrm2Ux3ByE4Wn1q6SpqYt2NubzcuYp+XVChNbkg=
X-Received: by 2002:a05:6a21:6da9:b0:1c0:e629:3912 with SMTP id adf61e73a8af0-1c3f12a2231mr1826892637.48.1721118515601;
        Tue, 16 Jul 2024 01:28:35 -0700 (PDT)
Received: from localhost ([157.82.128.7])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fc0bbc2e0csm52710255ad.106.2024.07.16.01.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 01:28:35 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Tue, 16 Jul 2024 17:28:16 +0900
Subject: [PATCH v2 4/5] target/arm: Always add pmu property
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240716-pmu-v2-4-f3e3e4b2d3d5@daynix.com>
References: <20240716-pmu-v2-0-f3e3e4b2d3d5@daynix.com>
In-Reply-To: <20240716-pmu-v2-0-f3e3e4b2d3d5@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: uLcm5IfDOHmm

kvm-steal-time and sve properties are added for KVM even if the
corresponding features are not available. Always add pmu property too.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9e1d15701468..32508644aee7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1781,9 +1781,10 @@ void arm_cpu_post_init(Object *obj)
 
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

