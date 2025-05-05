Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178875njj;
        Sun, 4 May 2025 18:52:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW6x6ey9gj8vpDXBjQqawFt3nekK65o6kXENlGAuREf+lkWldnlV9+USdsbzvORZzvL5/QG2rWr/O8sGQ==@linaro.org
X-Received: by 2002:a17:902:e54c:b0:22c:3294:f038 with SMTP id d9443c01a7336-22e1ea70061mr70474865ad.18.1746409977424;
        Sun, 04 May 2025 18:52:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409977; cv=none;
        d=google.com; s=arc-20240605;
        b=OH8fWzc2VO0OdKZ8JqERGLMsNQ9CPmj2dy5dtn2ttrLD9TG5/pZq7yW8ZhaMw3zNeY
         N2E+MaPoB1gtMm6mAIeYWiimmICYl4UqoQ0SA/Tw/pJ7RE6n1x2u7zIXZSm5kppDX6ZV
         XM354AAXpw3tApyysQ3CisSHsWVfHjsQwxiOmHEtGw2MFPc7DvCWLSB2b44ntoGI9f19
         sJmy1XsjfTfvaabO/njy07+ldn1qXs/sBttqhBKZiWEQiSNqPqRRSuRVfeUoA2Wl2S9k
         3+Ep4BzIEKt4CfmVekut3WflysGkYIwyx/+LlHQY6JCONJMx2MK+uVKvbNTtqHL3xbzE
         WhLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oEdUza85WO+DzwzEMeWL7z4M0hhaS2RgQrae4P4VTDk=;
        fh=v6QhBXt9l/EPtkbHNqdRo0eoAN/88Xz1yRZ2JlS4Ll0=;
        b=gjSMsAaSDskx0++HlPUGlq1HlZS9XYJhg3LgEvMh9stfytjxcCIzPIljC/g/aOwbLU
         1En3W+1UlNrPjJMr6kDSn1+B1WFbFRUAL/zdt/xTtsox6ynx7deuPql52/31ons8SOj3
         vVVj/Xk+akTphBlu7FdRZiHCeeM8tkbcWDguJH1g9inZxt4JgiwA78lapSsKPT1mwfNI
         ZmEhRzcztE6jtRUpC6wyMBdp9Vcd+c1rHNycoSGisceISQSi7rF9Y/dDYr5K0cINPUX+
         L5rbbkXvg3Q7xldHMuuplgdxUjJP1TFA6K5qHI6rmAWr1vJUlWKMnc/JgCWHN7s2sLJg
         ljVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ODjgT77P;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9e8a53sor3805564b3a.8.2025.05.04.18.52.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ODjgT77P;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409977; x=1747014777; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEdUza85WO+DzwzEMeWL7z4M0hhaS2RgQrae4P4VTDk=;
        b=ODjgT77PZ8rYbLOv93EDIyv3rnXOWIhf4Yx0zOuUXKiK01EAU1FzE5J3H4r3BukBrm
         dgZf4f2maKSSlSCysSuSlBIRF0xuYROjPfEyNlRPYdwO/S925o2XcKY3Gc0wWIW1p+YE
         PzNYhkRlzeEMR/DDWyi+8cfHZmqVs8mP5As7HO5HxyN8A41YKD40wPpECxQd4I2s8pGz
         yLtxgKexq2HFjXCRlRAxLGHncQuNFaDN6Y/9CVqOmgS+hk0PoeKuowx4cK6gP7PU5IRA
         pzEhhj+yJpoFAPhsYuEh8anA32gQ8+R85KQrGTD3xj5hFhI7e/9EwTbhm70z6f/BguY0
         Ll+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409977; x=1747014777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEdUza85WO+DzwzEMeWL7z4M0hhaS2RgQrae4P4VTDk=;
        b=UYytV5oe7S9XfDmg+NbIOAyXychCZ4kMTJn6zPeRyiJCnjF0a2nuIppUzdFFScQ0f9
         Gs5A8yQaoQPuSkBX9RQ3ehN7P/+PQTVaGN8b4hmIthNQLydPwjvdR6MBTbz28Eq46Hdw
         o3tZMRhPd+I2AYKCRwb/+AN4dgwWa6jCj4Ck3y7T53Krx8wzOB3Hr0GNRUREhvlXHdmy
         xgXa3ZuQdDDY9mDZEIcNs1BpUXZa04Z0pYSgep1EFUQOxGMVxNAcxT5JFYLIeNDV4xm4
         YBcfLUiPnVemjlYNcMb5WCAmFFsXSfFmS7gJ2fST0MevqzWWmrSHnalYt5kvUGsrbznK
         Fhjw==
X-Forwarded-Encrypted: i=1; AJvYcCUfHYi5/zQT7z9K2hodGAPfWkGUbOtqnfxwDoP5SPJpJF4pB118HjUI1MNaQt6meEfVmkGvDvePV2Jh8A==@linaro.org
X-Gm-Message-State: AOJu0YwjE8QLftiGcB5v+Y22pptZEyAQXa6hdu9G7M9LJsYmAMK/cj3F
	g55R6m2HC0OF/Q6LAQTu+gIYK1MU5uqt1C2v69VsEXOJSrXShSn7jObi85b5kSDQlw==
X-Gm-Gg: ASbGncuMgqN0yebE3DyZZUerSIv/aFRpufdL3ig2Mmvzp95aOR2JsFEUH7pp81tI+Ot
	FKYDj4bGVPRQw4bPe2HfOiKxKSIH4txj8nU68/VOg6Xjfw2Czl0QRgEmK/6hFEOFiBx36TTd6ig
	wdugA0RmImWtUrJ+AiobIXQt8xcGdDltuK6LUO2Km3LkeCIA01g5cJklPT2i3+7LlczCagoEWNY
	vCuPM5S16TdhHZn3p11/S9xH2q1hpsO0rimaEes3gv+6N+p4yMGTxNOCHUJilHKV7ueDo+4cOD1
	BsG06NUSpKTHHZ2tKpODg92FhGT8wY/En9LrQf7j
X-Google-Smtp-Source: AGHT+IGxlO9gTykq6ulNB0WPj1QemoIP4SS2JOIADwz2/WJQVG/BKVmUJZdt8lSEKyp+6CHlJm1dyw==
X-Received: by 2002:a05:6a20:7350:b0:1f5:535c:82dc with SMTP id adf61e73a8af0-20e97ea92ffmr6762334637.42.1746409977012;
        Sun, 04 May 2025 18:52:57 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:56 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 31/48] target/arm/ptw: replace target_ulong with int64_t
Date: Sun,  4 May 2025 18:52:06 -0700
Message-ID: <20250505015223.3895275-32-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 25wfbt545KJU

sextract64 returns a signed value.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e0e82ae507f..26c52e6b03e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1660,7 +1660,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint64_t ttbr;
     hwaddr descaddr, indexmask, indexmask_grainsize;
     uint32_t tableattrs;
-    target_ulong page_size;
+    uint64_t page_size;
     uint64_t attrs;
     int32_t stride;
     int addrsize, inputsize, outputsize;
@@ -1733,7 +1733,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * validation to do here.
      */
     if (inputsize < addrsize) {
-        target_ulong top_bits = sextract64(address, inputsize,
+        uint64_t top_bits = sextract64(address, inputsize,
                                            addrsize - inputsize);
         if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
-- 
2.47.2
