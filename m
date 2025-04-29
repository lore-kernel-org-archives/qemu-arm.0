Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp23044njm;
        Mon, 28 Apr 2025 22:00:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWm7OfqXn+gVqVWyvVwSIoA/PX5kkCn3lLx+O8aMhKotk3mZXB7maM6MHEjzAK+BCu+OFE4ms+terPdEg==@linaro.org
X-Received: by 2002:a17:902:ef0b:b0:220:cd9f:a180 with SMTP id d9443c01a7336-22de70a316fmr26132485ad.53.1745902828678;
        Mon, 28 Apr 2025 22:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745902828; cv=none;
        d=google.com; s=arc-20240605;
        b=Ilhfb8C2OqK7HuJWyPmZBnzHD64O5olrSiUHi1jy0iinaqSgpty9Iflk3Jfw4GBf3Z
         BDdGh99QlrSthCvxbQuQXxvFnKAePrF0IW9PkEYCLacfjQO1diaWtJ4yhm7VDj+PSnpc
         jR8KHiS/yvKquZsS7561lm1TyvTjFOnCxyJkb6qUYs7+wxQsSLlbEhnaocAAMykWlaGd
         dbuDgJwodYxT1cqQTJHIMSmq+u7nNdE6fW8aJapHynqiJlphlGrvJ2A9zsdfku+q21mx
         He5BnvLc+rdMP50rz68lvlqn1Z8KSkReSJL/ZZdDb4K1fxOuyY0TStkecT6vxbQGF+GA
         YE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ihSbjG4MVG/rPWJxnirZVcYWQR5uI9SkbcEMwpHCSZo=;
        fh=7Wcz4Xf/r8eDlV6Rnks3CxyNig1SbT8KW2Q3EPkXmGw=;
        b=BK9PMky4TOFVOomXqXNFtujsGsnvxKFzNYq2CTRn8vlvTP0N1vIxZCuLPdgObOklc2
         vTXgnXqd9Mmxu4v4BwdJV6B5i3P6ioHumFkTUDGqEcTSiH5I0tzFg+m5EPMd/2oLzSN3
         XrAhUQPHGqOMxWxR17DQbj9AeepEDbigjMvQFZWLheL8VIT90tGb+9cnOLsK/I5RluN8
         c39LOFiQ3ZfttSSDuknITUIb9oXNcp15NCTUmUy0+M0EyT88wueNHrl3ccmyicsDWR9y
         jnSKJ60X+t8lpx5fwBIVzMKoHcARJPjKoked4jU2EgBkl1TdgBlaN/Ds08m8db7Hh1Hh
         AWzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dshrWOS4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db50f8dacsor78343845ad.11.2025.04.28.22.00.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 22:00:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dshrWOS4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745902828; x=1746507628; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihSbjG4MVG/rPWJxnirZVcYWQR5uI9SkbcEMwpHCSZo=;
        b=dshrWOS4z4jwIkyOBM4rysblvQOV3ipBSBEy8F/fmASoDlatTUmRo5O5VanSeZXQtr
         VeQAHz/Us9YArZG3A0F4W6rTgMrXwrcYjzbAViHfRb3U7P6vDyD8qj0D2eSHhbA0bJHL
         tlSBSHwE2QyC3ExqPwjxDknTz+sbd9r38FBmhkH9RsqtgRGtv7ZMHdscA5zM/M4fy4aj
         90jcz4TTX8riAPMHhfDL6rHk4aRFGmZ4pFe+jKLzwOOjnDUZo0EThvOuW3KEgE0U6S7l
         8p0tRTBN0cdYkyUKDuKfvLW962Ox57oAZjcfga4b0NA+8BwD+vPH3rVOOv8imfOFS0+7
         UAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902828; x=1746507628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihSbjG4MVG/rPWJxnirZVcYWQR5uI9SkbcEMwpHCSZo=;
        b=gfDOvrGSzF/omRD+WBlG++1F5T6e1eEm5aw4N868arYFQ1UJZJavCrw0a39kaSZJAT
         3UqP7re4EyCFYlsXLsu6e6VwBA3qTEhXH2VO7KICVxWRNWjfih8HjezhyYQLlxM92lzS
         PgrW/swtj6rupr7TtQt7W0lqf+4fPT+CUt3PmT7oxuy6oHoI0xSmzLjbf8Ky8pc3R+Yv
         jFQbGZF+swoRynrZ97MxyepZ1aM9acSH0sO2bIyxXWuge/p4/ZLNr7T46mOVGA0oWmUg
         Dmg4GTfiUZ1koDOff+SDShckcaKBURqkaiQE5tHCdkk7zA/heRdZ0Ha270EEtp+G34lF
         MmYA==
X-Forwarded-Encrypted: i=1; AJvYcCU7wwKK975zJo4Ra8aSISipEvIsLBm1Hcv9Ql/MBsWUbrhfz6EkgiwS+nbMKGoOWun/XQLL/rgsI/LlXA==@linaro.org
X-Gm-Message-State: AOJu0YyLvbPUYLOTpAWTQKJHOg44hykqd0DpM/wySr0IodtKSkiBzfr1
	MnhU2EV+kkLqqW9+L1kqYtQS96CAXtyQFF09KpOCIuw1B96CpqZHIw8hV8aHXz6+NBq6hb6bMGv
	kcQE=
X-Gm-Gg: ASbGncuH1/Pi5nF2Zzqa7wSIjnPAbEu92VBX4dHyjZSgtBHgc6s1Oi0v/gHMRSbMUkg
	Fsdh2AuW/XqA2055yYkz8AONkVJ9NxAGtXvB2fLtmwltR0yfJZ6rsRB9+dQJNpLQoxRci/lkAqx
	AZg6IWUzutsSqghzxzxQNga99/dYXPNWKlsgJSqOIliwWYTbTOYdt4OCcE1pppGe1++EdDjbPcS
	4ONdu6yQERKsOPspfYsBIS4L/VIvyAptvn17wXqdAEjMk9QCKOcHkD9AIHUF8v2InlAcOFNg1Kd
	gMELuBQ2n348orkx4YIvMwDu70WP87Syey0r9VZj
X-Google-Smtp-Source: AGHT+IEKl36/YxFSXyEEI7I6vw/C5AE7dte38/aDWx18O4SHf3AWwMBIzGuoDNMnlOWkHNEFDjArGA==
X-Received: by 2002:a17:902:cec7:b0:210:fce4:11ec with SMTP id d9443c01a7336-22de700725emr25054985ad.1.1745902827904;
        Mon, 28 Apr 2025 22:00:27 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm93004015ad.76.2025.04.28.22.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 22:00:27 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	richard.henderson@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 13/13] target/arm/cpu32-stubs.c: compile file twice (user, system)
Date: Mon, 28 Apr 2025 22:00:10 -0700
Message-ID: <20250429050010.971128-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: RwcmmuZxVMDj

It could be squashed with commit introducing it, but I would prefer to
introduce target/arm/cpu.c first.

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
