Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756160njj;
        Sat, 3 May 2025 22:29:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtyc+/jMdJpWYx8gWkTLVPlLW5Zlg2UBOmya4fWN1LHOXrgIrCmCzOheqHzLfrR0U8z3IW2twsgCNMaQ==@linaro.org
X-Received: by 2002:aa7:9309:0:b0:730:4c55:4fdf with SMTP id d2e1a72fcca58-74058a247f4mr11498823b3a.7.1746336579149;
        Sat, 03 May 2025 22:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336579; cv=none;
        d=google.com; s=arc-20240605;
        b=QoJzTJP+CCapEWnooROSRBGCdTV0lHtp5ZyaMOm38gbG8obOj6KI7UgRaVD/Co1VJV
         1ZbQMzjDAd6sJVBetykdqvMnbVRJ+/9vjmiTMUytNxV/q+iBsad6Ek9Kz7bCwtnQCmbm
         LvVjWGvQxrEZeXN45VkN2rY2T05XHB6ALwWQjinHuqTBy5x9Tyt9O/G9HTua5ZlBixH1
         D1Q8eckW4cZ8sXy0UHc0CCk3QnPiYv+rKb+ockKzfzBb2uz+kt2BHlyOIvO/UqwbXlDO
         AxXpTRbcg4U3797wBJvjS2yy8/vQB2JixMLLvT7+ZjnmeoucOmMUAW/+Y3N6G8QFSGXK
         v/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=86LVIOw/2dppRQJ4fgmxpMIcvI46MI2lVjbVrJNlYmw=;
        fh=AnwiZ548q2kLp3srVQSbozIc8Terb6rhdAbVtvqa/GM=;
        b=gHvxUKecJNW/A3WYsB7LDhrsMdYsujs8O5SPNIK5Md1vBjFmM35AMt4xHzfTpMaXCx
         pHE4PF+Hzn6tnSxfGjEf1eS05ZvKqq4Mxhp/zEd8v2CcUo2L0J12vzQIHw8PuwKsSpmJ
         UVxjfIWC9/9JfISrjDayHC5/eget9sXIyiy+AompgLqf5I028kTBezy+N05iUvihgfgL
         M4Az2z4O9dSBevVgyVJd7KefU3kKbFrS+D8KbFm+9MwLC70gDFHa6PJcjUqQSDfVzEEJ
         uqxAYlI7Pj+NrI4xe0W11Nj3P3vgU/R8FgNmiuPfBD8eC9hpyMow61ngagAE/QnRLWU2
         Nd2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=exWzMfJP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eeb1379sor3011440b3a.1.2025.05.03.22.29.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=exWzMfJP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336579; x=1746941379; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86LVIOw/2dppRQJ4fgmxpMIcvI46MI2lVjbVrJNlYmw=;
        b=exWzMfJPfzLdm3HGZiY8/OekwD3zfnDVef5PYh3ZA4vPeWS8M3wvKZBzKINOK6nbKa
         ZP7C5fziH0SnZyxqZGCQ8goxYghj9RtQ141EEaYHpTYzvgyM0HlY83IAa6UJc2GaS1Yi
         7hCXAYg3hPUXvbChef4hpG7kWYLY4Q8F+UbPlM22DCnKJ7OLp5eGedbP2fQ112f8udvS
         6XtKIn1xxA+kaqHskUQpFETWDiNkVug5T4CQGGmufCq96DHU3PNBosVb//yQ7UI1YWop
         uoTDrp0fSoC/L9rhYaKTyO+PrItZnLYg6qi90P1zNj96yEVDg0oi8ZYvWzYbZXK3uid1
         8sRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336579; x=1746941379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86LVIOw/2dppRQJ4fgmxpMIcvI46MI2lVjbVrJNlYmw=;
        b=v50pVuBRciA2gdHm0vmLC3iYgWtOWxr4VMNZLksUx4osireBT8qk/lMw4P4CVngJ3w
         s7UOsLJh/+gf/88+MRmPmjKUGYSgNDAIT3nRvwXEFsZFJ35ruIJAkWkFQRRXwNPSVjqB
         KsAN2vQKAMpSC1HINZnV6bdeuz+m4E51Ev55RezERVMB73GrNmg5YzNB3LXYMXJhuVjm
         pwDjIZ2+KYzNb8qsL7mqxif1t2p1nxNSeVaXLtQo6mWT3H6XYCCNHKyre/kdJZlzjcnC
         zPoFTqM+9mvXXdOx9sXlnFV40b0X3MXi/VKcrAhHrvAfPDJGVd/LHbTUjXZMU850jR2z
         XIhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfTiey3AuZ3/Lg6/dMBj7sexKKJW75Etv/1d9wrGosflR9VKAP7J5x/e6LFscLbcnCi6Ciimt+B9FY/A==@linaro.org
X-Gm-Message-State: AOJu0Yyqo4FDqj616hjoA5kSQTssUZrLJVWTwaYWrIlAIV2sHYjrHeMo
	WO1FmvwEVZ0IMP0ZBF89+WLb50QLPtNeGgnPpFCL/Qk25r1+tmolH9BP+qq0g1l+ag==
X-Gm-Gg: ASbGncvSerDJqCAjQueeWcGUW0czilpVN18a2iCCqv9PFSRO6CUhH4Vg8HnBFTl5biq
	0FOJ0DgvIC6RSJFhVZkKTVVqoVuNZkB45IRjleqTNAiezyVpjVIyO9hdBZ+AKOG5jm6MvmyD3uV
	0T0aax/9sCmNVO4oPSzPOVWAPPcnsOp+aOYb2e3KirNgB5yGmUuuVJFZ2KIxMJ9vMCkA8VuOyB8
	DHzgQ9APWB1D3BPEl6XM6w64LTbvxNDC3q1YQvsjz3QeFz1KBZSMDVXwwZ3BlAMuUYickWRn7ry
	iw6rkzCAogua2wt2sLyR1z4GkaITEkIUIWnMSzX9
X-Google-Smtp-Source: AGHT+IG4ULaEA/GoSGjxEhxOoVD4iO7XzTMOWyT0+0o23OyJwF3hTP78uWvNt/UX6GWnXj4rDAzS1w==
X-Received: by 2002:a05:6a20:c901:b0:209:ca8b:91f2 with SMTP id adf61e73a8af0-20cded4359dmr12181184637.19.1746336578692;
        Sat, 03 May 2025 22:29:38 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:38 -0700 (PDT)
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
Subject: [PATCH v4 21/40] target/arm/helper: restrict include to common helpers
Date: Sat,  3 May 2025 22:28:55 -0700
Message-ID: <20250504052914.3525365-22-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: v6nQ3oy/WWIw

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 257b1ba5270..085c1656027 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12,7 +12,6 @@
 #include "cpu.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "exec/helper-proto.h"
 #include "exec/page-protection.h"
 #include "exec/mmap-lock.h"
 #include "qemu/main-loop.h"
@@ -36,6 +35,9 @@
 #include "target/arm/gtimer.h"
 #include "qemu/plugin.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
 static void switch_mode(CPUARMState *env, int mode);
-- 
2.47.2
