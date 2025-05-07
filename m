Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp95666njb;
        Wed, 7 May 2025 16:46:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1ZrrlBrapOuiz/oeWAvhXA4LY2ZL7ERc5i5zGqwu7z+G3hs2zBvcg6dbXKgBy2yrUY97jXDO5XVn8oA==@linaro.org
X-Received: by 2002:a17:902:db0c:b0:224:912:153 with SMTP id d9443c01a7336-22e5ea28001mr86161595ad.5.1746661615657;
        Wed, 07 May 2025 16:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661615; cv=none;
        d=google.com; s=arc-20240605;
        b=KBgQ17wHpCKEQzxK+m91oNgQ63wdpS68ARnNHfWGl9OYfsn2zRoiIdphoMK4PYVTKL
         W7b0BKxMhbMi3VP0y84jIYuvNI+Lkpj/9MeIVLBL37O77Ld7tdlB0+oZz7UKiAmE+rKF
         Gid6PUx2IirxY2XQdVk4i0nP+djlRCy0CP8kJ4llqaKz4tH/I1DVv2WQY2zomvdm7F5i
         n+jGGV319mQTYDe/nw7gg2MxBwcrusTO7uKV4HkwRY54i2UuRft3t/5eXiG5E+gAOEkI
         K4w+MQrhIT7zSvG+fROd+TCY1w1f6fV9iXAvQhmdVWjFTNr899pkrKzrBs8umT6+7ziW
         ouJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=11Q55+gMF5u6Eo9NyNW4V+s1ceVG/+YyEcTpuHMGI4c=;
        fh=HCXEUfsfUYhHvaGvwpoQng2ofSbHRMHA9uTSWQzkzYA=;
        b=SuBz/8B6JAbqBuZ6nxJUPBeFSIsYfhZYChJR93jEuxSlYHRiAUXW0gPjC5rt7/R5uw
         GXRmruNhhw3+m6c8FpcewyoGdXhb2b4TwCQ7prZVjJdyFdeURGI7WsSUpxP0eBRBZGFv
         wsWigq2FEBHqdycajwLKvj5YMhOEGQ0wE+BVT90oURxo6iuJhoS2L/kic/LPEvMqRCi0
         AW0MSwPdoZkN+UqVzJGlgWrYwy6KcO5Af5Vs2wHnD/Ow4a2/mtw3eZzCcdeaHnK9g3e9
         qv1K5qPzaqFGAj+2J8MYz33cdbwwdeMl8VN2tGOEPGZespbGtcfRVpyVW0VpGhDFz3nI
         Gxlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P7sVVJKk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be7f740sor98597665ad.16.2025.05.07.16.46.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:46:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P7sVVJKk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661615; x=1747266415; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11Q55+gMF5u6Eo9NyNW4V+s1ceVG/+YyEcTpuHMGI4c=;
        b=P7sVVJKkYBnlspqmFv8mUMJZhEYuiAjSJg9dR7rl/dl0oXV8nS/3Yxt3jm54GGtpSH
         YA+QTmaCRkwi7Q8RNsH6aV/gjpNv2cz8I2YTApsSPS4SfiTfilC1eOcXyipTjS3t5rH6
         rVKonJZanbI7+HedrLKInAg8MHbLnDBHJhE6KQOfGLiV2be2o0JytqXaroAOGTC8xMqT
         Ts7naPn8hMc1g/ynN3ivARfHTl+2TnNKU+XfnSCsUK78rai5uKqRes/J8SMH0I8BLRuY
         HSQLhbdovbwOorBchtn/GUo4+5W9b5LfgpQRwlieDz+wQOMb0r1JT4DixD617ba/dfRo
         UR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661615; x=1747266415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11Q55+gMF5u6Eo9NyNW4V+s1ceVG/+YyEcTpuHMGI4c=;
        b=sCOkdhtU0qg0EnN29T5rnnRtWotyygmdb0yM/39N/kdNA/RlZ/a3sqs90MlcYTZYng
         AY2Vhrp4MuVuYjAeMurFjobc6MJqlI9GbiBaGOLLGjsEIfAECP0Xu7QCsEjq6k1f4/kr
         JyZbbYHjDdpBAPZOloRwKFYYZpiMubcPi421G/8twW4vj44yLAghZGOBAPAQ15Wr0+nY
         I/puI90dF0rBtmkJPgo+KX2k0zTLrI0kNTX/SV4mZlzqKmNhuMOwa5d8BgUsWz7ZATB5
         0VheJUAELOo1A9EP5fbrDmXcfExRuTqtUVTy4n/TcfhSAQF42sdQDBhLQlWXRKTYVhCF
         ww+A==
