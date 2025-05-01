Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19538njj;
        Wed, 30 Apr 2025 23:24:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlzEyDU9Yb920MOkHPsFqgojSLMlfXPwUUGiYPKTtuOA1WYYxEPy85055T5jPxLSVFWs/JpevzqWqxng==@linaro.org
X-Received: by 2002:a05:6a20:7fa4:b0:1f5:9069:e563 with SMTP id adf61e73a8af0-20ba75f00ffmr2816406637.21.1746080639811;
        Wed, 30 Apr 2025 23:23:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080639; cv=none;
        d=google.com; s=arc-20240605;
        b=IUQPE5eKbgt1jEe2tQMCd7UpwhihBck/gD+WCmoAA2UY71pNbgNunohp2WFoSLWiFP
         R5H6pQqT4k4hI9zDyVwO/2Zp7cwmFUtJXxyLLY0itGieZ6E+W23aR8XPPS3ZOzAWWDRa
         /7ayQ9xeKEqi8I2JgjHq2AqtgT9Omo6h5Dm5KFWRbvXupzpTTe1V9RboyrcdYgfeUcJB
         1ZosA9piKWqIrh1sRApaPsz9NdpCKYvvS1AU1xCYqYIHwj+Rr5VZ29BeYbfViiaTggAi
         8fXagf/bmsrga95CMQTwRWYjUwipqXaGPDU11KLPdFqCMrab/0hjBe5xE7XhyIEM71mK
         hqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=v43acThFN05/FatusJlue/N5CkXsn1OHHnhEzQzn40s=;
        fh=Oei1CNuTPfKeV/oMzcLlKq9zswKavtPouoz/r29rjCQ=;
        b=WcyYbedLVMyObDp5yhQKGrFVpOq0lsJOKEYCk44nvjEa76zKR7yZLvvnnV/yQu8AZ/
         b/ge9s/G9fXy8bY8MQvO5kZY4YyZMYeOhUGKdQ24/cgyBAijGV3JfPcoaeLRb9NUX7F5
         zPmr+/4vbXPJFfJvNcJadU3kss8AC1m5l2WUSMpkO7Jz89CX4hdynT7fYmPP634FkwSi
         K39wgQu1vT5hGUL7FYIPYmKP7OAFMPSUionfJvLCsDs90xCu49ZvygiD2ubFrf5Qkm91
         jgdp5d5FFcaEUKCdnWoeO4krDYZe4vn4LwWEJ4IhAaiYgyxm2ZII7g5qCGlunXG2ys2R
         eq/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yRUgEsl3;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef17ccdsor75936b3a.4.2025.04.30.23.23.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:23:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yRUgEsl3;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080639; x=1746685439; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v43acThFN05/FatusJlue/N5CkXsn1OHHnhEzQzn40s=;
        b=yRUgEsl3Kvq2CdM9/jQQEy3ztZjnuGuw4ZqpmhFUWL6X0ziokQJFp9BYDAGH1/XZaS
         NSiY/w45Lv5UMSG8VstvUSLHnVm/cwUmLmtWcDHxlHBOifrP09cA3zxMAFKYJBSCZROq
         rbV9QLOq3efGkTf+AXM9BWILg5fBgk0EcGVDNCpRayYwu1Q9OOAvO5i0ySrpDiMEgucE
         9Mdm9XRaZDGm5DgeQ7oCWOIivKpuVZWf8I0GBrvkyG2O4uC91xBcVbMb8CsdvS++cQwn
         +vaC0cFhGR4QatVK8Z5qy7zGKFYNlZiAtOupTKrVub4V3+H8zsEiAUjNAPuRqQU6b6pZ
         FubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080639; x=1746685439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v43acThFN05/FatusJlue/N5CkXsn1OHHnhEzQzn40s=;
        b=PAI1Rm5nrcOhyGYeLCLG8mPDhffLdS3ZlzKon1M/y8tFJvJHwpTJXXge9ydWAPE71u
         FhxNPoGZfYNF+D8i+3OweIsQW/a2885U+DOVcYOPLekNvum31qrBotfzLcpbmol1A1Nd
         3P7TJgr9thhSYPO7roy7pOsfH5gpjr1dmlDd+Ta+VJWUQ92mspwn27YXa9DhkJxmBQ+Y
         y0acRczFONNSsx498xf2RJ/hSstgpsITPrvzjcynzVElNVMhg7HoZE/u211oRm2aThXE
         0ux1OPB+9RmLD2iA9nrxHSQ2KwULkeWq8OsiLn0Tkqgh+BNeHl38RbiauBQma9ZJAptQ
         hPNg==
X-Forwarded-Encrypted: i=1; AJvYcCXzL02JLnFox+CWur3yBgajVa1Qb9kc53BnfqSZXGYbOC661rFSEiCuLXx/aU14BdpgK0qkw+IdXF5XOg==@linaro.org
X-Gm-Message-State: AOJu0YyBNrbtJtGOIpjEAqQV6wToip09mzpoGOL7PLWMjuzEwHaGAs8S
	p5pcwmJLBCx4NNUVSyaqUOZUu9MhfqOsKBuqbKOTBUNZ3BrI2jRlYfs1NlYUpwvh9Q==
X-Gm-Gg: ASbGncvTXd8iyKweepSyo6ynUx3vghXDe0iqKxthvFeKEtCOJX7HuKXjmD/PnCrXCvX
	URB1BS4BnTb78nbdENzLRiyGb7NOluS5ltmyaTBBHdKu9LmQK8gUkD2Vh4dgFib9MmjhyI130sA
	cOHGRw2Xs2GLKOrlH1WhpG7hYYqdmtIePWPeA9iTHnJk9/X+REzJy7Z31ap6879h9im+8QjZREO
	mwP7riKvdbejhzglH4tEiPEFeKPpD30DNOMBFhV0SKgNmCqLAUYYze+iDZcGkh7jTvU1oU1UsYR
	oF/uBVy63ZJWero2T848RZR+xmIBhRiXn7gKJZ1J
X-Google-Smtp-Source: AGHT+IGxPomAylWwLJi0L6OKGSROnLWYZiR31IMYciHNxQlk0i4DhhlCaz5LkQ50RwCVuokbYxi1xA==
X-Received: by 2002:a05:6a00:1411:b0:736:3c77:31fd with SMTP id d2e1a72fcca58-7404792b867mr2645976b3a.23.1746080639426;
        Wed, 30 Apr 2025 23:23:59 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:23:58 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 09/33] target/arm/cpu: remove TARGET_AARCH64 around aarch64_cpu_dump_state common
Date: Wed, 30 Apr 2025 23:23:20 -0700
Message-ID: <20250501062344.2526061-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 6zXRkqxQggwD

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
