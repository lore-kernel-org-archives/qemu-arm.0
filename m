Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19585njj;
        Wed, 30 Apr 2025 23:24:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGe4F/l+GkglXVth0BWLnO55O0tbXhZ7krC3NYt9zMxe3u7yhSG58H9DAELMOTHAulkrGHQJVSvQmRMg==@linaro.org
X-Received: by 2002:a05:6a00:114b:b0:739:4a30:b902 with SMTP id d2e1a72fcca58-740491a4e5fmr2163068b3a.2.1746080644341;
        Wed, 30 Apr 2025 23:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080644; cv=none;
        d=google.com; s=arc-20240605;
        b=YFhy1hflFn/muxQ2TjoiNYk+o3lPCyhA/5GsFOOm9dBGxL+WYHX/YAHFiQfJy1yQfI
         0+wCdNTvEjqPjGcS7lerWKpwLZoC2PUeSOAPQEVAOrRfSZVE0U3YPQhQsJ8mFU1WuvR0
         idK0k9BHhL3tPAAtR1vrkQOx885JARWXbSf5BiXQVkWFJOT3g9R8RU27nwS+hJyPBrGt
         u8OI2THW/nBNBQCWKALmqX+QbMCmbnny7mt6ZOuJs72mpoZIXGQd8yrWeGXeX7DigFk5
         N0/XsSKHSzg2KcKOMGyp0lLPXgP0Ilhz574gnhmq0ZV+8HtnYmVDE6eDdxy5e/iyNjRF
         pn9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nytbMb4sgZrZygEF1t706bwsFhUC7rAu+zrbjRJ37jY=;
        fh=XHe9RFgT0HVJkW4SoZCJBKsWOxLWdOJ9IiknfBHLUTE=;
        b=iWLeNDSd8DSgG4ILrhbY6QmgLMDdgTxsDKudNvsP+Mc2bH8i2uBP3jSnA7qTlyuPpF
         KUYFlD6wt+4g8lNc6hqHwX3W7kZ/ITmI9ppARinfPCeWqhVtbkhjR5afeYZUl1dBTSRo
         dwO5GMSXrhetgDCxT/w8nVTYyeNC0/ikD+D7dti/kN2jZnzdeDBiXb59e6PortMDHGb3
         JNoAaTowS7FKWl6tM9BbuHZFAm5HhRMcVq6pQ2M61XMuajGG3QKxnvOFt3Eqdhh0jGeg
         hCOq++7OpV7gGKDydSQY+HdyOlvBF1pYLChns49uQjJho+J3oeWPPaku0G0Oedufbvb5
         x72A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QkamPrRe;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9dc855sor62814b3a.8.2025.04.30.23.24.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QkamPrRe;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080644; x=1746685444; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nytbMb4sgZrZygEF1t706bwsFhUC7rAu+zrbjRJ37jY=;
        b=QkamPrReWDdVjKDXVgckgqQyZ4Q1oyqRVP26pE0FYwRB8AejoVWtJa8tWs7bK62anC
         MJKJuhvZw1ZY3OzW0hIbou8W4DljmC0PqmxHS4JJjXh6iUbSshoiKX4R8B7k6tShFyv0
         WFDGUOwb/Hy7GufgV+/W0wmR9nfsdXtHb/eKmAhkWj/vhBx0JN97w0sJTgpPxHN9gqVa
         BhN2JANRJyt+MJDuhvoSbdgxfNtLWW41lzrmLwISy1JzPQPryW46BTRbWc+4Hf9kP8p8
         HS0M7eWO7EEG2NOvjh9tJRpTTM9EsjD3VUarn0czdeonFXmcp2G5EM1FXZoOCgWeb7sS
         jsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080644; x=1746685444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nytbMb4sgZrZygEF1t706bwsFhUC7rAu+zrbjRJ37jY=;
        b=JTXKza19fuWWiKBMrhgAp4ztDz6xdyRdlNPvi7knOrRqfJWs2VSCc5Rh1JejmaFaS3
         NfIY3jeu/0Chv+rYnOp+kL98DeUIzPzfDG2PD47lYg4WJEtd/MdPHeSDChdRoo5vEK2B
         l9RjJZjnFIdXir19OQgrSjYzL1OO2DkDyrXgAErqjcJLmblxJ/qWJ6fWFgjh/xHgDqeE
         Lrl8rumYR39LVVaR28OcHxntAQrrxRTKcAqnjD+faArS8pEKcbyo55KkhQQbJNH4r7cl
         zWQID8IWTAztpbOgIJBflkAk8VE9sU4esCsFDA6vQBllW6Lz3hFQRjQRHdSq8vLK2tYv
         MqYA==
