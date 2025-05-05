Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778192njj;
        Mon, 5 May 2025 16:20:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWEq3WmljQza4z/6Xf/QIToGSH+lbE8OAePW70JMnMXHnsDzd/Z1Z67SatkbNPgiXt0khnJ0YAHxHEZg==@linaro.org
X-Received: by 2002:a17:902:f544:b0:224:10a2:cae7 with SMTP id d9443c01a7336-22e32f0b0efmr17310155ad.40.1746487229793;
        Mon, 05 May 2025 16:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487229; cv=none;
        d=google.com; s=arc-20240605;
        b=Un9sVtxKocPq7164xByC/qCi9eI4l+xwRvN3J/ehucwUd5nVyRx6y1W0DfnJJBFbfp
         DjyilowxoFUcyZWGfa451RzsJ5manjRHDZD3en2sfraFbRiEO/xPesWsOV79nR8SW6oh
         oU5npIiwSLmRDzn5JHX8UqcofkKh6EEuXggdplh8O/elJKcacaJbZ6b+aqICnptBuCI6
         Kl4PW/P1O2C5sWMdqCgwtEVOgxeYYZpOWruhRNkfCnoUZvjB7KkiPxSLjTykgY04ynP3
         XV8fxiW77lyk3O/FxwSM+X1LAkjgsebFSgMfuZGcogECesiMyZftSO/hPl0G+mNjgY6u
         lxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8+98FJCPUkZxLytRMJNRmc7jhTB2VJSy0tbuhiYCP08=;
        fh=k++SLCCAp4/9NoGDkw2zW2HmEsOkdkXUa/nFsMKKzdw=;
        b=lY++sQPYPCgvGibgDysNq7fuaPOmIjx/+Tbn+ZffGJi+MZWFdOiGCwq6Yh5sin9G4L
         DgVoYIgyrhud1VYq/7Otrg35p6rYLFrCm/Qzk1epz8KOFC9WgEs7kjwIPM5cNlWSbhZK
         oUUmss6xgQ6zxg7hiFPOvBeOmWLJXWvmtMw1+qnGV0STtFAl1Ah9HRU9CWujwm5kMmej
         tt8sjOXEwpFqw3ir5PWvMZ1APw5Yfrh8LotWvNyAEwm1APwECZ98PszX0h9Cwks4bgmq
         dbjv7pOkswrDWYpl2IubazFL5t6rqdtBfmFIWnpAlRrT4WwuDVjxOm4tcg0I6VdQpbp1
         mFHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zd370UUb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb05adasor62820355ad.4.2025.05.05.16.20.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zd370UUb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487229; x=1747092029; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+98FJCPUkZxLytRMJNRmc7jhTB2VJSy0tbuhiYCP08=;
        b=zd370UUb4tTV7bN9Fbf2AvJubFl3//hLL5SnWwXbfp2jQq8fLhLIIrg6V2BJruVdBj
         754EddPN5uUSOqyi71tX481/kfYO8RsE1aQh3mloDfoUaNHNzu8a+4m6X5laEmUX2PkL
         uHl48s1OS1tkxLdJV7Q7lRQ/oYb/Vk6TLcHW7DwENWN4Fp3qspW/NSayfbK4NP+dxc6E
         xNo3XEFcXGY5s/FWWhbKUPS6z7jlkcOcdImDlckb6wARLgK1rCO90wQp609fKs62nFdg
         0j3ddtwWxliEJK13j4T03/+Wn83XnytjH6ZDyFegZ3tOAcivn6RBkuihOyvezdxvQq/K
         5nPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487229; x=1747092029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+98FJCPUkZxLytRMJNRmc7jhTB2VJSy0tbuhiYCP08=;
        b=M9lDAm+f7WBihAM4FKupNI/Cmyb15gzcpZCsHvpcOSz0qXcbhj/IZPgsVPkMpGRYT8
         24xNxWk3BN+vCyvl1woqChKtwcUiRVFMaPr5FM9umvDsC1Ek4WOmL6dvxBkMdAiUKMYD
         yR+wHrXLQU1T+rxp10YqIqztcFJya35lN4xS1b7t3r8UWO/JS8sXhxuLtdrdD0dceLkd
         X84ccdQjKwoQ6WxadfwkFtenW4otWQAzy3ZALBLNWbvzxpA0erIplGFJTumqzDnhUaTX
         0CIw5LYxV+NJepn0vTBHJRY0hH/K5YXYDxYItv2afW/7lRBXMQ3v2LQVmpv9TsDKpX2v
         Uicg==
X-Forwarded-Encrypted: i=1; AJvYcCW+5THnUw8ToCma1Lf69Q1wK+00lQeCgIxL/Pvk/Rp8sZVopSuNF76aOKwf8SNa4zYtftPeHsfzyU0DmQ==@linaro.org
X-Gm-Message-State: AOJu0YzziIqWoIXEIRVNDxf2EA4kGrnwcPBcXRGhZSDT45/4e3FavMcW
	sVaHra/yFoLkXUghg+3OeA340OTu7Z0utRWioDr7uAY9aMCzdv59HsQsK6i76YRx5A==
X-Gm-Gg: ASbGnctf1O1rcwojNqmU0tHSkrD+F3tGEGDWtUTdfdHzF1NbOxZBlN34Bc77XMi+/j4
	bY1xb6aV+chNQPmFC8PT/Pxwi0BiVvGN7II99rQI8YabXnKCKq61YCu8oyWRmzJncyyaZug3CAw
	GDDhwR5sGp3Gj88VYQz2BTrG+fm2AavzApD+d5ZzxLPyKAhCBQzBZwoGlaoLqFirpcFpadWwMpD
	JaKKDj3meCug0ONkF2I0QgdyKU87RZDHG3O5lTK1BYGTmngv3jYFcGY5iqFViNwJ84GGcC7byG2
	2afkpah9MuuEwelN3/rZ1Kkcbc5aJ4lVq7pLc+Pl
X-Google-Smtp-Source: AGHT+IGafCDnzbl4XsOgKn16x55qDqZR3cRsQY1YC271VQ2ahGmfB+GhbWbfsVVZQQMU78koO3U2SA==
X-Received: by 2002:a17:902:ea0b:b0:216:6283:5a8c with SMTP id d9443c01a7336-22e32f08e17mr13948765ad.39.1746487229414;
        Mon, 05 May 2025 16:20:29 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:29 -0700 (PDT)
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
Subject: [PATCH v6 10/50] target/arm/cpu: remove TARGET_AARCH64 around aarch64_cpu_dump_state common
Date: Mon,  5 May 2025 16:19:35 -0700
Message-ID: <20250505232015.130990-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: n4RhwTXrYTEM

Call is guarded by is_a64(env), so it's safe to expose without needing
to assert anything.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 37b11e8866f..00ae2778058 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1183,8 +1183,6 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 #endif
 }
 
-#ifdef TARGET_AARCH64
-
 static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -1342,15 +1340,6 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
-#else
-
-static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    g_assert_not_reached();
-}
-
-#endif
-
 static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.47.2
