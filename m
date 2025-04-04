Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp5086903njd;
        Fri, 4 Apr 2025 15:35:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNqppJCTB8oFAQ326V31ruv9pQgwC1tmfuqZQmqhaKJX7LdwJaO00PVtKiQDaNX2Aa+A1Ccx+goTbibw==@linaro.org
X-Received: by 2002:a05:600c:510d:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-43ecf9c3e5emr36195855e9.20.1743806144674;
        Fri, 04 Apr 2025 15:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743806144; cv=none;
        d=google.com; s=arc-20240605;
        b=abiKRS8sBz5UTo36hHG62xVktIBll+4vFGNMIoDHH5bEh7MgN/Ru1mYG8dH0iSgA8a
         Nki2/9D1FBMgF2k5SIZou4MllvIpac10V54u5dRmjqm3kIKe8PNOEADUxvA83P7nIMS5
         lJfBvYhvNv0W+fVWaxouYIZv6okI9Rf9IjNaR/nws91jc7QpcLZ9zYmF04p4mtuy0W1t
         w7AsAbZCm+7Qpa8RiyVUJI4teWSeFOXhEJZQH59C6eMDINT2eyr0M4vtUUK1uzpm4N9w
         p1I+gReOv2iL7piGVnoLeRt7MKISah6N/tAM2W5UNFcum9/pdFvynC//I0AZtAMzTDnh
         lKfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3zxXxxM0ZRSeCFO7PrYLPbTvn2QmgWNDPLEa5BJ8v9o=;
        fh=gwmPH8ITk2jXbCmvqxvQ6dbfCVqoXynhXZidEb7QXFk=;
        b=fGfcX3EkIIVjTl4XEpGWPeHDnnPEoi7XuiB9pu9T/+Y2OPaTZRKF5lrVFbmdJ28u4K
         WYQzb8/EFSbx1tYBB5UuwJNkhupwKwcg5qa4tEh+KarZ0Y0DOFpwsctgxI/3hctFmlVe
         H3vZbKG+mbbeQ9lZ26WZIWqWFuq+ILFaOZCrWSPpdSMbBdR4bSAJck8a680Snx+SG3js
         yxNto6vxqOiAnxhPsqXrjoPK5ImJsGA/CXyi3eAqgELwnRiopMxO73OBQS0SWAA2aU1t
         IsEoBLdkmDNIGzWxSNT/QQGArB3L7vyLFi9sDHZ5aJnd8OUgh/CEROrWVMVAS/sP01zF
         18LA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qcR0SrWn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec2195a40sor17221145e9.4.2025.04.04.15.35.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Apr 2025 15:35:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qcR0SrWn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743806144; x=1744410944; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zxXxxM0ZRSeCFO7PrYLPbTvn2QmgWNDPLEa5BJ8v9o=;
        b=qcR0SrWnQ5pIrPM+aBbddUwNyBBkiuB16CEiwkksDbDmplozwdCLv6FOPQwRmwlN8V
         5hujAO4FG9nn6pl8SixqLkNIPkm+wGVZjp38cwodXk8R/PZcDGfkvI9JLAkBjK7Z9ruf
         cx4S5TOkCJVHg7uPfBh4GT0531z6BvWK0PRR4XxHH5RhjoT8RoVER5Oi+gN6kgkQ/tfn
         eGxqsr7oftUDCfhawJRP3RAECE/HWC4844XZShf5Gef7PToEOWU6WbGJWFC7Wz6ei5Wp
         rU/5s020VKQooHyy4bNWlMiqn/6m++GepksG9UAcsj9xvmAVWuI/nxLIzQEyh7kcP63I
         zT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743806144; x=1744410944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zxXxxM0ZRSeCFO7PrYLPbTvn2QmgWNDPLEa5BJ8v9o=;
        b=vp1TbyIUBC6LjsovHEwHzAkIcwbXjExsbfllP9x0rsHLdIWuIaJph+J/VqtDmeqQyU
         Xk4JcSbW3Ma9CEEe2Av2QCrnvulan/U8pmSCJ7ui/Km5ucCJqHMeRN7r6YALuPQBab8M
         MPIlfqIcixj5rMicD7G2iCasATNqBW480wRMRhvn07QmUrI+G7K16x4xFXL2u9roEOgF
         7Cz10i+i7NXksl8+actjcwNTsEOH8xp/lBXOobzfrJX0qLJAl+igHO7XzEF17IAbG13g
         AIaNdGBKFWT7Zh/3mDK4soxcir/SU+MeYxE87HWYv0WNjWnqFtPkQ9JuFxEyU2fP4bX3
         gUew==
