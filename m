Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94293njb;
        Wed, 7 May 2025 16:42:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaVdPC1osFovstH6o0PUkaKfo9ri84ta/6sdAvYFW9Cl/o7O7dw8eWYcs1bJnFg0IYj6a9WxonxKd6rw==@linaro.org
X-Received: by 2002:a17:902:e48b:b0:22e:627f:ebc9 with SMTP id d9443c01a7336-22e627ff09fmr50249365ad.3.1746661374108;
        Wed, 07 May 2025 16:42:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661374; cv=none;
        d=google.com; s=arc-20240605;
        b=hl1zHx2FUxI44/Ss7UwGQXcZoDW3S0ndkjm3M2OrIPDChpxKCqLqHfNZGh6CW7a5Ah
         K3EpFncdyTtr1OOOXuwmpEUujtOUyG/rJOAEadQuutxYzW4CWnJhGYu0SNsvbDdNfSfE
         Yjmx091y+rnhZHfqbp2h5BA0IXLILHL1ivzBgqzAniAos6VnFccch3cL2TdbAZQtBc5f
         GCPdgojh8+6ES4qIzL5TgIMbkdBXgv8x6Ku1mJDrda1OgIxJJWSNLmygbvyDSR6uDwHo
         DpqGfYgmiXRZp2XWi8GE6LBkoppeS8Y9JYTgzFJNw9rE3jTrDTalGDHr2epRbxDFQFEi
         0Ing==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        fh=zs//KyXGwISm4ZLsFVJq4ZvLM8MJfRYbd5DfiRf7kC0=;
        b=gkkH8jl7ddHwdknGIuMhENPH/+SqcrdBJrVACOMAZvyMwwLfjD8B03Igaym3mnZQa9
         y2ew9MO4UH24xCZkPrf1NM/6p2u1LcUDXL9dj9wO92r6a7euSVDm5NkT7Jtd51GVCQU2
         sMyMh+l9PeOSc8BlSST+fVO/XwnVxp1PZsOQqGPaPbHw4tj4KuOKcQOyNzhxJbP1J//T
         8P++hYUEZlLojc/gNzPMFoMShJJkatWshgna43sju+r87TRY1tUpOUc0mebcU16cJsKC
         dNVrERYqvkzMONng13jsxOZ7JLUzX7QORi/LKdrvo8s8u9IDFS1RPaV81L8dbQcVletU
         yAaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v46j8pgK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc88bd5sor54947595ad.11.2025.05.07.16.42.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:42:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v46j8pgK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661374; x=1747266174; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        b=v46j8pgKah0Cz8m1EW58WkXzpTfv/gURZ511aEcCVvhWpU0LtwpCfTu711uxjmUd5z
         7yAZdsfa9WQbd8dTnF+cucuyaCgIMAPMpmXkfeOETNurZmNRrEoTdujWIPz8im6tK+tz
         zdP4gOeOcTllVKuqhgb4+J/HEIsEMIwBWdxOOI8YhQ8onuVecmC+R5DoIqPRvpoYcDLs
         wjki1nDQPiYxaIsGvueC163umw6Dq2LM8rPev7Onf8Y5zW74HM3n2hL//czFr65XB257
         PcYNRQPNOfmCmXiwbZ9OvS791aXG5AVrgb/+pQygwx7ZSQjUF5y3ryxJ+WYPdezc2cja
         iTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661374; x=1747266174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        b=CKeqhCz1eCXaSf2/B9HYGqNKKfdhpzTfDYi4VZNC5Mz3FZr31CzRtLpcToqm1L9EPC
         v4Reh0/S9yC68z6qF1rCuwKElOJfA1RX9dY1JJKZ5X9pXxL2b/ChT/3ENUu3CCPY1KKQ
         he9NdMnnxmzc2QHyCPmn7M5qHy4r8zpUA5RTOEDuaTTly0NKIYzPrxa7V0nwctXEGpCS
         BBM9PqgPDPG3oH10mdTiyKrsXJf+KciyhT8E2wCu3xuKHHTzyHNxaVJKzZy3VE/0/Fr5
         wDpEo9YL5pvcvn60y2q8FuYynHmtEfiP2uia349KijnD/FmfDWxCynjpk/tZjME+MiO3
         dtCw==
X-Forwarded-Encrypted: i=1; AJvYcCVq/wsSQ2bSVr1GuK2dGPEtTWj0lEHmSQFsbFGFw5h8rDuRh6ltW0iYRy7lo2PSRQwmR11cSonmkCtfRA==@linaro.org
X-Gm-Message-State: AOJu0YwFPcvtzQYw7id40kFpmQ0jq3lc2b7Clibt25ommRcUZFb5C4M7
	5HwbxUYAdWCIlpSTYr2oZoAFjo3cG0Ackpwa49tG1cdSnRL49hht6bdheo7u7GXefw==
X-Gm-Gg: ASbGncvuYBHakOgJkR+y3N1TtTHE6H4lUHaMGo87CHmdFZhX57thdkSCc+EAiSAj5+7
	yLL/l92TzFwjYeO4i488cpxKRL2RFLE6Msba3+J/dvEHNQjt7VAU7Ren3mPrVt7OJ/z99YGTRjD
	tmGbsbBiHuGUZpkxsdExxxM6JCi4QN5a6+g5HlwoTwEPhinwz6oo6OVB49dZD8I1R8gZiM+pjBF
	h5Xv5W/ff86SoGA3Ne4aTZGx7czo55nPYhu5LfNtK4QRUonxsDDyxUOOggXIjBJwAfbT49kMl7H
	eSzKHuuS9FXDrlvrBGO8PJO1ok8WHBXgkgsaJo8Z
X-Google-Smtp-Source: AGHT+IE1rBPDLrD6YLcWU3G7gZr3FdqQdmTaG8RZa7lQY5J0VPLlZx24DjvL1QOATkDhsEsdcxhtug==
X-Received: by 2002:a17:90b:278e:b0:30a:2173:9f0b with SMTP id 98e67ed59e1d1-30aac290fe1mr8070966a91.28.1746661373761;
        Wed, 07 May 2025 16:42:53 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:53 -0700 (PDT)
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
Subject: [PATCH v7 12/49] target/arm/cpu32-stubs.c: compile file twice (user, system)
Date: Wed,  7 May 2025 16:42:03 -0700
Message-ID: <20250507234241.957746-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: v8u0uWIW9qs5

It could be squashed with commit introducing it, but I would prefer to
introduce target/arm/cpu.c first.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 89e305eb56a..de214fe5d56 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -11,13 +11,9 @@ arm_ss.add(zlib)
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
 arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
-arm_ss.add(when: 'TARGET_AARCH64',
-  if_true: files(
-    'cpu64.c',
-    'gdbstub64.c'),
-  if_false: files(
-    'cpu32-stubs.c'),
-)
+arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'cpu64.c',
+  'gdbstub64.c'))
 
 arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
@@ -32,8 +28,12 @@ arm_system_ss.add(files(
 
 arm_user_ss = ss.source_set()
 arm_user_ss.add(files('cpu.c'))
+arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
+  'cpu32-stubs.c'))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
+arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
+  'cpu32-stubs.c'))
 
 subdir('hvf')
 
-- 
2.47.2
