Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756148njj;
        Sat, 3 May 2025 22:29:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWidcAd83dmoxEwqLizJHLwoYPD15spWyziB8EW4dT/VwNot1cWDLvsyFut8V1xP6rPfoSTT5nB05liQw==@linaro.org
X-Received: by 2002:a05:6a00:3012:b0:736:4704:d5da with SMTP id d2e1a72fcca58-7406f1b442emr4016783b3a.22.1746336577366;
        Sat, 03 May 2025 22:29:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336577; cv=none;
        d=google.com; s=arc-20240605;
        b=HOvNKO4WY6a3lDFrnlsrSSizF5CpCJGBdq5kmWkKHeUhqpeCiPx3NHJGPJlOJVe1fi
         P0abv4RSbkzEyZLh1skpibq3qtwIyYCCQ28OhNn+Ua4u2lTyhzBfa2RkLitkt9sizWlr
         0YL41YDtIuKlwzwfiV/2i4VL5WB/X9hjMgeGAxP58DYRIr2mUrZaY7DEMP/u6Tt66NYK
         Bt/HCjPofZIC4V61/0WwoxGhIcyKaNRW8m6OeGUKNsMvIjItk9NLzs/pjj8pdRti+7wx
         G267Rp9U70NSoTvloTtCQOx0I4n0QR6dWiwPV0C5R6+jr5DMxf5z2UoWUAq/skYipg8a
         R+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fgL5ekQCPVNJfHfcPabdFrIvM+ux1exN882JD3eB0JI=;
        fh=PXgtQzNL9b11U9powCkE+TNpWCIwIwuqfP3urX1d6oE=;
        b=L5r3FePgHbqpTpSiKbridpGimVohz1SEWqGL1zqHfI41Z4435k9mtwTG3EhicYXGK2
         F2/hFTuzqGgt5yPhpQbmrMK84Bd4WT43KX3rkXFkJ4Qc5GvifWV409w5hFax7uc+8kZa
         QffCArD/eeSX82VOU5L7xp5xe+s4zTd3qjujX82SaD0Mu5kSdB6RuxptSJarxn7tPuaJ
         DTCzQKuMWEMNgTBzN2NHPhOq7/GXpHlvcBPlZ4lFeACvMjh8Oygl/8Ry0pD07O0y2sNJ
         qodj9UeLZlZmLzQmgShPi7L8YwPDNkxg+g74VjoVwtFag7KlM+/MVrPufMRZxR1GdOu5
         +NCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jplgUoz7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f7be2bbsor2962880b3a.6.2025.05.03.22.29.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jplgUoz7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336577; x=1746941377; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgL5ekQCPVNJfHfcPabdFrIvM+ux1exN882JD3eB0JI=;
        b=jplgUoz7J2mpjxidcOFTK4pKjzb+zysEY//A+cYnkoAztCLPMfh2rQTz6qbM9nIXoh
         BB6SSOyypqjQQ9h79Cp+BDB44VQpjM5aL6W41Wcwj1SGqvLD7L16tnnywqx/V0brC2Lu
         udaU/JaNPtOdHYiVOi8jMAXJAykDVzN0CaHUcBokLZrzKUIXGQhNgT5RjkkmzBBnDXg2
         6OHMe1InT7dz+6kT5KWUDo0QThx6hCyV03NU8J0EIaGteDY7tibykkz0uo0ALR1e7u29
         hPsq68UzVxAlmvdBV2KRWi+sxsqWxJqkso1ZUhHFBbIO3V18z0GWirboVZnSlwbEJOVo
         eQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336577; x=1746941377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgL5ekQCPVNJfHfcPabdFrIvM+ux1exN882JD3eB0JI=;
        b=lme0XuDgwMOopqaUa7uLiTsQsslGtgUHb9AWvSYPUIDxfypS7pPIirgtPU1atr4way
         OMw14Gd2qP2IwUSsSywd3COP9yFYVWRXwwliHrnsFw4CK+2l/3hrvzoshKpDEAcfqeQD
         bMw7R3EfS8+/8iV9jinlS3FZUPDlTtqsg3cnTAavJWAriezDB3pHGhS4O335S0BZNcT1
         MM4KPNN3PFyJO6januTLd0E0yPdPDBVB1QNDFKX7FnSLaD8sD7fezUuSdX/NqUvxGMb0
         4+g4bsQ5okf26PAYCoQ8Bix5lZILb1Nfe6DStP2iu95zrH0YsRSVSd6ThOMzGK+jg/jp
         nPEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd11NCISiP7/MZ60ZRkx+LDh6ze3fMXtPSSSuDfvPLzWEIF9CavERiw8PSk+dhjkn/FEmvHnR/+fTedA==@linaro.org
X-Gm-Message-State: AOJu0YwMKRignWDGlx/ks8gWl9oTTVtAHtKrIJvMgdgkLP2xN4EpA1OT
	jZTDG7FcsZSfCPg9LCsmXl7zVUsuZiyN6RZRBEDeAdgq8M62FD2i67wayv49mcasqA==
X-Gm-Gg: ASbGncsTy/t3E8wxuSUOv44fTAhl1/HxVO+xZSlC5keRPePtAo8haIgJ688ipVyCNvv
	BhWAnyBxBggeeniMx3X5VuYC2IESh5i7htMZqYyy0DVrryROOYYuWBbWJcr3G3OEQnPmVRDDclI
	KRDrfCdi36p4NRw/ZszbP91M8LE3ebk5daDasn+0aDdjTJ9thCYX9rPc527TszxjcrjXCoB9fzV
	+4iHaY5vHZgQ9Qnm6HJXd/tdwTUWF7po6N7BOQhBhSi+9eOlDCls4SVUMXrd/C3qg/XGN+9g7II
	k7oFi4Ij8IhxkWAccRhxawiT1p93mGydL3r2qFDt
X-Google-Smtp-Source: AGHT+IG0fiHww8wHentCcO+BRbRdEEXumZMr2eqE2gcWz+lyA3vsJ3lxTr49JaERvR9Gf/hYkM+otg==
X-Received: by 2002:a05:6a00:2987:b0:740:5927:bb8b with SMTP id d2e1a72fcca58-7406ed59ab5mr4309964b3a.0.1746336577027;
        Sat, 03 May 2025 22:29:37 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:36 -0700 (PDT)
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
Subject: [PATCH v4 19/40] target/arm/debug_helper: remove target_ulong
Date: Sat,  3 May 2025 22:28:53 -0700
Message-ID: <20250504052914.3525365-20-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bGJ+1dxIG+Mu

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
