Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp95649njb;
        Wed, 7 May 2025 16:46:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV2Zl4/5kSaF3pJYyFN1EudaG0fuKV+JOhB3NqN8UcVbeYToobQHaU9sf020tPDmwjXyDkIGVtdly+s+g==@linaro.org
X-Received: by 2002:a17:90b:2b4d:b0:2fa:2268:1af4 with SMTP id 98e67ed59e1d1-30adbf1163emr1985702a91.7.1746661613124;
        Wed, 07 May 2025 16:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661613; cv=none;
        d=google.com; s=arc-20240605;
        b=g75udxFKGoLlWSA4uVKNizxuC85Uy0SHwaSFLnu7jE68PQMk2GCUAk8o8ylodMcjGR
         5sH0dUYQnBoo3emI837/REBTJm2bSGGkeldbwV1LIVP//VwpXwwfLfssJoPP7ypDc15m
         G3c1PfOceQhuJwy8HcfTLSkh0B4yd1ENennVxLgfPjZ54+Pn2vzn0fz49HWYxM4tdSPS
         N6hE4bm42tbytGrO4dqxu9htUFl+B0C8Veb9MqHEVnjI5VLGY3H+FaNvR9Hvop+9UJSP
         6rJmHBuEdPoVbmuLCuSsEHAMm39B6PEn4Ac/8TRiXn/y8z2/6luF72ySPQCLp7b3x/jv
         h6Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=45kfheSbx4dAVwou8HhqFlnvbUQXjacWSTonOtivRHk=;
        fh=v77jnNcX3r5E69qRaH6hyuTwyWcZm2NH1yfaJE2xyy8=;
        b=MUBNFaBGFUMTr2Bpy/YVyo0lZeHJbXBhkGkllpV43M3btdHUCqgEyOrGBA2f278XED
         ixRxwcIn/PZ+EQvy2HHOcdGQlKe8inlJ36GUdoUYhlU7u+NWHOQIFAkgiXwJYNtGyKhI
         4yaO4csM3jlkt/0c+LjsJvvJZsJ09rUOPZof/bOdQoN50R8fF+MaumzEy36Jk1nGEZ9R
         uWvQwFmhY8dJtGoJ0QjQJCgVnvaNa/srTFEGb4lTcBoqAxJ6OjI+lCEtuRX6JXUeDa1b
         iObsCe3Ja9yCfIKvVm+2je9CTk1qbvttt2z7L1YGe9Y748gpMabWS3FOin8TUyF4B19k
         JtfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=esF89FzD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e7f1f633fsor5974405ad.1.2025.05.07.16.46.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:46:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=esF89FzD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661613; x=1747266413; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45kfheSbx4dAVwou8HhqFlnvbUQXjacWSTonOtivRHk=;
        b=esF89FzDbk/bjGpPWIeE+KSmTw7xTfpnHU41rUsN3H3UluznZ9kLmiu0hJIaAmVIQu
         VbUSI5WuMf2n24QnLHGRKGqIp1+ZnkVHfI7jGWScA9GBL4ykxjW+MgazgCIYkVML4llA
         /a/rUi0Dxyt/JvNRtoY7jvvZIh6ovy2jKAIH3I9XiE9IUlZS15aiDKbIHCQPRCIOz+XM
         KFXj/5nRGjxcEXgRgA5Y6hT+w0BnoQ32k+cJkQClTWI3gfhHhQZwFBjP8PjFL5I9szvm
         geE/V7ZWmrn827dbk73vDyDW+hL/dNP07DGAoODFboAQSJgfbZWM2jLPzcIXJlA7J8Z/
         70sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661613; x=1747266413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45kfheSbx4dAVwou8HhqFlnvbUQXjacWSTonOtivRHk=;
        b=vzg/EFz9mlbddiM8NybDimX+6cth8xwmxTMgkj58Cn6ImQYtdOHw686CTjzO06fjsz
         N8ZJh1oIMW5DUKoiI6kQ8cP3/X9wBMsKe3Ep5lr0DoeCL4Z2K1kK/F9yjXGGK6JIOpUt
         K4bzwq+YhLOycUG+EEl5xWdo9vn6DKWxWt+hnPY5bKcV0/SJPoqvdztSE0zIPQg94EXS
         JvxBQ3QQyhAt25zfnQsTqgtn8lY++xKrXmVL87WZqgAoxUJV99bse5WzjnnaP6dws5Kj
         urDEW/HvrayXARQMw4ozGyoNTjeqsSykjUDLmDH2emdD3RhZYNkHI5D5s5iYnchBcdAJ
         /xIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaFD6r7BKS2ZJmIbr3JJ0FItH00Ey/buIo8XSLmXsG1yHf+9Yp/BP6GNKHTXIuXlO47Q+4gWHOhUZnJw==@linaro.org
X-Gm-Message-State: AOJu0Ywr0Qj+FwDiVmk6+kg1WyXSqwuFu8r5dmM8IpoDGjyw9b5YJ/3L
	YOINtBZeGv3hDlMJL5Bl1C/Rh4rKC7vK8rKLXfjDTkSfdTOR3tilzivPhpmzgySLNQ==
X-Gm-Gg: ASbGnctffkNPN2j9XENhotUKvnw2048ezn7EvyjArbuXijJQ/7sFP2Bp6o3wszKymUW
	PEeC31u3bGbl4esASvg0eouPSkDli6NfURPZhBHQVhP1Ym7KRDq3qrIAcmqQFObvVa5BLooZSkb
	rCudbRIh/+ryNbB8j6Q1axLx/526Wf+gcJtxhY5phJApRgckmn/XzxiYNx5QYhFeR68J3IgArrE
	K9SrA0W5fTfMq10/hd8OVPLWJIsaZEZu6k9lkbA+xt3bRW9flW7HxUQdveGoPx2uJFpQEOEGPDz
	KeevT78f8V1asJFUpqmbWcVmmXj5+18uzwah6lrx
X-Google-Smtp-Source: AGHT+IGWvpZIZhAgezTm3+CpU6FhffPhuJ9OaI0G4/I1LkJJeHKcE9WZB+AxsD5YfZnzuRYarly32A==
X-Received: by 2002:a17:902:ea0e:b0:22e:491b:20d5 with SMTP id d9443c01a7336-22e847990b8mr19124445ad.26.1746661612749;
        Wed, 07 May 2025 16:46:52 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm100792435ad.62.2025.05.07.16.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:46:52 -0700 (PDT)
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
Subject: [PATCH v7 41/49] target/arm/tcg/crypto_helper: compile file once
Date: Wed,  7 May 2025 16:42:32 -0700
Message-ID: <20250507234241.957746-42-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: eVIFHqYQw3sN

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 6 ++++--
 target/arm/tcg/meson.build     | 5 ++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index 7cadd61e124..3428bd1bf0b 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -10,14 +10,16 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/bitops.h"
 
-#include "cpu.h"
-#include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "crypto/aes-round.h"
 #include "crypto/sm4.h"
 #include "vec_internal.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 union CRYPTO_STATE {
     uint8_t    bytes[16];
     uint32_t   words[4];
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index dd12ccedb18..2f73eefe383 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -30,7 +30,6 @@ arm_ss.add(files(
   'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
-  'crypto_helper.c',
   'hflags.c',
   'iwmmxt_helper.c',
   'm_helper.c',
@@ -63,3 +62,7 @@ arm_system_ss.add(files(
 
 arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
+
+arm_common_ss.add(files(
+  'crypto_helper.c',
+))
-- 
2.47.2
