Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp27903njk;
        Tue, 16 Jul 2024 01:28:41 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCU04gI6OcOBiNm2fLo7YQIj76wpSL34IGxF7qevejuMzLwAhRHkE/3FZpF/Aoi+gmpv1BXb9VPcg15efzYBUXRv9nXTfKJK
X-Google-Smtp-Source: AGHT+IFU/Y/rfX+ItxhkFAl0Q8UdywDHcWmIl0T8HMX/ySHrYSD/bK3bejo3gGuIEt+jBVWqrg7u
X-Received: by 2002:a17:906:2984:b0:a72:81f5:85b6 with SMTP id a640c23a62f3a-a79ea481753mr76839066b.18.1721118520750;
        Tue, 16 Jul 2024 01:28:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721118520; cv=pass;
        d=google.com; s=arc-20160816;
        b=LsiZ3S/1i0OgCy4b9hSd6JhORJqR8n2h0W+qsRAXpjPSeDLYLGoJd5S8NEmfJgd32A
         4/n8Szm6CPrbT6zZRjQSCsr9bR1fCgeO83JsjoPQNICMG8GEGqy1P5wjSaJvc1NvA3WP
         59mQJsl7D7Sn06RBEO2KtgpEkICUerwg6Ollkdi7IfxUEvXJ/7Ecb4QOZmA8vym/h1NX
         YRJA4CxzfyLxyxPtN59nN+sr7cukHsahXKD73Qfu2EkLIvUaeGxdi8tN5QUYRU1q0CMF
         R4quyIbu7dECli+h9+DP3+mK2uEJWRwjB2WFkUsArxeDGF4B2Innip8gO3NjWV1nOIrZ
         3DOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :subject:date:from:dkim-signature;
        bh=UCgdSp5pdNZ1XKq3c5okiNiCxhoyMDPUd6RYSX/QMYw=;
        fh=drLDnK2legaDeBpgaapAkBoYlm5kPgRd5YdtIs1M6p0=;
        b=fyHt9ow5yn5LE61VTFexKMuwlANVLPIeY+GQFowz0ypESbVzrZlZwrPyRW6MrN9+UJ
         a/chDYu7icA9e1raASfE3O01um/+E/INCPy3jOWQEqzNfsytsSkkV03SNVxOYnDKFI6f
         J6rvUOaTKYXBDtbSs6VVVQ6O105H6WARn/HCrlz1Tm61Y/3oHnH/0mAw3kKiRU+MG606
         /ZcRliJkLxLuJukU+JArQE6EvJMkZyoJjFubjn9bFqAOzwFLKm0wir7YgBeiYguboaNR
         pffufanOIYZe3wUlT9jsjcP5/TH02LTmFhPTepZzG/0jZ2geomPchNhMwC5SpZUo4dRJ
         G+dA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=bKDwSxnO;
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-21690-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-21690-alex.bennee=linaro.org@vger.kernel.org"
Return-Path: <kvm+bounces-21690-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a79bc7c1d02si355328866b.378.2024.07.16.01.28.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 01:28:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-21690-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=bKDwSxnO;
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-21690-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-21690-alex.bennee=linaro.org@vger.kernel.org"
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 543B91F228C4
	for <alex.bennee@linaro.org>; Tue, 16 Jul 2024 08:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9E057CAC;
	Tue, 16 Jul 2024 08:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="bKDwSxnO"
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FEA56B8C
	for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 08:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721118513; cv=none; b=MGexvGf2+q57JoAlcswj1A6tmZrVHIH9BIRcXP3VIWKryg04j7NSjhgAHiB92v0VAI9+ffz5PeofKdQsCfnj9M7g+BW4RRQKESE5We79jgBbd+pfQs4c1hY2OdgSu/WJI1O2UApgkjbEiMThoOlqES/c/yzM34M3MR5l8kYDjnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721118513; c=relaxed/simple;
	bh=40OgbpTySEQ6YEs03MghFUDuwn3oADg13liRJNSUy2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uNWmPpFp7sq+yoRis47uhqx/VEhtkHRfhIBPxd6OGGfs6BHrEljAtcsqannvgdzvZxpnphS8/ijjup/wuVe9j88CzXvDrzhXCwj3tKLwdwG9askAehQ8M3K3q3pnzZjxMvaAIzCfu/yzX/cEqLSa9IFMumw414gNA3vIKg3n8Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=bKDwSxnO; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7669d62b5bfso3033881a12.1
        for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 01:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1721118512; x=1721723312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UCgdSp5pdNZ1XKq3c5okiNiCxhoyMDPUd6RYSX/QMYw=;
        b=bKDwSxnO7pBs8qP2A26wb//ZHswgIhiP0tABEaDqj+meNY2fSsVpNEyUSrmhLp66IW
         KRuHAlG3QUJxP83L41zhjDLqWmSskhu7eSqfiCmy6XShAv0uIsgd7e9sPkDPWLrRZQ5y
         PvzMI6dCyec56H6pGrOAcq4K0t8CFH+oUyI4bQUdlcd4NHZRFf97WZiZMco7HJZzOlRG
         AetRq8DdspDMsibAaM2tngZywHdHo+Oqt1iDzOble1xHH/Y5h91MnX4D7SuI5D6QfG72
         ZdFYJ4LSnvsqzF2ehwiIRUPSw5KypKMuXdHYLOeVzGa4LfQGlL0rT1PMZWhfgHYs6jBk
         sMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721118512; x=1721723312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCgdSp5pdNZ1XKq3c5okiNiCxhoyMDPUd6RYSX/QMYw=;
        b=MxPQnuCfPCH4akR/9ErKgXLysfC0AQrWd+uggZB2JZ7rGwLd+n7F9g4feqXTCaqiwV
         Yt9J2KU0oWk/CWNLGgSwQedExB6J9dxRGHeHFITyNCcv3HYsDTqfb6kCt7eFgXOyYs5z
         7P9qmjnCP/YjqXk/PEPSUEhIcT8yfSMSxh+gSc3t3y/7qBpHCFOSi3VJE9WmhSs3QN5Z
         2y3qeCU1+sVQmbmi9U+7WPLXjvlR8UehldM5Abt+SLcq5F39icOr8sv5Yn01KlAeMKqc
         Yev7dYEKX365eyNOurclG4u8cAZZfUsUw5SdVbd8B3YT6uanNHUK6XrFVbaXAbVBa1nB
         Nz+w==
