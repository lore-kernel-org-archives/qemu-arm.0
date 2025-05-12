Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp45106njb;
        Mon, 12 May 2025 11:08:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV0I63FKxR1vl51RcI6GbjtDmEgwUa5e4P7zXiTLspqv5XN/w9CH7zrJ6tcWflkOffUfoq54CMZqCk2Yw==@linaro.org
X-Received: by 2002:a05:6a00:997:b0:742:39a7:7193 with SMTP id d2e1a72fcca58-7423bd645dbmr19203849b3a.12.1747073333630;
        Mon, 12 May 2025 11:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073333; cv=none;
        d=google.com; s=arc-20240605;
        b=gu1s6AgNyF62g3dOh37viz4yAv846qERYm1kzG3evhQwuxWQ+1vKeSsy3ukf2V460I
         o57+eZdbbB6ZhSndr3D9LmnkJ9Fad2/ioyLKZ85C9zp1dA/DJUchkVFvGLJkBnMIZa7P
         Mn2xgfPqvuWe3lmcHNjjSUfQOtuCKPB4r2tAmpHzMfdt8JAwjXzdC84hTs603VWWMKIs
         VeswSD67YHUNzaH8ZfAdRnqZ6d/8t8/p55hRGe+uzZtKOP4ne8kM16LV3itrDnTdiEHY
         7Nq2LxW1wMx1i8c8ypJ204hAmICG+PaONmo4bMAbhjHIaMGyq1OGi8WFDr0U2N727oeT
         BE5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jg06Y7bf5KiymTc5nVCG7BgUS7AMOOtDTvF6y7Zvpa0=;
        fh=h3thVp4eTjnBLiG0CF4JQ9Hg+m4VxwX8VbHsgG3giO0=;
        b=Wyq8XYZeknEpleY+KxAHGGmCMY9Swqk1sjQZCmL8frjAMtQhiZ86HyPUZpkhoIaVtn
         iudxn067TG6ESL2vPtr0K7X+8CimZGgXXZ9cTl/mLpnVGMxE2zv0rjz0FKVcesJXagGN
         YHMhk7HyXZutNMg1j5kyzKvzn1npfzbn8V2I5VyPDi0x4S1Tb2P9t6KbyLH28DGjYtdl
         8i35IwhB8X+2jtExnC6chyqAnUvVtml3jQjgXRWXMkCUO96hSkRiiQAgJiNJ+EwIvyjq
         VLhWr8iCFx5V8FRtZnpPY4jIA1p33w8+MLlgWKPELDBtHs8jSZPIynSliBomWZaHr4b1
         NcSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T6zxgvm0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-742377053f7sor7055385b3a.1.2025.05.12.11.08.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:08:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T6zxgvm0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073333; x=1747678133; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jg06Y7bf5KiymTc5nVCG7BgUS7AMOOtDTvF6y7Zvpa0=;
        b=T6zxgvm0uosHLsCPxXzljVjgQnENp7b0YCY0Kyj4FxCqsBwC06rmG6GB+smC+6v3N3
         zeKNBm679pRMVaQnc+6avjpgvzzD0/l0M6e4PG4a7xFVMrJz6RrPX22y5AQjar6srlui
         WPjrfXfi7vHYI+EM+ZrkfvkOOOPF0uIuNwCxG3gF8camkeIUNT3dBOMMsrhQ1d7iZvdm
         DMG5ixtcAjU4cIKg07t0J3UPCkOfwtZSZ2YWD9rw/D1g+Na8mqDljecL/8q/gKPtNde6
         64JncGTHeas9IlVcV42qnya8y9Ppg56a7paiv188P3J/jqrk4NF2V/HzNb+I39ypiHVV
         UvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073333; x=1747678133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jg06Y7bf5KiymTc5nVCG7BgUS7AMOOtDTvF6y7Zvpa0=;
        b=Dslq+qTvfiSnz3p+8duMG+eCfgEFW03P32i0LAMCXBDiDPtuRPtrAotnXC+AUjRv5y
         EkVp66Tm1AUEGFaj3J8XpydCOJDjJpetYUGcxKS9CT7S2Bs31Qx7bRQOKfBbhnfqlTMw
         gkM3rvcKlswHEYa+lQE7V+KrVGiFciigoX9AToQHn5IzreTwiIGdGR85RmNqmYxSJTr7
         mr6cGZnySf0Gn1DMNokVO11hqAxqCxtDV+zu3PppYbSLWh7g7xTnK8Y3OuRqslGx60iW
         3iJN35tnbzcMbqX8y9TeWqiqMx9ogmRGKK6TaRP+fs7qlx1oqtiM9xivbPpxSAcKhdpJ
         Wdag==
