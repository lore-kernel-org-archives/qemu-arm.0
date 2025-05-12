Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42925njb;
        Mon, 12 May 2025 11:05:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLSPnEQThDuGdUPO/WVqF18SvlCUa3YO9z1MqxkdtvsS59AC5tm4IJzaURKltgUrHYSNhfbmyVToSUcQ==@linaro.org
X-Received: by 2002:a17:903:19c6:b0:22e:7f20:52ed with SMTP id d9443c01a7336-22fc8b63d2amr181114005ad.20.1747073140709;
        Mon, 12 May 2025 11:05:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073140; cv=none;
        d=google.com; s=arc-20240605;
        b=DleLS412nntSwVFeGJtx4AOmCy5C8rBsEirL8HKUerNSVX/cdDtpq94gdAYiGxnd7r
         ruOSYlqqxTgEFPgNVIb65dyX3TosJtkPFD9DMRnDv+raDff1oYbyNKZ+IHBEYK8BQSWy
         VNoN7pdB4GwbZNnloxU9a2UoodWrdh7d1K/xqbLiuVKRjxIOWEHN+6SL8aW3USOLGonC
         LGdZUI+yhvLaaih5oB9u4PK3vSEs6kF1MCybKv2bY/HFhyetfCurd7N6Q9NohNRy+TPm
         bP6w2ugJR2RsAQ5F2CIU6dQ1Xw1eigpjOLwA+F0NFdp5CyD2/ubSP7ThSWaoEr2Q22nm
         oCsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vzXXutq4wGalZELe39I44dxOL/4dV/vBf09UEOe1qt8=;
        fh=gErCvD+aitZg7oo5xtFX1AEioD7QusBEtA3DCuj7nHs=;
        b=Y9tVzzc/DrL/0b4toqTQP9mt0H9gGa5P5nKaE69PuVh/AwssPffdLiPrFEehMCZKJE
         awHzNSz03DordSPtMCc2fDrxrIRW6+gJpGRXbI9H3U+Y959HwzL0gVzegrpCSWUBxMkR
         Oax7+UZvjqNyq1JA6+lyu6ou7HsFExJ+yNt2q3vuNY077zxHsOw8kbV9xJFdfj33jWJR
         /O57IV6l/AZx++1We/e7Q5QiQDBdpRd3+PUiC1GId3ku9JVfwXbId8LwCO45t2iE+Nqd
         F+ZnHQ8x3JwHOu8ExVH6g3AwcHssFCQFBhUIxTToZi/ZR3o4sdB8XUHwxburEeCiiqtU
         QPqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tuwzR9Xv;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc6df55b9sor41450165ad.11.2025.05.12.11.05.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tuwzR9Xv;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073140; x=1747677940; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzXXutq4wGalZELe39I44dxOL/4dV/vBf09UEOe1qt8=;
        b=tuwzR9XvaceophG9iboDF9NsSwGvXUljNoCImX3ASlk5L4XLcO/w2UbGWoReNxoAYP
         jL6+bvI77UzYVWAT5l3auGzqRXskmchKAqpIS4fp4qGq6cxvdQ4fYK8vLma4aRaJ3ju9
         GvD0QKQM9c8U/FWCF1fQcomSYhoYPGCfjeSYqiawPaNRXJ0+T2aVwGJOksTuadmOzWGd
         7941oVzRuDEi+xXkR2eyu1xcfwpoj4UiZu2doFzORSG1WtpSoXbxKyNcTjZ5Sh3AtCqR
         lnGoLGZXj5W2yN0OVK2isp7Lp4qeEL2XsnMO1hlBRhCJMgYR1p3lknl93878GfWGtSdG
         vjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073140; x=1747677940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzXXutq4wGalZELe39I44dxOL/4dV/vBf09UEOe1qt8=;
        b=Qow0FjBo7M0clQ+Z5CVd4CEmmwmxce/ISvp9OB/0Kkf3aAG3u1U+JHMq7+uW3FrMtN
         I7tEf+MZY4HMZoUyfuYrgVzMNx9eSbUnIZFHqwIqvsqUG7xUoZKe3RQW5Nh/u9Bfy9aE
         dZtI1UZaYW9Jo1HJnh8/i9jPW4k5TjxZL/dYK/iEwEQByT2VJ2E/DqDH3Bx38EZsK5vV
         pUAnikusu+t1JulqZITHQB0RMKje7YCAilL34X5i2e6b6i5FliXAwvTAqqHUxNrGtseY
         dk6sGvd+VoerVjOt4smUwKQ2uDwP4e5dl41RVGRya0/avktgI+UDril3fRqkCg15bXqj
         HSyg==
X-Forwarded-Encrypted: i=1; AJvYcCVWR8j1Snfa2hp6K9lgMzcwI4yaz+jsYqHi568mln7d519RCe31J0uf0u0/UYw9jg9JOGAWcuv+bvFN7g==@linaro.org
X-Gm-Message-State: AOJu0YzLQ40W6VIDnY84GWjNaIOi0xYeE60bZSL25jjZWcj7vNZfjFNU
	ptOiQKXX+phd+ULESY2v9IkldaEGrGt6dMFx0urdT9r0ms1ol8Wmsn6SZGrTGnwbFQ==
X-Gm-Gg: ASbGncunpd4aKpviQSgZciiAdzyFLCS/D2F2s5MTZecGqxaDQTz8Kw8HOxUriUT8EHh
	8DFRKsqQSQHvUVHvbhNbLL3XQYUROKjeMMXhWL56USqwqugCiWmEze0Q4SSWWI3QgBcH8OpviaV
	mge/QMtrODWEnGkBD7CO5IadqGRrmoYk5ISb+4sQFvmTZvdGv5lAE1ThhsXQiDBhH3zwgB1luWZ
	SZmlCwmT1DBN9AzUFPbBgYUBtVzWnSQQ79VNEhKITjX5zoUqA07RxTBFaTEpRm7lENGS3Y1gfju
	ik4KxWM0KAIiA5d+wexJqSDukgADeOIotLP5jrGuSyc3sE7Itdg=
X-Google-Smtp-Source: AGHT+IG0CawLMJdn+wU+zZfg2tvV/EMa4PCPpMg3XKBwK3dfhIPYvIf0gA0Oo+3QqdpakH4hlP6iRg==
X-Received: by 2002:a17:903:2351:b0:21f:136a:a374 with SMTP id d9443c01a7336-22fc91a84b6mr225854375ad.43.1747073140323;
        Mon, 12 May 2025 11:05:40 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:39 -0700 (PDT)
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
Subject: [PATCH v8 32/48] target/arm/meson: accelerator files are not needed in user mode
Date: Mon, 12 May 2025 11:04:46 -0700
Message-ID: <20250512180502.2395029-33-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Ff9oT8wGSWMF

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 151184da71c..29a36fb3c5e 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -5,9 +5,6 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
-arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
-
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
   'gdbstub64.c'))
@@ -18,6 +15,8 @@ arm_system_ss.add(files(
   'arm-qmp-cmds.c',
   'machine.c',
 ))
+arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
+arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_user_ss = ss.source_set()
 arm_user_ss.add(files('cpu.c'))
-- 
2.47.2
