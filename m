Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp43015njb;
        Mon, 12 May 2025 11:05:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWF4CI4sbq+r9+7kK56l1sve7HpLD8L0KX/4WIXmW+ed5wpByEw7rHZXVtx+XW21+8xzLYZQWW8Fi6Kow==@linaro.org
X-Received: by 2002:a17:902:d507:b0:22d:b2c9:7fd7 with SMTP id d9443c01a7336-22fc8b7945amr205414745ad.21.1747073146025;
        Mon, 12 May 2025 11:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073146; cv=none;
        d=google.com; s=arc-20240605;
        b=aCEaBd7Y/PKkM+DBb1cP6XsH+V2GPpklNG5oirJkxwGNN2E5rD/gWPfLpGa0H0FGlE
         Hy00C/YKnfLxO/J++Y9YTbnUOgIZ7GBmYHAD0Q3ozuNnGT/2nmlqjm5r4ax02R9N9nPU
         s5/3PI3WQmiwZKxzhObymtRI7eiR3mDhzZouER5K52SBWpXkl4N+uwSbJKXwB35SB0K/
         3irqtSu/WPMiKODHy5moStwv1F0d65HnmYYQjJNSYrE2RBQDDkxzMZsivhTz0Mm7gYoB
         I8bokY4bCySdwr2dvsuQ5hBQ+1v76DsXIe0C1SJ6vyi3Vy+GU/2KqN1spr19EwyJhEBA
         Hqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=F6rvyCptpZZum3a3XLfgy4KbKHlT47oeB0wfjegrLwc=;
        fh=hgSpA4gaNncHHUzQvuKLTyapfLC6RLkMrqApF4E1908=;
        b=eyYqIfT6UeiQ777EkkA24d+pCyUmFbq+V8KOAS2DjsM5urouzP2dvLQFccN/6IiVZi
         RXKISXY4bXklD9I8phi+b5L4WqBDFAr4SoSdm+BGJ30vxbU7Jgw5Fq5P+MczC+ZrmzpY
         WzFKJVvQAVz41B+vp06QJTljJG9O7Ay0m7oTtJLWkv2MPDlAiTyurT+GDHDg6hhMXsSn
         h8a+hx9Omc5J2oJwWBL3xL1JFvlvLvSjBpcRtoIo29/ca5SwX4ZQOhSlFnrPgtTUh82U
         sedHOveFyyzR7BZEB06H19toZx6T4o6BOgtP4V0UcQp30VBS8mtO6wZNO5Dy/0pd8far
         keqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FN34mKhY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc58298dasor74802785ad.4.2025.05.12.11.05.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FN34mKhY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073145; x=1747677945; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6rvyCptpZZum3a3XLfgy4KbKHlT47oeB0wfjegrLwc=;
        b=FN34mKhYga95lPtt9/5OW4QRC5g0gk9v/koKBpVDq2MYRqBB5+hIJ9fKfs7pYGf2sI
         GUXEpw+KdD/3X6fJ65BRVhIYC2jQ7aTTUTc8NccVEWaDAoHuiZVG628QRi8IGwqg1E7a
         ukBdljbKDFQwlooDSqqHGifbFVn2EjRLrmtw5muf4a4Y/e4Igg8JLRH0JtyBH3+qDl8y
         C/KlrQUm82D0kdXbD+CXxiFCKnwGYL1r20b5NV95V3lT5Hf0fx6huzhnBdB3ZLgS8e+V
         9g+ts4QJ9HbwXIUVIgKxEb6A9kR4MGfceukAy9GvBbvMj//Zsj3twom3d8Wy5XOHhJdF
         1rsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073145; x=1747677945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6rvyCptpZZum3a3XLfgy4KbKHlT47oeB0wfjegrLwc=;
        b=qOZlC0HSLuy+mA7hAi8BAbaY0DDUWKnClZAeiKBxr0rIHMJEvJH/rj9YCIUxeoy8Zo
         DLnPwjoxh9gGlCKxaIOvxiiyxuXvEOOBgJE7ICZ0zXg4X7GTyBcIHnP5YCug6M1ehahV
         NX2ly6ry0iQccSsMvrYfcdFM2nDLpoJPNZFFbcdr9z4pOzXcrrLB0Bjb1kNiH0VwLTcF
         nyM/zF4DPtnS4GHUFEDMxwlNyeYI0VwUCSGkEGEULfcdxtk6eeU6do1tRxR1PueTA5xS
         kTPxJcYyQ15c+q4I2KtRCphgqEJZANSIsatqFcv1wwxbZ32ZvQKb6njQMN/qvGFfv6dM
         RORQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYf3QYbJ2iFIb8XV0Q6MmPS9ZZqkH++tT0W5w2N6qqzN+vkjH3JmxWbY/fbS8LyjK1udDk81r1/5iEIw==@linaro.org
X-Gm-Message-State: AOJu0Yyqb2UeK+cRwJZ0oRqaKfg/JStbRQyrO1VtPwMIOkt9niCSxmHa
	xdE85KMNV9f2Py+EOjEhz/5avRBZeRhRTunFkhK3LuGqTW+8JOnld8xWMG7TKG9xfg==
X-Gm-Gg: ASbGncuT8w0CKDaAYKY7RcSvuK7Q3Hg7/wC+4mBkddT6jRsku+2Dp7Uq7UXj6NOBs+7
	mdhAAS9fi/HgzfNzD2Hx+4O1CDYSw7uLtJfL+96/E76LiHp3cbte2cv7LVThmG1RwKbNSMsSm8b
	dznaC0w/Cjgkisz1u5RYNNskZqFp3C5K4cMGApcESabeoToWaW/YtcVJ1Ud4F7LR0qA0nnIdxX6
	ku709lh/TTF9hBwRkcXyMFT+MIMDJatA7QOFMABUttYvJMFCsV/uwX94gSx+HEGZ1KHqSler9ZN
	C9f7cNGtmRKK+4zL/op82PvIY95aPzDt3VVxNxiHUubpuPpHcm8=
X-Google-Smtp-Source: AGHT+IEQctetiUpc2QcOpW5CX99/3QsW0wYbokv3zI/2EZN1Or1hGsYawLA4NLCdijZxTZnCyTjjAQ==
X-Received: by 2002:a17:903:244c:b0:223:52fc:a15a with SMTP id d9443c01a7336-22fc91a1e42mr167593605ad.33.1747073145620;
        Mon, 12 May 2025 11:05:45 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:45 -0700 (PDT)
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
Subject: [PATCH v8 38/48] target/arm/machine: compile file once (system)
Date: Mon, 12 May 2025 11:04:52 -0700
Message-ID: <20250512180502.2395029-39-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: C+04vId7Uj1I

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index bb1c09676d5..b404fa54863 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -13,7 +13,6 @@ arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arm-qmp-cmds.c',
-  'machine.c',
 ))
 arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
 arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
@@ -39,6 +38,7 @@ arm_common_system_ss.add(files(
   'cortex-regs.c',
   'debug_helper.c',
   'helper.c',
+  'machine.c',
   'ptw.c',
   'vfp_fpscr.c',
 ))
-- 
2.47.2
