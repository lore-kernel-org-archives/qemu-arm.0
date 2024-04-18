Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1952313ejd;
        Thu, 18 Apr 2024 12:25:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXu2BZ3grM8ne1Ac7iIDllUemjM7Y/caAM4039OqD8PlrDrVDQO9K21+P19+1x7zjQhpJFKZhpOZK7k2nTlJAKUlJWBjrrW
X-Received: by 2002:a17:906:46cc:b0:a52:5d0b:208d with SMTP id k12-20020a17090646cc00b00a525d0b208dmr63086ejs.0.1713468359617;
        Thu, 18 Apr 2024 12:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468359; cv=none;
        d=google.com; s=arc-20160816;
        b=F6r64FoSN2UGwGEyshqEftPQK9Y4/0WZIqE7w/VQAafTxsfR7oMJiAIaDZws9Eh4dZ
         2KngrRM+9GvCg/0nZf2YIGu3GVXrTTRVeZZJwnnP1O96HjYh/v4JR7rp1wMJ0/PNQNT0
         yvlZQGH6CS4QGLlVxiX9nr43yQjMArGpjZSMXsvnrh2do+aNlvfasoxY2SVUfFWZML/7
         Wv5gxXPCyXb2MdMpBOafU8zB5avYTExl5zAqaRz2NbydMIAMftA6oJMtxPeL+IufzR0s
         JKbWrvog51yeEruoel2T5X20ogsIoFyWmVNAVo2dKyn4EAeuF2GVQeNYrc02YXMcQWhP
         gt/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=A5AN2zfNkbZgNzq4yMXaRJrNHQuv3As8IXVhhvnN+gY=;
        fh=l6aXhiFm9/kcQpB9Y80p2cJ0C3xQYKQomgb+q2OdoL0=;
        b=JUlZWzmogtSsNAcIlOEjDHno6qirC1SSNuJloK5uvtNvKVN/D9RFHPvv8O5q866XqX
         rrXrhyoEttbTUQSmgvw55YmbremzvVcE+7oJja3Jodg3yt1elff8Od18wrIET+9FVWx+
         9SeITfjPZ2BfgnskqLhT5TN4boVfw9OASJRaHXgsO7DunvP26Glfm3U9FpizlcsJYL3R
         JQBsDnhfKBIQ5AZret3Mt5ferlYf6nOKLp2pNB3SfW3Qu8HKDUT3Y7r2vg3ICPSD0UJ/
         t2/ppqpEyohK/eiV9VtzIC/gjU6y48BB4R/fTSWfaIZXSqYqsZbAA6DjYHvw1nbwnVId
         67EA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DVwMwnqu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gq20-20020a170906e25400b00a5261383e23sor716771ejb.14.2024.04.18.12.25.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:25:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DVwMwnqu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468359; x=1714073159; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5AN2zfNkbZgNzq4yMXaRJrNHQuv3As8IXVhhvnN+gY=;
        b=DVwMwnquwPT72/FMtg9WVofC+Lvc411ZhLIEbEHwWKh8/a5wun1tVQi1ESUVP0vhsC
         VqLSxm6ZQvAQOgXVV1W6+EqB4LCoKE/3sUbESP2hcWXayoivdnkLdoWYJ0O8IxSW/yca
         vOl+pgKmO80xmV+KimVVdLRg/yLRxTk3blNOXhYhHfy4KmVSY2pqKpg+xWsaR8ugCLeW
         VpvWk3wrhAsolgT5WI/WNlOKYqx7Pogkqf17XKrhQG9jkDGFdl/1J8s+9c3jFuKf9yxO
         0LCFqx+l0RgGhAH5u3bXDqHvYwSGIRmrP1en9UaIkfjP7DFM6F2VsuyM9c/48mp+eOVl
         cvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468359; x=1714073159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5AN2zfNkbZgNzq4yMXaRJrNHQuv3As8IXVhhvnN+gY=;
        b=fnkgD0j2/hwHv0+0hosxGjKLzh28PJi8l9XnyIcrGH0zXVHPJ1wvvWZ7FXNQ7nzt9K
         R4joYT+7StJn/ecLvTgqaJ7xi78INlgV8IybR/YZr5bhhundZ3KUUpLDIVNwRJhiw0++
         /gBuNwnTBUK9RIEU2O5RislC6zaclsG9GLYL1WiXQcjbXsQca5UYFCa9m/ZXkTwdNQ3f
         BsRDcmEhMY8VeWoz8DG3J4Jsnxt1gwER/P15NUqFo62NQOgfRck5FYyNvyl+Sd7CWOkZ
         abMpdjwxdAwgjpRMq1jC37N3z/dVG4ClL34RnEnHWtgfpaAEetoKCb8XQcpYmCEmIWIr
         5FPA==
X-Forwarded-Encrypted: i=1; AJvYcCVO1ClruxYzYRNS2PSwicZU2emypx56cz4R47joYr4Z/hNrVztnuo90CkeUFReUJmBHuIMz6/51scXOALUp+ZYjo1jXNg9c
X-Gm-Message-State: AOJu0YywTl8tvGbDomGtbcEQI372fGdk2HAyYYJn3MeryMXdmi8Htf1T
	u94PJ6JO73wi6Uhf5oO7rgaptGEhkRTXvWxh0JZstpSWA7g0ZXsZ5N1FtoHK3U0aNA==
X-Google-Smtp-Source: AGHT+IFLSLQi8pDowoTVpwvSQYRuYn13I7Tn86X4cb0qyEAJ8RLgeCtpawdlVQYvcABi9MDTksrlmA==
X-Received: by 2002:a17:906:1949:b0:a52:5925:1f76 with SMTP id b9-20020a170906194900b00a5259251f76mr47729eje.47.1713468359292;
        Thu, 18 Apr 2024 12:25:59 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id z18-20020a170906435200b00a4e657a5f1asm1259445ejm.112.2024.04.18.12.25.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:25:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/24] exec: Restrict 'cpu_ldst.h' to TCG accelerator
Date: Thu, 18 Apr 2024 21:25:04 +0200
Message-ID: <20240418192525.97451-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rwYEUWdHqhVq

"exec/cpu_ldst.h" is specific to TCG, do not allow its
inclusion from other accelerators.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu_ldst.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 5b99666702..f3c2a3ca74 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -1,5 +1,5 @@
 /*
- *  Software MMU support
+ *  Software MMU support (per-target)
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -62,6 +62,10 @@
 #ifndef CPU_LDST_H
 #define CPU_LDST_H
 
+#ifndef CONFIG_TCG
+#error Can only include this header with TCG
+#endif
+
 #include "exec/memopidx.h"
 #include "exec/abi_ptr.h"
 #include "exec/mmu-access-type.h"
-- 
2.41.0