X-Forwarded-Encrypted: i=1; AJvYcCX1Ux1SagYgJsoGb6F9xDWLXWrcl7ruFkd3d4VAHcuwDKn/4nHhe5f+oYZfpNYaTuGVyRI7HIv0B1xf6alKK3gVlVV8
X-Gm-Message-State: AOJu0YwoobmRH8d3FXkB740QQz3zGCwjyaiHyiA+EkEWc25po8TIpIg7
	XwZ//owP+VBYTfYGN6YOaSAKUdGkPkdhdpM9Qd9SJthD8c8KpyBS9mPRjstO5xI=
X-Received: by 2002:a05:6a21:99a5:b0:1c2:88ad:b26d with SMTP id adf61e73a8af0-1c3f129e50bmr1720884637.48.1721118512001;
        Tue, 16 Jul 2024 01:28:32 -0700 (PDT)
Received: from localhost ([157.82.128.7])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2caedbdb745sm5712692a91.7.2024.07.16.01.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 01:28:31 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Tue, 16 Jul 2024 17:28:15 +0900
Subject: [PATCH v2 3/5] target/arm: Do not allow setting 'pmu' for hvf
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240716-pmu-v2-3-f3e3e4b2d3d5@daynix.com>
References: <20240716-pmu-v2-0-f3e3e4b2d3d5@daynix.com>
In-Reply-To: <20240716-pmu-v2-0-f3e3e4b2d3d5@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: 6/gQu61Rleq7

hvf currently does not support PMU.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8c180c679ce2..9e1d15701468 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1603,6 +1603,10 @@ static void arm_set_pmu(Object *obj, bool value, Error **errp)
     }
 
     if (value) {
+        if (hvf_enabled()) {
+            error_setg(errp, "'pmu' feature not suported by hvf");
+            return;
+        }
         if (kvm_enabled() && !kvm_arm_pmu_supported()) {
             error_setg(errp, "'pmu' feature not supported by KVM on this host");
             return;

-- 
2.45.2

