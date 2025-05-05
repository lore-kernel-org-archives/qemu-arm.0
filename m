Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2779764njj;
        Mon, 5 May 2025 16:24:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6dC8fksI5bgNyMtRftxPJLGk3OiNI1lU8Vt6q7shSvuzHsxSs7OL3Ecz/SgDfTmD329Ehl9GhI5oMXQ==@linaro.org
X-Received: by 2002:a17:902:db09:b0:21f:45d:21fb with SMTP id d9443c01a7336-22e328bab37mr15297835ad.3.1746487450461;
        Mon, 05 May 2025 16:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487450; cv=none;
        d=google.com; s=arc-20240605;
        b=dTndQlryzWMuBBl8w6K81TBtGHzjtq03qDUYwOuvaWKWvD9bydj5LR9EolGfbG8/Im
         d32g6X6H/6MXjXnrf4fSk/VbcfkfgYYASCh3/tHA+M1i+iuPQCZpBSjkwP6O0ZVK6jaO
         GrmGZlEApwfRPjI8Y+nHRN5NwbAlqA3b1BWbTNjZhbQ3eelzq9i+abUwzxG0fey0rwwQ
         n11PZfhrDeCZirbKVfnC6+xgTOeQXfJwwvkRs2rOtxRtBw612miveImhWP/USy4lS0Tp
         YF/SuAKFPCjwq2EVpr9WwLrEfLS743vmHWzy5f45tXErRD1SXGwsYXbRJrCeFZDazsh5
         +Qtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qOUfFrwLeRqpVBNih8GreOXz04iy2wn0t5LFbPNHip4=;
        fh=UEkkfLcaBiEpyq1R3UtMo6Zmp4YCZMG3SkGf1nuKwv4=;
        b=CKdWG/nX0/y5fyi5t4TcDqAAv3dMhA1uqZ7WsLQyaEmaAJusGjtfIgoF2WmPgdBQjZ
         DHLLNrlQN9+C1OIKkpvdfzgvpk/tDWu2e03g0DLvfE1LkW64RcR1kT2sX3nPzLwJlwIv
         MRGSWXKsSo1n5IzMcC5gqej7giPxiLxEnUUf6B+yNzh32uoqG/SWkTSX1t4EoyjUSq2x
         Y9MOSSr2Auh8fH6add9gtCko/wfIPN+RLudljtAhdbB3L8dCGik7ZnKNyq9mR5ohShu4
         AN2SwDskAM2OV8/tQbHLZ3N+gOPxlVPWr6CCWS3YSRqacms4lf+CH94H1hwGm9IffHtY
         7scA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZWtVWR8L;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb0f53csor59363225ad.6.2025.05.05.16.24.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:24:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZWtVWR8L;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487450; x=1747092250; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOUfFrwLeRqpVBNih8GreOXz04iy2wn0t5LFbPNHip4=;
        b=ZWtVWR8LiBOLF/8Hxu5+8FPgOQW41k2rPImlmnou+MgCtLMSFR3sFM6+gR9DQuLfD/
         5C63AcSUDuXxFhe6zgOZv/hfmiK2+x0OIacHdr/O8wiCknJbnFFRC8b8+n6R+pk9MW1q
         BBeaDaNwHF1DKZ5W3rz4Ina6dHCWNgepvms1gITS4gxdP5lCdKKVyhxxmNlQU/SLS7fy
         8Mefyf2n2OGzOGhuVHjRlb6Vxc27pVSNoo+dqVWJZfybxHO059NHitMoPxolaLnN79pk
         FSPyySVHsbkzmLYR4cm0ATY/4K0P98w0DMEn5lXNBWiG46qAC8SmtfC9V/8ysX68SAMK
         PhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487450; x=1747092250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOUfFrwLeRqpVBNih8GreOXz04iy2wn0t5LFbPNHip4=;
        b=Uiwkg2f5+s5JgSRt9nu2u9bBzqfIlNAfynr4HTXPhC2BdbEFyYD/u/kEpm+Exvg++4
         h2fOeprwXKLpCz+7YfEFTHBJUQd+V7Ia+1W3bA/Nqa7FxHK/psMtqAEQrrNsOe/RwpMF
         cGdMePoWqrGCYFVXgdQdBNJcemmvjzSo8p1BEE+/xxTXiXhd18RqpH8WDe0cAyxgvH6t
         ZLog6MZmtq0DqYKE0UUL33jFJbDCEqjHSKpYCtoBmuF2z8xhKdhQChcpLfzNyaGrYJcY
         FJAlhInBNXxFgZ4gvV6Vqiz3SwujmLwGrTxaS3KaQtnXdIrx3xRLarhvHcsj5JJd25uD
         xlXg==
X-Forwarded-Encrypted: i=1; AJvYcCUoJJKruAy7TJ08WtZFeku9FaHt6SCTaR/3uuPcmpFwY6TF+A8oZVpGIAzbqAvkpundHpgDBrkPbx/XrQ==@linaro.org
X-Gm-Message-State: AOJu0YxHx04rz+Tl9oAkYIVqv9Q2lIRq47QLHZ0v2+qEdBc/QAsNE0R6
	4bQRc9ZTHaVJwrm5i8n1SpNiJf5HL1Vh8xZYQ1FRObtc2JKoPmHKTOfA3Fn0FVP1xg==
X-Gm-Gg: ASbGncuMZts4ixbL80DeQ/G6n0oR489llv9V4GOzyGgQYDnbEkDpu/Jzy3CtcDHwEbs
	S158SlI9sANTFKeNgzw7pashIo8vJpO83J9T8NgMtPylszxEoZMQWVG2hV0XgkFFHmF3OV/pNHc
	L0uCtNQ9Y9/Xm/LCjujju4xfgYYvJ7ES3jwDyJCHrpWivGPCAqqHm9W3qHXYZEVhgMasLsG/ht5
	B39I5u1NpwCyGQPVH/TKlHQSYogr7828thi/VUsXaJOHYpYoy1lD0k+o3UHQbHOA7xrGlO8yclz
	fR7wbXJ/6XhHGGxhWDfoMig3PfBej8h3w3HDzcbW
X-Google-Smtp-Source: AGHT+IGrHHd6JwKe4CB3ehPMic8Dfrp4H+VJC4ilP9lT2i332N5/mNnvyzxXdEJSk1HP47igUbZz7w==
X-Received: by 2002:a17:903:1107:b0:21f:6546:9af0 with SMTP id d9443c01a7336-22e33112daemr17025355ad.44.1746487449971;
        Mon, 05 May 2025 16:24:09 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e16348edasm58705265ad.28.2025.05.05.16.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:24:09 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 42/50] target/arm/tcg/crypto_helper: compile file once
Date: Mon,  5 May 2025 16:20:07 -0700
Message-ID: <20250505232015.130990-43-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: o22ksmsCB+Yt

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
