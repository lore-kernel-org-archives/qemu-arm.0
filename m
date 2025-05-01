Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19603njj;
        Wed, 30 Apr 2025 23:24:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVuXTcyYBCcCyQEARB67+Ye+k2OX41xg/LXyufwr8ZDX4ledHGNwYt88+gVryiO/+3BV3wC2KPAhTS7dA==@linaro.org
X-Received: by 2002:a05:6a20:e608:b0:1f5:63f9:9eb4 with SMTP id adf61e73a8af0-20aa4680876mr9990386637.35.1746080647127;
        Wed, 30 Apr 2025 23:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080647; cv=none;
        d=google.com; s=arc-20240605;
        b=NRfbS9cxfLEPQNOxwEa4bn56YuocjSvZ5Ad8wVoIju/bO8r5EiqIioRsmyPGXvjgW5
         rdqR0Bt8rvgUGNyvtednRxCQJ5OOdkSyNdjWj44V28mzzpharhUny09pJrrvG1W0lrWv
         U8FCJzSq5qVgIDfGq+8HADYdkERCPZpayMo7EdLEAGdjVNVYAoGrnIEE0t1a0dRiGXxn
         xxW/Ap3Wsy+EbxiZ7tTaTgNFhEBpceCNwWfOb6UXKGuI4pTxhDtBp0zHrENWZ01QvD1v
         5QZCim3Llkrzmy609L56Xa8rbjQN8HWC8XWTCRKJBfAf/Z+/u63M993mQWMt57Ssm4mq
         QYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=n3awBflLWeRzXlWd/2jRau0YKc04TlIhQ8bryKwVA7E=;
        fh=/8Vh7ESnNVUx1rQ5x3AovJI8RNLjY4jK7SMiIOhHhcw=;
        b=ehv70RBKsgzr3FpGj8VvG0ybJfDlBkA/SKwljZR8mVDisCinC9QRFKpq6XphKoYitv
         yR2Yk7qDMzutU8rhzlUw12ncqDT5F1HIHiMdbWa8ex410e97FUCkVayV8tyd0U3vd1VJ
         7AUwvt4ATCBUtsrF4S2GeyXMj1Plvf4KGfDGBLH58h+700Ok5KXI4dctHA4IXMx2EcM7
         IRu3NSdsk6bPtlSLaNP6r1MFF/6PwOPGFajzcoXiKdkv8IFwsvkz86a0XMWOguJb7Lyu
         95HVobHZ5M/lQxGsUPVjtyYEXa8PiqD0ge700CVqjhPf5DnpK+kNfl3C3Wa6T0lYci7H
         7muA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="W/lzd9/G";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef17cb6sor127358b3a.4.2025.04.30.23.24.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="W/lzd9/G";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080647; x=1746685447; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3awBflLWeRzXlWd/2jRau0YKc04TlIhQ8bryKwVA7E=;
        b=W/lzd9/GlEzFd9rRiX9idSu3Ua5KZepbdXJ4XBlHoEXj42PKG29UCPbmNsqRyvY5Ry
         LfOtZd3YTqFj87l5OX1MwYoQWNfpmxKWa2ZVilrQ4utGvYhyZC/qOUGIbfauQhlSRBzP
         9bBnE4A0p0YfB+vlyOwd26yfzVqiTktvdT96Sfaj8nCmfdAkRtJiMLHDqkDImGugQvud
         ryN/Ol43H5Jh2gIalAGcMhN/oBStOndS7KzxsRDzcMTkzrncmYAbMUUMgqVy0z3xLM+m
         jufNUH0JeKDDvE6d3NjNsOrC6ETdYti5HVPRBOlIvWjWlaGi/p0jEIoimC74RsIwORYV
         ClAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080647; x=1746685447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3awBflLWeRzXlWd/2jRau0YKc04TlIhQ8bryKwVA7E=;
        b=ulxOsMK8EDEiKChUOPCRZVTp8pGGLj6WBvZjLyx8ZDs349Pz008NugJ110ciJNzlDn
         HVI0f6lpvALZlThuRyH+i/N3+URe1VOTXEmG3yYZb8O9CNq5u6yWs3M7gCsyf/Ctzdof
         sm0jRcBZC6hykkGKEadnpb4jGJVoXKciqmfAfcxfDNXpbvCj/G5hT8R+IgPb+KGKFVPA
         AAgvk4rCxrMFIZLa4zWTfqBtDYyMym0DNbXrWZz6DZAHCvGQ5koFuj8PonMLqNs5/kd7
         bNqpxyOJGxcZf/61sVbOi681FwUPBpJTjGSh+WL+pxE9rH44gq7vJJyJz7FtJ8VA3G+c
         Dcig==
X-Forwarded-Encrypted: i=1; AJvYcCW/WlIxo+AKDPd8NEPzBi1a8onWy/5ynA/h3Y8qJxnHJFxogQPDU519yu4NNHtVoDHOgUyGdRD+Eg+v0Q==@linaro.org
X-Gm-Message-State: AOJu0YzoGJ0gF6Wk4/CLVrGK/6PVWto0olK3MoG/HCUePykge12QiPw8
	vUAim2OseTDhIA9kq9K0hJDzB+MGZ06D+hGBbliqeR8re7Mta9IRGHfD4EsV48XBlg==
X-Gm-Gg: ASbGncutJGKWiquME5Gkc6kVZlxomHgeaDr9yRKABvKSULB/UqRGe2a0OmHf/PmYpT3
	kzpF2P/DBsskp7poIpQl7dz6ivxUITm25peBXut5P/i3eyMv7VxDXRe/0/ZE9whTkyXHUFzKcay
	W2b5nngQJEm5vQ4E0BoFdx4C/jl/fEikmRbKsuSnC3neH73Ypt7cmOUwfGtSO9wuJIJzus8AguL
	sXFqOWahV+6Q1lr7tHqkFoF7xQf0wpRpyczthIhnhqV9rhxXagMaEwlKN1Vin95PFoqZ1owODGl
	D44r1T9jSE9BB4HfyIj9c0R68+aMcsjTKqAlfOSU+Cx4XRc/34E=
X-Google-Smtp-Source: AGHT+IGLOrXCRIOSVKYP4HGNXvk8Ab3WdRzAEazOrAXRXDNVWIYa9AFM0erziA9SQXy87Xjc5f+HbA==
X-Received: by 2002:a05:6a00:1411:b0:73e:235a:1fca with SMTP id d2e1a72fcca58-7403a82daf8mr8471635b3a.20.1746080646727;
        Wed, 30 Apr 2025 23:24:06 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:06 -0700 (PDT)
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
Subject: [PATCH v3 17/33] target/arm/debug_helper: remove target_ulong
Date: Wed, 30 Apr 2025 23:23:28 -0700
Message-ID: <20250501062344.2526061-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 648NXblJQvO1

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
