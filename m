Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778266njj;
        Mon, 5 May 2025 16:20:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXND3XkqUSwBXkJParc9stb9lSYarW9xlHOO7q5TWSMv/s6F0r+GEp5k8ucbjL7QMfTQzVxeLaDxnZUaQ==@linaro.org
X-Received: by 2002:a17:90b:3c87:b0:2f6:d266:f45e with SMTP id 98e67ed59e1d1-30a6196f08cmr16000984a91.2.1746487237951;
        Mon, 05 May 2025 16:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487237; cv=none;
        d=google.com; s=arc-20240605;
        b=cexgF5lbeb48kgIaPHNZTfEBhsQ1PHe+vmPAZ/e4MtMQdPr1hjHxRtHifRIcHBlgoD
         zda934ndaFEcmKHXevIVLXDTEp593ZhIHHdiWYAiMj0j5yxmmwYCxCgTxlh9AmzyOfuP
         1jqElqkXPorlnbGi4Jbebw0yfa5geZe9G+KKaFeOfzW/FIh2+F22AmzOvCcQlsZtGG4Q
         R0AMtYzLSCG0e+T2FKktVo8A6eW1e8/ygywdNjce0zNjkp2vKgpwdK50BB/hY3pM1MzZ
         DO3PpTulDbsZmnP/F64YhGNg9Kf6V1pylw8wjCawooEM5T+hsqABAJsyfngF3jnCI5uw
         a2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fgL5ekQCPVNJfHfcPabdFrIvM+ux1exN882JD3eB0JI=;
        fh=cPZVkzLEkwmx52ZTfe72kAqjmpkiME5/jgN4NECERnI=;
        b=VcfHIi3MxrfKGxGvOflwSfdKqCeHV70U3FTe+Nlub3HHtlamkJPjX56G6GigtzV+9L
         MdnATqKjU3RJ2jIaVnY2ARRksnuqI7Eq6kFrzSWgUkUpEQ5FGWzVB/c4SaRa8qXXkDui
         8FEy82Z7NFby4C6KA94jRErw0I4/XAFbT+7L11HXDUTNFnQGHFVETWmQavtQfyS46i5U
         KRzXe+Wcf3ns2dKHBnXuAoqPF56Ufxx1ojI5RyZZkaxOZLDjJk9Zbej3AoamEIOaF8C1
         dytdnXUe6MZJisYS+syQEuyr+gaZWtaZ85vyWYr69AZohKNCXLylZX7YWbUWpNjdflCd
         Yj/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pKSxPzCw;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb1943bsor59484065ad.4.2025.05.05.16.20.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pKSxPzCw;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487237; x=1747092037; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgL5ekQCPVNJfHfcPabdFrIvM+ux1exN882JD3eB0JI=;
        b=pKSxPzCwUu41cvpSfJhCaZBnoFIISgI/7n09IGN69er1EbpnjkbysMPheUWKOdKwBB
         jopTCNHANh3lSz78tPh7rx769iLFkIbHRO7XU3n7Ah8d1qW+xtwv/iWYT3WyJNtIA3oY
         yKGWDGF5FIEyPHiOQjjaT5HPnaw7lumCgbxnczl5gUoAKNuF64ErVGY1PLnXdiJ3AScP
         oS6DJl70L1E/Q+Hmz+8WDD28NLgJ4AHcCT/WrpzC0CBS7qop7BoBuBv9HvxVQoCNkljS
         tXKMMVpp9YtrpiHxg84T5O8D6DVpUaj/u8xKig/g+uvR82ICJm8rMUVxnFtKIlsqTx65
         GztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487237; x=1747092037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgL5ekQCPVNJfHfcPabdFrIvM+ux1exN882JD3eB0JI=;
        b=LaIEsKujFnMWBVDlBWTB/D8fZ2isJo6KK3yR2NAUwTeZd1L87/PY08iLmtYvMAx6Cp
         /QsnSArjFIwGcs1fd22pQtN7v+iqCvc45vAiquItWV+IK0BlmTDqk/TP/dzhfcapKc9T
         BIjg6BKGbLL7aNm+CugRL7AL790qpsZFkeWyJGzpzQZ8bUNht34tfi//AzUEyb9ob3QN
         AFIr4b0gtzfPlfO25eVivDXxKf5nKKq6y1f2iOOFfZeuPuQkJiBVV5icIjBSV0Tl1Vdh
         D12UDwjJwltUrI6SfwybFNnCNQHMLZ/+xifXcAOF/RdOlSKcU4uy3eSTFOP11X48dNvm
         kufQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYkN0Va9WAc8i+JfA56broY5GAkF/vyW4Kgav6rNhtb1NDFnhBZwMjn18wRnuzZANd6b5Z4xGR91Uq5Q==@linaro.org
X-Gm-Message-State: AOJu0YxmeNZ2wTdK2zDeZA+FkSIiRRiX9WQkYjphedcS0CMiWRwr737m
	jPTkW6gyGeWY0NKInHD0+SxrD6Od3lhs3W39X5rtbJRQ0BZQWnN4TcsK8e2IB/CExA==
X-Gm-Gg: ASbGncuTwOYm8Uh3n9QYLPpu7wbXfIGkWSbbtOLemX9BPWtF43xeaNOGZC3Icovbk9x
	ERBuY+wmoETQB7IkNxxPn8o2IfZmM5u1vlkRHCTForGsDIhkrTxaO3DHPArhXTqVlgiRK30V2j2
	fzrqKm03o1Ubn/wLJIVfWsvHbRG519xZ3nmsMgacDrg/n9aEkNgLgLkmKHZcbVEODz4FSik0JkS
	iF7RHJxfUNyh0my0Q8qMyyq6cPF8Bz6mU4vj5bcTdjvAtyhp4CciYP724/0UaHRLMnYBvub5iW1
	RXqe/mBOYOFAj3zyfLYEvS9Xa/R2tksTwH4/ulhp
X-Google-Smtp-Source: AGHT+IE3nk/0V+BVylyx4venVIl99+/yB106zJ5mCx0F5wFDY1DkA2BWuWgtA/VYU3cAbsPYqddZLg==
X-Received: by 2002:a17:903:18e:b0:224:6ee:ad with SMTP id d9443c01a7336-22e1eb0c7fdmr138049205ad.44.1746487237553;
        Mon, 05 May 2025 16:20:37 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:37 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 19/50] target/arm/debug_helper: remove target_ulong
Date: Mon,  5 May 2025 16:19:44 -0700
Message-ID: <20250505232015.130990-20-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: miS1XGD0BB+M

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/debug_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 357bc2141ae..50ef5618f51 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -381,7 +381,7 @@ bool arm_debug_check_breakpoint(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    target_ulong pc;
+    vaddr pc;
     int n;
 
     /*
-- 
2.47.2
