Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756118njj;
        Sat, 3 May 2025 22:29:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVxxbD6rabB40q2UzxOLC8AErsCq/RVFHxD0XK1tvNl6saxBLNC6DoNMTxsPng834qlklSBiGiMUFRcWg==@linaro.org
X-Received: by 2002:a17:903:3c68:b0:220:e9f5:4b7c with SMTP id d9443c01a7336-22e1e8e9dd9mr46883645ad.17.1746336571310;
        Sat, 03 May 2025 22:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336571; cv=none;
        d=google.com; s=arc-20240605;
        b=IMOGjJAngvi7goWPIUpMolzlE9JETAJ7v68X6qXvIk1tFpXlYFT1g0Ogm9uvYQccmO
         us8KZuaR7m+Lv01PAnmXVL9RFCb3lQrCxGIHhkDEGctr/xTc9SrZMUVRW9mpg3Y22vEj
         63x3jjkWMp70dO3nLcQH45sGXZ/buYVTQE4O76IKFOAvfo7MOm+TdE+leITKAQXsFHVQ
         oZ7poEVIM/wUWr/dnI7/Y5akPLC31nctjccJE5Tq4JzPPbbjwEg5eHdtsFSuK/6dASX2
         uDGC3o2rkhUCNu2zWCRoLDlTwz/dBdCP5WxuHzEum0XBa9E+uNHsri7qBezSyZxZ+32U
         o/uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=k54PyA3qe+UbX4AzHMockqDzIGWdHV1GUXIbKPo2M9I=;
        fh=ZFhx0S5LCdXrCsdaAMALlLhZ/4fzW+5bustrYyNh36E=;
        b=JqQGK1obmgacqVUarm8pA0bn88DVx8IYIFgraUiPxmZKYJUW4vsUpY27j8ub6fGRj9
         BQ1tdMKCGyBVAtiCJ6yu8uCQWWk/7mvkcfis1Gul/2cT3P3dtX1MsERi3j9yVQoOV2U0
         +gooEJHprSdcW4i/09Rdl/fqmh/TtDy5Ud8Crt7tg93lbKdj4wv1VpmpAod95ii0P6WA
         z8u81jxhUNP0QY0NRdCURuWbtjKvAyJPY5A31Uu5dB209JafT9cXQ4MWv9B2IkRVFoVv
         sVGF1Nh9xP3dxkZypVV0HxljtqVRrBzuy8JVqvqMQz/bi0iQuNMR3hxJ9r2mVKtKXAfC
         B13A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jR8ttYAD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0ba8e31fsor36252675ad.0.2025.05.03.22.29.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jR8ttYAD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336571; x=1746941371; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k54PyA3qe+UbX4AzHMockqDzIGWdHV1GUXIbKPo2M9I=;
        b=jR8ttYADk+EsjVAA3E8wlkmDIQVZRTNuVwdR7saDBcn8hL+04e3Cxjvg6ri62iSQOy
         Ui7SxrPc3MgSKC9Gguj63aAMM5IuQlSFNnFSvjyGUZqVUn77po18dP1QGiC1nFFVHnOb
         ZUaV+xPnfZm1z6VSwcol4Hn54HDWp4iGibxAkg6/TGTwbOsz/yugKIRY3sCZA1OtrDqX
         dN4/lVBm9Hgb+D5hhGJTjwXg1rayR7JrB4o3Qu+MgygfPWpOn9PsXHdQGYrz78VPXr+K
         cEMhFSfSitYJjI1fwxZSunXPtrNWWW6n4xGnN+FS2EkAnNcE4T0td9jWc37sjZ9xdGix
         8h6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336571; x=1746941371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k54PyA3qe+UbX4AzHMockqDzIGWdHV1GUXIbKPo2M9I=;
        b=riNWhmqohiAo12F0D8mSN25k16NYvvFiKjzJiPV4j4G3oBr3RXwhhnAYOR7UzcqpS3
         bvt06YrCsw/p0l+EzYCiKHJx5hJw2d8GYX+IqmC07hinUPUOEzjCuE0zdEjV+lveXQ1n
         K2YjATdGnBdkLd43IThL+hpfRuvdC+GnBznjILu9x3RMTM0hsdNxFrj9NlhF6MxYQq85
         kgX0F7R0Gdfsm2e9dCXmi/WwtObUogwoM+JpxGZpw0THzZDSPV+33imiWuSQqzyq9+ku
         UAX5/CqkAwnLcFlapxGDWot231LsFJIH2Xe8RLShirFx6iNvb5YOYMsoDAHphyA0ngXy
         FRCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbNbdcQyu1J2D8HeSai5ybo055cGZmHpY22UcoNe/27YAWolkB4PjMQg/VuwzbnnzGHDJL769qStcd6g==@linaro.org
