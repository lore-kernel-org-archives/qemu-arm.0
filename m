Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756801njj;
        Sat, 3 May 2025 22:31:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVeQTDhrdBWqrYZno2oaYir884Z77FZDCFbh+Tgcc0pwbaww+6uu5uNuTdt4wAL6ssKmHPH1OrDInvkWg==@linaro.org
X-Received: by 2002:a17:902:cf41:b0:21f:6a36:7bf3 with SMTP id d9443c01a7336-22e1e8dc050mr50582065ad.12.1746336583353;
        Sat, 03 May 2025 22:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336583; cv=none;
        d=google.com; s=arc-20240605;
        b=f2dU64Bo/xN/v0115RAy9flJvuYGYRtbTkXzN3KXAz8cZE29wBe4P7BFXGUTsmsl88
         mWOhkL6/wEwF3IDBMhh0U7dGUm4RmE6Uv6gOYt8cA4HsGTnyirqwaDZHD71hMuIDfr+x
         HyINpa16zP7YutG/tQum7ODL9tPAv4tTEfLTr/VORVWR+aYBf5RsXhyMndZbvzD3ME/B
         +ZOHpsLFWpGYpMkTC3/dWJO2HIS9vdxCScPREq8QuYCsQXS8PCICnPkpiDxOKqZsGA73
         xL0NrrfPQjRK47tdHGMKTeFWfcj5QglfJZbA29KyjA+dHAoB5FOH7JTWhGkF/uUC9eB1
         1fWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=d146Pj4KjTAmT+769pG7plO/J3O67dCMeGHKPEFKjBI=;
        fh=q7pIe/XXHvreLeiyrc+cqlr/brUoElvq5SaRI96vSA8=;
        b=LV4Ii0azmPjDY/fJ22yXPMrXbADLo4aFDSLzvCE7Ux0SEGpsIwdz8/ijf14yToXVIS
         ekMb9D2Hayn6j+Sd13oiW4fl5gPQ90n0czwcGSTluzSDRDbjwmhFvQ7ePIvuHJZZ/Fqa
         kGynMSI97ET+cLKu7naUYKiX8AkRWVeq4zQgJqcE1v7NhvaKuAqt/LvYtFgjyw2GhlCK
         BY7M+xM269TTa04E+fJAdPvJrAM8a/bkzl/HiPkS6UyR04L8kIiSjGitbraN/javqoHk
         sacmVGwIHJIzdVCLu77NWLAhJkoSF/56tgP52WObIRjoy6FyvRfnbAtHrKpoI0WKtJWr
         QA+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c+noz1Jk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb1fd20sor37093955ad.10.2025.05.03.22.29.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c+noz1Jk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336583; x=1746941383; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d146Pj4KjTAmT+769pG7plO/J3O67dCMeGHKPEFKjBI=;
        b=c+noz1JkNspQ69FTh7jtIt7qqY5gF4nW3Pf0DjV/A2xbjAFltd8ccmiyleheVBxYw3
         1a9ggzcn3XcIhsWpU/r3JdftQ0foCzEFZ5NktYO7pNetva3ZNyH53M+GdLU5J+3XegLD
         8D0QhyexbiI+j6msdtZKk52Req0XPgg8ng8vbvUNNQkGP8cmh0laVEqqVfzzeXoBS1rA
         k0EJG9WNqfT0k/wlBDTRSi4UxdOSkjhiZ5GMJ6EzbQ4QCYX3lamj4KPiBuYZV+vbBO4Y
         HcSMe2w/fCaIZmNImhWQOcdmgWPTqW1tTD83XsVXpIWSpn2WE98i4qzoem/vTfOSZtkk
         q9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336583; x=1746941383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d146Pj4KjTAmT+769pG7plO/J3O67dCMeGHKPEFKjBI=;
        b=HAgq9MgShp7Vnca45qJXKsjSrP5j+FnEEt4pIVGwF/BaNCC3DBhM5I4bz/OYlkp7E5
         +2Fcgu2JK7C8+4w0BJ6x42wXEEyZhSK/iLIFukUNUrlOWVGSQkLORm9nVdjAfTOuwHns
         dqR/8/KZ/ZZcSlbgfFUMUtY0jjArm1e1utN3Wkm5Xfqfoq7rUdx0t+Lbg5GxcEaTyhYw
         D9CK+va2z+6XkrUtYmzepRowBRax9lWjHtB/Mfy+mbD4ww2C0khpGcixah+DtDdgairV
         7T/HRv61ifQbqUKSoJqkQDf058tyyu1w6Q86YEZHvtOmn23fepc8xEbY6aPQglifUQyR
         UVRA==
X-Forwarded-Encrypted: i=1; AJvYcCVgCyaUx/HNuY7tYdVZb0RlryFs760SeuyJZpnBerSOOMYlaeF/ymoKEEP6A0wu6ToX8VwF3OAPg+5sLg==@linaro.org
X-Gm-Message-State: AOJu0Ywe551D6JEJUqUMfMst3BwO8jC1ARANCnttMUOrb4HjLSLIProC
	PRqVj8lEPuOhzqDHXyf9p/kUyLV2UfdYJdQbaRSVd3QbIrSXV5ljFUyAWZ5JMxXUb+WOvGk+q6f
	+4b/9mA==
X-Gm-Gg: ASbGnct2JfZcURjb5vEQVO7vChowzcr/8Ik8wUhIF2uo/Zpq9fuFZXVmnGwgczBkOCa
	XaXluztFSsiDz2nsSDRCEq3j9ZdiD2J4hpKNi6bXdHHF38czxRZISHl13BL9tTXjfA/nhW9MT+9
	AGpAiE/8txm7cpbs/TpRErZ/VlQ4MQCDRMDFurE1SEwGuwFw8MyZaBhN/I3Z9x+mpYS3+8NJaUM
	grnvoV1/iaPQDh6N8dJi344tfhVPpmaBcsxHr64TSOtMy2YRTqyoxJfEruMtyEqAUp1MCIj7rLJ
	ert5UVH8tAdK7GtxOPFpGeUG2+dOGIXLYSaeS6/9
X-Google-Smtp-Source: AGHT+IHuftjvx8K+lKIONTdQb5rUxohknLqdDXqhEx93QHw1TFnNfxBlVnv/CW1cZSPZujSKICoonw==
X-Received: by 2002:a17:902:d2d2:b0:220:fe51:1aab with SMTP id d9443c01a7336-22e1ea4c3c3mr50378075ad.38.1746336582911;
        Sat, 03 May 2025 22:29:42 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:42 -0700 (PDT)
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
Subject: [PATCH v4 26/40] target/arm/vfp_fpscr: compile file twice (user, system)
Date: Sat,  3 May 2025 22:29:00 -0700
Message-ID: <20250504052914.3525365-27-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bHhsKKjecYWO

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
