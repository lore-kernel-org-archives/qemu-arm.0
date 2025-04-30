Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1004597njm;
        Wed, 30 Apr 2025 07:59:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXgyM0MjtdPBjNsdXPTRIiTNa6tSWwfSzFXcViEZ5FAqj2SHpkjDpwEcLmZ/ZBEKlJ14Z11RemIWIrs5w==@linaro.org
X-Received: by 2002:a17:903:1b23:b0:223:5ace:eccf with SMTP id d9443c01a7336-22df34fc64dmr53202425ad.25.1746025140557;
        Wed, 30 Apr 2025 07:59:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746025140; cv=none;
        d=google.com; s=arc-20240605;
        b=HmmF2Aa4wsf0uO7KWpcFtqJMzFKkelixJykBJlSpBquVDofajkPDCZthKbeoOcp9t4
         rVMN4va3+lhFzB+NzzDPwMMD1L/c7t9fiIAcKiFdkJoTncWQl7lbEu+P+Aq51hcvwr2p
         ApOFYIuCk5mdRQc8eeiXNCg03w6cekE08gieU6mtYzn1QvT7ZXF4xdAdwlQ0Bc80V5bH
         RG0Ft39VE8kzI7Qm7j23eN7g/W3PHYY6iJ+0DTNat+JDB6HRW8JTypAQDWY8CJbPWiGQ
         /Dh2kPCWTl1mX5ZFU321BTCddYZ37EqdsFEu/QnS4+Bw7ejabaUK6sGcLAZqiG7IrcwE
         fBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=k54PyA3qe+UbX4AzHMockqDzIGWdHV1GUXIbKPo2M9I=;
        fh=QJma2LbntPdCkBq5kdBbO9FKm3JaFBqXI2Xeg2PxOec=;
        b=SE0XUHZUkymZDdThshCn3zxuRRH4N97tIOYVIp36fEO3ewd2kkNX9oYguEytt7XSLt
         V0qcze5pN3PZJymkeQxqQYoJzJY7xXPeBkPf0+uiP3na6emnf/4Fxi3gsUBt17Wk3fJA
         GAAWp1Ouelf5TRo/gq2sveOP3qK6702VyZLLYfgFREc0Qqu53pKxkwDaYVmNUfsWiyqa
         G4LM64leyBZYo+2oAlIuAQJD3UX11O1LH7BJzD8H9MoP3iqRfX3VXq3+aeyWytTgOMzd
         zqn1dEmMSdWiljqakCc9WO7ebobg22zRaD/GQ7VQpvLTy68fMJamIaRmxp9CirdaE1rm
         WWiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UBYK+vAp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db50f4df6sor125396515ad.14.2025.04.30.07.59.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 07:59:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UBYK+vAp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746025140; x=1746629940; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k54PyA3qe+UbX4AzHMockqDzIGWdHV1GUXIbKPo2M9I=;
        b=UBYK+vApX4UVeSm+Q2ClTUHpfwLQ2NIpjr+xypuwjaauX/9LpWN9lLJzcpWrou+LR3
         37xltjnMCafO/xjSq3V1QAZHCR68OSkWdetjZwBCBLOw+rt0Iqor7VJ4VSHneekGyTUD
         b2wcUKzyFdOcUh7ZRQ/cr6NOuhXd3U3BcgGTW3F883ycyjLno++VBESPyiwp5efd1sAI
         MCZBKhfbGiCgOh2PwFd2I4PAUe2aCovxCW0V+/V/evtGPFdvyz4rSzb0fPN2OWk7jMkV
         XRXgBw7cEQwRhxtGpjKxNvyl5DhbAJ0eyDfa76GMfI7QbAIxB6YPD2QyNs082jF73SPc
         u0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025140; x=1746629940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k54PyA3qe+UbX4AzHMockqDzIGWdHV1GUXIbKPo2M9I=;
        b=koXGnhFm8/VLr0rFdQZu8ybEP5gWjOsI+CdVob9IRtAiwDQQCFO5Us/Rter6JYdjEQ
         6BCXbHzdhxLZxIDehomhyZqKIvS0v4iXS9BaHWTUOpFG4QH1pcDs+Wj1UKoDXtw+Z92B
         ia0s0YNmUALSWi3TPJ0gXPHjzXwa0OIeviJyrzHb/qpcgmAYG+qOYwdeelrJuXoBPxYf
         PvuamFdP27DGMKAA51zQwFeoy8wS637bN4L8TK8lMMKNAwPCHqr0pUqzP+9P1Wl0714J
         TmE2B1YONR9KtF7vUmPVag34MqSjgYmiO+8el6P6h+0Ls1eywFGCu4KhgVj0I8LosaLS
         MGAw==
X-Forwarded-Encrypted: i=1; AJvYcCXlmoXJyC+ueUpsI8gMu+pZQPpz7PrMErhQgky30pAeU4jXCFEk0JT3lq2nZTE+IiDx/TZNp3s1U2d6zQ==@linaro.org
X-Gm-Message-State: AOJu0YwX+22xkeW/hp1V6vnq+q9F1XerSznXyZeMwRjW/sLzjXvhEz6H
	EXOrLaF6jK+uw4cfePC5riFU7vUk/TtJjWoDqpEjunQtk7/GebyeKME2vZnKo5NVYg==
X-Gm-Gg: ASbGncveuNgXoMTRIE++TTTpHRW2ADqgMxXaeFO6J/NPGubM7JgTzfy7LZHExFU+6+v
	TlGhqzQEzsbH3wVAty1pgl+gZ7feqAz2XZbfvbyOK+DbDijUKMpq8B3LMHwC7spSRu6Xw7+wuoH
	LYwOzmOWczjsKtIbmgxJlnFLRUmjwAE/POe5F0ReyoWSu878o6wr1qEWPQd0bom2zIv4/4hQHIm
	iN1LC9RUEKlm7SV9VEYNB2QriJ9oTYSBqAi9mCcH9lUVsNICB5MG9Fg+qXr9vZMD0sRpB6YpRhR
	IcjCVzQlIhplvjqCBugTbAlfm0ktvvimePMHwqQh
X-Google-Smtp-Source: AGHT+IGmjmmRsSFucpW6qri+F9auxx0+hHGSx2UjPDyii+qX2/kTJTo22ZL7wgay9LB50sdG7A4YsA==
X-Received: by 2002:a17:90b:2644:b0:2ff:52b8:2767 with SMTP id 98e67ed59e1d1-30a33300e3bmr4611242a91.19.1746025140211;
        Wed, 30 Apr 2025 07:59:00 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a5bd78sm1705652a91.42.2025.04.30.07.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:58:59 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	anjo@rev.ng,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 11/12] target/arm/cpu: compile file twice (user, system) only
Date: Wed, 30 Apr 2025 07:58:36 -0700
Message-ID: <20250430145838.1790471-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YQg4OPP3TDI7

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
