Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2179877njj;
        Sun, 4 May 2025 18:56:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlzgp8vEeNmfC0MNhIF7mTiaTE7P5tTBT6IzdZW0nndTZsQ6MEiupQhZ8kpPtx9MXJAwWMrk8pwPiBTA==@linaro.org
X-Received: by 2002:a05:6a21:158e:b0:1f3:345e:4054 with SMTP id adf61e73a8af0-20e0680ce67mr10342743637.14.1746410187273;
        Sun, 04 May 2025 18:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746410187; cv=none;
        d=google.com; s=arc-20240605;
        b=Ey9c3rjJYQ1hGiuuVB9wVB0q7GWX1XeVF0j6fRYcn2kjnFoDFKnkrolUEaPSho43ME
         fc9Fj1qlgo2reaF0EHgMn7jmHwqn4p8Zg60h+IqsKxsQSL89fDjETw6GkLYrJ/R54cxu
         RNZKNMMOfF2zP4eZkMud2wN2urI9rrrOy0iu5uxpkrW6Q0ZJnNEdcm1Sp7rPPrCA3ssP
         SoVBzQ9LA8vNRWfJyNpfIMTLiHM1xJuLEb5iUL8z9rC0SO4UqOO1LtdEBO75ad6gztc3
         bOVMVjqUvZA9nB41g1KnowVxDeftWjdJrsRfvDw6u/OJXSg5lqadN24XertjarqbSB81
         ulDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZO3KsYydwb/hhf/3jAlul68iv5kVCsUNHbrEnCVSccQ=;
        fh=A/VeNPAsiIkvCrbT6arsiy4FgsaZB5V3bDv1KSPhrtU=;
        b=ka+tK7D7SJUq4CcVZwReMRNtEYganvl+ZJeRF1Kyl76i42VFtIEI+ELqbrJaB5uzmI
         wc6DhRsB3MyUjVJa55sdVvEbxXEweWtkM9z/XE3ZT4CpzrxNYBGee25wMHzEvMpXq6Al
         E9+EN84lllCCBJGBV7LVT9yYfa0fusELLIU2LVDRywvr7ejGGMuPP31jBoPLiveUNAnA
         a6FSOR162AcaHHN31T+vD9vdNCj1eWrr5axNca7bbWLfmPhMtl1ugAs1uWq44XW5PYwD
         9Xpg7mGmPZaOsaMjCqUwEavMeidaW4BbUsaY9GkTnsDJgjO30IwOrJNOAoLd1fF6zKbR
         p8Fw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CpVqlFGc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa10892sor3512618b3a.10.2025.05.04.18.56.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:56:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CpVqlFGc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746410187; x=1747014987; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZO3KsYydwb/hhf/3jAlul68iv5kVCsUNHbrEnCVSccQ=;
        b=CpVqlFGcwjgarwX7D9NGmz6mFdoBuIir7J8PQHmxrGIlixcyKYtME9AxsZ+JG7Qkoc
         nwSn08KV0ZUIiyNpIz28wqIivy0mY90aGlAKxyWQw/GGXLebuOcnkuKNpU+EINhP2IkY
         hwXP/Fv6APDdHrfwFtXHM1ciR8AlsoynYeWxHgiGQ+FUS6UG62Bd7l8vCWd5/kcAeYUI
         cPa91k8u2WeeJ6/1Y7UAOpK/GYJDJc2MGqqkbAiujUNL3Wy2PZcqZKpxd0yXDJlBznG+
         VfpyZdureZhDaiEvJU+91JIpPGta9f+A8BkQdhrm4n0toA6HEvJ/nNA1iKmsDJWBVoLA
         TzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746410187; x=1747014987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZO3KsYydwb/hhf/3jAlul68iv5kVCsUNHbrEnCVSccQ=;
        b=lrrPjGk/7YETq0U4WXmQ/3FL75612EDjHyGrlXVylLz2nZHsvSMntYg0A3PZA7KMvG
         36o4pEMhopxWYa41NYRwLe4bZ6iTWnR/ROKOaxP+szUVaQPoV3rx/0GKw7g60bxu6vs2
         XCuoNEco56KpfXCdeijTMNMY8KEIkFgtjUsiQxq5PKNTVkrEVZnRp6bvt9nDyb3cuUtB
         EXrNSp27Wi2mrQ4zwb9yr7ML1hf/WW5d0GSHH26nxxlH4NuQbAmm6G1/bJ7mHKH6mKFP
         ABLFy+/UpWgiEpelk5aM39mzWz8dKUYluTS4zZSPQYbxGydcTzt15/pyggXB87Mskq3k
         kqdw==
