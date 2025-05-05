Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2179894njj;
        Sun, 4 May 2025 18:56:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5fFPN6rgdRtMMuRsSXRSuEeJj6aFR/EK/1nl/a3Fx3DCOfl90C9Y9ZS8pWW8L1LIKD/R5Qpc3KTnySg==@linaro.org
X-Received: by 2002:a17:903:3baf:b0:224:1579:5e8e with SMTP id d9443c01a7336-22e102b846bmr165317805ad.1.1746410190612;
        Sun, 04 May 2025 18:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746410190; cv=none;
        d=google.com; s=arc-20240605;
        b=Y5aWXIR4rCVP0ZUXhJnfN31YXSQs6tQBYr3B9i8mJhGMc4eFKVZjENcSOHhoq/hrlo
         0sJ2dz0Ko9IqCrBLFcJ05L30/Pct8iWrJJQH4O3SeFks96/AwAXP6nlrHLymOJSaNGoq
         h2jY8p60uo8hO8kEoJoULfvViSZhVXGWfO54W/do22BMrmr9gVKV2753S2PjhLB5HWVi
         mgUK3okxBtCCD8eOGXbPV9xX+/KsBHEhIRke2jc/EStpHzw6sZkPmUzF39Rcu0UIRbGZ
         eICVaPYkKVvHzs8OnAa4Abbu+076FSfc0m8WVxlZcRFZSoZpSZRWYbsmsolh1B7tm/RV
         K0Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TH/D4KCEFHBYkSCcvDFfFBdITHDf8vFzzXvCaqLo6XY=;
        fh=4FAHFdgkD56EwUO6a2Nn1NHyS2lMwRxQ8gTg2BaxVFE=;
        b=KaiNHiI0Etu5Iso862EqSNc9exmHMXd0fWAbsb4FtRus05f6ysYfPXxbxyEhAuFQDD
         UzgaUHIRLgNrZxO1SdccojlmnEu8VXAq4bBGySy+UvCRQmkqRwV2CNtyxvVJ+At25b1V
         LKmlI89UTGcB+XmNP2AnhxI5cbxXdsHLm3eZyDMvSsWIoE2rW3nLGynX/2MaWavAeR29
         mc7qpVUfmPq++dqH9/XX1BlY/Lts402X9mHr3w6RyN2tX5JFcK1qG4V27SM/D01OMUga
         4yzBefqXBMSp6GvHWAWJ3+YMGW31zpvvfaZeKrgpnjRVhTAYluFyIro9TpDPX7HkESVJ
         k0zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q98nOFkf;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb1f70esor42316525ad.7.2025.05.04.18.56.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:56:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q98nOFkf;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746410190; x=1747014990; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TH/D4KCEFHBYkSCcvDFfFBdITHDf8vFzzXvCaqLo6XY=;
        b=Q98nOFkf8j1qHRu1XeyIASl3HuoXz0/slUL/qIGaaCNG3Zlm+Djy8ysLFKToczS4aF
         btm88GkCYMDcM362LFACbqn3UAE5tj4e+UbVdGs8UmgkbWMwNYIcTEvW8unfNwQdvA7c
         wOOOqxo+JlfZ6C9bMq1Ukl0FOxNnvXIJQeTutdjTlaVQss/qkU1LORU7vNwvszSH9wW8
         zP9JePXyasOO40dhtq7O0RtNCs/u180ZgQ28a0TArsIrs5xutjufl+aSe6shgRWvfPOO
         Q1OY0fVdp3ZKJM16sfQoAQ19SA3+bFAQqXnR72gD/rmiVHQyXzrpv1d/I4s5+noZqjN9
         zV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746410190; x=1747014990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TH/D4KCEFHBYkSCcvDFfFBdITHDf8vFzzXvCaqLo6XY=;
        b=qOxfL54TeoB7nOAp+RLB2dMIF10oNiJ61M7mWKPM58pPrRGadpv0D4+DgHx7oC0t6l
         FP3w6KaxlXtBUXCg3VVi3YcCE5EtyNyyTsRI2URWKE04bAIP9IqNqHLiAI2YOoW4Nnv0
         A07RypbffjbIcWWPGxUorXC8IsOoJ7t3XnP+7bslJABGmkB9dM1ie/OxDBMxxF3fuhjl
         yEy9TF+1wircI6u1K2HcmjDf1uK9rT0s/wCyeu+Y9KNN7+jnK6K/ASHtclmhWxzdsDy+
         /8ubejElDmSX3vmBIKpCz2VCNhFc4AIFTIzPwZG7SfhE8jjnQ9cUQUmfgzJ+IPAXWDNh
         Y8ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF12oXy68K2+pTxMbMN8lIWKgPgr1YQsp9OUofK/ZYvN2+XJ2ZrM+x2Dym+UGJQJWN17zAepXCW71yNw==@linaro.org
X-Gm-Message-State: AOJu0YwTPiJA880CwA3cAkMaETaCPvoaPNSA7Jw2ILMPFAWL/5yLTMNY
	BDCafCTuCzYm8r6pEEcEw9yTf8uKIwWQGetEzS+gPpw8KdaHhEiAJJ9nw2TyhNfVeg==
X-Gm-Gg: ASbGnct6b16JXIQGksofz8yQ34vh67uitAi2rdCBtJZt2fbZVNWox0gz5gbjBXFMKCv
	y3SEVtVW/tg5qCrMJTrhSvN13fvtfiHG+dflWTzLAz0sAZ1VXNUF6BrQCf1SPM7y2BaawhlcPze
	HW4hSWYFeODyjao+Dpwc7ZezL6l8ojAOSxwnQGjwBE8hGbPmdhCEXasYzKrD5nrFQ+V7xI0fyC5
	MFvF/sCp63TOokT811eIM13rP9AYiST5/FoUCMjDTp2ftlU2keBjkiLJYQAlOiW5Ad8Hi80FYXg
	dQKXk/oTzRQe78z0pZMawpsiAGujerf1jNMSm9SX
X-Google-Smtp-Source: AGHT+IF0Ds40ZHzk08K/DrLbhYF01+YRnck2UbWKHsPrY2Ni7NasWl6bG7xvvtKEwRf6w0IbqqPYqg==
X-Received: by 2002:a17:90b:5704:b0:2fc:3264:3666 with SMTP id 98e67ed59e1d1-30a4e6914cemr16806185a91.30.1746410190151;
        Sun, 04 May 2025 18:56:30 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47640279sm7516495a91.44.2025.05.04.18.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:56:29 -0700 (PDT)
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
Subject: [PATCH v5 47/48] target/arm/tcg/arith_helper: compile file twice (system, user)
Date: Sun,  4 May 2025 18:52:22 -0700
Message-ID: <20250505015223.3895275-48-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HBjqrxzo0VPK

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/arith_helper.c | 4 +++-
 target/arm/tcg/meson.build    | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/arith_helper.c b/target/arm/tcg/arith_helper.c
index 9a555c7966c..bc3c78c5011 100644
--- a/target/arm/tcg/arith_helper.c
+++ b/target/arm/tcg/arith_helper.c
@@ -7,10 +7,12 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
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
index a5fcf0e7b88..ad306f73eff 100644
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
 
 arm_common_system_ss.add(files(
+  'arith_helper.c',
   'crypto_helper.c',
   'hflags.c',
   'iwmmxt_helper.c',
@@ -67,6 +67,7 @@ arm_common_system_ss.add(files(
   'tlb-insns.c',
 ))
 arm_user_ss.add(files(
+  'arith_helper.c',
   'crypto_helper.c',
   'hflags.c',
   'iwmmxt_helper.c',
-- 
2.47.2
