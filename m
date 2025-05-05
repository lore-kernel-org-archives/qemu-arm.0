Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178696njj;
        Sun, 4 May 2025 18:52:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2Ypc9DofQ8awnn1ZaA5meq3wFNur1LsMwuGoyRzPcHochSEt0wQ9wBT3dIHO7zabIA8EA15OrXm2How==@linaro.org
X-Received: by 2002:a05:6a00:438f:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-7406f08cfefmr7983713b3a.4.1746409949351;
        Sun, 04 May 2025 18:52:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409949; cv=none;
        d=google.com; s=arc-20240605;
        b=gTVgWkyiEamLO+3OINBh2kWZ1lg+/PUG6aOFfdsppanYU3I6V8ei/RaLh8Fp1UqjzQ
         Ec7I8HXWq5QJNnBmHd9WpFznAV4aXS0AwPMWmq/TkFKnUdwLQXogR0ILnTm6/OSdt/Z9
         1Oi8qUnQ3VGBAa5k/FyPT/wWEYY+qnfJBf5vv98HF0JdXfui+RvqnBJZP7JPzxPie5Te
         kfxmalJDwxYMYoqa7MRSDOLweG8efQcgc4lSvrb0NxwYVplfqiysDvDMEpgM/bjfmUVW
         Pjno4VxQ/eJGD9YKAlOAAoTsXX8eZyVVglLFNspWH7Rm0jbxM/eBiIQ8OVa3rztKEdjk
         eqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PFP3MpqDIAT/Xkpc6JOppR3V5lexoIXt45Qw9vGPUlk=;
        fh=z7b8GamzJeqrFw82EBdjigKHoO3xDxlGGS/9zjSf2r8=;
        b=Fm+wK2SyzoU1X6/HVE/3uqRC1zVM+xNleG998sEhJx3Bqpb7rdlsoscuoN+tM38LI9
         4CuIjfPc/vJrO/spUk9yhs65YCECsejoxWeWH7W23ijCQbT/513G3pl73JFsuflR81AG
         VwPeT4dVLoopWEWH5dj+aVMCq80wB3NW5hw2lLqewrp06Q1rhZMwr8EygFk1MaxQ04/y
         IqO9vI3dqTbkxabXYuZQDbO2ETDGhr5uUo3SrexyDXKaXjV1kkjaGHsABBBr+rcoc9eo
         1r6zq5MxVMe+mMpOpl7RwnbNlSEo1/5RBwqBkODMc5jaU+CNKP2tlxy7Mepnn97vVvmw
         Ia1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mgZQWfFe;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef0d981sor4009379b3a.3.2025.05.04.18.52.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mgZQWfFe;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409949; x=1747014749; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFP3MpqDIAT/Xkpc6JOppR3V5lexoIXt45Qw9vGPUlk=;
        b=mgZQWfFejtyAivD6hgHe/oOFVSEZ01uue8+KkuTWZdCMAK79DEqhY9VL/bbaunw327
         KoFqgQVSZSBdYyRmf+GXOytwNzaFDZMwnn/S1u5q7h8lG5pUS6h1hObf+2WjdE7JQmq0
         PYA7W2cs+HDxyrnzJovFZ0AuO2YCgLyvMGaGtiRXIq6ScKeQU0yjWorx7Iw7nPX6wX5S
         aMXqXgFO0J8E6RIxsWxSdhnNkZC4aZe11wx1iqR4EJL2TQ+KJ1Qw8HN7ZVrZany0iUCu
         5X9qmU2TNfUg9z7fc0z2Ckab/rWMGsNi7r6sYr+eSaPJ8+SM9CyKCb14EWjJnlZFPLPS
         QhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409949; x=1747014749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFP3MpqDIAT/Xkpc6JOppR3V5lexoIXt45Qw9vGPUlk=;
        b=becIJ0+Snu83bhitHtq71YNMIcZBn2ieRkoXkX8HN+eopDHNr6He6LTVv7RKUHsxZ0
         AhFQwuMrH1aQ0sIeQKbB0xyDVYuNRYbtucBkSOyassUd97KJu0vRbNQXJ2klbARI1sDV
         W+/nq5GwGz+UvZLEQDWKs2cSw5ys+gO6qBnX5n7r1yZ3d073QZm1tck4t7ZNR8HEonla
         b9mMzrw2ML29UGbC6CQd+Ss+pxU22m0yALj7IYGXFBElv0+FQ73e3p1xzyoL0OhIHjeW
         rEEphIYqUjECwfo4AACaUFV+EU2MjpqMIsa5SUp7mZyZJA1UcYc6eWseZCwO/wsCV1Mk
         HwAg==
