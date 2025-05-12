Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42756njb;
        Mon, 12 May 2025 11:05:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIasVmUTUl96oOiOy95Lodn5QNyWEGNbRe/O84OfAY4QU2+E2rxhq6GKGFK69UbuZH3iaIs8y6K5TI1g==@linaro.org
X-Received: by 2002:a17:902:d505:b0:221:1497:7b08 with SMTP id d9443c01a7336-2317cb53f94mr5075875ad.23.1747073130335;
        Mon, 12 May 2025 11:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073130; cv=none;
        d=google.com; s=arc-20240605;
        b=P0TaWJmnlmpu9D7vmA4lHoClPpD9x+RRJAuqIFHXh4Ua/f40dIak9DYX4IMwLqpJJB
         IqgzYeKsogP5599+4e06W+cvbNrJyDIppcGhaocKU209126IfgjFoT1T2av+NPCy58p4
         9dPGGim2G+6VMx4Pf3TBl1Ivbg7M8UqGGuIxcBC6WOaRYqFsLQtQrPIdfYUxIT1H6OI6
         Qrkpav5N9sSXwL1Z8sNDE6TJrdK9joDuBeOuTu/4b4M2UuDcD7D4NzHewp8iLHQP6Ron
         73Rba0Oj/QYXUTeYdNhBdUjSBZLkYZqZPxSjKh8OdZwGnzXR4rZM5CiSlHfJcI07jDPg
         J2Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aJInTwepDQvyARNpaPXuaRooiI+RbVpis9kB0Baf804=;
        fh=/atAsTiJ1i19Af7n/qVOwUQo1m+J8MISyj43TSJlvtY=;
        b=keIyZnRA+Z6X+YU44Hd47zsiL6evSyloqu19h2/BokDMNimdm/Ag00HAnvw41pMHJx
         bC08HOcvC1lygXZrz6PLrT9+VVuAT3/8uRHTasTt+i/B1+me8gsVWH0ZQgSwww/v6Va9
         NWRJaKRhU8T2wzUiDHnuiCZhjxOdmZdtia+iENvr89NwJuV0n/duk377cll5YRASlN0u
         cHRC+Ag9/O58pvVe+KPan7ihYu/0TDb8cWZqfgLT3LB/5Z1zNMBiCILJ7Fx7O2rxHMY0
         ETKwBK5Er2SXq9lu/piWjAjkmhVedTCjk+puoyhEDUXh3knS/BqsJmUSwB00cDGqd0qx
         I5eQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UnddAM/1";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e7f32ae79sor53014675ad.6.2025.05.12.11.05.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UnddAM/1";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073130; x=1747677930; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJInTwepDQvyARNpaPXuaRooiI+RbVpis9kB0Baf804=;
        b=UnddAM/1mEMDfHkUc17fxf1yUTHwL5pbdnFA+/c0r5S5CNyTr/J8PU+vwQdZul1NSR
         6I8PhmgXk70OIt4tQQfHNEzLg1QwMXuOSzkFTiS+wgvVqJQLM+0xbCy3eUYLNSab/hYr
         t6KbSQLnpA+TRZQ/Yc6RmExtNcOYSEtfBI8BKOyBxWwVZ/To4dYfJyLcQO9W4BLOvheH
         dd4CWY/6gQBY/HE5S8mqhbHt1FU85BvhViqcz2LylDVNJrutxAKX5zRabLXsrJ8Zoq25
         0QvE2SG1MSkiDZqPYXmcrw3lBLIGNX/NpHY2Z9zMX7D0lgNQCPBYgU7paFw7H2mRcYmO
         MHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073130; x=1747677930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJInTwepDQvyARNpaPXuaRooiI+RbVpis9kB0Baf804=;
        b=E0m7i6i5rqHjE9OI6/4GoQMsuXgKaJCjE9FQWDB1hWdJTVnYbo8pzrQ6TEK3uS7mn/
         BElbDGzMLmBIYXyEZjC91sDzWLVaT/zA+1kZKOXHSy/X/mwTrgiL1Czmgp38RS053aEa
         BVx/4vBVNd64cqs5cen9IfeTOISes4lqq5rZcBLmHNAE5KNl+ERUAzhBk6tVnCrvmTdm
         ZAB/Qf6BDnbXc3Zc1X5YbSWubY9eL6Nixhbc3KkVWSi+2LRNk/N4KSpb82ReSh4L9qa9
         A9rHizUhn5zGvHovDJToIwiQ2DMfR+ELTdLA84Ip7t8WRrqvn7SLcFu/amUU+7nzC8/l
         Tsdw==
X-Forwarded-Encrypted: i=1; AJvYcCX5bd4+YUfH+S3iK+k7/19J0hpjH5fDq3MvHjUqhy0m5a+X3XI+968/jiPR+OIiieSzAaqvAIIrvs1p/g==@linaro.org
X-Gm-Message-State: AOJu0YxKk7uEqdGm7Ye5nW/yh5z3gHiCp3HrBnVC6msv9OLsCqQ7ILnt
	2HVinnkIznlgYBszLcrgqB8Bvgj32EuEz6cZ/vQM5dfqJ1oDwEG8iJsR3hf0aoQqRQ==
X-Gm-Gg: ASbGncvwiDq64iu66FttIjGj4jF5THSHhRSBD+c8Dqv6hIqo3doin0F0yfAeYO/HK7F
	z9Hmc6tEHG282RVIFeJRAbmmMB2aIyi9mUxynnVhGu/FhgVtunB09jv4k/1GWpTpvPIWUhTxO3f
	nkTBSkuvShIJZPBaNeJ2qK7LwJWTpdbyEjwCCwwTgTeEcj6cEAc1qQFkjgiAp2YkAXuLZgnnaBn
	ZM/joQ0Wn2H3DlGwisETLAy1M+0q/RyUPydTTTzlg7jvWstSvKd8sS3JTJYNuhk2w+g1vWfhQ+t
	QfmxuNswQ5pRSJSSI5awY9TiXJUipMuEYemQd+M9pAY6akuKEgU=
X-Google-Smtp-Source: AGHT+IHxrzHChDFcYnRSVaKACPNNaf4kZqDUlSJo1+aUJyFrfDQpSCpvtq014nivMaomuT6gO5OwyA==
X-Received: by 2002:a17:902:dac9:b0:21f:5063:d3ca with SMTP id d9443c01a7336-2317cb41a37mr4886665ad.16.1747073129894;
        Mon, 12 May 2025 11:05:29 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:29 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 20/48] target/arm/helper: replace target_ulong by vaddr
Date: Mon, 12 May 2025 11:04:34 -0700
Message-ID: <20250512180502.2395029-21-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NA6WWzEkHr4o

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3795dccd16b..d2607107eb9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10621,7 +10621,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     unsigned int new_el = env->exception.target_el;
-    target_ulong addr = env->cp15.vbar_el[new_el];
+    vaddr addr = env->cp15.vbar_el[new_el];
     unsigned int new_mode = aarch64_pstate_mode(new_el, true);
     unsigned int old_mode;
     unsigned int cur_el = arm_current_el(env);
-- 
2.47.2
