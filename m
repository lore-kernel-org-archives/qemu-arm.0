Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1004277njm;
        Sun, 30 Jun 2024 12:00:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtxobrq2rdXyW3fGuYr9C7vTFV5qklRLU4QW0u9z65UkBbkvLfsaTFHx7t38Ixn9ENfPBiiwjODHar8kauGbyxxm3e+EMk
X-Received: by 2002:a92:c56b:0:b0:374:b07f:6dbf with SMTP id e9e14a558f8ab-37cd0aff882mr56521745ab.1.1719774056638;
        Sun, 30 Jun 2024 12:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719774056; cv=none;
        d=google.com; s=arc-20160816;
        b=kFsbcba/2oGem/NBoY1hAGCwXKU9qNnEh6YF5ixTnue++n4z1VzDd3ZLqgD2aDacvA
         fnoRF/VZVky2S+9fJErWG0toF6azyAq7vmtWX1mxR8yJzRDcOoLJzRR/QzHo/lU/Ik9T
         O3jjkPV2RPUxBJRFcRCnusB9dssmUja4Ge7Aa5sug3sn+oo7CgYt2pWVP9acTdkGl3V4
         Ddq41ne4XjbmgPda/OihYNQxsM4vtcEtSH0x8BPiYjVDP1+9TKX+pN27eq8l/goELNaJ
         xCx1XoJhn7IyJsWnHOfmQIZ8dgBfvQ66ryj8OpC+hbSxsodsg6uwh3q1URA92p7E6Ex7
         7CHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DtGVT1ZHjBzi0X95kSBoZYyuOcUliRAOUA12D0f1mZ0=;
        fh=x7WLLeHjzF+LAtYx9Fgi2Q6ZY693Zinhu/WU33qL73A=;
        b=IWijgUyPxZxZ5VJKfsDaFg9jLGcjJjaFsYhQSUMFsDwKP5CrFbvXg8JDJrbT6yzz9L
         O0q8TmsHxPn46k6SJnlgfPd0jvnEaO6tJq+UKin207vZBFjbHDUolKZjPl8PPGVPSYIH
         w37Jl8zJYRH0HSPT6WsG/4y3vulgVi5sD1DBqDroTkiFiaIvKES6zmzhGVcaXMYG8sIl
         lO0X7xuKHER+qa/71RypngEPlEIgb57LihADAASOFRsy9lN33bFKhAXdpYZldNLbm62E
         p+YSsVdM8VnOZEScGVHBeEhjcBvE/MKzCURVKcNuO5U5BPdOzqLaMCocrHqwhGP1Dnwu
         qyWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yWnNhxAE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-1faac9b0544sor28539455ad.18.2024.06.30.12.00.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 30 Jun 2024 12:00:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yWnNhxAE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719774055; x=1720378855; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtGVT1ZHjBzi0X95kSBoZYyuOcUliRAOUA12D0f1mZ0=;
        b=yWnNhxAEutq+DVs/dfQzyigZ7BU9dIStKRjML9YVExMaNTkT/a+Xvyc3A5F2du5fAg
         p7BmRvrEtUwWgxe5qZKSz+xsCPotRhgUlo3TyFkrxIgFNbD/QglSzBzXg3IShaqyEXUl
         TOgSJKm74I6HtCEaL4d17y8s4T+2FBV4Icn2frWjOhw+ubCsLqSWZ7fj1C98zFBbXa9E
         X+oT5Tem6qa16Q9OU6asbx2lbobnUtaUg28wyoxjEDVpEeJ4REodchP3dQfYu+fE+B7S
         q/98822kIpAdRxe60yBXUGhSU2z++rgX6IORQSZy/5URN060+Es+m5n1ft6i5c6NeMDt
         NhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719774055; x=1720378855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtGVT1ZHjBzi0X95kSBoZYyuOcUliRAOUA12D0f1mZ0=;
        b=dsOZXVETJnQzA5f3xKiJPG7HYIYcqR141gURy7Q+2sgWBizSIoeubOG/jFmMzbqFKL
         tP/nxw5m3PPDJxOKhDIABJH+OrGaWOSb6qDNOEXnCmF5VHk/HFq5lD7/nvn2C5SLr4bd
         0jH5JhGL1kqyO267GcSHFjp5Wndr6Ulh+7yXHS1sKFCZGJcP/0GaFKkgCkowNhQngBMx
         CF0LyhwqS2MLVssnaMmva+R8de2KgnWEPo/1ZuLojmrOWBGyE4t6vjLk4ATlWI/KuIES
         ta9Uqiv1RV6Jz8S3LbgEn0iCab3ecymQqakGogyQBcHc9vMiX9Qo71MYrufWtwZ6oYaA
         B8sQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+NoVt/UvZ2VeWevGj4PqTSZSxkvt0WcxuoGkoMEwu8Qea94WWPPxfUm7C/EMbcO0kiI5OQI11Vo0l7g+U4vQYxykOqipn
X-Gm-Message-State: AOJu0Yw6zGKZWI0AW8oyvXbivutINQsxb/soEtWmUQ/LjsTZHqLC/eW/
	ypuWismjto4Cdm5Sh9DX93r9ZFkHN+Zulxx9yzcKaFYZbgAN9hBo9fEdXDnxKstalw==
X-Google-Smtp-Source: AGHT+IGnrCV/2ZsxzpC4JeLWaNNpT33FUx9fjN8NR14jcAoBg35zMzVT9+wf2MU/AHgAwxnrlfde2g==
X-Received: by 2002:a17:90a:9b09:b0:2c4:a7af:4d79 with SMTP id 98e67ed59e1d1-2c93d6ea90bmr1515235a91.11.1719774052788;
        Sun, 30 Jun 2024 12:00:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3e7e4bsm5115641a91.52.2024.06.30.12.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 12:00:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 01/14] tests/tcg/minilib: Constify digits in print_num
Date: Sun, 30 Jun 2024 12:00:37 -0700
Message-Id: <20240630190050.160642-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630190050.160642-1-richard.henderson@linaro.org>
References: <20240630190050.160642-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: pPTmoNTO+PAu

This avoids a memcpy to the stack when compiled with clang.
Since we don't enable optimization, nor provide memcpy,
this results in an undefined symbol error at link time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/minilib/printf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/minilib/printf.c b/tests/tcg/minilib/printf.c
index 10472b4f58..fb0189c2bb 100644
--- a/tests/tcg/minilib/printf.c
+++ b/tests/tcg/minilib/printf.c
@@ -27,7 +27,7 @@ static void print_str(char *s)
 
 static void print_num(unsigned long long value, int base)
 {
-    char digits[] = "0123456789abcdef";
+    static const char digits[] = "0123456789abcdef";
     char buf[32];
     int i = sizeof(buf) - 2, j;
 
-- 
2.34.1
