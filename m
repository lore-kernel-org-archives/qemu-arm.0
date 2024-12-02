Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802105njk;
        Mon, 2 Dec 2024 05:14:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVzyCBz4I8FhDz25ipGDtH7lpnsVGZzf3SJ4XXwM6qAtAAovXNFxNW1YH61+46Bd2SniB1Eg+HBdOdbRA==@linaro.org
X-Received: by 2002:a5d:584d:0:b0:385:f349:ffe7 with SMTP id ffacd0b85a97d-385f34a03c3mr2702963f8f.2.1733145265252;
        Mon, 02 Dec 2024 05:14:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145265; cv=none;
        d=google.com; s=arc-20240605;
        b=BkL9fzu5zWXZcWGn1FaySHz0WXrCUC/4qKrS6nnjSAUTYPKECrzS8rzXF9ZIHH+Aqa
         yM3fGlhzkhZv3eD+RoBqXPnXqniK2Z+CbNhgs0ulQBXq5LDViUW0VeDR1X7blm/sXcBB
         CTmB71LEm2S4/C4UfTwLCVL1wQ6zvCcT8JUcGUmeod0XV5VKTTyMTnc/L7pphKZgqlnT
         TzRc8/ZhbJlk2jOBSoTTsq9nOEumoDgxKWcNro2APK7K+sHdUfJwXSZ/3xf2u2mmtV/z
         F7MYR5CPuISvx99cGKhw1QJXq0oNYZfSWtYsK63j9bvcW5Ar5a5CrFIKjdFjweWAEHLV
         z+BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=D7hgTTAcAvvo63kNZS2ll5arN5VoViH9sR+6kv3WAC0=;
        fh=SEWrRYqySjG0xuqI7NoAmv5+gLb44CBl2vDP4cxg0Ts=;
        b=BAClWeSMymIx5Ps03PuWHLT0jIUORr/tCQ3ZsRZYq0OEZCaBW11qa+5SsohFyD5Y+6
         9NTf82EyiW78nbV6SQFLJGWdqwYGc8N2JBHc1mBoAZauDwID9cA2uDgbSn4Gnmt6So1X
         LX1tAqqmGDoLTaLUuiMvlLc7LcDSrgliHj+5AJc3RybZEfnbBEGHzvBBYfqd+AiAVcWl
         8jr0GQa6e7Iwsy9f3T6iAw/UjdZe1RjlbtUmRRpFU1gRYYLVnFcZ4jHjBe6RMuDEH8bN
         kaTMNrQLxpP2fAQyGAMlxNyKn17jgHDD3PJrD4gAcQk4tbfYX8Zirhk1g+74tzto0rPa
         jYYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D6yyWjpv;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ea00b89bsor688616f8f.3.2024.12.02.05.14.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:25 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D6yyWjpv;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145265; x=1733750065; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7hgTTAcAvvo63kNZS2ll5arN5VoViH9sR+6kv3WAC0=;
        b=D6yyWjpvxEw2YTFeXw7ILH3pqefoalcBz7ABzqTE+Yo+bup5OkpFHD1r1Zt9lgVCqp
         jjjJ19PU6GDS6E54vEfYhg3f0l2EjT+jCG5cm+vEexH/TGCBDD9xG39Fthnsp9t/w2dd
         5QsklXo2PK+yaZtvV2/4z5nxfCKGZpsJluGouAHtePrMDTzZJNVDgMa9NJVXflgRf9C0
         t/zozrSzX458hJryS4Vjsi0m+nXb8gYdLUQ6jSDmsxyUsGN12L3NCnnQJrhPDuioM6uw
         +0ooTGXH4IqEX2uoz7jI1o3swj76o3DVs+Osjx15lOHWz+qdVxe08xLIF1JHY+bkRRe0
         F8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145265; x=1733750065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7hgTTAcAvvo63kNZS2ll5arN5VoViH9sR+6kv3WAC0=;
        b=b7uQ81BzLZwr4m4wl0TqB3mZmBIHajkRaIoo00Cp6itDEXw8SmhqbNIOob3YXwHIaf
         BhARSC7RC2eVvukPQ5zxyqnh+VNfYiUkm6R8ils0UxjXm6EVUpy0y4ooTcit9+KLK/4C
         2lo8NQYwUARsUy9vrb7ySceTfGUqkov9pj5bDPzcx5oqm4UMIDIX/1RJOd5J/A5Egq+k
         RBlHkcfiZT+ih5MYGF+b327slqCjRmQMV46eoh7yXyHapnLBV8ITze51GxzcVjyiHXtg
         0zp1qLOcAj88d1zSBZQ0dExhNRKeoYA0+N2RGyPvtB0ZCFIx3AHDoYw1pjfVI4b1tAGX
         qtrA==
