Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756728njj;
        Sat, 3 May 2025 22:31:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGlZPb+0nt19Fak2SZJjVf50E587NpeIo/NX23CTiHzG2FH2xr316sMlypfHgIkK7IDewwAPv+FVuBfg==@linaro.org
X-Received: by 2002:a17:902:cf42:b0:227:e709:f71 with SMTP id d9443c01a7336-22e1ea822aemr51178475ad.29.1746336586147;
        Sat, 03 May 2025 22:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336586; cv=none;
        d=google.com; s=arc-20240605;
        b=a96YITMS7snr2xSIN9Uhy/vZOOwc7zpyWMsGEs4nZxJdQnUBjeakFbppCM8zaeVzuF
         w5vojKeytUAdA3IBU8nSs0fm8BhiYf4ickOiS4AvAQ555breey6+RX57z7J/UWEp3Ta1
         wP8AA8LXv0bgtkJZg0kW6+KkBM3+x+BW9HCSBVyIIkAJ6LxvCG/8PrTSTfBgGWF+3Snx
         JIb0oLm1ccIlt5EMXZVkWHeBco5gqlq55Unn2K+D0TczzoxIpOm1dSqvy3+xtELypzMF
         zGnYuFYxeWTKQoPZu7SvgWrDZlVyVKYfSaH8UiDz6ynHaQalOrlxYCCc1hjcoqkUCMcB
         EeGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SeLT1f95/cGbe62bYfKMrzmzjdSaQ72IuCLuyv7ztwQ=;
        fh=DHcavqDLzr074cCmK5AStAz4xqTllhm2Krn/aLHwTs8=;
        b=MV0fujAK5uMKsECl3DkACLfaax+lNN4xTHiL5Pm3YhSIqGy7Mj5/MLRaaJjibHMVl1
         IsdKpfpFeiIhdpJE8yRnXaFgvsnBdQvmisWEvGxr0dzKZ9E+NG4wiFDLDHrTIlzCBu9O
         UVYEZASFz18/WAEgaDV6NfZEcMzHR6t9deuDXMCRTMS211yc/CjdbLgI6zKbud8TPo/f
         aKxD+FO4cwHoUSE7sWDl8VyDyt0xYw44MYw5QGPahnuXrySGgqi7OloKBWP6+qOdSGxn
         HuSumjwMF+UojR+i76I45yN1D54h/upJi/68enmLmfvMqIc5UgGo8f3b+myLcU/oTd57
         PhEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZjF1TNBB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be7c3f3sor54101245ad.12.2025.05.03.22.29.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZjF1TNBB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336586; x=1746941386; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeLT1f95/cGbe62bYfKMrzmzjdSaQ72IuCLuyv7ztwQ=;
        b=ZjF1TNBBJ2CD2w3VhS02nXtAXD4UpZGj07l1dq/lcWUVPLXlPBJFWKSqJB61Q3BFh6
         Z6L5sJ1eSN0l4TpZfqU1u3LEftj5IG7gX80zllDnmkIrfFlOgXD7eekjBripYoL4flcZ
         OOM21m14O/kFzmQilWbos8l6HvLxSWkfJWrsvNt0ZhJ6upgeN8kGaQ+dMmuMsQaC4WfO
         xAzE3PxNw2w7sV/mCYRFwLjic0Otfp5d6vG6BEsVAL1tfJPbL5H/yLVbiV4butXlkcXI
         /pQJCnLQPTlwlMN6N/0bB/+6xeCWfRYyh4CvLi0+1FVm0YKb3o+iU+JRcprKGl6XDCbj
         GfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336586; x=1746941386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SeLT1f95/cGbe62bYfKMrzmzjdSaQ72IuCLuyv7ztwQ=;
        b=dN8VizfOZ/kbI7wwTu/OTXOrTLoQSg1C2nPWXDS/tTjDz8RbQkM73H1yS8++V3lvui
         1LypBIiH07mEp3oyIyqComh0bgbkJMn0Jcad1PDr8Jfm+wEbpEwbtTCJUOgKEgB9OpzG
         XdxmonjuGh1a6m2D1GcQGxYtvHKTr/6a/cKFDHvcI4eauzrG0ZBTg4URAgqO64WzB6r/
         Z791Ppt6MSURsN6GpUHml+wVyqY886CPrDx/cKevQi8YSleXKM3qBKZFJhC5nM53w5pe
         hw7SZk2s1a6rR/r3wtMrrZmau/P9nYQFc4VL9WUs58oeeM7Sqot6jkPO3ox9FuO6ddM1
         QbrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxldCvKfOCJZcr0kIuGva2bPPpmtCVU7u/1Qi7jSLVEIW04dL7+km+9Uncqj4hptt7JGBYk1iu2GnBkg==@linaro.org
X-Gm-Message-State: AOJu0Yxt9qur8nOOA8T31/+47VwqyHSDpELAICszoIAwKRTLRJa76jEW
	rlMeVnKBz8M0KCDuhtmUEJ9aeXCXP78m/AnqTm475AFRXndgOtdjzMpzMUkUReWyAg==
X-Gm-Gg: ASbGncuQDdG4nHh7GXtl4kLehIeH3OWrW391FTwGhMvEhFRBL5u4wNJ/b+2cG8VEdcX
	2s7ojkoPW0zu6O6Bf/lXylW8BAQN9ncuLdjTDpuZSMvT+UoRuNTtIQpI/5bxhfJynvlJdEyUImD
	sao+rTdVwqDIlmhJ4hsrJoIWFKmore8wnrMgReyNMg3yS/+tKaoGUgX0xiufoL5aShtBY5pA4nM
	3yNrMdSmsgQjj8iDTpNhQ7un4F7oWNcXEvhkH+slDJaUy2zdknJwUHlZYpBUWotYXacA7QaTLIG
	o/eU2E48pR+v0PPWvSWWjdadyOs4+/AqAe7jFqHw
X-Google-Smtp-Source: AGHT+IG3YwhSYkIrQWb9joOE66utyaPWKSvpqKpUrI0Qe6pFy1DfaUaoK33eaJpaAdCqsfCzd4IiYQ==
X-Received: by 2002:a17:902:c947:b0:225:ac99:ae0f with SMTP id d9443c01a7336-22e1e8ebb30mr45072365ad.1.1746336585772;
        Sat, 03 May 2025 22:29:45 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:45 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 29/40] target/arm/arm-powerctl: compile file once (system)
Date: Sat,  3 May 2025 22:29:03 -0700
Message-ID: <20250504052914.3525365-30-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: aL4pnsigfz2R

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 95a2b077dd6..7db573f4a97 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -15,7 +15,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
 arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
-  'arm-powerctl.c',
   'arm-qmp-cmds.c',
   'cortex-regs.c',
   'machine.c',
@@ -38,6 +37,7 @@ arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(files(
   'arch_dump.c',
+  'arm-powerctl.c',
   'debug_helper.c',
   'helper.c',
   'vfp_fpscr.c',
-- 
2.47.2
