Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp865032ejo;
        Tue, 12 Dec 2023 04:35:23 -0800 (PST)
X-Received: by 2002:a17:906:b341:b0:a01:b9bd:878 with SMTP id cd1-20020a170906b34100b00a01b9bd0878mr3107443ejb.14.1702384523524;
        Tue, 12 Dec 2023 04:35:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384523; cv=none;
        d=google.com; s=arc-20160816;
        b=EAdwhI67TvBSiTqyb007UgwEi6xvvD45A+V+FJ+FAx0Z/RwFY5m/UEejiLAL+XwGMl
         w8Jzhmr9dopWiHF/W38r04Q9/rSy2emdLB6OvRYPrQkAUtmJUg3INdcHZOeCS5Wruw+N
         B75pd8GlYh38r3RAcm6j41Ta6uW3thindScx5UkVxAOcz5h7IYncNNKJkCPbaC1yBY59
         eSFg5RLo7fefJqygPss5Cerrj+uBUzumD0dP2uisCzJc3CJ8bP7kQNJQq0zp5upcQFwi
         yU5KX1i8gPV0kP+NU5LxMwnYWV/hyx284QTv+Lvx+JINIKNkxh2ctgxjLgPerverN/fe
         nArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Sxk2B1Wo2pXRo42/SYBVVIycoetyzxarj96J9gTlCqc=;
        fh=vlFEGdij83GYetLrOUaCnR04sbYRvtckD5L7fw5192c=;
        b=JETtYT8I0yNGtvsvYbJT0vDMm1bUuRafiKpCSHw8ARY51v6nSv4kQgEJHJvJfeegH1
         gVAKOjOhdCoM7/lVUOyqhKDYhf9TXViGHa0t5dzWgYp3A1PVJikhjckGSvUXPRnD0WYg
         pUdkubvSyKbWWrcOBOIJFMO/2potwj/1OLStmM0/5lWqSy12ZaBh+tf+nHyMCzCc4Mh4
         pwKAj8PmWIOGKsvxxd5ZG7SXz5Mp/vSgh/fnkxBnsjbvNfRasYrCw4Jhmv8caAer1iS4
         IUXv/hsIKaaXopjmTSnjWjW9WB1y6HZ643cFZOUNrIFZ3QHdKWDsK4EUmZOS+gJVPAWB
         cilw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jWiK2cMX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d1-20020a170907272100b00a1c9a5454bdsor2372412ejl.21.2023.12.12.04.35.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:35:23 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jWiK2cMX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384523; x=1702989323; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sxk2B1Wo2pXRo42/SYBVVIycoetyzxarj96J9gTlCqc=;
        b=jWiK2cMXW162PwSMbUoVkUU/HNqXUKpizEj1lpSi1pxbPmtfzAZD13ozWdBZiAHPED
         xR3EkqS1qGlLKcrLbu4RUXmIn7d8BTTyyt3/m3yDA/X+23aygdVlnQwXkDb5yLbQzk7U
         nSMYXGXNs1QEvyJO0UGuoLOkExlcEKBWTzEM7unP6IUbm/a2AC7mLzw8YVF26G5fq1v7
         jMh1rmolA9u++c07L43o8Qy8n/ilfabU8yC+fRdNSomDN41+z5p01rPWI3TaFgnvcAYf
         Ur4gCX5AWy+BLZjlRj7AXlmRlDasP2Jk8QSQJcfUI0LKMOpy1l/A3CKPpx1hluUGHsBU
         RAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384523; x=1702989323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sxk2B1Wo2pXRo42/SYBVVIycoetyzxarj96J9gTlCqc=;
        b=k0+er3bPF8NB8P+cDq1hmecEdrCF0YiD0Cci+pbT3WML5aRdJ0Sb6iUh5b9ewTFcy/
         JyOCGTyeSKxRyKR0GCFA9H/VV1fgIuYupCwbONdUvKYZRV2j6kLpKFkxDXqPI0Hjs2bV
         X66WvVClY/WQ89UvdPVSQmWEbIWWlTBO7q5QUMAOXC/ukpOoea7J8KafmdtGIgbwwrdW
         /UXX1GqxAYE1rjh4XXFDmazq4KBCmr7XcP0hqH7kq1qI21Wcnn9/bJNBrL7h0OXwJ0Sa
         BB1iis+9YA8VtsJ/zpKy/PlO4S2LrthZqjSNYZLjFTglFaE3YWXdYeUEfiFdEMkzigWT
         RaNA==
X-Gm-Message-State: AOJu0Ywnm8qgb6FIH55ih91r/7qeAfllvAaJIAXrDKG5DGIP+62jnQsG
	x7+93rCiOib3bXlvYdGXkrGi1tjt
X-Google-Smtp-Source: AGHT+IF60peqW5k/uhTLNgW5AZ0aUrcQ3SinmlWCqRPnEUhcmf7p7Z/G/HBTRVlN8Ug2DgZM/V4wzQ==
X-Received: by 2002:a17:906:e0c6:b0:a19:a19b:78b1 with SMTP id gl6-20020a170906e0c600b00a19a19b78b1mr3781322ejb.116.1702384523264;
        Tue, 12 Dec 2023 04:35:23 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id tl12-20020a170907c30c00b009fd585a2155sm6134678ejc.0.2023.12.12.04.35.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:35:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-riscv@nongnu.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/23] accel/tcg: Include missing 'hw/core/cpu.h' header
Date: Tue, 12 Dec 2023 13:33:47 +0100
Message-ID: <20231212123401.37493-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ft4NkwOfu3eX

tcg_cpu_init_cflags() accesses CPUState fields, so requires
"hw/core/cpu.h" to get its structure definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/tcg-accel-ops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 1b57290682..58806e2d7f 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -37,6 +37,8 @@
 #include "exec/tb-flush.h"
 #include "exec/gdbstub.h"
 
+#include "hw/core/cpu.h"
+
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
 #include "tcg-accel-ops-rr.h"
-- 
2.41.0
