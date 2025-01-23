Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485537njk;
        Thu, 23 Jan 2025 15:45:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWbzBXzAamhWWum2CART9n+HIOkRtuKkW390yQuVy33q91ZN4j8YdeSSbqGKm10NCgqJ3bHukj6GvJFng==@linaro.org
X-Received: by 2002:a05:6000:86:b0:385:ef39:6cf7 with SMTP id ffacd0b85a97d-38bf5673ea3mr17407596f8f.32.1737675947911;
        Thu, 23 Jan 2025 15:45:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675947; cv=none;
        d=google.com; s=arc-20240605;
        b=ieUMbDTkw/GQIx36KBJDm0Etu1Sp9VHmNlJFtRqeOF7NnIQ5AY/IgW8JEGK6tmUr8W
         YAng5zXPmUHYcwW5O1n9yeMdXU+t6KE1SUmkvf9VEGf86z6rT/Ozw7junc122Gm5a99Y
         pKxHSJ0FnI7uHFc8BOh/6K8fytMzIq0cOLvcqIlk4v+gdNv9S0NsV93Bkn5raRSPkMzF
         mjZpHDAW2jKINNfs/4LQmrpK8XMMc8Jb8E9mn0lm1727Kjl9+ZfEcNxk8PZTZqwgCUuQ
         n7A+QiSHtEadUPWTl7aHqUcIIo/C20NkKAtjbET38CGcMaizN8pvE6ZpsLfiRe1bKvv6
         Pdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OmeiNXwxDOryj9Nk89BSf7ntmaAiV2ODrxL67LjT3oE=;
        fh=QB6RkZK2gImcaj/oE2rU16rVV56f0WcLox4ndAs+500=;
        b=ZXbhhYoXmdtm4WD1aIE137aNyfR1KeQEyLwlKY+HNA9+g/2SIwfs5zVD6gzt7e+pZg
         dUbwVsKDS899x6j6HD/r8soxS36efr/ZKNyKy/OYxFC9xyRxFEPevUJKYR8n3K8cNg0B
         SNyheLwlmSv5ZeXYh9ju8giPvvpTABUHsAfdjQiqEnH+jjPvn2QdfBuK+NNiq3qk4CtT
         dBogR9Y9ZD8Z+ijmb+pNx9Okj/TsnwZE37bk8rRRRyOC6qpnY5U/788MS+TvC6q71rG3
         wHAdxh7SKPRmhyDUA/o2ftTTCYlcjxq4J0GFw2Iun0/ZFrbHAbGklniiwtPy+NQWZPvb
         nIWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QIbDbHY6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438bd4e2185sor2339375e9.7.2025.01.23.15.45.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:45:47 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QIbDbHY6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675947; x=1738280747; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmeiNXwxDOryj9Nk89BSf7ntmaAiV2ODrxL67LjT3oE=;
        b=QIbDbHY6YJovTAkTEG7wujql+aH7HX3HQeLC3iMcNdmNC7kHym1iJyN21T949J/02V
         qsLLZVkC7s2Vr+V8/4etla0NhhOf1FbBQHrFSjabw+6mCqj5Jk03NHbtULOf9crTOVce
         QXReoeuRr9q8hnFMjX5KkZTbjcLRaMH/coTKHfM3ZmOmMgzzhBuWSYGJj+QGCeQ61YIP
         OPJ55iNGYN4/xvQBe9eTfX+b217GOfAEmm03d7IzmIGLdYgr8hfhFWnWEUcioHXXDumg
         Lz+2Sny3YkfhqF6ym39/uve8qDv7MB/Ubqv9FoimpgwUwf+A6xU+EfuwXesvViFWfFk0
         VcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675947; x=1738280747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmeiNXwxDOryj9Nk89BSf7ntmaAiV2ODrxL67LjT3oE=;
        b=X46RyiDH0wn7W7dUScwsp7jU0epi/UbLE/mi2XVZBErd3UzBkv79Jf4Hb3o93H8KCm
         zDABDmyyx5ylBCaW9MGjZhYVB4kQifEtZdRwr56dsS3FfRtF5osWs/7r2BkPGg2cdjBU
         /1Hamrz5UKZeS+Ela/QH2W/icXG02Hy5FqS/X7p7KAg3GnfJhYPVx4zjpj+SA8A2GOCZ
         wMUpLuBo+UpU58PgX8EFAzGbEeYTeSmdF+7c+KdMB7T/YZyhkkHph9GkNKKy8UYgaKed
         7ltNN7qsLRRKgtIWamuB9kK2enELGiL45NwJtv8VeatkBiehdFA7yxndN9vRhKiqwkkW
         3j9A==
