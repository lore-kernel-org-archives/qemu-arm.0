Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94492njb;
        Wed, 7 May 2025 16:43:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNuoCpht9mEEPghtb0CkALIvIP2tQCQxYYVR27TTTvvPHT5Y0zzOpaiWY3S5SBVlZVdnKnjYwabUdbVw==@linaro.org
X-Received: by 2002:a17:902:e78c:b0:22e:4dc4:5e91 with SMTP id d9443c01a7336-22e5ee1ecdamr80915015ad.53.1746661396199;
        Wed, 07 May 2025 16:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661396; cv=none;
        d=google.com; s=arc-20240605;
        b=UiH7zvSPX4kS4CYdHMGSouLrmHSn4XQs5wANlVoxYN1xgCmByX3azpRoxViwhx4ke6
         51k3+6XfICVcQSWIJzSzCG8zw5FSQAao1Jq+RFpgg1wvjQmMqMc85/67YqCkDyyDnX5o
         kz1skYCcPoVmdZrL8Ag2qSJbXeRP1LaOqkq9jccnu0N+mxsKnUrqrBUBhxkdcTxZTh6p
         N5popa7McbYGgCk4tqzuBOQh9G3OEXqjAxDUxzHfdDu5jabJ1TTX1BKGpwhDsOsCTR7V
         ETP/WJEhCru9LFQWiLdsXnMKPsyEQe2oLg1KwBfKWq6hvEFguGv4howzY49jA/8DVLTR
         hXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fjvN9GkUlSXmzEXtUb9+tptKE6zBbBhkZRx0p6n3iY0=;
        fh=zlV/CeG7xOcFZBhLzDLaxEIoG5wPJUOTW1DWavore3M=;
        b=GExA37xg+8sCCEeykOjxoisutR44B+0LhboyE5vtu8JOs1cqTvSVWkrKlhH1DscOtt
         Mnsx4vLwC5WGSWkvlY49a3UUOCceCXZSUkQsjip2DCZOeONKTJ2ZO7QH3xbXaY7kWLM5
         sVJ4jZzP7qziUPm1pxKaEFqiBpgDd4MMoXkOYqNQf2fhcBztTovvIG20ymsvviR/of/U
         13fmOJjSNGAmxkpEmDMH+S7HTagqY5Th9DZGY0KMw4K9PHu6304LTfOFArDncrI2eROE
         cWsDySS4shNBUkjlLQAoB9teBbWm4LA0D/EsUrWErixf6BgLQfd8FOujUrPQp/jMypRB
         m+kQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lrvP9YCH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e6978f02asor25980695ad.6.2025.05.07.16.43.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lrvP9YCH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661396; x=1747266196; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjvN9GkUlSXmzEXtUb9+tptKE6zBbBhkZRx0p6n3iY0=;
        b=lrvP9YCHLQB16fsDBwjA3g4uzf0kq8DfN4x8uKrWWxlxvixBMdmeLiAb6YFrVzXfSK
         onwadPPLJU76p0vlQ7B6u6+FRvEAbxr3pZ+jbDZlrvuBwGaiO79ySjUi2V1tT3oEUeMV
         HF4/uBVYoVUJ44mcPIaQqQa/JzTwpT5h3fN1PWk1P06Ce6s2Xd12z7nSUnyCzwUVh0iv
         ac91OW1bjwDuJW1lBR9tMgbfzpqzznE3qnHNW7iNCsDNQqkkIKGu+qjmWkGotC3iq8Tr
         +YZhaCLjRtyELyafIeU/Z+NUdreC4PpiRHu6601aQNTiNloRYW+NpRA7I0c9jfQsiErg
         nxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661396; x=1747266196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjvN9GkUlSXmzEXtUb9+tptKE6zBbBhkZRx0p6n3iY0=;
        b=RvL0hbJTEYBBSR8CXf3DclQtV/MqcqRjUKh00Qvnri5G4cIv6CqWEOTrilD0lBuW3T
         bTS9LAbShe2H7ya+uPxbQ4HRHsEurUoksAs8U+qkKi7M9kgRRtukWHO1vfWPM1Qa92CW
         nq5WcAb/FzC7fMuplxBCLdHYbgBZC76M3pdpmywk0uPqHAwW+d5zoJxmX4yOK885XQJ7
         FhmquXn9MTv4bFc6U0xOwQMabWpXVg+x/BbzwrYIjUL8U1V1jIchzfRB9JnHpjfSXQyr
         D2MCptbc9Qi3FmpE8vS+U9I+BgHuNaFZe+HWCDCqwlJI8vNIj3q1bV2I9xvM/pjii3n/
         RLEA==
X-Forwarded-Encrypted: i=1; AJvYcCUi1UTaonpWsJGfHQ5Sm+PHdmkUghRSdSpCXhfOdRSjbiK9TbbUgDxtsnnZxN1O/Arp7iyjJNcwB72S5Q==@linaro.org
X-Gm-Message-State: AOJu0YxK2tsfca+lP5Mp9+z1BaG5L4E+9YFDoXIXaW7NompfwxPcX6u7
	H4NcxI5cdjhOBYKLwg+8h7Hr6yWLdBU10SVWmyiOYRg/oOXH3p2Mkpn30t8feFQBKA==
X-Gm-Gg: ASbGnctrBhlXw625mbqpPhBtIp47FNR69C66bx5u7MzjhM0nXMQ2KO74YCBxkAhSQwL
	q9Ne+Zl1kOqzfco7M6Dx2sJpaNsk9o5pYV+dgkewaoT6/VcuI3qoGMTISgFO4MlBG5jOBoztQMa
	Jneh+tdwgfc6XJA+W/L2Tmitlrg66R47upkhWTjiSCSdC0sVWa+5nWSj73x4FcSpeZsHLHlDYfy
	EbQhRyk1ar74tyomqAL+MQIN+r5K2Ok2pY71raMgCAt88iW5uWoqWw0VA9k9wXV0iKjdcIvZ+EY
	uO8Cy4qeUtwOKHYpGAqBgynyKthKQxvtejbYi/Aa
X-Google-Smtp-Source: AGHT+IEuW/a8CQcTYfwo7IA2UdMnmDxumG/5lG8CAIvP1ZR+VlXIRxuwUzfmpdZQuGHUomKTI4zmHg==
X-Received: by 2002:a17:902:daca:b0:223:5379:5e4e with SMTP id d9443c01a7336-22e5ea70aedmr96320185ad.10.1746661395849;
        Wed, 07 May 2025 16:43:15 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:15 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 38/49] target/arm/kvm-stub: add missing stubs
Date: Wed,  7 May 2025 16:42:29 -0700
Message-ID: <20250507234241.957746-39-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ijy67iIdYZcQ

Those become needed once kvm_enabled can't be known at compile time.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm-stub.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 4806365cdc5..34e57fab011 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -109,3 +109,13 @@ void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level)
 {
     g_assert_not_reached();
 }
+
+void kvm_arm_cpu_pre_save(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
+
+bool kvm_arm_cpu_post_load(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
-- 
2.47.2
