Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp252462njc;
        Thu, 19 Jun 2025 06:13:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdoiuCW/Nl6oIU+sTJLBv/xEcWNLd3jyTruiYQp0ZSuY+a//pyYrIJhKYLkL7l8gcVBOaKTyJFQIx6ug==@linaro.org
X-Received: by 2002:a5d:5c84:0:b0:3a5:3e64:1ac4 with SMTP id ffacd0b85a97d-3a5723a2742mr18195480f8f.33.1750338809239;
        Thu, 19 Jun 2025 06:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338809; cv=none;
        d=google.com; s=arc-20240605;
        b=egsCpxO4h4M8UA4szA5AaaCEITXOawYyJH4TlBcEWEezkIulwE8p5cHaEtoBZgavgI
         tMBCJYYIhrvEJL9HfKDjI+95FL3dqktfJFnlDBctInl3eyBQ5RnDwqdHmszFPWzuR2AS
         mf7ZOc0cAIkMduZKZNRFihd92kZy/Fg4gURKP8JAYIAb0XXKeOE8FvmwBvQwcw0RMILf
         tkXoxtqQ9isO9y3YMmgr9scTbvfwP2sm3FC9Y7iDUdc4B/X35RTWvMLZO+gbZSe8tZ7W
         /t5H4la+kW2PqZqaTwOj33jzdvD0kOpMMkZqHYO0XmfmFvErfEZv3MWY8tFQNzSYMGuh
         4YAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2Ev+863iqOIDDV0R/dWNRsZfcIc6LEpbTT/XvBynDLs=;
        fh=xbQ/8+bnFI5KMy+sKblQymNskZ05fZXkFaXpJLZo45U=;
        b=LieRTz/Ubu6P/0+Xb6mNbFGT1PNXq+irRlNEkMLurJ9YJNt/n3xyRld1R0BotYPahq
         JrUgbymUY0PZ+tSfEuCj3HdmEilMPk6YF0SL+UZcoRcGVnWUM4N+4owMt28yAMrC8+Hr
         03Zb9ZIatEAL0SnF2a8Anjq8X779WS7PpPQruTE0I7V9w73vTXZS77+SqUVZRn+kvHVk
         T6VRdIi1LVvE5N43ogVQFxy6Q1PWc9d+kRvoMcK/hygACJT1OBEhkLe0sP/RP6OZbBFb
         40Qnezxj9+bEFrMEg0OL34jkI0TnMrPnbRasYWP1etbQXhj+75x9cBBx3VD5TSfbZzJL
         fwUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=StxbCgto;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4532da3600csor73287565e9.4.2025.06.19.06.13.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:13:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=StxbCgto;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338809; x=1750943609; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ev+863iqOIDDV0R/dWNRsZfcIc6LEpbTT/XvBynDLs=;
        b=StxbCgtoaD3uCjl3O1CCY94IbKp5axklDjE0RpIFPKWxvb/+Oxon+S2Gxi8NO52ex3
         LBb28XySlX1WBq0bwbjhJ92Y2O+3azXVNAgIGVqaPcw5uEr4FnQa0aNqwcZ0uGNxeesx
         a+OzRxOtLEC0SYk5aySyqVMi7htqwNVkbAM98zu/xJbneBRMtO7s+mMt9EcQHSG3jbMj
         bd0idPqcorwuJwM2qtYE+VUk3MXjibO1JjaBKxAWW32xc96Wz63h4PxKgvfgv4NxjVna
         H0yEqeLf5Ob/xF5r/4I7nDYpTwfcGQswfIaadg0+8mfi7v+Fb6a01ldyc06faUOboj2J
         XT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338809; x=1750943609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Ev+863iqOIDDV0R/dWNRsZfcIc6LEpbTT/XvBynDLs=;
        b=OCRlUz6+2w/oW24CoAtBgvJ1IbYBLvFP5pQftjyO4/SVzi2b9SnZLRAX1+MTHju2mL
         TBpnnGeZMGxhWDLFA1d939PFJNTFWkYw/cKTOdtl8kTJBYGJm9IIebUN50RcllT6eOUg
         Rd8E7ycZ+hVmbR3G8+qtHQNbff7Mtcb7fDVE0bf38kjuMweIZ5NODuqW2ii1KxbK5bZn
         HjrLUSQsNyJawHLdFLlN25uhZPGYWr1IeYxKIREgbzRGnv8BiCqOk9DJyZ8V7aIy0U9U
         gUmnsQ6lTARLwu7UIq6sYF/MESzPH1E/kxMfPYOaLD1XCbGR3VbMeJEFfoF8fQuiLQqo
         5Jtg==
