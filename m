Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5748615njc;
        Fri, 22 Nov 2024 14:52:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUn07o+mQQpCM3ZVPwt3Fm2WeJjh4dlvkqavkuDYJ2pmynXRmlQFZzsFEMo5vLdnP+aTGztpKnnwBwEfQ==@linaro.org
X-Received: by 2002:a17:902:e551:b0:205:8407:6321 with SMTP id d9443c01a7336-2129f51d3ebmr61138825ad.9.1732315929261;
        Fri, 22 Nov 2024 14:52:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732315929; cv=none;
        d=google.com; s=arc-20240605;
        b=BysEPycgzREjroBreo29VDzxfDuOWo7l+AGcd1NNu1DPXeSrzoXskXNNpO67ogWuzM
         JDBLCDX1P/AWnYhzd1ngg2fZzXFvPOphOexFVC8SUT2XjlRspRy0CtUE44JCo2cF4SSv
         299JhVnaG+Lfe9lxF9gFxXNtwNuJc72QhfNDFbLsw04qwM002Ix4kErqT1S1izraTSz5
         59uHlVQTt7sPSYWQxYSNTuU5oizxQUjJ6cLcm55YEEz8h35YJaEf4AQfKvpoJzm2li+9
         oMP1xCofqhaotQ7H2sd6OyAOqm8RNoQq8rCu42tSkiMdtlGPi0pcSb2bNBK0jMNaYvQ2
         cJMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bmstBEWZ50Za7IRe6C2dqQ3XXwaKAhfyFkBFHFaPams=;
        fh=u7llOYSjTkWRfMddl/hwUDidVMLJx1IUkSCvQWhMayc=;
        b=Uu64fntYyHfbH250tDSKY7+CFXLJFS2AdNpJnn5LTLE9sodiFIw3nCSXrV6LSOPItL
         Q+IjEQrTLemLoUbMZ5/Hn+V9emQi2kvi+CDdwOP2u5unHdCSwvOi7eQ5Oc1jPEx8Zrts
         VPOZhQlPlCizsUNpTcvKvbcwPSemdP4BdZ1L9PLavUOUu8Yv4HwcMqwUwXi0WNTZZWjP
         DC8s/k202w/Zu37Wt3i+Iw72N/YXUscvM6pc7ugU/PPW1ZM+bU+OxMo0mf3C/SDdkkLe
         pX+37A19v5TBomFMLCP2nwnBQwQyiNzY4WLPXtT6oP0OT78J8pAvtkj7RXjLxRibBh2e
         7ZWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=StkXsRWl;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2129db41bedsor22772755ad.4.2024.11.22.14.52.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Nov 2024 14:52:09 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=StkXsRWl;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732315929; x=1732920729; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmstBEWZ50Za7IRe6C2dqQ3XXwaKAhfyFkBFHFaPams=;
        b=StkXsRWlWv9GXb+DGooezPkBL6MGsH91bIaGrcLaxAPpVDG7aWnfIaOgVSz6mkrb2z
         Gx8yiGX6Je/b9eYqCr+FBDj4QjyDc00gL92gDp7fAu9mAkpYPTJShMbiZKu7TU4yUrOg
         hHHIN8wVLviwqCueUhhE22BTJue2+m58X4BWwhTvbCB2N29tmf0CsBVKsqkeDzfZmz4g
         /b0TdBFbPhMvfOjCcPiuhpuJkH8+5oR09GImswMs00nha6vaGud/cvfW2Kn7hRoZcnRk
         UHB0t4bdwa0mEXfrrc2qn0tpLrqxWZvNcO6a11WI8Hc1jHPsit+vw8YuPDuTBhVWAsHq
         WRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732315929; x=1732920729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmstBEWZ50Za7IRe6C2dqQ3XXwaKAhfyFkBFHFaPams=;
        b=JDWmPDeaQ/WAI/+2jYsPKox/rli5IiU3xkNdcXv3Bsgkc3OtQpuPWDLonMXQbBe0tJ
         4fTQXE3RPdXerEtmJSvzm3jIzX90GZWXXeECj8fW1F/GltFwSxbmSebh4OSkZtINGIb6
         G8GBm0Pcu3sDeMEME0qHvzwo0PMsxKt2jry43Hc99ZNU94i0FGsk363F7p8SQ2rx9I+4
         LD49uc+sW9SuaD4NNIPmOZi8P65k1k7POGxVZRdktm9MCT+PZ+ft6VV4kVi4iZddon8l
         rLR2OswOIJgB/7CTtyYNLtsrKRF64GnK2qd79WdQS3OwUKgCyjAHesJtLUMpBgE0ZX95
         VLKg==
X-Forwarded-Encrypted: i=1; AJvYcCUKjFm/ZgHvr6durmX+L0/pXKzIYbf46mtrC7uhcKSrzJnnGPSIefTqMb9t8E589+YkJPG9WcmLpb/Wqg==@linaro.org
X-Gm-Message-State: AOJu0YzIOve4h8N4hNJPUORQzMTY6fiDuTAhmLXyz9esAQ43NSrMWTTv
	hcH860X+l02rsgtUDCnaOr97TMzWyFdX4iWF2jN1vv7AkvAdTOas2qeNfbWTmsqR2LTBZgkofpZ
	DJbI=
X-Gm-Gg: ASbGnctBjLGci/m25W7diqkuqWBYF4DtMk4cI15IL4J0rUSgLXKywLUYKqBSg558jwp
	oh39VTG8sr54YgjYiBUc5lvpgAz7Pg5SLdqxvE29BJqFWs1quY+xgZ9/XQcmIYfWR+JYJA2xpyR
	GAmIdFIP5F8cc720SU7q0nNcEnkxYllBXqw0zxHg71EV0zechCLcfvt+2tu5JhYD6ZqqgT3fD2O
	mC16EGKkeGyI0BDCFPofHVajxk4KE3Q76yixI905z1UFH6kWSfWaOG9rchv1KI7cLnSSZBDwmwb
	u0qk66oTGKvfiw==
X-Google-Smtp-Source: AGHT+IEavfSCRoqZrbP2bJNUWIQ21VT2wKIqeM7yraG1CvXU601S5Uvxh1e6I8D59/bEmcPZq/nHzQ==
X-Received: by 2002:a17:902:7241:b0:211:ff1c:e611 with SMTP id d9443c01a7336-2129f576484mr48093465ad.30.1732315928808;
        Fri, 22 Nov 2024 14:52:08 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc1539fsm21450335ad.192.2024.11.22.14.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:52:08 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	alex.bennee@linaro.org,
	Steven Lee <steven_lee@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Troy Lee <leetroy@gmail.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 05/12] docs/system/arm/: add FEAT_MTE_ASYNC
Date: Fri, 22 Nov 2024 14:50:42 -0800
Message-Id: <20241122225049.1617774-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: yZGEIjZOT1AK

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 50d0250b1eb..47f5123a31d 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -94,6 +94,7 @@ the following architecture extensions:
 - FEAT_MTE2 (Memory Tagging Extension)
 - FEAT_MTE3 (MTE Asymmetric Fault Handling)
 - FEAT_MTE_ASYM_FAULT (Memory tagging asymmetric faults)
+- FEAT_MTE_ASYNC (Asynchronous reporting of Tag Check Fault)
 - FEAT_NMI (Non-maskable Interrupt)
 - FEAT_NV (Nested Virtualization)
 - FEAT_NV2 (Enhanced nested virtualization support)
-- 
2.39.5
