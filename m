Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp95655njb;
        Wed, 7 May 2025 16:46:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXaCGasdy1gyKHO8tZuyMa86UR82djG/ythbxts3UbSWUtunTAAYr3XnsJR26TmmReFmgR6cMi8KMeL6g==@linaro.org
X-Received: by 2002:a17:902:d506:b0:224:1609:a74a with SMTP id d9443c01a7336-22e5ede8728mr87312885ad.34.1746661613967;
        Wed, 07 May 2025 16:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661613; cv=none;
        d=google.com; s=arc-20240605;
        b=MKz6xtK6dwMB1bf/+EFLJq3v58wetQRTIXMUw757r2JdPATN9dYzbu+WgSjk/9pBfD
         m6p0CUVTelgIiUUPaiJ+ccFBbXFHLRJ11fUCj/tUciXaFHBSrDPhHF8HAtxFCCKBixqE
         q+PorOkqhQ1b97+wLXIVqvIIHyDOh55yAOgo5kXIgH1AlP2EUcCGhkSNZX6//7ZvhUyI
         JXlkm3Tn1N0YyTzS4M2tx2egjdcWNoEUUbkjwRagyHKbImNuzThmUj86z01ioigSZdHc
         7/gVnf+JiRtqDeRVimDfIGmF8+0q2wZSE7fvCAYX4LDa2R49SZ8Vg6OyVlt8spxLRp1r
         s/Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jg06Y7bf5KiymTc5nVCG7BgUS7AMOOtDTvF6y7Zvpa0=;
        fh=1CSgUtZsaIfcdTP7b/8EzAMuf9PyZ39ZtLIDyo/Fgm0=;
        b=iq6D4pymkV/wc6OZpsZRlhRq6aGvu2LEYE0qEcKsu8t2gGwf6D7KM0H1r/F601gwIL
         kKsbu3ilOhhKq0jcS/kT4LVYsDVFDlorhcuQj7wntDl8nqHk98agJ6ZTDvThsBPYScK/
         ezFsJIDDtgHgHrDmxR66muVgrvZe902B3Fwee/mWLzoMyBGJRwPvsOkleZ/Fec7URpK7
         bcvZhA7Pb45OQkRgt3gH9P26SYQ6OMoSFlad9ObB4fXd7u5eZWxhWZDsWsnV/VJWVHMs
         KwVAWoR/cGOcSUpj26mw9lT25rOdREOFCf5wQtWKFY8xOLj8d/LuoeWqwHoQAkP0nrO7
         Eqqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O5WsSDYc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be82ad9sor135916635ad.15.2025.05.07.16.46.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:46:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O5WsSDYc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661613; x=1747266413; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jg06Y7bf5KiymTc5nVCG7BgUS7AMOOtDTvF6y7Zvpa0=;
        b=O5WsSDYc6F6D4Vv4xsyWoagXeAeP0sxK10Z4bt5PEkORQyf9hNGNkQ1QO+fxnAV22V
         qkdl22qJ6tvgB7INJshYLh9yb+9X/Yrlww9uMVYYoetxDOxzUcMbT3EXhk8T7qpbZBvr
         UCVGImdfvlztnpRXZMHyWJ7kgAbCfVjpVi3QOBqFDZcneg415bpgLdsiYAeMAvqkmSXL
         kWHuPvOEKZlKgQXQzHQEW2NFj5OxL+PFDjzuXrCnpXyFHqfSOKOWZavW4lZGh95qFWYc
         qfSmnaL/AYBkd4z7xXYjV/1hTbLuwXS+lh9h3heCHT+B/y8G9cJ8nr9E3GWEfUTek/q/
         nLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661613; x=1747266413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jg06Y7bf5KiymTc5nVCG7BgUS7AMOOtDTvF6y7Zvpa0=;
        b=Ff6NaD9d8+Lv9Dr0biOXYk8SWeHcSfdYTMoS0XQg/hlE6ypJhkWWqtRTDtArPC1PGs
         bWPKubwI6n858mDBgG0gchID4+hnKKWYF+6QTVMezRUd8PBpQHayAQGV8F3+kKAfr8q9
         Vdk3lAvvuzRoRAZE+IHD05heoD3bSchoeaqu2Pf+SCAFP+IpncqoVdkoig3jfmkObb05
         mIJXvNSMBCzYahVciZAKCg54OaGJrOPtzofETey9IXBhTup1jS7ddrUnMlU4Tyn4mCFN
         4x76t0J/sfFsIo7yoHo98VM9CDVw/hetdxwseicqT7poKCqiqYHg0UjBabzQkvq6HgNE
         L/Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWTrvd6arMAk+zNlCgQYdLf/JslhTN77OcAOEGS+f6F88rvw9gxJ/4+68W4p82RKbiXL2ZoO82FB/jdRg==@linaro.org
