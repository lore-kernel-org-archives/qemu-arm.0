Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19556njj;
        Wed, 30 Apr 2025 23:24:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1YzudKmog1n8o6k8uE3A3P02pITR3rSkpfR0Mxmm0/RymJSzELK9qFiqVhyWn+t/sC+9f252TLyqgBw==@linaro.org
X-Received: by 2002:a05:6a00:3cc9:b0:73d:b1ff:c758 with SMTP id d2e1a72fcca58-74047904272mr2680888b3a.18.1746080641617;
        Wed, 30 Apr 2025 23:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080641; cv=none;
        d=google.com; s=arc-20240605;
        b=GtoylqvlD/W4kf6iEDQANN8wECU5ZwGz274MdY4rk29zzhuRTVGD8CndJG1yHgs8bC
         aj3w+1lXZDCkuGTabhZolQLQ9DV2e+D2OyQWYjQUihOAcZK16HW9ssb3d6bYv1NNUqnB
         0+bKoIOyDcyWKEN29C7oaSKlzOFs9eoK2Fz9tvHvbUQft65ALIG2SI5CtsBlSeLKxvgX
         UlNM2jbYzyxakg/8cIyAtA6v+EFhuUI5Psj1S/pSL7o3osur8M4F9Ey6yNHZAwacZ14I
         45q6P7cd2s38EE41/34wuhHkM+QtMkewljWT5PxpDIk1mDEyF0F9Cy+y/c1JzhKJ0JCH
         3e1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=k54PyA3qe+UbX4AzHMockqDzIGWdHV1GUXIbKPo2M9I=;
        fh=4JZxk/rj99/iMAExAWjnd4n6k9w8pwvwg+pbXco30gk=;
        b=RYLwdkPEFWn72U5wcNkjO8e9UAXa5xYLJckcQgpD8vZlhD8n3BffVpNmLl/fH5ZvAb
         ywWB1Cg4rzn16tU/jCNinC9/3eI4aGEWmZTnlkgsL2lzJ8n1J89KIKSORwKFQrrbiXkA
         XPUAu/+oT8TizSfLWm2eOjHEcgjgqTht45hrdeuIjNefiNHc+yzzNFvIUqR09uzMzami
         o3FX9+Dye/glrJg9VO3KpJa9/t23hcmKkQJ97SgjpGIYIhpNtpTXV18DLuf6HQI2uSkt
         Qxn19cfYPNZItb44ABsMl6qYorudBVo85Z2gzWggtewEvQcqsJ7EfZ/KhS9/SosDwAdA
         z0dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=azGvZbzs;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eeb73e5sor120139b3a.1.2025.04.30.23.24.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=azGvZbzs;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080641; x=1746685441; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k54PyA3qe+UbX4AzHMockqDzIGWdHV1GUXIbKPo2M9I=;
        b=azGvZbzsfBJGEBWYD351YI6bIiDYFqgnRUdHbThaY4f2Sr56OIhLeeInIyHpf/eEnc
         bZW9gtNbVRU/6jqBOW9Z3J/KRX9ZwDFbUs+q5grPQdFznTW+EA9tfVdZRocTGJOl72RN
         FErl+BbdEUk8p9I+rJYXqJkbaVewkid145b8hNK/MvhxmfgECOy5NLi8JIZ8MHJdEqI/
         fI8dayb+ZAC3WtpWFY7TD+E9DErtgJ3EY3WkFSKBS/ncjeQw756BQd9r4jfGESI/yRPD
         sD+L1cByO/pQ5eJkQBJOBYj+QwEibwj8iuNmphtR+vRRrnepXwzQYYKcOdVYh/tSnMbC
         EiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080641; x=1746685441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k54PyA3qe+UbX4AzHMockqDzIGWdHV1GUXIbKPo2M9I=;
        b=GOonAfrnCz6fJ/Or7hVaf6YfrcZYMx8g3aNbD4UhIBGuZw1h37MBhOS0OO5rzNW0kY
         eaOAKt7/rpRJSUyc0Y8entHF97CT3itZX8Kk6+EwL3+PfWS1ATC07s88WsprzfUM5HYt
         RAszCKy6ymNdNbIxxsmzyWNDh4/bmDb/XBVsaSzzg1PLyJK0Ol3OFeivCM7bYQf6LQ0y
         7Tc8j9bXO+6q/gM1nrHYwyoyibxllAzgVavdVjTBx+8yjT8lbGYTBm06P+pmka+xl5ZK
         Xg5NXE3pnLbjOKKvFDVjZEY5akIADpxx97YchTTYQq8o1T0euXcPRaIriZ3252Zgwc4h
         Z+uA==
X-Forwarded-Encrypted: i=1; AJvYcCVBrLNE2PJxNTcdMrdNyfVGRswyWpzzUY8RUJiFoekkji3U0NiCWdLbhqnhl46TkKwT3TZyycpwqYKn9Q==@linaro.org
X-Gm-Message-State: AOJu0Yxo82dq0dms4L62zjAOhKtB/dZ2FHv/GEuKKHkCb2r/HXoEhAD0
	cN9IYpkLwrg6yXiLEVGOP4TeT8N/5lwInqbu3fNQWNRyF7Lqjq080PUToE0DDX83Mg==
X-Gm-Gg: ASbGnctSRQOJCFIcmtqeuxtgCriIoswf82CgT0qoy59bDL9OiiEAkwxdcJ2G09C2VUJ
	gr4WdBFOGlcyeZdfCsJspgfCzRPZeVB+98THI+TYcJ6Knc5EC87WYZA4kPmGDV8+qTFeIZfqOxB
	w+l368mhB73TlNMO9hcJyiszaY03kNr8ZcgJeSP2dpWKmfgkb4IFm//TsU1b8xCvK4a7wbb3Au3
	rrd1e8ZhIAxjayxTXAHnk8wF/aFet5vLO1NKBiPQSTSnxxoUOguHSysvSSD68x6FqEjKtrH2QbL
	iNBjYco/3kOwl5XlaB4lbiqvnl/Le8w8SprUayx4x3mva0cEzM0=
X-Google-Smtp-Source: AGHT+IGGqIMGeAE500q1l86u/9Td5IJIvn3/wPWzMJrXJrwn66g+j5DSrcvsYCEO1nuQYpFIbL1HYQ==
X-Received: by 2002:a05:6a00:6113:b0:73e:30dc:bb9b with SMTP id d2e1a72fcca58-7404775ccaemr2024449b3a.2.1746080641210;
        Wed, 30 Apr 2025 23:24:01 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:00 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 11/33] target/arm/cpu: compile file twice (user, system) only
Date: Wed, 30 Apr 2025 23:23:22 -0700
Message-ID: <20250501062344.2526061-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: L8v1Q8MtLmap

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
