Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178879njj;
        Sun, 4 May 2025 18:52:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxP3NwTo37eyWqeQnc3HLre6YcAKPt+SUrAnpfA6lcHflr6qcUdgYQCoufxT3TcJ8T24stkgPROyVcmQ==@linaro.org
X-Received: by 2002:a05:6a00:3305:b0:736:476b:fcd3 with SMTP id d2e1a72fcca58-7406742a606mr11697256b3a.24.1746409978463;
        Sun, 04 May 2025 18:52:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409978; cv=none;
        d=google.com; s=arc-20240605;
        b=Z8RkRcenkrCp5g6RwwR7QAoNCeNDA3k8XpSECfUsak3b3kRDjaZmCaih/cZxmIT1QF
         s3RsYnOalMnf+B7LKFHyQBkU2clxhfHaknvqRNKS6l1Bofe6/10ubFuHoXnSBlXJWwE7
         O2hdH4GVovcspHbjnsFRIKJcbHSkZfL+oH0iWT7hAoAQqxfm2m2zM+ZNCuJJG8JDo0SY
         b8SV7Ti0YGB9D76CVqCgPWBcxDJq3YpdyxP8nDQw/RKuuHCNFvWr0C8+0Is/M0r4XbVu
         +bdYozyUuxDbnI1bEAr4EHfme6ATgqIrbTU+xZDeDnn6jFNh3yaCSzRNTgnPpy7YFK7m
         IVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JUmj3qtC0Uxjt25GgPIz4kBx9RjJCUcgOSDgbgc2pqU=;
        fh=ESjuqOoR3kaHZbVpop+nRIZw4ozaWOTWhnGmUKsTHJo=;
        b=lKbI/wIz/NPMTaYLJ5i6QhE0ubboTh/wiHBVv30g26uJ4hYBFYRvuF8hYPp56QLvE6
         pfnLmPsFbhfdRVcVZFLsBBKZwla0qUx/su6qX9VXT4BL8L7WgG5jTHOBTzZochgdZiTG
         GrHD0lBO8v6EoeDgYuaNBhxTMCtsuTynLOJ+sNMp6eamm2JZ8Zq6/HDOLN6bZeJN78PE
         vHNAaY2QDzA+rzU9a8mA8qmKEEgH/MVgS8uXrL/k/bKn8bTKAla7YKo02EDwMLU3JZYO
         rK2QXVa1BrMNO1pCuNrHqDZgcyNzBGpOsk51aKI5poeiNfNDqmz0tFyFFrrBgMgQ+DTv
         xKwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eT8NbJA/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa0a30asor3643731b3a.9.2025.05.04.18.52.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eT8NbJA/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409978; x=1747014778; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUmj3qtC0Uxjt25GgPIz4kBx9RjJCUcgOSDgbgc2pqU=;
        b=eT8NbJA/pJUIvlZMZIeeLzshkN8F8bO3U7yAPchTWt8CcnMGFfoJ/lZa+fYTPiETRD
         GgQrdneBs5CwPKZtjBQTPOxC/MwD9Ffhw94hCljdpZySxSrb+93WXXg9OgJ0gLXAoqEi
         5MaMHBvlJkQF2BlLoPv7ByYc+194yZEAMu7gJ6b7OVHAAaRo9WSJ/cBtUkT64j/VsyXg
         +mwq3J3Ky7SSEA3SdahtFs2q3ckrTSZ0VvEmMA+wGKlFHdDac3TR88fOKEC+A1hPR4II
         MG3GHMjsVFS5nySzgYhvS4OPnedhWG3Wpnv/hw+nqCcSbakdcc8IoxPMB9YPU0h8TulW
         ZFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409978; x=1747014778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUmj3qtC0Uxjt25GgPIz4kBx9RjJCUcgOSDgbgc2pqU=;
        b=nbqE85JyHBnrpm/LQq5QHUWdOWsygaLfAKQuDMKlEYHLhmXgW7AJjWWLidlpD/f3LS
         KFHYhAXKy8Y80J/revpcnrKUWQg57v+vvWjQndK2QF54XcuMOCj4cMavZm+FQ1l9h1Al
         5XQkGK0Cmb04gRQOoj4ndugHh0cbpKiNcnBsDOaZg37agU4Rj0Bu0LWJUWeP7k2jB5Js
         GcN3sw8FH0CLF2JZbYEPXE+ViHHFpsJzzeuCOIs73ODNWZI/X0ZG5itJ3dGLyjp3d58p
         QbFKgH3ucz+NhPx3gVazjhzRGYZXwFs/5VVFUi9FHxXDFCVe7+0rPiJCtJIzcVBKDf6Q
         hOoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6KPFBYoGGV/cFd2Z7zm2cRVeYhZPMjUVUzNL41lekkbsKrsLQJA0GrtQAyQ0DV5uLn18/gZDCnE+q0Q==@linaro.org
X-Gm-Message-State: AOJu0YzVYi7C28oyAgSHtt2FlnfhbCTXd3KoWpkcSRrhA3dgCkjRXTZa
	Y4HGSfIMr0ElVpQQ1CfNYvPwrwNw82Pztjs7XfG76p5n4RwwHoWB7YMTErXIpXZr9Q==
X-Gm-Gg: ASbGncs/reyYe+rn/4lrLpiA4MmgjZ5y92tY/nu7+1DuXhMwLV2cKH8jMlhPrRjUiyH
	yr/BKCFLvS1Ys6mVrF1+HM7MOxMMbcPBxHAsJzqsbALl/KowqxtZ+FLM+uq6n+ul1tSxEyfQ43P
	2D5CNe93bXsrw0RvwhwfltMW5mfsMAfV/o1VE0KINKaVWQCJovacyosgN/Myhw7yjB01kENgKtP
	yWZwxpV+mMcuR6jRNUUxkSQR670Z7WV7/v02Bzb+F8xgQHVW94EdBs+oOKGgN9nmTVs4OoVAS0n
	alvF6WrFvjzIwk7veMEpe50+7YqLv5RsAeziL8D2
X-Google-Smtp-Source: AGHT+IF14+GzXOzwvwVQdwpLvUHkW1dbYN6i+zycvVgUNiek3xtVEptqaBbxaSd7q1Ze+Ybp/RH0Gg==
X-Received: by 2002:a05:6a20:6a26:b0:1f5:8c05:e8f8 with SMTP id adf61e73a8af0-20e0692b072mr11046667637.25.1746409977987;
        Sun, 04 May 2025 18:52:57 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:57 -0700 (PDT)
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
Subject: [PATCH v5 32/48] target/arm/ptw: replace TARGET_AARCH64 by CONFIG_ATOMIC64 from arm_casq_ptw
Date: Sun,  4 May 2025 18:52:07 -0700
Message-ID: <20250505015223.3895275-33-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: z1aIwtf0AUwA

This function needs 64 bit compare exchange, so we hide implementation
for hosts not supporting it (some 32 bit target, which don't run 64 bit
guests anyway).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 26c52e6b03e..c144516aaba 100644
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
