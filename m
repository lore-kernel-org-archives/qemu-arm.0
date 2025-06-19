Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp252669njc;
        Thu, 19 Jun 2025 06:13:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTi8du5XQmZfi0hk6u8ol67X75thjpbs+rkAmMejhTQ1Y1JbLRVD9RBV9NXyj5XpV/MuW6Rp7GYFMPXQ==@linaro.org
X-Received: by 2002:a05:6000:200d:b0:3a5:39ee:2619 with SMTP id ffacd0b85a97d-3a572e930femr17728385f8f.47.1750338830032;
        Thu, 19 Jun 2025 06:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338830; cv=none;
        d=google.com; s=arc-20240605;
        b=XbZt+zgLqI4khTehE2y8zWrBivVPdCGGUX6Qm3tieSVKqEMdDkp8Rr62Yx8B+FIyIV
         dAQtgE1nWvWsiqzkRNwcBW9JIvDMZt0oKLGhCTcOoULe42rKx0JllP3pqpQmbUyWA6M1
         g6+aof9zbHMT1CftLoyYioNrzt3sOTI8+GRZZxtDOJEo05FgTrr23ZmgK8/b6hNMqAks
         EEiKjLJzPu1ljbd45O5eY3XjO3hjYW4YwZj6aBn1r1L1xh3bpXmqPet/5/NKN2+IoDLK
         qf1YWQ8RapJMSPdo1mvqBxBslYs8sPip8Fq0uKHOhzc1ocaqYmahmVlu1I9sgYklT42m
         JcJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=koI7CnNYm2D9lEvcJSA5oXP0UBqqfZr7o8MD1iUlpkk=;
        fh=57k16ANCtUpmY1schzGQFcwWEYTTyc/ya9QKco7rCEo=;
        b=HrJjwQ+aXqZ+RqRTHfmZAeCkWZQwMASRC5uQ3zLINl8YdVBN7sTwvktqvgo01suQBH
         idoSrltR1uJ3KC6P6pXdJsihM5d713m72Lpjq4BIavmvPf4szEOIAs6B8LuRFGPfs0NV
         7ZXSUUGIrjBhHrBXFcqyJ86i9nFLX3tA0u6S6Pay/unltQtaPtyQUuzNHEHRH3Y7mdAC
         jK6RtWLw0gsNtyU3POmfB0kZZwrkafQRNrVHPdDJtrFdXoN5HDnLe1q21lvW1NsOaaIG
         F6Np3t0vuB+lnHotsqM+8g5P+Nyit7luMUkYNYrrtvSGjVIBQnPc+HoOCbPDik4I2/EG
         oWCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lKix3y6G;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a5619f31f2sor4624244f8f.9.2025.06.19.06.13.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:13:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lKix3y6G;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338829; x=1750943629; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koI7CnNYm2D9lEvcJSA5oXP0UBqqfZr7o8MD1iUlpkk=;
        b=lKix3y6GmuHJJtyXiMmkGiFtDOvBdGpeUjDMmF4GvYY36gloaMouZZyHgEtqAg8end
         C4ke/+n4d9uPom+Gm9/q/V1X+axidt93OXTQZbuWO3qDcPefSTj0o0aJspHZC8MF0Ns/
         5EOlTdMXEnfjP8NlEds2N6+fPMJ6oLvEiYDPWFW7YSVyA3kmgPNfJ3D0/7SabcLXJyqA
         0VkV+6fo5HgtUSlIBRlhnyK/Qz3zswtEPqtp8lmuyWpRvUAFvpdO8fH+6RWXb8FQc1Ne
         yGI9XMdIc6Vk8z/uLfz1zLY6ZfUJ/7ggIPZaDqFoVVRTuFQfSrOpSDMidBNgPekhpxnJ
         9CqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338829; x=1750943629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koI7CnNYm2D9lEvcJSA5oXP0UBqqfZr7o8MD1iUlpkk=;
        b=PGe0KtW6Y6H2gOoS3Tj1HWbgLJULYx2p3iCig71vGE7B3Kxyu46LEujrHl1zXhOebc
         ODUssvRf30UtVtBUQjE2XVqhEnU3zPG2B1jvUjWcaNqEAlvmx2VNtf2ze7sbU2DhT/tu
         FPkaOEfp+1TlVAgTl66y9d0aPevkAyDjrDF1MoyP+88sVLQnImhu3Zo5H957qguAoyWW
         4hYUAZl45fHDiUhGgSkRvuFV9NuLezAeM61Cl50NC1uhEvxqrnLn5A8uMRfsNMPWbT7q
         73cJEqST/X3tJjOMOWs5m6UkThFyY0RZzA5fQFAVMs3Rg+XtM9mAvdv3Bmjm+5goomGt
         t4yg==
