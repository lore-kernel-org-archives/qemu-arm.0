Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp27831njk;
        Tue, 16 Jul 2024 01:28:30 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCV7e0M52vNzrE4iU1fLX+HiPC3OZcPOQPlfGKvYc76oaFncSrmqcB4DCQzMOsHxs9BGsOfJT0PwSxlE6r7r3xJN7X7Lkkhs
X-Google-Smtp-Source: AGHT+IG3WMq68obv+rS8ppn/GSsA9X7Nyi3+GshYbDSCGAjmezxcs8/X/rkKJGQMScUqf1yVmH1h
X-Received: by 2002:a2e:3c15:0:b0:2ec:5843:2fb8 with SMTP id 38308e7fff4ca-2eef41ea311mr10994561fa.42.1721118510414;
        Tue, 16 Jul 2024 01:28:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721118510; cv=pass;
        d=google.com; s=arc-20160816;
        b=Uz4zSDHEcKTHndJReyQ533rFtxZ8I6kT/MSGDGdkclywsaVCSwJOMcFnTLVr32S9Fr
         uzrb7oxFHkTsGNtg/WmN5ZrEHYfklEmwIc/nZoUSkTMxgLK3rAqSK7DXQeyM4VM9vZ0e
         XyHg2aUYcZ1EZ9t5ltH1KYhdO5egVr0Sg6MRw7tFHs9Ksq5Ez/2S01WoavYJ0Lw+g+HX
         aqAqitHDFuGZwOqAE3H6DvQiUnuurwh/EbIl4P+N1FGMx62xvAfek8bD39OwoaMTXgOQ
         0Bo6ryzeinsatdwAcY2tLhqrX2WzrvJmOJckfZnKo7SQ/nF1o5OShSuDPxeKJTKZ9/mE
         9CAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :subject:date:from:dkim-signature;
        bh=DvpsKqJKseTB8512E3EM/mcg58HxToRdE8EyOPRZHqA=;
        fh=kOVKu0AIdHTC7xWzOCvbhHRDdW1PsYN2H2zF+0Z6AuE=;
        b=zx9Fk9RhdjqdeVGi/RU5I5NPNE6zJnMCibHJ2IrIGlj552vg9AMhPjQzHQ8myDu6hv
         pK84vY+vpQV3wGs67E6K8O82MWkEUUwMALVz2Ob8f7mbXzwXmukyVwMUcLrC++mWpmH6
         VFZ6ywiWPcm8uv7VjaOny/HyCKPV2UjB+jlMKB5Bl031JqRpVwoHNjskIr2bn2ozMBlb
         FTHDvwrBfX7Wf9/S9laC1kyELByUtkAnVrhSO3CJfLa0nQDdnOwMd0pRHcQ/sVCTC9uz
         lNOTwiSxkEvcd45ie+zN2xpG29h+jk3vtL/fRV7uudBEhYKHiHPTiQHwGZvaRBZpjftU
         6TJQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=IyXJleL+;
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-21688-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-21688-alex.bennee=linaro.org@vger.kernel.org"
Return-Path: <kvm+bounces-21688-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a79bc7f61f9si337110466b.507.2024.07.16.01.28.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 01:28:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-21688-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=IyXJleL+;
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-21688-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-21688-alex.bennee=linaro.org@vger.kernel.org"
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F00A41F222F1
	for <alex.bennee@linaro.org>; Tue, 16 Jul 2024 08:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D3737165;
	Tue, 16 Jul 2024 08:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="IyXJleL+"
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04493224
	for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 08:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721118504; cv=none; b=jxp5+0JtBqqd9SckPvdeDbi6pslCMpTFxzdd/KuxPlnUos17KR9tAbOG14JFZyv1Ty2X2frPmp9151Ekkgk+Tbw/1N1TiZoFveW0LPIFouEF+Q1rt5onmj7v+w3nNkuN9pcN4Vnmajzw7DNUAavYdvBfKuebmWVarEjy8x93BFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721118504; c=relaxed/simple;
	bh=hH0C+hMRrQebClCKrwJVUyAUbkOPif1mOqS4Fo/9xAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SWp94HGVOhW/Qr4JigUvHXQFd3KCqUiIYV0d6LYRuyRiv5lxDUSqWFqJrsnKCZjJaXfiq6T/tjnG099p7SH4EA2j9b8ryFtpgHngl5wmeNI5KkeTq8C1fBlJbfBbHTiZOiY9qpX+j8CFSm9S8QRXEfHaRVOYmJ9tzN8llPHt2mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=IyXJleL+; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e03db345b0cso4922075276.1
        for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1721118502; x=1721723302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvpsKqJKseTB8512E3EM/mcg58HxToRdE8EyOPRZHqA=;
        b=IyXJleL+EKXIZpq0zh/7muMoo8e8pRR/o4U5ipfnS0lPYNwMuVrmMVmtZtRfMvSZFl
         NAOcrFiMfi9vrtT43Ij9CYdmoO8lRynB/GEk1HqBanA9wOv6midOCvWaFBRnWIcgm2UU
         6kMwBRXpRaTGyyisS6LFXzaV/xPnHhu10YRd33VjgEHwcgPOdh55LZ42WCgPqXbni3pJ
         SFv/jlRfx3q22DvA/1G0ohdVhBxNkX/aVNJCMpQ0hZkGWzzHFzsSu0t/DdnYLU/tlQqk
         2kFy+IjZpSmsHsqBrsBfVNz3SQTkMAXubFT2zpu0Z8/0OLFYH9p/VPEk//ItgtCmTH4a
         F3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721118502; x=1721723302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvpsKqJKseTB8512E3EM/mcg58HxToRdE8EyOPRZHqA=;
        b=TgihJA+llVoLnagIFETujXmXxTX0bQpFYaZUvY7QyxNTbDQw2RgDI7EIv9Yp9FSgJy
         uLNI/NiRYJZc+e7Zr1SJLznIHqn7VbMQTGLtyo2+myK2+UcJ+niYuCvjvjaOc5prwrfW
         EC4Ehq/rpu+YvluqZQSf2iGziijynAXpo8PtspLl/ifPLcsVDsYoiyLo2mrDgZqE9vTm
         CnsgLNj5HKHXYq4lBd7Ixd16iy/REq/INGLwsXVr45HsvH55/OegoaD6ZKhFOgRXt34Y
         x/HfeFnPH0Kny6WHr1BMPxPFWKej0aNRhuvWwl0Cyjzosnw3jh87dVNwMWBFydxDL/hI
         OIMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4/3/QpZ0p4jP9DuwxoaGfeYDgBwGSr7DWs/J++Lt758H7FsyZmxL/TJn5/BFKJHgEnJDCGTkriMq2baXqSqO1SZgc