X-Forwarded-Encrypted: i=1; AJvYcCVPFM8WoMBfBTjtJKQjIt6KpMZojlkrB6yUcq0PkaRxsqiSg+HEVtl4kau7RoJ323PpBCGsG03/3CbFCA==@linaro.org
X-Gm-Message-State: AOJu0Yx9HFOfhJIigmRN7N34TLTdj52Zvc+5RozvyTmQcJyPYhHoj8Sl
	RQdlk0eknznk8T15SC/DC6WXA9C2cQtnMhLTY6G+hyzaR+fDynZOZJMvZgM5N184Xw==
X-Gm-Gg: ASbGncuR0g1SDC19n31MdQDKdK2tKPHbn1wmVGzcsCNGJO5eICJt1VGXij3UItdIgCQ
	tQljiT0u3TVcyXs4IKtavMKIu1N50RkoczmNlJxqTRui9YnMVn40dEjtoi/U0EHFF7x6MNeVpks
	fPW6CRZzHJr7q5lJXDRg5ye5lOQEzu1/GqzSWQDIQ2ZZp0NuSs9dJ4m+8l+lJSmNuj+qx4BBqEW
	2oaZrl7TLufwx8pwZI7JH+4sYkZonaZD7oJYoajQP0SOqURSYgNzuiaX1EqnmdYRNLEqFICJ0kq
	mhiWXVfGyg8y0Eq1bgqfZzcdBpLomapo1q0TKh+Z
X-Google-Smtp-Source: AGHT+IH175QUPJQzYav/+wT4s9mklMwFf3mSzJzmCFtDGR27Aua7f548KaJOC+1dQss+Y/arG83hIg==
X-Received: by 2002:a17:90b:2dc7:b0:303:75a7:26a4 with SMTP id 98e67ed59e1d1-30a5adf923dmr11588398a91.7.1746410186889;
        Sun, 04 May 2025 18:56:26 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47640279sm7516495a91.44.2025.05.04.18.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:56:26 -0700 (PDT)
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
Subject: [PATCH v5 43/48] target/arm/tcg/iwmmxt_helper: compile file twice (system, user)
Date: Sun,  4 May 2025 18:52:18 -0700
Message-ID: <20250505015223.3895275-44-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vXiF6lYscfY/

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/iwmmxt_helper.c | 4 +++-
 target/arm/tcg/meson.build     | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/iwmmxt_helper.c b/target/arm/tcg/iwmmxt_helper.c
index 610b1b2103e..ba054b6b4db 100644
--- a/target/arm/tcg/iwmmxt_helper.c
+++ b/target/arm/tcg/iwmmxt_helper.c
@@ -22,7 +22,9 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
-#include "exec/helper-proto.h"
+
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
 
 /* iwMMXt macros extracted from GNU gdb.  */
 
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 8623152a645..3482921ccf0 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -30,7 +30,6 @@ arm_ss.add(files(
   'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
-  'iwmmxt_helper.c',
   'm_helper.c',
   'mve_helper.c',
   'neon_helper.c',
@@ -65,8 +64,10 @@ arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
 arm_common_system_ss.add(files(
   'crypto_helper.c',
   'hflags.c',
+  'iwmmxt_helper.c',
 ))
 arm_user_ss.add(files(
   'crypto_helper.c',
   'hflags.c',
+  'iwmmxt_helper.c',
 ))
-- 
2.47.2