X-Forwarded-Encrypted: i=1; AJvYcCWwdOrPhrzUlAD72TMU2IwObsfxsHrShkunWqPqNPpWLn1y0G0qH9DESIyvC6gC6Wm5FsB8XqWgv1Qq8Q==@linaro.org
X-Gm-Message-State: AOJu0Yx49A+OhxI0DMp1tvkI9D+xVvGcLjUJ+jQz4TTiRobXmGzBuIvi
	6W2ocL1OBY6oXE4BJWtsC9poFC2LiTl7wX8B0Ftm+Z9b8O0z5K4QguZaW5ARYcmcgDoDoA==
X-Gm-Gg: ASbGncsQYsdXy6a0t9hMIkU2GZWf0pQkRlLr/DQpX8qUCPpAWHRBY/P2+hQYHg3jXL6
	+jdGI9isk5Y41MRb1CEZgwog2p298P4iZsa+C92VoqYfdfbzSiinLHURD4Yc54abxgbi/FL0NX2
	LEqkkuKy4Pz/lfLIFDrNOc1bXV2wIJ98Tix3zNrbAoDNqB0e5IGiT92erRRVJg1LdJkzqjOPmNS
	K2CbihbagR99roRcVrJUcdZfFZfsp+CP/kEPkOdp9CSBsiL+hY6fr4odZxbETozoHxEhVOwU+cj
	Xvf51AawPC+RLQmbtlrQlHpmc3pDUzOQWQLaPzz2HS059Q0v4TAqAYTKxqViAJCfvVXeTagrl2R
	EeGBB5UZ4Ic03VtzzuyZw6Y7zFBiqqFmrLHYhBW5gfsB6LsM=
X-Google-Smtp-Source: AGHT+IFkouH7GB8jjz46Cjjpk91VPjUcSA7l4wGoEJYpu2Gq89Z3Iw8lW1b02HE7V1gEJ16AcP6NmQ==
X-Received: by 2002:a05:6000:4284:b0:3a4:eb7a:2cda with SMTP id ffacd0b85a97d-3a5723a2c2fmr15063840f8f.30.1750338808615;
        Thu, 19 Jun 2025 06:13:28 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5896356eesm7143238f8f.49.2025.06.19.06.13.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:13:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Julian Armistead <julian.armistead@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 01/20] target/arm: Remove arm_handle_psci_call() stub
Date: Thu, 19 Jun 2025 15:13:00 +0200
Message-ID: <20250619131319.47301-2-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xVywZuSf8v+7

Since commit 0c1aaa66c24 ("target/arm: wrap psci call with
tcg_enabled") the arm_handle_psci_call() call is elided
when TCG is disabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3360de9150f..5ed25d33208 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -650,16 +650,12 @@ static inline bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
 {
     return false;
 }
-static inline void arm_handle_psci_call(ARMCPU *cpu)
-{
-    g_assert_not_reached();
-}
 #else
 /* Return true if the r0/x0 value indicates that this SMC/HVC is a PSCI call. */
 bool arm_is_psci_call(ARMCPU *cpu, int excp_type);
+#endif
 /* Actually handle a PSCI call */
 void arm_handle_psci_call(ARMCPU *cpu);
-#endif
 
 /**
  * arm_clear_exclusive: clear the exclusive monitor
-- 
2.49.0