X-Gm-Message-State: AOJu0YzUim1BhP7BUXguwfztrzIKyltmqBnaPCRQAa2R/2WeMNNDMG14
	P6bZHUgVz/7kAsEXj1N1tzuEOF1PI7H13XxIiBTBweq0nSiSsiFCJIYEZaZyoVM=
X-Received: by 2002:a05:6902:118c:b0:e03:617c:b0ca with SMTP id 3f1490d57ef6-e05d57b9547mr1740748276.46.1721118501903;
        Tue, 16 Jul 2024 01:28:21 -0700 (PDT)
Received: from localhost ([157.82.128.7])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-78e33cb61b7sm4469874a12.34.2024.07.16.01.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 01:28:21 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Tue, 16 Jul 2024 17:28:13 +0900
Subject: [PATCH v2 1/5] tests/arm-cpu-features: Do not assume PMU
 availability
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240716-pmu-v2-1-f3e3e4b2d3d5@daynix.com>
References: <20240716-pmu-v2-0-f3e3e4b2d3d5@daynix.com>
In-Reply-To: <20240716-pmu-v2-0-f3e3e4b2d3d5@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: 0sklcrTShEd4

Asahi Linux supports KVM but lacks PMU support.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/qtest/arm-cpu-features.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 966c65d5c3e4..cfd6f7735354 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -509,6 +509,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
     assert_set_feature(qts, "host", "kvm-no-adjvtime", false);
 
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
+        bool kvm_supports_pmu;
         bool kvm_supports_steal_time;
         bool kvm_supports_sve;
         char max_name[8], name[8];
@@ -537,11 +538,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
 
         assert_has_feature_enabled(qts, "host", "aarch64");
 
-        /* Enabling and disabling pmu should always work. */
-        assert_has_feature_enabled(qts, "host", "pmu");
-        assert_set_feature(qts, "host", "pmu", false);
-        assert_set_feature(qts, "host", "pmu", true);
-
         /*
          * Some features would be enabled by default, but they're disabled
          * because this instance of KVM doesn't support them. Test that the
@@ -551,11 +547,18 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         assert_has_feature(qts, "host", "sve");
 
         resp = do_query_no_props(qts, "host");
+        kvm_supports_pmu = resp_get_feature(resp, "pmu");
         kvm_supports_steal_time = resp_get_feature(resp, "kvm-steal-time");
         kvm_supports_sve = resp_get_feature(resp, "sve");
         vls = resp_get_sve_vls(resp);
         qobject_unref(resp);
 
+        if (kvm_supports_pmu) {
+            /* If we have pmu then we should be able to toggle it. */
+            assert_set_feature(qts, "host", "pmu", false);
+            assert_set_feature(qts, "host", "pmu", true);
+        }
+
         if (kvm_supports_steal_time) {
             /* If we have steal-time then we should be able to toggle it. */
             assert_set_feature(qts, "host", "kvm-steal-time", false);

-- 
2.45.2

