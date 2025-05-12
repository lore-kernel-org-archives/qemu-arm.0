Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42721njb;
        Mon, 12 May 2025 11:05:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnhVg4eGeDJsh3oY9ppEMp2RqR0Q0fnD5m4iCuMLJde8dpgwrgZcgQt+0G6653TPQqI2TkAqMp8Ws5qg==@linaro.org
X-Received: by 2002:a17:902:d486:b0:224:1935:fb7e with SMTP id d9443c01a7336-22fc8b5f308mr244943515ad.24.1747073127660;
        Mon, 12 May 2025 11:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073127; cv=none;
        d=google.com; s=arc-20240605;
        b=Lzm1rWX1IEQHnAmznYdINiYn33wlLI/VrfGoR2pnd57mywbvj9K8nnTE4AG4EHX1Mb
         19iNd6D29O319+1wQvkvkDRr2NvMa3H47hymRJku0WqgbcJjbGW5U6Pi2kwb8ukio7Jr
         wwveJNJIqx9s8JjZryW2/fqq0dDscoClPxkW0nLblJ1SQW2Nzfox4m3j9L9Eh2vDkbH4
         TU6/ySLNzgsy8dE+q0wbEiOd/NQU0X4Cv1UzGk/A1+OovQdifJSzCSP+pP2mL/xxQALj
         Y5gcf0c/Upvm1xceV4PDO6n0DbjGHDH0drZt1ZDlKsA6KPr72qU4GzI0ZaUdN71aY8ho
         x/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fgtSyivanfJoltGbQqPmVVFicsFn6el5hIn8rUX6RjU=;
        fh=k//WcukOX2UFBG3p4zVV4pW7CEKsiW4Ce7tvfSbl1m8=;
        b=OD/Owyw3C07bpRVyaKJdCi5hI87f4sDUB69vivC/1MiPplP8UASAePutzntdX3Um/a
         iiOaHOSNYpTBg3B7uClxyTTB052xqXsyzGrkqQkEm5ThbxvIvqEuKFsUSyNg6DNjK2eJ
         Y86RnC7M9qpUq/6YvzMm8QSw5a9K7C5HtsmI8IwIrlECBxVX4QF//zyT2zt9702oeFf2
         o6IvcR18k80CIUFh2Fo7vRXgiZqtXDqy8k8p+BZ+6YPb6WaNsGSmyvlQfRV514/qRdEU
         ufptB5cN6CnxNl2B/d3f4VauvtH753jJ4ONctaAl7Vrr31X7cyRn1Z5/J38FD+je+SJY
         8axw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hoAEfNwN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc5828110sor48568445ad.2.2025.05.12.11.05.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hoAEfNwN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073127; x=1747677927; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgtSyivanfJoltGbQqPmVVFicsFn6el5hIn8rUX6RjU=;
        b=hoAEfNwNi7C8EaOZSRM9tzaxtqIg28AOIFEFeg/LManQ++cG46pvdA94lbUTV5dau8
         kjfv3yyGX+ZUc4LJPj89ew4rfOnS81fwKLH8MfthM59oGriqqyQBzIMetg6CJcqvFaEa
         1NrWaAcVtM9ymqJHdrsJGKfv9Lq+VgJCKNMnqd6dhnxlyX0+00vF0MqZ8kwb+RggpPGT
         A3wcD5aNwwZEIy4QxYxV6WTX+f+wi/BxIH7Va8RvsIFDWlZMNo6N3cdyn3RWGNNvwiMw
         ruCQy/QaKWdcCvrpSuHbL3UWlOo/CstUBAjfI4h8F6pzs8QKJDryLhW+Mm+xAnhfKvhN
         pfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073127; x=1747677927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgtSyivanfJoltGbQqPmVVFicsFn6el5hIn8rUX6RjU=;
        b=aeHv1Tj+SK38A8Sge/UKgzDZFiacNHTcfsCmSzFJUzAwW41pA0wu8pJ7ehVUxEw0Am
         9hPFTnWTwPA2EmdaHZTJ+x8ke2sMRLxlGB1ID7Sy/OSpv9I4WROZwg+PK5Lu624MTWrR
         cwkssiDnlK2PZ88vEzTYq6tLKRun3NWxeYmM5B+ExPOgmE7z393bSQgLaZkNge2C7YHl
         CrQqx+a3KwRwncBJ/nzmQacYieYE/MZJAeHR5PTr4vnvSaVerTRdn428mdxZbj5s7OqS
         xmY4Mh7luyKBAsXKrzNceMKieusqEga6dTN3paKeqJjOAnbxBU6WS85SeFi9DzbopDYe
         mPKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2ntSr1wt/si5dH0uJCn/Nt5f2csTD29zCgbzgfQqTc/LldbwjR2STvUDhiMDEuPw/0MLpctI6h+h78Q==@linaro.org
X-Gm-Message-State: AOJu0YwdOvXO/jiroPLz52aOj8mz9oMwd9w1qfUyCwWcUdKGBtiyhBng
	76Z80uN62SF/JXHz0OgMRdiO7Pp9u2xm0x5rA2di2GGLhk2TFJMf5qCQhDSL+H9YTGjcKj+oEjT
	+wig=
X-Gm-Gg: ASbGncs/7yd6LT2tvEVFaW1wcI+BoY6jR0EJHjtCyEeTURNOl/W/rU15tsv4ZwLyyID
	1u0kHD8WljYIF4I23DalCR4GQp2uauCFV9DU1zqZh0u5BYsCOyshwyx0eoHQYwWAZhSEpC/G4Fn
	GFSQdhpBQH0QPXUCxZdUsNrB2lPuh7K85OB8iC1Z5SGIGvxh6D0EYmgtCc4yZezCYGg90HueXUj
	rLLof5Gn+SDpYXL9fNXQDAQQbY7BJjwUnvR2TVRAUb0NNS5HmdblWeRS/Z5nDI7bR+MpXaNfyHJ
	fjzE5wNDaOOrP9oxQJuC6Wam4BU/FagRMUv/xjHOmvaG2lvt+kk=
X-Google-Smtp-Source: AGHT+IFPFtd54s+F2aR6e/s2yggvKE9L9W2oRHkbhnFg6B45F2gxHU/Non/U4k/+HSNVb7YPTjYCXA==
X-Received: by 2002:a17:902:d581:b0:223:3b76:4e22 with SMTP id d9443c01a7336-22fc8b0b618mr179655835ad.6.1747073127211;
        Mon, 12 May 2025 11:05:27 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:26 -0700 (PDT)
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
Subject: [PATCH v8 17/48] target/arm/debug_helper: remove target_ulong
Date: Mon, 12 May 2025 11:04:31 -0700
Message-ID: <20250512180502.2395029-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UQbcvwNVQQ06

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/debug_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index cad0a5db707..69fb1d0d9ff 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -380,7 +380,7 @@ bool arm_debug_check_breakpoint(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    target_ulong pc;
+    vaddr pc;
     int n;
 
     /*
-- 
2.47.2
