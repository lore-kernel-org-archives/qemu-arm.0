Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp45190njb;
        Mon, 12 May 2025 11:09:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDYvXsKHI+K7jkqu2nRSjxRZRpBrw9Bh1PWwtVFMHhWgdYBJV73f4PuR9aOfJ38uC+wvmCGMQMxNgS/A==@linaro.org
X-Received: by 2002:a05:6a21:9185:b0:1f5:717b:46dc with SMTP id adf61e73a8af0-215abc2d087mr22246560637.27.1747073339897;
        Mon, 12 May 2025 11:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073339; cv=none;
        d=google.com; s=arc-20240605;
        b=A5Puy+ksM8vZVlhz5OdYt9fJYn8T8BRHQADqMb5J0Kk3SyHt6G2QL79kv4CBDnizqo
         PW6Ne7/oqNHoqsr7tc5MzJcf/eVkiWGt/NbynaKMeQ6ZVIWWIZd4u5tkZfO8/kK+weLP
         ngYOep6X6aS1c8Zq7E6VNQOfms9Xks/FnUXLt3KWvBGrJ0lugYsRbwQp+iLET0WGfCfS
         iWnme3PZY7cWf0Wtu2F1YRRYaJziWsE1tPGKjsGAkQRDUN1e2fzzRjNpuAB6ZICdzQax
         BEG9NlHUpYyHQf1dyjRfi7FbMd/giyUnaY2jESeqDm1IicY+nIN0F/S7XueIBVkclLAg
         fNHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=h9+0A2smB/xfpAp/1FKWxfsvzCeqir2otJn6Vwgzfpo=;
        fh=SnuHmY5Ye11xSbrz6/i58K7ZQHWJvd2L8dQ/9Tm+KUo=;
        b=Z45aUzNSzNYNi7oyRd5wLbjNJTmBDEW1yzU0tyDIib1I+8Gp8sCmRoDXv5W9nOlgWP
         2jNhFQ/T/DbJX3/dt1/dPZKL+CpyryPCL7a0P9Reo0p1p+G/uvaPG5k8NhQ9yIvf0wrN
         lLoRT44T3QMNSzbnDg3KxkB2D5q4DvHdit83qFJ1r1ApYsO8dqPfN5ACdmdW4ts2pD0I
         SiUEy8KQrg9f0R0r9XlkM4JUmQDu7WUWppt3EYyqFLHAWmBlalNL+Dz2KhXUxVZ8da6g
         XPf2CVEeSBX1r7n26GShD21vDGKo/Sey5AsCr0w9Zd+XIXApgfruGtgyaRosvcIq28x2
         06QQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JWKKG0a5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-74237babb03sor6306219b3a.7.2025.05.12.11.08.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:08:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JWKKG0a5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073339; x=1747678139; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9+0A2smB/xfpAp/1FKWxfsvzCeqir2otJn6Vwgzfpo=;
        b=JWKKG0a5mKaT47puKMPE7mx2jZ7Ii5NGEZZpjGtg7yziL8crrsmCeAHQrYJ0KvbjGk
         n2u4Lz9XSYyjaEpCPap9h2MIZnD3WT4UZ7cq1jo0lDvgGxgr1LhpTO+fxLhN0OVnv0Gx
         j8irHOwgH/SPAzj4Oh+eLdNkd9DTN+/ixIRMSJBuuMFjIfo4NonQLz/PwK5PwR9GJuom
         qPc8fYA+bvCwU/vOZabOAvr2JSmpGCz8LOKfLRk7jge+FVQPoyLgKy6yTf9UJB/5d5/s
         4DgOy5bMZOkaed3xBPWlFESNCjzhUcWpJVeKTF/FtpgxGPFJH3uK92AnuOyZhgVAQCgv
         cunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073339; x=1747678139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9+0A2smB/xfpAp/1FKWxfsvzCeqir2otJn6Vwgzfpo=;
        b=e6zV7VIxg+yOsliFoWTfxTLEn8tuvWFSm4EUTGThlvNMVEn+e9ZzeCon3/BX7epGrq
         4wBW0hj1MD+nowWrqjWFTtcD56IJr6+Aeyd+NheN6yxD+yxuIwiDOwTblx7HeHdblSHF
         RmkeqeRdmEuOwo5kQr/d6K7k+OYS8W6ezGywqO0grS1eN4Dvp1doq1LDG6Pv4gvsgu3G
         j5fFLAFWahgXCje+/vAiqQ97AdZxqAja68LDN0B1XWPxjyYnpHRUt9zu/sqZwJtd1YMn
         xY/2ZK/REUnQwPk0ggJR8Q4vAgEXuvnYFc1TIbLx7dD1mETyVwl9dSna4Gz+rv3916JC
         PQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt6o8sh3SL1SxzEI0a11BULWmFvaPd267jC9/eyD/H3dFUrRaa5TM7yu9XjzxAA7UnFFqlgrho5QPmzg==@linaro.org
