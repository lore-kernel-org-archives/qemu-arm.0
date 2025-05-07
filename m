Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp95696njb;
        Wed, 7 May 2025 16:47:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXiZuZjcyPzvCfMyIGldVAZSpr84MPM2LgbuAX8UODdNFHQqO7NCtXU+BEjGxSffMRFpuMvYPviqWC8hA==@linaro.org
X-Received: by 2002:a17:90b:1e08:b0:30a:4874:5397 with SMTP id 98e67ed59e1d1-30aac183785mr8301416a91.9.1746661619859;
        Wed, 07 May 2025 16:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661619; cv=none;
        d=google.com; s=arc-20240605;
        b=UbscGpyIaA+u4k5/5q3fH61OAL8EjQ+Kb2eE+HPVTuItnifzTtnqoc2Hz6JF834+Ng
         MoH9aqUe8aD+H8bQK33a4B+Y8D5hLSrXtwWn2ggvM9vVfTBkmbsizk2g3nBz3omAzOqb
         shD9BS4+8vd3nQknCsr57JMA0iwVHxbvhGunx4AI7I0DaE7Q6m26o8O2FZ/uADF6VA1I
         znRj6+xnSYe7NYmNKAXD4jP2UPIGxZp1WAosD0ifBAyi9Dp4roEaiaz49/c1/8QuFmru
         +KR9T86byZXEHIOM1K5MK/KxvOxQMktQ5aSaR8GnoT7wjCCPRAcDqNx34BKIf+P6HwC0
         76rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=h9+0A2smB/xfpAp/1FKWxfsvzCeqir2otJn6Vwgzfpo=;
        fh=BoHfUftT5SnwRrKWE40VbYY2pyYFRZCo5Z4mklPRbqs=;
        b=HFJVJop003ZAYITzffIQEP3u16gt3aMr3IFxX+bB7peIQJQignB8ha8TiQ4l7dA3fm
         RC3+ytnLJ+tEXt6raRxeYleRZN+sFgXm0tbpyWuuDWu724UKELdovsNKnhetkSCE5pDp
         okt/j2CWXzGKmdsAgyya8aTWZ9n6sXzsGOvG3OIpKwGI1s8aHHw1UO/6uTABOay9cfvR
         RksNAdyGEy966aFy3Plfwk/XNLE5PpSwlzCasGfZRv3xNFmY1H3DSq2fJx9XfGLoYWa/
         fjUGrpx9efFLN7OBYEIThNDPsr+7O4DNaw8uXbGnf9dRTbA++i9tqiqh+lhQmMlxAKks
         d6iA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qe+/jiQU";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fa1b55c99sor1715345ad.6.2025.05.07.16.46.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:46:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qe+/jiQU";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661619; x=1747266419; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9+0A2smB/xfpAp/1FKWxfsvzCeqir2otJn6Vwgzfpo=;
        b=Qe+/jiQU6joybGyrJLBxJXza1pIXlDShlPri320Mk8odssTc2kxx/Heg7nUUUpvvFW
         /c5Uhp1NfZur9R2bK0WUAr2OK3S9PtwBJxJE2fd+TBj5nMYnJclQK8a2h7wXV5suVAud
         izsKzwwKK+g5Xq1uOO/pMylzZNqc1v9hGl0nvoxPZ8bmO9trBXepOnWln9e+B4B9v6Of
         Ykt9pnA+vSeD+2Vz/AEUPYrOwc5mULIbZ2Wskxg+2ZbgMstKDuvuaYBmqZ60Bu8j2EUv
         PLopHqP2rwnbEwzIrlxpZ2rjlGoIW6dCCTFc3ef48UObIAYN4sagFdYhb6u0+wniG/4d
         xl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661619; x=1747266419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9+0A2smB/xfpAp/1FKWxfsvzCeqir2otJn6Vwgzfpo=;
        b=CHHSdolufxaDVIkJ/2maXvE55PUThJCZpV34lygp5bMdfvb2IJidJDUBikJTiGw3cm
         HNOoDqEJZqJxp6RE39OzDDuKRy1gVHWLWoGK/XU47bq63LDMJNwZu8mhVBvVZdk50Tui
         rTPdtSDHNBQ05HRWpbugyB8/5SvhJ8zMMVc4/EGZcRkOanh1K7ixce9uMHo/uDzYq0jF
         FrBjO5xfQFG+jwUdpH54nytyQCvqe1y2QyXmUmayOH42gXgE9fJKtIIQgEikDOPJLH1V
         P147bkFjkBPUgJdI6eOIZAQA4JXGfp2FZFMZDJhZ2P3RIl0tnTRnGOZQEAzAMSRv3tVm
         KzEg==
X-Forwarded-Encrypted: i=1; AJvYcCUbtscAMMloGEa6X+8ynAmLM76VE1cahNwvJUj43HXatmidSpHbdvXZTtngZfKkB7WYYniqS/M/DLTZ7Q==@linaro.org
X-Gm-Message-State: AOJu0Yz30lUnY3Ct0Av2f1cmM970b9a40ptk1DIp5YjjUcP25kTvPEM4
	OvfojvjCicQO1sWwOLHwKdzwrt0IRf+kgIirJcRp3y2uCPM2ifSwiOQbLOYKW22BdQ==
X-Gm-Gg: ASbGncuuHa7NlD8mEkvV7BSThgjR7/aIn8BRpsDk2eAb0TWXBIHSoJy2ehBkzaZkkO6
	HYN3ke75h24GY1DNaUaR4LepEuCYNjOv29p12upOmJAUTR6fBRwuCxlCrwR5Le2JqGjEGqFmZkS
	0XEQvCrMFbqckAR6GrMeIzvNfgq9qMzXUXfLlXdXcLo3DavFgaM2RB//bk8WwfIh6uZUT1yTO6A
	VvJXbzsIejK6I/YZyW8QofMhxP6Qe6P702LxF7mFnaEMoLxSRl3tGcqvrsspgRWrwrltN5u4zXS
	9WiyN6abLdjGitkRNScWXgVegTMZTXVDcRZGZH45
X-Google-Smtp-Source: AGHT+IFD7JLl7PMkprSB+gonsSnigWdQwt5Gm7vQMOymA5jKMQ8arRw0rvIvBHmHIJgyHjopluQ80A==
X-Received: by 2002:a17:903:166e:b0:224:c47:cbd with SMTP id d9443c01a7336-22e5e98947fmr80767545ad.0.1746661619500;
        Wed, 07 May 2025 16:46:59 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm100792435ad.62.2025.05.07.16.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:46:59 -0700 (PDT)
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
Subject: [PATCH v7 49/49] target/arm/tcg/vfp_helper: compile file twice (system, user)
Date: Wed,  7 May 2025 16:42:40 -0700
Message-ID: <20250507234241.957746-50-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /ZxINQgsrY/i

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
