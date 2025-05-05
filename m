Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2179901njj;
        Sun, 4 May 2025 18:56:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjNbNJEirjM0sv3OeGoDNrE/jjkUIfM0SInj/lc/aieZqVjlMpfQOYFp5vIhFB5GLf70p4UDdhZmpVEQ==@linaro.org
X-Received: by 2002:a05:6a00:ac0b:b0:740:6615:33c7 with SMTP id d2e1a72fcca58-7406f19f4b1mr7946754b3a.23.1746410191413;
        Sun, 04 May 2025 18:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746410191; cv=none;
        d=google.com; s=arc-20240605;
        b=M27/gjFyad+t1nStd0tfFrR9X/jgsrfIy4D+Mogzz2+LmDIeBDPCR6ozW+dbDKaOTc
         7rz8t3+KI6PSnTk9QKOwoPfV6hOwdfO74oubC3WpEAvjcqWlIH7V22aTmD0NlTzJOdah
         nHg6jhNshNghuoeww7m5g3jbD3knLmMrIml3r2mMdJmpVvNCC/YMrsopMubN5iwnp68h
         ke4M+JBZXrnNOcLkkd0xey4/beCj1zQTCf9r4ugj7avDvi5/fqRU8XIpBUyj3/kOZ5n4
         4qqJs4PnbN4I5mD6Lbe2q+eRruDneNa/i6Q/8niQ5NKfjZ/zOoSxARQ7H5Kyd5scN8zp
         xfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UaIKPxnuDIO9RtYHmPPx5mO5g3g9VX4P8Ofr9oTYv0I=;
        fh=SQ6aK/MsaxVyie7JX2MhKrPuXzAtbBWBHrqHw2T+d14=;
        b=BYcOygZalNj43nSXybUmSlJPrHqSpv5jkiocnT1PCmEEhOsi1dmt78U3WHRy5wDfxN
         bQOKOUec7ijfupdW1oaUPFcUmkPTzquCpc59YbdA89u18XihXKf3rPFLLCfJhkSI6yRR
         2dqDLPWZxyc4alc6zB27OnkI9eSBsMaLWMAV5cxQ97YCqUyCLQ9ODzvg3P7DNWU2Vm2N
         fbJuuwoXjxDmqmi9uFk2Ij7Wj0e4xy8OVm0/A5l85N7JfEwA/m4jcxLUh6Hj7M5IZXi5
         IH9hqgHt7YA1uohqP55lSUXHKeVssNO/i6hrFN7JRNz5RJngUg3UZDLfXQ47LAxaGHG4
         5JmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nh+17/al";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-74058d8f56esor2116799b3a.5.2025.05.04.18.56.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:56:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nh+17/al";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746410191; x=1747014991; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaIKPxnuDIO9RtYHmPPx5mO5g3g9VX4P8Ofr9oTYv0I=;
        b=nh+17/alA2krN0vWd6B7O4ez0jH3wbtymDzITSn0ZGfJCMSFzyyq7eFz7V/n3pCC5v
         bijAD2lSbAYNuM//I+NcR9bFR8xYQGdlbQstJrku9o4PYTBvlH2wOgH1KfS3A3Rl2AWW
         7mSdiuqRQ0fGTh11R7rXilL4uVcY0vCm2GGqims9Z9VgJzYtasQdTGmPYRHlxb6NpxN7
         6r1KEJ8Zqqn0ud0vAk3mVjbgFXYrIVbyhLiTTINY/hu0OYadbA9ABs5N2bBFlc7EFebW
         96YK0bVd3DLdyZCGsswV701E9U53iQE8DKcIvbOcFaN8cXVHCzZIXLtLVLysCagi1N1y
         e7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746410191; x=1747014991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaIKPxnuDIO9RtYHmPPx5mO5g3g9VX4P8Ofr9oTYv0I=;
        b=W51YEejxjRXyrz5pmDwGQtkAgnVTdxYWhf2cxDHnRGYwneVvxDEJDmjkvsFKesO5/n
         OZCCftwxCI5399v/Rz+U+UyCoaY8wVOPMo0c2z1DcvbeY5EKiTOByCqpj59mcjwIExWl
         IuJPdLGTFqXc87520zYRujYGipFvC4TCyusxH06cx8jBu1KdAdXxlCDTxHTZjs2+Saak
         heDGJAv/jXSR/jZBqJJpV6HKqpJyrRDe8UxORTOnrIrapT8NhEskcgItEKa8kTZRwyNk
         qyXsdGwZnV6fUisZ4V+BKA7f07Fw1GcO1YTCDzg5+q/M/XZBYLacdTChrXmvh7tyWXut
         U8gg==
X-Forwarded-Encrypted: i=1; AJvYcCXJTbmX3sZVURrBYb7g+chvaGp2FPIB5fLgK6V0VXGhgySnV++sZYxWcRpNZD/6diuap3pclrwuHFxqNQ==@linaro.org
X-Gm-Message-State: AOJu0YxKG46a7Ha0jlUv+ysja6uo6Ug05qqWBqbO4Q/zOI/NhnbaYoKO
	5svB2tA7e80MGY+n2O1w0pU8aLeIpUvFr79nyvcIa5eJPBgqpLjo4gK2CqOC4NsBtQ==
X-Gm-Gg: ASbGncvki32qSuOAHfuGfbsLruVxDXXEHNt4h/oCDWDDz9lHUeiMAFrqizuHhGmRJBK
	kZTwQwd65YI6fJdxboMBgPkIJ6U7LaKBSjQyrU6K8mOoxnBe+TcwPfBhEJheQalpfU7NGWa1Pwn
	DKaCkqJqDPguj0MQH2pqvXHpYnDs8GLF8hZPAyOvWBhtmxvqS1jJoqScGSnMUMfEkDF2y7VFHNa
	Ue/PH0YjrqWYNSzqP248FwMBDEmBB0RLjol3UnNpziAX6Vi3ISx8GSiTME5Ky3Ko5cmkgfPiYj/
	jczXUwxGwaiLvxrfR3skgNwcMZVfIchcWe33S5VI
X-Google-Smtp-Source: AGHT+IGasy7FjzgJ95jnC6u+9mr0bhUE6vKNVWFzb5iSdvQTVXKhLaRg66T02sUairn8/pITB2lG9g==
X-Received: by 2002:a17:90b:5868:b0:2ff:7b28:a51a with SMTP id 98e67ed59e1d1-30a619a53e6mr9850659a91.17.1746410190956;
        Sun, 04 May 2025 18:56:30 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47640279sm7516495a91.44.2025.05.04.18.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:56:30 -0700 (PDT)
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
Subject: [PATCH v5 48/48] target/arm/tcg/vfp_helper: compile file twice (system, user)
Date: Sun,  4 May 2025 18:52:23 -0700
Message-ID: <20250505015223.3895275-49-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: sXFP0rAXwvd4

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
index ad306f73eff..2245bafbe15 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -34,7 +34,6 @@ arm_ss.add(files(
   'mve_helper.c',
   'op_helper.c',
   'vec_helper.c',
-  'vfp_helper.c',
 ))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
@@ -65,6 +64,7 @@ arm_common_system_ss.add(files(
   'neon_helper.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'vfp_helper.c',
 ))
 arm_user_ss.add(files(
   'arith_helper.c',
@@ -74,4 +74,5 @@ arm_user_ss.add(files(
   'neon_helper.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'vfp_helper.c',
 ))
-- 
2.47.2
