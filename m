Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp45182njb;
        Mon, 12 May 2025 11:08:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxIsukXnKb8mEZQL8XXwvaSFrgG+qwlr1A6D0iVRaAcTfvZlJOAx6XvfUqIydyJLRbcLgaNNzOuWo2gw==@linaro.org
X-Received: by 2002:a05:6a00:a0f:b0:730:9502:d564 with SMTP id d2e1a72fcca58-7423bfe5164mr17413235b3a.14.1747073338847;
        Mon, 12 May 2025 11:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073338; cv=none;
        d=google.com; s=arc-20240605;
        b=ZxFUxUVqkKi37lTzFcFrncGBrMR+Thd8kFZ/y7QgBoA5PbUG8IX8MIT8ilmpms5Kv5
         3ieEaBKcNay4B6v9di+tvl7O39o0lZDqyENncSkDcoxEeA08zh6itgPrG+3XIUZ7SNXF
         DsPFHlRz+wDR9BW+f99lTMfgn0LJTbtaBgXuxGWmwR9mIkyauFTJs8fWCJ0b/pzxdPeV
         VSWbbu5MuoCcAgPP2anOqegbaXQWJ34w4UTOi3sEs2e4ADCV5mkQVQpk7EXBVz7daLiH
         HSVv/yFuTyaqFbeMijvA+BQiVFy+XX5Los3b20FWhbakUc2H98RdteEzHvsawM+YiDM3
         6H1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=D50FgSNi0pKqcQ8O05hlTOFeOSvMmvlw2mBrg4KVMZU=;
        fh=z6ipVPSYYsa7QNDqDd+DBcgcTvYry53DIFJNVcY+6DA=;
        b=ILaEMHDYXWfo4OsElUjFsT8wfenH3vaLvoxKK2KuRy29YGZEdTWMCTI6jdIEoJqmUs
         xstF9Lnd5ni1glrRWLkDXnXsdctaJ5+0h968yefQwit29+7lHIEEH/NIm9x3eTRHAmTf
         5sRk76oSrH/VSJgrpWzsOPREMcMiyKl5cFC6lRI4UQGbXs+xBlmiVUJVJRIGiE1f5Saf
         R4KMNqoZzGOdRg54l/ukb587PYIf3rv5EsAuFxupNAOG758fyTrWgVDieMIp2hFhT0yk
         NBwTwjOxOOq6jQacMdxVUgP5UZOUjJs+5WP+9lkKSwObaJfcteer7TNSxRMzwpEE0cdn
         6Gbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MNNnSWIk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-742377274f2sor4804967b3a.4.2025.05.12.11.08.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:08:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MNNnSWIk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073338; x=1747678138; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D50FgSNi0pKqcQ8O05hlTOFeOSvMmvlw2mBrg4KVMZU=;
        b=MNNnSWIkjKB3N9xv2SZj2S7IOF5x/y/0ET4I0SJk5Iqs9oEpKVio1G08vJzpxWOJyE
         XzOYSbB2ub4mAuyAXYX2ml2fQhgsBf4zyLj2+OD8IrnT0D72kZl1+qpKSUjQKocj/IVJ
         KaNKRv+LuyDmI4alYwCbd/y1wB9qIz86U/MNdv8grGLEect8pqhjbrSZqLvAOJM/Hg5x
         3i48XCtD4W6hAWIQkI5DfXfrvGzmsUxze6vFbJ2DQEUQpyCbK4yyjqvi+9gm2ZVuos2x
         cP/bv8WI1vC28tBmN6R4ESZwk6IJTf6iXSqG3wcWR3wfjMV6Gbe3drTBeuxna7nE2A8U
         ZxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073338; x=1747678138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D50FgSNi0pKqcQ8O05hlTOFeOSvMmvlw2mBrg4KVMZU=;
        b=phQojq++JCOu4Jbu+zhwEXpV+Yte/9Hf4Uh48DF/mVGw5g7z5rXw5jYd0JnGNIe+XC
         YNbG2OAkdxFCaDnm15d8w1FemnM8nuIpppSbk/cqvDTIOe8n4cwDOApQv91V+hm5mqRp
         JmK2ZNTKJSL7r7eYHdwK7RRpD5mU2+X5YRHFF3XFfS9FlXsR32Q3Ll6T9NfxyI/vfa49
         iF3WS1poPVDnxj5YbCkG6y8FLHy+1+OQTeSWXf5wSehyol+DNKa9blnfYLNAPh2jJpwc
         QkBoz/v4yQO2+qgIZgCrTfHNbD/AQU614uFiUbhOmoyNJFH3mDgwKOygcOVzzQhLYvIC
         pMaw==
