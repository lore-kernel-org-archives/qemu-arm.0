Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp5086856njd;
        Fri, 4 Apr 2025 15:35:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVe7KDcsprzPMyg/JkkBxj/H7/ymguebX/wCunocNRfwPvu4X7Lv3fYYmKCnlYTEJDVY1WmZhm57JFl1A==@linaro.org
X-Received: by 2002:a05:6000:40cc:b0:390:e889:d1cf with SMTP id ffacd0b85a97d-39d6fce1289mr559652f8f.37.1743806135249;
        Fri, 04 Apr 2025 15:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743806135; cv=none;
        d=google.com; s=arc-20240605;
        b=RqC+jBICrHHhgJPsbQCc3yi0Q44ZYkhXCO42Yqw3+pnNAKEL/4XSEGphPr/wYlZEyU
         SxdLeyMxt7Vh/IOY6DYe1xxyKAzRMvoRvi254FTIBEYd3n5Ozgz870FEjxvGRD/t3WgB
         8lrTzYK0xyqG0YLavLAu4hV0RAKhxBxRwHAk5IgZsgASSqh/pokgw3njscjRX1sKA0uk
         C0j9PdaZQ9gkkHdh2l5jMqnFnMA/vGInwA+5N0bHT8BxEHO/wN/OqcXaWee+cT/IDm/9
         QuSKln5GUU+9buojWDiIUhhJeYfffcIqDb9qqZFqbs0d8q5uzZ30GzZCSf3Y5mQZDWLq
         qRCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rq6ukSPz6i3qBiz15byBnMynpVR9qpwTm75W75QCRYE=;
        fh=DDl7OyKC0EC2ks+2pfzdvHzwBg2ajoR/WTSf9scpZdg=;
        b=OsD/Y9tKWpnItq1o45JpEabkg5pWZ1AC27nsAVzRYBwkqHmQk/YH8ibWJ/wOQONHC5
         SnFbm9+Ceg93jP0JsKfZ9xU72brpm8Gzf2olO+m5MlwYEw8mAoIo4qjBXBhgT+RyAwps
         oSsOVQ13ffyBtYQ8j/4lwOrHQB8ONjgCio06xzWOce/wjAARgS3kbmMRUB7BE2cnWws7
         lYewdyVTElMcbC3IJL0dA8yxwfNwf4JMNv6z3SmOM+m58YDNYL0UnNpI5MgqfRA9Lrze
         UGQU560NHkQ+22nVOjexEwY5BFC0L4pd20yoe97EzvQAPAzIQfk5qeWehy6wEoZWsNEI
         lMwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PNECPe7M;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec26c8e4fsor17223295e9.5.2025.04.04.15.35.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Apr 2025 15:35:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PNECPe7M;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743806135; x=1744410935; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rq6ukSPz6i3qBiz15byBnMynpVR9qpwTm75W75QCRYE=;
        b=PNECPe7MU52VKcwe2FM00EVzC2TYm74B7HB/q11mivjAec5LfO/HQkwZ4Kx0EBbMRM
         as1zQgId6gQws3ex0+JQQg03fJ1yLHJeaRK/reM6DrSRLRepSe4esiXKwjreMPRqynVB
         rNDXRKdHhBpozdMwUNs/a1JcyABD675viQwMBIskdYAeMzFPknndBTcf6iVvUUFPxGi2
         dCQF0PJk/8JcD5+V3GT//mQggta9JUTQOFy2R9BhHhWMPcG4VzsP5yIw9WDKNmOGI2QU
         vzqXqdcTLIUE7aERctkXexqG8Ocx7/NMO6y+7oUC/aA6W35J4jTm8nXbUTWhVMD45Qp3
         RQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743806135; x=1744410935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rq6ukSPz6i3qBiz15byBnMynpVR9qpwTm75W75QCRYE=;
        b=r+kazII12ocpehH17hjv8wA5arbCZFBJlAwdLHJ4p2VJanSip4GCKnoOW42cAIyWGj
         n7u00mq+s17/mDhRDzs96y3q2KwMpycmVpc0mODo72cyq9zdIMPJ6Dj7lGYwqCVkpl7Y
         6gmTipy9aRFtqfmBsSoxj0U0HW21cQsC70MRu8n3XObWAYebeHGSvj1DadZyp1+5S9Q9
         ZYTP9fwI7pIoCGdGI1yICmNz4OKXXodYGrwiINwZ9mYCSKkbQSXTp+QWTT7aTCEpi1yq
         pQzewhvS9Vr8jtFTST2raV6ar94FdCWSGuR6fOcRlQ1Iv8h1n/wRAdaOkmMzwSdbo09E
         Lqww==
X-Forwarded-Encrypted: i=1; AJvYcCXylMr7aV2mXMozQGURa7204xaAKM6ODshTuzrNHbIzowF6Y8Pj/ukVKJagOlQ712sHBLxpH58RlQwqIg==@linaro.org
X-Gm-Message-State: AOJu0YyeUQ5zXWmqFirIO0ReMyL/PwXTJWQqnCJ/jBcYug5Zb57u3THx
	X9rHz6SZk1sPaNBYTxeIGVtNJHmqBbi96C2YtJbMvNlIwt9/nVPM4U7DP2vC77ueEQ==
X-Gm-Gg: ASbGncvKWfPMZWSmdC2teWLIO0+R9Opi3XBQtQBOqp7g2Y2Qo0haRJBfukIO4ZeoTYB
	RaY1/Dv6SCTrtAXkt9NMRB9E64ow7XTqHWylyAbqObnqqg864BVrrQSBiLTAC0i0zRSfS27uuO6
	p5CFO6LfmeiUcyytrlT6r5NtNYqJvFbs1sUwwTg6OX/O/gkDdnLz1Jq17JtSh3Vsl1rmNOcHeIV
	n1lWFuV59OYL0NuSyUYGlgumRwXTPMqMdWL0/Sf9bAbBM/cT9F7l+BVrcMG/T4lWae6Ar8Hg4HW
	CTgWTGYj571UJG/T3n3OMM8t1gRSCDnTWS+peQ5dEXMNTEM7EQ0SWZyt8iWeZApKS3m95pQIQCk
	DjNiJ0TZCIQr5oVcV6Kg99vpu
X-Google-Smtp-Source: AGHT+IEMSL61JPkT0XeVJ40GVionwl/pYjYgi7F0pD9PxlljrW0JC+Cjy++q3jco8uIlJSEnpFn+Qg==
X-Received: by 2002:a05:600c:a013:b0:43c:f8fc:f686 with SMTP id 5b1f17b1804b1-43ee0616fedmr13051525e9.3.1743806134772;
        Fri, 04 Apr 2025 15:35:34 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm60231765e9.23.2025.04.04.15.35.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Apr 2025 15:35:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 2/9] target/arm: Remove use of TARGET_AARCH64 in dump.c
Date: Sat,  5 Apr 2025 00:35:14 +0200
Message-ID: <20250404223521.38781-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250404223521.38781-1-philmd@linaro.org>
References: <20250404223521.38781-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rtnCxVyUiHzs

It is safe to remove TARGET_AARCH64 #ifdef'ry for code
guarded by runtime check on aa64_sve ISA feature, which
is only available for Aarch64 CPUs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 377791c84dd..95afa9b72f1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1213,8 +1213,6 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 #endif
 }
 
-#ifdef TARGET_AARCH64
-
 static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -1372,15 +1370,6 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
-#else
-
-static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    g_assert_not_reached();
-}
-
-#endif
-
 static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.47.1
