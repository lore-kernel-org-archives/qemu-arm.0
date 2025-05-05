Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2779790njj;
        Mon, 5 May 2025 16:24:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOVPdgTWEi56SdeSIBQrupYjX6BJ9LG3aRROMqAkWXmiDDoJti6v7d0IlYlomJ0NOFdFRcmGyiHUlTKg==@linaro.org
X-Received: by 2002:a17:90b:1dc7:b0:2ff:52e1:c49f with SMTP id 98e67ed59e1d1-30a7c0c8b80mr1509316a91.26.1746487453801;
        Mon, 05 May 2025 16:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487453; cv=none;
        d=google.com; s=arc-20240605;
        b=DEkYi7FvcJvn6aczqc0iTOGLMidK87YqC2D7d6EhXClm5+AyZvr8vVst0nVpd4kS1K
         3ysxHrTUGz3Gd4XmmEK52HdbeoNNiV01R/sVXjvDiBPzaCOavfstMcSoI2huP+cDljj/
         FGPnRC7lOwac9CQKo48f4ELcPX13n/kt0RJcbgB7Hhb+Y+nfei/yt4nqJuolDA6zBc9S
         buNAPsk1ebaXsqgQXlI+k2CneBFFtGnF6n9J69WrX6cU2+HSoHMI0MMdPFS6uCjzZagh
         4qhJjfE0PdZqccnSQddgJ/DQEMqFw3nVnzRgSCFXnPTzxRLhngoJVwNhvZYCz1DjRMyB
         O6mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tCOIjYNw0nrrfgNh5tW9ScxZaAXWwfrCxDZEIXL0aSo=;
        fh=shUiDSR+GdNjmuhk7yWdNllWduGyIZtxVVSgfxRkEQc=;
        b=DhxVLw7erIAv8pLrLz3ducdZ8k6cTnLvk/5lsgpWTFNbnXFW4BGmPibwsyTzo3EwFk
         XuOC3pmDykytYfaUGSpS4SkrOJllYV7P8EBkKcX2b5IrpbI2IAlBGtgNmSqOKh/HtCkW
         aUO5CHWTgGmNop9ZdorbERB5diF5YrbwPiAJFZbCvNsyIf0mp4cNEfXn50xwJ7yjd09/
         Y9qAveLUx9en9xLu0iNcMq3WQNhOelScLSVSHCm1gKOJui0F++W3wSSinPsc7E9ukDBL
         51TrWFVbsr5oX1DmQlRTuylO9rWGCr0myxUZSxiopATa67vJbgpFAn+Vftf7D6k41XAX
         t+Gg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CqBJCSDn;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb29167sor71611215ad.7.2025.05.05.16.24.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:24:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CqBJCSDn;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487453; x=1747092253; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCOIjYNw0nrrfgNh5tW9ScxZaAXWwfrCxDZEIXL0aSo=;
        b=CqBJCSDnkTdoxZ+11BeXZbzx3YWBDsdAIukwS2HPY2IhCL4WnX4EOG8WspJrCLL1ht
         nQqW/T5Y7WGzwCIqYFVTrWepw00/9LMGGIAiN5v78hiIodCUnJzG7AWwqm84Po5KyaBY
         0H6JYbuxNxFSHP8t7PHsLD6wjYvbsXkAdBGd0ssKj1uS1vARPTFFPRG1zjdnyGpio1TS
         JfTrUEDoSvu51DnyztjHTFMyUvcUe7rW129h95l6hFtOg9LftvodQBRCniBD9D1I4ian
         ZJf565GqdNJcSjK1OvinY4sjmRl+gTRAb2+xpVYnR3jByqHYXCSgcRFiQglHITOaXsQJ
         HH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487453; x=1747092253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCOIjYNw0nrrfgNh5tW9ScxZaAXWwfrCxDZEIXL0aSo=;
        b=e7lGl7TFjJKAhg80mOdthWW/Ff09Z5AVpOxEwnzfZYNRBif2dQWkkqaXPP4hlIMoXP
         Wtc7TvSkcbxBfkmkzJZJWwpUkArNUq0Zr/4cJqf+oKF2GKIAIF4yh8IZO2z0ctSms1iJ
         NDnVHnUz+Px/hXmLa1CVF5NzmNpYKcH9ZxgzDKqTj8C9DzPn5q5u7hGq/SGElfE1/c8/
         q6nSDfOm4Rs2dJ+uX1gLBXJXt+X745navTirnSdbtLhYAbZQkAtaDfnAnlSCVhX3xLtn
         mEaPrvEDPKY3a50LCLs33ap3QdDX4wVw4n0botuxp9oGQt2zmRiCQNagkWQr57+Brc73
         p/Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUFYN6r9hdxfhfGW+/xtLPn5MK0MDpm8N4XGlpg8Eh3+sU8V0kq33SqHdwW5fqsppIxsqPesE4zCe/7zA==@linaro.org
X-Gm-Message-State: AOJu0YwDaR8Dflx/ZeI4TLOBjbs70uJEH1wXlzcEyjcT+0lN1gP6XT80
	xfEICqyHJGk7OzvUk+7bcSxaSx0acLqM4OQ6Uc2qkO1SIyh4q95jgTZBFwwcn4SlmOUdxfFfz04
	Kzbzydg==
X-Gm-Gg: ASbGncuXe5ekdUblo5J+Xwi1JASnhoqtLygAcwKowhgyV2R4bXaFtjMwBd7n0k95ivh
	WKZVuctI6IYk4s/+RwSDoP8Z7qug1cu8f8+Mf6AWZbBreLc0tB50/dVF9mOBCPkyjvfFWMvmlOi
	ZJ2PIq5r1m/kshnkMcinjPUfmlCkagfrTEVTMHWI1MMQoUkETH4JFmiko/K0E9CkcTl1wx+Zuwf
	jSeUWe4u5ySYNgNxKQJWFKaHBXuT4CovB1K+ObS4Wzrw3t+GIJLaZQZCt0OC0CPAtt9eIci93nf
	i4zoLHMUoWD/Iy4r1PATOq8/BxCqlot/nr5UILpPWP/jIcOrz/A=
X-Google-Smtp-Source: AGHT+IFjxaZn4mAfiKBNjulls3ChlwCP6Nku+tbKpjjt1EV7oV6tV5Sau1TaU3st3hFyaMq+a/8qAA==
X-Received: by 2002:a17:903:32c9:b0:224:5a8:ba29 with SMTP id d9443c01a7336-22e33012cf3mr16530595ad.43.1746487453415;
        Mon, 05 May 2025 16:24:13 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e16348edasm58705265ad.28.2025.05.05.16.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:24:13 -0700 (PDT)
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
Subject: [PATCH v6 46/50] target/arm/tcg/tlb_helper: compile file twice (system, user)
Date: Mon,  5 May 2025 16:20:11 -0700
Message-ID: <20250505232015.130990-47-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0KN2ukRJKGYs

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/tlb_helper.c | 3 ++-
 target/arm/tcg/meson.build  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 4e3e96a2af0..feaa6025fc6 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -10,8 +10,9 @@
 #include "internals.h"
 #include "cpu-features.h"
 #include "exec/exec-all.h"
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
