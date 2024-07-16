Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp27789njk;
        Tue, 16 Jul 2024 01:28:25 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVel+I4cwGT69JdTWcl0W27t0e0JG7yvuMgDzvKeqOeemYBzNbUjvuVNDcKnpCRjBoH43u17Kw5oVkbO/C8FFUTt74YDwrL
X-Google-Smtp-Source: AGHT+IHZK37hNUVaRjXBT9MKXoykZJDgVnzg3jzPmj2fD29IfSTOTJ0izCYI5+TXohziAiMFmhqj
X-Received: by 2002:a50:d4dd:0:b0:57c:6188:875a with SMTP id 4fb4d7f45d1cf-59ef03c0792mr803436a12.26.1721118505027;
        Tue, 16 Jul 2024 01:28:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721118505; cv=pass;
        d=google.com; s=arc-20160816;
        b=j/00hFy5T3Cf1qZD3JrY3MkSd6AFB9RSYAIj0VgwZhMtfRmdf7UeuxwkdqdeHpdbBc
         w94OXh7tgMHCmcgYqCH0xlE+8nGIiXWrUINAUDscxLjEN7hEvpEAx2DlvimNsu2Kes3b
         cHoYx60BlukTHyMsQp9E+bQGwGX2xgJ5T4rQXhEVI/22rL271o7GGoJjVuPihIzXG4yu
         TBl4uF/Hc2LCdEARHKPLMA6Dv9J6ciURWrfR5BE7BgzJFOIZpRwFik0c9K/MhmzgrqCQ
         oo5RfSdSLEDrP0vmomSb6nY+cvEvzMPFzqvkuoerEbxn5gXVbxrMZiNoIPZaT4XrFckG
         hQsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:from
         :dkim-signature;
        bh=nV9f7Z9uo7GcDlW1Lk+YDEAFR+k4t86UdCv3nK4ea5k=;
        fh=qMueL5tP7HcVcpmg0O/pYtowiDiscOYGRCFV/xcZOrY=;
        b=ufn6m2AxlrgoodTRMBqs9s3hvZMpLH3Py317EvxfzYbBbLkFjQjCgIQINquwZZe5v3
         PKwNiV8hd2BHesOS7yaXkPLWYkCfTOWeqyCxn742j6mX0AXTQ0JEEXSyDZ0IhyYCEtR5
         6PYCCOexOIsTtN/b1cBJ3ZsVnxspVwj9inbxUryCHW/jLvE8ypTXL4JVpOgAsuPjUqE/
         xCLuQ56LQn46ZO60r4G9jlU9Qgg8Ay1VH+QGND/Z6tL7vQJBezbXfZmPGH3mQKyhP8tL
         a6wpBmIL8mJ94e8p7UnqdoER10D6Sc8zDMS+gIGX9TafZgmPdNTuxLn4xDDyI7RkA3yr
         VULA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=usCY5e1G;
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-21687-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-21687-alex.bennee=linaro.org@vger.kernel.org"
Return-Path: <kvm+bounces-21687-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-59b26a8d7dasi3597047a12.322.2024.07.16.01.28.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 01:28:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-21687-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=usCY5e1G;
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-21687-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-21687-alex.bennee=linaro.org@vger.kernel.org"
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9410C1F21888
	for <alex.bennee@linaro.org>; Tue, 16 Jul 2024 08:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B31D4D8CE;
	Tue, 16 Jul 2024 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="usCY5e1G"
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03183224
	for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 08:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721118499; cv=none; b=dFDWdJWZwcsKh3+g9Hslqmm99Ps0KXVHEq0LPywCCZ62ki5mRpTrL6hBpO8livmXv9u2QvqrFhinl6uCN+OFoytzMe4X+JfloIExtPJ88YPPQ5sTViZnZF9oobJJmlwtZx5Vv5r2HZB+yKyb7iJvkaiAhc37BxnbRLpVvLrBNTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721118499; c=relaxed/simple;
	bh=t/qfbxpIHPcQCEXqudGMXxqHBdmRNulZnL7/7z4N4fs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DoScYU/2gSnYjD3Dixbobol2D9o2odX6Ock6F68GCzgHPtTceoDS+o71OllgmhVRntC8oz/rg0i/hY6isLZyWFZXnx9GWR89Y8A3jKBBJiPBmyfzG+vLeDu2GHOBQpy05yhpSFvZTuhewYcTd+uzUYVt9GBhG8PJf/3EM2O9o78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=usCY5e1G; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70b09c2ade6so3384664b3a.3
        for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 01:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1721118498; x=1721723298; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nV9f7Z9uo7GcDlW1Lk+YDEAFR+k4t86UdCv3nK4ea5k=;
        b=usCY5e1GzTiQ8THwwvJQW5V/t7acfK1AzU3ZJkmslS5QRFXkBlX+j0QhM/9V8Z2T+I
         d4aBP+Mzk+0ar9y+tbPW8NKefMFhoVusfN0UoYq4c1ETTr+aIFasi/19CBuBDLrcbwTj
         yQJH3v9EJu9UGIgitslmiZf91cI+PvMxrxqCjVYx7XYfohCw+aDiN57BjXe9GN3YkDI3
         eZSGCVRybppMdw46G3NS0T577B8+58J9rK+Pq3uBLeGefH1tgr2UzsUDadlmjsmdYyxY
         i7UuOqwnods3v/JCSZB6Ab9Ft4H/ueRFCXjoRYCIZ+5kYi9p6p9qEydysYfOCFP0YZrI
         WKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721118498; x=1721723298;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nV9f7Z9uo7GcDlW1Lk+YDEAFR+k4t86UdCv3nK4ea5k=;
        b=qBHzeAS91ITfG69KFIt89C/5F+XMF7l9EOcqX0VYsD5tmWFcIB/bMgf51c7bWIuHFY
         t5EAiXijHuCx6h49JNO9xypZHi3G8Q0gi4+w0r9I7b4E1y5clmuV+GuG4c+Okl2AtnhN
         KCl7AGGuIA1NZ7mFDFqk+LNaaR3AaPtAuUj3dz64heG5puhL296a6+1gMQGowjrCYPQH
         lX67+dZgfHyuM91bvO7zpKHXCYWIVvJZBiK715nUlycgVJTmn8RhUsQk8xVYTNsmc7/y
         qx5PAUI4X0R9O8u3m7FnDVc3jXMntX81vcuj+4p5W/IR+s+qOnzqQJmeDsTDLzs8MEZf
         1Ivg==
