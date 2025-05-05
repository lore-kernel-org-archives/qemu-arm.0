Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178804njj;
        Sun, 4 May 2025 18:52:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6OtsVDWlwGIZbQa2xZmE5OrXy2qU1V5eP4qapqTSoQHVQdiigM9cti8C8wZHXl//RTRw/uAt2az1kzQ==@linaro.org
X-Received: by 2002:a05:6a00:ad8f:b0:736:5f75:4a3b with SMTP id d2e1a72fcca58-7406f0b12dcmr8183649b3a.7.1746409966670;
        Sun, 04 May 2025 18:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409966; cv=none;
        d=google.com; s=arc-20240605;
        b=QzRlhm7QsF2eQpsao32SmAObZydkh7F7AeRIYHzafUHMr3TLJ4okUTiXqzqGsj0goy
         9qjrX9RbY+0E4JtW3rPb1o+EFns3bV869bbFQIPv9cTNzvvfbR39O8Rg3iWTW69Nr/3n
         1eWkm2pe3On8aGD+D0syTJjKB7sBBb1otnNwxCy1zPQJz5MyUW4e+SGF7jTycvkcJePg
         HexBgfcKBX61Bor+Ie3+y/PM7NGXf3RnTBujF7StgdZ/1PaK03ARSTnkWvcHEEx7oAf8
         YidNcgKejCM2x3ig7zhpMlafkXb1HlN2/3K4XQHBISWcIQxtJprAKiI9fofIxGip8T6f
         HkXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=u/RowU+G9lDkd5OLEKmfnzuDeOXrVzkwWk098+SYGJQ=;
        fh=k4NCdxn8F6FMk0bEtw2yWIaKt2Hps7WtwICjkrnEWA4=;
        b=Y3UxMbqLwXT6dt4xGeMG/RGrbO3MG3w1gt33rFgQrdnGKxb3VVpTZS4ktrg8KGzLPi
         trGvqt81dd2Nocsc4t8MHiVdOcAgMiaRLaSlNwdjmDvq0+rHNAHDNK7q3lWFiEaPCoK+
         hr01WoSwmiYDzdjL5zPNSgdXPKLR2/9YF9IsY3IM8dAwtL9VaUBWSZKARqKPTgwfAlVH
         RQ0GfjixXW2HaTrkMRSsNsA/9AQf499Ns6bpfL92Kr66iGf7kiAwdKfdwfn1gAFEnqJX
         pbTEmMvQT6thWtTe2YzUlDFE0pCbdneTi3pSUKeHnUfmfcLj3MfqVr58t8z3i2oGH7KV
         uBuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TVBt/il6";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f7c0e04sor3888207b3a.6.2025.05.04.18.52.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TVBt/il6";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409966; x=1747014766; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/RowU+G9lDkd5OLEKmfnzuDeOXrVzkwWk098+SYGJQ=;
        b=TVBt/il697Q65YwdcNbmpoDQ6Z00QipDkBg6tF5l6cunxOByn41ivkxl9MJmGfqYof
         gClrZgmfOP+y+z36qJ6k+N53+l6vgBZjMqXp9FUfC8Gl21buoS0dQXnWQGNjPeDJ8SvL
         BlfGxA9VPnI2ZhBfyuiaZLh3S31iVN8Ddwd0nxIbQ7HrxXFIUueBAFFDzWo2TB4CHsdD
         b5o2fo1oApE2lIgpEDf62evoq/6+sgTTxXs9RZWhkjBT/tmoK3VHAGHwm7c/wIuEjETN
         b9qV2b+HOKx1OyEIynrLqeudMm1GqpO9ormFCWdZvt7P0MAhJ1bj+4D/hdZ4iDpyzxzj
         jJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409966; x=1747014766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/RowU+G9lDkd5OLEKmfnzuDeOXrVzkwWk098+SYGJQ=;
        b=N9NPRKjUNVTarGP0SdCd4E9xzT1gTtgfs2JDqDO+UDvoLUYlpKKhCjLAjQMRJY6Xow
         msJrGwCK4FFc2XT9avJ8V5vi9yMTRrhzrlKcFiR9UzmM/FxbYG34YtbSMwwF4vNGGtib
         ShZGA8BW3pQ8YsHeS+7vTNrlErw4upQH3Tw08fl6VnOlp0gzYt28gSP3xsvfqNU1SgdY
         XFgcu9NIUkMWhvIDYeYqwctiIDDgfaH2YXid03rjP0jW++fyiK4BOgJiDkFf5B/pT/4F
         eBxSNjswIyXUhKa/8AB0ex2FfGr/1eX5temXdSVHzkorZN+h9TOejiSlXKCJJD6j+Zz0
         zcrg==
X-Forwarded-Encrypted: i=1; AJvYcCVmt7wyYnpLMnHn3XgAGJs8iiIRdUzJoPAD+9ldq31VNEyQjNkkYcmfESIkXnK9Bz/sT6/q4XOeDsq3ew==@linaro.org
X-Gm-Message-State: AOJu0YwzHiNOmZSy+CbP6IqW31Su8YAyzut0nc3LqZI5HLe27eBQwmK5
	+0+/ckTy7dG04KAyZBJdhDE4D1/XLKmK6WpCCBkEsVb44tW4mwpejbm4p9Es0Zh8tQ==
X-Gm-Gg: ASbGncujb9hl97bhSju75YiaD/YQxPyixmuS1H5ngSg0qkO7xQNazbP4888fT4+vVX/
	/wYctPN9RtGVEIH94JpXGBewRZLjaKRzo8Wt6uK2apcikv5kiiGQ7XRm1JZRjvAqIv018BZ4Scu
	k6jjxEyUD0lLG20o9cre3J7o5K0+vvrKmDtJssd9JDaV6R3f7GMjzJogYTWVT0C60HcIhX4LriG
	v/y7V31Zrj7wDwt7wSREc3N9zsiEU0k+p32TTa9pAfh1fJEpJ6LgiLJ8O6GEYONcsz4DooBZi7v
	5to5pkxK/40xCm/pVElXSehD+7kweGy03uE/yAPuXKGzBy9fP4U=
X-Google-Smtp-Source: AGHT+IHvKSJobjP6MasjBNHYZkgZFCidjZ93WTofXhQPX9cCEfH7oVgrZaz5xL9shO2OYO2rSBmRrg==
X-Received: by 2002:a05:6a20:c890:b0:1fe:5921:44f2 with SMTP id adf61e73a8af0-20e969e9676mr7298784637.20.1746409966282;
        Sun, 04 May 2025 18:52:46 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:45 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 20/48] target/arm/debug_helper: compile file twice (user, system)
Date: Sun,  4 May 2025 18:51:55 -0700
Message-ID: <20250505015223.3895275-21-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: KktSl+ldR9cV

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index de214fe5d56..48a6bf59353 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,7 +1,6 @@
 arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(files(
-  'debug_helper.c',
   'gdbstub.c',
   'helper.c',
   'vfp_fpscr.c',
@@ -29,11 +28,18 @@ arm_system_ss.add(files(
 arm_user_ss = ss.source_set()
 arm_user_ss.add(files('cpu.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
-  'cpu32-stubs.c'))
+  'cpu32-stubs.c',
+))
+arm_user_ss.add(files(
+  'debug_helper.c',
+))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
+arm_common_system_ss.add(files(
+  'debug_helper.c',
+))
 
 subdir('hvf')
 
-- 
2.47.2
