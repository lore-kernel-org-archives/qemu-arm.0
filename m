Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp42063njc;
        Thu, 10 Apr 2025 14:00:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGnwcpFv0nUQCTWimF992wFN0nim56hiLtOekjFhir93tiV2X4J+XM8tKoTwWvVEP2rfXAVZug3GpIDg==@linaro.org
X-Received: by 2002:a05:6a00:ac2:b0:736:39d4:ccf6 with SMTP id d2e1a72fcca58-73bd11e6d4amr442928b3a.8.1744318837672;
        Thu, 10 Apr 2025 14:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744318837; cv=none;
        d=google.com; s=arc-20240605;
        b=HdixeBlGjq/pzDihNy4D/wBvClZjdrD9rtvJhN/rd4fVkWNR2fbS6PQtvEtJHYSaZ5
         56+2UqHAPIbPJVk/8ARJOMBKIUY6cXW4Ow0ayPBdC/6MBLn6Hs1Ej6WV3OqULH3PwFOs
         aGdMCeTw510qLTjiL5kVgRaLQzQp6ngRoMjrq8OprCA/t6TYOMHzY263lTvzHZp5lj1i
         Hjtz2d1A4n9b+XgRpGlKHDC99NkVuhmwE9e3pUIF88dhIRaODlfhYyHgfW9Yp1KQ1FxE
         QUtY+yAtsUCrWJgRUGdXhAjnuniqwk5LCSSZTwMruzAVRs3GZSuGgMExGnhQTZm1wu7H
         Im8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qQocORlIWShowiqK86UH/3i1rW1ojRKl4ZKvCvKtX1c=;
        fh=d1O0BoK4RONOJ2haRBvZCruH1RcyUF1RGW/U0Sqy9to=;
        b=W6ET2lTWCwzQHnnwBA+XQhf8tkYWTuO+3o/YF1cR/zvL+YBKgwKCe2qJyVwDnrKBr5
         XGrn9rC0qwjmyOoYKGmPpAjR0xHqtWj+PW0Kn1bDaNp0rjP1zVK+qv1PN4xy7/mr16Lj
         k7+ZcTvyLRfjE72NbS46QKgleuFb5SUOHdjD5oRnYWND2fccYSsdR+9y/t9RSv0xJjIp
         O79b2bpkb4NuZC/EeiZBOpI6dSi9RczR7UyOw1kg9Wq7NlaRKN/wbSBjG8IjSiclJUmX
         0SZgZ1K3LozRtcvDxkrRoNtWZeq+xVYVuMmIREd/HKcDIbWjttn/YDXa9t6RYcqAVQZ1
         BEzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O7nFvinj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bb1d44b03sor2604449b3a.2.2025.04.10.14.00.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Apr 2025 14:00:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O7nFvinj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744318837; x=1744923637; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQocORlIWShowiqK86UH/3i1rW1ojRKl4ZKvCvKtX1c=;
        b=O7nFvinjT+Qxlhi0TJTzcIObsrrnEnFirb9F+iBYDgr5R4j7ozSelfjxgB2u3NGosP
         +U8/gBH5z1sWCKG72QPNGQrE0Tvkeev1rGL1MwGY6kLxtDljIXwuE8YghJtj50nkgcQl
         7VpjcUYF8EyMO6UY+k8OeKPfNEb4eUzsj0djBzsPgeBBYuL4qQSSQfeh+9yaxigwcgaw
         OAq+6opEiFReSbs5JtwL8hv4KI38VWCnXavsVagYzvPWLWu0bJslSbbFGgCZYsmYhxXy
         qPbfrSwV2gC18zHWGsBUky/y2Quaasy8Nx543wRj5LoxJf7M6mD3enRjteb6xc2fG90Y
         Pg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744318837; x=1744923637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQocORlIWShowiqK86UH/3i1rW1ojRKl4ZKvCvKtX1c=;
        b=j/MdqdTR7CdSyy6Az5/yJcNtfH53YdqdqCRe9CLoC941rUJ2qNRRi2MBACjXjLeJ+a
         CIIOKjdbAGe6dZsK9BdVEcXfAuC7QWlFJRZXVwvriue41A2QnkS21fhtG2uU6OzGdCv8
         HIqgb4o66uUFMzgm5p41j6EEgZ/rtckKfELeh3ShWNzAxppUClxZ7l2rAEFz4Ef+o7vL
         oPQOvi/T7YKPr1PtkhMWrX97R8PtbsUa9ddo8A4uyYxwxvjGT/u7BqF+WPSCipwCBLJJ
         j7fxNi00KhFJZt+Xh/74t2mUxHn62g+kWDVCVUselBTGrclw2r4G2xwY3SPlX7mgJg2O
         XaPw==
X-Forwarded-Encrypted: i=1; AJvYcCW3FGJbNkTE9oztpCVSiERe8pJmm2xR425jRsTB5DJ5SRzQud8iTlRIU1q7PYTjPfaT3dNZxAZEY8LtVA==@linaro.org
X-Gm-Message-State: AOJu0YzlXwkweR785D/RmMWCSvk1yVekOkgkB2WONMsUSRoPX7m8lc/2
	9ae4dXsEM0MkG0bOc+A8+R605h2y+rv6BZgmkR58360WnTHzR9rIO1QyMLcx98mN6g==
X-Gm-Gg: ASbGncvBtsW1ftnApKxUjicLDYtlwMjzDkT9yKwPxCr2UrDhkvsyUH0jAkiA2P7+UJZ
	4IsJ2eZNy1r4SBo28T9Lrdbow+6VMdrRVNnd0o8q1TZOc3qj7dp9uMuNLHVrBO6y1xq7yzcnavA
	u2Mw1cUzPUtDgm1Im6tZc3vS6YLWo+t2wzPyE4JBmctKUlyF3A2sZ2ttHpWZX0Ye8LPz+/rH2zp
	oHI0Mw2Nne52ohjGS4Mb9VFTsENuxO+GFU9Xa9e2d8TjoKpBwyPHy1oE5H/G30VT8qZcz2++86F
	slTsDMVcMuBIGAhFUhfdDWBzRuqumukxd+6fjeS/Xh3pRE1aRg8=
X-Google-Smtp-Source: AGHT+IGzeww3U8kOE0MMW031fRG2ZvP0muFJ3dukUFGeGEgW/yFFEZB8SP3ucUih1wFJ97p4lnaXDg==
X-Received: by 2002:a05:6a00:179e:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-73bd11e7135mr381290b3a.6.1744318837234;
        Thu, 10 Apr 2025 14:00:37 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f82a3sm12431b3a.90.2025.04.10.14.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 14:00:36 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	philmd@linaro.org,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	Yannis Bolliger <yannis.bolliger@protonmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 2/4] target/arm/ptw: get current security_space for current mmu_idx
Date: Thu, 10 Apr 2025 14:00:20 -0700
Message-Id: <20250410210022.809905-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410210022.809905-1-pierrick.bouvier@linaro.org>
References: <20250410210022.809905-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: DllVXvaibQVo

It should be equivalent to previous code.
Allow to call common function to get a page address later.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5e196cfa955..754ef0d3a25 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3635,7 +3635,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
-    ARMSecuritySpace ss = arm_security_space(env);
+    ARMSecuritySpace ss = arm_mmu_idx_to_security_space(env, mmu_idx);
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
         .in_space = ss,
-- 
2.39.5