X-Forwarded-Encrypted: i=1; AJvYcCVH6qbLHxwxZxP/F5eMZY7DKJUMrYMxzknwMWnCimHfqMPBtoA2B4Lgn8Cx2Sem/AVl8F3OpCjXFbAI1g==@linaro.org
X-Gm-Message-State: AOJu0Yz+k157XptjZMHgbNuj+eBRfih7Q2HF2ujWajxFQhSKexpV34hb
	bK1eFgJ3XQg83LRil3BHFj/I//iI4Tyo+5dOwlb+KnnDHdyUaLteAL/10F4reylz5g==
X-Gm-Gg: ASbGncssincf/9jS4Nb4IoUaTNGHcN6/FMkDDsrivbGdU/aphq6z00JyBbVqiWkYoyL
	GnUS5DzlIswfAE7RkOjUt3NNBJEL8MjLxkyMSdb8dotWnd10pSlW7VigO7uhD7xWuArX2zkal7H
	GDA/fMpVNgj2F86RM7EKT4Qgh6p29C26eZtXjRY07PiWCQqDeK5ddWAyKOnDeCaaU3u//cZ67QT
	q+F9uH1KAG+5lM2DwQ68VTWLSQXnqrJAtT4DwT9LA+V4KLupDL4twMZtR0iK3ftIfZ1RP5FPHMj
	Zl/FAOMyaMkc6oLD7l5XcS3jUFk2BgczE8GMyDguWS4h1NHT4S4=
X-Google-Smtp-Source: AGHT+IHa8ReBvuhLYNJVfoOgw0HWEvZH8paPUe8+ITjOAG70MzmSvDV21eTP7FYFx9n7u6IDXuMTaw==
X-Received: by 2002:aa7:88d5:0:b0:740:9d6b:db1a with SMTP id d2e1a72fcca58-7423c05b18bmr18505517b3a.15.1747073338398;
        Mon, 12 May 2025 11:08:58 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237705499sm6438580b3a.33.2025.05.12.11.08.57
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
Subject: [PATCH v8 47/48] target/arm/tcg/arith_helper: compile file once
Date: Mon, 12 May 2025 11:05:01 -0700
Message-ID: <20250512180502.2395029-48-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: sCS3JKI90C7C

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/arith_helper.c | 5 +++--
 target/arm/tcg/meson.build    | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/arith_helper.c b/target/arm/tcg/arith_helper.c
index 9a555c7966c..670139819df 100644
--- a/target/arm/tcg/arith_helper.c
+++ b/target/arm/tcg/arith_helper.c
@@ -6,11 +6,12 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 #include "qemu/osdep.h"
-#include "cpu.h"
-#include "exec/helper-proto.h"
 #include "qemu/crc32c.h"
 #include <zlib.h> /* for crc32 */
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 /*
  * Note that signed overflow is undefined in C.  The following routines are
  * careful to use unsigned types where modulo arithmetic is required.
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 5d326585401..7502c5cded6 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -34,7 +34,6 @@ arm_ss.add(files(
   'mve_helper.c',
   'op_helper.c',
   'vec_helper.c',
-  'arith_helper.c',
   'vfp_helper.c',
 ))
 
@@ -59,6 +58,7 @@ arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
 
 arm_common_ss.add(files(
+  'arith_helper.c',
   'crypto_helper.c',
 ))
 
-- 
2.47.2
