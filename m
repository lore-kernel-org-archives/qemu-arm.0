Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778306njj;
        Mon, 5 May 2025 16:20:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqOKnK/1dyNnXJO4BqYRdjAuQvotmKjmLtKh6UvnrAoaeDvpAs/ayLx+Y+eS2JOJAn6tHom94cA7Pm0Q==@linaro.org
X-Received: by 2002:a17:90b:2f44:b0:2ff:6e58:89f5 with SMTP id 98e67ed59e1d1-30a7badfeaamr1832710a91.6.1746487244101;
        Mon, 05 May 2025 16:20:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487244; cv=none;
        d=google.com; s=arc-20240605;
        b=SSrL408t6Flw+M1XwWzW5JsyfaY5enfbrK+MIq/Gh6YmBX44MjZtw15GDgj5vlpVym
         DgiK+Cv6xmk4/x+q7DyUtCERhhCQVJOQ4sJQdxgyWBGQKXSah8cTCv4OzLfC9Fc1HOmj
         rlgxBaa5Cj+On4bkp0d4e5R9PIJ4rCGqBAaXTEoFoRg8O0/sM8ki+a+orIEj9GPdHlNv
         mGO8ZnqMXRJqQHUudX6/xndzyFf5+LCiHXdbdQJNzwpUEPA8ETy/Ty8hwHr0MLl6Ua1h
         QenblzdQCiHeNtx80CXHcgI/H4ZLpO0wqSYak4NfGr0wCT/6f1jEDX+qs0M9Kenoh8QZ
         VrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=d146Pj4KjTAmT+769pG7plO/J3O67dCMeGHKPEFKjBI=;
        fh=Dt3cp4kpWAyZpHK1O4G0LTf+eCM9u3yv3tkIqCv7uCs=;
        b=ZpwTQioefXay1NYrRGB+egLhda2ensK5WftYWKmh8iErSnC9oj+fr5PsAA4l0JAnj3
         qImnlYdW19D5qmgi8saL7zhLo9JoyJJodeKP/4Ig7djbMdliis8HGtxEj2BdWpzUXp5e
         rmPTTFdrfKKfWCQwjbQJ6g9nr4woqFp5QntPfuz6juc/2PheQLXjdBUrbZU3ZQtpHPO1
         A+sbR67vhfVbRaWzTSY/MEY8hXV8HQuvcAcBqvaB8/DgXoxZtlE9MGoldBV+Vm7DZqKU
         r9+QXYkkSb8+5PmGyUBEZ/vfTfvMlxCGJu4Jen/rKrD7YKq9MJavrTcMovTrWSM2W/SQ
         M4tA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dc2p+nKz;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc6d899sor49556435ad.7.2025.05.05.16.20.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dc2p+nKz;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487244; x=1747092044; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d146Pj4KjTAmT+769pG7plO/J3O67dCMeGHKPEFKjBI=;
        b=dc2p+nKzyx0ZYsD22AgStScwxbABdm7UJ1mdMHLZFz4KZON40gIvnfjUMP0peLVTP0
         JgaRp6FmjrZFNbww8wh99pwvRhZ1UwLudTVxVgyezCRJB52YjYKy5ZX9wBSV0GFJf9Q/
         aeYlnL9O2TjSmV5C8SrBbHM0O/CQHKpbDJNugL7LiTN/cOyC2q5cC9ZSj+MF6q7RQgIT
         Vp0y05TZDOLHCewTS2sDCZ9JocaqUWTAm0Tk2MGWyqHAAI6e7mOZxOVejB9kvEKrHTBO
         RSDCwJ0RCamKLAjwTqNb86m/TScDHdZeeFKicr6rpfo2BvgUOj0GIc9iajBmWZgKQwhl
         ej7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487244; x=1747092044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d146Pj4KjTAmT+769pG7plO/J3O67dCMeGHKPEFKjBI=;
        b=RstwGk3rQTnyI/vbkOT7MGvehnoRUYV3TMpErSi6Gp+F9IY0FtgvLPAP79VKfPBro1
         WkVDodeJu9GcTRxmU0CVqxKfrHPqTulZtz4lU9qYY1+tqc1QsxmKvYnVrrQUcrbtnkLo
         7ZiU2ZKMjyvn9EPEKhbSvZoYfe/sobWpCRk5oX4fXLSpou0NNcdmH50ztq/0k16eU+RL
         Mhpv9ybTNKa8cyf3reAtyrUz61rDrNDeXymh8fmZmtj8gF139VaX2TuT2QnV+OTL/DbZ
         vj7S9yBHjmh8X+rvJnUSCSx024DU41MaP/QlRk9Mhw95kXSwaeBiSkDgL2yo+MS+z7Ef
         TBYg==
X-Forwarded-Encrypted: i=1; AJvYcCWpySqzkpAHVWq+EatDxXRh6MDdbunK4S80iax7E0WkCt/2yPypK+8f2P05+dzO46yO44L+sNtdXU4BvQ==@linaro.org
X-Gm-Message-State: AOJu0YzcxcpZ4jULX115kzbZKQVNiy3uMbeV66Y+c9EU8EkmuTafuSbY
	aiozIHuHU1zEO606gx3QasV6h0Jn09Yv8SyvNRzO0QVE6349C4wKJFq8llJdHS/dnA==
X-Gm-Gg: ASbGncvDTMnTc9XWrNjY8oSN21XruNrOI361DSPAAZKKzxKyG9ylFT5+jAW/22Mo3w/
	jDJCRpklHTNlJY0XbLOkqDGJQKy14kIEELDP+/CS7/aO6Gi7QGHg6T7WffAHWhIGbj8laf+Gwqi
	wT5yAdZ2zRGDAj7871pdl4M0+S467XpZooQRWZglzQb1Sg9Phhelt/JRHPgwVqO8xAS8i0DLBKd
	awhnJgyMHylUpO9z4o2Vg6XWozQvmQoS06Ce0u+Q3FuF1GMsoqVSvRYNpIWRJibg/HOQGy2Vhrb
	mb9W0zvj3u6fDxs1hwlLS/Wwdl7nupB+tFYAF+XH
X-Google-Smtp-Source: AGHT+IHCV1/1mp/qT4IZJkCFBwSLPw5Wv839QyIwwKaT5xti1xiNSDzwuFxBUCyW4d3HFhph5x25Xg==
X-Received: by 2002:a17:902:f68e:b0:223:3eed:f680 with SMTP id d9443c01a7336-22e3285f33dmr15966585ad.18.1746487243719;
        Mon, 05 May 2025 16:20:43 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:43 -0700 (PDT)
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
Subject: [PATCH v6 26/50] target/arm/vfp_fpscr: compile file twice (user, system)
Date: Mon,  5 May 2025 16:19:51 -0700
Message-ID: <20250505232015.130990-27-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0VzgnsQH/TSd

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
