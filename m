Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42829njb;
        Mon, 12 May 2025 11:05:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEARoOe29Ebhg0o0qS2u//Zfl7k+g3m+xSSexFLrHH1OEPqh2/8LQfmPybEQmoAn6BtVTspCS59+pZAA==@linaro.org
X-Received: by 2002:a17:902:ccd1:b0:224:a74:28c2 with SMTP id d9443c01a7336-22fc8b76a88mr210234255ad.29.1747073134619;
        Mon, 12 May 2025 11:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073134; cv=none;
        d=google.com; s=arc-20240605;
        b=lk442rQaH+Gl+63utvA2dFKcPErTlcLvSBdWFMey0ad9aDhJ5CYMU0/pBaz/sMQxOW
         e7FNfYJdmKb+xU+Q0jJGJE5blpBFCHs7QjNB9H12QrgxUNtp4N17M9jv+7z4h76NQ9f2
         WFJNyLLAKeAeGdxvzY6OdGAAMcpm9pdwRGT+j1k3cELD/1wmNeksIHYM/fTnMTY/eQtB
         xp03F51hraXHKLBg7qrCJ2i5uPnr3mzgeQE8PmPNeoBRESkp5RpuNTuHB1HB0oJ7ptvB
         3dx/DEI5EXVwlxwgPZ5aL6qZbusXmlc22W3w6iI49LqSQAOXI9q7pkC62ZlMlApN4Tww
         aiMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zqH0yuKEeNcEhgp08pnDlbJMJEZktVD9woNi3X9JPBk=;
        fh=mPwST3BcdardvFhvN9RgfRQwRojsGFT3uYzTr84IgII=;
        b=ATAQAG2oeR+YDPtIAuwibqoQ752DbguP+fmxXBTONh9Sm4tsSFyy2/frL+5eTsTfyu
         gusINL2uelKYHnC1lfwm5WUeF5QRvI5rXHlm4iizuS8OMa70doyIfliCBEYTPHPxon7B
         yeCPGvgjhO+PMFCuzgBYR+Cna6xwyrjTMQlRDbBAMGmF53hAEAGiuNINJxYx2p8sUW0T
         Ow6u/dLULQsOmaWtgKr97WhunLRD4Jqkc3gKvPCAsEBmiEIFU2ED0w1ODNZEL1h8Ki1R
         TO4ySwtHdF6rUu9k6t60vI6iqFdYhbgtvYzX2Dif8RLKYGn4/OEbAuOXtg5n4GO/NELJ
         0/cA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M1DFygAj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc58284aesor57853215ad.1.2025.05.12.11.05.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M1DFygAj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073134; x=1747677934; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqH0yuKEeNcEhgp08pnDlbJMJEZktVD9woNi3X9JPBk=;
        b=M1DFygAj+FeSF7r7vh23kXIBQZRb4UTc3g+KS4GnaHLzrUlnJ4yOqmUP/w1pb4Ckwf
         g7MGwzRBytB/W8ce1Nb8pKr3Xn+C/xjWtZY9LnNYEIwGD9WOb8MV8q0DwBs/MfBq1K83
         zysup1ZsjR/O2hoXMlQGgg1JneJavndzUais/wiitmRCEtXUHET2JeXQ8CdJLbSZdRn3
         nRn43S81/nRsc2GAj4uEIj0r8p7YAV8+g8HqrUQZe6o9+gFogJqegR7ZLTMxsgWfRHfM
         EaGWScHtVi4Cgi4i6xXMyAZj/seDheBmDXktwcbnQsr0tmnyavxa3TDFUo4Y4ZjrNCS6
         DR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073134; x=1747677934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqH0yuKEeNcEhgp08pnDlbJMJEZktVD9woNi3X9JPBk=;
        b=LFUhdlt7fjIRoYZacyDDNSL9LlgA9CV+8ctJOopdIabAPzjo1G6QS74k14BXTssstQ
         DXY5hxBFo2PiIQifD5V7t6ZsrKD+njeeze41QoeL4yobLkFVFa9Lz4rq6gfD9DqLLImq
         cAl904wK5yyiMA4m1UI0Fexf5khjq8RAla9RyYCkIehADrF9RSqD66M33BgtRBsCFQiR
         WuyzNPLyfIQCGN5z4lOesfd/4nJSzh8/01f2PhioGSVc71q4zF8t/v67rqcaMcsqJKEz
         6rD7iOZ7Vy8wnqtsiEUqV3aWjSFrh2RqXOUJ3IOJkbwSXaf3cuqJC/XzvhrkeThF5dJS
         wPYw==
