Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp95677njb;
        Wed, 7 May 2025 16:46:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXe7q8/vVzTxdQsxln1L6c/YWHIygg2eAbYcIgxSNfcSsu0c+qSmSCCWzPNtS8kZuWOuAzN/jOHh8PNfQ==@linaro.org
X-Received: by 2002:a17:903:166e:b0:223:52fc:a15a with SMTP id d9443c01a7336-22e8dc8f56emr15679995ad.33.1746661616521;
        Wed, 07 May 2025 16:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661616; cv=none;
        d=google.com; s=arc-20240605;
        b=aYMls6WfxYK8IN9QSveBS+XP8kvl2FvT8pqUtvOf8Tlv83xr4fOOJJV3t+qFcldDRw
         LxXFOtquy7i2g5lgxCINcbwymqdvWgbqW3ef9pt8M3q/Gv7iXZQPHdif5L4731ul+PrQ
         DuR70WSesG7SoCcXZ3BQQ3XSuE5KCKx5j/o2JpYs83tLxqCiBPWH30aEfLDYqkCKiXN6
         OnvKbxiS/IojU8zKzhNbre9f+XpD1mJaYQiE1OlT2WKLyAb2rJicMUgn7lEeFnkqPeY4
         dtrNVVj+L5BHIDhA3Sbu3WlLSk9IhiyzEdpT1OeDijzXVX6nGd5CIi54Vf1buwVJSBYj
         sUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XN9bpcu/hK+eTVDHriw8+8GBLuzv6l51ao11Y0jPFbk=;
        fh=5IUIo9tp/dRSrtu1GLyNvnjEe6/5gEhHljTUJ2aW2Qs=;
        b=Xj4AYEC0tysMUJWOgM5x+gnWuimb/SOTM2bj+3DR+dfcF9w4NEwyF2k2SV0dtotJ9g
         3EKgO3LTqjpRR93r8HRPkopD3yGjsDYPCRgK7SpPZGKJ8nWUioSfFUdcKksGog1Hmtyv
         h/v+x9BbEHHB30Oyz5flQAezsG6imrDl+pDTSVme4jCVzlQ89cP7i6ysEuZLU0tvhgOb
         ZnFAcNJM/I1SJxOL73SlEtlGsELfJ9K4qoN5rkV2w1BtqTyEFMD4UiFYkHFtKvq1dy5b
         BwGCDIAZbmytdX4NXhlyAKRvwqeq+kab0jG3lSbk+FshEyE8eeygDQHHFMtHwUyRCtsh
         LudQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xh2mIw0P;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e61dfcb20sor24535785ad.10.2025.05.07.16.46.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:46:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xh2mIw0P;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661616; x=1747266416; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XN9bpcu/hK+eTVDHriw8+8GBLuzv6l51ao11Y0jPFbk=;
        b=xh2mIw0Pt8PHnXtCqMnRlC1mE2YMmg9zcBKKkyy1LHjV5WsNCWBdVakGHkoy1viuVA
         cg7Peom2HVdA0qskelZKtAR1OZ1/PvqOch7A1G5o+Li/kZpOFAM26aKI9KZzZoVrsUH0
         8+D9gOqeINHCXS9WdyvxX0G7AZNx1DAR9Lgpbvd8TEj0moLeukbg1ohUbrpPrgAYYLja
         G+9kCcTBTpwudfb1n3QGoOFU2iB7QSCECQaJHS6a3R+ZEe1c+FuA9HycyVW+Cs6WAlRP
         ijCnZBs2ZeuwWbSu45NjqKunBUkcU83NhkvMWoCL32E/R36alvxZX6AZNhH5vKMeKsWS
         EAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661616; x=1747266416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XN9bpcu/hK+eTVDHriw8+8GBLuzv6l51ao11Y0jPFbk=;
        b=jzbRsA3YnsKIW6DdYR/8lcSwlgAG/A57VAXQkPdt724PhfHhdg8JgygmL4oP96vRdx
         U97gjz2xQRd3e6U8VYCZwPfTOkfyFBiPNcAxOW0lEO/lx9B1nOQcNP/YxdNpukzHgonz
         eZDkYFuNlixh63G3/Ms2p/x9m+kghTT6h1HHfzjvM0+JySsY/VdibGEv1AGmzD0btwKy
         +yJsS6r939zcBPHkb1q0rmTxVQVomI5JhTjgUjHM1VrrLud7gamDiDcqrWIOUgUlYQJn
         vDZH+JyE2sUVR6kX35pAoydIxylkO/hEfh80a+2VyWpxAEstCDbi55FiRFlrrJ8cDqKG
         Tdwg==
