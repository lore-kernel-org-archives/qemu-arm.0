Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778209njj;
        Mon, 5 May 2025 16:20:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtqowZn7tcGoWlZTStRH5qbvTfram/6T4ou7bcudqOFe3ytlcbQS/QAUAO/Ig470ncGQlXvMlgKHnPWQ==@linaro.org
X-Received: by 2002:a17:903:41ce:b0:223:5945:ffd5 with SMTP id d9443c01a7336-22e1035713dmr208067155ad.32.1746487231684;
        Mon, 05 May 2025 16:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487231; cv=none;
        d=google.com; s=arc-20240605;
        b=YDJKrF1kWQ5JipteASL5azKM3U76MEV2TMNI2BqL7+rnCfbwRxMw+iWOaaOOEoXS78
         VFLcjf6CozV9zTGU2OspoojKIRfKTtZSExUo4cgdFcDu5YQ8b/VLmIJzMl2x3tisIShZ
         N9QvkcP/t8RhcwMSKkksfRG0tq7ED51P2N6YWnA6of6GY/5K1JIuNBOhQeWs5jTtj3cL
         HOF8pfJhT+PZ/P7j7+N0x9Z6H/157xrFh8TUo6UVYeyI5PrVhkyAOQk7ljisNfQPBUgl
         yC5diDBWb2LaFIyAsbgyfxURVwtmeHHh/eJNyDb7mg8P/EyOkrrAiA4q31VN242h2DjP
         aFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mduWzGcqrbCCMCYuVdtTD2ZBid0+LWN3eUl0cLQ5HO8=;
        fh=Zqg0tKm6PsS8aRPtELvD+vKVStjO/p4FErXA0dUr5ic=;
        b=bhzjez9/teZ751D/F2FgiXsIT1kaUQpeldJS3sFTFhXOa52vHuravW1uGxMIvRoOAo
         GPJ5/cNx+XM/gb9yNnKwn02YVXqz0Pu3cL/MJMnsSJ25cTlUA3QEH0xNnKQ5T+yZqis0
         h0zCAPERqYTg+ZaZ90DgJXpH8BaETriUnuPrcbNtDPE7iKO8EiRVEhOuNfv2+UB/wsFI
         a4xYsawSh/U5f5HkG1IuR9qhI5lLDJxoFJeAXbBwFs9xDb+W+OlzcTsQ/jCTxbHNnTFw
         hhs4KGJVRA96bXvO9wJgV2vt44LImgKn9rG/4mvKgPCBOzr/oPYCbao0k0udXoP2CMxx
         y7hQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QxeaA96P;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb232c8sor63515155ad.6.2025.05.05.16.20.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QxeaA96P;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487231; x=1747092031; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mduWzGcqrbCCMCYuVdtTD2ZBid0+LWN3eUl0cLQ5HO8=;
        b=QxeaA96Prscs+K2qiwxJdn5l176M0CQAMSbnJDK/eYE4HBu3JOqB0iRjJpwOnmwy/r
         RCHc0QQ7u5zq1NrdbRDsrwmasRzmn2jVNwVxxlDRTy3FM39zUPhWeubc2FOVfDhDKgXn
         rNTjuiM/LRKq040fhDz6JDlFfNX4VV/yixoJA0l9SjA7XytCNk3sNodVX8iR4e+yCUGc
         HkJ3CwjVe3ucaRo2ksa2m9IhgIl2Gm2Poz9PQwDMxYzBqN6hMrM9QMyPqTBSuBRsM9PT
         2PjRzHdtnkp9l8IyliRZZwsPGlq95fP5PV4PLw1IGIy+gsUpWzS+x2NCXu4i9AGO3q2y
         wpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487231; x=1747092031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mduWzGcqrbCCMCYuVdtTD2ZBid0+LWN3eUl0cLQ5HO8=;
        b=P+9MBPXbHnHZjeiLZCk2jKX3TrZ3yuR35OD47MxhlsAIb+N+7TxmTE3dQ3OG7K+Qnf
         tw86fWQDXYOQPxisbDgorwbc2oAAvCwyxUk7fr/rNCGUoLQpeuXCgFqIcaVhsUIW3JrG
         WwzFOaDQVWvGv9C0aqoBAN6GvHC0qvlyLr+1/AJs8c3CwbB3lL5hYsyPGG2BeDX2xr2x
         820Dvw9NmugRSjpZAseeIHgGc8o2O8fl7A5jQO5S7iuNYbj5PiQoAk5rMQ5DPXAeWLao
         PhKmJubetoOvZkCiXkI4ISQfC5HU6FfeyYYftFOudwShXzOmMwiSQ/hBNM0HoMofLjls
         ZSaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU4frgICvqCyMxluXab+n6XhF+6/wOhnmLaEfQ5mKAo67bBiEWFwqWt00flow74ha1fTNWZBlvYgkKiw==@linaro.org
X-Gm-Message-State: AOJu0Yy19P/uVaEFPn2SOhCuoF/NFTTJ0qIc6oMmeNR229Dq2ck2twIV
	JV0m2qJlhCg32sZRWLWprdLy3+sOex0BeYLIC5b0IZDkduaH/MnSvCXKu9qcKNGyjVNo8yJ77F0
	yASFu9w==
X-Gm-Gg: ASbGncsbLluXgC6Kaarcz0JnKPT0Utmkh/uHt48I1Mxurvk1mpkTBbI4fliYkgN+cAN
	of9MBsf3UrJBHaJBxGEZAQvgWK8DoPVXJ2CaA1N/fP0ejT9NvOLp1KvkQRcvFaXPfU5aezz5Zns
	p5/oGctcrTSuojT3Ft5CsbuFBB5QClqQj203AnsliR2e7/JKYmQBZzt1SlWjPluPeQiY4OkiRbR
	cdOHGSCAZTU5b5RWhB6PjwqueVemknRpxEtcnJI2oqMm193xW7qaZjlP5fqBQ+UUfhjzHOlXRzZ
	WHhUkpCrjfCvctB3RS/0OWOjAW51dnMWrp+QcMmt
X-Google-Smtp-Source: AGHT+IGJHQGPT70iQq1g5juc5YpCbtYrYWmQM67WZQCS90h22TJtC/LDouxcVdEq8FF9T4pmAb8ojg==
X-Received: by 2002:a17:902:cece:b0:223:4537:65b1 with SMTP id d9443c01a7336-22e103571bcmr236825665ad.36.1746487231323;
        Mon, 05 May 2025 16:20:31 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:30 -0700 (PDT)
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
Subject: [PATCH v6 12/50] target/arm/cpu: compile file twice (user, system) only
Date: Mon,  5 May 2025 16:19:37 -0700
Message-ID: <20250505232015.130990-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: eo6owcDDc5dM

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