X-Forwarded-Encrypted: i=1; AJvYcCXSTId4YVR5R506khw8EGAchnCmRkXRm1BWH9bjK3tWQnLRjHFj5E4lLJpcWKPM9klDBIbN94TvAKLo3g==@linaro.org
X-Gm-Message-State: AOJu0YygFfKRb8gq7M9NgW7FLQMbby+1Dq1DiAP3tvnkGs7y6o/m4LmK
	k5aowQjruzet40tGFvAkS6WWWtIjif/MXPFKFmauaOPQ0sAuO36fj6yG+3EXhLbx7A==
X-Gm-Gg: ASbGncsT45zWPbR5M7kewcONGlmNkaWCZ2ZqfQX49qWkN/Xd8QQ5dfEuLTSacupsT6H
	njuLyJ5oUrjdRj8iGdoHjfLk/z4IrwDw/6Lts5z1bEVuO3atJHybMOVRn5pKDBc8gY2hOyeprY/
	0WexDTSEVklMOZ7YWqkWmRiiIUpKLYl64J+n42DxYOP+eE0+6KrXMzt4uCEwD/qzfBmDJ5kj4n2
	Fu8Xpfz2/1LWhlwUhQLCZ0jRputUDUPGqoqv5x42ph16UJSQPTURQgYjIUXH1c0ez9/U1vXj2Qq
	hcfQX3E8cyq+JcjkSN+AlWWnZNQkvI3xll1Bz2PQR3Yx73a4PCc=
X-Google-Smtp-Source: AGHT+IHRbtBZKrpk84DwZT3SC9tiE9r4mdkW5j7HAsCCRKXXvOFwFcuCksCJ+/nzbAM4OOHTV0FO3w==
X-Received: by 2002:a17:902:ccd1:b0:224:a74:28c2 with SMTP id d9443c01a7336-22fc8b76a88mr210233865ad.29.1747073134177;
        Mon, 12 May 2025 11:05:34 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:33 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 25/48] target/arm/arch_dump: remove TARGET_AARCH64 conditionals
Date: Mon, 12 May 2025 11:04:39 -0700
Message-ID: <20250512180502.2395029-26-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sC/AJ51R0qTp

Associated code is protected by cpu_isar_feature(aa64*)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/arch_dump.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index c40df4e7fd7..1dd79849c13 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -143,7 +143,6 @@ static int aarch64_write_elf64_prfpreg(WriteCoreDumpFunction f,
     return 0;
 }
 
-#ifdef TARGET_AARCH64
 static off_t sve_zreg_offset(uint32_t vq, int n)
 {
     off_t off = sizeof(struct aarch64_user_sve_header);
@@ -231,7 +230,6 @@ static int aarch64_write_elf64_sve(WriteCoreDumpFunction f,
 
     return 0;
 }
-#endif
 
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, DumpState *s)
@@ -273,11 +271,9 @@ int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
         return ret;
     }
 
-#ifdef TARGET_AARCH64
     if (cpu_isar_feature(aa64_sve, cpu)) {
         ret = aarch64_write_elf64_sve(f, env, cpuid, s);
     }
-#endif
 
     return ret;
 }
@@ -451,11 +447,9 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
     if (class == ELFCLASS64) {
         note_size = AARCH64_PRSTATUS_NOTE_SIZE;
         note_size += AARCH64_PRFPREG_NOTE_SIZE;
-#ifdef TARGET_AARCH64
         if (cpu_isar_feature(aa64_sve, cpu)) {
             note_size += AARCH64_SVE_NOTE_SIZE(&cpu->env);
         }
-#endif
     } else {
         note_size = ARM_PRSTATUS_NOTE_SIZE;
         if (cpu_isar_feature(aa32_vfp_simd, cpu)) {
-- 
2.47.2