X-Forwarded-Encrypted: i=1; AJvYcCWTfiyzuq7m0+2bKB7tIXdT9/fPwderihwHHHcJNPMx9xsMusMYh4CjNA6MPYbGlSGAETnx4s2hVktTcw==@linaro.org
X-Gm-Message-State: AOJu0Yz7xy418bkD/Ff7tUreKFWkCACMdZsyF8AlPhpB2RUmiq0q8pk3
	5RDLuqNN82DybJJr6OuIotRJW79SLhN/KGEK4/7FESL+JzOJjdl5983k5/FBL2hdSosv2XT50tK
	S/Ssjckb5rA==
X-Gm-Gg: ASbGncvpsgocaI/B3LzwHe0JkEWPAFNNZDRv4mJkKdaDGgRkIqwbh/Myg8gosaRQWJy
	tMtIpeG2Jk5CTrO6H+dDvIkKggj7ZuJ2swyVfqtd3Tqg2b9nwLmdIaAw/rrv1Hp57mSTLq2vGJ4
	4LpeTTJ1PI3XF71SmENFOulIEqbq6tG4vRY5QGGD2ZdMGGoCWRFE7LXL6vnLZF9kl/rz14mTjus
	mW2QOlUygBMglrgVhr98/EDUjQue+3etZdw6HggC5WL2FG9DtcfydhgnanbK/av1/DnCPu6efQB
	CSd0iEPTfYIltGgqwyC30x4gRq7mwMYeJUe95rn6MCnQ/cJ3Hb2SkJiysNluKxvyODRJD+iwx9q
	tKcvW1s0uVLMKJi76v894QhJfE07TtWE2jvLP
X-Google-Smtp-Source: AGHT+IHJrzY26z4C7tz2r1whofL/rZErrzZAlc3mqjpoocixPuSsJt3B+u9kOmz8CAv44XQRwKEYAw==
X-Received: by 2002:a05:6000:4b03:b0:3a4:eac6:e320 with SMTP id ffacd0b85a97d-3a5723993bfmr17703990f8f.3.1750338829465;
        Thu, 19 Jun 2025 06:13:49 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d98sm19334475f8f.7.2025.06.19.06.13.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:13:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Julian Armistead <julian.armistead@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 05/20] target/arm/hvf: Directly re-lock BQL after hv_vcpu_run()
Date: Thu, 19 Jun 2025 15:13:04 +0200
Message-ID: <20250619131319.47301-6-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Pf7xE+I4ClCX

Keep bql_unlock() / bql_lock() close.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 06cfb7ba253..30dfd97bebf 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1912,7 +1912,9 @@ int hvf_vcpu_exec(CPUState *cpu)
     flush_cpu_state(cpu);
 
     bql_unlock();
-    assert_hvf_ok(hv_vcpu_run(cpu->accel->fd));
+    r = hv_vcpu_run(cpu->accel->fd);
+    bql_lock();
+    assert_hvf_ok(r);
 
     /* handle VMEXIT */
     uint64_t exit_reason = hvf_exit->reason;
@@ -1920,7 +1922,6 @@ int hvf_vcpu_exec(CPUState *cpu)
     uint32_t ec = syn_get_ec(syndrome);
 
     ret = 0;
-    bql_lock();
     switch (exit_reason) {
     case HV_EXIT_REASON_EXCEPTION:
         /* This is the main one, handle below. */
-- 
2.49.0
