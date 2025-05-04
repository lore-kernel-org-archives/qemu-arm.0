Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756111njj;
        Sat, 3 May 2025 22:29:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUr//83Lkd3FNm5rBhH6wR6mAu/8JFcDzbsYcJa68Xzh23Oe/AwMcBuCahIe81kvvj5ZH/JBj7LgSckBQ==@linaro.org
X-Received: by 2002:a17:90b:2685:b0:2ff:5ed8:83d0 with SMTP id 98e67ed59e1d1-30a619aa2cemr4942332a91.16.1746336569552;
        Sat, 03 May 2025 22:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336569; cv=none;
        d=google.com; s=arc-20240605;
        b=hAW5WbJ+pmx/5EYiEvOKFYu4a1rCUeBWYmxRfMkASc4xRBZ/PkTRagopSVhhaL+KAH
         dnG3KiLltwOXwvb9fx62Hv8GmDsnKgD6gbuvIUyj8HV0HiNy6kN4eQHOApudjAmjp0WB
         EZlBRE8bwj0tzaS/FKwHdgy2XMp5VwXcXHXYJkvxVJ+2ULxN8LAUdi2y0kSs9hTismW5
         lM/UPm23W555c0ky0oPRG0Oo2wIWY+o1a/M11t2VtK0uhx4P6j8KqQ3Wci3mD1u25GdK
         2YNnlT5peN3U5D368cQzzs9M4GlIvAYWX2UgSMCro42DhNBLwhfeOcDCNxN+lWoTgcDr
         uUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8+98FJCPUkZxLytRMJNRmc7jhTB2VJSy0tbuhiYCP08=;
        fh=35YUgpMiqgLeUPex6Yfs3bzaCOjqi3uC+mHdnrpuowI=;
        b=IFj7lJAhTNWeKVvDaQ+kiPFpkDobXQeZ8/c3w4RW3ypaXHkM73OmB0TgVIpAsbRv73
         DbcHtg8tVbjOqIJQJEsoIv5vfV2+G+5vWbn+gbWvdHALwoO4wY0yX5be4cIlF3roU3Io
         iTf5MKUYgW+9ZkGHzIKLqxQvVYcJe1iWBTyzSeo85u4TE/twtP0o0XMsFT9frObee2iq
         uWa3veavAfkcqTRdHptzGP2Q4D0w9b3SbuAaAUWsoqtwDfvVYtsUgaIUEGDzmBOs/PQQ
         j/HMa1wexY6VF0viZt3WWw9q+uQXOUo0qXFp41Q6ERwEyoSKNm/0fNoXjQLRpFx12h8m
         NwTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gG+DGWIh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb19476sor36230555ad.1.2025.05.03.22.29.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gG+DGWIh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336569; x=1746941369; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+98FJCPUkZxLytRMJNRmc7jhTB2VJSy0tbuhiYCP08=;
        b=gG+DGWIhzrrCyOMU1AIAnz5VGR/HpxqW4RnHGOM0MlsOBjNM9ZY/jQ4uQZCc5GbxLs
         grrlCRiEK0o4kEloJjXgE3nbr/kSX5ijeOl4Lujh+NOygohkMEK63HoaQZOxU5dVmYYD
         Kw53t0gF3gAK5iQFdYNtG464nAPAH6wgv2vLXS4iPD8IE9FkLU+C1GufE5OpSXsT0WKQ
         7SQwaHmhcvitjD11BhMv0TTPmaGyfE+HLAOvglU07GqCOSlz+MKl1XA3fhtWby6OCgVm
         MLxwDvL1AwwyKGBXq7OgNR7q0TREbsRUta199Fbnso4yoweZitKkYcV0ZmTbM57Mj9JI
         +Fng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336569; x=1746941369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+98FJCPUkZxLytRMJNRmc7jhTB2VJSy0tbuhiYCP08=;
        b=AkxGkpcMQf9Us3Fjgs8VpxcDfQNyrHp6ObMsq4dLopq7Y2bnR66Bd+gmi6Oxd/JMSQ
         4KiJ3DsZkXjfaURCXeJYqnbZY2laxZ7VDjR+n8wjP8e8z/APOIGpZs8yOpdHUZK8KAt3
         f9C4y+6xuPpT88QtLab61oV4CCJnUWAEx8tfeIB+RK3Y3OVRnxLBwK4QJF97dqvQNMG5
         8k9FA9yM0DPMul9UhewubV2eP41guagsPrtWLwJwAVpn9QR8X+vHn9t+dIYohrUgEB+/
         tIlXSIhiZSmQWoM4wJasIwEwj/EJ7AEKP89sCFG9Or2DpygEjKB9DOpaL+hoQozdt/C3
         TDlA==
X-Forwarded-Encrypted: i=1; AJvYcCWmoxro6GYqRnE9r8Eo5gUzuAX3TBEuv4Z882nlsHek4PzpoQ18PB6a193T4FtCwRM3/Earo6Li3C2EdA==@linaro.org
X-Gm-Message-State: AOJu0YxALeuUFiv2EKC3l6IFQZ8Ehxn3VI0RmZaeZ04II4bkLBOS+GT/
	Z1cxX/vhBZs/m+pl0abO+789uNMSBZViM103B2r/b467PLYCapLCPkNxiwgVra9Zsg==
X-Gm-Gg: ASbGncuFdkTyXlbQeuJNpLi+VR+MtwB4Webssy8ex7muytAJ2cTKQ/6JKXB0jqk3zvH
	h7f3F5GyeOsPk+Yy75DB8eGxou+48peDNgwUEvk7LmymEYIy4vEp/zMumvDZVPp1fxe2h0gKa7N
	f8PT3isYXSx22/8IDuXjTyaNNXzDt2tsfGKrL2MJ150ygQlimKzHzj8wM15rqiy0BRvT/Yhe0bp
	muVFrC/cpWJ4emd8VoyomDZfvhI3LLG6Fh7WYuVxdnfNCRxs/Tk24Lth8IQgkeKtQaHWfOZVUpq
	xL+ycs0WjfdiBOwiYQzxnZICVd22bYzOvIE2B+FV
X-Google-Smtp-Source: AGHT+IFljFPpmm9aEq/53ursjQGrDhfCp3IjU9vvxW7IWwdA3NjR6LQgS9h1HaQFPxGtz1FrTWBD5g==
X-Received: by 2002:a17:902:ce05:b0:224:1005:7280 with SMTP id d9443c01a7336-22e1ea67d6amr53346185ad.38.1746336569135;
        Sat, 03 May 2025 22:29:29 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:28 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 10/40] target/arm/cpu: remove TARGET_AARCH64 around aarch64_cpu_dump_state common
Date: Sat,  3 May 2025 22:28:44 -0700
Message-ID: <20250504052914.3525365-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +bAc0UE0s95q

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
