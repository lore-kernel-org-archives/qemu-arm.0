Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178843njj;
        Sun, 4 May 2025 18:52:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW6qvu1VRDp6ojpY6ivPBIlc0O2Xd2XXMPsFvtfKnhDUTLG11RuVj0M/MVuKiN38tXepyHb+39ZfjrnYQ==@linaro.org
X-Received: by 2002:a17:902:ce88:b0:223:668d:eba9 with SMTP id d9443c01a7336-22e1e8e9d97mr95224305ad.10.1746409972480;
        Sun, 04 May 2025 18:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409972; cv=none;
        d=google.com; s=arc-20240605;
        b=TQ8cQEKzJV13r8uSRW0Wi0IvXq4UG3xa1uE5BNO3Axfz2u8q2O1NmRGLoEebS/vRww
         Mf7Soii4TuoRTkd/IQ+lkyWrP+cFSu4S7KYtiICUW/SQCbChqqNqNNb9fJltsxh1tdCy
         QQKxv1wNBdw2buPo6mToMbWXKuVMD2KF2BQ0PB2EU14rk28exzGPyphQ4pKMzH9QQFA0
         9x5sEAcGQwpUA2bk4zUjignSyDJbVaX0JC7hsoo092MPhJnIXPSlZF9SmCtWP4YKlsAP
         GQPGkUKkOxOJr88HQL9jlm2QzKAMxkx5R8Btj1TlDrUGevEGBnwqb+CH1fspCsitNKg+
         BHGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=d146Pj4KjTAmT+769pG7plO/J3O67dCMeGHKPEFKjBI=;
        fh=UuDZ2UA+feP9TOF5OcMVTJDb2vZmev984gCcRIggpzw=;
        b=j4W8VrC1LPVPHcl+NzhbTgLDeFzJttjhmbFK1hFoPotjOCHmI5IhmckFm15iqD/y9z
         oOpS6kgv215SH22YmbgbfyhfDwNCN0YIX4GCQmllkKAGiZYw/7EwHmFOx4fjlJ4NgJyx
         EQMUcKwFDjbyOy3CVbTsSeGIjN5Efgn2s3bgt9JATIYDyDoU5iN7BI1Rel3+Rsh9sBIY
         kG8FNdB/2+D5EcmEtgLqpkxFNU3Tq0INPEB2eUcroF1uA4HNMy1phFnJzjnxsU9HS6ON
         tDaGxW98aDGTA3IHB8kQi9fjCJn7StfGCptQdZ+Ryl1kdtCj6s5MaZ5N8SiK+GEP6RvT
         hFCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e+S8fKDr;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eea2ef5sor5857812b3a.1.2025.05.04.18.52.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e+S8fKDr;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409972; x=1747014772; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d146Pj4KjTAmT+769pG7plO/J3O67dCMeGHKPEFKjBI=;
        b=e+S8fKDr6ALeyJeikvrf31IZLYJ1XUU+5sEGy3BbMFQzYTppKgGxrbgExAo1q1tSUF
         oNuicUserM1gEBF4gCnuvRb3ftszVFJwOIsjobQwV1iwK4hk8P55giMVNGIELmhHcoZC
         TT6SAICwM3GwjQ6Uq8xygUyV2tSGhSR6UlklX5psFm/GSSmGJ7V1EZLSongACPq7M1zU
         xLP9OdJ0EGW5TWLuUzNLJwTAa4Vgqqm7OL07JoNlf8hloy3J0ptiq5MrpqVNm2i6+pd1
         NMgboJzSRjjB1r7HJPR94w24ypcZpACZkgJ8gmXZroLWNgoFSklDjFauKth334zcSatS
         JMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409972; x=1747014772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d146Pj4KjTAmT+769pG7plO/J3O67dCMeGHKPEFKjBI=;
        b=tt7qsIT4UDX08dTvBAsTJ6ip8lwdMCc+y1OzyVdF9Osz3yMbQgZp3m6B45tUjBo32Y
         9yN6vMfROWf6zVS4q6onCgHJPjHqEb6j3zDdB/lViTF+XO8hxpXnb2eh7jobhtuKOHl5
         fEzgA1nfKztWME3W+DzgRyzKDwGlO63djH72kd5VC/ZNpJrmzSFGTflzqeTzpI7Kd848
         zWs2boXs5ACwB795tG2qwCwgSIzJpUV9d+xBHVW+ACOWFGgIL0aKBJw2KSRB7blm2xEZ
         FWKqFHZAU5p/8wMtJHuDfasQeOEm5BGxy4El5B0KaYze+dLIEQGybgmg39Lyr/NGP6pd
         pj3g==
X-Forwarded-Encrypted: i=1; AJvYcCU3PJVVP0IYO9RZRkohN4sLF5Eq2BYXV9mubLoqOXyiJ6PEWS81NgV++3dLiwrTrODbgObbu7hLhVF2hA==@linaro.org
X-Gm-Message-State: AOJu0YwOYr03Bv3w7tcog3wZhZsje+ELqRnl2eUkJjpzAy9Dq5lGnLYJ
	jWzbLjfCbITZb7U3xh+CKjos1DwuBk02b5fWkLSZmZ+uS9Uu1eQR4PHc//ghC/OxlQ==
X-Gm-Gg: ASbGncvt7LmqHV6q3ZuAn1ROcgiXLXF/4U12cCfHov4yv+JoTUASuvWf8oraQISk0LF
	kP5IJC8nBBDVMaXV6EBwRbdJo6kKUiErSh4al8/783FR4jjy+Ix74Tr1RDzv7LBS8uf8rKNMAXA
	tIo8aQMhV/AEBOIogyNi0JZjV1wQA8AOvTsdldntdO6iX3kn/DbkTnjHQAEI/stcMmQfxTGeuKp
	4kEAQ86fgoR1B5W2qqgNNWwyCTb5OO67lRJRelQuvlf1A7/Khrhk2zzOBVasUGFWcCzk8ZExxqh
	wY7z9h8dLi7T4d2Csd0w/Ayp+qj49+8Yl4zaOvSQ
X-Google-Smtp-Source: AGHT+IGZ69sv3kczzHn3t5JXlx8OboELStxZ9BcN0YDHiBVacizLgdUVZrm/NwDxt4C9RQMegT+mlw==
X-Received: by 2002:a05:6a21:998e:b0:1f5:9431:46e7 with SMTP id adf61e73a8af0-20e97dae814mr7597572637.42.1746409972003;
        Sun, 04 May 2025 18:52:52 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:51 -0700 (PDT)
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
Subject: [PATCH v5 26/48] target/arm/vfp_fpscr: compile file twice (user, system)
Date: Sun,  4 May 2025 18:52:01 -0700
Message-ID: <20250505015223.3895275-27-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YQmP8TmNQ6rp

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index c8c80c3f969..06d479570e2 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -2,7 +2,6 @@ arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(files(
   'gdbstub.c',
-  'vfp_fpscr.c',
 ))
 arm_ss.add(zlib)
 
@@ -32,6 +31,7 @@ arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
 arm_user_ss.add(files(
   'debug_helper.c',
   'helper.c',
+  'vfp_fpscr.c',
 ))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
@@ -40,6 +40,7 @@ arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
 arm_common_system_ss.add(files(
   'debug_helper.c',
   'helper.c',
+  'vfp_fpscr.c',
 ))
 
 subdir('hvf')
-- 
2.47.2
