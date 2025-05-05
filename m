Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2179868njj;
        Sun, 4 May 2025 18:56:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOJ6ENfO45GStIiX7RDKFwj8b2irqYFcbc5iDTzUm2TJ6gH5HWAmYOd5f0evxmsTo6ceK0zkaBnvUZXQ==@linaro.org
X-Received: by 2002:a17:90b:55c5:b0:2ee:bc7b:9237 with SMTP id 98e67ed59e1d1-30a4e6238fcmr16497844a91.27.1746410185652;
        Sun, 04 May 2025 18:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746410185; cv=none;
        d=google.com; s=arc-20240605;
        b=kPV6QcQ/e3E7UZxNxIsxCyJ8hwbDd050wFdp34ERD9KYJ87NLEI1CjeC0QgZ0Ymv7y
         frls54X5rzxqqfdrnTWbQw/wHSWV5YZFjSgP43KHEL39Ui8chOwiwt+oNt8XGViX6lHU
         R6yKieRvoUvsHjKAAsKcP7cg8WWcf/cHtwpMtcigSKgN76EG1bqGqwzssRUDqE3YWf0A
         pnd94RgqmwPesLL26fm65XL19ApiIBNY0gLTi9ichDgJAHvNy/IKzSQp980/Cq0r+Ozw
         S499SIWQT/vkyWRGb21eJIsuI7ACjyNW4hTpPd8DwSWUx80inxuS4/3MUbuMp+6XNTfx
         hj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3FxyL5xQTQeKYw4fbOUfGUh6DzvIDzEt1jfdRlnRDo0=;
        fh=opb1ZDK9vLfdyw08sSaxjNiXwZeXP1z+IWK5iWmf/Xo=;
        b=Rv0bPx+R+PlanupNxwpqQe6g44iyrqUH2vr17PuVWCy/JveNeJbbSBpHcmPKYbqIRT
         YHBzp2H5rKlCNaNhbMbdVaN0z76UrtUlZbNCgZwDOwGkvdLgq9B6XzUecRlmpRr+2YvT
         nJW+uJK0zr3z8Rzqbqg0EjZUrXGKQFmCbBXEw5eUJDdE9k+Aevuu1HC8i3wtx362dv5t
         OzvcUc81VIi0kuxpaJ06HBooAOzyr3ULZ/iTLQMNQDyIVBFA23UjLjF84IKCK0pxCMXK
         ZLtDxxe15UVbS+lFFhZLzUnFmB9JFlP6Ez+uF8ZyQ8Gu7u7mUR0Oo/AAzLHbVJ6tGtOB
         KI6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p0V1l3jD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc7e606sor42142545ad.12.2025.05.04.18.56.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:56:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p0V1l3jD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746410185; x=1747014985; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FxyL5xQTQeKYw4fbOUfGUh6DzvIDzEt1jfdRlnRDo0=;
        b=p0V1l3jD4UNhayusDJtuxLgMwK3PmIQBdte2daJt8l8qyCS3j3ARzdSBUVHeLztCh9
         arxsGMMQzBbl8kj4U3q74GYjkryGwwQADwhblxjnKnEUCr3s7QA+oNC4Y9o03bRlEI9T
         Jh1hotmZsTh5IRVOt5RXfbMhlU5ynFKfBgyBbR6JixJKmcOl8qtpUrfH700IaKpR2Qxu
         Jd0uKEcS3kiy6jvFG075EjKWwGit9C1k/YteX35mI3y18HcKTgNQZVLcm5+DS3v8NylW
         AJ73muGLV1U0FWtJEXijGJVrHMQmke0K/7xapAIOURF7JsshvAI40BwfD4/IdNarYhpV
         Nj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746410185; x=1747014985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FxyL5xQTQeKYw4fbOUfGUh6DzvIDzEt1jfdRlnRDo0=;
        b=eZzteL0/ENWKj9penahVES2/E0fl00/HUqHpudaUMtr/SK1nO4C/9U1DkladSzqhIt
         /QTwhA/oUqb+aMaKl53qhb7Nqc4T9sLYrmNfjd+HjBaLB8WHCBsJyfqb9ICSLp6x/QQh
         NYj8bh/Xvxqw/mJ+aym+ZTM66dj8p2QoJoT+d6M/pgBCRCUuDLyVNBVnoUdgYZ6l1oMy
         zqUMm7p/4rp6zawYYwuq/6k2+OLvdBeowOOT+BF4EsT0ySyLqM2WLQP+HHiXPY1csHcH
         /Z85Fquj8GNmOamSVUl9z3+TEY8hWj5by02CISQvcl2fYvwvziGxt184WR9D08GrYxJ4
         pi9g==
X-Forwarded-Encrypted: i=1; AJvYcCWFSk9wwAsIQbdkqWbO8rhE1XH6VNKW/Gf1cLNqtSrAl9q2YgaWJnPF+UWBEQtvhGpppZYkv45uHiwlpQ==@linaro.org
X-Gm-Message-State: AOJu0Ywx8Mbhl41Mhsi0/3sTEV/x8x12JR/yIn7HDUqWMkbh3Md22tC6
	BUPgujtQFKVEdW0J5aDr8CVyphkAsSjKsE4DeuxV4FFU4lwBRhJolxMqzBNCPRM3Ng==
X-Gm-Gg: ASbGncv+tvhLB5IyNyXDxbeBWITHu9tkySat+c0t4x+caH4fxQ47oKZzOF5exWT7XOK
	3ZlauDqXroIiu5GYwU6wiJKoOYgm4EeZPn60SNLGgJewxr6/bFFMnimUUOv5NBfXDmwTyEoCTx7
	H9SFDG+OU8v0Aj9t3fz/lV9VEGNFDnAY1R1igZ6ytHztM5vgPoBuE/KGMOBopRtiiM30yi0cAlD
	CUO2xHiEqZ1xMKf7lYYgwux1SbeObF62M5rF2R5krRG2U0EYFw+q3iJ7U4HTXo0GVN0G/sKE/4H
	aWWqFJar3eNHkyEFTsFcwhbJ/BDW9jA0Wsu/68G6
X-Google-Smtp-Source: AGHT+IF08gkZkIRf18bKpe+h6dy7sLRJNTB7MMLMd8vtQdIpHc8Bzf6wKZHpeIbs8t/snEv3ZsWcRA==
X-Received: by 2002:a17:90b:586e:b0:2ee:6d08:7936 with SMTP id 98e67ed59e1d1-30a4e5c5ed2mr16612751a91.20.1746410185269;
        Sun, 04 May 2025 18:56:25 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47640279sm7516495a91.44.2025.05.04.18.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:56:24 -0700 (PDT)
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
Subject: [PATCH v5 41/48] target/arm/tcg/crypto_helper: compile file twice (system, user)
Date: Sun,  4 May 2025 18:52:16 -0700
Message-ID: <20250505015223.3895275-42-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: JRvdRLksmbTP

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 4 +++-
 target/arm/tcg/meson.build     | 8 +++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index 7cadd61e124..ca14bd17a58 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -12,12 +12,14 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
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
index dd12ccedb18..e3be0eb22b2 100644
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
@@ -63,3 +62,10 @@ arm_system_ss.add(files(
 
 arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
+
+arm_common_system_ss.add(files(
+  'crypto_helper.c',
+))
+arm_user_ss.add(files(
+  'crypto_helper.c',
+))
-- 
2.47.2
