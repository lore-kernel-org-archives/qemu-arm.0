Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42623njb;
        Mon, 12 May 2025 11:05:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5zm2wCDGcgrhxv/H1z58PLJIqXTfi4N3EybAdLjICMOOACBtmq91l0+psdmxgoYXTdVQ+D0DdIVIeVw==@linaro.org
X-Received: by 2002:a17:903:3bc6:b0:223:65a9:ab86 with SMTP id d9443c01a7336-22fc8b33287mr225562995ad.12.1747073121266;
        Mon, 12 May 2025 11:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073121; cv=none;
        d=google.com; s=arc-20240605;
        b=bIj0HTmznPoLTvAGkiniNpsjlzjeVlXUwDpAxXd0V+9aYtcueBq2LNqT+jE1GIRDpC
         OXSko+ZV/36KQ8uqgAvaa4BSxj9Dei7M+yg+cTn601h75lP46zbtFi0htN8qpvrS64MX
         OvtDQF0n98+1+8cDj7aMUzGltIoUyQL9VYRmjqwl/8AnIRVGBgKGzSBE10u/fP6qisMW
         GJdqNfDdeeE+F/vIvUpKY/Lr6+zW24Ww8BM+4AVfNKcNk/VuZHeIOfb3EZCk05xdhLbb
         B8iqtO6+4jg6A49f1GZKNEArywqYhC2RQWDuCUOhOwAe9Z1cdDS/NexzP4fan4F1lMT1
         Ou1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mduWzGcqrbCCMCYuVdtTD2ZBid0+LWN3eUl0cLQ5HO8=;
        fh=3rQ0sUUCwzVGFaovWSioiv0kiZdsdu2T9papR8mdln8=;
        b=G/QTYFTAGHsdXzJMsmi9K+uWspnbE2oCN0cJVHXp+6FFp1FB0ELTvntV+mVweHMt1t
         unAzS8pLmxu7NakQP6KfuWuTL+/Z73H7mWp3q3ml3rG9n4UXzrRB0lnicBd+cvkXW2nw
         lUYu/qcR5ribeH0CwVHRi5leU6a2yMOXiWfV2flCNE+T4vy3LT0Y1N9OiZKWR3O5Ycf6
         ly0Eaumg7+Z+4D9fG8L+Yx/RpWL5c2/gHIDYvb3ucx+VlXiD/S1X6TgsymlVwfkAuUGS
         79gxMiTvBUCeYiL7SgVqi6ttmFWMeX12LyTdiD3sGifMQFkaiTHBWwkeBwBE6xvJz6IO
         YswQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LqA6S5B0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc5a2e3dbsor62560985ad.7.2025.05.12.11.05.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LqA6S5B0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073121; x=1747677921; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mduWzGcqrbCCMCYuVdtTD2ZBid0+LWN3eUl0cLQ5HO8=;
        b=LqA6S5B0VTIGtZXeTko/IszItNCujV3DhD2J80JnDvdF3jG4AE+IVPmjsmBwmCfDzh
         ps4KSBqH+Fl4B1J3Z8f2jf5zTSy9KhSxlFUDNlCQgCgj70AQpOEYiUpIQEDqYQekSlUj
         aRWU8+BQ6gUng+oMm8b1Mr1EfTkIsphqzxPtdXX6KznNtG0FHVLGkZM+tKs/t5s3ohsK
         iwbyYpjkzrHEhoDiqc/jmj9WynoWsZSeppjjKOv8HL2aa4a69H3HWtHjWD8QQ0KItFYQ
         aktN4EwMBia6ub2dDQYnv9WrbyaQyA42IST7Lqkfa37lo+dWntlhlgi81rmZCAq/ffXA
         rpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073121; x=1747677921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mduWzGcqrbCCMCYuVdtTD2ZBid0+LWN3eUl0cLQ5HO8=;
        b=p4NBbndO5Z8FvImfSqg4Lo3QyRYw190xU93j2AtZQfTG+/jJu82pTfVqWwn/b5mOGz
         GtTkJxyTWkIkBBV3Y5D86wZ1vRoCcKvTuBmY6x7NN3sd4KDG7fVzlFJD82Q97JMH4tbw
         575BbfJBh2x9lxzkWOF/qJ//2TAC4v+7NFxP5FDyRzu502i1PinDUIpaf/dIJCVgvpAI
         GKWFvrSdPMemH3Q7XWWm2O/ZGQw52OrjW2TXn/sRlKzeyMzCd+ySu8x1ctTwUwKSgnhM
         hNfyvGbr4m5vdSR75Xlls5VzY0szf64vEgUOsd6RhSrJJPoC+NsRmRPgcVilTqYqQDZg
         zM6w==
X-Forwarded-Encrypted: i=1; AJvYcCV81FHJRSmoW6vHRp65nNuqoxZG8kcl54v1wKmBBLC+E8dMmIXF7SL0p3oS65YgTMaufsR241KFilO9cQ==@linaro.org
X-Gm-Message-State: AOJu0YydcXBOypBbYHZ938+i7/5ioMqdcaI57nVWolBlj/LOEcRfFfry
	G2ZDAW9jnttEHFYLlNpnybTUG4tG0Dz4A855J09ZJv0I+1kLJvVheyxMk2jNWesxgw==
X-Gm-Gg: ASbGncsH7HRfPbdkyzyRsOltnimdr3CA5DNpxXSNWVwr5ZNSC2fqlIbFLQvDKZAwwbd
	a/L0iG45HnkpommXJonmqRZLjAKe7TY1dzfaICgaUcUmK9VVxI4qxULwbsb6eRvBK1+s5kPIigI
	MtUC+FunK6ueYHH+kV28+vFbTeu2LmvbjX0cs+1HzFE2yQeW9XST3FfQcMzn8sYaau4BsHXTkx5
	YBiqVkCVc+nZbwJksePmGdHH0mmXQTR5yCgpgyBSS5tHzcAHYDq9oGLlCCqHk4Bbh6YobRdpoG3
	flQLJZ4EV6eVCk+Kz5JFSSOEPHmJEOieieppRN21IPqfsdllXxc=
X-Google-Smtp-Source: AGHT+IGQ0jT14jyzTd9oLZJ5Ff9RHlx1LDHlzLtes2Wc+VS1ksOBLnpI4eSNg5NipXT2Z1Fqyejf/A==
X-Received: by 2002:a17:902:e810:b0:220:cd9a:a167 with SMTP id d9443c01a7336-22fc8affe60mr200210875ad.4.1747073120819;
        Mon, 12 May 2025 11:05:20 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:20 -0700 (PDT)
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
Subject: [PATCH v8 10/48] target/arm/cpu: compile file twice (user, system) only
Date: Mon, 12 May 2025 11:04:24 -0700
Message-ID: <20250512180502.2395029-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: swlKsd6TM7HI

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
