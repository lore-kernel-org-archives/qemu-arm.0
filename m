Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42802njb;
        Mon, 12 May 2025 11:05:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdYanNSRn0kB/1VgIke6IkoWQL4HfYHk/UjhJJTFOk2JffUy4Lb5ZIiv1kaHO8zE/agENtsOdcVH1KBw==@linaro.org
X-Received: by 2002:a17:902:cf05:b0:224:26f2:97d6 with SMTP id d9443c01a7336-22fc8b76b2fmr249290565ad.28.1747073132876;
        Mon, 12 May 2025 11:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073132; cv=none;
        d=google.com; s=arc-20240605;
        b=Ki8PICyJOlYBsyE7qrhuz6oqoFWv2Fa/EDQs75imyRg2HKlP3n1kED+qEA5axHadMV
         wdsuKW2pMwmhYbm5AXDitvz3LdB9gMPw6Cr+IsasxIFMgizOQxUfyRSMEhWjLgHBjRvM
         juUm6ZMMkDOGosF5gbOnphBV9G7ROJ7zPNj7A3O+xhrmKPidLENUG2TW8s2KoCrBT+Zv
         TJlpOj6RbYxtfIZDlxGJRlPbSPn4uIwZqX9mXvIeKvvVRXz4q/Ki5yu2KlJToHadhCT2
         +W4iEVzBS5YIZPxXid+kzS/P8VDm6NNWXOPgqa22zhiK3M8HR0klADOab1C5Y7oKiBoE
         rZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4DYtSZEbP1atLGb677pRK4UuiMz1CYlbqC5aWBJkLTc=;
        fh=st26O5P1vN9Ay4mQF2v2aKRfzgcahXoVkm8gOOU6n9E=;
        b=VoW5Yr8os/XeZjMlVKzQLiUYRzW62dC7soLu5c3A/hxV58P/kknlN2r28aexC3LjH7
         NHE26Hj1pV/wCVnkduBxYa3YOg0W6Rbbe1un71gstQGIEq5mkN6m308fg5inI8Yb+4WP
         LwJ4NB8FzX3wsnvkaZW6FUYnsire+mYJ4MPQq3sVepP7by5szJMLHo/lH3Lm+9PZBVm1
         sJeQ6OB5ulD3xvIcOJRSqhW285Vzx1r+aPEpxIhTc80cqYwff95YTJ1viR9bOp7cmP+W
         Em/fQfK9E7t1yys4UZNW79UdAjQNcMxJ0Hz9iif/MivGmaKs5w6jbUp2/z/81thQ/40/
         YY9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zdUSH+rH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc58284aesor57852955ad.1.2025.05.12.11.05.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zdUSH+rH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073132; x=1747677932; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DYtSZEbP1atLGb677pRK4UuiMz1CYlbqC5aWBJkLTc=;
        b=zdUSH+rHJCAguL3Wzypz0uN6uutpdGaF2a6RMjaqs3G0vcVTdqZCKlYsjjuIA3BUze
         ObMk8CfTU7FG+tIddcmjyo7yaG2FXDshceDR0PVQPn5xbGF6zDYGl4dzOIJgEBb8Qc2m
         U03jmuKjXfkg2CimVcezVseJ7DCmVGlRQlviMU0x1doKDnCFpM3tM/147WwiT0MunTN+
         Oxvns3R7R7O4oX3iGHDhonRwU3WNYK8H3Hnl4r3PoTLeVs0fsKN30mTOLhxK/R58YMZ3
         KkUB2ilYzXZGfrTToNZLsWEz/VDJstuC0cNfG4e6xpmNK2Qg9lIAKKWr6+L+Pn84UbSw
         +llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073132; x=1747677932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DYtSZEbP1atLGb677pRK4UuiMz1CYlbqC5aWBJkLTc=;
        b=ivMxsKQVDOz3p8EF/flYH8yGLQIrqI0+kdECFXlpSpQsYMPn1YKIUaWW+JrsBlHPzW
         81tOSnf1jRK6/c8E298SIDEAY6DHNhtB1DZj2555o0DLdDELYxY/G1d6j5lJkxcW2oaH
         3mss6Ym3Nfc7MLGoXUF3Sg9HcwGBP/OSffFfR87aZ5W7CleMHu+bzvNT3dLbU3s0AL2J
         8sOJr+jvF/YnIAirfcfSHM5ZArb3PsAdYCeWlWyJ4VRbwXOVFePmqxA2T7CHsYI7Ldw2
         zwiiBbRjjPxHX7GJlIWEgM9TCmt+1wLcBcv7ds+4aumzls5yT9Vk1D9b+GdwRmubhWv4
         LwEA==
X-Forwarded-Encrypted: i=1; AJvYcCV6sAL4J0gbeX16GIsLhK33De7qt7S5iyXwYkB58w+pW5SHOfPrIozVX8NInNgEU2a/0JrxrcMSeCnz4g==@linaro.org
X-Gm-Message-State: AOJu0YyHlozWeiKGIu9omUuqv476A31biqBZlqZzYrmmq4HqvISpkqtz
	6LgdvpRGLKzQRHQcbpB6/U8imYEXqhrBHgHnTbHsYtBJqsHNF7rWDBwjzHahRmVVfg==
X-Gm-Gg: ASbGncvHzmwphcGU0cXy9uCNgZbhkPIw9dWNzhMiG2X2L+yCnAmIOxF7MYwxppVFKoy
	T/bvIVOFcEmXpWgg/5mNj5Nt/EB/MwTZMJKyCU0AZAjJKbvmTlZtsdU96YYiC3pKBaqfJeV0XIL
	Da6AxEvg8RszYAgK2SowfL463E1rkEz7OzAKI7hZMJTyIHab8LfBCBb+ygrVUZkGuv69fnzcBQn
	puzkHXjebR45g7pRIWAvlauxJKNorSchnQQ9YomCoRcWfdqvniHKJKxNgvFIzbxOh/H8sTz2kAI
	A/feB3RnfCnsYJH8Bi6+52ZLgj9O8VJvbMLW9YpAoWtyF5T8c/I=
X-Google-Smtp-Source: AGHT+IEUchA3BCwBh+OJ1cNAY6I61vJmEW2d9AGpseNu/E7o6pb1DxCo2KJeldjr8AJ2t8R3hCpqEA==
X-Received: by 2002:a17:903:40ce:b0:22e:4a24:5781 with SMTP id d9443c01a7336-22fc8b79590mr203976175ad.30.1747073132481;
        Mon, 12 May 2025 11:05:32 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:32 -0700 (PDT)
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
Subject: [PATCH v8 23/48] target/arm/helper: compile file twice (user, system)
Date: Mon, 12 May 2025 11:04:37 -0700
Message-ID: <20250512180502.2395029-24-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 3mGRxtkrDSRM

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 48a6bf59353..c8c80c3f969 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -2,7 +2,6 @@ arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(files(
   'gdbstub.c',
-  'helper.c',
   'vfp_fpscr.c',
 ))
 arm_ss.add(zlib)
@@ -32,6 +31,7 @@ arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
 ))
 arm_user_ss.add(files(
   'debug_helper.c',
+  'helper.c',
 ))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
@@ -39,6 +39,7 @@ arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(files(
   'debug_helper.c',
+  'helper.c',
 ))
 
 subdir('hvf')
-- 
2.47.2
