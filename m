Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94391njb;
        Wed, 7 May 2025 16:43:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcz63O8nJJBoCCTbQkT8cL/RTfSCIVFwCKT/B6FJhn0PvYuiEJOwzKzf25Z0quZvSG+YY33pyMxr0EZw==@linaro.org
X-Received: by 2002:a17:902:e888:b0:22e:5e70:b2d3 with SMTP id d9443c01a7336-22e5ea42275mr79480205ad.1.1746661387086;
        Wed, 07 May 2025 16:43:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661387; cv=none;
        d=google.com; s=arc-20240605;
        b=YxAAcHWipHKAn82sUC87BJTTDHMOfNTxlLfgKvi3YTFimm0UXy4QEitOCMcSREvpxP
         r7mXYb+yx/gOGiFP56f93ZyxpCOtW/LESepXoOPElHR43fx5WC69n4dSpx4oXlc+R9XL
         wx1fnOMjGUUBGEe309OZxk1mE4haesyYvbVk85uBRP69/jLchoKDt9gmLJT7lvCAJXRV
         MuepIAUcCC0yvMdaELV0Po6iUwGLLIZjG0l7h3/hZPFuc2V3G5NpJy724IQLJc8H1FIa
         H4BfGeg2c9CT92IitcjSv+i2MFYavRf/Qk3lHBZG8Yv+uW05o5IlTAVGFbhjLV19XmwS
         kQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=j3Dpv/gYklKxQ6NcaNjklM8os0pkN4N34WBJsdRDY08=;
        fh=gSqUXS3ozK0k1P6LhbUkmasDz70nsKxjM0bAk8bhgyc=;
        b=GS94F4LWnStiVS/cSD/f24XkgrQjMVsKO0AmZ6UOOoflt6c9G7vdyDkZ7SEFfiBCnu
         crKIUAzMB1C2Pg61RxzkVp+HRfOJfw6XAl9MGamutmTxdbHWwiHeVy2b2acmT5M5H1ho
         f2mVSOOnfxhw4Qp/1N2Lzm8EGQdIXpI7pe5rUvOhARfpBXve0Yc7DTnSsGaVdsta/PGF
         Q+PlO55M2vBmJVqIFdjZFQkolx9boIOU2Kkj0oQi6TiSzo1r+2pJ8oFtPu6PNZ0R56XI
         aQpkqGQYW5PhCoZDN2Jj5t15g9cFMLdxsGGWPFfCuRp6DsVW1dYBuH9cAUNzd/seuktI
         XQ2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NoSlAOoh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb26cf2sor117885065ad.5.2025.05.07.16.43.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NoSlAOoh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661386; x=1747266186; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3Dpv/gYklKxQ6NcaNjklM8os0pkN4N34WBJsdRDY08=;
        b=NoSlAOohIowy7cDbKhBHxlzCCEiQiE5yhdxq9+a2kJfW30n+VE59PrMBmDigM/axuu
         flUmQpF6zgHy9z+NMcL6XF+zrDYSwXGyXFizbbw9LDd2MRxJBbqT+rTBbu65k5wOuyjA
         VMNX5zTc1OXnpodUZyK/mGQefgitpKWp0MHdhf36mA+0KsnJnAAq7Xipl2xJf6LtNq4B
         5UgCyU1xm6/bw8DAFB1lNjuDtPZ5kCjAFqgP3x9IeVYsWNBFQDG0i26ienQ5oozOybFy
         zt9PvzqxVrQNDA4T7KvX7SdPsFfYjxc+foal9ro9kz0ZXx8tZ5AoqxXs/KkpMKiG4l4i
         SUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661386; x=1747266186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3Dpv/gYklKxQ6NcaNjklM8os0pkN4N34WBJsdRDY08=;
        b=CAb7r6xGnS8xi0vss6esKs6AaN7/b3CNJyVDDx6i9ygZmpDAaZrZ5h3Fr6svgnpmwc
         QKPzaflg1+0JpQm6Y+sqmI8eNvKptTu+LoR24SyYYD1KvfnunDIIE5BGkT/iReEm+WAC
         bidNv1vy8rzlHf1bV589mZLxvyjJPv4s2IvKZeZZjmjNQkkHOjg76BSHPfaXl6aykxbK
         wGSUEX2w3ULa1tlpZZexmLcKgF6TRabblCpwqekEfTezHwhXd5iqbFpuw7aZ8+l/g+c9
         2P1Byjt7hNrAlMGPZNJbrP4jtTOhZHqRHj0XQIY08qYS2YTzM8L6BR2Dl6TF9pviKsLv
         yhwg==
X-Forwarded-Encrypted: i=1; AJvYcCWaNF6bcEj37TUEG3BdoZOeujtCQvzWFBvvujmkkx2uIit6uZnAezrIIUJFT7rhSDefNJf/bg14/bTWWA==@linaro.org
X-Gm-Message-State: AOJu0Yz/YWudXeReq3F4uvGAsA+nj6JrABiIVQixjG/2C9MgfQvlJCgo
	1IL+hou9wrml01yGggcnmzU+iUNpqOwwho5GvzksztSgtDt64ArPNhnE6r6soHPVgQ==
X-Gm-Gg: ASbGncvWkfc/JdS3F4EaTbnpWQdGAXCWfCm1uPHFwi0yD1MS/f+ookDVA8IeqS1HeUM
	BGStWf4cuQV5QzrS9CboUSRr+gFWVuGOaTVPWPud2liwuDwkMFYniVMiwPxM0ORyNylPL29GdYR
	Ah27PTCFkXyI9U3zRxbD48Zu8to/gODUoQj6j5Kpsgepkn6ng9GlQj2FTs8Q8EEU+ZFubXjv1c5
	JjOiRThBHE2/FTkJs8T3pryDFq9R/3wUHgViecLw9jaUKT7cU/Gaxj5LiDK8NOBOBfm8rfMd9ZQ
	iKRVs1OOQxcV5/IMrKGHbugqdgWBLi0JMzZDSBCoOk/qFpYKnaE=
X-Google-Smtp-Source: AGHT+IHt4tu+CujvY9eN9hIbp06QoRW/RBo9JhAAnZCE/TrHnO1sU7+xOK/Ll3Pyp9Y/rNdj63LYCw==
X-Received: by 2002:a17:903:3bb0:b0:224:1ec0:8a1a with SMTP id d9443c01a7336-22e5ee0f11bmr68096735ad.51.1746661386730;
        Wed, 07 May 2025 16:43:06 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:06 -0700 (PDT)
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
Subject: [PATCH v7 27/49] target/arm/arch_dump: compile file once (system)
Date: Wed,  7 May 2025 16:42:18 -0700
Message-ID: <20250507234241.957746-28-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: RGRsSygdVWxv

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 06d479570e2..95a2b077dd6 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -15,7 +15,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
 arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
-  'arch_dump.c',
   'arm-powerctl.c',
   'arm-qmp-cmds.c',
   'cortex-regs.c',
@@ -38,6 +37,7 @@ arm_common_system_ss.add(files('cpu.c'), capstone)
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(files(
+  'arch_dump.c',
   'debug_helper.c',
   'helper.c',
   'vfp_fpscr.c',
-- 
2.47.2
