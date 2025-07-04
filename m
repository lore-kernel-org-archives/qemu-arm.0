Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1249085dyc;
        Fri, 4 Jul 2025 07:21:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXsPpm9nxiqCzxFql0hgkwfOCsuEk+pHgOFF9QGOPHkZBsan/9Hq0lQB2x94DymLl07zhJ/qI1Yuo+Chg==@linaro.org
X-Received: by 2002:a05:6870:6590:b0:2d4:c1f4:4309 with SMTP id 586e51a60fabf-2f7919c0f16mr2355090fac.0.1751638886698;
        Fri, 04 Jul 2025 07:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751638886; cv=none;
        d=google.com; s=arc-20240605;
        b=g1F9Pltanl7LbTUjE31WUqiybcE/NR9ZOztdj3H+PbSoPmQouFbICecLmZVkw7c6Xc
         2LRw1DPmyCgwDUPC6/9pDiG8HJAOVw6XY76jIUohG43R7+VpxRvpceX/YLV1cmP4YZgI
         rqmh5AiCSA7sw5b96o4z4OhAfDcvhvWscs1ESrrPiZtGXVVxH4OHVjGCrwegpp6gickO
         VPX0S9UpYiIAHPpl2bSFNjkWPF05N4emanbq/EB1G2WmbS1pYBt5UY86nf8v2SdygkK1
         c/FoPVchn7Q0XofAUh8He2tn1rxgx9TxDOqaeKkaUFi9yLyBs+ikkbcr1UCEmVTCibpg
         T/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zli7CnBxcZoWcfFlVjjdFH46Lnu/RU9mJkmtTaLHjlQ=;
        fh=/LXELJVc1nS/RQGl1L1sx7rhWQ+AzypCQ9oxfgBZSM4=;
        b=B/r27nrRV+6SckzKQbp/cg2cROmD6HPvHEcAHiglj5N9IR7JgMLdLSOXBRpqz+T/tc
         PpRgOn9xn3PV13yXPmfbS65SF07a6Y3XMKO2yKm5vZKE41VaNjUqtzolkKc+Ol0/UZLe
         AYoJHijWC11ZJQScorHXluICmGMPIoFBonQ6bmZDacItsvGx1TVGfvUPgNrWkbFmChM0
         7GZalUK9ifFKz77wvBPeT7LzuLLj+pDBcLERCEtETzSu5OKCLYGHfgLEe7j+tiW/v2kn
         GiMNj2A6/omQTY1eIVDHhQTwuMZtJFhxAjOEJAdGsYhZ3O6oT0WuZw5bUIJNEi7qhF94
         bMiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=abA2yW62;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 586e51a60fabf-2f76adeeb3fsor1226538fac.7.2025.07.04.07.21.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 07:21:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=abA2yW62;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751638886; x=1752243686; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zli7CnBxcZoWcfFlVjjdFH46Lnu/RU9mJkmtTaLHjlQ=;
        b=abA2yW62M975oze7Sie+RiE4/AChNXp9jp2ejox23bx1kJrcor3mKls1pNqcWcAQX+
         VAzV4pJHPn4c6hU9cBOJN2TvADkwSgVew7df/gbJalqhTEx1vdy6ikN6opm3YfB1/NSI
         VYnV9CucqQ7S0pZRHi46QoOaV6KQFqg236PD6j63v7A/t9ZMgdONJaqcfvQLzUhBM7uE
         lqQQj7usB+46yAV8LfB9UotUUseKL3+KDNjc/QVvwkQm+CM60aGzn8RVuAn1wNJf1UZD
         gCD7DmsBjqukNbgRFqI6lCVrfrSve7jn7rbxKyEZHQbEXMBR0O4NA5fbGWGXDQ9K3EY8
         yPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638886; x=1752243686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zli7CnBxcZoWcfFlVjjdFH46Lnu/RU9mJkmtTaLHjlQ=;
        b=E1aLgLLrhFrrag9EXcajo9AyL/UM1330ldMAELm8ioXq/0Oz1qgySTHb4wc878iW28
         kZAN6uVulfMFiwC0sdqkm+IdcOxgJiuAFMbGdG1y+vaYhJi6coCt3Hr6Fq8ch3gwfXm1
         iqC8vYq1GsNoJHB05lXiqqcjWZxN1y3QUWM2fB1b+zZbKdoFuniqV1XEBoYsv3cNiL9C
         zNWd3/gXOZXy37HtPhdap4aPtvtVSL2vy3gs6H/Cqn9di77ETjqfLgb0+wrkR9UiSbvn
         ALHfbs5q1InMNjl4XyEY/hI5CPzTgXeL8DRYAkPyq5j3Wexi595/aQhVJ7tMKXepZMAY
         g4QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaNIBez8rzo3XjsYH3SbppN6CDuROAEPpvF+w0WF/7KpkjywLPtM1LazD7QIf8fp/H+oKYtu7BjSrC4w==@linaro.org
X-Gm-Message-State: AOJu0YzqILWIbdzjR6kwo8R7cf5Y9WiA6WKcowCZ4dUBIlICdzQTbL6o
	ih2bzdZZOYEsRk6KMhFPk5TEcZmCjxYHHRmOdKg1Krr6ZVW/2fJEEl9gXeRHGTn0S9Y+sg==
X-Gm-Gg: ASbGncty8o9w6HxZSwt/fhnfTA1VATaeOqP7eIV5lrTes4rN7wOWCme0hotBmSZLu9q
	jL28btIh/Y2Hk1l2cMgpRkn8vx9VUP+WtWUc+osdqRu9fcf04iMsb4dl9nyTQtKFyVjUoHwgcLb
	oq0EEm9zE2wsiRZ+sHBHEdLFNXp2E08haLzp/5kcp/AoVFxeaozzmANCMNAOMrHlKSKR9hYwLnE
	LD6l/WJ3E1JBrxI0CgnAml2Pt97y9IcEjIZQIcoiMF8Ml5guyHlKB/P8y2z/QL1MaFZcW+fcrom
	vOIc2X2OPN/M8FMpwGZeEkEZbzbg6c20cpzWhhy1Srtb6NToD/IaVZW+5/1LvJdaydudYuQfP49
	C4hBdgtVJpetWEt2aWTJ0GYMWM4hvBvd6F+riyTfQ1fxaD11c
X-Google-Smtp-Source: AGHT+IHYjHRamIYHXSMNeTIZ1EdnaL9nhwbnOLmAbma5vi0NPG8ytkaYFy9039nT6nQJpjfkwQdunQ==
X-Received: by 2002:a05:6870:e243:b0:2d4:e101:13f1 with SMTP id 586e51a60fabf-2f791fb366fmr2213415fac.13.1751638886254;
        Fri, 04 Jul 2025 07:21:26 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net. [187.189.51.143])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:21:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 010/108] target/arm: Remove CPUARMState.vfp.scratch
Date: Fri,  4 Jul 2025 08:19:33 -0600
Message-ID: <20250704142112.1018902-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +dI9iHskJeLG

The last use of this field was removed in b2fc7be972b9.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0338153923..96a4907266 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -669,9 +669,6 @@ typedef struct CPUArchState {
 
         uint32_t xregs[16];
 
-        /* Scratch space for aa32 neon expansion.  */
-        uint32_t scratch[8];
-
         /* There are a number of distinct float control structures. */
         float_status fp_status[FPST_COUNT];
 
-- 
2.43.0
