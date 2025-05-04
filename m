Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756202njj;
        Sat, 3 May 2025 22:29:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4Hjc77Mjhj4xJvYUIESwxRSX1mKlI52gSdLHcwKoEmNstiCpoCdQhrZvJn+nNVVCRbCKWF7ijP0XPfA==@linaro.org
X-Received: by 2002:a17:902:d48c:b0:224:255b:c92e with SMTP id d9443c01a7336-22e1e8c3f01mr42696575ad.3.1746336588745;
        Sat, 03 May 2025 22:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336588; cv=none;
        d=google.com; s=arc-20240605;
        b=ChArHIrt/LvCySjb6Py/t0P7xQStygOkIhrgY17TkDGcbKxhbczsXmn7WJQ11IMl5Q
         WenYxSz73qWt+zno6r9ShD+0tck7s1oxveqTn7Dm4AwZTJzIJJ3Ddgds7vwrh0SV5Wc7
         HUwIAkAKGEJCgkSNT48KoCAnZf0Kl0ndTOqYxEn+4yvmAzPzs0R43TkUsin7qksh2/4R
         RRYisVjde7laYjC8MDmyhRz/b3Ec/kye6dlR4mxamA6IuJM/sKl/UOzj6Dd0j+e1VsKo
         bAEcSDPfM/Q8c23ntw6B3Jvv3PjL56r7w5pPCbySS8jkFQ5+b5rbUnta0uFE/S4LsfEO
         lu6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rZlgeH+rY7gWoAJ7wLcP0EAGnraHtpI1zUMj9EMPIpQ=;
        fh=h5AJDgQgjJDZ95n7SI4ZQkRqZHxoEKKiKpTiZs7d6j8=;
        b=Nxv+S1AolkACJ9u085G83dbcZyU3CDMoWnMcqKECJNyUeuF0om0pTS3vV29/1gLYch
         cihHAwB8HC5juzvxQSMJ2few6IEOHlDhLqpvnmcPzyXaswWQcs52WMyVDMfsplwM01v6
         h9m9DZ7H+NBGCq1dPJuQLN56c3whumdSIgoPmMQ91Xnr9aiiXpTae3CL7P1qFIe/DtNh
         ySiRl8Wp+I41VzpjoOS0O7L6ZZoSFT957maRmgs+wbUl4vJvUvRp7DBVq9zPHx7qXvfl
         iLBSLGWDVtKL1w9OweBkNlyrE0a5Kr4stXS+nqUx7qMIAsA77lrUSwZhMcwupImMWu3k
         QWWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GDcm6y9Z;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb28f90sor54096805ad.6.2025.05.03.22.29.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GDcm6y9Z;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336588; x=1746941388; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZlgeH+rY7gWoAJ7wLcP0EAGnraHtpI1zUMj9EMPIpQ=;
        b=GDcm6y9ZmrEGuhuN2ybR4jHVePBglZyLTxVgsVYNMcZoEWuJi/1/jXECmQpW3yWnWM
         wXkOA8qP88bPzHp9lsY9nWJZ3Qn7U69FkrMYeQvXcUSbvZjieDZl7KHfReKAmlr4kEui
         ocDXeHgg5o48tpKAJQiMKDrBzJhe1Z4nbFOauYIzwbhuSd3+PwvVjQ/ACDovRF2BiAW6
         TiwT0FpZJ2zOPxC7UBqvAa9UJnYHTqFQzCilUvpGTKIZhbw3anIuqVe0UReR9fY6S2ha
         +DWtfMiN5sA7nXk8dg4tkYBMI5DqQ/hwgw31X31BVcvrf3sbumnFpZMEX3KVs4gNPpUp
         DF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336588; x=1746941388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZlgeH+rY7gWoAJ7wLcP0EAGnraHtpI1zUMj9EMPIpQ=;
        b=OleLk9kbKGp43gWJWosgAWlhePzYbVsv0FPpIgd/IwDCguWO6YCT4WZLajkZ+3tD0F
         b2xU6DPV2eXoD2A8b+rUO3c5Y5gTJssK2mU5oP2p86KyLBMGVUVSCqZW6ftrW7+6ADX6
         GukQk9LOkDTg01iTtPWquInwYKDhvhol6rEBY4lKiK5a9UrALcbw/FDcfiwLtmMwy2Bw
         CQImxZ7ZcpTzVG8P6rrt4ZpUbIF/mUK1Wivl1gAZauisQ+r28r/SgTQX9EVeE8QbDmvF
         CZKftw1OPXE3oXOzs4A2vZmSkP9zM/QfKitJGBKgQlo310JDo1WRj/aL/eQSpWFRvxSD
         4HUg==
X-Forwarded-Encrypted: i=1; AJvYcCWIcXxIh2myN7j88otV1PmoHT38sWvE3C+Qf2MuDZo3yCCZGQUg3QhN87FO8SderdBTYMNCAn6e3ZGmIg==@linaro.org
X-Gm-Message-State: AOJu0YwAnqPSakUXLArsSXwspjgu1JAfHQ1qBgcL++qnfUH5htwMjEzs
	123FkoGYGq8M9OrI3Gw8IkFv9HpDCoV7fDD8WCmy0IaIh2sh1tiHq2hTvh2frd81kg==
X-Gm-Gg: ASbGnctfPW5kh1ciPP4Dpby43Gjge94aYD0t8cwzZIB39t7byeKZxYGQWkv09VQTD+P
	bwXRY2iJAzYZ6qQLowIhX6TX6PylHvfB8aEOGBnb7IHQkErUvxGcVH/YADVVfOFmXjTMV/15MkG
	XQ/G6N3UspYT78KOZW0jmdLpFpqGajXRGKfNopbQUqDadA6Vu8n1o9STeIxKV38HVY+1Pif9Fyr
	FeyOkJSc+0qzUJItEuV12sxaMWxEyP9epctTA6AHtAuZi3mI7DQfDDZHkPrCbHR+IbRpDCBIvIB
	Ob/0li9ox3WHykQrbgctBwXkft83X8oKnaC5A5n5
X-Google-Smtp-Source: AGHT+IGvRnjHT32PK5YuBRc1hb6W3fJORtPLfFOYwa9VWFtEYD8F4Y3wY4BjdSzdWSGFbFMh9vP1nQ==
X-Received: by 2002:a17:902:d584:b0:220:c143:90a0 with SMTP id d9443c01a7336-22e1ea39b8fmr63196145ad.24.1746336588289;
        Sat, 03 May 2025 22:29:48 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:47 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 32/40] target/arm/ptw: replace TARGET_AARCH64 by CONFIG_ATOMIC64 from arm_casq_ptw
Date: Sat,  3 May 2025 22:29:06 -0700
Message-ID: <20250504052914.3525365-33-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LdKhHnTa8bGJ

This function needs 64 bit compare exchange, so we hide implementation
for hosts not supporting it (some 32 bit target, which don't run 64 bit
guests anyway).

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 424d1b54275..f3e5226bac5 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -737,7 +737,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
                              uint64_t new_val, S1Translate *ptw,
                              ARMMMUFaultInfo *fi)
 {
-#if defined(TARGET_AARCH64) && defined(CONFIG_TCG)
+#if defined(CONFIG_ATOMIC64) && defined(CONFIG_TCG)
     uint64_t cur_val;
     void *host = ptw->out_host;
 
-- 
2.47.2