X-Forwarded-Encrypted: i=1; AJvYcCWGr/mh5aNU5cCZYFqsZ13WJgSm7dhyp7SOQ2YnViP7qcoyyXPofkkaKWNSWgp6+87x4eUQV01GJ+5Mg+XcP1rFrlIp
X-Gm-Message-State: AOJu0YxQp80szzpJIdAKrdsT05n2fpr6CHHD8CxePy2KWbJyoeIIAtfc
	pMkrWjEHNaOpbi1OCiMKN43BQPQTzpwHCBhpthj4x0+DvXzfYCHmUMS/vv4T5To=
X-Received: by 2002:a05:6a20:7487:b0:1c1:c3ff:1f43 with SMTP id adf61e73a8af0-1c3f12729f3mr1770285637.43.1721118497799;
        Tue, 16 Jul 2024 01:28:17 -0700 (PDT)
Received: from localhost ([157.82.128.7])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2cacd7037d6sm7693451a91.53.2024.07.16.01.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 01:28:17 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 0/5] target/arm/kvm: Report PMU unavailability
Date: Tue, 16 Jul 2024 17:28:12 +0900
Message-Id: <20240716-pmu-v2-0-f3e3e4b2d3d5@daynix.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABwvlmYC/1WMyw6DIBBFf8XMujQwVXys+h+NCwpYZyEYaInG8
 O+l7ro8N/ecA6INZCMM1QHBJorkXQG8VKBn5V6WkSkMyLHmEnu2Lh+mTDPJ1qJuDIfyXIOdaDs
 rj7HwTPHtw35Gk/it/34SjLMWZS/w9uw6Vd+N2h1tV+0XGHPOXxgpFQOXAAAA
To: Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: ytH4AjtNBl7W

target/arm/kvm.c checked PMU availability but claimed PMU is
available even if it is not. In fact, Asahi Linux supports KVM but lacks
PMU support. Only advertise PMU availability only when it is really
available.

Fixes: dc40d45ebd8e ("target/arm/kvm: Move kvm_arm_get_host_cpu_features and unexport")

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Changes in v2:
- Restricted writes to 'pmu' to host and max.
- Prohibited writes to 'pmu' for hvf.
- Link to v1: https://lore.kernel.org/r/20240629-pmu-v1-0-7269123b88a4@daynix.com

---
Akihiko Odaki (5):
      tests/arm-cpu-features: Do not assume PMU availability
      target/arm: Allow setting 'pmu' only for host and max
      target/arm: Do not allow setting 'pmu' for hvf
      target/arm: Always add pmu property
      target/arm/kvm: Report PMU unavailability

 target/arm/cpu.c               | 14 +++++++++++++-
 target/arm/kvm.c               |  2 +-
 tests/qtest/arm-cpu-features.c | 13 ++++++++-----
 3 files changed, 22 insertions(+), 7 deletions(-)
---
base-commit: f2cb4026fccfe073f84a4b440e41d3ed0c3134f6
change-id: 20240629-pmu-ad5f67e2c5d0

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>