X-Forwarded-Encrypted: i=1; AJvYcCV5duksEc3qNYX9+tbc7Aa905fIvGcV9YHEj7nuy8+Brc1mZKKqRNkTjd/ykfISl5RelvZm7bz3uMRkuA==@linaro.org
X-Gm-Message-State: AOJu0YxxjAAEWLS9N1vZMxXAdsyyYAg8zNKudtRvz4/RxW/WJL7iF5vs
	+pN8hjulNZ7izJwEiRkM5rPz6XO0CqrTFedpxVVkmVp6p5ingQ6+JXe84YxOBR6Fag==
X-Gm-Gg: ASbGncv5RuMU+4pjeIEriGHVvc9slm/QeJzJCR4MI9/ZcfrGCfHdEKiA5pq0NhNa+qo
	7u/2ZWk7etWcPguVC3P+pFOWwj+1RfWHngj05va8QiWEyxRNjna86C9Y9b45iuiRlU8VJo40bi1
	fZxotJgFUZzCo8gKYgdO+94sq65yq2+tC3XEKQ/b8IhgSxVkqFgvoOxIg2mEQWAFC0ZdvTo5GqY
	uUW9Tk245InBPXFDqsosPYs+gWZ9tWrRPnhCrBFUWTu+dTO6s8PAMXRE71br0ZkuXNChQ0Edx9M
	PQEfnj1z+afYgTvmbPdSueIxsiZEYlGYzOvaS7KSaS1zFEViUZA=
X-Google-Smtp-Source: AGHT+IFW315Q4I5LNTZ0KdNHko2uJjnjJeUb0CDoTdZF1UBuRUefk3FToK74LCS1f+jcPOOcm+QMCw==
X-Received: by 2002:a17:902:e80e:b0:22e:5a10:fc38 with SMTP id d9443c01a7336-22e8d7c843bmr19512495ad.41.1746661616140;
        Wed, 07 May 2025 16:46:56 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm100792435ad.62.2025.05.07.16.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:46:55 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 45/49] target/arm/tcg/tlb_helper: compile file twice (system, user)
Date: Wed,  7 May 2025 16:42:36 -0700
Message-ID: <20250507234241.957746-46-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: anlLWZCWHLWG

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/tlb_helper.c | 3 ++-
 target/arm/tcg/meson.build  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index d9e6c827d43..23c72a99f5c 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -9,8 +9,9 @@
 #include "cpu.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "exec/helper-proto.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
 
 /*
  * Returns true if the stage 1 translation regime is using LPAE format page
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index af786196d2f..49c8f4390a1 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -33,7 +33,6 @@ arm_ss.add(files(
   'm_helper.c',
   'mve_helper.c',
   'op_helper.c',
-  'tlb_helper.c',
   'vec_helper.c',
   'tlb-insns.c',
   'arith_helper.c',
@@ -68,9 +67,11 @@ arm_common_system_ss.add(files(
   'hflags.c',
   'iwmmxt_helper.c',
   'neon_helper.c',
+  'tlb_helper.c',
 ))
 arm_user_ss.add(files(
   'hflags.c',
   'iwmmxt_helper.c',
   'neon_helper.c',
+  'tlb_helper.c',
 ))
-- 
2.47.2
