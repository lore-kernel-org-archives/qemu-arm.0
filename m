Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp45136njb;
        Mon, 12 May 2025 11:08:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUeXFZKyS8xdpb+ORUJ39i9UUVXTpvHB95M2Jq65s8rTP/r4cE8xWnUruFyUTnO8y3dqeUuCt6Qq/nb4Q==@linaro.org
X-Received: by 2002:a05:6a00:2d08:b0:736:5664:53f3 with SMTP id d2e1a72fcca58-7423bfeb522mr19414520b3a.15.1747073336362;
        Mon, 12 May 2025 11:08:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073336; cv=none;
        d=google.com; s=arc-20240605;
        b=KMQbDKSWBpkd7E2tjq9YJTzHOUmy0ZkoH1wtI/yGostvsHqMUFEkCWe6uzMjwC+qie
         y7s7T9twm8xiAS7ZvzTFHkHbrxchuPGcslN2ZYf4qeg70lWWjCc56KMVyF4AuZJ3N0Si
         kvp0TQqgxKvRlivpnrMnRUjKgMGWMeA/VYxPAPlTCgEPmVJFwijiY803bBXALOjSZdMt
         8abjPlD00QaeWmM6OEBDEEnCyWo1sQQyobO7NuUVFzd0MMwSCpOweCDgFuWq/eXNjcey
         hNTaQpIVKO/ueFI2d4r7Prym2uzfz26f3odeK6/YbI0cqRDiv44fuYCVeAP50WJFfJh/
         mrlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XN9bpcu/hK+eTVDHriw8+8GBLuzv6l51ao11Y0jPFbk=;
        fh=hZqgDtYXT4BLaD1vPOkItvres7jiJVAy/07faJp/6yo=;
        b=fumzdythlx094efyPbHg6DPn4auUFj9xVGzeW5uWZHHry652SCuqsM1sc74q+RRbJR
         CdhLAr0VoKw5XUKPo7rRl6Tyj8nwIdDViyCwyoQvGw/Od7vqT5tkhboSTrTpfgUP0z33
         yNMhThFMVV2XottH8tzLhsX+RihEFYNpL/rhyDCzmoAGXqdDTFcGmN5kcwnPSCCgnBJf
         +yjMaOgKEaLmLQUCVHgUslOdX4BS5UEfeRQw+FNC/iD3g8cS0Vh2MVCZBFJIKvIQPeaA
         VdXI2WY4+RWnhYKmPsyGa8thMFTsfFiKWR5FnmU8hTEtaVrWat95Gafsc1TUfIrcKbWe
         b4Cw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sw/+vtu6";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-74237a28aa0sor7769946b3a.10.2025.05.12.11.08.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:08:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sw/+vtu6";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073336; x=1747678136; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XN9bpcu/hK+eTVDHriw8+8GBLuzv6l51ao11Y0jPFbk=;
        b=sw/+vtu6Hr/eycqZMtAGZmvLy/Q378kCH04xUBqAo1J6c4t6iGMpaLilsDrSiyr32P
         M9zdJRRTFweiRJzOhrdxArtNTGNPY7NU2Z62jqHCNtnYunkgmV6CIBxptwwQcAOkUiKV
         HZ4suWm5pBYyJBxqdVZ1Hw7y4jxtwWo9nfI5Q74uBbLRggM8ywScgjdsFHHrTzW6i3Rr
         FKmTC3ZbxCUlQ0CLuDRBxqpyaV9AdjCE5lbK3IuGZl9gJzVEpqXpwg47RcnyUlQexHBq
         ZLRs6D6LhjSyPQpj9Ebr2M/km2NW2LXADrGpzMil91gaT3y/Q8iZjFolTbNu7YBP4y21
         Cufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073336; x=1747678136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XN9bpcu/hK+eTVDHriw8+8GBLuzv6l51ao11Y0jPFbk=;
        b=DtA9bGDodh4Nwuz88Esm75ssIDb0ZW56fdJEyyxps9Ku52RCiQiQWlLqxMZfDL037n
         2qIdZQxZFhhdRep+1b+ZCMmjQoBf3VCcas0iNRzT/VQ2P3efjTm+HQ2/p0R+hDyEJV97
         A+3FdgnXoha1jY35Lgo950iZe0FoB+NC0v1scNf2td86MTTB65W3II2ie+kc0ZsO/qn0
         zzDgR87JNzCShGStpxyXMZSul+c8OuVl0Ed2lPaaCIVPuUVt7JSgBFNLeWvsoNLanH6T
         opjMTbrMoOneV0MHgAsSH9XNUQjeaAPOgbnHShBNUFinuYMVvGOiIyiOBCFNFRVkEugm
         XVLA==
X-Forwarded-Encrypted: i=1; AJvYcCX5IPVexcjf5C+1bRStMXJtamBh/J5iWQw65HEedwS3BqG8gaiVqi61+0NyZPVzlL3htyrOOTfAVQbsxg==@linaro.org
X-Gm-Message-State: AOJu0Yy0Aza1hxSVDHDrHI+wED62Yh5SGcCLQevfii2/skG7Eps69Ah+
	hZ6Su8KA3hhWOzzdED7WLQfuakylT3L8SHhYSec3RAouJ1ndRstEkWGcx6zGf/6e4Q==
X-Gm-Gg: ASbGncsbzh26ow1I4F/qSH6WCayksAgxp8P8mEpihvfZmCKpID355iEd4sOYPTJ6g8g
	kUlP8vKMME0mcWHG9gIJHMjuBVRYCcuIQSJAvovGphxW7ySi9K8QPJruUMeg5U1QPKO0UXY4gEb
	Px8x+SZb8EykzKwPH+jgYflC5qr9wlW2jS0x+3PBNjDwdC/+ahOpUBStRsrrNJV9pHMv0p78h4S
	8cUT5kI7pS6bjIuMiyCoKDuHafgzOWL4fTxYZuo2+Ung8EEjdJE6XR3NB6C5cDVTLF9CLWnK8vh
	9YgPwfWQrE38H3Q5AwqdQcst4aoYy1teiGVlGhMa1clcAe/BekY=
X-Google-Smtp-Source: AGHT+IG+BeGr4IuBP8TMSOSX77hezFOtRuiKEwjWd9/2pXAZfzUtVZDsMPzzrQ073yba+JGvzQT+/w==
X-Received: by 2002:a05:6a00:9286:b0:736:3d7c:236c with SMTP id d2e1a72fcca58-7423be7d6d0mr18600353b3a.14.1747073335760;
        Mon, 12 May 2025 11:08:55 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237705499sm6438580b3a.33.2025.05.12.11.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:08:55 -0700 (PDT)
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
Subject: [PATCH v8 44/48] target/arm/tcg/tlb_helper: compile file twice (system, user)
Date: Mon, 12 May 2025 11:04:58 -0700
Message-ID: <20250512180502.2395029-45-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bDC5bPaqZRxM

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
