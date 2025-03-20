Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1278902njc;
        Thu, 20 Mar 2025 15:30:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9lSeHY90HO0nKonJ+RSeuPXQ/wqz5l9bp0dS1/bawEeH/XQ0u7GsPMC+b9omcWKE23tL3Xqv+pQFH7Q==@linaro.org
X-Received: by 2002:a17:903:3c65:b0:224:24d3:60fb with SMTP id d9443c01a7336-2265e6b6721mr87903335ad.10.1742509820059;
        Thu, 20 Mar 2025 15:30:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509820; cv=none;
        d=google.com; s=arc-20240605;
        b=Ezg3syWtwPL93epnDE3yuwCcT7l1cg4HhNMqJaq6LTOHK6z7e+Hbnet3iOElB9n0TO
         H6CaMDyyLRJxdEc++PyEIziBseI8dd0jHo/2CHKaQyh88clcBb4EYA/14VkpZ5KheP3z
         P86l/M10shJvhqQxB7x9Ry/sqj8kPlaWhItlPXtU5ogZqVYiOoe407UTtAQ95JY7uhbj
         iRfBP/gL8V1BZX9UHnKuYhnJp+PXGOBNSJ2pJJuXyoY2Z5kU7cLbOXQvm8X4Msckc/88
         zBxDZxtGu2W3XdIO9FufUquqT37xI1+WlSltIToJ3tjxqDg5nYu69Sf5D7obGh6gD1V8
         dU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WV3LW27U1S6CRR8HQ+KHd++BnCAdzjihbbqDVw/7qvo=;
        fh=fCwtaj5XCFO4FrN3FSs+/HiysF1faSNBV1RzS0x7vrQ=;
        b=NYqn1NS1bNzvSw0l5GVC++K+O2KTxJEVAuz+gbAaCJoUSqTBxGL4hbymqddsD+WWRy
         QsF6zHWb8ytcvGS7pLOZfyYKr0ZnWqoCt9EfgK507sMoRvtGfARIuuZfieCZUK4CZW3/
         4j10ObnsVcnjp/K4bRG7nD11k8i0u0UXrcGR3yPcNB4PUmWMulf8Axcc4iPWsBLlHkIr
         Gi/fai04WmnK2hSV9DhZJGL5SVLBPXZzN+tleWVmaTAYLtFGN3pxmZK3jn4VlZU9kcGp
         e3AP9A5pEPFTQ5q75E9QbOzNU/kqZoEQ+6ISZFHpy52TJ0PVivGOFabcLNbEehv5TXZN
         J1ww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FDi5iehD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2264b343be5sor27187535ad.3.2025.03.20.15.30.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FDi5iehD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509819; x=1743114619; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WV3LW27U1S6CRR8HQ+KHd++BnCAdzjihbbqDVw/7qvo=;
        b=FDi5iehDN8rw7kAcO5/OB1K2iBZJwDABApfAH2rZ14FgZINlLo1fEdc5smOVfusjgh
         cm8+StxENVwDzzLbXhT6aTnjhi7b5uUqiEC7if6dr6t53alaxdrpRbv10ikIO6xRSBEc
         Uqjw2dCGWNkAk5P481N5Ata7R9hncdGb6uyVrwVKz2b9jdl+WFUxVqSAO9eyRWB8HSVY
         CF5kFUAXcDcxhN+C8PYkZWSqx1kLsavrAudRQJq4MYjXqhU12aQDfQ3daRi4d7NOA/3i
         qTgT6vkAnCQcw1b5VOdyCmccT8vL/acRwtc3CwB0EBw4+69EAGKbJZx8d2UOF/sOrcnX
         TWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509819; x=1743114619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WV3LW27U1S6CRR8HQ+KHd++BnCAdzjihbbqDVw/7qvo=;
        b=H8fnjtmVkhdcogC8+K3IUl/NmIM2tlaY6dzea+EMX56LPPOQvevupU/e3tVW5+pbJ3
         HIP1z9CFXnrWUESPLoqNZNMtgObGe0yP0bFrWruG5gcV1ttVEuHnAAnqVGy/YaeWK13J
         E4PpDm8mxuz3rLjTRrMmhBS9Y/YYGw9qZ4IROemAc7rj1OJOI/3gTlr0TFiQPAxrrXzv
         cvaJfRWRtlfyDzGtYk75dCxOdhfs+Ff9bxD6fU0cgxMJbi1k14XB30jGPAv8w5Ixh4+r
         MlYs9SrW6mHGDYEST67ukESURb1dlGq2Gv3iKC3B/71fbuSuIIo1gNQdmJmqlfxjvnd/
         fd7g==
X-Forwarded-Encrypted: i=1; AJvYcCXQcfWPF8/Ue6cCZZfcoIbQB5E+vtIkZ243NQBeemOm+wwUKtz9SACDQ0VR1BgBgh1KDIze67l7IWZ/gA==@linaro.org
X-Gm-Message-State: AOJu0YxtOn9+m2+WLissEtCegAGT9/IXncqFX0tXXOQdWRXyOE2EeQnX
	BCnvqWd9reOyqtwympH/bYRK95/nevEh7jgLarwA05358nGirABQclBZJtmilDKwyw==
X-Gm-Gg: ASbGnctWssZSgE4XJIFG2O7SsEZkPDV9Ub/kEguVqa1f9dXgrTiL8DXVJwsAN1f1K2j
	cFVw8/JGPH3gP4NqECJxb6/X61/T+WCruJGdXFs+3jktOtGLY1qEiQxtEowmFUQxtd+s7nFg1lG
	x6Emp/43K/Z46eZrUVrFKZnzPw4RWns0mvboPbzZzcBWNuAq8RNUAnq4aWntdOAM/33Yuno0Lzk
	dvBgK1kUrFktH3s50++nuaBHzA3rW4FfkBNTkLEUYDH9cKvoG1UHO4fMBQE/RCvfpXOx0IP80yu
	DnJwhfpJ9G1C5oRNyP1kdlPdzvx7OCfHZXdWWRq0GF/F
X-Google-Smtp-Source: AGHT+IED8IFTqMazkDY9snv2i72ahMAdbHAQB5NY/WUQDtMA8YVwdGtezdctsB52KsHL2IZ1WgTdvw==
X-Received: by 2002:a17:902:db06:b0:223:5187:a886 with SMTP id d9443c01a7336-22780af52cdmr16943575ad.22.1742509819670;
        Thu, 20 Mar 2025 15:30:19 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:19 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 06/30] exec/cpu-all: remove exec/page-protection include
Date: Thu, 20 Mar 2025 15:29:38 -0700
Message-Id: <20250320223002.2915728-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: L4tKz8opEDw6

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index eb029b65552..4a2cac1252d 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -19,7 +19,6 @@
 #ifndef CPU_ALL_H
 #define CPU_ALL_H
 
-#include "exec/page-protection.h"
 #include "exec/cpu-common.h"
 #include "exec/cpu-interrupt.h"
 #include "exec/tswap.h"
-- 
2.39.5