X-Forwarded-Encrypted: i=1; AJvYcCXVxYamATrWgAFw8aW/uJLEPvsGoC6a9MwX34ATX6a+xSPE9JhH2aMVKqi2HzpcxplCkFa8pudNUvH/Qw==@linaro.org
X-Gm-Message-State: AOJu0Yw1ThFkRUpcDr07PvLE1Blzp49SatHJVH3TxahPCMp8QhdmmSpd
	vI70/sr3Z1p/CsLnoyl4mPj4cjNI9KVW6+PMmONLWMYzkdIUq1+rUoF8Cx4p5iLwng==
X-Gm-Gg: ASbGncuY5Xxwv/KEJsh11xuvRwREBglP4iztr9lPH3E+7H2H6Pwh6yjBsykXk4kJAZm
	sWSoO3EZTpVdOUwGRoBHr6ljq35hSgISzRzgZ7R7HQIWqGv5Rr+yCYF++vB2vXx/U9fMWbppYE9
	euYBEXo/WAhGJzc22Lob1sGGf0c08tsstuEVg/Dq5hII7TyVO0MVeG5RrZokwAdEi/si8mOU+dW
	fundKTHLoBnNYKKYC/+yyFDdWJ4hGFbv6k9JxyTEwuxM2ysCM0gApuPFM2pOCHLR2sXW1EsJaYD
	J6bIQv8UJECByLBopwTTJ8UIWvjuJPZEzsHRoCQNexl6zYzzCnjtF8HmcrnqdTMXAGGWkvMldF0
	n1SUDczSS0VW9kHjvQsj+OiV5
X-Google-Smtp-Source: AGHT+IGrDPT0TJJGANZ9qgZjJprbaA1E9z/XbJrwznccsZLyeyK16WpBM0YN9mSxjKRNnmRPfnKasw==
X-Received: by 2002:a05:600c:510d:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-43ecf9c3e5emr36195755e9.20.1743806144161;
        Fri, 04 Apr 2025 15:35:44 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a7045sm5443114f8f.39.2025.04.04.15.35.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Apr 2025 15:35:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 4/9] target/arm/mte: Include missing headers for GETPC()
Date: Sat,  5 Apr 2025 00:35:16 +0200
Message-ID: <20250404223521.38781-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250404223521.38781-1-philmd@linaro.org>
References: <20250404223521.38781-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: S5ZxyRBUgV0j

Some headers are indirectly pulled in. Make their inclusion
explicit, otherwise next commit triggers:

  target/arm/tcg/mte_helper.c:188:26: error: call to undeclared function 'GETPC' [-Wimplicit-function-declaration]
    188 |     do_stg(env, ptr, xt, GETPC(), store_tag1);
        |                          ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/mte_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 7dc5fb776b3..9dcdc1d91c1 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -22,7 +22,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
-#include "exec/page-protection.h"
+#include "exec/target_page.h"
 #ifdef CONFIG_USER_ONLY
 #include "user/cpu_loop.h"
 #include "user/page-protection.h"
@@ -33,6 +33,7 @@
 #include "exec/helper-proto.h"
 #include "exec/tlb-flags.h"
 #include "accel/tcg/cpu-ops.h"
+#include "accel/tcg/getpc.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 #include "mte_helper.h"
-- 
2.47.1