X-Gm-Message-State: AOJu0YzHPFS+U/LZ+SWsmaZHNSaPewkhRsAz8/QS0UAPe+UrDzxz1sm6
	ZGeQHQwVESCLSP5R54nfxni/aAQLT1fD/WMSPbjfXYWfdYeBG0sV6kiue19LlYNEFw==
X-Gm-Gg: ASbGncsoYcryrOanSdzaRFLEv3K6C3khbOK2+/CX6WFQJJmFfWLfm6MG+Ae4x3pP6J3
	PA+tM2PRXKjSqfEbAsvfX2caYgJkyUZRVnNZHcLXinZ9CHMy6O3dYkFy4BZyHJxnRfGPAmF0PZd
	bF0MZjRJaay0ZjuwC9Ujo+NzTkICzlewjSi7o27qofkavclIe+H0ItuC+JLj92UXgZdotO5MazH
	540IL1Ded9/ld6xuTWCpuNPjhhH+Mwq1jwRAHxVPII0MGEVDdGL0yomDT69wnDTxasFRdjkCMLa
	E9a6qrrVRCKsOTpUftzV3cp/1BO01wicV3K0GU50V7o4FxWW0QY=
X-Google-Smtp-Source: AGHT+IFH2CPFEGOsr4zP8J4shIfyihEyvBzrlgv7YDD+ddkZeusvCH2PEX4Qs29NQDrJVY0zS9lFRw==
X-Received: by 2002:a17:902:f60a:b0:223:432b:593d with SMTP id d9443c01a7336-22e1ea87a44mr43546955ad.42.1746336570833;
        Sat, 03 May 2025 22:29:30 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:30 -0700 (PDT)
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
Subject: [PATCH v4 12/40] target/arm/cpu: compile file twice (user, system) only
Date: Sat,  3 May 2025 22:28:46 -0700
Message-ID: <20250504052914.3525365-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Nbk2+YI3rHzu

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index c39ddc4427b..89e305eb56a 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,6 +1,6 @@
 arm_ss = ss.source_set()
+arm_common_ss = ss.source_set()
 arm_ss.add(files(
-  'cpu.c',
   'debug_helper.c',
   'gdbstub.c',
   'helper.c',
@@ -20,6 +20,7 @@ arm_ss.add(when: 'TARGET_AARCH64',
 )
 
 arm_system_ss = ss.source_set()
+arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
@@ -30,6 +31,9 @@ arm_system_ss.add(files(
 ))
 
 arm_user_ss = ss.source_set()
+arm_user_ss.add(files('cpu.c'))
+
+arm_common_system_ss.add(files('cpu.c'), capstone)
 
 subdir('hvf')
 
@@ -42,3 +46,5 @@ endif
 target_arch += {'arm': arm_ss}
 target_system_arch += {'arm': arm_system_ss}
 target_user_arch += {'arm': arm_user_ss}
+target_common_arch += {'arm': arm_common_ss}
+target_common_system_arch += {'arm': arm_common_system_ss}
-- 
2.47.2
