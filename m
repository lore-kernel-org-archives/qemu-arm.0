Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178837njj;
        Sun, 4 May 2025 18:52:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCP053Ck4R1V4romLmZAZ5UZ4xrUPxil4Vz3qaU7BHmgVFTR4kLoEgftAgnE+a3ZrFKM+3uV4MhTPgLg==@linaro.org
X-Received: by 2002:a05:6a00:2a0e:b0:73c:c11:b42e with SMTP id d2e1a72fcca58-74067439837mr11109135b3a.20.1746409971474;
        Sun, 04 May 2025 18:52:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409971; cv=none;
        d=google.com; s=arc-20240605;
        b=RAO6CgMTvOaGTBtV0gmpFN6gxnHXfSlxfqmgdEQYi7vUPc24vIwmxgPpszx4jqbbyj
         AflwtJlXwz/3+MBpujWrw0qdU3nubgmmotkyqgS2XHa8oiXx1+yWTEhUH3wmOLq1NDFo
         9F7cbC0mD3Do4txJpHxghtO0i9nSZhIb0ebCJHxAWA6ibMeVtL0BXzwhK5ThfaoUEbkP
         o9p2mum7pd95zhG1clxmMwwtB+NNPj/84qxZsIUyDe+NtHscJ4Y8D2lcCGyT6WOn3VEe
         Xb/WhTzfBMHLudCTXVCvNot425uR6tiY6tnfn7vJDopjGJsoBwtHHD1vo+DeK90DVS4R
         gttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4DYtSZEbP1atLGb677pRK4UuiMz1CYlbqC5aWBJkLTc=;
        fh=jE88GqnPlhWdT7z0kNOmH7I4/bHAun2rmMbi2Lb+hKs=;
        b=UZZWm/ZW960Xo0gCM+2FzTCQ0ZtgijdYYfeTULndfcKxY+Npsk8jIihDPU2pQ1qu57
         0hxwVL6oAPYtjKJ4f3MoDUO1o9h9TWV6W+bJei0RFsjC6ypSpp0NWdDpPAPAcRbpDrGK
         MMMRUrqJkqyp6UqEG4kjLfua4M7xdHVC8mSBsV1+ONfA9jUqoFrV/SBDk5bPBU/ApkP/
         wEI+/66BWx69Qd9aQhCarxfdem1CAf5GLDF5ceRNxWzEQv2AoQO4cg5a1AClQdmJ25tb
         rK47nZ2p+WoL3xzI0DJPmchPrwygpJewcfoqFWaM25cFRN8z5YWC2xE2PxBSflRbZh3/
         B4ow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xwA8hKOc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9ed8e7sor6161545b3a.8.2025.05.04.18.52.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xwA8hKOc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409971; x=1747014771; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DYtSZEbP1atLGb677pRK4UuiMz1CYlbqC5aWBJkLTc=;
        b=xwA8hKOcov0QgPsk5p1hagz1Ho3zfZRbGm54IB0a5XjnSdfV5GSKpzJY6/gvqOexlw
         bVC3wtSDuw9XAa9yoH8qTxPuzvGrI52DYBD46jahbAIUUXtfuN8+xgKER4Hof6O0nnQG
         K/pyOyWrlQJuFYc0eADF/41qqdPAzRX4BzIXIbesRaz2Gr2IST+qi2O3sPNXLti89aaU
         miCpSQZ9PG2MIA+t5zdCaZn7vhAe8zUwuOIxrss48yobPQDrwAb/I26P0e3cl3pRX3po
         r3oRv8IhL1N7FhmR5rFXzFyWmk6sjJbD6hC9q7HwKArutDKC7KIJA/M9RjMXOC8mhgu2
         fG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409971; x=1747014771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DYtSZEbP1atLGb677pRK4UuiMz1CYlbqC5aWBJkLTc=;
        b=KK3iMwsv+PKFIjiF1LKeqAJ8u74heW6OEUmQXWCjb8vgAHDbmhTc5c93Hn+qqK3G2A
         GU7hZ+tn44ylUZf4wC7iWyfCdVdnMmSwI9Q1pve15As8/foBw7pu1Xzo3LYYvv8F9yPw
         9ecbMn4fo79LV2rLux64Tkd+dEa6/J9IxTuMAKBgFmKnd/oGM2e+gF7tEbIoWonWIn8Q
         fSIPNbe/CSie3Ob/l3a7LoPPxg62FdQC0IHLke42l8TBw1i7ooRscACCsEV0Jdh59EoC
         JdOGJ8UQ7HZ9mfMkix2cQQBsi+EOrYpteq6PcSeqby3FPcXdVTbtTXdJxmkMr/QnouFI
         ZuNw==
X-Forwarded-Encrypted: i=1; AJvYcCUxOa9QdPjASUCpjH920egSJP5tziwNLlYbjqNPfSdqeH6bcHtCIqzIlregoyt62c+i/eWZnzLfuXIsXA==@linaro.org
X-Gm-Message-State: AOJu0YzvTFuMAuqaLWT2xcKp+Y4AVfZSrcqMTWbGnB2jKRr5B/Y7lTw/
	+O2ub7b1rse+hqaENzK4xnOrTMGynzVLtcVC4Fv9SBaSr++8KZbIwL+0vXJmOlxHsZ5WbagH48y
	saf65Pg==
X-Gm-Gg: ASbGncskfWcZVmkVmhdyCMtqQJHye1tuQZMzoOlvG0a42nKXHdbWQ6/kDJe3k6KI9Ls
	2vc/H9v27nR+AMnrgfmRNrrXGdDY7AsUnhvgLLLZtb4aX/BTpffCxELCTgSk5y33FW8Ogp7JjYO
	QxxFj2/lp+rbME/2KPv104cukgBjliOzEoUI12QmhUkjnFxhQRbVLjs/oX9P2MybKCzDExEhQ8Q
	9TvguKXlcxHlNBmFZvr0ADv0HnEJfBEoX+n6mN3mw9BcMWIGcYU8VbJBQrpgyO95qYcdMJnu/aE
	UJrxftaa/anSzapTtaFqVt5ogN4thdJoeVQcwYD7
X-Google-Smtp-Source: AGHT+IGVarzG9+Ft7iZTh+BmJpw4oNqMHWcxpYoJIe/50d6p1PE5Wrx6QUAXleCla+pHMM66eQdcWg==
X-Received: by 2002:a05:6a20:87aa:b0:20f:953c:fb57 with SMTP id adf61e73a8af0-20f953cfbf2mr2868991637.42.1746409971130;
        Sun, 04 May 2025 18:52:51 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:50 -0700 (PDT)
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
Subject: [PATCH v5 25/48] target/arm/helper: compile file twice (user, system)
Date: Sun,  4 May 2025 18:52:00 -0700
Message-ID: <20250505015223.3895275-26-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vnu4CGARY7T0

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 48a6bf59353..c8c80c3f969 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -2,7 +2,6 @@ arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(files(
   'gdbstub.c',
-  'helper.c',
   'vfp_fpscr.c',
 ))
 arm_ss.add(zlib)
@@ -32,6 +31,7 @@ arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
 ))
 arm_user_ss.add(files(
   'debug_helper.c',
+  'helper.c',
 ))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
@@ -39,6 +39,7 @@ arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(files(
   'debug_helper.c',
+  'helper.c',
 ))
 
 subdir('hvf')
-- 
2.47.2
