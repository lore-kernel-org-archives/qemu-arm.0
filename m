Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42857njb;
        Mon, 12 May 2025 11:05:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUli6Bls21iiq42caNErlHcX0/XuGTmFaNOo8rMMQ1ZQ0vlbelh44vQwLaWipTLe2NMODegr6gkB3PIHw==@linaro.org
X-Received: by 2002:a17:902:d2c7:b0:226:3392:3704 with SMTP id d9443c01a7336-2317cb04bb6mr5426035ad.12.1747073136323;
        Mon, 12 May 2025 11:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073136; cv=none;
        d=google.com; s=arc-20240605;
        b=gW2yKiceXkJZveIdkQt2kZNM2UyJVEFpLXZzZ3f5TTrwIZwVNIwVypfdAO5VHuIp4K
         HwPkHYvAsw37RE1LTF8Wn16tAnZ03eSgn42vBAFcsZn73NTWT0d3bpA+LsrHH4f+pQDj
         +9HG01hiVzFpDy37dUOZLzC9nKne6QWcKbtm7y+13aJcEn/20r3xlEHi74YVGEAuWz3s
         DojjX4cFg+v+NXF6OCoeliiB16nwCdkhcXFhrz0I/eGNZf3jEgON5170c/4u8y6l7swC
         Ap6RiiEmVeS87KpFef/AWpQTZ3TIz51qZ0iedQyfowRnUVKXxRqoLFlcUbJx3Fg0dKWl
         1UvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SeLT1f95/cGbe62bYfKMrzmzjdSaQ72IuCLuyv7ztwQ=;
        fh=EyN7KqfVvEWNgPiIx2HKmjX0Ez4M5QG9tWp+9lPYulo=;
        b=ZlEnarStPmv0UAUNOFBGyI7yS787QWoC+QCQJV7tm7Q3LFLrD/kVG3Ncm/6stGDZ15
         hlXPz4moOlyUHAwbnSJJFv2tl7H3KKTOTEUOSBbMSgmfHp7giIYQkR5IUWWrEIRgceL4
         941+2MIvoyYTH1Uo5LnNRXK6OlNJnBWXGbAGHg2yTRzr0P5uUHXM3DjUpfChHf3RO0R0
         R6wWJ36pjyFCcskqzlx0yZRnf0hPdTKFjn0t+JEwRtSMImZq83/Xr+wjSt35610ePM0U
         WImnM0lsVlmj8Dw9U/VsInLFDeZFg8gaDbP/NzBAvodHANP4mjmKBwXn63TeulK6q3kb
         ntOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XEN1InFY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc6cf14c6sor44424025ad.7.2025.05.12.11.05.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XEN1InFY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073136; x=1747677936; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeLT1f95/cGbe62bYfKMrzmzjdSaQ72IuCLuyv7ztwQ=;
        b=XEN1InFYU3y6ZbQyYWDF+Vm2BVNW5S9k8MTUfpJ9ySQGMPw/MLNeLiTf9/Lra952/E
         N4nQOmdasI61WoCFJYObx/XG0lrat1yF+ve6lPbbBueodYdAJqoe7jIHQhcH9gbsBYS3
         TfzE3Sir7LoFJpdprjfG7UTcCIpIFG/sDgxFmQ2L5/i8FXLF5F49oLS3GgKvfbR3qRzS
         uHsuBfXbJ5UEDsYZBMGDwb/SVckH4+aL5kU3EdmiIQJ+24qFVO5rbAEkvpd+PbCGOiyT
         KFqbuBwcUmG6rGJS1jCuoS07TPzWKhBm0LROjTMm1RsI1OBF5q87C4g/RjVlM33V3mj3
         j39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073136; x=1747677936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SeLT1f95/cGbe62bYfKMrzmzjdSaQ72IuCLuyv7ztwQ=;
        b=Shy4iBkFjdl7kfn2wRqhqMArUyTLe9Cqf/9osHacQUml+fa9LUHADuB76/zx5v0ET9
         OJuMMHmILFjDSNvLr/H2iXl7wWWDwV+p11h8J2bITc2akVeS4B41ILFp1tIv2NdmmqTL
         sg5WiyfIqsMo4T77SRcp3FwmLzYUTgik1SF8HwAr3kVStl0gqgbWMxjHrIdD87i4dQRi
         ZDH5mVUs1PVIAEc50ck8+jDLkqQg8DakwhZPi6KMj1Ckspd73633t+nyU1KuPlSHw7J3
         WCRHpw5mwpXPUKcA/0BA2191oHk83mf8GyFs+lrQDm+A3hljWzzKQSH+2+CFg6ydwUlK
         5LXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8xoq9qAKvgr6TtcQlJVG/iu43CRVIa9dD7/fvbxJdUZ+zTrNt42EXHWzfu+DRXtXDznx7bNDEHsXm7w==@linaro.org
X-Gm-Message-State: AOJu0Yyw43uTy6H+VnnD8CILEI6T5I4bbQgFv0/sSmrELDgyUpJd9Q5w
	L4u0zwSwevexcDCoQktlvQ9PRe6OfhjgLy/rAQ4D2n1ZhsoTJYK+ud0BmRMPWmyQLg==
X-Gm-Gg: ASbGncuLh5ondiKssu9c4nUmlfL87/K3JyNCR/iMDBKChLnAM1Z0ygx08Vx5NXZzuyA
	ELZNv/M7NJO/01c+RZSB0pSx8Y+c4TwL/hgbqTcNZErXCER13xTbbKXPfDnwuxim60YHfhkxdcM
	Xcc6lUA4BhdvB0zGVXcjH7PNamdAN060h4AsE6KKNc2M3akQ0UCJnWkcFv1NbH/lB/TgH4tnQ0J
	QqvvQTOdVzNteUPk2ioMnSP7mn4dHf3HRc12Xz/wX3wjBrExz0UVexHYQDhowQcK4FNviUPAnTc
	7CVNdD3kxafByTMw1KaLd1WFbdww0ReB1+AFKBIbo7lUekFuDj0=
X-Google-Smtp-Source: AGHT+IHSO/yVDZ7/NBshpsajMoSJkN06Ia8fN4xI+DuSiw4RySVI3WeZmL19cuWAva/wblsZGxHmGw==
X-Received: by 2002:a17:903:984:b0:220:e91f:4408 with SMTP id d9443c01a7336-2317cb540f0mr5666115ad.22.1747073135905;
        Mon, 12 May 2025 11:05:35 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:35 -0700 (PDT)
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
Subject: [PATCH v8 27/48] target/arm/arm-powerctl: compile file once (system)
Date: Mon, 12 May 2025 11:04:41 -0700
Message-ID: <20250512180502.2395029-28-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Z8WURXxCvfAm

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
