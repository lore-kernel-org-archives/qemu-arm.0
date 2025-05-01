Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19611njj;
        Wed, 30 Apr 2025 23:24:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcarYcNjPZ2lp/M1nNj4zBD1lci+AJm0UDDXm1nGpUiLJ9eAyKX0dibUJjFqWaNiWDrMKeCAXL4WRDpg==@linaro.org
X-Received: by 2002:a05:6a20:3953:b0:1f3:237b:5997 with SMTP id adf61e73a8af0-20bdcca171emr1844398637.14.1746080647963;
        Wed, 30 Apr 2025 23:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080647; cv=none;
        d=google.com; s=arc-20240605;
        b=JARPpLD3+YuRRnyTrlRRjp9VpLxHOJiFDu5iAyKp8byAFXyawXBKY4/H2jpJGQZxxu
         eRZVOR27GZbYJarL5xaRAt7YA+lqKImjkudVWzG2R9+hrtvnaulFtlDP2qFXAwxDHnV5
         5vmciJB5Yg9ZnRQAVnL8VmnPSHF4Yrnt9YWr5fZC5VMnvQIBt/n1aSOnRh7d63LngKUN
         KFv2qXSRtpaUhQE3I20B9SRSwcZX86NPHpSstCPwF3V4Lft/WP4hw5Z+Lq0bcjEONwZK
         46YxW92oGwTbylALNw9sDEJjujetqth3QCyRIVcqR+bZICdt9+OMHtfrsvDjxo1Lt+bH
         ax+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Qzuf536sTBCPBJh4XYxjRVhgJRgFP2T69wvlX9E/0Ys=;
        fh=jm6aB28NgaBa9sH8sBVyqd2pp53rodhvPsZQfjPp4sM=;
        b=Cw1FWnJx25REP5hSplaznkt4N2+LoJaWJIeqOr69WW1RWMNyVxDukQNRw1zlJHk3dT
         BzSVYb6qnLuOXeiCGrVsy1hkp6XSawnw/m1/XS0IHkXygFBtf0e7DHoc184UhjWL/Wsw
         hdsmYkyWwRgusNwdf2R5I/Bw4bapInxKpgF7V1kh+Cuwnzg9zy9uiiFPGKG04e/zBWq1
         iAWkBniv8JvN25hSkBUfYbFycKg236mOly/HcnTnx33IXTkkf2u8+AfZ8XDfWG1o1Yva
         V7m8066taz5LedeeI/Fs5Uyp20jJPVN46mIqe4+4jINElA9NjFPE6ke1Z0l0L/WuCAu1
         PAhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YSiPxu9E;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef18429sor68772b3a.2.2025.04.30.23.24.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YSiPxu9E;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080647; x=1746685447; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qzuf536sTBCPBJh4XYxjRVhgJRgFP2T69wvlX9E/0Ys=;
        b=YSiPxu9ERAlx1zQ683OaSdCXs+K3jNlwoF7vgfZjAXlFtNo/qBdpoSKLc6qpCOBcYW
         kVoHVKCMHZiWJC7cc8BvyCZVicTnXDBYrqktLGIVkpiydo8fbEUadyEJhE9P/en3aiUu
         oW+hEVu2Poch64fuXZOgoTSx4oGqvR4FQ8PREcfE20GxBjRH5A9dro11EdyX78kgEqtO
         VIHShPFKEMVPMLkMtKUWV/1u2n3t+++3A0hdPkg777ep89jqD2Fquw/b4gL2ZZ8V+0gP
         noHiOQPnCsu8r9B1KTsB53ITW55P2LFfpdbPnrMy1O5VxWGxd3E3ZPFZaCe4gnX1UkpN
         Qimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080647; x=1746685447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qzuf536sTBCPBJh4XYxjRVhgJRgFP2T69wvlX9E/0Ys=;
        b=vJGJoIvNOwlK3N8QyLFV4l+2GrY7aqhuj+hPit/n/hShtQ17m2HYwhmj1upTrIDQWN
         gqKGAeZkkJjLz5CnNAQ8MecWHwQvxqI5U9YxvHe9k3tZPhurI6lU1PTS2rvaiaytAVCj
         3iCQgZnlUWOiFGMl2NAMPZvmXCzuFWr4WAGAwgLYcxS/xZCCDdv2lTI/Skmj+Q5vuR2Y
         1F4CtH06i1HnOCsbNhbYNYh0aBswZRLNioorvdazk1D78liAfJAytWzADyklo8cN93A/
         gqsyUzXLaHJ/R7mDvOs2XJXSnl1ZuBJYGGvX0SqvT0aza/6KXPbMMZJ8JmSpK4U+3mmA
         KyYg==
X-Forwarded-Encrypted: i=1; AJvYcCXgvLTBUvmgJhrgsd4Xsy3Za8GFcyufq+zUVeS0TOPnphdSZd8F3Qsa7K7oLxbGW89RBt3zwcS3bqyHGw==@linaro.org
X-Gm-Message-State: AOJu0YyqOvbJOnx5iOBAsfhCqMULU7uZF715Rl8R8CwW5/yHZqmXyX+h
	WsEuHhel60D9YUodF7GqV2H3M2cFRFJrkEthupPv9kB5dHRzMH03iv8//53BfdACGQ==
X-Gm-Gg: ASbGncs4mPEzeMYkC7FEPQDfOkTu6U3aKcVJ4wRxpxdtIPLnN/Lak2e/K+i02bpKVro
	GU3U5p49kQpR9HqgTito0xbZSM4Tk7OLRSXJGl3QrJrE8bpOACfPdTzMcEBszY0yHfHWWVd4qau
	38ecKGGx4nBPHucKMmuwvokkqJzLpTLNrQGbbX1LaysVFrNrLh03NCLhgaMHxZCdDjBEHnwRfFT
	yupPi19kWiwcWgs2nQKuZy6xQP8bdPwYNW8bt3FQBYLfZvBv7jkU7MfVE2zlOdBZFLRwib20SAd
	o45aZilSH2RaMn2fCwR8vh9s8xizqgTkLit8GX2G
X-Google-Smtp-Source: AGHT+IH60rvhXzsLotyuJD4D+gAsur7uGwYqaWIbCE5FyrkEs2z+VtwB0w2/b05zf6FPVjJahWsiMA==
X-Received: by 2002:a05:6a00:38c9:b0:73e:356:98b0 with SMTP id d2e1a72fcca58-7404923d1d4mr1814773b3a.8.1746080647585;
        Wed, 30 Apr 2025 23:24:07 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:07 -0700 (PDT)
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
Subject: [PATCH v3 18/33] target/arm/debug_helper: compile file twice (user, system)
Date: Wed, 30 Apr 2025 23:23:29 -0700
Message-ID: <20250501062344.2526061-19-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7pQEGLAe0K6r

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