X-Forwarded-Encrypted: i=1; AJvYcCWlSNSXWW+NgXGTE/H5jNLthfkcDPdnbkq99xXG1w/nzTGk2zt38SIEdyTsof8sotGCDeQBs78H+99TZw==@linaro.org
X-Gm-Message-State: AOJu0YzRRxvBV5YQA6sg/gG5rYLf+MlEUUr7uD89a9R6TOEwTHC6I6yp
	I7Ef+mnCLVNh5rreIZINEk2UGA2LYdUaUmPhY6WlIA8IguFDZ6cMOG2oXXXEMBW5Zw==
X-Gm-Gg: ASbGnctuTc1Uj1Ic+CuKVXcgBKOLE72uHvd7CQlKcQKor9WDgRBgchatK8PiTfmoWDC
	JczUwmsMIay8TukCROn1Mwe2wkqgv6cbric3mGaMINq+Wcq6EcAH5mAFCKmbCRbqoZAmeBl99Tv
	UwtAN6nhnNR8LG6woXPqknIhYWIeT1RoU5A9JynhiI3fg8uwCUVlYMj7t0qd+JwDzsKV1mPehUF
	JmUBXfaDY9fadKQGR1Pz8h5ejmzao11rGTi5qyagm0nvCdiNwutMfB1UQEz421Y4eHFKVaGwbim
	qqPFTZg6Z8j6VLbwykeFlQ5DiMMMZHE+7bGpypfp
X-Google-Smtp-Source: AGHT+IEeb52mgakz+8TCt7s0DB7r7G8IMfnoPVX8rLcKaGa0HamIowdccKji4YJ4u1M8woCDTY1WYw==
X-Received: by 2002:a17:902:e748:b0:220:e1e6:4457 with SMTP id d9443c01a7336-22e5ea7d822mr69085515ad.26.1746661615265;
        Wed, 07 May 2025 16:46:55 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm100792435ad.62.2025.05.07.16.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:46:54 -0700 (PDT)
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
Subject: [PATCH v7 44/49] target/arm/tcg/neon_helper: compile file twice (system, user)
Date: Wed,  7 May 2025 16:42:35 -0700
Message-ID: <20250507234241.957746-45-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: T30sCxie8cnJ

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/neon_helper.c | 4 +++-
 target/arm/tcg/meson.build   | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index e2cc7cf4ee6..2cc8241f1e4 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -9,11 +9,13 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "fpu/softfloat.h"
 #include "vec_internal.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
 
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 02dfe768c5d..af786196d2f 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -32,7 +32,6 @@ arm_ss.add(files(
   'translate-vfp.c',
   'm_helper.c',
   'mve_helper.c',
-  'neon_helper.c',
   'op_helper.c',
   'tlb_helper.c',
   'vec_helper.c',
@@ -68,8 +67,10 @@ arm_common_ss.add(files(
 arm_common_system_ss.add(files(
   'hflags.c',
   'iwmmxt_helper.c',
+  'neon_helper.c',
 ))
 arm_user_ss.add(files(
   'hflags.c',
   'iwmmxt_helper.c',
+  'neon_helper.c',
 ))
-- 
2.47.2