X-Forwarded-Encrypted: i=1; AJvYcCXmrqlgdsHPe60h1EdaLFldfNv10bPPj4hIG2L3OyC+j0vZvc/yK+cgcbjEgotc789ygtDJiz0awfjZTw==@linaro.org
X-Gm-Message-State: AOJu0Ywe8ZszSN5qlwDWB3rwUYL8Z5C0EBlGKoBV7F17/kepLlNAEWz3
	wI007jLu7qIgXCt6c/CnbhTXhbVLptHuWGGEmiXHEGNkzOdX8cAZx7ctKGMuyAJeIw==
X-Gm-Gg: ASbGncvaT88IxhNAShb4hLMbdZqrm9zLwL68XZCW2bAG1V123xVgdwMkcr/5Y20/ByX
	MmVFOz1T3NnowcbiqUMKg0Mu1j4Oh6ZoKhmzcFusO5oiXbGtRaGPydfdoJiLNhNvwXCQUoeUBwi
	WKz5wGzoaebhwajWN7mdpb0/+jElxhqs/j2LmZ1TCwuWiYIFBtaAG9pW4zRJSM5/sLXDax1LjKv
	KX5pZg4ft4Kn191d5WowN0Wao0pIlkEev0a2wFdpwmj6X93T4IQalO2nh20OGbMs3q6sDvYhsGv
	b1GQCd4kw4G/VN7wLOyryvvkEjYRYKAF40nqZfra
X-Google-Smtp-Source: AGHT+IHfkV3iPRLyjYnlQE65kamxUee+Atz7k3DbAE140bq5p4dc3YmLffIe7x96k+PR8VB6puKHcQ==
X-Received: by 2002:a05:6a00:179e:b0:730:95a6:375f with SMTP id d2e1a72fcca58-740491a556cmr2192248b3a.3.1746080643897;
        Wed, 30 Apr 2025 23:24:03 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:03 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 14/33] target/arm/helper: user i64 for probe_access
Date: Wed, 30 Apr 2025 23:23:25 -0700
Message-ID: <20250501062344.2526061-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: izEJxIW4Mm9R

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.h        | 2 +-
 target/arm/tcg/op_helper.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 450c9d841bf..f870b707c7f 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -104,7 +104,7 @@ DEF_HELPER_FLAGS_1(rebuild_hflags_a32_newel, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
 DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
 
-DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, tl, i32, i32, i32)
+DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, i64, i32, i32, i32)
 
 DEF_HELPER_1(vfp_get_fpscr, i32, env)
 DEF_HELPER_2(vfp_set_fpscr, void, env, i32)
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 38d49cbb9d8..32344bd06d1 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -1222,7 +1222,7 @@ uint32_t HELPER(ror_cc)(CPUARMState *env, uint32_t x, uint32_t i)
     }
 }
 
-void HELPER(probe_access)(CPUARMState *env, target_ulong ptr,
+void HELPER(probe_access)(CPUARMState *env, uint64_t ptr,
                           uint32_t access_type, uint32_t mmu_idx,
                           uint32_t size)
 {
-- 
2.47.2
