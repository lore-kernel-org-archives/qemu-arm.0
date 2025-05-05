Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178753njj;
        Sun, 4 May 2025 18:52:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdx6y3j6FjaUb5LLyZ+/yhZ7w6GiQPT0kzaQ7o4rp8cqxkXAEnIO4zXhwp9GGvBQCxM04KC6u3IGT8Vw==@linaro.org
X-Received: by 2002:a17:902:eb83:b0:224:c47:cb7 with SMTP id d9443c01a7336-22e1e6e2982mr85470095ad.0.1746409957655;
        Sun, 04 May 2025 18:52:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409957; cv=none;
        d=google.com; s=arc-20240605;
        b=NMMCtFDFfBYhDBzspCW9Pso2Uvkk0V55bRuqDQoDuvjqD+lhbuhWUUMa6HBp+Eo9K5
         v5He7EIvcxC+riZKsbjkQYrUyDxug64xXO7CGxsHF3euMa7rfqpxFwl76aWMck7E5pMI
         hf/l6UVfGbM94X2Q2SNh7RrxCQtSMc+JC4NwIZwsrmrdtZH0TL95XgpI1jUah8zWV6LE
         ocvrae7XgzC2/K8STc6FRVukUVnI9tjVF0qF6hsW7B9TtCQ6bYr1KXiYh/nj5anGuykd
         pN6/+s5/RMESL6JRKvpMu/EWYFhvTxJ9aL3jrLMWdJQX8qT2DVJ5mjU/VmYiFJOwf9zf
         +gig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8+98FJCPUkZxLytRMJNRmc7jhTB2VJSy0tbuhiYCP08=;
        fh=B5FO4XapMwG3PRVKRojxotlaV6C274LUfbp3Qg564n4=;
        b=ayUI6veSVLk0xxAoQDsADdrfLx3ATigvdcD9F4zXNlN17hQR0ypfJo4AuwOdhVKY16
         2TE80R7GHjvBPRB1EOjj1VCfHV2C4tSZwHWGGs/AHgtKQZNR4D0e5/TUecypAMaK9ssr
         ohft2ZchdhwiHzl8CTQTsZFxfYSo4QruWVkJ5OHDGRy4o1+Gtwu0bIxRxbxgrOOYNy+d
         Pbbbn973UhdIlhNQnqQ18kRwIG7i+yMHsKA2RKHTsyp4fz8bGtLkruM/D71gZ/vIPOjx
         8i3tCz3U/V+t78ZWEHb1VLNPfVldrLn/sArTnG5GJcdorAAYPRY0XQr6hXJqbYrQge06
         D74A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s2cvamTx;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9e9b42sor4087084b3a.8.2025.05.04.18.52.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s2cvamTx;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409957; x=1747014757; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+98FJCPUkZxLytRMJNRmc7jhTB2VJSy0tbuhiYCP08=;
        b=s2cvamTxCWUk6lU5CFJuAiWnXJw4gHz5Vi6LJv7TtAd7Q4rPDW+2PUknGfw5TLPtNX
         EzIadymVeloA5XXi3RuiXtYV6kbkVq0Yg1UeZnbq/b25HOo/0yN2UOGztYGKs9FjZYr6
         vQkPs1dv1/iEtnBzoiSv88lQLiqK2qUnopc4DPfefDukRvgWV8iICmRUzkdTa/M8sxms
         Xi92jYdsxdIBHMxtLUOpswtn2tvxWjuBuS8L2+i1LnhTlVipVzKJQ8Cupa7QXTsxiQAv
         dAVgQb+k+PD1IUZ4pgMWhJA+cwWzMmhslYvZoWrN/pZIlTvQTBNJfLn5Qjw5RUshcQrc
         F65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409957; x=1747014757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+98FJCPUkZxLytRMJNRmc7jhTB2VJSy0tbuhiYCP08=;
        b=YiD2A1Q8oLAxjXrMCtMDDbka7pVx29P7DVY/2ARri05S+dYO8duZW5kPfQSYUnslYm
         Dx/dnSP2k79WA/7TOxenn8jgSw9ANWpOgO7c8LG4tTP1+/bv8DEXUe9METMpf1kiUZAr
         E5I2Ys2DPWnT5SkATlGc6WhxWIgqeMyok7ns3ri/GSww+wHtVdbMAJPJ0pyul7v5OzLA
         fMps7icRZcAAZa8AfzOEIL0YlLiyMf/OVgtMn84pabxnn0IAETp9fOyBnCEtpGyoD0wf
         a1jxuj2McYJAgq03pxo5qwWfkkaNNOOYdCP/ifTsbHb0UbZHObmqWd5d5HTZfZohwTM5
         BpCg==
X-Forwarded-Encrypted: i=1; AJvYcCWIdbblFf2TN5AZwFOIsn4UYpuYOebivLQBaFOlN2i9H1/CKhaQXx1y5wtecPyEZAtHqLKLokR6OTAVEw==@linaro.org
X-Gm-Message-State: AOJu0YzovIvQ/gcH3HtbAAgRA/jahuNSZYAn1EQ1G6Rf/+N1DboyyHJQ
	eiZpDoAHNEZR3GHvzNjHDkeJxWjqf533Xz9Ag/M8HB1yUO03oP5tOvmqzimZfMe+bw==
X-Gm-Gg: ASbGncsLatPeHTCRVulR+C0l/XyTdyeFtmtvsvflQrtmyIcW4rGXTZt842dN1hLoe4x
	n5Gr8Sv4JdnlmuzyHUeoHXDD/I5knq+JeBuDGHc5F+UA8wBew4q2UlyCoKSzD0UU4k4JjXFUWxA
	mjKUbKwUMqG7MByfKYwykDBTWd82Cu1jxuyhuzGPTYEn/5hm9PsFoDXxFYS1FGDAsybjQSvP58w
	iHxhDqCq677UiCL8FjwKRS/Prhh+V1L9tNiRr7UA5z+IXYjR6Kr+fJPWhNDup6v3vqwL/+ghMCI
	ILuFrrJZnE/EPlXxn42eboB44QAqRHanUwUhOvcf
X-Google-Smtp-Source: AGHT+IGTUMuWkiXDF+7B4A5RoXeueVtcJqUBJGl4G++uLi5Bx9kadv1aMwlRDeZ/N40AZk3TB+EU+g==
X-Received: by 2002:a05:6a21:918b:b0:1f5:85f9:4ce6 with SMTP id adf61e73a8af0-20e966058bdmr6970804637.11.1746409957268;
        Sun, 04 May 2025 18:52:37 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:36 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 10/48] target/arm/cpu: remove TARGET_AARCH64 around aarch64_cpu_dump_state common
Date: Sun,  4 May 2025 18:51:45 -0700
Message-ID: <20250505015223.3895275-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Zw3KMI5tgpr9

Call is guarded by is_a64(env), so it's safe to expose without needing
to assert anything.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 37b11e8866f..00ae2778058 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1183,8 +1183,6 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 #endif
 }
 
-#ifdef TARGET_AARCH64
-
 static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -1342,15 +1340,6 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
-#else
-
-static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    g_assert_not_reached();
-}
-
-#endif
-
 static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.47.2
