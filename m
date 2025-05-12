Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42628njb;
        Mon, 12 May 2025 11:05:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLSHjLtEWK4LLak9QJSWxVThLQBbuGNpvH4AvdTtkzi26GXBT63s/2G4n2Fisi8rDmk+vRgVDndroCdQ==@linaro.org
X-Received: by 2002:a17:902:f68a:b0:22e:4a6c:fef2 with SMTP id d9443c01a7336-22fc91a205amr218328525ad.53.1747073122217;
        Mon, 12 May 2025 11:05:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073122; cv=none;
        d=google.com; s=arc-20240605;
        b=cyo4n5T/n3qmYtFw2FBusnAgvT4r1C2FSc/OcmLFD3GOWCzJXb2ZvvcIb83Q0YrtZD
         wOP9Cs9KeE/2CAz+V2+w609KE8CU7D7X6Bv65cAa3NRVqucNKms1Huu3fzTfxSvINllQ
         R+ow+YZoath4uTHP4QEBwCxS/BWHc1qrM+Q/3MlSRWr3dzB17rRYtJD5HJK5b0h7WZuh
         1dklozv3rUDRSRS5g4/GerwjXST/z53uA+9nb1ynIWOp3sLOSYuOHo34ekk6kw72p26j
         bRCwVrd3ARVyM+FOmUuUFDHAwzH/RRHnvLKDhKsmPXbU8359sc+6cKUknEfjAE6hcxpl
         lc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        fh=01heNWp/fyrpggrNsISBuJUBhRMMH4LQx3L0BDFv5Ww=;
        b=O9R7piwCtxfXbxs4bPusd8ibA8VCrFyad6ShvYJhM9v4yVfXSxH20oWV3bkVBkKFoB
         K9SDRMAS8X6Wl0gyAkQ22NeBtoCXsybXWloumDYp9RNKczpMP9wg+AV+pcIS9VabF1n9
         FFY10hro7p2Opzeqk3qigEaqIJGu3xV+UF5XA35Uq8GiZsSS1SZVu29EeyMELg3eRbPA
         fOVB4lnzBaKpPLWanrOzlaBnM0YKebUIEuOYP0Xta6/ZF7oS+LECWUsTZA+hGGYKPlH2
         w7vVl9FI02Q2rblokkgZgzSRTPPNiNga0dvSfmzRE8hGqzCa5CnkAuzqnHnR7DMwo/CT
         7O+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dqgp/FgO";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc6cf2c15sor51173125ad.17.2025.05.12.11.05.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dqgp/FgO";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073122; x=1747677922; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        b=dqgp/FgOhnnKCTLFqiNARgAkIDScDXpeI/R4byCBozIPNTmSiRWbktqb/lVNRrK/W6
         uZ40zDaqU0f7pspw3ueRZXEdXqwEMHgCdw0zrlOgzcyCVK0XpdkRZVAPCRV4fs9k0ayX
         LiVc/ng6MBZNLJLQz/RsT3fxIs0Ul2Y+O7HyrWCmCQB68D3EbZ3ftLyZ0oXYv9oknOho
         vRKX6wHjed7o1OUAiTkdSNpuQASLctoqLI3SKh8lYKGpgLSkKvLrCE3Uicvzs5G4qOJx
         76SnOue1RD5zBFatlP1tn865B5EyLcC6bPIPonMpgB3mYcqnV92GuOBi+u+8kaeVjhwo
         7k4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073122; x=1747677922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        b=NKLVeRKTEaa2TJm+tHwYkLevGY7aZzWJW42fMHLDWZdKjENVsOiPpJDtoOm9Gh2CQN
         sUGaKRCo1Y0hY3FxTUL7cZRhQnaKz/uxLUM0lntFHRnfeYZfUgCpFd/3YuxSRHIG2Cwn
         929YP/Y6zPB4bv5H65KxzOR7Uc0J7/myOSulv1yF2ySCNjLIHV7PqYVjHGjEhGlL/3U9
         qxPM2rqYxajd5FM4lgl/LJyLlFqUh25PeLkg2vZdMxeZJwj99thwo5+9cqIVww3zyGin
         hUmLYaZNz4guoqN1Hp8HHY2QtbLNdNq8sTttYYYp0eizDPLMJmTONYu9XnNbSfXj83Ob
         n3Yg==
X-Forwarded-Encrypted: i=1; AJvYcCV8bvmSiftGnCDlbjyopwFkQJXbcH4dyVV0Q0RjkFhwq6fla39L5551ZMdXLjgwhNkzksijNTAnSam7AQ==@linaro.org
X-Gm-Message-State: AOJu0YzYKhf2CQc3f2ViBGns8zKyQlywPXdjaZaa2w0KMZnIC/JvDFRq
	ifRRtnp7hRVelAvnv1jO+cdX6Qhr5DnytxzPG0Bti4x4SInYLGw3HzfOav03xKLizQ==
X-Gm-Gg: ASbGncsVH+O6zZFmatsVii/5OqM6az3Bb/BR6YndUSrnaInOQtO0eWU/IBXriZBpMqJ
	JPGl2qa9iF9V7bP7/+Sih5EWEqFzhL5lRPTA5cfQVs1FTWwtxV8aPHAFa95arXdiwJLyjnqsIFA
	Hrwt4SwWa/dhkdt1P14Cgb1uEDccVULkYS2sSRBUIhdvym8abZ9cNepQPapnptIffyJAiQBusH/
	T4sPR68rB0yI9USGMxtS7dOG2xveBIsaafypJFKZderO5Dv2nAnYu4msAo60XERaBYbpnMkTElx
	NUlrTcSu6z+K+TXa3hGqTisc7fzJ/HzlvHZETengJHJ16oOWPFA=
X-Google-Smtp-Source: AGHT+IHpKFuSCTSiVQdUzZhZS6mF5YhbOhklGnyzh6uu2TTMvgGfDj0vX8tWLok7xquOCnqAQWr5kw==
X-Received: by 2002:a17:903:186:b0:224:c46:d162 with SMTP id d9443c01a7336-22fc8b3d8b2mr169123125ad.20.1747073121680;
        Mon, 12 May 2025 11:05:21 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:21 -0700 (PDT)
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
Subject: [PATCH v8 11/48] target/arm/cpu32-stubs.c: compile file twice (user, system)
Date: Mon, 12 May 2025 11:04:25 -0700
Message-ID: <20250512180502.2395029-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: erfNJUCI6jcF

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