X-Gm-Message-State: AOJu0YwUhl1WS7P+ZSdg97ticWphX4dDa3Evz4GGLaTe6Plr2yGRtGHF
	lNTQmusUQzBmro5GB7lDg+V2HmdsHNfHXyXE1oZ7Wh/LWgyWzEXZ7d3/2tkybFinf3G6IhwUJi+
	DXXIbcFWr
X-Gm-Gg: ASbGncvc2hRN/LXHSMSATssktsmBxBDZePxadrb7uhT7sDZLD8wdq15rz9cALwIPQIt
	MP/8H8JlrFmgUsyB5n6yT+SpLaESJ30M6KyPM2MUdII3g9E6w5GYQAxRuU0VUczYi8fCgiXEV28
	tBoO4gXrCRu0bFKUh8FfOLZIKEYVMXmT2oguphBEhrkMh3+B4EA4OFicdba9CaRDmLmcLqoNP1B
	w3Xhp/NTqG1gyG1IgoNdnOU+uenuL1CBm8uAAAZQ0xfyDPuYGSzEFmKc4vAGz8pBmQAFctXCp93
	qiZP/x5EZ+mYRwH8ywVM8w7VPo1sPOvRE8p1JG2Y
X-Google-Smtp-Source: AGHT+IFx3IqBq3BMdslXcG7H1lDPhBPcNhNXcmyld4UJ174Kiz0M4FVxecE3zmVfYGRR5gVd3aFm3Q==
X-Received: by 2002:a17:902:e38a:b0:22e:634b:14cd with SMTP id d9443c01a7336-22e634b171emr48243855ad.39.1746661613583;
        Wed, 07 May 2025 16:46:53 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm100792435ad.62.2025.05.07.16.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:46:53 -0700 (PDT)
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
Subject: [PATCH v7 42/49] target/arm/tcg/hflags: compile file twice (system, user)
Date: Wed,  7 May 2025 16:42:33 -0700
Message-ID: <20250507234241.957746-43-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: MG3/qJsDQU5P

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/hflags.c    | 4 +++-
 target/arm/tcg/meson.build | 8 +++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index fd407a7b28e..1ccec63bbd4 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -9,11 +9,13 @@
 #include "cpu.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "exec/helper-proto.h"
 #include "exec/translation-block.h"
 #include "accel/tcg/cpu-ops.h"
 #include "cpregs.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 static inline bool fgt_svc(CPUARMState *env, int el)
 {
     /*
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 2f73eefe383..cee00b24cda 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -30,7 +30,6 @@ arm_ss.add(files(
   'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
-  'hflags.c',
   'iwmmxt_helper.c',
   'm_helper.c',
   'mve_helper.c',
@@ -66,3 +65,10 @@ arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
 arm_common_ss.add(files(
   'crypto_helper.c',
 ))
+
+arm_common_system_ss.add(files(
+  'hflags.c',
+))
+arm_user_ss.add(files(
+  'hflags.c',
+))
-- 
2.47.2