X-Forwarded-Encrypted: i=1; AJvYcCUthTyiDA2mNUZ6hGXNwLoJfkigFk1VzgZrGmq/H5WROYF4+U+O38yT7Pug/l01U9v77Kep4o274HaMAw==@linaro.org
X-Gm-Message-State: AOJu0Yx9aAfndo3utyd+AoLJU96mbKSbXKh+zSy9/pqUYmJLYHvgxB0w
	2G/2MCbQ2HH9UYwlE/rRRG2cE7n4tqJlY2OCF6mbPOXJ0ojrJL2SnkURl6qARYTR0w==
X-Gm-Gg: ASbGnctJrRjUglGe8g7xe3baputloNcj8B90yf2Dk8OXMDTQAgk/IMBwPrdi1xJ9+Hr
	pIfGatUuJNTGZ41s26m/zeTUGuxk+ZP2enLg2JOBLeFeNptSB8+ptcogRYXG0ppJu4/0StzYwcP
	nnCc2C8rVdRFaGAz1+cJ+pDscJJunL0zjp6iUTnTNINwKUAUvEqSFEzG5xZBCyUIeiKkwyh2Xnz
	Ldd61mmpPt4QiZsNfsk7+zdo1UbbS9WzKJg3RJgrfQiex+lgXkzjDluJxYc6jvdz10CZc6AXej4
	jsa3oNi8U7yxH5M+3tCqhKhb5IfFKuMHxhfLsgtD
X-Google-Smtp-Source: AGHT+IFC1SHa+o2dht0iDyRVFrIxZhJ91FqkHDCIfZcHBadorNJvzlHZJmoxbvRhIrg0G0wVvQGeMg==
X-Received: by 2002:a05:6a21:399:b0:1f5:8e94:2e83 with SMTP id adf61e73a8af0-20e96206067mr8026628637.8.1746409948979;
        Sun, 04 May 2025 18:52:28 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:28 -0700 (PDT)
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
Subject: [PATCH v5 02/48] include/system/hvf: missing vaddr include
Date: Sun,  4 May 2025 18:51:37 -0700
Message-ID: <20250505015223.3895275-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Domqju/85ixM

On MacOS x86_64:
In file included from ../target/i386/hvf/x86_task.c:13:
/Users/runner/work/qemu/qemu/include/system/hvf.h:42:5: error: unknown type name 'vaddr'
    vaddr pc;
    ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:43:5: error: unknown type name 'vaddr'
    vaddr saved_insn;
    ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:45:5: error: type name requires a specifier or qualifier
    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
    ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:45:18: error: a parameter list without types is only allowed in a function definition
    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
                 ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:45:36: error: expected ';' at end of declaration list
    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/system/hvf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/system/hvf.h b/include/system/hvf.h
index 730f927f034..356fced63e3 100644
--- a/include/system/hvf.h
+++ b/include/system/hvf.h
@@ -15,6 +15,7 @@
 
 #include "qemu/accel.h"
 #include "qom/object.h"
+#include "exec/vaddr.h"
 
 #ifdef COMPILING_PER_TARGET
 #include "cpu.h"
-- 
2.47.2