X-Forwarded-Encrypted: i=1; AJvYcCW1MNiZ61LLHq//VFPoheLr0OA3+8i9voxifCzHJbfREZCirr1+qAUAFHsKvqSrHVwQwTsjIJblOJQh4w==@linaro.org
X-Gm-Message-State: AOJu0Yxx7F/IrVcNJq9VmhdDdlb0EYwgHbX1Rn99ZMfNd+L7yNEaFN0d
	SwNzBUehsS3VjrA1adscYIyJbUpEz+LWVjL9Rw2wjD8zSE4/fPqNvVzzcK7s0B6YSXzPq3A6KPF
	+zE6FQw==
X-Gm-Gg: ASbGnctsuveWzypkivODQUAdywLxun31oA6P7/oO2LPFTmtg3tVbwRhnI7s4POK6O3b
	FHuLP83tqfTsRAGoM3c37r8eIfunZzU477jvFcw+tjgZsEIRl/BCA9+qtFue+UCoXrxs2bqP/4f
	tJlP2FKIHhzlf53WSc0r6XeJggkB4xPT4OZnNDjMi5jDi2W0NXbR7eqJYmW4BkywTSTCja1290z
	IxobQYHHe4Y4NaR/g/uMmrryu4dVfnHxp74tKfluWJbdy5ZKN8jG5tArGez3B4DiPJeX3V9R8rB
	RhSoTB/NU0VfX1T2lMj6akrudxIMuWX3wjg2gJIRvYIrNFni9NTerGw=
X-Google-Smtp-Source: AGHT+IEFJ1SeJWoUW3YaXnTGBs2yrvL22hVEarb/siWyosLBI70zXEF7xcr/1TRnUm9/lQBURa7m3g==
X-Received: by 2002:a05:600c:1e18:b0:436:8a6f:b6db with SMTP id 5b1f17b1804b1-4389141c12emr225835175e9.22.1737675947213;
        Thu, 23 Jan 2025 15:45:47 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f355sm7138595e9.4.2025.01.23.15.45.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:45:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 16/20] cpus: Restrict cpu_common_post_load() code to TCG
Date: Fri, 24 Jan 2025 00:44:10 +0100
Message-ID: <20250123234415.59850-17-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: y+MSji7c27Zu

CPU_INTERRUPT_EXIT was removed in commit 3098dba01c7
("Use a dedicated function to request exit from execution
loop"), tlb_flush() and tb_flush() are related to TCG
accelerator.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 cpu-target.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index a2999e7c3c0..c05ef1ff096 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -45,22 +45,27 @@
 #ifndef CONFIG_USER_ONLY
 static int cpu_common_post_load(void *opaque, int version_id)
 {
-    CPUState *cpu = opaque;
+#ifdef CONFIG_TCG
+    if (tcg_enabled()) {
+        CPUState *cpu = opaque;
 
-    /*
-     * 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
-     * version_id is increased.
-     */
-    cpu->interrupt_request &= ~0x01;
-    tlb_flush(cpu);
+        /*
+         * 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
+         * version_id is increased.
+         */
+        cpu->interrupt_request &= ~0x01;
 
-    /*
-     * loadvm has just updated the content of RAM, bypassing the
-     * usual mechanisms that ensure we flush TBs for writes to
-     * memory we've translated code from. So we must flush all TBs,
-     * which will now be stale.
-     */
-    tb_flush(cpu);
+        tlb_flush(cpu);
+
+        /*
+         * loadvm has just updated the content of RAM, bypassing the
+         * usual mechanisms that ensure we flush TBs for writes to
+         * memory we've translated code from. So we must flush all TBs,
+         * which will now be stale.
+         */
+        tb_flush(cpu);
+    }
+#endif
 
     return 0;
 }
-- 
2.47.1