X-Gm-Message-State: AOJu0Ywqy2pFoANVCGADBYmGYscE+oyVnkq/9riTMgUXP3MNV6g5vCfO
	Cj5rQ1kpU4jWJbCyS29taWCARdYT6z7R8O9UNvaXRBDT5bzg3rw6wH69tfuYqHb60g==
X-Gm-Gg: ASbGncsq0WuWQjSr/iUFKReCJbU1LkOpp7EWK+EVcpIapgG42+BAT8kYDzDGd4Ic2TJ
	YiUp3QSl+VnCHdqXP3/+mdlqyyqE/TJ4n8i92lLXw2ZA8SY1sYLojQrIK6qPxdzWFzxodj7CTQw
	K9ARNNR7kxGT4grAdxe/q0p9XRouPSrDx9UR7VNsG3jwsNWtwRdGmjFfwOu0sbSgbO70NWalQEl
	324xgPU1B+5NvDsREgJXEabUjElH9Ts7GMqXM6a7veN5kqdfW5QFjCz2Lk7oB56ESt/UQMUUKIZ
	t23ypIyMg5AbW4MtcwwtRnM7OJFLaFjYeoWKmDYjSt1TIZMUQm8=
X-Google-Smtp-Source: AGHT+IFMxEYVPluGpO+aZ38G/jrGs/8RtCSp1027p4RYYJ/IZhfE7V8sbgUcy7m6CYbsJgYkfmCkQw==
X-Received: by 2002:a05:6a00:997:b0:73e:b65:bc47 with SMTP id d2e1a72fcca58-7423bfe4cf7mr18237636b3a.17.1747073339256;
        Mon, 12 May 2025 11:08:59 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237705499sm6438580b3a.33.2025.05.12.11.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:08:58 -0700 (PDT)
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
Subject: [PATCH v8 48/48] target/arm/tcg/vfp_helper: compile file twice (system, user)
Date: Mon, 12 May 2025 11:05:02 -0700
Message-ID: <20250512180502.2395029-49-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: kjhfWG57Ml/5

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/vfp_helper.c | 4 +++-
 target/arm/tcg/meson.build  | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/vfp_helper.c b/target/arm/tcg/vfp_helper.c
index b32e2f4e27c..b1324c5c0a6 100644
--- a/target/arm/tcg/vfp_helper.c
+++ b/target/arm/tcg/vfp_helper.c
@@ -19,12 +19,14 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/helper-proto.h"
 #include "internals.h"
 #include "cpu-features.h"
 #include "fpu/softfloat.h"
 #include "qemu/log.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 /*
  * Set the float_status behaviour to match the Arm defaults:
  *  * tininess-before-rounding
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 7502c5cded6..2d1502ba882 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -34,7 +34,6 @@ arm_ss.add(files(
   'mve_helper.c',
   'op_helper.c',
   'vec_helper.c',
-  'vfp_helper.c',
 ))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
@@ -68,10 +67,12 @@ arm_common_system_ss.add(files(
   'neon_helper.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'vfp_helper.c',
 ))
 arm_user_ss.add(files(
   'hflags.c',
   'iwmmxt_helper.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'vfp_helper.c',
 ))
-- 
2.47.2