X-Forwarded-Encrypted: i=1; AJvYcCVFQ+6ExYLRLu6eC/BAcATGcX2aeTcH/kkfari1BZZVEN0MQ+dUh1YciMpROQfQZRTUzysrTnpQZxnbhw==@linaro.org
X-Gm-Message-State: AOJu0YzHhXL3OFRhtbyTX4MQbWObWvlMV+4XZcHxlai4uhTsEkXFCkEF
	Ij5aPIXvL4ADoYW6e1npnag0A9JX5kk5HXze+lsMMV74KRa1MAu2SPlTHk4niTDsItcYQVh3Ilh
	98mo=
X-Gm-Gg: ASbGncsfLYFPKkjmJRrjwob2ICUlEr7sbBBd71E4CLi0PxHRGoQQ6nbzk5WuAhhfCn6
	eftKwSyp2hDmG5zWJztJ1AJYZbYCX1PQ5IWo/YUtuYBH/tWWPYaLdzXuQaAR8y0PUPBpPCdZ7cg
	1YVNgqSm6YaEY+RytOWBIcJbTMEFMeo4DsHekWy0X57mQpXyTbNagtZUMs35/YlMNSpE5dM6bTG
	+1Dxrz2UIeSoXJnvteA2xMFP9ZKpSEbbbvBG/5P4YQo3+GNWmmhQ67DMF0iRyVoWgsgCTlC/lvv
	z2OKPihNVIkEMTTfnhbDLQmqCBYsbgjyDfkALWRqBIR2STmGpAJi+2Ntyp73uA==
X-Google-Smtp-Source: AGHT+IGHrXcPyTqv6VhW9WMXMZ97evgV0lajrk9bhPAjWob6mO4Pzdy5MdI0DQPtkguqasDBwJu0yg==
X-Received: by 2002:a05:6a21:c91:b0:1ee:ef0b:7bf7 with SMTP id adf61e73a8af0-215abb3b979mr19692569637.19.1747073333215;
        Mon, 12 May 2025 11:08:53 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237705499sm6438580b3a.33.2025.05.12.11.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:08:52 -0700 (PDT)
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
Subject: [PATCH v8 41/48] target/arm/tcg/hflags: compile file twice (system, user)
Date: Mon, 12 May 2025 11:04:55 -0700
Message-ID: <20250512180502.2395029-42-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: M+/Wb2+gvRQJ

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/hflags.c    | 4 +++-
 target/arm/tcg/meson.build | 8 +++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index fd407a7b28e..1ccec63bbd4 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -9,11 +9,13 @@
 #include "cpu.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "exec/helper-proto.h"
 #include "exec/translation-block.h"
 #include "accel/tcg/cpu-ops.h"
 #include "cpregs.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 static inline bool fgt_svc(CPUARMState *env, int el)
 {
     /*
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 2f73eefe383..cee00b24cda 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -30,7 +30,6 @@ arm_ss.add(files(
   'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
-  'hflags.c',
   'iwmmxt_helper.c',
   'm_helper.c',
   'mve_helper.c',
@@ -66,3 +65,10 @@ arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
 arm_common_ss.add(files(
   'crypto_helper.c',
 ))
+
+arm_common_system_ss.add(files(
+  'hflags.c',
+))
+arm_user_ss.add(files(
+  'hflags.c',
+))
-- 
2.47.2