X-Forwarded-Encrypted: i=1; AJvYcCWk+7Q0jnbxCnhGazqaFw/kLngTsiQ2ItSphP/xGbVVeR4UB+ClFUeRpI8Fk2n9zZSD5wBoHnZ/aIh/nA==@linaro.org
X-Gm-Message-State: AOJu0YyZBgVCPW5g4OgZvvQSw3EI/Sgr2jU92QsWR2PXjWLi2c/LIUpG
	NSFkinuBbc/+LSnGn2p7wKvI5EiG4RFZXfeiAawIbne7tS5+NgxBAUEbFcxXcjl0XQ==
X-Gm-Gg: ASbGncuibn74Xt0k0KOohQz8P+4Fz3zpaHuqUB7mUlgHRJdf/+Cp1TVUrA80qXSPcCH
	STnXf8xlpJh5Q95aE3tPYlXgB/1PwjVLTEfhpix5qg5V0HO8XB26FgHw/6Fz/kZ12PFO0GklaxY
	jkvvaFU/kKzaUevTrSMe/4UDux+KHUtXZ82HyhZo4k/NBWb65FLK/em+BMwNQG8bYMeOg8DA3Zl
	Fy7DzeJo2+H1/vMItZtVyoJqgXm0II7XldOrWeVgQ1OfIu2NJF6pw0=
X-Google-Smtp-Source: AGHT+IEemo/kgleI2mLyCGQ61C0ZarnpS72GAYORVMtATpCawhtbXLGDqOMXKJ50Nry8KpGTlsLeDQ==
X-Received: by 2002:a05:6000:4020:b0:382:6f3:a20f with SMTP id ffacd0b85a97d-385c6eb7c84mr16653095f8f.11.1733145259733;
        Mon, 02 Dec 2024 05:14:19 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 for-10.0 19/54] target/ppc: Set Float3NaNPropRule explicitly
Date: Mon,  2 Dec 2024 13:13:12 +0000
Message-Id: <20241202131347.498124-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: u0Biebixze05

Set the Float3NaNPropRule explicitly for PPC, and remove the
ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu_init.c          | 8 ++++++++
 fpu/softfloat-specialize.c.inc | 6 ------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index f18908a643a..eb9d7b13701 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7270,6 +7270,14 @@ static void ppc_cpu_reset_hold(Object *obj, ResetType type)
      */
     set_float_2nan_prop_rule(float_2nan_prop_ab, &env->fp_status);
     set_float_2nan_prop_rule(float_2nan_prop_ab, &env->vec_status);
+    /*
+     * NaN propagation for fused multiply-add:
+     * if fRA is a NaN return it; otherwise if fRB is a NaN return it;
+     * otherwise return fRC. Note that muladd on PPC is (fRA * fRC) + frB
+     * whereas QEMU labels the operands as (a * b) + c.
+     */
+    set_float_3nan_prop_rule(float_3nan_prop_acb, &env->fp_status);
+    set_float_3nan_prop_rule(float_3nan_prop_acb, &env->vec_status);
     /*
      * For PPC, the (inf,zero,qnan) case sets InvalidOp, but we prefer
      * to return an input NaN if we have one (ie c) rather than generating
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index d610f460026..173b9eadb57 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -511,12 +511,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         } else {
             rule = float_3nan_prop_s_cab;
         }
-#elif defined(TARGET_PPC)
-        /*
-         * If fRA is a NaN return it; otherwise if fRB is a NaN return it;
-         * otherwise return fRC. Note that muladd on PPC is (fRA * fRC) + frB
-         */
-        rule = float_3nan_prop_acb;
 #elif defined(TARGET_S390X)
         rule = float_3nan_prop_s_abc;
 #elif defined(TARGET_SPARC)
-- 
2.34.1
