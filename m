Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802562njk;
        Mon, 2 Dec 2024 05:14:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUPUf8HUV9n0yl9SZJ3gM6uOFx6q2tSDGqG7y93tDDDSsYoCl9BY9futpK5iy0XJdXXNlsHOoL5DbGgdQ==@linaro.org
X-Received: by 2002:a05:6000:1f84:b0:385:e90a:b7ea with SMTP id ffacd0b85a97d-385e90abbd6mr6005336f8f.3.1733145291510;
        Mon, 02 Dec 2024 05:14:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145291; cv=none;
        d=google.com; s=arc-20240605;
        b=jazhpXfyXb/JLHioJReJVTeYcdBFdfuV8ATuED2HUTSPm3+sXvsdkLzQUzYamjGfUA
         /cHwwz+r+M40YWO7Kn2DVXunCxzalYlHLGhtbgA8kSbxOWnlw6riWC32V2lW+UI+mlh0
         Jc87HhBYp2TAfl1jtLM2FCmx887vg1DK9wqRHoh/9ZIAfdK3H8wgyhPazEQbok9y3Zop
         uUx+5UWbKlptem9vH1GrTYYDLl5hXYzrx8JlAuJkjxwNRkh6nO7GYOVYiHlLcsMhJF4E
         T6VbedbuQMBx21hTTJKuh+fvwKkxOgnMFn/F3Y11lj4gGYyES4eJwT55tdG0htySx+Qg
         d8ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1acc7zoNKrBVtOlWY+W2T5QYcrfhAL8i8cxJ7BeDz+0=;
        fh=i/pny31ZTKeqJr4kQu699KYQHOS+XCW3hoff5WGdnzM=;
        b=RkOK23t9tQo5nENjTJfrrksolZHi0EDtWB2hGK++PCM6rxEpQ+PxejQqvGL3gu1cOo
         aUrJWtBKhaJplCLPP9e4ChHSt/5J50nT1HSU6GF6kxHI8k2PRBTQAwUZrxeSaxi2FpOW
         aMXJfpkZQWko92lTLw3n2eqQiZJ5md0gtynCPfYkfH2lvZTewUKJm4eC2p5veVwMgPX3
         gxORrBhZ+HR3pmUcOuM16K7ZWXqPHeFBAl/R5ufJHP3XC2dfxPo76Cc5f6t0BiFP9QSW
         8+408CapkHIJ2gpqnhO2X0bT026eax3P4qBOQwjK6O71BWwIuI960YekOueP1FaVpJXG
         Lypw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zwLVaLTg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385e37c57ffsor1125148f8f.5.2024.12.02.05.14.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zwLVaLTg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145291; x=1733750091; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1acc7zoNKrBVtOlWY+W2T5QYcrfhAL8i8cxJ7BeDz+0=;
        b=zwLVaLTgqN/Nq/Pp+wk7BiGu4BIifW4NpqR4ATsf76FEK00Zu6l3YkorpF9LXhOiOc
         m8UgUULxeh5svOIK3/LU0NCYDE78ZCkQE/SrSaud7rCDE093WeqQscWIbJqBZMNWIBW4
         4EOi22mMOgHcN3l/wZyqSy5krB9l4wd+GD83oueAc4JDJgyPijKMJ557ur6xFXPptYx1
         9ipk0e73cNCAAhHd/DXTCcXZdjAci4LAYs/oRwskdEnL+ajY0Y7HlRg24ur38uPavIm4
         L/PPolwme88boQbxV4zuXHOO2/+3IrgSv/MYG4rdBDczAud/V6NZ1xXEJQWmg5tIDYes
         PN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145291; x=1733750091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1acc7zoNKrBVtOlWY+W2T5QYcrfhAL8i8cxJ7BeDz+0=;
        b=plu7vbDq2dBe43x3fm7H2DSnCuvkW4JjK1QhkXl1oRjQXejozqLp7dot/cIM37X4dn
         JKif/fLzP13lPpbraWA2bbhNnDddN23y0yxOp/iVPf8paYkgLljQcbifVM0vEW61jNBM
         h5HsVZU5SUtzSN4Vt7kpUGSFZ5wEC5Ub4YODDzgIz8ybVJU1Xc9a91QYYSnRl10pCd4k
         NRxUywCCG4TgRbEKJPr0wUrvDzBMxvQHLq/h4tgzhciOzbh2zVW+uWu5yStREkOtAlUs
         QYKBFfpjV1aaFBacf8dlbryHXQwC75qGCgoLAJ1OxPJtxSujnXwXWE64EWcYZGrc5l40
         DD3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVf6VAz9VQe8n4BxBFhMp+IKSzJOG/NPuq25pFieq+syoPTxqSDmMqDm4x8PC79DXQPzO8FQf8tHYq5cA==@linaro.org
X-Gm-Message-State: AOJu0YyhJAOjTCytu6OjNEBX+FmhfI2HIQOu24dTYBVh0SZRaRHS1vpn
	po2ZElDnu63oPhTAFpC5Or1GVfsR84UvUmNH+PKbqy4+1rY16kByxLu94PCpUnnzig==
X-Gm-Gg: ASbGncvr1mMHg/mJXgvIUeWOIsgPyRsVJSMG7d56nd+OfWI1EN1vVtPsdtTK8FFmYUC
	ydXfe8iCkap38t2uiua5QX4oe1NhKNwVaMhsFhWArjZDQrRZMs+0VP0P2HBrjGXPTSxPoACP0gJ
	BS4vzENq3Lzmcpjl5VFJuHD3LFJq3gYScFk9lPx0319ABoo2NoRmZhIiKTkb3YdLT9jNqNV9e92
	uHmSF79gWEu2Sa0BXIIUdwrGte7w2dGoqfi3rvCx7QzsQtOr5DXXiI=
X-Google-Smtp-Source: AGHT+IHNbge/vZMLc8RGd/dZFXD5GsVkV/6of92W3el18+GZwhG01NfV23T6gs101y0B+U0NJB/gsw==
X-Received: by 2002:a05:6000:178d:b0:385:e03f:7553 with SMTP id ffacd0b85a97d-385e03f7608mr10721053f8f.9.1733145289443;
        Mon, 02 Dec 2024 05:14:49 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 for-10.0 44/54] target/openrisc: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:37 +0000
Message-Id: <20241202131347.498124-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: odbxpJNHtO3F

Set the default NaN pattern explicitly for openrisc.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/openrisc/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index b96561d1f26..3ccf85e95f0 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -111,6 +111,8 @@ static void openrisc_cpu_reset_hold(Object *obj, ResetType type)
      */
     set_float_2nan_prop_rule(float_2nan_prop_x87, &cpu->env.fp_status);
 
+    /* Default NaN: sign bit clear, frac msb set */
+    set_float_default_nan_pattern(0b01000000, &cpu->env.fp_status);
 
 #ifndef CONFIG_USER_ONLY
     cpu->env.picmr = 0x00000000;
-- 
2.34.1
